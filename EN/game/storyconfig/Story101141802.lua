return {
	Play114182001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114182001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play114182002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F06"

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
				local var_4_5 = arg_1_1.bgs_.F06

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
					if iter_4_0 ~= "F06" then
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

			local var_4_22 = manager.ui.mainCamera.transform
			local var_4_23 = 1

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_22.localPosition
			end

			local var_4_24 = 1.5

			if var_4_23 <= arg_1_1.time_ and arg_1_1.time_ < var_4_23 + var_4_24 then
				local var_4_25 = (arg_1_1.time_ - var_4_23) / 0.066
				local var_4_26, var_4_27 = math.modf(var_4_25)

				var_4_22.localPosition = Vector3.New(var_4_27 * 0.13, var_4_27 * 0.13, var_4_27 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_23 + var_4_24 and arg_1_1.time_ < var_4_23 + var_4_24 + arg_4_0 then
				var_4_22.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_28 = 2

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_29 = 0.5

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_30 = 0
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_34 = 2
			local var_4_35 = 1.76666666666667

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_36 = "play"
				local var_4_37 = "music"

				arg_1_1:AudioAction(var_4_36, var_4_37, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_38 = 2
			local var_4_39 = 1.35

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_40 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_40:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_41 = arg_1_1:GetWordFromCfg(114182001)
				local var_4_42 = arg_1_1:FormatText(var_4_41.content)

				arg_1_1.text_.text = var_4_42

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_43 = 54
				local var_4_44 = utf8.len(var_4_42)
				local var_4_45 = var_4_43 <= 0 and var_4_39 or var_4_39 * (var_4_44 / var_4_43)

				if var_4_45 > 0 and var_4_39 < var_4_45 then
					arg_1_1.talkMaxDuration = var_4_45
					var_4_38 = var_4_38 + 0.3

					if var_4_45 + var_4_38 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_45 + var_4_38
					end
				end

				arg_1_1.text_.text = var_4_42
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_46 = var_4_38 + 0.3
			local var_4_47 = math.max(var_4_39, arg_1_1.talkMaxDuration)

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_46) / var_4_47

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play114182002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114182002
		arg_7_1.duration_ = 7.8

		local var_7_0 = {
			ja = 5.633,
			ko = 6.566,
			zh = 5.733,
			en = 7.8
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
				arg_7_0:Play114182003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1184ui_story"

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

			local var_10_4 = arg_7_1.actors_["1184ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1184ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -0.97, -6)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1184ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 then
				arg_7_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_10_15 = arg_7_1.actors_["1184ui_story"]
			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 and arg_7_1.var_.characterEffect1184ui_story == nil then
				arg_7_1.var_.characterEffect1184ui_story = var_10_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_17 = 0.2

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_17 then
				local var_10_18 = (arg_7_1.time_ - var_10_16) / var_10_17

				if arg_7_1.var_.characterEffect1184ui_story then
					arg_7_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_16 + var_10_17 and arg_7_1.time_ < var_10_16 + var_10_17 + arg_10_0 and arg_7_1.var_.characterEffect1184ui_story then
				arg_7_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_10_19 = 0
			local var_10_20 = 0.575

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(114182002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182002", "story_v_out_114182.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_114182", "114182002", "story_v_out_114182.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_114182", "114182002", "story_v_out_114182.awb")

						arg_7_1:RecordAudio("114182002", var_10_28)
						arg_7_1:RecordAudio("114182002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_114182", "114182002", "story_v_out_114182.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_114182", "114182002", "story_v_out_114182.awb")
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
	Play114182003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114182003
		arg_11_1.duration_ = 5.1

		local var_11_0 = {
			ja = 5.1,
			ko = 3.5,
			zh = 2.033,
			en = 2.633
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
				arg_11_0:Play114182004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1184ui_story"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1184ui_story = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(0, 100, 0)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1184ui_story, var_14_4, var_14_3)

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

			local var_14_9 = 0
			local var_14_10 = 0.2

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_11 = arg_11_1:FormatText(StoryNameCfg[208].name)

				arg_11_1.leftNameTxt_.text = var_14_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_12 = arg_11_1:GetWordFromCfg(114182003)
				local var_14_13 = arg_11_1:FormatText(var_14_12.content)

				arg_11_1.text_.text = var_14_13

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_14 = 8
				local var_14_15 = utf8.len(var_14_13)
				local var_14_16 = var_14_14 <= 0 and var_14_10 or var_14_10 * (var_14_15 / var_14_14)

				if var_14_16 > 0 and var_14_10 < var_14_16 then
					arg_11_1.talkMaxDuration = var_14_16

					if var_14_16 + var_14_9 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_16 + var_14_9
					end
				end

				arg_11_1.text_.text = var_14_13
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182003", "story_v_out_114182.awb") ~= 0 then
					local var_14_17 = manager.audio:GetVoiceLength("story_v_out_114182", "114182003", "story_v_out_114182.awb") / 1000

					if var_14_17 + var_14_9 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_17 + var_14_9
					end

					if var_14_12.prefab_name ~= "" and arg_11_1.actors_[var_14_12.prefab_name] ~= nil then
						local var_14_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_12.prefab_name].transform, "story_v_out_114182", "114182003", "story_v_out_114182.awb")

						arg_11_1:RecordAudio("114182003", var_14_18)
						arg_11_1:RecordAudio("114182003", var_14_18)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_114182", "114182003", "story_v_out_114182.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_114182", "114182003", "story_v_out_114182.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_19 = math.max(var_14_10, arg_11_1.talkMaxDuration)

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_19 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_9) / var_14_19

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_9 + var_14_19 and arg_11_1.time_ < var_14_9 + var_14_19 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play114182004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114182004
		arg_15_1.duration_ = 2.666

		local var_15_0 = {
			ja = 2.066,
			ko = 2.666,
			zh = 2.3,
			en = 2.5
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
				arg_15_0:Play114182005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1184ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1184ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, -0.97, -6)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1184ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 then
				arg_15_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4134")
			end

			local var_18_11 = arg_15_1.actors_["1184ui_story"]
			local var_18_12 = 0

			if var_18_12 < arg_15_1.time_ and arg_15_1.time_ <= var_18_12 + arg_18_0 and arg_15_1.var_.characterEffect1184ui_story == nil then
				arg_15_1.var_.characterEffect1184ui_story = var_18_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_13 = 0.2

			if var_18_12 <= arg_15_1.time_ and arg_15_1.time_ < var_18_12 + var_18_13 then
				local var_18_14 = (arg_15_1.time_ - var_18_12) / var_18_13

				if arg_15_1.var_.characterEffect1184ui_story then
					arg_15_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_12 + var_18_13 and arg_15_1.time_ < var_18_12 + var_18_13 + arg_18_0 and arg_15_1.var_.characterEffect1184ui_story then
				arg_15_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_18_15 = 0
			local var_18_16 = 0.2

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_17 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_18 = arg_15_1:GetWordFromCfg(114182004)
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182004", "story_v_out_114182.awb") ~= 0 then
					local var_18_23 = manager.audio:GetVoiceLength("story_v_out_114182", "114182004", "story_v_out_114182.awb") / 1000

					if var_18_23 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_23 + var_18_15
					end

					if var_18_18.prefab_name ~= "" and arg_15_1.actors_[var_18_18.prefab_name] ~= nil then
						local var_18_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_18.prefab_name].transform, "story_v_out_114182", "114182004", "story_v_out_114182.awb")

						arg_15_1:RecordAudio("114182004", var_18_24)
						arg_15_1:RecordAudio("114182004", var_18_24)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_114182", "114182004", "story_v_out_114182.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_114182", "114182004", "story_v_out_114182.awb")
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
	Play114182005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114182005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play114182006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1184ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1184ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, 100, 0)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1184ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, 100, 0)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = 0
			local var_22_10 = 1.15

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_11 = arg_19_1:GetWordFromCfg(114182005)
				local var_22_12 = arg_19_1:FormatText(var_22_11.content)

				arg_19_1.text_.text = var_22_12

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_13 = 46
				local var_22_14 = utf8.len(var_22_12)
				local var_22_15 = var_22_13 <= 0 and var_22_10 or var_22_10 * (var_22_14 / var_22_13)

				if var_22_15 > 0 and var_22_10 < var_22_15 then
					arg_19_1.talkMaxDuration = var_22_15

					if var_22_15 + var_22_9 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_15 + var_22_9
					end
				end

				arg_19_1.text_.text = var_22_12
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_10, arg_19_1.talkMaxDuration)

			if var_22_9 <= arg_19_1.time_ and arg_19_1.time_ < var_22_9 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_9) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_9 + var_22_16 and arg_19_1.time_ < var_22_9 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play114182006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114182006
		arg_23_1.duration_ = 6.933

		local var_23_0 = {
			ja = 6.033,
			ko = 6.933,
			zh = 4,
			en = 5.466
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
				arg_23_0:Play114182007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "1038ui_story"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("Char/" .. var_26_0), arg_23_1.stage_.transform)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_0] = var_26_1

				local var_26_2 = var_26_1:GetComponentInChildren(typeof(CharacterEffect))

				var_26_2.enabled = true

				local var_26_3 = GameObjectTools.GetOrAddComponent(var_26_1, typeof(DynamicBoneHelper))

				if var_26_3 then
					var_26_3:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_2.transform, false)

				arg_23_1.var_[var_26_0 .. "Animator"] = var_26_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_0 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_0 .. "LipSync"] = var_26_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_4 = arg_23_1.actors_["1038ui_story"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos1038ui_story = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(-0.7, -1.11, -5.9)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1038ui_story, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_26_15 = arg_23_1.actors_["1038ui_story"]
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 and arg_23_1.var_.characterEffect1038ui_story == nil then
				arg_23_1.var_.characterEffect1038ui_story = var_26_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_17 = 0.2

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17

				if arg_23_1.var_.characterEffect1038ui_story then
					arg_23_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 and arg_23_1.var_.characterEffect1038ui_story then
				arg_23_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_26_19 = 0
			local var_26_20 = 0.5

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_21 = arg_23_1:FormatText(StoryNameCfg[94].name)

				arg_23_1.leftNameTxt_.text = var_26_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_22 = arg_23_1:GetWordFromCfg(114182006)
				local var_26_23 = arg_23_1:FormatText(var_26_22.content)

				arg_23_1.text_.text = var_26_23

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_24 = 20
				local var_26_25 = utf8.len(var_26_23)
				local var_26_26 = var_26_24 <= 0 and var_26_20 or var_26_20 * (var_26_25 / var_26_24)

				if var_26_26 > 0 and var_26_20 < var_26_26 then
					arg_23_1.talkMaxDuration = var_26_26

					if var_26_26 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_26 + var_26_19
					end
				end

				arg_23_1.text_.text = var_26_23
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182006", "story_v_out_114182.awb") ~= 0 then
					local var_26_27 = manager.audio:GetVoiceLength("story_v_out_114182", "114182006", "story_v_out_114182.awb") / 1000

					if var_26_27 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_19
					end

					if var_26_22.prefab_name ~= "" and arg_23_1.actors_[var_26_22.prefab_name] ~= nil then
						local var_26_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_22.prefab_name].transform, "story_v_out_114182", "114182006", "story_v_out_114182.awb")

						arg_23_1:RecordAudio("114182006", var_26_28)
						arg_23_1:RecordAudio("114182006", var_26_28)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_114182", "114182006", "story_v_out_114182.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_114182", "114182006", "story_v_out_114182.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_29 = math.max(var_26_20, arg_23_1.talkMaxDuration)

			if var_26_19 <= arg_23_1.time_ and arg_23_1.time_ < var_26_19 + var_26_29 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_19) / var_26_29

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_19 + var_26_29 and arg_23_1.time_ < var_26_19 + var_26_29 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play114182007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114182007
		arg_27_1.duration_ = 4.266

		local var_27_0 = {
			ja = 4.266,
			ko = 3,
			zh = 3.5,
			en = 2.333
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
				arg_27_0:Play114182008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1038ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1038ui_story == nil then
				arg_27_1.var_.characterEffect1038ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1038ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1038ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1038ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1038ui_story.fillRatio = var_30_5
			end

			local var_30_6 = "1041ui_story"

			if arg_27_1.actors_[var_30_6] == nil then
				local var_30_7 = Object.Instantiate(Asset.Load("Char/" .. var_30_6), arg_27_1.stage_.transform)

				var_30_7.name = var_30_6
				var_30_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.actors_[var_30_6] = var_30_7

				local var_30_8 = var_30_7:GetComponentInChildren(typeof(CharacterEffect))

				var_30_8.enabled = true

				local var_30_9 = GameObjectTools.GetOrAddComponent(var_30_7, typeof(DynamicBoneHelper))

				if var_30_9 then
					var_30_9:EnableDynamicBone(false)
				end

				arg_27_1:ShowWeapon(var_30_8.transform, false)

				arg_27_1.var_[var_30_6 .. "Animator"] = var_30_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_27_1.var_[var_30_6 .. "Animator"].applyRootMotion = true
				arg_27_1.var_[var_30_6 .. "LipSync"] = var_30_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_30_10 = arg_27_1.actors_["1041ui_story"].transform
			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.var_.moveOldPos1041ui_story = var_30_10.localPosition
			end

			local var_30_12 = 0.001

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_12 then
				local var_30_13 = (arg_27_1.time_ - var_30_11) / var_30_12
				local var_30_14 = Vector3.New(0.7, -1.11, -5.9)

				var_30_10.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1041ui_story, var_30_14, var_30_13)

				local var_30_15 = manager.ui.mainCamera.transform.position - var_30_10.position

				var_30_10.forward = Vector3.New(var_30_15.x, var_30_15.y, var_30_15.z)

				local var_30_16 = var_30_10.localEulerAngles

				var_30_16.z = 0
				var_30_16.x = 0
				var_30_10.localEulerAngles = var_30_16
			end

			if arg_27_1.time_ >= var_30_11 + var_30_12 and arg_27_1.time_ < var_30_11 + var_30_12 + arg_30_0 then
				var_30_10.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_30_17 = manager.ui.mainCamera.transform.position - var_30_10.position

				var_30_10.forward = Vector3.New(var_30_17.x, var_30_17.y, var_30_17.z)

				local var_30_18 = var_30_10.localEulerAngles

				var_30_18.z = 0
				var_30_18.x = 0
				var_30_10.localEulerAngles = var_30_18
			end

			local var_30_19 = 0

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action9_2")
			end

			local var_30_20 = arg_27_1.actors_["1041ui_story"]
			local var_30_21 = 0

			if var_30_21 < arg_27_1.time_ and arg_27_1.time_ <= var_30_21 + arg_30_0 and arg_27_1.var_.characterEffect1041ui_story == nil then
				arg_27_1.var_.characterEffect1041ui_story = var_30_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_22 = 0.2

			if var_30_21 <= arg_27_1.time_ and arg_27_1.time_ < var_30_21 + var_30_22 then
				local var_30_23 = (arg_27_1.time_ - var_30_21) / var_30_22

				if arg_27_1.var_.characterEffect1041ui_story then
					arg_27_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_21 + var_30_22 and arg_27_1.time_ < var_30_21 + var_30_22 + arg_30_0 and arg_27_1.var_.characterEffect1041ui_story then
				arg_27_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_30_24 = 0

			if var_30_24 < arg_27_1.time_ and arg_27_1.time_ <= var_30_24 + arg_30_0 then
				arg_27_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_30_25 = 0
			local var_30_26 = 0.2

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_27 = arg_27_1:FormatText(StoryNameCfg[208].name)

				arg_27_1.leftNameTxt_.text = var_30_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_28 = arg_27_1:GetWordFromCfg(114182007)
				local var_30_29 = arg_27_1:FormatText(var_30_28.content)

				arg_27_1.text_.text = var_30_29

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_30 = 8
				local var_30_31 = utf8.len(var_30_29)
				local var_30_32 = var_30_30 <= 0 and var_30_26 or var_30_26 * (var_30_31 / var_30_30)

				if var_30_32 > 0 and var_30_26 < var_30_32 then
					arg_27_1.talkMaxDuration = var_30_32

					if var_30_32 + var_30_25 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_32 + var_30_25
					end
				end

				arg_27_1.text_.text = var_30_29
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182007", "story_v_out_114182.awb") ~= 0 then
					local var_30_33 = manager.audio:GetVoiceLength("story_v_out_114182", "114182007", "story_v_out_114182.awb") / 1000

					if var_30_33 + var_30_25 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_33 + var_30_25
					end

					if var_30_28.prefab_name ~= "" and arg_27_1.actors_[var_30_28.prefab_name] ~= nil then
						local var_30_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_28.prefab_name].transform, "story_v_out_114182", "114182007", "story_v_out_114182.awb")

						arg_27_1:RecordAudio("114182007", var_30_34)
						arg_27_1:RecordAudio("114182007", var_30_34)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_114182", "114182007", "story_v_out_114182.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_114182", "114182007", "story_v_out_114182.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_35 = math.max(var_30_26, arg_27_1.talkMaxDuration)

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_35 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_25) / var_30_35

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_25 + var_30_35 and arg_27_1.time_ < var_30_25 + var_30_35 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play114182008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114182008
		arg_31_1.duration_ = 4.1

		local var_31_0 = {
			ja = 3.4,
			ko = 2.266,
			zh = 3.6,
			en = 4.1
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
				arg_31_0:Play114182009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1038ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1038ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, 100, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1038ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, 100, 0)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1041ui_story"].transform
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.var_.moveOldPos1041ui_story = var_34_9.localPosition
			end

			local var_34_11 = 0.001

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11
				local var_34_13 = Vector3.New(0, 100, 0)

				var_34_9.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1041ui_story, var_34_13, var_34_12)

				local var_34_14 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_14.x, var_34_14.y, var_34_14.z)

				local var_34_15 = var_34_9.localEulerAngles

				var_34_15.z = 0
				var_34_15.x = 0
				var_34_9.localEulerAngles = var_34_15
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 then
				var_34_9.localPosition = Vector3.New(0, 100, 0)

				local var_34_16 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_16.x, var_34_16.y, var_34_16.z)

				local var_34_17 = var_34_9.localEulerAngles

				var_34_17.z = 0
				var_34_17.x = 0
				var_34_9.localEulerAngles = var_34_17
			end

			local var_34_18 = 0
			local var_34_19 = 0.2

			if var_34_18 < arg_31_1.time_ and arg_31_1.time_ <= var_34_18 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_20 = arg_31_1:FormatText(StoryNameCfg[216].name)

				arg_31_1.leftNameTxt_.text = var_34_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_21 = arg_31_1:GetWordFromCfg(114182008)
				local var_34_22 = arg_31_1:FormatText(var_34_21.content)

				arg_31_1.text_.text = var_34_22

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_23 = 8
				local var_34_24 = utf8.len(var_34_22)
				local var_34_25 = var_34_23 <= 0 and var_34_19 or var_34_19 * (var_34_24 / var_34_23)

				if var_34_25 > 0 and var_34_19 < var_34_25 then
					arg_31_1.talkMaxDuration = var_34_25

					if var_34_25 + var_34_18 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_25 + var_34_18
					end
				end

				arg_31_1.text_.text = var_34_22
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182008", "story_v_out_114182.awb") ~= 0 then
					local var_34_26 = manager.audio:GetVoiceLength("story_v_out_114182", "114182008", "story_v_out_114182.awb") / 1000

					if var_34_26 + var_34_18 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_26 + var_34_18
					end

					if var_34_21.prefab_name ~= "" and arg_31_1.actors_[var_34_21.prefab_name] ~= nil then
						local var_34_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_21.prefab_name].transform, "story_v_out_114182", "114182008", "story_v_out_114182.awb")

						arg_31_1:RecordAudio("114182008", var_34_27)
						arg_31_1:RecordAudio("114182008", var_34_27)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_114182", "114182008", "story_v_out_114182.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_114182", "114182008", "story_v_out_114182.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_28 = math.max(var_34_19, arg_31_1.talkMaxDuration)

			if var_34_18 <= arg_31_1.time_ and arg_31_1.time_ < var_34_18 + var_34_28 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_18) / var_34_28

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_18 + var_34_28 and arg_31_1.time_ < var_34_18 + var_34_28 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play114182009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114182009
		arg_35_1.duration_ = 6.5

		local var_35_0 = {
			ja = 3.533,
			ko = 5.8,
			zh = 6.5,
			en = 5.933
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
				arg_35_0:Play114182010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.45

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[216].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(114182009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182009", "story_v_out_114182.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_114182", "114182009", "story_v_out_114182.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_114182", "114182009", "story_v_out_114182.awb")

						arg_35_1:RecordAudio("114182009", var_38_9)
						arg_35_1:RecordAudio("114182009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114182", "114182009", "story_v_out_114182.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114182", "114182009", "story_v_out_114182.awb")
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
	Play114182010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114182010
		arg_39_1.duration_ = 9.966

		local var_39_0 = {
			ja = 9.966,
			ko = 5.3,
			zh = 8.533,
			en = 9.7
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
				arg_39_0:Play114182011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.625

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[212].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10006")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(114182010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182010", "story_v_out_114182.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_114182", "114182010", "story_v_out_114182.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_114182", "114182010", "story_v_out_114182.awb")

						arg_39_1:RecordAudio("114182010", var_42_9)
						arg_39_1:RecordAudio("114182010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_114182", "114182010", "story_v_out_114182.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_114182", "114182010", "story_v_out_114182.awb")
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
	Play114182011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114182011
		arg_43_1.duration_ = 7.666

		local var_43_0 = {
			ja = 4.366,
			ko = 6.833,
			zh = 7.533,
			en = 7.666
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
				arg_43_0:Play114182012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.5

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[216].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(114182011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182011", "story_v_out_114182.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_114182", "114182011", "story_v_out_114182.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_114182", "114182011", "story_v_out_114182.awb")

						arg_43_1:RecordAudio("114182011", var_46_9)
						arg_43_1:RecordAudio("114182011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_114182", "114182011", "story_v_out_114182.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_114182", "114182011", "story_v_out_114182.awb")
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
	Play114182012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 114182012
		arg_47_1.duration_ = 9.366

		local var_47_0 = {
			ja = 5.566,
			ko = 6.5,
			zh = 9.366,
			en = 9.266
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
				arg_47_0:Play114182013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.45

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[212].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10006")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(114182012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 18
				local var_50_6 = utf8.len(var_50_4)
				local var_50_7 = var_50_5 <= 0 and var_50_1 or var_50_1 * (var_50_6 / var_50_5)

				if var_50_7 > 0 and var_50_1 < var_50_7 then
					arg_47_1.talkMaxDuration = var_50_7

					if var_50_7 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_7 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_4
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182012", "story_v_out_114182.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_114182", "114182012", "story_v_out_114182.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_114182", "114182012", "story_v_out_114182.awb")

						arg_47_1:RecordAudio("114182012", var_50_9)
						arg_47_1:RecordAudio("114182012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_114182", "114182012", "story_v_out_114182.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_114182", "114182012", "story_v_out_114182.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_10 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_10 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_10

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_10 and arg_47_1.time_ < var_50_0 + var_50_10 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play114182013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 114182013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play114182014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.825

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

				local var_54_2 = arg_51_1:GetWordFromCfg(114182013)
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
	Play114182014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 114182014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play114182015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.9

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

				local var_58_2 = arg_55_1:GetWordFromCfg(114182014)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 76
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
	Play114182015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 114182015
		arg_59_1.duration_ = 3.166

		local var_59_0 = {
			ja = 3.166,
			ko = 1.999999999999,
			zh = 2.7,
			en = 2.133
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
				arg_59_0:Play114182016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1041ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1041ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(-0.7, -1.11, -5.9)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1041ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = 0

			if var_62_9 < arg_59_1.time_ and arg_59_1.time_ <= var_62_9 + arg_62_0 then
				arg_59_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_62_10 = arg_59_1.actors_["1041ui_story"]
			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect1041ui_story == nil then
				arg_59_1.var_.characterEffect1041ui_story = var_62_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_12 = 0.2

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_12 then
				local var_62_13 = (arg_59_1.time_ - var_62_11) / var_62_12

				if arg_59_1.var_.characterEffect1041ui_story then
					arg_59_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_11 + var_62_12 and arg_59_1.time_ < var_62_11 + var_62_12 + arg_62_0 and arg_59_1.var_.characterEffect1041ui_story then
				arg_59_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_62_15 = 0
			local var_62_16 = 0.1

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_17 = arg_59_1:FormatText(StoryNameCfg[208].name)

				arg_59_1.leftNameTxt_.text = var_62_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_18 = arg_59_1:GetWordFromCfg(114182015)
				local var_62_19 = arg_59_1:FormatText(var_62_18.content)

				arg_59_1.text_.text = var_62_19

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_20 = 4
				local var_62_21 = utf8.len(var_62_19)
				local var_62_22 = var_62_20 <= 0 and var_62_16 or var_62_16 * (var_62_21 / var_62_20)

				if var_62_22 > 0 and var_62_16 < var_62_22 then
					arg_59_1.talkMaxDuration = var_62_22

					if var_62_22 + var_62_15 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_22 + var_62_15
					end
				end

				arg_59_1.text_.text = var_62_19
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182015", "story_v_out_114182.awb") ~= 0 then
					local var_62_23 = manager.audio:GetVoiceLength("story_v_out_114182", "114182015", "story_v_out_114182.awb") / 1000

					if var_62_23 + var_62_15 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_23 + var_62_15
					end

					if var_62_18.prefab_name ~= "" and arg_59_1.actors_[var_62_18.prefab_name] ~= nil then
						local var_62_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_18.prefab_name].transform, "story_v_out_114182", "114182015", "story_v_out_114182.awb")

						arg_59_1:RecordAudio("114182015", var_62_24)
						arg_59_1:RecordAudio("114182015", var_62_24)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_114182", "114182015", "story_v_out_114182.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_114182", "114182015", "story_v_out_114182.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_25 = math.max(var_62_16, arg_59_1.talkMaxDuration)

			if var_62_15 <= arg_59_1.time_ and arg_59_1.time_ < var_62_15 + var_62_25 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_15) / var_62_25

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_15 + var_62_25 and arg_59_1.time_ < var_62_15 + var_62_25 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play114182016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 114182016
		arg_63_1.duration_ = 11.6

		local var_63_0 = {
			ja = 8.6,
			ko = 9.066,
			zh = 9.066,
			en = 11.6
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
				arg_63_0:Play114182017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1041ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1041ui_story == nil then
				arg_63_1.var_.characterEffect1041ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1041ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1041ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1041ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1041ui_story.fillRatio = var_66_5
			end

			local var_66_6 = "10006ui_story"

			if arg_63_1.actors_[var_66_6] == nil then
				local var_66_7 = Object.Instantiate(Asset.Load("Char/" .. var_66_6), arg_63_1.stage_.transform)

				var_66_7.name = var_66_6
				var_66_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.actors_[var_66_6] = var_66_7

				local var_66_8 = var_66_7:GetComponentInChildren(typeof(CharacterEffect))

				var_66_8.enabled = true

				local var_66_9 = GameObjectTools.GetOrAddComponent(var_66_7, typeof(DynamicBoneHelper))

				if var_66_9 then
					var_66_9:EnableDynamicBone(false)
				end

				arg_63_1:ShowWeapon(var_66_8.transform, false)

				arg_63_1.var_[var_66_6 .. "Animator"] = var_66_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_63_1.var_[var_66_6 .. "Animator"].applyRootMotion = true
				arg_63_1.var_[var_66_6 .. "LipSync"] = var_66_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_66_10 = arg_63_1.actors_["10006ui_story"].transform
			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.var_.moveOldPos10006ui_story = var_66_10.localPosition
			end

			local var_66_12 = 0.001

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_12 then
				local var_66_13 = (arg_63_1.time_ - var_66_11) / var_66_12
				local var_66_14 = Vector3.New(0.7, -0.98, -5.65)

				var_66_10.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10006ui_story, var_66_14, var_66_13)

				local var_66_15 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_15.x, var_66_15.y, var_66_15.z)

				local var_66_16 = var_66_10.localEulerAngles

				var_66_16.z = 0
				var_66_16.x = 0
				var_66_10.localEulerAngles = var_66_16
			end

			if arg_63_1.time_ >= var_66_11 + var_66_12 and arg_63_1.time_ < var_66_11 + var_66_12 + arg_66_0 then
				var_66_10.localPosition = Vector3.New(0.7, -0.98, -5.65)

				local var_66_17 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_17.x, var_66_17.y, var_66_17.z)

				local var_66_18 = var_66_10.localEulerAngles

				var_66_18.z = 0
				var_66_18.x = 0
				var_66_10.localEulerAngles = var_66_18
			end

			local var_66_19 = 0

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action6_1")
			end

			local var_66_20 = 0

			if var_66_20 < arg_63_1.time_ and arg_63_1.time_ <= var_66_20 + arg_66_0 then
				arg_63_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_66_21 = arg_63_1.actors_["10006ui_story"]
			local var_66_22 = 0

			if var_66_22 < arg_63_1.time_ and arg_63_1.time_ <= var_66_22 + arg_66_0 and arg_63_1.var_.characterEffect10006ui_story == nil then
				arg_63_1.var_.characterEffect10006ui_story = var_66_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_23 = 0.2

			if var_66_22 <= arg_63_1.time_ and arg_63_1.time_ < var_66_22 + var_66_23 then
				local var_66_24 = (arg_63_1.time_ - var_66_22) / var_66_23

				if arg_63_1.var_.characterEffect10006ui_story then
					arg_63_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_22 + var_66_23 and arg_63_1.time_ < var_66_22 + var_66_23 + arg_66_0 and arg_63_1.var_.characterEffect10006ui_story then
				arg_63_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_66_25 = 0
			local var_66_26 = 0.75

			if var_66_25 < arg_63_1.time_ and arg_63_1.time_ <= var_66_25 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_27 = arg_63_1:FormatText(StoryNameCfg[212].name)

				arg_63_1.leftNameTxt_.text = var_66_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_28 = arg_63_1:GetWordFromCfg(114182016)
				local var_66_29 = arg_63_1:FormatText(var_66_28.content)

				arg_63_1.text_.text = var_66_29

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_30 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182016", "story_v_out_114182.awb") ~= 0 then
					local var_66_33 = manager.audio:GetVoiceLength("story_v_out_114182", "114182016", "story_v_out_114182.awb") / 1000

					if var_66_33 + var_66_25 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_33 + var_66_25
					end

					if var_66_28.prefab_name ~= "" and arg_63_1.actors_[var_66_28.prefab_name] ~= nil then
						local var_66_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_28.prefab_name].transform, "story_v_out_114182", "114182016", "story_v_out_114182.awb")

						arg_63_1:RecordAudio("114182016", var_66_34)
						arg_63_1:RecordAudio("114182016", var_66_34)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_114182", "114182016", "story_v_out_114182.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_114182", "114182016", "story_v_out_114182.awb")
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
	Play114182017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 114182017
		arg_67_1.duration_ = 6.7

		local var_67_0 = {
			ja = 4.933,
			ko = 4.3,
			zh = 6.7,
			en = 4.533
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
				arg_67_0:Play114182018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1041ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1041ui_story == nil then
				arg_67_1.var_.characterEffect1041ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1041ui_story then
					arg_67_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1041ui_story then
				arg_67_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["10006ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and arg_67_1.var_.characterEffect10006ui_story == nil then
				arg_67_1.var_.characterEffect10006ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.2

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect10006ui_story then
					local var_70_8 = Mathf.Lerp(0, 0.5, var_70_7)

					arg_67_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10006ui_story.fillRatio = var_70_8
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect10006ui_story then
				local var_70_9 = 0.5

				arg_67_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10006ui_story.fillRatio = var_70_9
			end

			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 then
				arg_67_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_70_11 = 0
			local var_70_12 = 0.55

			if var_70_11 < arg_67_1.time_ and arg_67_1.time_ <= var_70_11 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_13 = arg_67_1:FormatText(StoryNameCfg[208].name)

				arg_67_1.leftNameTxt_.text = var_70_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_14 = arg_67_1:GetWordFromCfg(114182017)
				local var_70_15 = arg_67_1:FormatText(var_70_14.content)

				arg_67_1.text_.text = var_70_15

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_16 = 22
				local var_70_17 = utf8.len(var_70_15)
				local var_70_18 = var_70_16 <= 0 and var_70_12 or var_70_12 * (var_70_17 / var_70_16)

				if var_70_18 > 0 and var_70_12 < var_70_18 then
					arg_67_1.talkMaxDuration = var_70_18

					if var_70_18 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_11
					end
				end

				arg_67_1.text_.text = var_70_15
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182017", "story_v_out_114182.awb") ~= 0 then
					local var_70_19 = manager.audio:GetVoiceLength("story_v_out_114182", "114182017", "story_v_out_114182.awb") / 1000

					if var_70_19 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_11
					end

					if var_70_14.prefab_name ~= "" and arg_67_1.actors_[var_70_14.prefab_name] ~= nil then
						local var_70_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_14.prefab_name].transform, "story_v_out_114182", "114182017", "story_v_out_114182.awb")

						arg_67_1:RecordAudio("114182017", var_70_20)
						arg_67_1:RecordAudio("114182017", var_70_20)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_114182", "114182017", "story_v_out_114182.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_114182", "114182017", "story_v_out_114182.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_21 = math.max(var_70_12, arg_67_1.talkMaxDuration)

			if var_70_11 <= arg_67_1.time_ and arg_67_1.time_ < var_70_11 + var_70_21 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_11) / var_70_21

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_11 + var_70_21 and arg_67_1.time_ < var_70_11 + var_70_21 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play114182018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 114182018
		arg_71_1.duration_ = 5.433

		local var_71_0 = {
			ja = 5.433,
			ko = 2.533,
			zh = 2.3,
			en = 3.4
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
				arg_71_0:Play114182019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1041ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1041ui_story == nil then
				arg_71_1.var_.characterEffect1041ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.2

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1041ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1041ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1041ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1041ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 0.25

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_8 = arg_71_1:FormatText(StoryNameCfg[94].name)

				arg_71_1.leftNameTxt_.text = var_74_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_5")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_9 = arg_71_1:GetWordFromCfg(114182018)
				local var_74_10 = arg_71_1:FormatText(var_74_9.content)

				arg_71_1.text_.text = var_74_10

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_11 = 10
				local var_74_12 = utf8.len(var_74_10)
				local var_74_13 = var_74_11 <= 0 and var_74_7 or var_74_7 * (var_74_12 / var_74_11)

				if var_74_13 > 0 and var_74_7 < var_74_13 then
					arg_71_1.talkMaxDuration = var_74_13

					if var_74_13 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_13 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_10
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182018", "story_v_out_114182.awb") ~= 0 then
					local var_74_14 = manager.audio:GetVoiceLength("story_v_out_114182", "114182018", "story_v_out_114182.awb") / 1000

					if var_74_14 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_14 + var_74_6
					end

					if var_74_9.prefab_name ~= "" and arg_71_1.actors_[var_74_9.prefab_name] ~= nil then
						local var_74_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_9.prefab_name].transform, "story_v_out_114182", "114182018", "story_v_out_114182.awb")

						arg_71_1:RecordAudio("114182018", var_74_15)
						arg_71_1:RecordAudio("114182018", var_74_15)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_114182", "114182018", "story_v_out_114182.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_114182", "114182018", "story_v_out_114182.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_16 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_16 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_16

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_16 and arg_71_1.time_ < var_74_6 + var_74_16 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play114182019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 114182019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play114182020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1041ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1041ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, 100, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1041ui_story, var_78_4, var_78_3)

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

			local var_78_9 = arg_75_1.actors_["10006ui_story"].transform
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.var_.moveOldPos10006ui_story = var_78_9.localPosition
			end

			local var_78_11 = 0.001

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11
				local var_78_13 = Vector3.New(0, 100, 0)

				var_78_9.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10006ui_story, var_78_13, var_78_12)

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
			local var_78_19 = 0.725

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

				local var_78_20 = arg_75_1:GetWordFromCfg(114182019)
				local var_78_21 = arg_75_1:FormatText(var_78_20.content)

				arg_75_1.text_.text = var_78_21

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_22 = 29
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
	Play114182020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 114182020
		arg_79_1.duration_ = 6.733

		local var_79_0 = {
			ja = 6.733,
			ko = 6.3,
			zh = 5.7,
			en = 6.166
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
				arg_79_0:Play114182021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1184ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1184ui_story = var_82_0.localPosition

				local var_82_2 = "1184ui_story"

				arg_79_1:ShowWeapon(arg_79_1.var_[var_82_2 .. "Animator"].transform, false)
			end

			local var_82_3 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_3 then
				local var_82_4 = (arg_79_1.time_ - var_82_1) / var_82_3
				local var_82_5 = Vector3.New(0, -0.97, -6)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1184ui_story, var_82_5, var_82_4)

				local var_82_6 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_6.x, var_82_6.y, var_82_6.z)

				local var_82_7 = var_82_0.localEulerAngles

				var_82_7.z = 0
				var_82_7.x = 0
				var_82_0.localEulerAngles = var_82_7
			end

			if arg_79_1.time_ >= var_82_1 + var_82_3 and arg_79_1.time_ < var_82_1 + var_82_3 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_82_8 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_8.x, var_82_8.y, var_82_8.z)

				local var_82_9 = var_82_0.localEulerAngles

				var_82_9.z = 0
				var_82_9.x = 0
				var_82_0.localEulerAngles = var_82_9
			end

			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_82_11 = 0

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_82_12 = arg_79_1.actors_["1184ui_story"]
			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 and arg_79_1.var_.characterEffect1184ui_story == nil then
				arg_79_1.var_.characterEffect1184ui_story = var_82_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_14 = 0.2

			if var_82_13 <= arg_79_1.time_ and arg_79_1.time_ < var_82_13 + var_82_14 then
				local var_82_15 = (arg_79_1.time_ - var_82_13) / var_82_14

				if arg_79_1.var_.characterEffect1184ui_story then
					arg_79_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_13 + var_82_14 and arg_79_1.time_ < var_82_13 + var_82_14 + arg_82_0 and arg_79_1.var_.characterEffect1184ui_story then
				arg_79_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_82_16 = 0
			local var_82_17 = 0.6

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_18 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_19 = arg_79_1:GetWordFromCfg(114182020)
				local var_82_20 = arg_79_1:FormatText(var_82_19.content)

				arg_79_1.text_.text = var_82_20

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_21 = 24
				local var_82_22 = utf8.len(var_82_20)
				local var_82_23 = var_82_21 <= 0 and var_82_17 or var_82_17 * (var_82_22 / var_82_21)

				if var_82_23 > 0 and var_82_17 < var_82_23 then
					arg_79_1.talkMaxDuration = var_82_23

					if var_82_23 + var_82_16 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_23 + var_82_16
					end
				end

				arg_79_1.text_.text = var_82_20
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182020", "story_v_out_114182.awb") ~= 0 then
					local var_82_24 = manager.audio:GetVoiceLength("story_v_out_114182", "114182020", "story_v_out_114182.awb") / 1000

					if var_82_24 + var_82_16 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_24 + var_82_16
					end

					if var_82_19.prefab_name ~= "" and arg_79_1.actors_[var_82_19.prefab_name] ~= nil then
						local var_82_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_19.prefab_name].transform, "story_v_out_114182", "114182020", "story_v_out_114182.awb")

						arg_79_1:RecordAudio("114182020", var_82_25)
						arg_79_1:RecordAudio("114182020", var_82_25)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_114182", "114182020", "story_v_out_114182.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_114182", "114182020", "story_v_out_114182.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_26 = math.max(var_82_17, arg_79_1.talkMaxDuration)

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_26 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_16) / var_82_26

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_16 + var_82_26 and arg_79_1.time_ < var_82_16 + var_82_26 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play114182021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 114182021
		arg_83_1.duration_ = 0.199999999999

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"

			SetActive(arg_83_1.choicesGo_, true)

			for iter_84_0, iter_84_1 in ipairs(arg_83_1.choices_) do
				local var_84_0 = iter_84_0 <= 1

				SetActive(iter_84_1.go, var_84_0)
			end

			arg_83_1.choices_[1].txt.text = arg_83_1:FormatText(StoryChoiceCfg[146].name)
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play114182022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1184ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1184ui_story == nil then
				arg_83_1.var_.characterEffect1184ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.2

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1184ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1184ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1184ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1184ui_story.fillRatio = var_86_5
			end
		end
	end,
	Play114182022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 114182022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play114182023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1184ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1184ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, 100, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1184ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, 100, 0)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = 0
			local var_90_10 = 1.025

			if var_90_9 < arg_87_1.time_ and arg_87_1.time_ <= var_90_9 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_11 = arg_87_1:GetWordFromCfg(114182022)
				local var_90_12 = arg_87_1:FormatText(var_90_11.content)

				arg_87_1.text_.text = var_90_12

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_13 = 41
				local var_90_14 = utf8.len(var_90_12)
				local var_90_15 = var_90_13 <= 0 and var_90_10 or var_90_10 * (var_90_14 / var_90_13)

				if var_90_15 > 0 and var_90_10 < var_90_15 then
					arg_87_1.talkMaxDuration = var_90_15

					if var_90_15 + var_90_9 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_15 + var_90_9
					end
				end

				arg_87_1.text_.text = var_90_12
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_16 = math.max(var_90_10, arg_87_1.talkMaxDuration)

			if var_90_9 <= arg_87_1.time_ and arg_87_1.time_ < var_90_9 + var_90_16 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_9) / var_90_16

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_9 + var_90_16 and arg_87_1.time_ < var_90_9 + var_90_16 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play114182023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 114182023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play114182024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.3

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[7].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(114182023)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 12
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
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_8 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_8 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_8

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_8 and arg_91_1.time_ < var_94_0 + var_94_8 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play114182024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 114182024
		arg_95_1.duration_ = 9

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play114182025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = "F04"

			if arg_95_1.bgs_[var_98_0] == nil then
				local var_98_1 = Object.Instantiate(arg_95_1.paintGo_)

				var_98_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_98_0)
				var_98_1.name = var_98_0
				var_98_1.transform.parent = arg_95_1.stage_.transform
				var_98_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_95_1.bgs_[var_98_0] = var_98_1
			end

			local var_98_2 = 2

			if var_98_2 < arg_95_1.time_ and arg_95_1.time_ <= var_98_2 + arg_98_0 then
				local var_98_3 = manager.ui.mainCamera.transform.localPosition
				local var_98_4 = Vector3.New(0, 0, 10) + Vector3.New(var_98_3.x, var_98_3.y, 0)
				local var_98_5 = arg_95_1.bgs_.F04

				var_98_5.transform.localPosition = var_98_4
				var_98_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_98_6 = var_98_5:GetComponent("SpriteRenderer")

				if var_98_6 and var_98_6.sprite then
					local var_98_7 = (var_98_5.transform.localPosition - var_98_3).z
					local var_98_8 = manager.ui.mainCameraCom_
					local var_98_9 = 2 * var_98_7 * Mathf.Tan(var_98_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_98_10 = var_98_9 * var_98_8.aspect
					local var_98_11 = var_98_6.sprite.bounds.size.x
					local var_98_12 = var_98_6.sprite.bounds.size.y
					local var_98_13 = var_98_10 / var_98_11
					local var_98_14 = var_98_9 / var_98_12
					local var_98_15 = var_98_14 < var_98_13 and var_98_13 or var_98_14

					var_98_5.transform.localScale = Vector3.New(var_98_15, var_98_15, 0)
				end

				for iter_98_0, iter_98_1 in pairs(arg_95_1.bgs_) do
					if iter_98_0 ~= "F04" then
						iter_98_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				arg_95_1.mask_.enabled = true
				arg_95_1.mask_.raycastTarget = true

				arg_95_1:SetGaussion(false)
			end

			local var_98_17 = 2

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17
				local var_98_19 = Color.New(0, 0, 0)

				var_98_19.a = Mathf.Lerp(0, 1, var_98_18)
				arg_95_1.mask_.color = var_98_19
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 then
				local var_98_20 = Color.New(0, 0, 0)

				var_98_20.a = 1
				arg_95_1.mask_.color = var_98_20
			end

			local var_98_21 = 2

			if var_98_21 < arg_95_1.time_ and arg_95_1.time_ <= var_98_21 + arg_98_0 then
				arg_95_1.mask_.enabled = true
				arg_95_1.mask_.raycastTarget = true

				arg_95_1:SetGaussion(false)
			end

			local var_98_22 = 2

			if var_98_21 <= arg_95_1.time_ and arg_95_1.time_ < var_98_21 + var_98_22 then
				local var_98_23 = (arg_95_1.time_ - var_98_21) / var_98_22
				local var_98_24 = Color.New(0, 0, 0)

				var_98_24.a = Mathf.Lerp(1, 0, var_98_23)
				arg_95_1.mask_.color = var_98_24
			end

			if arg_95_1.time_ >= var_98_21 + var_98_22 and arg_95_1.time_ < var_98_21 + var_98_22 + arg_98_0 then
				local var_98_25 = Color.New(0, 0, 0)
				local var_98_26 = 0

				arg_95_1.mask_.enabled = false
				var_98_25.a = var_98_26
				arg_95_1.mask_.color = var_98_25
			end

			if arg_95_1.frameCnt_ <= 1 then
				arg_95_1.dialog_:SetActive(false)
			end

			local var_98_27 = 4
			local var_98_28 = 0.25

			if var_98_27 < arg_95_1.time_ and arg_95_1.time_ <= var_98_27 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0

				arg_95_1.dialog_:SetActive(true)

				local var_98_29 = LeanTween.value(arg_95_1.dialog_, 0, 1, 0.3)

				var_98_29:setOnUpdate(LuaHelper.FloatAction(function(arg_99_0)
					arg_95_1.dialogCg_.alpha = arg_99_0
				end))
				var_98_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_95_1.dialog_)
					var_98_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_95_1.duration_ = arg_95_1.duration_ + 0.3

				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_30 = arg_95_1:GetWordFromCfg(114182024)
				local var_98_31 = arg_95_1:FormatText(var_98_30.content)

				arg_95_1.text_.text = var_98_31

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_32 = 10
				local var_98_33 = utf8.len(var_98_31)
				local var_98_34 = var_98_32 <= 0 and var_98_28 or var_98_28 * (var_98_33 / var_98_32)

				if var_98_34 > 0 and var_98_28 < var_98_34 then
					arg_95_1.talkMaxDuration = var_98_34
					var_98_27 = var_98_27 + 0.3

					if var_98_34 + var_98_27 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_34 + var_98_27
					end
				end

				arg_95_1.text_.text = var_98_31
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_35 = var_98_27 + 0.3
			local var_98_36 = math.max(var_98_28, arg_95_1.talkMaxDuration)

			if var_98_35 <= arg_95_1.time_ and arg_95_1.time_ < var_98_35 + var_98_36 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_35) / var_98_36

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_35 + var_98_36 and arg_95_1.time_ < var_98_35 + var_98_36 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play114182025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 114182025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play114182026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.625

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_2 = arg_101_1:GetWordFromCfg(114182025)
				local var_104_3 = arg_101_1:FormatText(var_104_2.content)

				arg_101_1.text_.text = var_104_3

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_4 = 25
				local var_104_5 = utf8.len(var_104_3)
				local var_104_6 = var_104_4 <= 0 and var_104_1 or var_104_1 * (var_104_5 / var_104_4)

				if var_104_6 > 0 and var_104_1 < var_104_6 then
					arg_101_1.talkMaxDuration = var_104_6

					if var_104_6 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_6 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_3
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_7 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_7 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_7

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_7 and arg_101_1.time_ < var_104_0 + var_104_7 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play114182026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 114182026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play114182027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.95

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_2 = arg_105_1:GetWordFromCfg(114182026)
				local var_108_3 = arg_105_1:FormatText(var_108_2.content)

				arg_105_1.text_.text = var_108_3

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_4 = 38
				local var_108_5 = utf8.len(var_108_3)
				local var_108_6 = var_108_4 <= 0 and var_108_1 or var_108_1 * (var_108_5 / var_108_4)

				if var_108_6 > 0 and var_108_1 < var_108_6 then
					arg_105_1.talkMaxDuration = var_108_6

					if var_108_6 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_6 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_3
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_7 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_7 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_7

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_7 and arg_105_1.time_ < var_108_0 + var_108_7 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play114182027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 114182027
		arg_109_1.duration_ = 3.233

		local var_109_0 = {
			ja = 2.3,
			ko = 3.1,
			zh = 3.2,
			en = 3.233
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
				arg_109_0:Play114182028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.375

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[206].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, true)
				arg_109_1.iconController_:SetSelectedState("hero")

				arg_109_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1067")

				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(114182027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182027", "story_v_out_114182.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_114182", "114182027", "story_v_out_114182.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_114182", "114182027", "story_v_out_114182.awb")

						arg_109_1:RecordAudio("114182027", var_112_9)
						arg_109_1:RecordAudio("114182027", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_114182", "114182027", "story_v_out_114182.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_114182", "114182027", "story_v_out_114182.awb")
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
	Play114182028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 114182028
		arg_113_1.duration_ = 2.366

		local var_113_0 = {
			ja = 2.366,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.266
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
				arg_113_0:Play114182029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = "1067ui_story"

			if arg_113_1.actors_[var_116_0] == nil then
				local var_116_1 = Object.Instantiate(Asset.Load("Char/" .. var_116_0), arg_113_1.stage_.transform)

				var_116_1.name = var_116_0
				var_116_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.actors_[var_116_0] = var_116_1

				local var_116_2 = var_116_1:GetComponentInChildren(typeof(CharacterEffect))

				var_116_2.enabled = true

				local var_116_3 = GameObjectTools.GetOrAddComponent(var_116_1, typeof(DynamicBoneHelper))

				if var_116_3 then
					var_116_3:EnableDynamicBone(false)
				end

				arg_113_1:ShowWeapon(var_116_2.transform, false)

				arg_113_1.var_[var_116_0 .. "Animator"] = var_116_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_113_1.var_[var_116_0 .. "Animator"].applyRootMotion = true
				arg_113_1.var_[var_116_0 .. "LipSync"] = var_116_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_116_4 = arg_113_1.actors_["1067ui_story"]
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 and arg_113_1.var_.characterEffect1067ui_story == nil then
				arg_113_1.var_.characterEffect1067ui_story = var_116_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_6 = 0.2

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_6 then
				local var_116_7 = (arg_113_1.time_ - var_116_5) / var_116_6

				if arg_113_1.var_.characterEffect1067ui_story then
					local var_116_8 = Mathf.Lerp(0, 0.5, var_116_7)

					arg_113_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1067ui_story.fillRatio = var_116_8
				end
			end

			if arg_113_1.time_ >= var_116_5 + var_116_6 and arg_113_1.time_ < var_116_5 + var_116_6 + arg_116_0 and arg_113_1.var_.characterEffect1067ui_story then
				local var_116_9 = 0.5

				arg_113_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1067ui_story.fillRatio = var_116_9
			end

			local var_116_10 = "1042ui_story"

			if arg_113_1.actors_[var_116_10] == nil then
				local var_116_11 = Object.Instantiate(Asset.Load("Char/" .. var_116_10), arg_113_1.stage_.transform)

				var_116_11.name = var_116_10
				var_116_11.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.actors_[var_116_10] = var_116_11

				local var_116_12 = var_116_11:GetComponentInChildren(typeof(CharacterEffect))

				var_116_12.enabled = true

				local var_116_13 = GameObjectTools.GetOrAddComponent(var_116_11, typeof(DynamicBoneHelper))

				if var_116_13 then
					var_116_13:EnableDynamicBone(false)
				end

				arg_113_1:ShowWeapon(var_116_12.transform, false)

				arg_113_1.var_[var_116_10 .. "Animator"] = var_116_12.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_113_1.var_[var_116_10 .. "Animator"].applyRootMotion = true
				arg_113_1.var_[var_116_10 .. "LipSync"] = var_116_12.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_116_14 = arg_113_1.actors_["1042ui_story"].transform
			local var_116_15 = 0

			if var_116_15 < arg_113_1.time_ and arg_113_1.time_ <= var_116_15 + arg_116_0 then
				arg_113_1.var_.moveOldPos1042ui_story = var_116_14.localPosition
			end

			local var_116_16 = 0.001

			if var_116_15 <= arg_113_1.time_ and arg_113_1.time_ < var_116_15 + var_116_16 then
				local var_116_17 = (arg_113_1.time_ - var_116_15) / var_116_16
				local var_116_18 = Vector3.New(-0.7, -1.06, -6.2)

				var_116_14.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1042ui_story, var_116_18, var_116_17)

				local var_116_19 = manager.ui.mainCamera.transform.position - var_116_14.position

				var_116_14.forward = Vector3.New(var_116_19.x, var_116_19.y, var_116_19.z)

				local var_116_20 = var_116_14.localEulerAngles

				var_116_20.z = 0
				var_116_20.x = 0
				var_116_14.localEulerAngles = var_116_20
			end

			if arg_113_1.time_ >= var_116_15 + var_116_16 and arg_113_1.time_ < var_116_15 + var_116_16 + arg_116_0 then
				var_116_14.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_116_21 = manager.ui.mainCamera.transform.position - var_116_14.position

				var_116_14.forward = Vector3.New(var_116_21.x, var_116_21.y, var_116_21.z)

				local var_116_22 = var_116_14.localEulerAngles

				var_116_22.z = 0
				var_116_22.x = 0
				var_116_14.localEulerAngles = var_116_22
			end

			local var_116_23 = 0

			if var_116_23 < arg_113_1.time_ and arg_113_1.time_ <= var_116_23 + arg_116_0 then
				arg_113_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action1_1")
			end

			local var_116_24 = 0

			if var_116_24 < arg_113_1.time_ and arg_113_1.time_ <= var_116_24 + arg_116_0 then
				arg_113_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_116_25 = arg_113_1.actors_["1042ui_story"]
			local var_116_26 = 0

			if var_116_26 < arg_113_1.time_ and arg_113_1.time_ <= var_116_26 + arg_116_0 and arg_113_1.var_.characterEffect1042ui_story == nil then
				arg_113_1.var_.characterEffect1042ui_story = var_116_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_27 = 0.2

			if var_116_26 <= arg_113_1.time_ and arg_113_1.time_ < var_116_26 + var_116_27 then
				local var_116_28 = (arg_113_1.time_ - var_116_26) / var_116_27

				if arg_113_1.var_.characterEffect1042ui_story then
					arg_113_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_26 + var_116_27 and arg_113_1.time_ < var_116_26 + var_116_27 + arg_116_0 and arg_113_1.var_.characterEffect1042ui_story then
				arg_113_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_116_29 = 0
			local var_116_30 = 0.075

			if var_116_29 < arg_113_1.time_ and arg_113_1.time_ <= var_116_29 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_31 = arg_113_1:FormatText(StoryNameCfg[205].name)

				arg_113_1.leftNameTxt_.text = var_116_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_32 = arg_113_1:GetWordFromCfg(114182028)
				local var_116_33 = arg_113_1:FormatText(var_116_32.content)

				arg_113_1.text_.text = var_116_33

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_34 = 3
				local var_116_35 = utf8.len(var_116_33)
				local var_116_36 = var_116_34 <= 0 and var_116_30 or var_116_30 * (var_116_35 / var_116_34)

				if var_116_36 > 0 and var_116_30 < var_116_36 then
					arg_113_1.talkMaxDuration = var_116_36

					if var_116_36 + var_116_29 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_36 + var_116_29
					end
				end

				arg_113_1.text_.text = var_116_33
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182028", "story_v_out_114182.awb") ~= 0 then
					local var_116_37 = manager.audio:GetVoiceLength("story_v_out_114182", "114182028", "story_v_out_114182.awb") / 1000

					if var_116_37 + var_116_29 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_37 + var_116_29
					end

					if var_116_32.prefab_name ~= "" and arg_113_1.actors_[var_116_32.prefab_name] ~= nil then
						local var_116_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_32.prefab_name].transform, "story_v_out_114182", "114182028", "story_v_out_114182.awb")

						arg_113_1:RecordAudio("114182028", var_116_38)
						arg_113_1:RecordAudio("114182028", var_116_38)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_114182", "114182028", "story_v_out_114182.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_114182", "114182028", "story_v_out_114182.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_39 = math.max(var_116_30, arg_113_1.talkMaxDuration)

			if var_116_29 <= arg_113_1.time_ and arg_113_1.time_ < var_116_29 + var_116_39 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_29) / var_116_39

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_29 + var_116_39 and arg_113_1.time_ < var_116_29 + var_116_39 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play114182029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 114182029
		arg_117_1.duration_ = 6.1

		local var_117_0 = {
			ja = 6.1,
			ko = 2.8,
			zh = 4.666,
			en = 4
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
				arg_117_0:Play114182030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1067ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1067ui_story == nil then
				arg_117_1.var_.characterEffect1067ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.2

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1067ui_story then
					arg_117_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1067ui_story then
				arg_117_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_120_4 = arg_117_1.actors_["1042ui_story"]
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 and arg_117_1.var_.characterEffect1042ui_story == nil then
				arg_117_1.var_.characterEffect1042ui_story = var_120_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_6 = 0.2

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6

				if arg_117_1.var_.characterEffect1042ui_story then
					local var_120_8 = Mathf.Lerp(0, 0.5, var_120_7)

					arg_117_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1042ui_story.fillRatio = var_120_8
				end
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 and arg_117_1.var_.characterEffect1042ui_story then
				local var_120_9 = 0.5

				arg_117_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1042ui_story.fillRatio = var_120_9
			end

			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 then
				arg_117_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action4_1")
			end

			local var_120_11 = 0

			if var_120_11 < arg_117_1.time_ and arg_117_1.time_ <= var_120_11 + arg_120_0 then
				arg_117_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_120_12 = arg_117_1.actors_["1067ui_story"].transform
			local var_120_13 = 0

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1.var_.moveOldPos1067ui_story = var_120_12.localPosition
			end

			local var_120_14 = 0.001

			if var_120_13 <= arg_117_1.time_ and arg_117_1.time_ < var_120_13 + var_120_14 then
				local var_120_15 = (arg_117_1.time_ - var_120_13) / var_120_14
				local var_120_16 = Vector3.New(0.7, -1.06, -6.2)

				var_120_12.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1067ui_story, var_120_16, var_120_15)

				local var_120_17 = manager.ui.mainCamera.transform.position - var_120_12.position

				var_120_12.forward = Vector3.New(var_120_17.x, var_120_17.y, var_120_17.z)

				local var_120_18 = var_120_12.localEulerAngles

				var_120_18.z = 0
				var_120_18.x = 0
				var_120_12.localEulerAngles = var_120_18
			end

			if arg_117_1.time_ >= var_120_13 + var_120_14 and arg_117_1.time_ < var_120_13 + var_120_14 + arg_120_0 then
				var_120_12.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_120_19 = manager.ui.mainCamera.transform.position - var_120_12.position

				var_120_12.forward = Vector3.New(var_120_19.x, var_120_19.y, var_120_19.z)

				local var_120_20 = var_120_12.localEulerAngles

				var_120_20.z = 0
				var_120_20.x = 0
				var_120_12.localEulerAngles = var_120_20
			end

			local var_120_21 = 0
			local var_120_22 = 0.35

			if var_120_21 < arg_117_1.time_ and arg_117_1.time_ <= var_120_21 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_23 = arg_117_1:FormatText(StoryNameCfg[206].name)

				arg_117_1.leftNameTxt_.text = var_120_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_24 = arg_117_1:GetWordFromCfg(114182029)
				local var_120_25 = arg_117_1:FormatText(var_120_24.content)

				arg_117_1.text_.text = var_120_25

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_26 = 14
				local var_120_27 = utf8.len(var_120_25)
				local var_120_28 = var_120_26 <= 0 and var_120_22 or var_120_22 * (var_120_27 / var_120_26)

				if var_120_28 > 0 and var_120_22 < var_120_28 then
					arg_117_1.talkMaxDuration = var_120_28

					if var_120_28 + var_120_21 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_28 + var_120_21
					end
				end

				arg_117_1.text_.text = var_120_25
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182029", "story_v_out_114182.awb") ~= 0 then
					local var_120_29 = manager.audio:GetVoiceLength("story_v_out_114182", "114182029", "story_v_out_114182.awb") / 1000

					if var_120_29 + var_120_21 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_29 + var_120_21
					end

					if var_120_24.prefab_name ~= "" and arg_117_1.actors_[var_120_24.prefab_name] ~= nil then
						local var_120_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_24.prefab_name].transform, "story_v_out_114182", "114182029", "story_v_out_114182.awb")

						arg_117_1:RecordAudio("114182029", var_120_30)
						arg_117_1:RecordAudio("114182029", var_120_30)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_114182", "114182029", "story_v_out_114182.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_114182", "114182029", "story_v_out_114182.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_31 = math.max(var_120_22, arg_117_1.talkMaxDuration)

			if var_120_21 <= arg_117_1.time_ and arg_117_1.time_ < var_120_21 + var_120_31 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_21) / var_120_31

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_21 + var_120_31 and arg_117_1.time_ < var_120_21 + var_120_31 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play114182030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 114182030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play114182031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1067ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect1067ui_story == nil then
				arg_121_1.var_.characterEffect1067ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.2

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1067ui_story then
					local var_124_4 = Mathf.Lerp(0, 0.5, var_124_3)

					arg_121_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1067ui_story.fillRatio = var_124_4
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1067ui_story then
				local var_124_5 = 0.5

				arg_121_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1067ui_story.fillRatio = var_124_5
			end

			local var_124_6 = 0

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 then
				arg_121_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action4_2")
			end

			local var_124_7 = 0
			local var_124_8 = 0.925

			if var_124_7 < arg_121_1.time_ and arg_121_1.time_ <= var_124_7 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_9 = arg_121_1:GetWordFromCfg(114182030)
				local var_124_10 = arg_121_1:FormatText(var_124_9.content)

				arg_121_1.text_.text = var_124_10

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_11 = 37
				local var_124_12 = utf8.len(var_124_10)
				local var_124_13 = var_124_11 <= 0 and var_124_8 or var_124_8 * (var_124_12 / var_124_11)

				if var_124_13 > 0 and var_124_8 < var_124_13 then
					arg_121_1.talkMaxDuration = var_124_13

					if var_124_13 + var_124_7 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_13 + var_124_7
					end
				end

				arg_121_1.text_.text = var_124_10
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_14 = math.max(var_124_8, arg_121_1.talkMaxDuration)

			if var_124_7 <= arg_121_1.time_ and arg_121_1.time_ < var_124_7 + var_124_14 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_7) / var_124_14

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_7 + var_124_14 and arg_121_1.time_ < var_124_7 + var_124_14 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play114182031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 114182031
		arg_125_1.duration_ = 2.466

		local var_125_0 = {
			ja = 2.466,
			ko = 2.133,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_125_1 = manager.audio:GetLocalizationFlag()

		if var_125_0[var_125_1] ~= nil then
			arg_125_1.duration_ = var_125_0[var_125_1]
		end

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play114182032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_128_1 = arg_125_1.actors_["1067ui_story"]
			local var_128_2 = 0

			if var_128_2 < arg_125_1.time_ and arg_125_1.time_ <= var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1067ui_story == nil then
				arg_125_1.var_.characterEffect1067ui_story = var_128_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_3 = 0.2

			if var_128_2 <= arg_125_1.time_ and arg_125_1.time_ < var_128_2 + var_128_3 then
				local var_128_4 = (arg_125_1.time_ - var_128_2) / var_128_3

				if arg_125_1.var_.characterEffect1067ui_story then
					arg_125_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_2 + var_128_3 and arg_125_1.time_ < var_128_2 + var_128_3 + arg_128_0 and arg_125_1.var_.characterEffect1067ui_story then
				arg_125_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_128_5 = 0
			local var_128_6 = 0.2

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_7 = arg_125_1:FormatText(StoryNameCfg[206].name)

				arg_125_1.leftNameTxt_.text = var_128_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_8 = arg_125_1:GetWordFromCfg(114182031)
				local var_128_9 = arg_125_1:FormatText(var_128_8.content)

				arg_125_1.text_.text = var_128_9

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_10 = 8
				local var_128_11 = utf8.len(var_128_9)
				local var_128_12 = var_128_10 <= 0 and var_128_6 or var_128_6 * (var_128_11 / var_128_10)

				if var_128_12 > 0 and var_128_6 < var_128_12 then
					arg_125_1.talkMaxDuration = var_128_12

					if var_128_12 + var_128_5 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_12 + var_128_5
					end
				end

				arg_125_1.text_.text = var_128_9
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182031", "story_v_out_114182.awb") ~= 0 then
					local var_128_13 = manager.audio:GetVoiceLength("story_v_out_114182", "114182031", "story_v_out_114182.awb") / 1000

					if var_128_13 + var_128_5 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_13 + var_128_5
					end

					if var_128_8.prefab_name ~= "" and arg_125_1.actors_[var_128_8.prefab_name] ~= nil then
						local var_128_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_8.prefab_name].transform, "story_v_out_114182", "114182031", "story_v_out_114182.awb")

						arg_125_1:RecordAudio("114182031", var_128_14)
						arg_125_1:RecordAudio("114182031", var_128_14)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_114182", "114182031", "story_v_out_114182.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_114182", "114182031", "story_v_out_114182.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_15 = math.max(var_128_6, arg_125_1.talkMaxDuration)

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_15 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_5) / var_128_15

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_5 + var_128_15 and arg_125_1.time_ < var_128_5 + var_128_15 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play114182032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 114182032
		arg_129_1.duration_ = 1.999999999999

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play114182033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1067ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1067ui_story == nil then
				arg_129_1.var_.characterEffect1067ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.2

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1067ui_story then
					local var_132_4 = Mathf.Lerp(0, 0.5, var_132_3)

					arg_129_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1067ui_story.fillRatio = var_132_4
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1067ui_story then
				local var_132_5 = 0.5

				arg_129_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1067ui_story.fillRatio = var_132_5
			end

			local var_132_6 = 0

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_132_7 = arg_129_1.actors_["1042ui_story"]
			local var_132_8 = 0

			if var_132_8 < arg_129_1.time_ and arg_129_1.time_ <= var_132_8 + arg_132_0 and arg_129_1.var_.characterEffect1042ui_story == nil then
				arg_129_1.var_.characterEffect1042ui_story = var_132_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_9 = 0.2

			if var_132_8 <= arg_129_1.time_ and arg_129_1.time_ < var_132_8 + var_132_9 then
				local var_132_10 = (arg_129_1.time_ - var_132_8) / var_132_9

				if arg_129_1.var_.characterEffect1042ui_story then
					arg_129_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_8 + var_132_9 and arg_129_1.time_ < var_132_8 + var_132_9 + arg_132_0 and arg_129_1.var_.characterEffect1042ui_story then
				arg_129_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_132_11 = 0
			local var_132_12 = 0.075

			if var_132_11 < arg_129_1.time_ and arg_129_1.time_ <= var_132_11 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_13 = arg_129_1:FormatText(StoryNameCfg[205].name)

				arg_129_1.leftNameTxt_.text = var_132_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_14 = arg_129_1:GetWordFromCfg(114182032)
				local var_132_15 = arg_129_1:FormatText(var_132_14.content)

				arg_129_1.text_.text = var_132_15

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_16 = 3
				local var_132_17 = utf8.len(var_132_15)
				local var_132_18 = var_132_16 <= 0 and var_132_12 or var_132_12 * (var_132_17 / var_132_16)

				if var_132_18 > 0 and var_132_12 < var_132_18 then
					arg_129_1.talkMaxDuration = var_132_18

					if var_132_18 + var_132_11 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_18 + var_132_11
					end
				end

				arg_129_1.text_.text = var_132_15
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182032", "story_v_out_114182.awb") ~= 0 then
					local var_132_19 = manager.audio:GetVoiceLength("story_v_out_114182", "114182032", "story_v_out_114182.awb") / 1000

					if var_132_19 + var_132_11 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_19 + var_132_11
					end

					if var_132_14.prefab_name ~= "" and arg_129_1.actors_[var_132_14.prefab_name] ~= nil then
						local var_132_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_14.prefab_name].transform, "story_v_out_114182", "114182032", "story_v_out_114182.awb")

						arg_129_1:RecordAudio("114182032", var_132_20)
						arg_129_1:RecordAudio("114182032", var_132_20)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_114182", "114182032", "story_v_out_114182.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_114182", "114182032", "story_v_out_114182.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_21 = math.max(var_132_12, arg_129_1.talkMaxDuration)

			if var_132_11 <= arg_129_1.time_ and arg_129_1.time_ < var_132_11 + var_132_21 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_11) / var_132_21

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_11 + var_132_21 and arg_129_1.time_ < var_132_11 + var_132_21 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play114182033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 114182033
		arg_133_1.duration_ = 9.966

		local var_133_0 = {
			ja = 5.1,
			ko = 9.966,
			zh = 7.7,
			en = 8.366
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
				arg_133_0:Play114182034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1067ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1067ui_story == nil then
				arg_133_1.var_.characterEffect1067ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.2

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1067ui_story then
					arg_133_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1067ui_story then
				arg_133_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_136_4 = arg_133_1.actors_["1042ui_story"]
			local var_136_5 = 0

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 and arg_133_1.var_.characterEffect1042ui_story == nil then
				arg_133_1.var_.characterEffect1042ui_story = var_136_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_6 = 0.2

			if var_136_5 <= arg_133_1.time_ and arg_133_1.time_ < var_136_5 + var_136_6 then
				local var_136_7 = (arg_133_1.time_ - var_136_5) / var_136_6

				if arg_133_1.var_.characterEffect1042ui_story then
					local var_136_8 = Mathf.Lerp(0, 0.5, var_136_7)

					arg_133_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1042ui_story.fillRatio = var_136_8
				end
			end

			if arg_133_1.time_ >= var_136_5 + var_136_6 and arg_133_1.time_ < var_136_5 + var_136_6 + arg_136_0 and arg_133_1.var_.characterEffect1042ui_story then
				local var_136_9 = 0.5

				arg_133_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1042ui_story.fillRatio = var_136_9
			end

			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action3_1")
			end

			local var_136_11 = 0

			if var_136_11 < arg_133_1.time_ and arg_133_1.time_ <= var_136_11 + arg_136_0 then
				arg_133_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_136_12 = 0
			local var_136_13 = 1

			if var_136_12 < arg_133_1.time_ and arg_133_1.time_ <= var_136_12 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_14 = arg_133_1:FormatText(StoryNameCfg[206].name)

				arg_133_1.leftNameTxt_.text = var_136_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_15 = arg_133_1:GetWordFromCfg(114182033)
				local var_136_16 = arg_133_1:FormatText(var_136_15.content)

				arg_133_1.text_.text = var_136_16

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_17 = 40
				local var_136_18 = utf8.len(var_136_16)
				local var_136_19 = var_136_17 <= 0 and var_136_13 or var_136_13 * (var_136_18 / var_136_17)

				if var_136_19 > 0 and var_136_13 < var_136_19 then
					arg_133_1.talkMaxDuration = var_136_19

					if var_136_19 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_19 + var_136_12
					end
				end

				arg_133_1.text_.text = var_136_16
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182033", "story_v_out_114182.awb") ~= 0 then
					local var_136_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182033", "story_v_out_114182.awb") / 1000

					if var_136_20 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_12
					end

					if var_136_15.prefab_name ~= "" and arg_133_1.actors_[var_136_15.prefab_name] ~= nil then
						local var_136_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_15.prefab_name].transform, "story_v_out_114182", "114182033", "story_v_out_114182.awb")

						arg_133_1:RecordAudio("114182033", var_136_21)
						arg_133_1:RecordAudio("114182033", var_136_21)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_114182", "114182033", "story_v_out_114182.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_114182", "114182033", "story_v_out_114182.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_22 = math.max(var_136_13, arg_133_1.talkMaxDuration)

			if var_136_12 <= arg_133_1.time_ and arg_133_1.time_ < var_136_12 + var_136_22 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_12) / var_136_22

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_12 + var_136_22 and arg_133_1.time_ < var_136_12 + var_136_22 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play114182034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 114182034
		arg_137_1.duration_ = 4.5

		local var_137_0 = {
			ja = 3.5,
			ko = 4.5,
			zh = 3.466,
			en = 3.333
		}
		local var_137_1 = manager.audio:GetLocalizationFlag()

		if var_137_0[var_137_1] ~= nil then
			arg_137_1.duration_ = var_137_0[var_137_1]
		end

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play114182035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1067ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1067ui_story == nil then
				arg_137_1.var_.characterEffect1067ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.2

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1067ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1067ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1067ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1067ui_story.fillRatio = var_140_5
			end

			local var_140_6 = arg_137_1.actors_["1042ui_story"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 and arg_137_1.var_.characterEffect1042ui_story == nil then
				arg_137_1.var_.characterEffect1042ui_story = var_140_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_8 = 0.2

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8

				if arg_137_1.var_.characterEffect1042ui_story then
					arg_137_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.characterEffect1042ui_story then
				arg_137_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_140_11 = 0
			local var_140_12 = 0.375

			if var_140_11 < arg_137_1.time_ and arg_137_1.time_ <= var_140_11 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_13 = arg_137_1:FormatText(StoryNameCfg[205].name)

				arg_137_1.leftNameTxt_.text = var_140_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_14 = arg_137_1:GetWordFromCfg(114182034)
				local var_140_15 = arg_137_1:FormatText(var_140_14.content)

				arg_137_1.text_.text = var_140_15

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_16 = 15
				local var_140_17 = utf8.len(var_140_15)
				local var_140_18 = var_140_16 <= 0 and var_140_12 or var_140_12 * (var_140_17 / var_140_16)

				if var_140_18 > 0 and var_140_12 < var_140_18 then
					arg_137_1.talkMaxDuration = var_140_18

					if var_140_18 + var_140_11 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_18 + var_140_11
					end
				end

				arg_137_1.text_.text = var_140_15
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182034", "story_v_out_114182.awb") ~= 0 then
					local var_140_19 = manager.audio:GetVoiceLength("story_v_out_114182", "114182034", "story_v_out_114182.awb") / 1000

					if var_140_19 + var_140_11 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_19 + var_140_11
					end

					if var_140_14.prefab_name ~= "" and arg_137_1.actors_[var_140_14.prefab_name] ~= nil then
						local var_140_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_14.prefab_name].transform, "story_v_out_114182", "114182034", "story_v_out_114182.awb")

						arg_137_1:RecordAudio("114182034", var_140_20)
						arg_137_1:RecordAudio("114182034", var_140_20)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_114182", "114182034", "story_v_out_114182.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_114182", "114182034", "story_v_out_114182.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_21 = math.max(var_140_12, arg_137_1.talkMaxDuration)

			if var_140_11 <= arg_137_1.time_ and arg_137_1.time_ < var_140_11 + var_140_21 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_11) / var_140_21

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_11 + var_140_21 and arg_137_1.time_ < var_140_11 + var_140_21 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play114182035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 114182035
		arg_141_1.duration_ = 6

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play114182036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1067ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1067ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0, 100, 0)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1067ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, 100, 0)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["1042ui_story"].transform
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1.var_.moveOldPos1042ui_story = var_144_9.localPosition
			end

			local var_144_11 = 0.001

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11
				local var_144_13 = Vector3.New(0, 100, 0)

				var_144_9.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1042ui_story, var_144_13, var_144_12)

				local var_144_14 = manager.ui.mainCamera.transform.position - var_144_9.position

				var_144_9.forward = Vector3.New(var_144_14.x, var_144_14.y, var_144_14.z)

				local var_144_15 = var_144_9.localEulerAngles

				var_144_15.z = 0
				var_144_15.x = 0
				var_144_9.localEulerAngles = var_144_15
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 then
				var_144_9.localPosition = Vector3.New(0, 100, 0)

				local var_144_16 = manager.ui.mainCamera.transform.position - var_144_9.position

				var_144_9.forward = Vector3.New(var_144_16.x, var_144_16.y, var_144_16.z)

				local var_144_17 = var_144_9.localEulerAngles

				var_144_17.z = 0
				var_144_17.x = 0
				var_144_9.localEulerAngles = var_144_17
			end

			local var_144_18 = manager.ui.mainCamera.transform
			local var_144_19 = 0

			if var_144_19 < arg_141_1.time_ and arg_141_1.time_ <= var_144_19 + arg_144_0 then
				arg_141_1.var_.shakeOldPos = var_144_18.localPosition
			end

			local var_144_20 = 1

			if var_144_19 <= arg_141_1.time_ and arg_141_1.time_ < var_144_19 + var_144_20 then
				local var_144_21 = (arg_141_1.time_ - var_144_19) / 0.066
				local var_144_22, var_144_23 = math.modf(var_144_21)

				var_144_18.localPosition = Vector3.New(var_144_23 * 0.13, var_144_23 * 0.13, var_144_23 * 0.13) + arg_141_1.var_.shakeOldPos
			end

			if arg_141_1.time_ >= var_144_19 + var_144_20 and arg_141_1.time_ < var_144_19 + var_144_20 + arg_144_0 then
				var_144_18.localPosition = arg_141_1.var_.shakeOldPos
			end

			local var_144_24 = 0

			if var_144_24 < arg_141_1.time_ and arg_141_1.time_ <= var_144_24 + arg_144_0 then
				arg_141_1.allBtn_.enabled = false
			end

			local var_144_25 = 1

			if arg_141_1.time_ >= var_144_24 + var_144_25 and arg_141_1.time_ < var_144_24 + var_144_25 + arg_144_0 then
				arg_141_1.allBtn_.enabled = true
			end

			local var_144_26 = 1
			local var_144_27 = 1

			if var_144_26 < arg_141_1.time_ and arg_141_1.time_ <= var_144_26 + arg_144_0 then
				local var_144_28 = "play"
				local var_144_29 = "effect"

				arg_141_1:AudioAction(var_144_28, var_144_29, "se_story_11", "se_story_11_blast02", "")
			end

			if arg_141_1.frameCnt_ <= 1 then
				arg_141_1.dialog_:SetActive(false)
			end

			local var_144_30 = 1
			local var_144_31 = 0.075

			if var_144_30 < arg_141_1.time_ and arg_141_1.time_ <= var_144_30 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0

				arg_141_1.dialog_:SetActive(true)

				local var_144_32 = LeanTween.value(arg_141_1.dialog_, 0, 1, 0.3)

				var_144_32:setOnUpdate(LuaHelper.FloatAction(function(arg_145_0)
					arg_141_1.dialogCg_.alpha = arg_145_0
				end))
				var_144_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_141_1.dialog_)
					var_144_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_141_1.duration_ = arg_141_1.duration_ + 0.3

				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_33 = arg_141_1:GetWordFromCfg(114182035)
				local var_144_34 = arg_141_1:FormatText(var_144_33.content)

				arg_141_1.text_.text = var_144_34

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_35 = 3
				local var_144_36 = utf8.len(var_144_34)
				local var_144_37 = var_144_35 <= 0 and var_144_31 or var_144_31 * (var_144_36 / var_144_35)

				if var_144_37 > 0 and var_144_31 < var_144_37 then
					arg_141_1.talkMaxDuration = var_144_37
					var_144_30 = var_144_30 + 0.3

					if var_144_37 + var_144_30 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_37 + var_144_30
					end
				end

				arg_141_1.text_.text = var_144_34
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_38 = var_144_30 + 0.3
			local var_144_39 = math.max(var_144_31, arg_141_1.talkMaxDuration)

			if var_144_38 <= arg_141_1.time_ and arg_141_1.time_ < var_144_38 + var_144_39 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_38) / var_144_39

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_38 + var_144_39 and arg_141_1.time_ < var_144_38 + var_144_39 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play114182036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 114182036
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play114182037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 1.55

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_2 = arg_147_1:GetWordFromCfg(114182036)
				local var_150_3 = arg_147_1:FormatText(var_150_2.content)

				arg_147_1.text_.text = var_150_3

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_4 = 62
				local var_150_5 = utf8.len(var_150_3)
				local var_150_6 = var_150_4 <= 0 and var_150_1 or var_150_1 * (var_150_5 / var_150_4)

				if var_150_6 > 0 and var_150_1 < var_150_6 then
					arg_147_1.talkMaxDuration = var_150_6

					if var_150_6 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_6 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_3
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_7 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_7 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_7

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_7 and arg_147_1.time_ < var_150_0 + var_150_7 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play114182037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 114182037
		arg_151_1.duration_ = 3.8

		local var_151_0 = {
			ja = 2.8,
			ko = 2.733,
			zh = 3.8,
			en = 2.7
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
				arg_151_0:Play114182038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action1_1")
			end

			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_154_2 = arg_151_1.actors_["1067ui_story"].transform
			local var_154_3 = 0

			if var_154_3 < arg_151_1.time_ and arg_151_1.time_ <= var_154_3 + arg_154_0 then
				arg_151_1.var_.moveOldPos1067ui_story = var_154_2.localPosition
			end

			local var_154_4 = 0.001

			if var_154_3 <= arg_151_1.time_ and arg_151_1.time_ < var_154_3 + var_154_4 then
				local var_154_5 = (arg_151_1.time_ - var_154_3) / var_154_4
				local var_154_6 = Vector3.New(0, -1.06, -6.2)

				var_154_2.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1067ui_story, var_154_6, var_154_5)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_2.position

				var_154_2.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_2.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_2.localEulerAngles = var_154_8
			end

			if arg_151_1.time_ >= var_154_3 + var_154_4 and arg_151_1.time_ < var_154_3 + var_154_4 + arg_154_0 then
				var_154_2.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_154_9 = manager.ui.mainCamera.transform.position - var_154_2.position

				var_154_2.forward = Vector3.New(var_154_9.x, var_154_9.y, var_154_9.z)

				local var_154_10 = var_154_2.localEulerAngles

				var_154_10.z = 0
				var_154_10.x = 0
				var_154_2.localEulerAngles = var_154_10
			end

			local var_154_11 = arg_151_1.actors_["1067ui_story"]
			local var_154_12 = 0

			if var_154_12 < arg_151_1.time_ and arg_151_1.time_ <= var_154_12 + arg_154_0 and arg_151_1.var_.characterEffect1067ui_story == nil then
				arg_151_1.var_.characterEffect1067ui_story = var_154_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_13 = 0.2

			if var_154_12 <= arg_151_1.time_ and arg_151_1.time_ < var_154_12 + var_154_13 then
				local var_154_14 = (arg_151_1.time_ - var_154_12) / var_154_13

				if arg_151_1.var_.characterEffect1067ui_story then
					arg_151_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_12 + var_154_13 and arg_151_1.time_ < var_154_12 + var_154_13 + arg_154_0 and arg_151_1.var_.characterEffect1067ui_story then
				arg_151_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_154_15 = 0
			local var_154_16 = 0.25

			if var_154_15 < arg_151_1.time_ and arg_151_1.time_ <= var_154_15 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_17 = arg_151_1:FormatText(StoryNameCfg[206].name)

				arg_151_1.leftNameTxt_.text = var_154_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_18 = arg_151_1:GetWordFromCfg(114182037)
				local var_154_19 = arg_151_1:FormatText(var_154_18.content)

				arg_151_1.text_.text = var_154_19

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_20 = 10
				local var_154_21 = utf8.len(var_154_19)
				local var_154_22 = var_154_20 <= 0 and var_154_16 or var_154_16 * (var_154_21 / var_154_20)

				if var_154_22 > 0 and var_154_16 < var_154_22 then
					arg_151_1.talkMaxDuration = var_154_22

					if var_154_22 + var_154_15 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_22 + var_154_15
					end
				end

				arg_151_1.text_.text = var_154_19
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182037", "story_v_out_114182.awb") ~= 0 then
					local var_154_23 = manager.audio:GetVoiceLength("story_v_out_114182", "114182037", "story_v_out_114182.awb") / 1000

					if var_154_23 + var_154_15 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_23 + var_154_15
					end

					if var_154_18.prefab_name ~= "" and arg_151_1.actors_[var_154_18.prefab_name] ~= nil then
						local var_154_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_18.prefab_name].transform, "story_v_out_114182", "114182037", "story_v_out_114182.awb")

						arg_151_1:RecordAudio("114182037", var_154_24)
						arg_151_1:RecordAudio("114182037", var_154_24)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_114182", "114182037", "story_v_out_114182.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_114182", "114182037", "story_v_out_114182.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_25 = math.max(var_154_16, arg_151_1.talkMaxDuration)

			if var_154_15 <= arg_151_1.time_ and arg_151_1.time_ < var_154_15 + var_154_25 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_15) / var_154_25

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_15 + var_154_25 and arg_151_1.time_ < var_154_15 + var_154_25 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play114182038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 114182038
		arg_155_1.duration_ = 3.266

		local var_155_0 = {
			ja = 3.2,
			ko = 2.566,
			zh = 2.8,
			en = 3.266
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
				arg_155_0:Play114182039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1067ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1067ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(0, 100, 0)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1067ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(0, 100, 0)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = 0
			local var_158_10 = 0.3

			if var_158_9 < arg_155_1.time_ and arg_155_1.time_ <= var_158_9 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_11 = arg_155_1:FormatText(StoryNameCfg[210].name)

				arg_155_1.leftNameTxt_.text = var_158_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, true)
				arg_155_1.iconController_:SetSelectedState("hero")

				arg_155_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2049")

				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_12 = arg_155_1:GetWordFromCfg(114182038)
				local var_158_13 = arg_155_1:FormatText(var_158_12.content)

				arg_155_1.text_.text = var_158_13

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_14 = 12
				local var_158_15 = utf8.len(var_158_13)
				local var_158_16 = var_158_14 <= 0 and var_158_10 or var_158_10 * (var_158_15 / var_158_14)

				if var_158_16 > 0 and var_158_10 < var_158_16 then
					arg_155_1.talkMaxDuration = var_158_16

					if var_158_16 + var_158_9 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_16 + var_158_9
					end
				end

				arg_155_1.text_.text = var_158_13
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182038", "story_v_out_114182.awb") ~= 0 then
					local var_158_17 = manager.audio:GetVoiceLength("story_v_out_114182", "114182038", "story_v_out_114182.awb") / 1000

					if var_158_17 + var_158_9 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_17 + var_158_9
					end

					if var_158_12.prefab_name ~= "" and arg_155_1.actors_[var_158_12.prefab_name] ~= nil then
						local var_158_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_12.prefab_name].transform, "story_v_out_114182", "114182038", "story_v_out_114182.awb")

						arg_155_1:RecordAudio("114182038", var_158_18)
						arg_155_1:RecordAudio("114182038", var_158_18)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_114182", "114182038", "story_v_out_114182.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_114182", "114182038", "story_v_out_114182.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_19 = math.max(var_158_10, arg_155_1.talkMaxDuration)

			if var_158_9 <= arg_155_1.time_ and arg_155_1.time_ < var_158_9 + var_158_19 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_9) / var_158_19

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_9 + var_158_19 and arg_155_1.time_ < var_158_9 + var_158_19 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play114182039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 114182039
		arg_159_1.duration_ = 2.333

		local var_159_0 = {
			ja = 1.733,
			ko = 2.333,
			zh = 1.933,
			en = 2
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
				arg_159_0:Play114182040(arg_159_1)
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

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[213].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, true)
				arg_159_1.iconController_:SetSelectedState("hero")

				arg_159_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2050")

				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(114182039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182039", "story_v_out_114182.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_114182", "114182039", "story_v_out_114182.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_114182", "114182039", "story_v_out_114182.awb")

						arg_159_1:RecordAudio("114182039", var_162_9)
						arg_159_1:RecordAudio("114182039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_114182", "114182039", "story_v_out_114182.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_114182", "114182039", "story_v_out_114182.awb")
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
	Play114182040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 114182040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play114182041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.9

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_2 = arg_163_1:GetWordFromCfg(114182040)
				local var_166_3 = arg_163_1:FormatText(var_166_2.content)

				arg_163_1.text_.text = var_166_3

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_4 = 36
				local var_166_5 = utf8.len(var_166_3)
				local var_166_6 = var_166_4 <= 0 and var_166_1 or var_166_1 * (var_166_5 / var_166_4)

				if var_166_6 > 0 and var_166_1 < var_166_6 then
					arg_163_1.talkMaxDuration = var_166_6

					if var_166_6 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_6 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_3
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_7 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_7 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_7

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_7 and arg_163_1.time_ < var_166_0 + var_166_7 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play114182041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 114182041
		arg_167_1.duration_ = 3

		local var_167_0 = {
			ja = 3,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_167_0:Play114182042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_170_1 = arg_167_1.actors_["1067ui_story"].transform
			local var_170_2 = 0

			if var_170_2 < arg_167_1.time_ and arg_167_1.time_ <= var_170_2 + arg_170_0 then
				arg_167_1.var_.moveOldPos1067ui_story = var_170_1.localPosition
			end

			local var_170_3 = 0.001

			if var_170_2 <= arg_167_1.time_ and arg_167_1.time_ < var_170_2 + var_170_3 then
				local var_170_4 = (arg_167_1.time_ - var_170_2) / var_170_3
				local var_170_5 = Vector3.New(-0.7, -1.06, -6.2)

				var_170_1.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1067ui_story, var_170_5, var_170_4)

				local var_170_6 = manager.ui.mainCamera.transform.position - var_170_1.position

				var_170_1.forward = Vector3.New(var_170_6.x, var_170_6.y, var_170_6.z)

				local var_170_7 = var_170_1.localEulerAngles

				var_170_7.z = 0
				var_170_7.x = 0
				var_170_1.localEulerAngles = var_170_7
			end

			if arg_167_1.time_ >= var_170_2 + var_170_3 and arg_167_1.time_ < var_170_2 + var_170_3 + arg_170_0 then
				var_170_1.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_170_8 = manager.ui.mainCamera.transform.position - var_170_1.position

				var_170_1.forward = Vector3.New(var_170_8.x, var_170_8.y, var_170_8.z)

				local var_170_9 = var_170_1.localEulerAngles

				var_170_9.z = 0
				var_170_9.x = 0
				var_170_1.localEulerAngles = var_170_9
			end

			local var_170_10 = arg_167_1.actors_["1067ui_story"]
			local var_170_11 = 0

			if var_170_11 < arg_167_1.time_ and arg_167_1.time_ <= var_170_11 + arg_170_0 and arg_167_1.var_.characterEffect1067ui_story == nil then
				arg_167_1.var_.characterEffect1067ui_story = var_170_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_12 = 0.2

			if var_170_11 <= arg_167_1.time_ and arg_167_1.time_ < var_170_11 + var_170_12 then
				local var_170_13 = (arg_167_1.time_ - var_170_11) / var_170_12

				if arg_167_1.var_.characterEffect1067ui_story then
					arg_167_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_11 + var_170_12 and arg_167_1.time_ < var_170_11 + var_170_12 + arg_170_0 and arg_167_1.var_.characterEffect1067ui_story then
				arg_167_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 then
				arg_167_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action1_1")
			end

			local var_170_15 = 0
			local var_170_16 = 0.2

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_17 = arg_167_1:FormatText(StoryNameCfg[206].name)

				arg_167_1.leftNameTxt_.text = var_170_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_18 = arg_167_1:GetWordFromCfg(114182041)
				local var_170_19 = arg_167_1:FormatText(var_170_18.content)

				arg_167_1.text_.text = var_170_19

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_20 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182041", "story_v_out_114182.awb") ~= 0 then
					local var_170_23 = manager.audio:GetVoiceLength("story_v_out_114182", "114182041", "story_v_out_114182.awb") / 1000

					if var_170_23 + var_170_15 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_23 + var_170_15
					end

					if var_170_18.prefab_name ~= "" and arg_167_1.actors_[var_170_18.prefab_name] ~= nil then
						local var_170_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_18.prefab_name].transform, "story_v_out_114182", "114182041", "story_v_out_114182.awb")

						arg_167_1:RecordAudio("114182041", var_170_24)
						arg_167_1:RecordAudio("114182041", var_170_24)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_114182", "114182041", "story_v_out_114182.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_114182", "114182041", "story_v_out_114182.awb")
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
	Play114182042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 114182042
		arg_171_1.duration_ = 6.333

		local var_171_0 = {
			ja = 6.333,
			ko = 4.6,
			zh = 3.3,
			en = 3.166
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
				arg_171_0:Play114182043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1067ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect1067ui_story == nil then
				arg_171_1.var_.characterEffect1067ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.2

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect1067ui_story then
					local var_174_4 = Mathf.Lerp(0, 0.5, var_174_3)

					arg_171_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1067ui_story.fillRatio = var_174_4
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect1067ui_story then
				local var_174_5 = 0.5

				arg_171_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1067ui_story.fillRatio = var_174_5
			end

			local var_174_6 = arg_171_1.actors_["1042ui_story"].transform
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 then
				arg_171_1.var_.moveOldPos1042ui_story = var_174_6.localPosition
			end

			local var_174_8 = 0.001

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_8 then
				local var_174_9 = (arg_171_1.time_ - var_174_7) / var_174_8
				local var_174_10 = Vector3.New(0.7, -1.06, -6.2)

				var_174_6.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1042ui_story, var_174_10, var_174_9)

				local var_174_11 = manager.ui.mainCamera.transform.position - var_174_6.position

				var_174_6.forward = Vector3.New(var_174_11.x, var_174_11.y, var_174_11.z)

				local var_174_12 = var_174_6.localEulerAngles

				var_174_12.z = 0
				var_174_12.x = 0
				var_174_6.localEulerAngles = var_174_12
			end

			if arg_171_1.time_ >= var_174_7 + var_174_8 and arg_171_1.time_ < var_174_7 + var_174_8 + arg_174_0 then
				var_174_6.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_174_13 = manager.ui.mainCamera.transform.position - var_174_6.position

				var_174_6.forward = Vector3.New(var_174_13.x, var_174_13.y, var_174_13.z)

				local var_174_14 = var_174_6.localEulerAngles

				var_174_14.z = 0
				var_174_14.x = 0
				var_174_6.localEulerAngles = var_174_14
			end

			local var_174_15 = 0

			if var_174_15 < arg_171_1.time_ and arg_171_1.time_ <= var_174_15 + arg_174_0 then
				arg_171_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action1_1")
			end

			local var_174_16 = 0

			if var_174_16 < arg_171_1.time_ and arg_171_1.time_ <= var_174_16 + arg_174_0 then
				arg_171_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_174_17 = arg_171_1.actors_["1042ui_story"]
			local var_174_18 = 0

			if var_174_18 < arg_171_1.time_ and arg_171_1.time_ <= var_174_18 + arg_174_0 and arg_171_1.var_.characterEffect1042ui_story == nil then
				arg_171_1.var_.characterEffect1042ui_story = var_174_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_19 = 0.2

			if var_174_18 <= arg_171_1.time_ and arg_171_1.time_ < var_174_18 + var_174_19 then
				local var_174_20 = (arg_171_1.time_ - var_174_18) / var_174_19

				if arg_171_1.var_.characterEffect1042ui_story then
					arg_171_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_18 + var_174_19 and arg_171_1.time_ < var_174_18 + var_174_19 + arg_174_0 and arg_171_1.var_.characterEffect1042ui_story then
				arg_171_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_174_21 = 0
			local var_174_22 = 0.35

			if var_174_21 < arg_171_1.time_ and arg_171_1.time_ <= var_174_21 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_23 = arg_171_1:FormatText(StoryNameCfg[205].name)

				arg_171_1.leftNameTxt_.text = var_174_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_24 = arg_171_1:GetWordFromCfg(114182042)
				local var_174_25 = arg_171_1:FormatText(var_174_24.content)

				arg_171_1.text_.text = var_174_25

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_26 = 14
				local var_174_27 = utf8.len(var_174_25)
				local var_174_28 = var_174_26 <= 0 and var_174_22 or var_174_22 * (var_174_27 / var_174_26)

				if var_174_28 > 0 and var_174_22 < var_174_28 then
					arg_171_1.talkMaxDuration = var_174_28

					if var_174_28 + var_174_21 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_28 + var_174_21
					end
				end

				arg_171_1.text_.text = var_174_25
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182042", "story_v_out_114182.awb") ~= 0 then
					local var_174_29 = manager.audio:GetVoiceLength("story_v_out_114182", "114182042", "story_v_out_114182.awb") / 1000

					if var_174_29 + var_174_21 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_29 + var_174_21
					end

					if var_174_24.prefab_name ~= "" and arg_171_1.actors_[var_174_24.prefab_name] ~= nil then
						local var_174_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_24.prefab_name].transform, "story_v_out_114182", "114182042", "story_v_out_114182.awb")

						arg_171_1:RecordAudio("114182042", var_174_30)
						arg_171_1:RecordAudio("114182042", var_174_30)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_114182", "114182042", "story_v_out_114182.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_114182", "114182042", "story_v_out_114182.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_31 = math.max(var_174_22, arg_171_1.talkMaxDuration)

			if var_174_21 <= arg_171_1.time_ and arg_171_1.time_ < var_174_21 + var_174_31 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_21) / var_174_31

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_21 + var_174_31 and arg_171_1.time_ < var_174_21 + var_174_31 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play114182043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 114182043
		arg_175_1.duration_ = 9

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play114182044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_1 = 2

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_1 then
				local var_178_2 = (arg_175_1.time_ - var_178_0) / var_178_1
				local var_178_3 = Color.New(0, 0, 0)

				var_178_3.a = Mathf.Lerp(0, 1, var_178_2)
				arg_175_1.mask_.color = var_178_3
			end

			if arg_175_1.time_ >= var_178_0 + var_178_1 and arg_175_1.time_ < var_178_0 + var_178_1 + arg_178_0 then
				local var_178_4 = Color.New(0, 0, 0)

				var_178_4.a = 1
				arg_175_1.mask_.color = var_178_4
			end

			local var_178_5 = 2

			if var_178_5 < arg_175_1.time_ and arg_175_1.time_ <= var_178_5 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_6 = 2

			if var_178_5 <= arg_175_1.time_ and arg_175_1.time_ < var_178_5 + var_178_6 then
				local var_178_7 = (arg_175_1.time_ - var_178_5) / var_178_6
				local var_178_8 = Color.New(0, 0, 0)

				var_178_8.a = Mathf.Lerp(1, 0, var_178_7)
				arg_175_1.mask_.color = var_178_8
			end

			if arg_175_1.time_ >= var_178_5 + var_178_6 and arg_175_1.time_ < var_178_5 + var_178_6 + arg_178_0 then
				local var_178_9 = Color.New(0, 0, 0)
				local var_178_10 = 0

				arg_175_1.mask_.enabled = false
				var_178_9.a = var_178_10
				arg_175_1.mask_.color = var_178_9
			end

			local var_178_11 = arg_175_1.actors_["1042ui_story"].transform
			local var_178_12 = 1.966

			if var_178_12 < arg_175_1.time_ and arg_175_1.time_ <= var_178_12 + arg_178_0 then
				arg_175_1.var_.moveOldPos1042ui_story = var_178_11.localPosition
			end

			local var_178_13 = 0.001

			if var_178_12 <= arg_175_1.time_ and arg_175_1.time_ < var_178_12 + var_178_13 then
				local var_178_14 = (arg_175_1.time_ - var_178_12) / var_178_13
				local var_178_15 = Vector3.New(0, 100, 0)

				var_178_11.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1042ui_story, var_178_15, var_178_14)

				local var_178_16 = manager.ui.mainCamera.transform.position - var_178_11.position

				var_178_11.forward = Vector3.New(var_178_16.x, var_178_16.y, var_178_16.z)

				local var_178_17 = var_178_11.localEulerAngles

				var_178_17.z = 0
				var_178_17.x = 0
				var_178_11.localEulerAngles = var_178_17
			end

			if arg_175_1.time_ >= var_178_12 + var_178_13 and arg_175_1.time_ < var_178_12 + var_178_13 + arg_178_0 then
				var_178_11.localPosition = Vector3.New(0, 100, 0)

				local var_178_18 = manager.ui.mainCamera.transform.position - var_178_11.position

				var_178_11.forward = Vector3.New(var_178_18.x, var_178_18.y, var_178_18.z)

				local var_178_19 = var_178_11.localEulerAngles

				var_178_19.z = 0
				var_178_19.x = 0
				var_178_11.localEulerAngles = var_178_19
			end

			local var_178_20 = arg_175_1.actors_["1067ui_story"].transform
			local var_178_21 = 1.966

			if var_178_21 < arg_175_1.time_ and arg_175_1.time_ <= var_178_21 + arg_178_0 then
				arg_175_1.var_.moveOldPos1067ui_story = var_178_20.localPosition
			end

			local var_178_22 = 0.001

			if var_178_21 <= arg_175_1.time_ and arg_175_1.time_ < var_178_21 + var_178_22 then
				local var_178_23 = (arg_175_1.time_ - var_178_21) / var_178_22
				local var_178_24 = Vector3.New(0, 100, 0)

				var_178_20.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1067ui_story, var_178_24, var_178_23)

				local var_178_25 = manager.ui.mainCamera.transform.position - var_178_20.position

				var_178_20.forward = Vector3.New(var_178_25.x, var_178_25.y, var_178_25.z)

				local var_178_26 = var_178_20.localEulerAngles

				var_178_26.z = 0
				var_178_26.x = 0
				var_178_20.localEulerAngles = var_178_26
			end

			if arg_175_1.time_ >= var_178_21 + var_178_22 and arg_175_1.time_ < var_178_21 + var_178_22 + arg_178_0 then
				var_178_20.localPosition = Vector3.New(0, 100, 0)

				local var_178_27 = manager.ui.mainCamera.transform.position - var_178_20.position

				var_178_20.forward = Vector3.New(var_178_27.x, var_178_27.y, var_178_27.z)

				local var_178_28 = var_178_20.localEulerAngles

				var_178_28.z = 0
				var_178_28.x = 0
				var_178_20.localEulerAngles = var_178_28
			end

			if arg_175_1.frameCnt_ <= 1 then
				arg_175_1.dialog_:SetActive(false)
			end

			local var_178_29 = 4
			local var_178_30 = 0.725

			if var_178_29 < arg_175_1.time_ and arg_175_1.time_ <= var_178_29 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0

				arg_175_1.dialog_:SetActive(true)

				local var_178_31 = LeanTween.value(arg_175_1.dialog_, 0, 1, 0.3)

				var_178_31:setOnUpdate(LuaHelper.FloatAction(function(arg_179_0)
					arg_175_1.dialogCg_.alpha = arg_179_0
				end))
				var_178_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_175_1.dialog_)
					var_178_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_175_1.duration_ = arg_175_1.duration_ + 0.3

				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_32 = arg_175_1:GetWordFromCfg(114182043)
				local var_178_33 = arg_175_1:FormatText(var_178_32.content)

				arg_175_1.text_.text = var_178_33

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_34 = 29
				local var_178_35 = utf8.len(var_178_33)
				local var_178_36 = var_178_34 <= 0 and var_178_30 or var_178_30 * (var_178_35 / var_178_34)

				if var_178_36 > 0 and var_178_30 < var_178_36 then
					arg_175_1.talkMaxDuration = var_178_36
					var_178_29 = var_178_29 + 0.3

					if var_178_36 + var_178_29 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_36 + var_178_29
					end
				end

				arg_175_1.text_.text = var_178_33
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_37 = var_178_29 + 0.3
			local var_178_38 = math.max(var_178_30, arg_175_1.talkMaxDuration)

			if var_178_37 <= arg_175_1.time_ and arg_175_1.time_ < var_178_37 + var_178_38 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_37) / var_178_38

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_37 + var_178_38 and arg_175_1.time_ < var_178_37 + var_178_38 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play114182044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 114182044
		arg_181_1.duration_ = 2.833

		local var_181_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 2.833,
			en = 2.366
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
				arg_181_0:Play114182045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = "6046_story"

			if arg_181_1.actors_[var_184_0] == nil then
				local var_184_1 = Object.Instantiate(Asset.Load("Char/" .. var_184_0), arg_181_1.stage_.transform)

				var_184_1.name = var_184_0
				var_184_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_181_1.actors_[var_184_0] = var_184_1

				local var_184_2 = var_184_1:GetComponentInChildren(typeof(CharacterEffect))

				var_184_2.enabled = true

				local var_184_3 = GameObjectTools.GetOrAddComponent(var_184_1, typeof(DynamicBoneHelper))

				if var_184_3 then
					var_184_3:EnableDynamicBone(false)
				end

				arg_181_1:ShowWeapon(var_184_2.transform, false)

				arg_181_1.var_[var_184_0 .. "Animator"] = var_184_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_181_1.var_[var_184_0 .. "Animator"].applyRootMotion = true
				arg_181_1.var_[var_184_0 .. "LipSync"] = var_184_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_184_4 = arg_181_1.actors_["6046_story"].transform
			local var_184_5 = 0

			if var_184_5 < arg_181_1.time_ and arg_181_1.time_ <= var_184_5 + arg_184_0 then
				arg_181_1.var_.moveOldPos6046_story = var_184_4.localPosition
			end

			local var_184_6 = 0.001

			if var_184_5 <= arg_181_1.time_ and arg_181_1.time_ < var_184_5 + var_184_6 then
				local var_184_7 = (arg_181_1.time_ - var_184_5) / var_184_6
				local var_184_8 = Vector3.New(-0.7, -0.5, -6.3)

				var_184_4.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos6046_story, var_184_8, var_184_7)

				local var_184_9 = manager.ui.mainCamera.transform.position - var_184_4.position

				var_184_4.forward = Vector3.New(var_184_9.x, var_184_9.y, var_184_9.z)

				local var_184_10 = var_184_4.localEulerAngles

				var_184_10.z = 0
				var_184_10.x = 0
				var_184_4.localEulerAngles = var_184_10
			end

			if arg_181_1.time_ >= var_184_5 + var_184_6 and arg_181_1.time_ < var_184_5 + var_184_6 + arg_184_0 then
				var_184_4.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_184_11 = manager.ui.mainCamera.transform.position - var_184_4.position

				var_184_4.forward = Vector3.New(var_184_11.x, var_184_11.y, var_184_11.z)

				local var_184_12 = var_184_4.localEulerAngles

				var_184_12.z = 0
				var_184_12.x = 0
				var_184_4.localEulerAngles = var_184_12
			end

			local var_184_13 = 0

			if var_184_13 < arg_181_1.time_ and arg_181_1.time_ <= var_184_13 + arg_184_0 then
				arg_181_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_184_14 = 0

			if var_184_14 < arg_181_1.time_ and arg_181_1.time_ <= var_184_14 + arg_184_0 then
				arg_181_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_184_15 = arg_181_1.actors_["6046_story"]
			local var_184_16 = 0

			if var_184_16 < arg_181_1.time_ and arg_181_1.time_ <= var_184_16 + arg_184_0 and arg_181_1.var_.characterEffect6046_story == nil then
				arg_181_1.var_.characterEffect6046_story = var_184_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_17 = 0.2

			if var_184_16 <= arg_181_1.time_ and arg_181_1.time_ < var_184_16 + var_184_17 then
				local var_184_18 = (arg_181_1.time_ - var_184_16) / var_184_17

				if arg_181_1.var_.characterEffect6046_story then
					arg_181_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_16 + var_184_17 and arg_181_1.time_ < var_184_16 + var_184_17 + arg_184_0 and arg_181_1.var_.characterEffect6046_story then
				arg_181_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_184_19 = "6045_story"

			if arg_181_1.actors_[var_184_19] == nil then
				local var_184_20 = Object.Instantiate(Asset.Load("Char/" .. var_184_19), arg_181_1.stage_.transform)

				var_184_20.name = var_184_19
				var_184_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_181_1.actors_[var_184_19] = var_184_20

				local var_184_21 = var_184_20:GetComponentInChildren(typeof(CharacterEffect))

				var_184_21.enabled = true

				local var_184_22 = GameObjectTools.GetOrAddComponent(var_184_20, typeof(DynamicBoneHelper))

				if var_184_22 then
					var_184_22:EnableDynamicBone(false)
				end

				arg_181_1:ShowWeapon(var_184_21.transform, false)

				arg_181_1.var_[var_184_19 .. "Animator"] = var_184_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_181_1.var_[var_184_19 .. "Animator"].applyRootMotion = true
				arg_181_1.var_[var_184_19 .. "LipSync"] = var_184_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_184_23 = arg_181_1.actors_["6045_story"].transform
			local var_184_24 = 0

			if var_184_24 < arg_181_1.time_ and arg_181_1.time_ <= var_184_24 + arg_184_0 then
				arg_181_1.var_.moveOldPos6045_story = var_184_23.localPosition
			end

			local var_184_25 = 0.001

			if var_184_24 <= arg_181_1.time_ and arg_181_1.time_ < var_184_24 + var_184_25 then
				local var_184_26 = (arg_181_1.time_ - var_184_24) / var_184_25
				local var_184_27 = Vector3.New(0.7, -0.5, -6.3)

				var_184_23.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos6045_story, var_184_27, var_184_26)

				local var_184_28 = manager.ui.mainCamera.transform.position - var_184_23.position

				var_184_23.forward = Vector3.New(var_184_28.x, var_184_28.y, var_184_28.z)

				local var_184_29 = var_184_23.localEulerAngles

				var_184_29.z = 0
				var_184_29.x = 0
				var_184_23.localEulerAngles = var_184_29
			end

			if arg_181_1.time_ >= var_184_24 + var_184_25 and arg_181_1.time_ < var_184_24 + var_184_25 + arg_184_0 then
				var_184_23.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_184_30 = manager.ui.mainCamera.transform.position - var_184_23.position

				var_184_23.forward = Vector3.New(var_184_30.x, var_184_30.y, var_184_30.z)

				local var_184_31 = var_184_23.localEulerAngles

				var_184_31.z = 0
				var_184_31.x = 0
				var_184_23.localEulerAngles = var_184_31
			end

			local var_184_32 = 0

			if var_184_32 < arg_181_1.time_ and arg_181_1.time_ <= var_184_32 + arg_184_0 then
				arg_181_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_184_33 = 0
			local var_184_34 = 0.175

			if var_184_33 < arg_181_1.time_ and arg_181_1.time_ <= var_184_33 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_35 = arg_181_1:FormatText(StoryNameCfg[214].name)

				arg_181_1.leftNameTxt_.text = var_184_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_36 = arg_181_1:GetWordFromCfg(114182044)
				local var_184_37 = arg_181_1:FormatText(var_184_36.content)

				arg_181_1.text_.text = var_184_37

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_38 = 7
				local var_184_39 = utf8.len(var_184_37)
				local var_184_40 = var_184_38 <= 0 and var_184_34 or var_184_34 * (var_184_39 / var_184_38)

				if var_184_40 > 0 and var_184_34 < var_184_40 then
					arg_181_1.talkMaxDuration = var_184_40

					if var_184_40 + var_184_33 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_40 + var_184_33
					end
				end

				arg_181_1.text_.text = var_184_37
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182044", "story_v_out_114182.awb") ~= 0 then
					local var_184_41 = manager.audio:GetVoiceLength("story_v_out_114182", "114182044", "story_v_out_114182.awb") / 1000

					if var_184_41 + var_184_33 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_41 + var_184_33
					end

					if var_184_36.prefab_name ~= "" and arg_181_1.actors_[var_184_36.prefab_name] ~= nil then
						local var_184_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_36.prefab_name].transform, "story_v_out_114182", "114182044", "story_v_out_114182.awb")

						arg_181_1:RecordAudio("114182044", var_184_42)
						arg_181_1:RecordAudio("114182044", var_184_42)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_114182", "114182044", "story_v_out_114182.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_114182", "114182044", "story_v_out_114182.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_43 = math.max(var_184_34, arg_181_1.talkMaxDuration)

			if var_184_33 <= arg_181_1.time_ and arg_181_1.time_ < var_184_33 + var_184_43 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_33) / var_184_43

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_33 + var_184_43 and arg_181_1.time_ < var_184_33 + var_184_43 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play114182045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 114182045
		arg_185_1.duration_ = 3.1

		local var_185_0 = {
			ja = 3.1,
			ko = 2.6,
			zh = 2.566,
			en = 2.733
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
				arg_185_0:Play114182046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["6046_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect6046_story == nil then
				arg_185_1.var_.characterEffect6046_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.2

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect6046_story then
					local var_188_4 = Mathf.Lerp(0, 0.5, var_188_3)

					arg_185_1.var_.characterEffect6046_story.fillFlat = true
					arg_185_1.var_.characterEffect6046_story.fillRatio = var_188_4
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect6046_story then
				local var_188_5 = 0.5

				arg_185_1.var_.characterEffect6046_story.fillFlat = true
				arg_185_1.var_.characterEffect6046_story.fillRatio = var_188_5
			end

			local var_188_6 = arg_185_1.actors_["6045_story"]
			local var_188_7 = 0

			if var_188_7 < arg_185_1.time_ and arg_185_1.time_ <= var_188_7 + arg_188_0 and arg_185_1.var_.characterEffect6045_story == nil then
				arg_185_1.var_.characterEffect6045_story = var_188_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_8 = 0.2

			if var_188_7 <= arg_185_1.time_ and arg_185_1.time_ < var_188_7 + var_188_8 then
				local var_188_9 = (arg_185_1.time_ - var_188_7) / var_188_8

				if arg_185_1.var_.characterEffect6045_story then
					local var_188_10 = Mathf.Lerp(0, 0.5, var_188_9)

					arg_185_1.var_.characterEffect6045_story.fillFlat = true
					arg_185_1.var_.characterEffect6045_story.fillRatio = var_188_10
				end
			end

			if arg_185_1.time_ >= var_188_7 + var_188_8 and arg_185_1.time_ < var_188_7 + var_188_8 + arg_188_0 and arg_185_1.var_.characterEffect6045_story then
				local var_188_11 = 0.5

				arg_185_1.var_.characterEffect6045_story.fillFlat = true
				arg_185_1.var_.characterEffect6045_story.fillRatio = var_188_11
			end

			local var_188_12 = 0
			local var_188_13 = 0.275

			if var_188_12 < arg_185_1.time_ and arg_185_1.time_ <= var_188_12 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_14 = arg_185_1:FormatText(StoryNameCfg[94].name)

				arg_185_1.leftNameTxt_.text = var_188_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, true)
				arg_185_1.iconController_:SetSelectedState("hero")

				arg_185_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038")

				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_15 = arg_185_1:GetWordFromCfg(114182045)
				local var_188_16 = arg_185_1:FormatText(var_188_15.content)

				arg_185_1.text_.text = var_188_16

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_17 = 11
				local var_188_18 = utf8.len(var_188_16)
				local var_188_19 = var_188_17 <= 0 and var_188_13 or var_188_13 * (var_188_18 / var_188_17)

				if var_188_19 > 0 and var_188_13 < var_188_19 then
					arg_185_1.talkMaxDuration = var_188_19

					if var_188_19 + var_188_12 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_19 + var_188_12
					end
				end

				arg_185_1.text_.text = var_188_16
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182045", "story_v_out_114182.awb") ~= 0 then
					local var_188_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182045", "story_v_out_114182.awb") / 1000

					if var_188_20 + var_188_12 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_20 + var_188_12
					end

					if var_188_15.prefab_name ~= "" and arg_185_1.actors_[var_188_15.prefab_name] ~= nil then
						local var_188_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_15.prefab_name].transform, "story_v_out_114182", "114182045", "story_v_out_114182.awb")

						arg_185_1:RecordAudio("114182045", var_188_21)
						arg_185_1:RecordAudio("114182045", var_188_21)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_114182", "114182045", "story_v_out_114182.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_114182", "114182045", "story_v_out_114182.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_22 = math.max(var_188_13, arg_185_1.talkMaxDuration)

			if var_188_12 <= arg_185_1.time_ and arg_185_1.time_ < var_188_12 + var_188_22 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_12) / var_188_22

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_12 + var_188_22 and arg_185_1.time_ < var_188_12 + var_188_22 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play114182046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 114182046
		arg_189_1.duration_ = 6.3

		local var_189_0 = {
			ja = 6.3,
			ko = 4.633,
			zh = 6.133,
			en = 5.9
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
				arg_189_0:Play114182047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["6045_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect6045_story == nil then
				arg_189_1.var_.characterEffect6045_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.2

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect6045_story then
					arg_189_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect6045_story then
				arg_189_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_192_4 = 0

			if var_192_4 < arg_189_1.time_ and arg_189_1.time_ <= var_192_4 + arg_192_0 then
				arg_189_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_1")
			end

			local var_192_5 = 0
			local var_192_6 = 0.4

			if var_192_5 < arg_189_1.time_ and arg_189_1.time_ <= var_192_5 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_7 = arg_189_1:FormatText(StoryNameCfg[215].name)

				arg_189_1.leftNameTxt_.text = var_192_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_8 = arg_189_1:GetWordFromCfg(114182046)
				local var_192_9 = arg_189_1:FormatText(var_192_8.content)

				arg_189_1.text_.text = var_192_9

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_10 = 16
				local var_192_11 = utf8.len(var_192_9)
				local var_192_12 = var_192_10 <= 0 and var_192_6 or var_192_6 * (var_192_11 / var_192_10)

				if var_192_12 > 0 and var_192_6 < var_192_12 then
					arg_189_1.talkMaxDuration = var_192_12

					if var_192_12 + var_192_5 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_12 + var_192_5
					end
				end

				arg_189_1.text_.text = var_192_9
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182046", "story_v_out_114182.awb") ~= 0 then
					local var_192_13 = manager.audio:GetVoiceLength("story_v_out_114182", "114182046", "story_v_out_114182.awb") / 1000

					if var_192_13 + var_192_5 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_13 + var_192_5
					end

					if var_192_8.prefab_name ~= "" and arg_189_1.actors_[var_192_8.prefab_name] ~= nil then
						local var_192_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_8.prefab_name].transform, "story_v_out_114182", "114182046", "story_v_out_114182.awb")

						arg_189_1:RecordAudio("114182046", var_192_14)
						arg_189_1:RecordAudio("114182046", var_192_14)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_114182", "114182046", "story_v_out_114182.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_114182", "114182046", "story_v_out_114182.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_15 = math.max(var_192_6, arg_189_1.talkMaxDuration)

			if var_192_5 <= arg_189_1.time_ and arg_189_1.time_ < var_192_5 + var_192_15 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_5) / var_192_15

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_5 + var_192_15 and arg_189_1.time_ < var_192_5 + var_192_15 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play114182047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 114182047
		arg_193_1.duration_ = 5.733

		local var_193_0 = {
			ja = 3.933,
			ko = 5.733,
			zh = 3.933,
			en = 4.3
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
				arg_193_0:Play114182048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["6045_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect6045_story == nil then
				arg_193_1.var_.characterEffect6045_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.2

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect6045_story then
					local var_196_4 = Mathf.Lerp(0, 0.5, var_196_3)

					arg_193_1.var_.characterEffect6045_story.fillFlat = true
					arg_193_1.var_.characterEffect6045_story.fillRatio = var_196_4
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect6045_story then
				local var_196_5 = 0.5

				arg_193_1.var_.characterEffect6045_story.fillFlat = true
				arg_193_1.var_.characterEffect6045_story.fillRatio = var_196_5
			end

			local var_196_6 = 0
			local var_196_7 = 0.525

			if var_196_6 < arg_193_1.time_ and arg_193_1.time_ <= var_196_6 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_8 = arg_193_1:FormatText(StoryNameCfg[94].name)

				arg_193_1.leftNameTxt_.text = var_196_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, true)
				arg_193_1.iconController_:SetSelectedState("hero")

				arg_193_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_7")

				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_9 = arg_193_1:GetWordFromCfg(114182047)
				local var_196_10 = arg_193_1:FormatText(var_196_9.content)

				arg_193_1.text_.text = var_196_10

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_11 = 21
				local var_196_12 = utf8.len(var_196_10)
				local var_196_13 = var_196_11 <= 0 and var_196_7 or var_196_7 * (var_196_12 / var_196_11)

				if var_196_13 > 0 and var_196_7 < var_196_13 then
					arg_193_1.talkMaxDuration = var_196_13

					if var_196_13 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_13 + var_196_6
					end
				end

				arg_193_1.text_.text = var_196_10
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182047", "story_v_out_114182.awb") ~= 0 then
					local var_196_14 = manager.audio:GetVoiceLength("story_v_out_114182", "114182047", "story_v_out_114182.awb") / 1000

					if var_196_14 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_14 + var_196_6
					end

					if var_196_9.prefab_name ~= "" and arg_193_1.actors_[var_196_9.prefab_name] ~= nil then
						local var_196_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_9.prefab_name].transform, "story_v_out_114182", "114182047", "story_v_out_114182.awb")

						arg_193_1:RecordAudio("114182047", var_196_15)
						arg_193_1:RecordAudio("114182047", var_196_15)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_114182", "114182047", "story_v_out_114182.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_114182", "114182047", "story_v_out_114182.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_16 = math.max(var_196_7, arg_193_1.talkMaxDuration)

			if var_196_6 <= arg_193_1.time_ and arg_193_1.time_ < var_196_6 + var_196_16 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_6) / var_196_16

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_6 + var_196_16 and arg_193_1.time_ < var_196_6 + var_196_16 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play114182048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 114182048
		arg_197_1.duration_ = 8.666

		local var_197_0 = {
			ja = 8.666,
			ko = 4.4,
			zh = 6.166,
			en = 5.033
		}
		local var_197_1 = manager.audio:GetLocalizationFlag()

		if var_197_0[var_197_1] ~= nil then
			arg_197_1.duration_ = var_197_0[var_197_1]
		end

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play114182049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["6045_story"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos6045_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(0, 100, 0)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos6045_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(0, 100, 0)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["6046_story"].transform
			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 then
				arg_197_1.var_.moveOldPos6046_story = var_200_9.localPosition
			end

			local var_200_11 = 0.001

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11
				local var_200_13 = Vector3.New(0, 100, 0)

				var_200_9.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos6046_story, var_200_13, var_200_12)

				local var_200_14 = manager.ui.mainCamera.transform.position - var_200_9.position

				var_200_9.forward = Vector3.New(var_200_14.x, var_200_14.y, var_200_14.z)

				local var_200_15 = var_200_9.localEulerAngles

				var_200_15.z = 0
				var_200_15.x = 0
				var_200_9.localEulerAngles = var_200_15
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 then
				var_200_9.localPosition = Vector3.New(0, 100, 0)

				local var_200_16 = manager.ui.mainCamera.transform.position - var_200_9.position

				var_200_9.forward = Vector3.New(var_200_16.x, var_200_16.y, var_200_16.z)

				local var_200_17 = var_200_9.localEulerAngles

				var_200_17.z = 0
				var_200_17.x = 0
				var_200_9.localEulerAngles = var_200_17
			end

			local var_200_18 = 0
			local var_200_19 = 0.55

			if var_200_18 < arg_197_1.time_ and arg_197_1.time_ <= var_200_18 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_20 = arg_197_1:FormatText(StoryNameCfg[208].name)

				arg_197_1.leftNameTxt_.text = var_200_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, true)
				arg_197_1.iconController_:SetSelectedState("hero")

				arg_197_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_21 = arg_197_1:GetWordFromCfg(114182048)
				local var_200_22 = arg_197_1:FormatText(var_200_21.content)

				arg_197_1.text_.text = var_200_22

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_23 = 22
				local var_200_24 = utf8.len(var_200_22)
				local var_200_25 = var_200_23 <= 0 and var_200_19 or var_200_19 * (var_200_24 / var_200_23)

				if var_200_25 > 0 and var_200_19 < var_200_25 then
					arg_197_1.talkMaxDuration = var_200_25

					if var_200_25 + var_200_18 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_25 + var_200_18
					end
				end

				arg_197_1.text_.text = var_200_22
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182048", "story_v_out_114182.awb") ~= 0 then
					local var_200_26 = manager.audio:GetVoiceLength("story_v_out_114182", "114182048", "story_v_out_114182.awb") / 1000

					if var_200_26 + var_200_18 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_26 + var_200_18
					end

					if var_200_21.prefab_name ~= "" and arg_197_1.actors_[var_200_21.prefab_name] ~= nil then
						local var_200_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_21.prefab_name].transform, "story_v_out_114182", "114182048", "story_v_out_114182.awb")

						arg_197_1:RecordAudio("114182048", var_200_27)
						arg_197_1:RecordAudio("114182048", var_200_27)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_114182", "114182048", "story_v_out_114182.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_114182", "114182048", "story_v_out_114182.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_28 = math.max(var_200_19, arg_197_1.talkMaxDuration)

			if var_200_18 <= arg_197_1.time_ and arg_197_1.time_ < var_200_18 + var_200_28 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_18) / var_200_28

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_18 + var_200_28 and arg_197_1.time_ < var_200_18 + var_200_28 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play114182049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 114182049
		arg_201_1.duration_ = 8.066

		local var_201_0 = {
			ja = 8.066,
			ko = 5.1,
			zh = 3.9,
			en = 4.666
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
				arg_201_0:Play114182050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 0.45

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_2 = arg_201_1:FormatText(StoryNameCfg[212].name)

				arg_201_1.leftNameTxt_.text = var_204_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, true)
				arg_201_1.iconController_:SetSelectedState("hero")

				arg_201_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10006")

				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_3 = arg_201_1:GetWordFromCfg(114182049)
				local var_204_4 = arg_201_1:FormatText(var_204_3.content)

				arg_201_1.text_.text = var_204_4

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_5 = 18
				local var_204_6 = utf8.len(var_204_4)
				local var_204_7 = var_204_5 <= 0 and var_204_1 or var_204_1 * (var_204_6 / var_204_5)

				if var_204_7 > 0 and var_204_1 < var_204_7 then
					arg_201_1.talkMaxDuration = var_204_7

					if var_204_7 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_7 + var_204_0
					end
				end

				arg_201_1.text_.text = var_204_4
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182049", "story_v_out_114182.awb") ~= 0 then
					local var_204_8 = manager.audio:GetVoiceLength("story_v_out_114182", "114182049", "story_v_out_114182.awb") / 1000

					if var_204_8 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_8 + var_204_0
					end

					if var_204_3.prefab_name ~= "" and arg_201_1.actors_[var_204_3.prefab_name] ~= nil then
						local var_204_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_3.prefab_name].transform, "story_v_out_114182", "114182049", "story_v_out_114182.awb")

						arg_201_1:RecordAudio("114182049", var_204_9)
						arg_201_1:RecordAudio("114182049", var_204_9)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_114182", "114182049", "story_v_out_114182.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_114182", "114182049", "story_v_out_114182.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_10 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_10 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_10

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_10 and arg_201_1.time_ < var_204_0 + var_204_10 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play114182050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 114182050
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play114182051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.95

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, false)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_2 = arg_205_1:GetWordFromCfg(114182050)
				local var_208_3 = arg_205_1:FormatText(var_208_2.content)

				arg_205_1.text_.text = var_208_3

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_4 = 38
				local var_208_5 = utf8.len(var_208_3)
				local var_208_6 = var_208_4 <= 0 and var_208_1 or var_208_1 * (var_208_5 / var_208_4)

				if var_208_6 > 0 and var_208_1 < var_208_6 then
					arg_205_1.talkMaxDuration = var_208_6

					if var_208_6 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_6 + var_208_0
					end
				end

				arg_205_1.text_.text = var_208_3
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_7 = math.max(var_208_1, arg_205_1.talkMaxDuration)

			if var_208_0 <= arg_205_1.time_ and arg_205_1.time_ < var_208_0 + var_208_7 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_0) / var_208_7

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_0 + var_208_7 and arg_205_1.time_ < var_208_0 + var_208_7 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play114182051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 114182051
		arg_209_1.duration_ = 8.366

		local var_209_0 = {
			ja = 5.766,
			ko = 8.366,
			zh = 6.8,
			en = 8.266
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
				arg_209_0:Play114182052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1042ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1042ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, -1.06, -6.2)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1042ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = 0

			if var_212_9 < arg_209_1.time_ and arg_209_1.time_ <= var_212_9 + arg_212_0 then
				arg_209_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 then
				arg_209_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_212_11 = arg_209_1.actors_["1042ui_story"]
			local var_212_12 = 0

			if var_212_12 < arg_209_1.time_ and arg_209_1.time_ <= var_212_12 + arg_212_0 and arg_209_1.var_.characterEffect1042ui_story == nil then
				arg_209_1.var_.characterEffect1042ui_story = var_212_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_13 = 0.2

			if var_212_12 <= arg_209_1.time_ and arg_209_1.time_ < var_212_12 + var_212_13 then
				local var_212_14 = (arg_209_1.time_ - var_212_12) / var_212_13

				if arg_209_1.var_.characterEffect1042ui_story then
					arg_209_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_12 + var_212_13 and arg_209_1.time_ < var_212_12 + var_212_13 + arg_212_0 and arg_209_1.var_.characterEffect1042ui_story then
				arg_209_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_212_15 = 0
			local var_212_16 = 0.75

			if var_212_15 < arg_209_1.time_ and arg_209_1.time_ <= var_212_15 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_17 = arg_209_1:FormatText(StoryNameCfg[205].name)

				arg_209_1.leftNameTxt_.text = var_212_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_18 = arg_209_1:GetWordFromCfg(114182051)
				local var_212_19 = arg_209_1:FormatText(var_212_18.content)

				arg_209_1.text_.text = var_212_19

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_20 = 30
				local var_212_21 = utf8.len(var_212_19)
				local var_212_22 = var_212_20 <= 0 and var_212_16 or var_212_16 * (var_212_21 / var_212_20)

				if var_212_22 > 0 and var_212_16 < var_212_22 then
					arg_209_1.talkMaxDuration = var_212_22

					if var_212_22 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_22 + var_212_15
					end
				end

				arg_209_1.text_.text = var_212_19
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182051", "story_v_out_114182.awb") ~= 0 then
					local var_212_23 = manager.audio:GetVoiceLength("story_v_out_114182", "114182051", "story_v_out_114182.awb") / 1000

					if var_212_23 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_23 + var_212_15
					end

					if var_212_18.prefab_name ~= "" and arg_209_1.actors_[var_212_18.prefab_name] ~= nil then
						local var_212_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_18.prefab_name].transform, "story_v_out_114182", "114182051", "story_v_out_114182.awb")

						arg_209_1:RecordAudio("114182051", var_212_24)
						arg_209_1:RecordAudio("114182051", var_212_24)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_114182", "114182051", "story_v_out_114182.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_114182", "114182051", "story_v_out_114182.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_25 = math.max(var_212_16, arg_209_1.talkMaxDuration)

			if var_212_15 <= arg_209_1.time_ and arg_209_1.time_ < var_212_15 + var_212_25 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_15) / var_212_25

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_15 + var_212_25 and arg_209_1.time_ < var_212_15 + var_212_25 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play114182052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 114182052
		arg_213_1.duration_ = 4.999999999999

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play114182053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.mask_.enabled = true
				arg_213_1.mask_.raycastTarget = true

				arg_213_1:SetGaussion(false)
			end

			local var_216_1 = 2

			if var_216_0 <= arg_213_1.time_ and arg_213_1.time_ < var_216_0 + var_216_1 then
				local var_216_2 = (arg_213_1.time_ - var_216_0) / var_216_1
				local var_216_3 = Color.New(0, 0, 0)

				var_216_3.a = Mathf.Lerp(0, 1, var_216_2)
				arg_213_1.mask_.color = var_216_3
			end

			if arg_213_1.time_ >= var_216_0 + var_216_1 and arg_213_1.time_ < var_216_0 + var_216_1 + arg_216_0 then
				local var_216_4 = Color.New(0, 0, 0)

				var_216_4.a = 1
				arg_213_1.mask_.color = var_216_4
			end

			local var_216_5 = 2

			if var_216_5 < arg_213_1.time_ and arg_213_1.time_ <= var_216_5 + arg_216_0 then
				arg_213_1.mask_.enabled = true
				arg_213_1.mask_.raycastTarget = true

				arg_213_1:SetGaussion(false)
			end

			local var_216_6 = 1.966

			if var_216_5 <= arg_213_1.time_ and arg_213_1.time_ < var_216_5 + var_216_6 then
				local var_216_7 = (arg_213_1.time_ - var_216_5) / var_216_6
				local var_216_8 = Color.New(0, 0, 0)

				var_216_8.a = Mathf.Lerp(1, 0, var_216_7)
				arg_213_1.mask_.color = var_216_8
			end

			if arg_213_1.time_ >= var_216_5 + var_216_6 and arg_213_1.time_ < var_216_5 + var_216_6 + arg_216_0 then
				local var_216_9 = Color.New(0, 0, 0)
				local var_216_10 = 0

				arg_213_1.mask_.enabled = false
				var_216_9.a = var_216_10
				arg_213_1.mask_.color = var_216_9
			end

			local var_216_11 = arg_213_1.actors_["1042ui_story"].transform
			local var_216_12 = 1.966

			if var_216_12 < arg_213_1.time_ and arg_213_1.time_ <= var_216_12 + arg_216_0 then
				arg_213_1.var_.moveOldPos1042ui_story = var_216_11.localPosition
			end

			local var_216_13 = 0.001

			if var_216_12 <= arg_213_1.time_ and arg_213_1.time_ < var_216_12 + var_216_13 then
				local var_216_14 = (arg_213_1.time_ - var_216_12) / var_216_13
				local var_216_15 = Vector3.New(0, 100, 0)

				var_216_11.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1042ui_story, var_216_15, var_216_14)

				local var_216_16 = manager.ui.mainCamera.transform.position - var_216_11.position

				var_216_11.forward = Vector3.New(var_216_16.x, var_216_16.y, var_216_16.z)

				local var_216_17 = var_216_11.localEulerAngles

				var_216_17.z = 0
				var_216_17.x = 0
				var_216_11.localEulerAngles = var_216_17
			end

			if arg_213_1.time_ >= var_216_12 + var_216_13 and arg_213_1.time_ < var_216_12 + var_216_13 + arg_216_0 then
				var_216_11.localPosition = Vector3.New(0, 100, 0)

				local var_216_18 = manager.ui.mainCamera.transform.position - var_216_11.position

				var_216_11.forward = Vector3.New(var_216_18.x, var_216_18.y, var_216_18.z)

				local var_216_19 = var_216_11.localEulerAngles

				var_216_19.z = 0
				var_216_19.x = 0
				var_216_11.localEulerAngles = var_216_19
			end

			local var_216_20 = "STblack"

			if arg_213_1.bgs_[var_216_20] == nil then
				local var_216_21 = Object.Instantiate(arg_213_1.paintGo_)

				var_216_21:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_216_20)
				var_216_21.name = var_216_20
				var_216_21.transform.parent = arg_213_1.stage_.transform
				var_216_21.transform.localPosition = Vector3.New(0, 100, 0)
				arg_213_1.bgs_[var_216_20] = var_216_21
			end

			local var_216_22 = 2

			if var_216_22 < arg_213_1.time_ and arg_213_1.time_ <= var_216_22 + arg_216_0 then
				local var_216_23 = manager.ui.mainCamera.transform.localPosition
				local var_216_24 = Vector3.New(0, 0, 10) + Vector3.New(var_216_23.x, var_216_23.y, 0)
				local var_216_25 = arg_213_1.bgs_.STblack

				var_216_25.transform.localPosition = var_216_24
				var_216_25.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_216_26 = var_216_25:GetComponent("SpriteRenderer")

				if var_216_26 and var_216_26.sprite then
					local var_216_27 = (var_216_25.transform.localPosition - var_216_23).z
					local var_216_28 = manager.ui.mainCameraCom_
					local var_216_29 = 2 * var_216_27 * Mathf.Tan(var_216_28.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_216_30 = var_216_29 * var_216_28.aspect
					local var_216_31 = var_216_26.sprite.bounds.size.x
					local var_216_32 = var_216_26.sprite.bounds.size.y
					local var_216_33 = var_216_30 / var_216_31
					local var_216_34 = var_216_29 / var_216_32
					local var_216_35 = var_216_34 < var_216_33 and var_216_33 or var_216_34

					var_216_25.transform.localScale = Vector3.New(var_216_35, var_216_35, 0)
				end

				for iter_216_0, iter_216_1 in pairs(arg_213_1.bgs_) do
					if iter_216_0 ~= "STblack" then
						iter_216_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_216_36 = 2

			if var_216_36 < arg_213_1.time_ and arg_213_1.time_ <= var_216_36 + arg_216_0 then
				arg_213_1.fswbg_:SetActive(true)
				arg_213_1.dialog_:SetActive(false)

				arg_213_1.fswtw_.percent = 0

				local var_216_37 = arg_213_1:GetWordFromCfg(114182052)
				local var_216_38 = arg_213_1:FormatText(var_216_37.content)

				arg_213_1.fswt_.text = var_216_38

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.fswt_)

				arg_213_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_213_1.fswtw_:SetDirty()

				arg_213_1.typewritterCharCountI18N = 0

				SetActive(arg_213_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_213_1:ShowNextGo(false)
			end

			local var_216_39 = 2.01666666666667

			if var_216_39 < arg_213_1.time_ and arg_213_1.time_ <= var_216_39 + arg_216_0 then
				arg_213_1.var_.oldValueTypewriter = arg_213_1.fswtw_.percent

				arg_213_1:ShowNextGo(false)
			end

			local var_216_40 = 21
			local var_216_41 = 1.4
			local var_216_42 = arg_213_1:GetWordFromCfg(114182052)
			local var_216_43 = arg_213_1:FormatText(var_216_42.content)
			local var_216_44, var_216_45 = arg_213_1:GetPercentByPara(var_216_43, 1)

			if var_216_39 < arg_213_1.time_ and arg_213_1.time_ <= var_216_39 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0

				local var_216_46 = var_216_40 <= 0 and var_216_41 or var_216_41 * ((var_216_45 - arg_213_1.typewritterCharCountI18N) / var_216_40)

				if var_216_46 > 0 and var_216_41 < var_216_46 then
					arg_213_1.talkMaxDuration = var_216_46

					if var_216_46 + var_216_39 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_46 + var_216_39
					end
				end
			end

			local var_216_47 = 1.4
			local var_216_48 = math.max(var_216_47, arg_213_1.talkMaxDuration)

			if var_216_39 <= arg_213_1.time_ and arg_213_1.time_ < var_216_39 + var_216_48 then
				local var_216_49 = (arg_213_1.time_ - var_216_39) / var_216_48

				arg_213_1.fswtw_.percent = Mathf.Lerp(arg_213_1.var_.oldValueTypewriter, var_216_44, var_216_49)
				arg_213_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_213_1.fswtw_:SetDirty()
			end

			if arg_213_1.time_ >= var_216_39 + var_216_48 and arg_213_1.time_ < var_216_39 + var_216_48 + arg_216_0 then
				arg_213_1.fswtw_.percent = var_216_44

				arg_213_1.fswtw_:SetDirty()
				arg_213_1:ShowNextGo(true)

				arg_213_1.typewritterCharCountI18N = var_216_45
			end

			local var_216_50 = 2

			if var_216_50 < arg_213_1.time_ and arg_213_1.time_ <= var_216_50 + arg_216_0 then
				local var_216_51 = arg_213_1.fswbg_.transform:Find("textbox/adapt/content") or arg_213_1.fswbg_.transform:Find("textbox/content")
				local var_216_52 = var_216_51:GetComponent("Text")
				local var_216_53 = var_216_51:GetComponent("RectTransform")

				var_216_52.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_216_53.offsetMin = Vector2.New(0, 0)
				var_216_53.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play114182053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 114182053
		arg_217_1.duration_ = 16.666

		local var_217_0 = {
			ja = 16.6,
			ko = 16.666,
			zh = 15.3,
			en = 16.666
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
				arg_217_0:Play114182054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 3.8

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_220_1 = arg_217_1.actors_["1067ui_story"].transform
			local var_220_2 = 3.8

			if var_220_2 < arg_217_1.time_ and arg_217_1.time_ <= var_220_2 + arg_220_0 then
				arg_217_1.var_.moveOldPos1067ui_story = var_220_1.localPosition
			end

			local var_220_3 = 0.001

			if var_220_2 <= arg_217_1.time_ and arg_217_1.time_ < var_220_2 + var_220_3 then
				local var_220_4 = (arg_217_1.time_ - var_220_2) / var_220_3
				local var_220_5 = Vector3.New(-0.7, -1.06, -6.2)

				var_220_1.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1067ui_story, var_220_5, var_220_4)

				local var_220_6 = manager.ui.mainCamera.transform.position - var_220_1.position

				var_220_1.forward = Vector3.New(var_220_6.x, var_220_6.y, var_220_6.z)

				local var_220_7 = var_220_1.localEulerAngles

				var_220_7.z = 0
				var_220_7.x = 0
				var_220_1.localEulerAngles = var_220_7
			end

			if arg_217_1.time_ >= var_220_2 + var_220_3 and arg_217_1.time_ < var_220_2 + var_220_3 + arg_220_0 then
				var_220_1.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_220_8 = manager.ui.mainCamera.transform.position - var_220_1.position

				var_220_1.forward = Vector3.New(var_220_8.x, var_220_8.y, var_220_8.z)

				local var_220_9 = var_220_1.localEulerAngles

				var_220_9.z = 0
				var_220_9.x = 0
				var_220_1.localEulerAngles = var_220_9
			end

			local var_220_10 = arg_217_1.actors_["1067ui_story"]
			local var_220_11 = 3.8

			if var_220_11 < arg_217_1.time_ and arg_217_1.time_ <= var_220_11 + arg_220_0 and arg_217_1.var_.characterEffect1067ui_story == nil then
				arg_217_1.var_.characterEffect1067ui_story = var_220_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_12 = 0.2

			if var_220_11 <= arg_217_1.time_ and arg_217_1.time_ < var_220_11 + var_220_12 then
				local var_220_13 = (arg_217_1.time_ - var_220_11) / var_220_12

				if arg_217_1.var_.characterEffect1067ui_story then
					arg_217_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_11 + var_220_12 and arg_217_1.time_ < var_220_11 + var_220_12 + arg_220_0 and arg_217_1.var_.characterEffect1067ui_story then
				arg_217_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_220_14 = 3.8

			if var_220_14 < arg_217_1.time_ and arg_217_1.time_ <= var_220_14 + arg_220_0 then
				arg_217_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action3_1")
			end

			local var_220_15 = 0

			if var_220_15 < arg_217_1.time_ and arg_217_1.time_ <= var_220_15 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_16 = 2

			if var_220_15 <= arg_217_1.time_ and arg_217_1.time_ < var_220_15 + var_220_16 then
				local var_220_17 = (arg_217_1.time_ - var_220_15) / var_220_16
				local var_220_18 = Color.New(0, 0, 0)

				var_220_18.a = Mathf.Lerp(0, 1, var_220_17)
				arg_217_1.mask_.color = var_220_18
			end

			if arg_217_1.time_ >= var_220_15 + var_220_16 and arg_217_1.time_ < var_220_15 + var_220_16 + arg_220_0 then
				local var_220_19 = Color.New(0, 0, 0)

				var_220_19.a = 1
				arg_217_1.mask_.color = var_220_19
			end

			local var_220_20 = 2

			if var_220_20 < arg_217_1.time_ and arg_217_1.time_ <= var_220_20 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_21 = 1.966

			if var_220_20 <= arg_217_1.time_ and arg_217_1.time_ < var_220_20 + var_220_21 then
				local var_220_22 = (arg_217_1.time_ - var_220_20) / var_220_21
				local var_220_23 = Color.New(0, 0, 0)

				var_220_23.a = Mathf.Lerp(1, 0, var_220_22)
				arg_217_1.mask_.color = var_220_23
			end

			if arg_217_1.time_ >= var_220_20 + var_220_21 and arg_217_1.time_ < var_220_20 + var_220_21 + arg_220_0 then
				local var_220_24 = Color.New(0, 0, 0)
				local var_220_25 = 0

				arg_217_1.mask_.enabled = false
				var_220_24.a = var_220_25
				arg_217_1.mask_.color = var_220_24
			end

			local var_220_26 = 2

			if var_220_26 < arg_217_1.time_ and arg_217_1.time_ <= var_220_26 + arg_220_0 then
				local var_220_27 = manager.ui.mainCamera.transform.localPosition
				local var_220_28 = Vector3.New(0, 0, 10) + Vector3.New(var_220_27.x, var_220_27.y, 0)
				local var_220_29 = arg_217_1.bgs_.F04

				var_220_29.transform.localPosition = var_220_28
				var_220_29.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_220_30 = var_220_29:GetComponent("SpriteRenderer")

				if var_220_30 and var_220_30.sprite then
					local var_220_31 = (var_220_29.transform.localPosition - var_220_27).z
					local var_220_32 = manager.ui.mainCameraCom_
					local var_220_33 = 2 * var_220_31 * Mathf.Tan(var_220_32.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_220_34 = var_220_33 * var_220_32.aspect
					local var_220_35 = var_220_30.sprite.bounds.size.x
					local var_220_36 = var_220_30.sprite.bounds.size.y
					local var_220_37 = var_220_34 / var_220_35
					local var_220_38 = var_220_33 / var_220_36
					local var_220_39 = var_220_38 < var_220_37 and var_220_37 or var_220_38

					var_220_29.transform.localScale = Vector3.New(var_220_39, var_220_39, 0)
				end

				for iter_220_0, iter_220_1 in pairs(arg_217_1.bgs_) do
					if iter_220_0 ~= "F04" then
						iter_220_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_220_40 = 0

			if var_220_40 < arg_217_1.time_ and arg_217_1.time_ <= var_220_40 + arg_220_0 then
				arg_217_1.fswbg_:SetActive(false)
				arg_217_1.dialog_:SetActive(true)
				arg_217_1:ShowNextGo(false)
			end

			if arg_217_1.frameCnt_ <= 1 then
				arg_217_1.dialog_:SetActive(false)
			end

			local var_220_41 = 4
			local var_220_42 = 1.275

			if var_220_41 < arg_217_1.time_ and arg_217_1.time_ <= var_220_41 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0

				arg_217_1.dialog_:SetActive(true)

				local var_220_43 = LeanTween.value(arg_217_1.dialog_, 0, 1, 0.3)

				var_220_43:setOnUpdate(LuaHelper.FloatAction(function(arg_221_0)
					arg_217_1.dialogCg_.alpha = arg_221_0
				end))
				var_220_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_217_1.dialog_)
					var_220_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_217_1.duration_ = arg_217_1.duration_ + 0.3

				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_44 = arg_217_1:FormatText(StoryNameCfg[206].name)

				arg_217_1.leftNameTxt_.text = var_220_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_45 = arg_217_1:GetWordFromCfg(114182053)
				local var_220_46 = arg_217_1:FormatText(var_220_45.content)

				arg_217_1.text_.text = var_220_46

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_47 = 51
				local var_220_48 = utf8.len(var_220_46)
				local var_220_49 = var_220_47 <= 0 and var_220_42 or var_220_42 * (var_220_48 / var_220_47)

				if var_220_49 > 0 and var_220_42 < var_220_49 then
					arg_217_1.talkMaxDuration = var_220_49
					var_220_41 = var_220_41 + 0.3

					if var_220_49 + var_220_41 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_49 + var_220_41
					end
				end

				arg_217_1.text_.text = var_220_46
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182053", "story_v_out_114182.awb") ~= 0 then
					local var_220_50 = manager.audio:GetVoiceLength("story_v_out_114182", "114182053", "story_v_out_114182.awb") / 1000

					if var_220_50 + var_220_41 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_50 + var_220_41
					end

					if var_220_45.prefab_name ~= "" and arg_217_1.actors_[var_220_45.prefab_name] ~= nil then
						local var_220_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_45.prefab_name].transform, "story_v_out_114182", "114182053", "story_v_out_114182.awb")

						arg_217_1:RecordAudio("114182053", var_220_51)
						arg_217_1:RecordAudio("114182053", var_220_51)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_114182", "114182053", "story_v_out_114182.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_114182", "114182053", "story_v_out_114182.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_52 = var_220_41 + 0.3
			local var_220_53 = math.max(var_220_42, arg_217_1.talkMaxDuration)

			if var_220_52 <= arg_217_1.time_ and arg_217_1.time_ < var_220_52 + var_220_53 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_52) / var_220_53

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_52 + var_220_53 and arg_217_1.time_ < var_220_52 + var_220_53 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play114182054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 114182054
		arg_223_1.duration_ = 9.933

		local var_223_0 = {
			ja = 8.7,
			ko = 9.933,
			zh = 7.866,
			en = 9.5
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
				arg_223_0:Play114182055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1184ui_story"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1184ui_story = var_226_0.localPosition
			end

			local var_226_2 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2
				local var_226_4 = Vector3.New(0.7, -0.97, -6)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1184ui_story, var_226_4, var_226_3)

				local var_226_5 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_5.x, var_226_5.y, var_226_5.z)

				local var_226_6 = var_226_0.localEulerAngles

				var_226_6.z = 0
				var_226_6.x = 0
				var_226_0.localEulerAngles = var_226_6
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_226_7 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_7.x, var_226_7.y, var_226_7.z)

				local var_226_8 = var_226_0.localEulerAngles

				var_226_8.z = 0
				var_226_8.x = 0
				var_226_0.localEulerAngles = var_226_8
			end

			local var_226_9 = 0

			if var_226_9 < arg_223_1.time_ and arg_223_1.time_ <= var_226_9 + arg_226_0 then
				arg_223_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 then
				arg_223_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_226_11 = arg_223_1.actors_["1184ui_story"]
			local var_226_12 = 0

			if var_226_12 < arg_223_1.time_ and arg_223_1.time_ <= var_226_12 + arg_226_0 and arg_223_1.var_.characterEffect1184ui_story == nil then
				arg_223_1.var_.characterEffect1184ui_story = var_226_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_13 = 0.2

			if var_226_12 <= arg_223_1.time_ and arg_223_1.time_ < var_226_12 + var_226_13 then
				local var_226_14 = (arg_223_1.time_ - var_226_12) / var_226_13

				if arg_223_1.var_.characterEffect1184ui_story then
					arg_223_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_12 + var_226_13 and arg_223_1.time_ < var_226_12 + var_226_13 + arg_226_0 and arg_223_1.var_.characterEffect1184ui_story then
				arg_223_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_226_15 = arg_223_1.actors_["1067ui_story"]
			local var_226_16 = 0

			if var_226_16 < arg_223_1.time_ and arg_223_1.time_ <= var_226_16 + arg_226_0 and arg_223_1.var_.characterEffect1067ui_story == nil then
				arg_223_1.var_.characterEffect1067ui_story = var_226_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_17 = 0.2

			if var_226_16 <= arg_223_1.time_ and arg_223_1.time_ < var_226_16 + var_226_17 then
				local var_226_18 = (arg_223_1.time_ - var_226_16) / var_226_17

				if arg_223_1.var_.characterEffect1067ui_story then
					local var_226_19 = Mathf.Lerp(0, 0.5, var_226_18)

					arg_223_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1067ui_story.fillRatio = var_226_19
				end
			end

			if arg_223_1.time_ >= var_226_16 + var_226_17 and arg_223_1.time_ < var_226_16 + var_226_17 + arg_226_0 and arg_223_1.var_.characterEffect1067ui_story then
				local var_226_20 = 0.5

				arg_223_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1067ui_story.fillRatio = var_226_20
			end

			local var_226_21 = 0
			local var_226_22 = 0.9

			if var_226_21 < arg_223_1.time_ and arg_223_1.time_ <= var_226_21 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_23 = arg_223_1:FormatText(StoryNameCfg[6].name)

				arg_223_1.leftNameTxt_.text = var_226_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_24 = arg_223_1:GetWordFromCfg(114182054)
				local var_226_25 = arg_223_1:FormatText(var_226_24.content)

				arg_223_1.text_.text = var_226_25

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_26 = 36
				local var_226_27 = utf8.len(var_226_25)
				local var_226_28 = var_226_26 <= 0 and var_226_22 or var_226_22 * (var_226_27 / var_226_26)

				if var_226_28 > 0 and var_226_22 < var_226_28 then
					arg_223_1.talkMaxDuration = var_226_28

					if var_226_28 + var_226_21 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_28 + var_226_21
					end
				end

				arg_223_1.text_.text = var_226_25
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182054", "story_v_out_114182.awb") ~= 0 then
					local var_226_29 = manager.audio:GetVoiceLength("story_v_out_114182", "114182054", "story_v_out_114182.awb") / 1000

					if var_226_29 + var_226_21 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_29 + var_226_21
					end

					if var_226_24.prefab_name ~= "" and arg_223_1.actors_[var_226_24.prefab_name] ~= nil then
						local var_226_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_24.prefab_name].transform, "story_v_out_114182", "114182054", "story_v_out_114182.awb")

						arg_223_1:RecordAudio("114182054", var_226_30)
						arg_223_1:RecordAudio("114182054", var_226_30)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_114182", "114182054", "story_v_out_114182.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_114182", "114182054", "story_v_out_114182.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_31 = math.max(var_226_22, arg_223_1.talkMaxDuration)

			if var_226_21 <= arg_223_1.time_ and arg_223_1.time_ < var_226_21 + var_226_31 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_21) / var_226_31

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_21 + var_226_31 and arg_223_1.time_ < var_226_21 + var_226_31 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play114182055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 114182055
		arg_227_1.duration_ = 7.333

		local var_227_0 = {
			ja = 7.333,
			ko = 6.3,
			zh = 6.3,
			en = 5.966
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
				arg_227_0:Play114182056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_230_1 = arg_227_1.actors_["1067ui_story"]
			local var_230_2 = 0

			if var_230_2 < arg_227_1.time_ and arg_227_1.time_ <= var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1067ui_story == nil then
				arg_227_1.var_.characterEffect1067ui_story = var_230_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_3 = 0.2

			if var_230_2 <= arg_227_1.time_ and arg_227_1.time_ < var_230_2 + var_230_3 then
				local var_230_4 = (arg_227_1.time_ - var_230_2) / var_230_3

				if arg_227_1.var_.characterEffect1067ui_story then
					arg_227_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_2 + var_230_3 and arg_227_1.time_ < var_230_2 + var_230_3 + arg_230_0 and arg_227_1.var_.characterEffect1067ui_story then
				arg_227_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 then
				arg_227_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action3_2")
			end

			local var_230_6 = arg_227_1.actors_["1184ui_story"]
			local var_230_7 = 0

			if var_230_7 < arg_227_1.time_ and arg_227_1.time_ <= var_230_7 + arg_230_0 and arg_227_1.var_.characterEffect1184ui_story == nil then
				arg_227_1.var_.characterEffect1184ui_story = var_230_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_8 = 0.2

			if var_230_7 <= arg_227_1.time_ and arg_227_1.time_ < var_230_7 + var_230_8 then
				local var_230_9 = (arg_227_1.time_ - var_230_7) / var_230_8

				if arg_227_1.var_.characterEffect1184ui_story then
					local var_230_10 = Mathf.Lerp(0, 0.5, var_230_9)

					arg_227_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1184ui_story.fillRatio = var_230_10
				end
			end

			if arg_227_1.time_ >= var_230_7 + var_230_8 and arg_227_1.time_ < var_230_7 + var_230_8 + arg_230_0 and arg_227_1.var_.characterEffect1184ui_story then
				local var_230_11 = 0.5

				arg_227_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1184ui_story.fillRatio = var_230_11
			end

			local var_230_12 = 0
			local var_230_13 = 0.65

			if var_230_12 < arg_227_1.time_ and arg_227_1.time_ <= var_230_12 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_14 = arg_227_1:FormatText(StoryNameCfg[206].name)

				arg_227_1.leftNameTxt_.text = var_230_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_15 = arg_227_1:GetWordFromCfg(114182055)
				local var_230_16 = arg_227_1:FormatText(var_230_15.content)

				arg_227_1.text_.text = var_230_16

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_17 = 26
				local var_230_18 = utf8.len(var_230_16)
				local var_230_19 = var_230_17 <= 0 and var_230_13 or var_230_13 * (var_230_18 / var_230_17)

				if var_230_19 > 0 and var_230_13 < var_230_19 then
					arg_227_1.talkMaxDuration = var_230_19

					if var_230_19 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_19 + var_230_12
					end
				end

				arg_227_1.text_.text = var_230_16
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182055", "story_v_out_114182.awb") ~= 0 then
					local var_230_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182055", "story_v_out_114182.awb") / 1000

					if var_230_20 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_12
					end

					if var_230_15.prefab_name ~= "" and arg_227_1.actors_[var_230_15.prefab_name] ~= nil then
						local var_230_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_15.prefab_name].transform, "story_v_out_114182", "114182055", "story_v_out_114182.awb")

						arg_227_1:RecordAudio("114182055", var_230_21)
						arg_227_1:RecordAudio("114182055", var_230_21)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_114182", "114182055", "story_v_out_114182.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_114182", "114182055", "story_v_out_114182.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_22 = math.max(var_230_13, arg_227_1.talkMaxDuration)

			if var_230_12 <= arg_227_1.time_ and arg_227_1.time_ < var_230_12 + var_230_22 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_12) / var_230_22

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_12 + var_230_22 and arg_227_1.time_ < var_230_12 + var_230_22 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play114182056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 114182056
		arg_231_1.duration_ = 9.8

		local var_231_0 = {
			ja = 9.8,
			ko = 9.533,
			zh = 7.866,
			en = 6.666
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
				arg_231_0:Play114182057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1067ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1067ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0, 100, 0)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1067ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, 100, 0)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["1184ui_story"].transform
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 then
				arg_231_1.var_.moveOldPos1184ui_story = var_234_9.localPosition
			end

			local var_234_11 = 0.001

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11
				local var_234_13 = Vector3.New(0, 100, 0)

				var_234_9.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1184ui_story, var_234_13, var_234_12)

				local var_234_14 = manager.ui.mainCamera.transform.position - var_234_9.position

				var_234_9.forward = Vector3.New(var_234_14.x, var_234_14.y, var_234_14.z)

				local var_234_15 = var_234_9.localEulerAngles

				var_234_15.z = 0
				var_234_15.x = 0
				var_234_9.localEulerAngles = var_234_15
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 then
				var_234_9.localPosition = Vector3.New(0, 100, 0)

				local var_234_16 = manager.ui.mainCamera.transform.position - var_234_9.position

				var_234_9.forward = Vector3.New(var_234_16.x, var_234_16.y, var_234_16.z)

				local var_234_17 = var_234_9.localEulerAngles

				var_234_17.z = 0
				var_234_17.x = 0
				var_234_9.localEulerAngles = var_234_17
			end

			local var_234_18 = arg_231_1.actors_["1042ui_story"].transform
			local var_234_19 = 0

			if var_234_19 < arg_231_1.time_ and arg_231_1.time_ <= var_234_19 + arg_234_0 then
				arg_231_1.var_.moveOldPos1042ui_story = var_234_18.localPosition
			end

			local var_234_20 = 0.001

			if var_234_19 <= arg_231_1.time_ and arg_231_1.time_ < var_234_19 + var_234_20 then
				local var_234_21 = (arg_231_1.time_ - var_234_19) / var_234_20
				local var_234_22 = Vector3.New(-0.7, -1.06, -6.2)

				var_234_18.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1042ui_story, var_234_22, var_234_21)

				local var_234_23 = manager.ui.mainCamera.transform.position - var_234_18.position

				var_234_18.forward = Vector3.New(var_234_23.x, var_234_23.y, var_234_23.z)

				local var_234_24 = var_234_18.localEulerAngles

				var_234_24.z = 0
				var_234_24.x = 0
				var_234_18.localEulerAngles = var_234_24
			end

			if arg_231_1.time_ >= var_234_19 + var_234_20 and arg_231_1.time_ < var_234_19 + var_234_20 + arg_234_0 then
				var_234_18.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_234_25 = manager.ui.mainCamera.transform.position - var_234_18.position

				var_234_18.forward = Vector3.New(var_234_25.x, var_234_25.y, var_234_25.z)

				local var_234_26 = var_234_18.localEulerAngles

				var_234_26.z = 0
				var_234_26.x = 0
				var_234_18.localEulerAngles = var_234_26
			end

			local var_234_27 = 0

			if var_234_27 < arg_231_1.time_ and arg_231_1.time_ <= var_234_27 + arg_234_0 then
				arg_231_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action1_1")
			end

			local var_234_28 = 0

			if var_234_28 < arg_231_1.time_ and arg_231_1.time_ <= var_234_28 + arg_234_0 then
				arg_231_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_234_29 = arg_231_1.actors_["1042ui_story"]
			local var_234_30 = 0

			if var_234_30 < arg_231_1.time_ and arg_231_1.time_ <= var_234_30 + arg_234_0 and arg_231_1.var_.characterEffect1042ui_story == nil then
				arg_231_1.var_.characterEffect1042ui_story = var_234_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_31 = 0.2

			if var_234_30 <= arg_231_1.time_ and arg_231_1.time_ < var_234_30 + var_234_31 then
				local var_234_32 = (arg_231_1.time_ - var_234_30) / var_234_31

				if arg_231_1.var_.characterEffect1042ui_story then
					arg_231_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_30 + var_234_31 and arg_231_1.time_ < var_234_30 + var_234_31 + arg_234_0 and arg_231_1.var_.characterEffect1042ui_story then
				arg_231_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_234_33 = 0
			local var_234_34 = 0.925

			if var_234_33 < arg_231_1.time_ and arg_231_1.time_ <= var_234_33 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_35 = arg_231_1:FormatText(StoryNameCfg[205].name)

				arg_231_1.leftNameTxt_.text = var_234_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_36 = arg_231_1:GetWordFromCfg(114182056)
				local var_234_37 = arg_231_1:FormatText(var_234_36.content)

				arg_231_1.text_.text = var_234_37

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_38 = 37
				local var_234_39 = utf8.len(var_234_37)
				local var_234_40 = var_234_38 <= 0 and var_234_34 or var_234_34 * (var_234_39 / var_234_38)

				if var_234_40 > 0 and var_234_34 < var_234_40 then
					arg_231_1.talkMaxDuration = var_234_40

					if var_234_40 + var_234_33 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_40 + var_234_33
					end
				end

				arg_231_1.text_.text = var_234_37
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182056", "story_v_out_114182.awb") ~= 0 then
					local var_234_41 = manager.audio:GetVoiceLength("story_v_out_114182", "114182056", "story_v_out_114182.awb") / 1000

					if var_234_41 + var_234_33 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_41 + var_234_33
					end

					if var_234_36.prefab_name ~= "" and arg_231_1.actors_[var_234_36.prefab_name] ~= nil then
						local var_234_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_36.prefab_name].transform, "story_v_out_114182", "114182056", "story_v_out_114182.awb")

						arg_231_1:RecordAudio("114182056", var_234_42)
						arg_231_1:RecordAudio("114182056", var_234_42)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_114182", "114182056", "story_v_out_114182.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_114182", "114182056", "story_v_out_114182.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_43 = math.max(var_234_34, arg_231_1.talkMaxDuration)

			if var_234_33 <= arg_231_1.time_ and arg_231_1.time_ < var_234_33 + var_234_43 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_33) / var_234_43

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_33 + var_234_43 and arg_231_1.time_ < var_234_33 + var_234_43 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play114182057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 114182057
		arg_235_1.duration_ = 10.3

		local var_235_0 = {
			ja = 10.3,
			ko = 6.2,
			zh = 6.3,
			en = 5.9
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
				arg_235_0:Play114182058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1041ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1041ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(0.7, -1.11, -5.9)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1041ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = 0

			if var_238_9 < arg_235_1.time_ and arg_235_1.time_ <= var_238_9 + arg_238_0 then
				arg_235_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_238_10 = arg_235_1.actors_["1041ui_story"]
			local var_238_11 = 0

			if var_238_11 < arg_235_1.time_ and arg_235_1.time_ <= var_238_11 + arg_238_0 and arg_235_1.var_.characterEffect1041ui_story == nil then
				arg_235_1.var_.characterEffect1041ui_story = var_238_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_12 = 0.2

			if var_238_11 <= arg_235_1.time_ and arg_235_1.time_ < var_238_11 + var_238_12 then
				local var_238_13 = (arg_235_1.time_ - var_238_11) / var_238_12

				if arg_235_1.var_.characterEffect1041ui_story then
					arg_235_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_11 + var_238_12 and arg_235_1.time_ < var_238_11 + var_238_12 + arg_238_0 and arg_235_1.var_.characterEffect1041ui_story then
				arg_235_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				arg_235_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_238_15 = arg_235_1.actors_["1042ui_story"]
			local var_238_16 = 0

			if var_238_16 < arg_235_1.time_ and arg_235_1.time_ <= var_238_16 + arg_238_0 and arg_235_1.var_.characterEffect1042ui_story == nil then
				arg_235_1.var_.characterEffect1042ui_story = var_238_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_17 = 0.2

			if var_238_16 <= arg_235_1.time_ and arg_235_1.time_ < var_238_16 + var_238_17 then
				local var_238_18 = (arg_235_1.time_ - var_238_16) / var_238_17

				if arg_235_1.var_.characterEffect1042ui_story then
					local var_238_19 = Mathf.Lerp(0, 0.5, var_238_18)

					arg_235_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1042ui_story.fillRatio = var_238_19
				end
			end

			if arg_235_1.time_ >= var_238_16 + var_238_17 and arg_235_1.time_ < var_238_16 + var_238_17 + arg_238_0 and arg_235_1.var_.characterEffect1042ui_story then
				local var_238_20 = 0.5

				arg_235_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1042ui_story.fillRatio = var_238_20
			end

			local var_238_21 = 0
			local var_238_22 = 0.8

			if var_238_21 < arg_235_1.time_ and arg_235_1.time_ <= var_238_21 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_23 = arg_235_1:FormatText(StoryNameCfg[208].name)

				arg_235_1.leftNameTxt_.text = var_238_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_24 = arg_235_1:GetWordFromCfg(114182057)
				local var_238_25 = arg_235_1:FormatText(var_238_24.content)

				arg_235_1.text_.text = var_238_25

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_26 = 32
				local var_238_27 = utf8.len(var_238_25)
				local var_238_28 = var_238_26 <= 0 and var_238_22 or var_238_22 * (var_238_27 / var_238_26)

				if var_238_28 > 0 and var_238_22 < var_238_28 then
					arg_235_1.talkMaxDuration = var_238_28

					if var_238_28 + var_238_21 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_28 + var_238_21
					end
				end

				arg_235_1.text_.text = var_238_25
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182057", "story_v_out_114182.awb") ~= 0 then
					local var_238_29 = manager.audio:GetVoiceLength("story_v_out_114182", "114182057", "story_v_out_114182.awb") / 1000

					if var_238_29 + var_238_21 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_29 + var_238_21
					end

					if var_238_24.prefab_name ~= "" and arg_235_1.actors_[var_238_24.prefab_name] ~= nil then
						local var_238_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_24.prefab_name].transform, "story_v_out_114182", "114182057", "story_v_out_114182.awb")

						arg_235_1:RecordAudio("114182057", var_238_30)
						arg_235_1:RecordAudio("114182057", var_238_30)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_114182", "114182057", "story_v_out_114182.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_114182", "114182057", "story_v_out_114182.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_31 = math.max(var_238_22, arg_235_1.talkMaxDuration)

			if var_238_21 <= arg_235_1.time_ and arg_235_1.time_ < var_238_21 + var_238_31 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_21) / var_238_31

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_21 + var_238_31 and arg_235_1.time_ < var_238_21 + var_238_31 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play114182058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 114182058
		arg_239_1.duration_ = 4.1

		local var_239_0 = {
			ja = 4.1,
			ko = 2.733,
			zh = 3.6,
			en = 3.8
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
				arg_239_0:Play114182059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_242_1 = arg_239_1.actors_["1042ui_story"]
			local var_242_2 = 0

			if var_242_2 < arg_239_1.time_ and arg_239_1.time_ <= var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1042ui_story == nil then
				arg_239_1.var_.characterEffect1042ui_story = var_242_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_3 = 0.2

			if var_242_2 <= arg_239_1.time_ and arg_239_1.time_ < var_242_2 + var_242_3 then
				local var_242_4 = (arg_239_1.time_ - var_242_2) / var_242_3

				if arg_239_1.var_.characterEffect1042ui_story then
					arg_239_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_2 + var_242_3 and arg_239_1.time_ < var_242_2 + var_242_3 + arg_242_0 and arg_239_1.var_.characterEffect1042ui_story then
				arg_239_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_242_5 = 0

			if var_242_5 < arg_239_1.time_ and arg_239_1.time_ <= var_242_5 + arg_242_0 then
				arg_239_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action4_1")
			end

			local var_242_6 = arg_239_1.actors_["1041ui_story"]
			local var_242_7 = 0

			if var_242_7 < arg_239_1.time_ and arg_239_1.time_ <= var_242_7 + arg_242_0 and arg_239_1.var_.characterEffect1041ui_story == nil then
				arg_239_1.var_.characterEffect1041ui_story = var_242_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_8 = 0.2

			if var_242_7 <= arg_239_1.time_ and arg_239_1.time_ < var_242_7 + var_242_8 then
				local var_242_9 = (arg_239_1.time_ - var_242_7) / var_242_8

				if arg_239_1.var_.characterEffect1041ui_story then
					local var_242_10 = Mathf.Lerp(0, 0.5, var_242_9)

					arg_239_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_239_1.var_.characterEffect1041ui_story.fillRatio = var_242_10
				end
			end

			if arg_239_1.time_ >= var_242_7 + var_242_8 and arg_239_1.time_ < var_242_7 + var_242_8 + arg_242_0 and arg_239_1.var_.characterEffect1041ui_story then
				local var_242_11 = 0.5

				arg_239_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_239_1.var_.characterEffect1041ui_story.fillRatio = var_242_11
			end

			local var_242_12 = 0
			local var_242_13 = 0.325

			if var_242_12 < arg_239_1.time_ and arg_239_1.time_ <= var_242_12 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_14 = arg_239_1:FormatText(StoryNameCfg[205].name)

				arg_239_1.leftNameTxt_.text = var_242_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_15 = arg_239_1:GetWordFromCfg(114182058)
				local var_242_16 = arg_239_1:FormatText(var_242_15.content)

				arg_239_1.text_.text = var_242_16

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_17 = 13
				local var_242_18 = utf8.len(var_242_16)
				local var_242_19 = var_242_17 <= 0 and var_242_13 or var_242_13 * (var_242_18 / var_242_17)

				if var_242_19 > 0 and var_242_13 < var_242_19 then
					arg_239_1.talkMaxDuration = var_242_19

					if var_242_19 + var_242_12 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_19 + var_242_12
					end
				end

				arg_239_1.text_.text = var_242_16
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182058", "story_v_out_114182.awb") ~= 0 then
					local var_242_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182058", "story_v_out_114182.awb") / 1000

					if var_242_20 + var_242_12 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_20 + var_242_12
					end

					if var_242_15.prefab_name ~= "" and arg_239_1.actors_[var_242_15.prefab_name] ~= nil then
						local var_242_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_15.prefab_name].transform, "story_v_out_114182", "114182058", "story_v_out_114182.awb")

						arg_239_1:RecordAudio("114182058", var_242_21)
						arg_239_1:RecordAudio("114182058", var_242_21)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_114182", "114182058", "story_v_out_114182.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_114182", "114182058", "story_v_out_114182.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_22 = math.max(var_242_13, arg_239_1.talkMaxDuration)

			if var_242_12 <= arg_239_1.time_ and arg_239_1.time_ < var_242_12 + var_242_22 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_12) / var_242_22

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_12 + var_242_22 and arg_239_1.time_ < var_242_12 + var_242_22 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play114182059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 114182059
		arg_243_1.duration_ = 22.833

		local var_243_0 = {
			ja = 18.6,
			ko = 15,
			zh = 15.366,
			en = 22.833
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
				arg_243_0:Play114182060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042actionlink/1042action442")
			end

			local var_246_2 = 0
			local var_246_3 = 1.625

			if var_246_2 < arg_243_1.time_ and arg_243_1.time_ <= var_246_2 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_4 = arg_243_1:FormatText(StoryNameCfg[205].name)

				arg_243_1.leftNameTxt_.text = var_246_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_5 = arg_243_1:GetWordFromCfg(114182059)
				local var_246_6 = arg_243_1:FormatText(var_246_5.content)

				arg_243_1.text_.text = var_246_6

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_7 = 65
				local var_246_8 = utf8.len(var_246_6)
				local var_246_9 = var_246_7 <= 0 and var_246_3 or var_246_3 * (var_246_8 / var_246_7)

				if var_246_9 > 0 and var_246_3 < var_246_9 then
					arg_243_1.talkMaxDuration = var_246_9

					if var_246_9 + var_246_2 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_9 + var_246_2
					end
				end

				arg_243_1.text_.text = var_246_6
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182059", "story_v_out_114182.awb") ~= 0 then
					local var_246_10 = manager.audio:GetVoiceLength("story_v_out_114182", "114182059", "story_v_out_114182.awb") / 1000

					if var_246_10 + var_246_2 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_10 + var_246_2
					end

					if var_246_5.prefab_name ~= "" and arg_243_1.actors_[var_246_5.prefab_name] ~= nil then
						local var_246_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_5.prefab_name].transform, "story_v_out_114182", "114182059", "story_v_out_114182.awb")

						arg_243_1:RecordAudio("114182059", var_246_11)
						arg_243_1:RecordAudio("114182059", var_246_11)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_114182", "114182059", "story_v_out_114182.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_114182", "114182059", "story_v_out_114182.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_12 = math.max(var_246_3, arg_243_1.talkMaxDuration)

			if var_246_2 <= arg_243_1.time_ and arg_243_1.time_ < var_246_2 + var_246_12 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_2) / var_246_12

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_2 + var_246_12 and arg_243_1.time_ < var_246_2 + var_246_12 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play114182060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 114182060
		arg_247_1.duration_ = 2.533

		local var_247_0 = {
			ja = 2.533,
			ko = 1.733,
			zh = 1.566,
			en = 1.833
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
				arg_247_0:Play114182061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1042ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1042ui_story == nil then
				arg_247_1.var_.characterEffect1042ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1042ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1042ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1042ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1042ui_story.fillRatio = var_250_5
			end

			local var_250_6 = 0
			local var_250_7 = 0.125

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_8 = arg_247_1:FormatText(StoryNameCfg[206].name)

				arg_247_1.leftNameTxt_.text = var_250_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, true)
				arg_247_1.iconController_:SetSelectedState("hero")

				arg_247_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1067")

				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_9 = arg_247_1:GetWordFromCfg(114182060)
				local var_250_10 = arg_247_1:FormatText(var_250_9.content)

				arg_247_1.text_.text = var_250_10

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_11 = 5
				local var_250_12 = utf8.len(var_250_10)
				local var_250_13 = var_250_11 <= 0 and var_250_7 or var_250_7 * (var_250_12 / var_250_11)

				if var_250_13 > 0 and var_250_7 < var_250_13 then
					arg_247_1.talkMaxDuration = var_250_13

					if var_250_13 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_13 + var_250_6
					end
				end

				arg_247_1.text_.text = var_250_10
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182060", "story_v_out_114182.awb") ~= 0 then
					local var_250_14 = manager.audio:GetVoiceLength("story_v_out_114182", "114182060", "story_v_out_114182.awb") / 1000

					if var_250_14 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_14 + var_250_6
					end

					if var_250_9.prefab_name ~= "" and arg_247_1.actors_[var_250_9.prefab_name] ~= nil then
						local var_250_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_9.prefab_name].transform, "story_v_out_114182", "114182060", "story_v_out_114182.awb")

						arg_247_1:RecordAudio("114182060", var_250_15)
						arg_247_1:RecordAudio("114182060", var_250_15)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_114182", "114182060", "story_v_out_114182.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_114182", "114182060", "story_v_out_114182.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_16 = math.max(var_250_7, arg_247_1.talkMaxDuration)

			if var_250_6 <= arg_247_1.time_ and arg_247_1.time_ < var_250_6 + var_250_16 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_6) / var_250_16

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_6 + var_250_16 and arg_247_1.time_ < var_250_6 + var_250_16 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play114182061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 114182061
		arg_251_1.duration_ = 1.999999999999

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play114182062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_254_2 = arg_251_1.actors_["1042ui_story"]
			local var_254_3 = 0

			if var_254_3 < arg_251_1.time_ and arg_251_1.time_ <= var_254_3 + arg_254_0 and arg_251_1.var_.characterEffect1042ui_story == nil then
				arg_251_1.var_.characterEffect1042ui_story = var_254_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_4 = 0.2

			if var_254_3 <= arg_251_1.time_ and arg_251_1.time_ < var_254_3 + var_254_4 then
				local var_254_5 = (arg_251_1.time_ - var_254_3) / var_254_4

				if arg_251_1.var_.characterEffect1042ui_story then
					arg_251_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_3 + var_254_4 and arg_251_1.time_ < var_254_3 + var_254_4 + arg_254_0 and arg_251_1.var_.characterEffect1042ui_story then
				arg_251_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_254_6 = 0
			local var_254_7 = 0.075

			if var_254_6 < arg_251_1.time_ and arg_251_1.time_ <= var_254_6 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_8 = arg_251_1:FormatText(StoryNameCfg[205].name)

				arg_251_1.leftNameTxt_.text = var_254_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_9 = arg_251_1:GetWordFromCfg(114182061)
				local var_254_10 = arg_251_1:FormatText(var_254_9.content)

				arg_251_1.text_.text = var_254_10

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_11 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182061", "story_v_out_114182.awb") ~= 0 then
					local var_254_14 = manager.audio:GetVoiceLength("story_v_out_114182", "114182061", "story_v_out_114182.awb") / 1000

					if var_254_14 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_14 + var_254_6
					end

					if var_254_9.prefab_name ~= "" and arg_251_1.actors_[var_254_9.prefab_name] ~= nil then
						local var_254_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_9.prefab_name].transform, "story_v_out_114182", "114182061", "story_v_out_114182.awb")

						arg_251_1:RecordAudio("114182061", var_254_15)
						arg_251_1:RecordAudio("114182061", var_254_15)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_114182", "114182061", "story_v_out_114182.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_114182", "114182061", "story_v_out_114182.awb")
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
	Play114182062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 114182062
		arg_255_1.duration_ = 11.066

		local var_255_0 = {
			ja = 8.9,
			ko = 11.066,
			zh = 10.733,
			en = 9.8
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
				arg_255_0:Play114182063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1042ui_story"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1042ui_story = var_258_0.localPosition
			end

			local var_258_2 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2
				local var_258_4 = Vector3.New(0, 100, 0)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1042ui_story, var_258_4, var_258_3)

				local var_258_5 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_5.x, var_258_5.y, var_258_5.z)

				local var_258_6 = var_258_0.localEulerAngles

				var_258_6.z = 0
				var_258_6.x = 0
				var_258_0.localEulerAngles = var_258_6
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(0, 100, 0)

				local var_258_7 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_7.x, var_258_7.y, var_258_7.z)

				local var_258_8 = var_258_0.localEulerAngles

				var_258_8.z = 0
				var_258_8.x = 0
				var_258_0.localEulerAngles = var_258_8
			end

			local var_258_9 = arg_255_1.actors_["1041ui_story"].transform
			local var_258_10 = 0

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 then
				arg_255_1.var_.moveOldPos1041ui_story = var_258_9.localPosition
			end

			local var_258_11 = 0.001

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_11 then
				local var_258_12 = (arg_255_1.time_ - var_258_10) / var_258_11
				local var_258_13 = Vector3.New(0, 100, 0)

				var_258_9.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1041ui_story, var_258_13, var_258_12)

				local var_258_14 = manager.ui.mainCamera.transform.position - var_258_9.position

				var_258_9.forward = Vector3.New(var_258_14.x, var_258_14.y, var_258_14.z)

				local var_258_15 = var_258_9.localEulerAngles

				var_258_15.z = 0
				var_258_15.x = 0
				var_258_9.localEulerAngles = var_258_15
			end

			if arg_255_1.time_ >= var_258_10 + var_258_11 and arg_255_1.time_ < var_258_10 + var_258_11 + arg_258_0 then
				var_258_9.localPosition = Vector3.New(0, 100, 0)

				local var_258_16 = manager.ui.mainCamera.transform.position - var_258_9.position

				var_258_9.forward = Vector3.New(var_258_16.x, var_258_16.y, var_258_16.z)

				local var_258_17 = var_258_9.localEulerAngles

				var_258_17.z = 0
				var_258_17.x = 0
				var_258_9.localEulerAngles = var_258_17
			end

			local var_258_18 = arg_255_1.actors_["1067ui_story"]
			local var_258_19 = 0

			if var_258_19 < arg_255_1.time_ and arg_255_1.time_ <= var_258_19 + arg_258_0 and arg_255_1.var_.characterEffect1067ui_story == nil then
				arg_255_1.var_.characterEffect1067ui_story = var_258_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_20 = 0.2

			if var_258_19 <= arg_255_1.time_ and arg_255_1.time_ < var_258_19 + var_258_20 then
				local var_258_21 = (arg_255_1.time_ - var_258_19) / var_258_20

				if arg_255_1.var_.characterEffect1067ui_story then
					arg_255_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_19 + var_258_20 and arg_255_1.time_ < var_258_19 + var_258_20 + arg_258_0 and arg_255_1.var_.characterEffect1067ui_story then
				arg_255_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_258_22 = 0

			if var_258_22 < arg_255_1.time_ and arg_255_1.time_ <= var_258_22 + arg_258_0 then
				arg_255_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action1_1")
			end

			local var_258_23 = 0

			if var_258_23 < arg_255_1.time_ and arg_255_1.time_ <= var_258_23 + arg_258_0 then
				arg_255_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_258_24 = arg_255_1.actors_["1067ui_story"].transform
			local var_258_25 = 0

			if var_258_25 < arg_255_1.time_ and arg_255_1.time_ <= var_258_25 + arg_258_0 then
				arg_255_1.var_.moveOldPos1067ui_story = var_258_24.localPosition
			end

			local var_258_26 = 0.001

			if var_258_25 <= arg_255_1.time_ and arg_255_1.time_ < var_258_25 + var_258_26 then
				local var_258_27 = (arg_255_1.time_ - var_258_25) / var_258_26
				local var_258_28 = Vector3.New(-0.7, -1.06, -6.2)

				var_258_24.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1067ui_story, var_258_28, var_258_27)

				local var_258_29 = manager.ui.mainCamera.transform.position - var_258_24.position

				var_258_24.forward = Vector3.New(var_258_29.x, var_258_29.y, var_258_29.z)

				local var_258_30 = var_258_24.localEulerAngles

				var_258_30.z = 0
				var_258_30.x = 0
				var_258_24.localEulerAngles = var_258_30
			end

			if arg_255_1.time_ >= var_258_25 + var_258_26 and arg_255_1.time_ < var_258_25 + var_258_26 + arg_258_0 then
				var_258_24.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_258_31 = manager.ui.mainCamera.transform.position - var_258_24.position

				var_258_24.forward = Vector3.New(var_258_31.x, var_258_31.y, var_258_31.z)

				local var_258_32 = var_258_24.localEulerAngles

				var_258_32.z = 0
				var_258_32.x = 0
				var_258_24.localEulerAngles = var_258_32
			end

			local var_258_33 = 0
			local var_258_34 = 1.2

			if var_258_33 < arg_255_1.time_ and arg_255_1.time_ <= var_258_33 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_35 = arg_255_1:FormatText(StoryNameCfg[206].name)

				arg_255_1.leftNameTxt_.text = var_258_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_36 = arg_255_1:GetWordFromCfg(114182062)
				local var_258_37 = arg_255_1:FormatText(var_258_36.content)

				arg_255_1.text_.text = var_258_37

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_38 = 48
				local var_258_39 = utf8.len(var_258_37)
				local var_258_40 = var_258_38 <= 0 and var_258_34 or var_258_34 * (var_258_39 / var_258_38)

				if var_258_40 > 0 and var_258_34 < var_258_40 then
					arg_255_1.talkMaxDuration = var_258_40

					if var_258_40 + var_258_33 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_40 + var_258_33
					end
				end

				arg_255_1.text_.text = var_258_37
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182062", "story_v_out_114182.awb") ~= 0 then
					local var_258_41 = manager.audio:GetVoiceLength("story_v_out_114182", "114182062", "story_v_out_114182.awb") / 1000

					if var_258_41 + var_258_33 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_41 + var_258_33
					end

					if var_258_36.prefab_name ~= "" and arg_255_1.actors_[var_258_36.prefab_name] ~= nil then
						local var_258_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_36.prefab_name].transform, "story_v_out_114182", "114182062", "story_v_out_114182.awb")

						arg_255_1:RecordAudio("114182062", var_258_42)
						arg_255_1:RecordAudio("114182062", var_258_42)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_114182", "114182062", "story_v_out_114182.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_114182", "114182062", "story_v_out_114182.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_43 = math.max(var_258_34, arg_255_1.talkMaxDuration)

			if var_258_33 <= arg_255_1.time_ and arg_255_1.time_ < var_258_33 + var_258_43 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_33) / var_258_43

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_33 + var_258_43 and arg_255_1.time_ < var_258_33 + var_258_43 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play114182063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 114182063
		arg_259_1.duration_ = 11.133

		local var_259_0 = {
			ja = 11.133,
			ko = 6.033,
			zh = 5.966,
			en = 7.266
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
				arg_259_0:Play114182064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = "1068ui_story"

			if arg_259_1.actors_[var_262_0] == nil then
				local var_262_1 = Object.Instantiate(Asset.Load("Char/" .. var_262_0), arg_259_1.stage_.transform)

				var_262_1.name = var_262_0
				var_262_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_259_1.actors_[var_262_0] = var_262_1

				local var_262_2 = var_262_1:GetComponentInChildren(typeof(CharacterEffect))

				var_262_2.enabled = true

				local var_262_3 = GameObjectTools.GetOrAddComponent(var_262_1, typeof(DynamicBoneHelper))

				if var_262_3 then
					var_262_3:EnableDynamicBone(false)
				end

				arg_259_1:ShowWeapon(var_262_2.transform, false)

				arg_259_1.var_[var_262_0 .. "Animator"] = var_262_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_259_1.var_[var_262_0 .. "Animator"].applyRootMotion = true
				arg_259_1.var_[var_262_0 .. "LipSync"] = var_262_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_262_4 = arg_259_1.actors_["1068ui_story"]
			local var_262_5 = 0

			if var_262_5 < arg_259_1.time_ and arg_259_1.time_ <= var_262_5 + arg_262_0 and arg_259_1.var_.characterEffect1068ui_story == nil then
				arg_259_1.var_.characterEffect1068ui_story = var_262_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_6 = 0.2

			if var_262_5 <= arg_259_1.time_ and arg_259_1.time_ < var_262_5 + var_262_6 then
				local var_262_7 = (arg_259_1.time_ - var_262_5) / var_262_6

				if arg_259_1.var_.characterEffect1068ui_story then
					arg_259_1.var_.characterEffect1068ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_5 + var_262_6 and arg_259_1.time_ < var_262_5 + var_262_6 + arg_262_0 and arg_259_1.var_.characterEffect1068ui_story then
				arg_259_1.var_.characterEffect1068ui_story.fillFlat = false
			end

			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 then
				arg_259_1:PlayTimeline("1068ui_story", "StoryTimeline/CharAction/1068/1068action/1068action1_1")
			end

			local var_262_9 = 0

			if var_262_9 < arg_259_1.time_ and arg_259_1.time_ <= var_262_9 + arg_262_0 then
				arg_259_1:PlayTimeline("1068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_262_10 = arg_259_1.actors_["1068ui_story"].transform
			local var_262_11 = 0

			if var_262_11 < arg_259_1.time_ and arg_259_1.time_ <= var_262_11 + arg_262_0 then
				arg_259_1.var_.moveOldPos1068ui_story = var_262_10.localPosition
			end

			local var_262_12 = 0.001

			if var_262_11 <= arg_259_1.time_ and arg_259_1.time_ < var_262_11 + var_262_12 then
				local var_262_13 = (arg_259_1.time_ - var_262_11) / var_262_12
				local var_262_14 = Vector3.New(0.7, -0.95, -5.88)

				var_262_10.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1068ui_story, var_262_14, var_262_13)

				local var_262_15 = manager.ui.mainCamera.transform.position - var_262_10.position

				var_262_10.forward = Vector3.New(var_262_15.x, var_262_15.y, var_262_15.z)

				local var_262_16 = var_262_10.localEulerAngles

				var_262_16.z = 0
				var_262_16.x = 0
				var_262_10.localEulerAngles = var_262_16
			end

			if arg_259_1.time_ >= var_262_11 + var_262_12 and arg_259_1.time_ < var_262_11 + var_262_12 + arg_262_0 then
				var_262_10.localPosition = Vector3.New(0.7, -0.95, -5.88)

				local var_262_17 = manager.ui.mainCamera.transform.position - var_262_10.position

				var_262_10.forward = Vector3.New(var_262_17.x, var_262_17.y, var_262_17.z)

				local var_262_18 = var_262_10.localEulerAngles

				var_262_18.z = 0
				var_262_18.x = 0
				var_262_10.localEulerAngles = var_262_18
			end

			local var_262_19 = arg_259_1.actors_["1067ui_story"]
			local var_262_20 = 0

			if var_262_20 < arg_259_1.time_ and arg_259_1.time_ <= var_262_20 + arg_262_0 and arg_259_1.var_.characterEffect1067ui_story == nil then
				arg_259_1.var_.characterEffect1067ui_story = var_262_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_21 = 0.2

			if var_262_20 <= arg_259_1.time_ and arg_259_1.time_ < var_262_20 + var_262_21 then
				local var_262_22 = (arg_259_1.time_ - var_262_20) / var_262_21

				if arg_259_1.var_.characterEffect1067ui_story then
					local var_262_23 = Mathf.Lerp(0, 0.5, var_262_22)

					arg_259_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1067ui_story.fillRatio = var_262_23
				end
			end

			if arg_259_1.time_ >= var_262_20 + var_262_21 and arg_259_1.time_ < var_262_20 + var_262_21 + arg_262_0 and arg_259_1.var_.characterEffect1067ui_story then
				local var_262_24 = 0.5

				arg_259_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1067ui_story.fillRatio = var_262_24
			end

			local var_262_25 = 0
			local var_262_26 = 0.7

			if var_262_25 < arg_259_1.time_ and arg_259_1.time_ <= var_262_25 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_27 = arg_259_1:FormatText(StoryNameCfg[218].name)

				arg_259_1.leftNameTxt_.text = var_262_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_28 = arg_259_1:GetWordFromCfg(114182063)
				local var_262_29 = arg_259_1:FormatText(var_262_28.content)

				arg_259_1.text_.text = var_262_29

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_30 = 28
				local var_262_31 = utf8.len(var_262_29)
				local var_262_32 = var_262_30 <= 0 and var_262_26 or var_262_26 * (var_262_31 / var_262_30)

				if var_262_32 > 0 and var_262_26 < var_262_32 then
					arg_259_1.talkMaxDuration = var_262_32

					if var_262_32 + var_262_25 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_32 + var_262_25
					end
				end

				arg_259_1.text_.text = var_262_29
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182063", "story_v_out_114182.awb") ~= 0 then
					local var_262_33 = manager.audio:GetVoiceLength("story_v_out_114182", "114182063", "story_v_out_114182.awb") / 1000

					if var_262_33 + var_262_25 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_33 + var_262_25
					end

					if var_262_28.prefab_name ~= "" and arg_259_1.actors_[var_262_28.prefab_name] ~= nil then
						local var_262_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_28.prefab_name].transform, "story_v_out_114182", "114182063", "story_v_out_114182.awb")

						arg_259_1:RecordAudio("114182063", var_262_34)
						arg_259_1:RecordAudio("114182063", var_262_34)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_114182", "114182063", "story_v_out_114182.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_114182", "114182063", "story_v_out_114182.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_35 = math.max(var_262_26, arg_259_1.talkMaxDuration)

			if var_262_25 <= arg_259_1.time_ and arg_259_1.time_ < var_262_25 + var_262_35 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_25) / var_262_35

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_25 + var_262_35 and arg_259_1.time_ < var_262_25 + var_262_35 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play114182064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 114182064
		arg_263_1.duration_ = 6.8

		local var_263_0 = {
			ja = 4.833,
			ko = 6.8,
			zh = 5.166,
			en = 5.5
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
				arg_263_0:Play114182065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action4_1")
			end

			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_266_2 = arg_263_1.actors_["1067ui_story"]
			local var_266_3 = 0

			if var_266_3 < arg_263_1.time_ and arg_263_1.time_ <= var_266_3 + arg_266_0 and arg_263_1.var_.characterEffect1067ui_story == nil then
				arg_263_1.var_.characterEffect1067ui_story = var_266_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_4 = 0.2

			if var_266_3 <= arg_263_1.time_ and arg_263_1.time_ < var_266_3 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_3) / var_266_4

				if arg_263_1.var_.characterEffect1067ui_story then
					arg_263_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_3 + var_266_4 and arg_263_1.time_ < var_266_3 + var_266_4 + arg_266_0 and arg_263_1.var_.characterEffect1067ui_story then
				arg_263_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_266_6 = arg_263_1.actors_["1068ui_story"]
			local var_266_7 = 0

			if var_266_7 < arg_263_1.time_ and arg_263_1.time_ <= var_266_7 + arg_266_0 and arg_263_1.var_.characterEffect1068ui_story == nil then
				arg_263_1.var_.characterEffect1068ui_story = var_266_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_8 = 0.2

			if var_266_7 <= arg_263_1.time_ and arg_263_1.time_ < var_266_7 + var_266_8 then
				local var_266_9 = (arg_263_1.time_ - var_266_7) / var_266_8

				if arg_263_1.var_.characterEffect1068ui_story then
					local var_266_10 = Mathf.Lerp(0, 0.5, var_266_9)

					arg_263_1.var_.characterEffect1068ui_story.fillFlat = true
					arg_263_1.var_.characterEffect1068ui_story.fillRatio = var_266_10
				end
			end

			if arg_263_1.time_ >= var_266_7 + var_266_8 and arg_263_1.time_ < var_266_7 + var_266_8 + arg_266_0 and arg_263_1.var_.characterEffect1068ui_story then
				local var_266_11 = 0.5

				arg_263_1.var_.characterEffect1068ui_story.fillFlat = true
				arg_263_1.var_.characterEffect1068ui_story.fillRatio = var_266_11
			end

			local var_266_12 = 0
			local var_266_13 = 0.425

			if var_266_12 < arg_263_1.time_ and arg_263_1.time_ <= var_266_12 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_14 = arg_263_1:FormatText(StoryNameCfg[206].name)

				arg_263_1.leftNameTxt_.text = var_266_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_15 = arg_263_1:GetWordFromCfg(114182064)
				local var_266_16 = arg_263_1:FormatText(var_266_15.content)

				arg_263_1.text_.text = var_266_16

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_17 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182064", "story_v_out_114182.awb") ~= 0 then
					local var_266_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182064", "story_v_out_114182.awb") / 1000

					if var_266_20 + var_266_12 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_20 + var_266_12
					end

					if var_266_15.prefab_name ~= "" and arg_263_1.actors_[var_266_15.prefab_name] ~= nil then
						local var_266_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_15.prefab_name].transform, "story_v_out_114182", "114182064", "story_v_out_114182.awb")

						arg_263_1:RecordAudio("114182064", var_266_21)
						arg_263_1:RecordAudio("114182064", var_266_21)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_114182", "114182064", "story_v_out_114182.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_114182", "114182064", "story_v_out_114182.awb")
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
	Play114182065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 114182065
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play114182066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1067ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1067ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0, 100, 0)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1067ui_story, var_270_4, var_270_3)

				local var_270_5 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_5.x, var_270_5.y, var_270_5.z)

				local var_270_6 = var_270_0.localEulerAngles

				var_270_6.z = 0
				var_270_6.x = 0
				var_270_0.localEulerAngles = var_270_6
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, 100, 0)

				local var_270_7 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_7.x, var_270_7.y, var_270_7.z)

				local var_270_8 = var_270_0.localEulerAngles

				var_270_8.z = 0
				var_270_8.x = 0
				var_270_0.localEulerAngles = var_270_8
			end

			local var_270_9 = arg_267_1.actors_["1068ui_story"].transform
			local var_270_10 = 0

			if var_270_10 < arg_267_1.time_ and arg_267_1.time_ <= var_270_10 + arg_270_0 then
				arg_267_1.var_.moveOldPos1068ui_story = var_270_9.localPosition
			end

			local var_270_11 = 0.001

			if var_270_10 <= arg_267_1.time_ and arg_267_1.time_ < var_270_10 + var_270_11 then
				local var_270_12 = (arg_267_1.time_ - var_270_10) / var_270_11
				local var_270_13 = Vector3.New(0, 100, 0)

				var_270_9.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1068ui_story, var_270_13, var_270_12)

				local var_270_14 = manager.ui.mainCamera.transform.position - var_270_9.position

				var_270_9.forward = Vector3.New(var_270_14.x, var_270_14.y, var_270_14.z)

				local var_270_15 = var_270_9.localEulerAngles

				var_270_15.z = 0
				var_270_15.x = 0
				var_270_9.localEulerAngles = var_270_15
			end

			if arg_267_1.time_ >= var_270_10 + var_270_11 and arg_267_1.time_ < var_270_10 + var_270_11 + arg_270_0 then
				var_270_9.localPosition = Vector3.New(0, 100, 0)

				local var_270_16 = manager.ui.mainCamera.transform.position - var_270_9.position

				var_270_9.forward = Vector3.New(var_270_16.x, var_270_16.y, var_270_16.z)

				local var_270_17 = var_270_9.localEulerAngles

				var_270_17.z = 0
				var_270_17.x = 0
				var_270_9.localEulerAngles = var_270_17
			end

			local var_270_18 = 0
			local var_270_19 = 0.9

			if var_270_18 < arg_267_1.time_ and arg_267_1.time_ <= var_270_18 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_20 = arg_267_1:GetWordFromCfg(114182065)
				local var_270_21 = arg_267_1:FormatText(var_270_20.content)

				arg_267_1.text_.text = var_270_21

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_22 = 36
				local var_270_23 = utf8.len(var_270_21)
				local var_270_24 = var_270_22 <= 0 and var_270_19 or var_270_19 * (var_270_23 / var_270_22)

				if var_270_24 > 0 and var_270_19 < var_270_24 then
					arg_267_1.talkMaxDuration = var_270_24

					if var_270_24 + var_270_18 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_24 + var_270_18
					end
				end

				arg_267_1.text_.text = var_270_21
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_25 = math.max(var_270_19, arg_267_1.talkMaxDuration)

			if var_270_18 <= arg_267_1.time_ and arg_267_1.time_ < var_270_18 + var_270_25 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_18) / var_270_25

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_18 + var_270_25 and arg_267_1.time_ < var_270_18 + var_270_25 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play114182066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 114182066
		arg_271_1.duration_ = 13.3

		local var_271_0 = {
			ja = 13.3,
			ko = 8.9,
			zh = 8.9,
			en = 9.866
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
				arg_271_0:Play114182067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1042ui_story"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1042ui_story = var_274_0.localPosition
			end

			local var_274_2 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2
				local var_274_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1042ui_story, var_274_4, var_274_3)

				local var_274_5 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_5.x, var_274_5.y, var_274_5.z)

				local var_274_6 = var_274_0.localEulerAngles

				var_274_6.z = 0
				var_274_6.x = 0
				var_274_0.localEulerAngles = var_274_6
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_274_7 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_7.x, var_274_7.y, var_274_7.z)

				local var_274_8 = var_274_0.localEulerAngles

				var_274_8.z = 0
				var_274_8.x = 0
				var_274_0.localEulerAngles = var_274_8
			end

			local var_274_9 = 0

			if var_274_9 < arg_271_1.time_ and arg_271_1.time_ <= var_274_9 + arg_274_0 then
				arg_271_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 then
				arg_271_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_274_11 = arg_271_1.actors_["1042ui_story"]
			local var_274_12 = 0

			if var_274_12 < arg_271_1.time_ and arg_271_1.time_ <= var_274_12 + arg_274_0 and arg_271_1.var_.characterEffect1042ui_story == nil then
				arg_271_1.var_.characterEffect1042ui_story = var_274_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_13 = 0.2

			if var_274_12 <= arg_271_1.time_ and arg_271_1.time_ < var_274_12 + var_274_13 then
				local var_274_14 = (arg_271_1.time_ - var_274_12) / var_274_13

				if arg_271_1.var_.characterEffect1042ui_story then
					arg_271_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_12 + var_274_13 and arg_271_1.time_ < var_274_12 + var_274_13 + arg_274_0 and arg_271_1.var_.characterEffect1042ui_story then
				arg_271_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_274_15 = 0
			local var_274_16 = 0.925

			if var_274_15 < arg_271_1.time_ and arg_271_1.time_ <= var_274_15 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_17 = arg_271_1:FormatText(StoryNameCfg[205].name)

				arg_271_1.leftNameTxt_.text = var_274_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_18 = arg_271_1:GetWordFromCfg(114182066)
				local var_274_19 = arg_271_1:FormatText(var_274_18.content)

				arg_271_1.text_.text = var_274_19

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_20 = 37
				local var_274_21 = utf8.len(var_274_19)
				local var_274_22 = var_274_20 <= 0 and var_274_16 or var_274_16 * (var_274_21 / var_274_20)

				if var_274_22 > 0 and var_274_16 < var_274_22 then
					arg_271_1.talkMaxDuration = var_274_22

					if var_274_22 + var_274_15 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_22 + var_274_15
					end
				end

				arg_271_1.text_.text = var_274_19
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182066", "story_v_out_114182.awb") ~= 0 then
					local var_274_23 = manager.audio:GetVoiceLength("story_v_out_114182", "114182066", "story_v_out_114182.awb") / 1000

					if var_274_23 + var_274_15 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_23 + var_274_15
					end

					if var_274_18.prefab_name ~= "" and arg_271_1.actors_[var_274_18.prefab_name] ~= nil then
						local var_274_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_18.prefab_name].transform, "story_v_out_114182", "114182066", "story_v_out_114182.awb")

						arg_271_1:RecordAudio("114182066", var_274_24)
						arg_271_1:RecordAudio("114182066", var_274_24)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_114182", "114182066", "story_v_out_114182.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_114182", "114182066", "story_v_out_114182.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_25 = math.max(var_274_16, arg_271_1.talkMaxDuration)

			if var_274_15 <= arg_271_1.time_ and arg_271_1.time_ < var_274_15 + var_274_25 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_15) / var_274_25

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_15 + var_274_25 and arg_271_1.time_ < var_274_15 + var_274_25 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play114182067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 114182067
		arg_275_1.duration_ = 6.766

		local var_275_0 = {
			ja = 6.766,
			ko = 4.233,
			zh = 4.933,
			en = 5.466
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
				arg_275_0:Play114182068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1041ui_story"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1041ui_story = var_278_0.localPosition
			end

			local var_278_2 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2
				local var_278_4 = Vector3.New(0.7, -1.11, -5.9)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1041ui_story, var_278_4, var_278_3)

				local var_278_5 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_5.x, var_278_5.y, var_278_5.z)

				local var_278_6 = var_278_0.localEulerAngles

				var_278_6.z = 0
				var_278_6.x = 0
				var_278_0.localEulerAngles = var_278_6
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_278_7 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_7.x, var_278_7.y, var_278_7.z)

				local var_278_8 = var_278_0.localEulerAngles

				var_278_8.z = 0
				var_278_8.x = 0
				var_278_0.localEulerAngles = var_278_8
			end

			local var_278_9 = 0

			if var_278_9 < arg_275_1.time_ and arg_275_1.time_ <= var_278_9 + arg_278_0 then
				arg_275_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_278_10 = arg_275_1.actors_["1041ui_story"]
			local var_278_11 = 0

			if var_278_11 < arg_275_1.time_ and arg_275_1.time_ <= var_278_11 + arg_278_0 and arg_275_1.var_.characterEffect1041ui_story == nil then
				arg_275_1.var_.characterEffect1041ui_story = var_278_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_12 = 0.2

			if var_278_11 <= arg_275_1.time_ and arg_275_1.time_ < var_278_11 + var_278_12 then
				local var_278_13 = (arg_275_1.time_ - var_278_11) / var_278_12

				if arg_275_1.var_.characterEffect1041ui_story then
					arg_275_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_11 + var_278_12 and arg_275_1.time_ < var_278_11 + var_278_12 + arg_278_0 and arg_275_1.var_.characterEffect1041ui_story then
				arg_275_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_278_14 = 0

			if var_278_14 < arg_275_1.time_ and arg_275_1.time_ <= var_278_14 + arg_278_0 then
				arg_275_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_278_15 = arg_275_1.actors_["1042ui_story"]
			local var_278_16 = 0

			if var_278_16 < arg_275_1.time_ and arg_275_1.time_ <= var_278_16 + arg_278_0 and arg_275_1.var_.characterEffect1042ui_story == nil then
				arg_275_1.var_.characterEffect1042ui_story = var_278_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_17 = 0.2

			if var_278_16 <= arg_275_1.time_ and arg_275_1.time_ < var_278_16 + var_278_17 then
				local var_278_18 = (arg_275_1.time_ - var_278_16) / var_278_17

				if arg_275_1.var_.characterEffect1042ui_story then
					local var_278_19 = Mathf.Lerp(0, 0.5, var_278_18)

					arg_275_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_275_1.var_.characterEffect1042ui_story.fillRatio = var_278_19
				end
			end

			if arg_275_1.time_ >= var_278_16 + var_278_17 and arg_275_1.time_ < var_278_16 + var_278_17 + arg_278_0 and arg_275_1.var_.characterEffect1042ui_story then
				local var_278_20 = 0.5

				arg_275_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_275_1.var_.characterEffect1042ui_story.fillRatio = var_278_20
			end

			local var_278_21 = 0
			local var_278_22 = 0.55

			if var_278_21 < arg_275_1.time_ and arg_275_1.time_ <= var_278_21 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_23 = arg_275_1:FormatText(StoryNameCfg[208].name)

				arg_275_1.leftNameTxt_.text = var_278_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_24 = arg_275_1:GetWordFromCfg(114182067)
				local var_278_25 = arg_275_1:FormatText(var_278_24.content)

				arg_275_1.text_.text = var_278_25

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_26 = 22
				local var_278_27 = utf8.len(var_278_25)
				local var_278_28 = var_278_26 <= 0 and var_278_22 or var_278_22 * (var_278_27 / var_278_26)

				if var_278_28 > 0 and var_278_22 < var_278_28 then
					arg_275_1.talkMaxDuration = var_278_28

					if var_278_28 + var_278_21 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_28 + var_278_21
					end
				end

				arg_275_1.text_.text = var_278_25
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182067", "story_v_out_114182.awb") ~= 0 then
					local var_278_29 = manager.audio:GetVoiceLength("story_v_out_114182", "114182067", "story_v_out_114182.awb") / 1000

					if var_278_29 + var_278_21 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_29 + var_278_21
					end

					if var_278_24.prefab_name ~= "" and arg_275_1.actors_[var_278_24.prefab_name] ~= nil then
						local var_278_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_24.prefab_name].transform, "story_v_out_114182", "114182067", "story_v_out_114182.awb")

						arg_275_1:RecordAudio("114182067", var_278_30)
						arg_275_1:RecordAudio("114182067", var_278_30)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_114182", "114182067", "story_v_out_114182.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_114182", "114182067", "story_v_out_114182.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_31 = math.max(var_278_22, arg_275_1.talkMaxDuration)

			if var_278_21 <= arg_275_1.time_ and arg_275_1.time_ < var_278_21 + var_278_31 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_21) / var_278_31

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_21 + var_278_31 and arg_275_1.time_ < var_278_21 + var_278_31 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play114182068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 114182068
		arg_279_1.duration_ = 9.866

		local var_279_0 = {
			ja = 9.866,
			ko = 5.1,
			zh = 4.133,
			en = 7.5
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
				arg_279_0:Play114182069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_282_2 = arg_279_1.actors_["1042ui_story"]
			local var_282_3 = 0

			if var_282_3 < arg_279_1.time_ and arg_279_1.time_ <= var_282_3 + arg_282_0 and arg_279_1.var_.characterEffect1042ui_story == nil then
				arg_279_1.var_.characterEffect1042ui_story = var_282_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_4 = 0.2

			if var_282_3 <= arg_279_1.time_ and arg_279_1.time_ < var_282_3 + var_282_4 then
				local var_282_5 = (arg_279_1.time_ - var_282_3) / var_282_4

				if arg_279_1.var_.characterEffect1042ui_story then
					arg_279_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_3 + var_282_4 and arg_279_1.time_ < var_282_3 + var_282_4 + arg_282_0 and arg_279_1.var_.characterEffect1042ui_story then
				arg_279_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_282_6 = arg_279_1.actors_["1041ui_story"]
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 and arg_279_1.var_.characterEffect1041ui_story == nil then
				arg_279_1.var_.characterEffect1041ui_story = var_282_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_8 = 0.2

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_8 then
				local var_282_9 = (arg_279_1.time_ - var_282_7) / var_282_8

				if arg_279_1.var_.characterEffect1041ui_story then
					local var_282_10 = Mathf.Lerp(0, 0.5, var_282_9)

					arg_279_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1041ui_story.fillRatio = var_282_10
				end
			end

			if arg_279_1.time_ >= var_282_7 + var_282_8 and arg_279_1.time_ < var_282_7 + var_282_8 + arg_282_0 and arg_279_1.var_.characterEffect1041ui_story then
				local var_282_11 = 0.5

				arg_279_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1041ui_story.fillRatio = var_282_11
			end

			local var_282_12 = 0
			local var_282_13 = 0.55

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[205].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(114182068)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182068", "story_v_out_114182.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182068", "story_v_out_114182.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_out_114182", "114182068", "story_v_out_114182.awb")

						arg_279_1:RecordAudio("114182068", var_282_21)
						arg_279_1:RecordAudio("114182068", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_114182", "114182068", "story_v_out_114182.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_114182", "114182068", "story_v_out_114182.awb")
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
	Play114182069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 114182069
		arg_283_1.duration_ = 4.666

		local var_283_0 = {
			ja = 4.666,
			ko = 2.633,
			zh = 3.8,
			en = 3.233
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
				arg_283_0:Play114182070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["10006ui_story"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos10006ui_story = var_286_0.localPosition
			end

			local var_286_2 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2
				local var_286_4 = Vector3.New(0.7, -0.98, -5.65)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos10006ui_story, var_286_4, var_286_3)

				local var_286_5 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_5.x, var_286_5.y, var_286_5.z)

				local var_286_6 = var_286_0.localEulerAngles

				var_286_6.z = 0
				var_286_6.x = 0
				var_286_0.localEulerAngles = var_286_6
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(0.7, -0.98, -5.65)

				local var_286_7 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_7.x, var_286_7.y, var_286_7.z)

				local var_286_8 = var_286_0.localEulerAngles

				var_286_8.z = 0
				var_286_8.x = 0
				var_286_0.localEulerAngles = var_286_8
			end

			local var_286_9 = 0

			if var_286_9 < arg_283_1.time_ and arg_283_1.time_ <= var_286_9 + arg_286_0 then
				arg_283_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action1_1")
			end

			local var_286_10 = 0

			if var_286_10 < arg_283_1.time_ and arg_283_1.time_ <= var_286_10 + arg_286_0 then
				arg_283_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_286_11 = arg_283_1.actors_["10006ui_story"]
			local var_286_12 = 0

			if var_286_12 < arg_283_1.time_ and arg_283_1.time_ <= var_286_12 + arg_286_0 and arg_283_1.var_.characterEffect10006ui_story == nil then
				arg_283_1.var_.characterEffect10006ui_story = var_286_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_13 = 0.2

			if var_286_12 <= arg_283_1.time_ and arg_283_1.time_ < var_286_12 + var_286_13 then
				local var_286_14 = (arg_283_1.time_ - var_286_12) / var_286_13

				if arg_283_1.var_.characterEffect10006ui_story then
					arg_283_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_12 + var_286_13 and arg_283_1.time_ < var_286_12 + var_286_13 + arg_286_0 and arg_283_1.var_.characterEffect10006ui_story then
				arg_283_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_286_15 = arg_283_1.actors_["1041ui_story"].transform
			local var_286_16 = 0

			if var_286_16 < arg_283_1.time_ and arg_283_1.time_ <= var_286_16 + arg_286_0 then
				arg_283_1.var_.moveOldPos1041ui_story = var_286_15.localPosition
			end

			local var_286_17 = 0.001

			if var_286_16 <= arg_283_1.time_ and arg_283_1.time_ < var_286_16 + var_286_17 then
				local var_286_18 = (arg_283_1.time_ - var_286_16) / var_286_17
				local var_286_19 = Vector3.New(0, 100, 0)

				var_286_15.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1041ui_story, var_286_19, var_286_18)

				local var_286_20 = manager.ui.mainCamera.transform.position - var_286_15.position

				var_286_15.forward = Vector3.New(var_286_20.x, var_286_20.y, var_286_20.z)

				local var_286_21 = var_286_15.localEulerAngles

				var_286_21.z = 0
				var_286_21.x = 0
				var_286_15.localEulerAngles = var_286_21
			end

			if arg_283_1.time_ >= var_286_16 + var_286_17 and arg_283_1.time_ < var_286_16 + var_286_17 + arg_286_0 then
				var_286_15.localPosition = Vector3.New(0, 100, 0)

				local var_286_22 = manager.ui.mainCamera.transform.position - var_286_15.position

				var_286_15.forward = Vector3.New(var_286_22.x, var_286_22.y, var_286_22.z)

				local var_286_23 = var_286_15.localEulerAngles

				var_286_23.z = 0
				var_286_23.x = 0
				var_286_15.localEulerAngles = var_286_23
			end

			local var_286_24 = arg_283_1.actors_["1042ui_story"]
			local var_286_25 = 0

			if var_286_25 < arg_283_1.time_ and arg_283_1.time_ <= var_286_25 + arg_286_0 and arg_283_1.var_.characterEffect1042ui_story == nil then
				arg_283_1.var_.characterEffect1042ui_story = var_286_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_26 = 0.2

			if var_286_25 <= arg_283_1.time_ and arg_283_1.time_ < var_286_25 + var_286_26 then
				local var_286_27 = (arg_283_1.time_ - var_286_25) / var_286_26

				if arg_283_1.var_.characterEffect1042ui_story then
					local var_286_28 = Mathf.Lerp(0, 0.5, var_286_27)

					arg_283_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1042ui_story.fillRatio = var_286_28
				end
			end

			if arg_283_1.time_ >= var_286_25 + var_286_26 and arg_283_1.time_ < var_286_25 + var_286_26 + arg_286_0 and arg_283_1.var_.characterEffect1042ui_story then
				local var_286_29 = 0.5

				arg_283_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1042ui_story.fillRatio = var_286_29
			end

			local var_286_30 = 0
			local var_286_31 = 0.225

			if var_286_30 < arg_283_1.time_ and arg_283_1.time_ <= var_286_30 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_32 = arg_283_1:FormatText(StoryNameCfg[212].name)

				arg_283_1.leftNameTxt_.text = var_286_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_33 = arg_283_1:GetWordFromCfg(114182069)
				local var_286_34 = arg_283_1:FormatText(var_286_33.content)

				arg_283_1.text_.text = var_286_34

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_35 = 9
				local var_286_36 = utf8.len(var_286_34)
				local var_286_37 = var_286_35 <= 0 and var_286_31 or var_286_31 * (var_286_36 / var_286_35)

				if var_286_37 > 0 and var_286_31 < var_286_37 then
					arg_283_1.talkMaxDuration = var_286_37

					if var_286_37 + var_286_30 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_37 + var_286_30
					end
				end

				arg_283_1.text_.text = var_286_34
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182069", "story_v_out_114182.awb") ~= 0 then
					local var_286_38 = manager.audio:GetVoiceLength("story_v_out_114182", "114182069", "story_v_out_114182.awb") / 1000

					if var_286_38 + var_286_30 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_38 + var_286_30
					end

					if var_286_33.prefab_name ~= "" and arg_283_1.actors_[var_286_33.prefab_name] ~= nil then
						local var_286_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_33.prefab_name].transform, "story_v_out_114182", "114182069", "story_v_out_114182.awb")

						arg_283_1:RecordAudio("114182069", var_286_39)
						arg_283_1:RecordAudio("114182069", var_286_39)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_114182", "114182069", "story_v_out_114182.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_114182", "114182069", "story_v_out_114182.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_40 = math.max(var_286_31, arg_283_1.talkMaxDuration)

			if var_286_30 <= arg_283_1.time_ and arg_283_1.time_ < var_286_30 + var_286_40 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_30) / var_286_40

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_30 + var_286_40 and arg_283_1.time_ < var_286_30 + var_286_40 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play114182070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 114182070
		arg_287_1.duration_ = 7.4

		local var_287_0 = {
			ja = 7.4,
			ko = 4.566,
			zh = 4.766,
			en = 3.733
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
				arg_287_0:Play114182071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1042ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1042ui_story == nil then
				arg_287_1.var_.characterEffect1042ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.2

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1042ui_story then
					arg_287_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1042ui_story then
				arg_287_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_290_4 = arg_287_1.actors_["10006ui_story"]
			local var_290_5 = 0

			if var_290_5 < arg_287_1.time_ and arg_287_1.time_ <= var_290_5 + arg_290_0 and arg_287_1.var_.characterEffect10006ui_story == nil then
				arg_287_1.var_.characterEffect10006ui_story = var_290_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_6 = 0.2

			if var_290_5 <= arg_287_1.time_ and arg_287_1.time_ < var_290_5 + var_290_6 then
				local var_290_7 = (arg_287_1.time_ - var_290_5) / var_290_6

				if arg_287_1.var_.characterEffect10006ui_story then
					local var_290_8 = Mathf.Lerp(0, 0.5, var_290_7)

					arg_287_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_287_1.var_.characterEffect10006ui_story.fillRatio = var_290_8
				end
			end

			if arg_287_1.time_ >= var_290_5 + var_290_6 and arg_287_1.time_ < var_290_5 + var_290_6 + arg_290_0 and arg_287_1.var_.characterEffect10006ui_story then
				local var_290_9 = 0.5

				arg_287_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_287_1.var_.characterEffect10006ui_story.fillRatio = var_290_9
			end

			local var_290_10 = 0

			if var_290_10 < arg_287_1.time_ and arg_287_1.time_ <= var_290_10 + arg_290_0 then
				arg_287_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_290_11 = 0
			local var_290_12 = 0.55

			if var_290_11 < arg_287_1.time_ and arg_287_1.time_ <= var_290_11 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_13 = arg_287_1:FormatText(StoryNameCfg[205].name)

				arg_287_1.leftNameTxt_.text = var_290_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_14 = arg_287_1:GetWordFromCfg(114182070)
				local var_290_15 = arg_287_1:FormatText(var_290_14.content)

				arg_287_1.text_.text = var_290_15

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_16 = 22
				local var_290_17 = utf8.len(var_290_15)
				local var_290_18 = var_290_16 <= 0 and var_290_12 or var_290_12 * (var_290_17 / var_290_16)

				if var_290_18 > 0 and var_290_12 < var_290_18 then
					arg_287_1.talkMaxDuration = var_290_18

					if var_290_18 + var_290_11 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_18 + var_290_11
					end
				end

				arg_287_1.text_.text = var_290_15
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182070", "story_v_out_114182.awb") ~= 0 then
					local var_290_19 = manager.audio:GetVoiceLength("story_v_out_114182", "114182070", "story_v_out_114182.awb") / 1000

					if var_290_19 + var_290_11 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_19 + var_290_11
					end

					if var_290_14.prefab_name ~= "" and arg_287_1.actors_[var_290_14.prefab_name] ~= nil then
						local var_290_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_14.prefab_name].transform, "story_v_out_114182", "114182070", "story_v_out_114182.awb")

						arg_287_1:RecordAudio("114182070", var_290_20)
						arg_287_1:RecordAudio("114182070", var_290_20)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_114182", "114182070", "story_v_out_114182.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_114182", "114182070", "story_v_out_114182.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_21 = math.max(var_290_12, arg_287_1.talkMaxDuration)

			if var_290_11 <= arg_287_1.time_ and arg_287_1.time_ < var_290_11 + var_290_21 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_11) / var_290_21

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_11 + var_290_21 and arg_287_1.time_ < var_290_11 + var_290_21 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play114182071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 114182071
		arg_291_1.duration_ = 4.466

		local var_291_0 = {
			ja = 1.999999999999,
			ko = 4.466,
			zh = 4.033,
			en = 3.666
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
				arg_291_0:Play114182072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action6_1")
			end

			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_294_2 = arg_291_1.actors_["10006ui_story"]
			local var_294_3 = 0

			if var_294_3 < arg_291_1.time_ and arg_291_1.time_ <= var_294_3 + arg_294_0 and arg_291_1.var_.characterEffect10006ui_story == nil then
				arg_291_1.var_.characterEffect10006ui_story = var_294_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_4 = 0.2

			if var_294_3 <= arg_291_1.time_ and arg_291_1.time_ < var_294_3 + var_294_4 then
				local var_294_5 = (arg_291_1.time_ - var_294_3) / var_294_4

				if arg_291_1.var_.characterEffect10006ui_story then
					arg_291_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_3 + var_294_4 and arg_291_1.time_ < var_294_3 + var_294_4 + arg_294_0 and arg_291_1.var_.characterEffect10006ui_story then
				arg_291_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_294_6 = arg_291_1.actors_["1042ui_story"]
			local var_294_7 = 0

			if var_294_7 < arg_291_1.time_ and arg_291_1.time_ <= var_294_7 + arg_294_0 and arg_291_1.var_.characterEffect1042ui_story == nil then
				arg_291_1.var_.characterEffect1042ui_story = var_294_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_8 = 0.2

			if var_294_7 <= arg_291_1.time_ and arg_291_1.time_ < var_294_7 + var_294_8 then
				local var_294_9 = (arg_291_1.time_ - var_294_7) / var_294_8

				if arg_291_1.var_.characterEffect1042ui_story then
					local var_294_10 = Mathf.Lerp(0, 0.5, var_294_9)

					arg_291_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1042ui_story.fillRatio = var_294_10
				end
			end

			if arg_291_1.time_ >= var_294_7 + var_294_8 and arg_291_1.time_ < var_294_7 + var_294_8 + arg_294_0 and arg_291_1.var_.characterEffect1042ui_story then
				local var_294_11 = 0.5

				arg_291_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1042ui_story.fillRatio = var_294_11
			end

			local var_294_12 = 0
			local var_294_13 = 0.35

			if var_294_12 < arg_291_1.time_ and arg_291_1.time_ <= var_294_12 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_14 = arg_291_1:FormatText(StoryNameCfg[212].name)

				arg_291_1.leftNameTxt_.text = var_294_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_15 = arg_291_1:GetWordFromCfg(114182071)
				local var_294_16 = arg_291_1:FormatText(var_294_15.content)

				arg_291_1.text_.text = var_294_16

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_17 = 14
				local var_294_18 = utf8.len(var_294_16)
				local var_294_19 = var_294_17 <= 0 and var_294_13 or var_294_13 * (var_294_18 / var_294_17)

				if var_294_19 > 0 and var_294_13 < var_294_19 then
					arg_291_1.talkMaxDuration = var_294_19

					if var_294_19 + var_294_12 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_19 + var_294_12
					end
				end

				arg_291_1.text_.text = var_294_16
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182071", "story_v_out_114182.awb") ~= 0 then
					local var_294_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182071", "story_v_out_114182.awb") / 1000

					if var_294_20 + var_294_12 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_20 + var_294_12
					end

					if var_294_15.prefab_name ~= "" and arg_291_1.actors_[var_294_15.prefab_name] ~= nil then
						local var_294_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_15.prefab_name].transform, "story_v_out_114182", "114182071", "story_v_out_114182.awb")

						arg_291_1:RecordAudio("114182071", var_294_21)
						arg_291_1:RecordAudio("114182071", var_294_21)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_114182", "114182071", "story_v_out_114182.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_114182", "114182071", "story_v_out_114182.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_22 = math.max(var_294_13, arg_291_1.talkMaxDuration)

			if var_294_12 <= arg_291_1.time_ and arg_291_1.time_ < var_294_12 + var_294_22 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_12) / var_294_22

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_12 + var_294_22 and arg_291_1.time_ < var_294_12 + var_294_22 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play114182072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 114182072
		arg_295_1.duration_ = 18.566

		local var_295_0 = {
			ja = 18.566,
			ko = 13.5,
			zh = 14.033,
			en = 15.833
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
				arg_295_0:Play114182073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1042ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1042ui_story == nil then
				arg_295_1.var_.characterEffect1042ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.2

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1042ui_story then
					arg_295_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1042ui_story then
				arg_295_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_298_4 = arg_295_1.actors_["10006ui_story"]
			local var_298_5 = 0

			if var_298_5 < arg_295_1.time_ and arg_295_1.time_ <= var_298_5 + arg_298_0 and arg_295_1.var_.characterEffect10006ui_story == nil then
				arg_295_1.var_.characterEffect10006ui_story = var_298_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_6 = 0.2

			if var_298_5 <= arg_295_1.time_ and arg_295_1.time_ < var_298_5 + var_298_6 then
				local var_298_7 = (arg_295_1.time_ - var_298_5) / var_298_6

				if arg_295_1.var_.characterEffect10006ui_story then
					local var_298_8 = Mathf.Lerp(0, 0.5, var_298_7)

					arg_295_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_295_1.var_.characterEffect10006ui_story.fillRatio = var_298_8
				end
			end

			if arg_295_1.time_ >= var_298_5 + var_298_6 and arg_295_1.time_ < var_298_5 + var_298_6 + arg_298_0 and arg_295_1.var_.characterEffect10006ui_story then
				local var_298_9 = 0.5

				arg_295_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_295_1.var_.characterEffect10006ui_story.fillRatio = var_298_9
			end

			local var_298_10 = 0

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 then
				arg_295_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_298_11 = 0

			if var_298_11 < arg_295_1.time_ and arg_295_1.time_ <= var_298_11 + arg_298_0 then
				arg_295_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_298_12 = 0
			local var_298_13 = 1.5

			if var_298_12 < arg_295_1.time_ and arg_295_1.time_ <= var_298_12 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_14 = arg_295_1:FormatText(StoryNameCfg[205].name)

				arg_295_1.leftNameTxt_.text = var_298_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_15 = arg_295_1:GetWordFromCfg(114182072)
				local var_298_16 = arg_295_1:FormatText(var_298_15.content)

				arg_295_1.text_.text = var_298_16

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_17 = 60
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182072", "story_v_out_114182.awb") ~= 0 then
					local var_298_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182072", "story_v_out_114182.awb") / 1000

					if var_298_20 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_20 + var_298_12
					end

					if var_298_15.prefab_name ~= "" and arg_295_1.actors_[var_298_15.prefab_name] ~= nil then
						local var_298_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_15.prefab_name].transform, "story_v_out_114182", "114182072", "story_v_out_114182.awb")

						arg_295_1:RecordAudio("114182072", var_298_21)
						arg_295_1:RecordAudio("114182072", var_298_21)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_114182", "114182072", "story_v_out_114182.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_114182", "114182072", "story_v_out_114182.awb")
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
	Play114182073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 114182073
		arg_299_1.duration_ = 7.4

		local var_299_0 = {
			ja = 6.666,
			ko = 4.833,
			zh = 5.333,
			en = 7.4
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
				arg_299_0:Play114182074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_302_1 = 0
			local var_302_2 = 0.6

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_3 = arg_299_1:FormatText(StoryNameCfg[205].name)

				arg_299_1.leftNameTxt_.text = var_302_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_4 = arg_299_1:GetWordFromCfg(114182073)
				local var_302_5 = arg_299_1:FormatText(var_302_4.content)

				arg_299_1.text_.text = var_302_5

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_6 = 24
				local var_302_7 = utf8.len(var_302_5)
				local var_302_8 = var_302_6 <= 0 and var_302_2 or var_302_2 * (var_302_7 / var_302_6)

				if var_302_8 > 0 and var_302_2 < var_302_8 then
					arg_299_1.talkMaxDuration = var_302_8

					if var_302_8 + var_302_1 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_1
					end
				end

				arg_299_1.text_.text = var_302_5
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182073", "story_v_out_114182.awb") ~= 0 then
					local var_302_9 = manager.audio:GetVoiceLength("story_v_out_114182", "114182073", "story_v_out_114182.awb") / 1000

					if var_302_9 + var_302_1 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_9 + var_302_1
					end

					if var_302_4.prefab_name ~= "" and arg_299_1.actors_[var_302_4.prefab_name] ~= nil then
						local var_302_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_4.prefab_name].transform, "story_v_out_114182", "114182073", "story_v_out_114182.awb")

						arg_299_1:RecordAudio("114182073", var_302_10)
						arg_299_1:RecordAudio("114182073", var_302_10)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_114182", "114182073", "story_v_out_114182.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_114182", "114182073", "story_v_out_114182.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_11 = math.max(var_302_2, arg_299_1.talkMaxDuration)

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_11 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_1) / var_302_11

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_1 + var_302_11 and arg_299_1.time_ < var_302_1 + var_302_11 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play114182074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 114182074
		arg_303_1.duration_ = 1.999999999999

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play114182075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action6_2")
			end

			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_306_2 = arg_303_1.actors_["10006ui_story"]
			local var_306_3 = 0

			if var_306_3 < arg_303_1.time_ and arg_303_1.time_ <= var_306_3 + arg_306_0 and arg_303_1.var_.characterEffect10006ui_story == nil then
				arg_303_1.var_.characterEffect10006ui_story = var_306_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_4 = 0.2

			if var_306_3 <= arg_303_1.time_ and arg_303_1.time_ < var_306_3 + var_306_4 then
				local var_306_5 = (arg_303_1.time_ - var_306_3) / var_306_4

				if arg_303_1.var_.characterEffect10006ui_story then
					arg_303_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_3 + var_306_4 and arg_303_1.time_ < var_306_3 + var_306_4 + arg_306_0 and arg_303_1.var_.characterEffect10006ui_story then
				arg_303_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_306_6 = arg_303_1.actors_["1042ui_story"]
			local var_306_7 = 0

			if var_306_7 < arg_303_1.time_ and arg_303_1.time_ <= var_306_7 + arg_306_0 and arg_303_1.var_.characterEffect1042ui_story == nil then
				arg_303_1.var_.characterEffect1042ui_story = var_306_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_8 = 0.2

			if var_306_7 <= arg_303_1.time_ and arg_303_1.time_ < var_306_7 + var_306_8 then
				local var_306_9 = (arg_303_1.time_ - var_306_7) / var_306_8

				if arg_303_1.var_.characterEffect1042ui_story then
					local var_306_10 = Mathf.Lerp(0, 0.5, var_306_9)

					arg_303_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1042ui_story.fillRatio = var_306_10
				end
			end

			if arg_303_1.time_ >= var_306_7 + var_306_8 and arg_303_1.time_ < var_306_7 + var_306_8 + arg_306_0 and arg_303_1.var_.characterEffect1042ui_story then
				local var_306_11 = 0.5

				arg_303_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1042ui_story.fillRatio = var_306_11
			end

			local var_306_12 = 0
			local var_306_13 = 0.075

			if var_306_12 < arg_303_1.time_ and arg_303_1.time_ <= var_306_12 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_14 = arg_303_1:FormatText(StoryNameCfg[212].name)

				arg_303_1.leftNameTxt_.text = var_306_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_15 = arg_303_1:GetWordFromCfg(114182074)
				local var_306_16 = arg_303_1:FormatText(var_306_15.content)

				arg_303_1.text_.text = var_306_16

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_17 = 3
				local var_306_18 = utf8.len(var_306_16)
				local var_306_19 = var_306_17 <= 0 and var_306_13 or var_306_13 * (var_306_18 / var_306_17)

				if var_306_19 > 0 and var_306_13 < var_306_19 then
					arg_303_1.talkMaxDuration = var_306_19

					if var_306_19 + var_306_12 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_19 + var_306_12
					end
				end

				arg_303_1.text_.text = var_306_16
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182074", "story_v_out_114182.awb") ~= 0 then
					local var_306_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182074", "story_v_out_114182.awb") / 1000

					if var_306_20 + var_306_12 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_20 + var_306_12
					end

					if var_306_15.prefab_name ~= "" and arg_303_1.actors_[var_306_15.prefab_name] ~= nil then
						local var_306_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_15.prefab_name].transform, "story_v_out_114182", "114182074", "story_v_out_114182.awb")

						arg_303_1:RecordAudio("114182074", var_306_21)
						arg_303_1:RecordAudio("114182074", var_306_21)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_114182", "114182074", "story_v_out_114182.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_114182", "114182074", "story_v_out_114182.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_22 = math.max(var_306_13, arg_303_1.talkMaxDuration)

			if var_306_12 <= arg_303_1.time_ and arg_303_1.time_ < var_306_12 + var_306_22 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_12) / var_306_22

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_12 + var_306_22 and arg_303_1.time_ < var_306_12 + var_306_22 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play114182075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 114182075
		arg_307_1.duration_ = 8.366

		local var_307_0 = {
			ja = 7.4,
			ko = 6.8,
			zh = 7.066,
			en = 8.366
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
				arg_307_0:Play114182076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1042ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.characterEffect1042ui_story == nil then
				arg_307_1.var_.characterEffect1042ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.2

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect1042ui_story then
					arg_307_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect1042ui_story then
				arg_307_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_310_4 = arg_307_1.actors_["10006ui_story"]
			local var_310_5 = 0

			if var_310_5 < arg_307_1.time_ and arg_307_1.time_ <= var_310_5 + arg_310_0 and arg_307_1.var_.characterEffect10006ui_story == nil then
				arg_307_1.var_.characterEffect10006ui_story = var_310_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_6 = 0.2

			if var_310_5 <= arg_307_1.time_ and arg_307_1.time_ < var_310_5 + var_310_6 then
				local var_310_7 = (arg_307_1.time_ - var_310_5) / var_310_6

				if arg_307_1.var_.characterEffect10006ui_story then
					local var_310_8 = Mathf.Lerp(0, 0.5, var_310_7)

					arg_307_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_307_1.var_.characterEffect10006ui_story.fillRatio = var_310_8
				end
			end

			if arg_307_1.time_ >= var_310_5 + var_310_6 and arg_307_1.time_ < var_310_5 + var_310_6 + arg_310_0 and arg_307_1.var_.characterEffect10006ui_story then
				local var_310_9 = 0.5

				arg_307_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_307_1.var_.characterEffect10006ui_story.fillRatio = var_310_9
			end

			local var_310_10 = 0

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 then
				arg_307_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_310_11 = 0

			if var_310_11 < arg_307_1.time_ and arg_307_1.time_ <= var_310_11 + arg_310_0 then
				arg_307_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_310_12 = 0
			local var_310_13 = 0.625

			if var_310_12 < arg_307_1.time_ and arg_307_1.time_ <= var_310_12 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_14 = arg_307_1:FormatText(StoryNameCfg[205].name)

				arg_307_1.leftNameTxt_.text = var_310_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_15 = arg_307_1:GetWordFromCfg(114182075)
				local var_310_16 = arg_307_1:FormatText(var_310_15.content)

				arg_307_1.text_.text = var_310_16

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_17 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182075", "story_v_out_114182.awb") ~= 0 then
					local var_310_20 = manager.audio:GetVoiceLength("story_v_out_114182", "114182075", "story_v_out_114182.awb") / 1000

					if var_310_20 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_12
					end

					if var_310_15.prefab_name ~= "" and arg_307_1.actors_[var_310_15.prefab_name] ~= nil then
						local var_310_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_15.prefab_name].transform, "story_v_out_114182", "114182075", "story_v_out_114182.awb")

						arg_307_1:RecordAudio("114182075", var_310_21)
						arg_307_1:RecordAudio("114182075", var_310_21)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_114182", "114182075", "story_v_out_114182.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_114182", "114182075", "story_v_out_114182.awb")
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
	Play114182076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 114182076
		arg_311_1.duration_ = 2.366

		local var_311_0 = {
			ja = 2.366,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_311_0:Play114182077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_314_1 = arg_311_1.actors_["10006ui_story"]
			local var_314_2 = 0

			if var_314_2 < arg_311_1.time_ and arg_311_1.time_ <= var_314_2 + arg_314_0 and arg_311_1.var_.characterEffect10006ui_story == nil then
				arg_311_1.var_.characterEffect10006ui_story = var_314_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_3 = 0.2

			if var_314_2 <= arg_311_1.time_ and arg_311_1.time_ < var_314_2 + var_314_3 then
				local var_314_4 = (arg_311_1.time_ - var_314_2) / var_314_3

				if arg_311_1.var_.characterEffect10006ui_story then
					arg_311_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_2 + var_314_3 and arg_311_1.time_ < var_314_2 + var_314_3 + arg_314_0 and arg_311_1.var_.characterEffect10006ui_story then
				arg_311_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_314_5 = arg_311_1.actors_["1042ui_story"]
			local var_314_6 = 0

			if var_314_6 < arg_311_1.time_ and arg_311_1.time_ <= var_314_6 + arg_314_0 and arg_311_1.var_.characterEffect1042ui_story == nil then
				arg_311_1.var_.characterEffect1042ui_story = var_314_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_7 = 0.2

			if var_314_6 <= arg_311_1.time_ and arg_311_1.time_ < var_314_6 + var_314_7 then
				local var_314_8 = (arg_311_1.time_ - var_314_6) / var_314_7

				if arg_311_1.var_.characterEffect1042ui_story then
					local var_314_9 = Mathf.Lerp(0, 0.5, var_314_8)

					arg_311_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1042ui_story.fillRatio = var_314_9
				end
			end

			if arg_311_1.time_ >= var_314_6 + var_314_7 and arg_311_1.time_ < var_314_6 + var_314_7 + arg_314_0 and arg_311_1.var_.characterEffect1042ui_story then
				local var_314_10 = 0.5

				arg_311_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1042ui_story.fillRatio = var_314_10
			end

			local var_314_11 = 0
			local var_314_12 = 0.1

			if var_314_11 < arg_311_1.time_ and arg_311_1.time_ <= var_314_11 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_13 = arg_311_1:FormatText(StoryNameCfg[212].name)

				arg_311_1.leftNameTxt_.text = var_314_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_14 = arg_311_1:GetWordFromCfg(114182076)
				local var_314_15 = arg_311_1:FormatText(var_314_14.content)

				arg_311_1.text_.text = var_314_15

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_16 = 4
				local var_314_17 = utf8.len(var_314_15)
				local var_314_18 = var_314_16 <= 0 and var_314_12 or var_314_12 * (var_314_17 / var_314_16)

				if var_314_18 > 0 and var_314_12 < var_314_18 then
					arg_311_1.talkMaxDuration = var_314_18

					if var_314_18 + var_314_11 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_18 + var_314_11
					end
				end

				arg_311_1.text_.text = var_314_15
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182076", "story_v_out_114182.awb") ~= 0 then
					local var_314_19 = manager.audio:GetVoiceLength("story_v_out_114182", "114182076", "story_v_out_114182.awb") / 1000

					if var_314_19 + var_314_11 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_19 + var_314_11
					end

					if var_314_14.prefab_name ~= "" and arg_311_1.actors_[var_314_14.prefab_name] ~= nil then
						local var_314_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_14.prefab_name].transform, "story_v_out_114182", "114182076", "story_v_out_114182.awb")

						arg_311_1:RecordAudio("114182076", var_314_20)
						arg_311_1:RecordAudio("114182076", var_314_20)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_114182", "114182076", "story_v_out_114182.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_114182", "114182076", "story_v_out_114182.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_21 = math.max(var_314_12, arg_311_1.talkMaxDuration)

			if var_314_11 <= arg_311_1.time_ and arg_311_1.time_ < var_314_11 + var_314_21 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_11) / var_314_21

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_11 + var_314_21 and arg_311_1.time_ < var_314_11 + var_314_21 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play114182077 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 114182077
		arg_315_1.duration_ = 10.5

		local var_315_0 = {
			ja = 4.466,
			ko = 7.166,
			zh = 7.566,
			en = 10.5
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
				arg_315_0:Play114182078(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["10006ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.characterEffect10006ui_story == nil then
				arg_315_1.var_.characterEffect10006ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.2

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect10006ui_story then
					local var_318_4 = Mathf.Lerp(0, 0.5, var_318_3)

					arg_315_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_315_1.var_.characterEffect10006ui_story.fillRatio = var_318_4
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect10006ui_story then
				local var_318_5 = 0.5

				arg_315_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_315_1.var_.characterEffect10006ui_story.fillRatio = var_318_5
			end

			local var_318_6 = 0
			local var_318_7 = 0.8

			if var_318_6 < arg_315_1.time_ and arg_315_1.time_ <= var_318_6 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_8 = arg_315_1:FormatText(StoryNameCfg[6].name)

				arg_315_1.leftNameTxt_.text = var_318_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, true)
				arg_315_1.iconController_:SetSelectedState("hero")

				arg_315_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_9 = arg_315_1:GetWordFromCfg(114182077)
				local var_318_10 = arg_315_1:FormatText(var_318_9.content)

				arg_315_1.text_.text = var_318_10

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_11 = 32
				local var_318_12 = utf8.len(var_318_10)
				local var_318_13 = var_318_11 <= 0 and var_318_7 or var_318_7 * (var_318_12 / var_318_11)

				if var_318_13 > 0 and var_318_7 < var_318_13 then
					arg_315_1.talkMaxDuration = var_318_13

					if var_318_13 + var_318_6 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_13 + var_318_6
					end
				end

				arg_315_1.text_.text = var_318_10
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182077", "story_v_out_114182.awb") ~= 0 then
					local var_318_14 = manager.audio:GetVoiceLength("story_v_out_114182", "114182077", "story_v_out_114182.awb") / 1000

					if var_318_14 + var_318_6 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_14 + var_318_6
					end

					if var_318_9.prefab_name ~= "" and arg_315_1.actors_[var_318_9.prefab_name] ~= nil then
						local var_318_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_9.prefab_name].transform, "story_v_out_114182", "114182077", "story_v_out_114182.awb")

						arg_315_1:RecordAudio("114182077", var_318_15)
						arg_315_1:RecordAudio("114182077", var_318_15)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_114182", "114182077", "story_v_out_114182.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_114182", "114182077", "story_v_out_114182.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_16 = math.max(var_318_7, arg_315_1.talkMaxDuration)

			if var_318_6 <= arg_315_1.time_ and arg_315_1.time_ < var_318_6 + var_318_16 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_6) / var_318_16

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_6 + var_318_16 and arg_315_1.time_ < var_318_6 + var_318_16 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play114182078 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 114182078
		arg_319_1.duration_ = 10.466

		local var_319_0 = {
			ja = 9.566,
			ko = 9.8,
			zh = 10.466,
			en = 10.1
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
				arg_319_0:Play114182079(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_322_1 = arg_319_1.actors_["10006ui_story"]
			local var_322_2 = 0

			if var_322_2 < arg_319_1.time_ and arg_319_1.time_ <= var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect10006ui_story == nil then
				arg_319_1.var_.characterEffect10006ui_story = var_322_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_3 = 0.2

			if var_322_2 <= arg_319_1.time_ and arg_319_1.time_ < var_322_2 + var_322_3 then
				local var_322_4 = (arg_319_1.time_ - var_322_2) / var_322_3

				if arg_319_1.var_.characterEffect10006ui_story then
					arg_319_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_2 + var_322_3 and arg_319_1.time_ < var_322_2 + var_322_3 + arg_322_0 and arg_319_1.var_.characterEffect10006ui_story then
				arg_319_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_322_5 = 0
			local var_322_6 = 0.9

			if var_322_5 < arg_319_1.time_ and arg_319_1.time_ <= var_322_5 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_7 = arg_319_1:FormatText(StoryNameCfg[212].name)

				arg_319_1.leftNameTxt_.text = var_322_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_8 = arg_319_1:GetWordFromCfg(114182078)
				local var_322_9 = arg_319_1:FormatText(var_322_8.content)

				arg_319_1.text_.text = var_322_9

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_10 = 36
				local var_322_11 = utf8.len(var_322_9)
				local var_322_12 = var_322_10 <= 0 and var_322_6 or var_322_6 * (var_322_11 / var_322_10)

				if var_322_12 > 0 and var_322_6 < var_322_12 then
					arg_319_1.talkMaxDuration = var_322_12

					if var_322_12 + var_322_5 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_12 + var_322_5
					end
				end

				arg_319_1.text_.text = var_322_9
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182078", "story_v_out_114182.awb") ~= 0 then
					local var_322_13 = manager.audio:GetVoiceLength("story_v_out_114182", "114182078", "story_v_out_114182.awb") / 1000

					if var_322_13 + var_322_5 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_13 + var_322_5
					end

					if var_322_8.prefab_name ~= "" and arg_319_1.actors_[var_322_8.prefab_name] ~= nil then
						local var_322_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_8.prefab_name].transform, "story_v_out_114182", "114182078", "story_v_out_114182.awb")

						arg_319_1:RecordAudio("114182078", var_322_14)
						arg_319_1:RecordAudio("114182078", var_322_14)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_114182", "114182078", "story_v_out_114182.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_114182", "114182078", "story_v_out_114182.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_15 = math.max(var_322_6, arg_319_1.talkMaxDuration)

			if var_322_5 <= arg_319_1.time_ and arg_319_1.time_ < var_322_5 + var_322_15 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_5) / var_322_15

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_5 + var_322_15 and arg_319_1.time_ < var_322_5 + var_322_15 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play114182079 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 114182079
		arg_323_1.duration_ = 10.066

		local var_323_0 = {
			ja = 10.066,
			ko = 5.833,
			zh = 5.366,
			en = 7.933
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
				arg_323_0:Play114182080(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["10006ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect10006ui_story == nil then
				arg_323_1.var_.characterEffect10006ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.2

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect10006ui_story then
					local var_326_4 = Mathf.Lerp(0, 0.5, var_326_3)

					arg_323_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_323_1.var_.characterEffect10006ui_story.fillRatio = var_326_4
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect10006ui_story then
				local var_326_5 = 0.5

				arg_323_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_323_1.var_.characterEffect10006ui_story.fillRatio = var_326_5
			end

			local var_326_6 = arg_323_1.actors_["1042ui_story"]
			local var_326_7 = 0

			if var_326_7 < arg_323_1.time_ and arg_323_1.time_ <= var_326_7 + arg_326_0 and arg_323_1.var_.characterEffect1042ui_story == nil then
				arg_323_1.var_.characterEffect1042ui_story = var_326_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_8 = 0.2

			if var_326_7 <= arg_323_1.time_ and arg_323_1.time_ < var_326_7 + var_326_8 then
				local var_326_9 = (arg_323_1.time_ - var_326_7) / var_326_8

				if arg_323_1.var_.characterEffect1042ui_story then
					arg_323_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_7 + var_326_8 and arg_323_1.time_ < var_326_7 + var_326_8 + arg_326_0 and arg_323_1.var_.characterEffect1042ui_story then
				arg_323_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 then
				arg_323_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_326_11 = 0
			local var_326_12 = 0.525

			if var_326_11 < arg_323_1.time_ and arg_323_1.time_ <= var_326_11 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_13 = arg_323_1:FormatText(StoryNameCfg[205].name)

				arg_323_1.leftNameTxt_.text = var_326_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_14 = arg_323_1:GetWordFromCfg(114182079)
				local var_326_15 = arg_323_1:FormatText(var_326_14.content)

				arg_323_1.text_.text = var_326_15

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_16 = 21
				local var_326_17 = utf8.len(var_326_15)
				local var_326_18 = var_326_16 <= 0 and var_326_12 or var_326_12 * (var_326_17 / var_326_16)

				if var_326_18 > 0 and var_326_12 < var_326_18 then
					arg_323_1.talkMaxDuration = var_326_18

					if var_326_18 + var_326_11 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_18 + var_326_11
					end
				end

				arg_323_1.text_.text = var_326_15
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182079", "story_v_out_114182.awb") ~= 0 then
					local var_326_19 = manager.audio:GetVoiceLength("story_v_out_114182", "114182079", "story_v_out_114182.awb") / 1000

					if var_326_19 + var_326_11 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_19 + var_326_11
					end

					if var_326_14.prefab_name ~= "" and arg_323_1.actors_[var_326_14.prefab_name] ~= nil then
						local var_326_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_14.prefab_name].transform, "story_v_out_114182", "114182079", "story_v_out_114182.awb")

						arg_323_1:RecordAudio("114182079", var_326_20)
						arg_323_1:RecordAudio("114182079", var_326_20)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_114182", "114182079", "story_v_out_114182.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_114182", "114182079", "story_v_out_114182.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_21 = math.max(var_326_12, arg_323_1.talkMaxDuration)

			if var_326_11 <= arg_323_1.time_ and arg_323_1.time_ < var_326_11 + var_326_21 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_11) / var_326_21

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_11 + var_326_21 and arg_323_1.time_ < var_326_11 + var_326_21 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play114182080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 114182080
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play114182081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1042ui_story"].transform
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				arg_327_1.var_.moveOldPos1042ui_story = var_330_0.localPosition
			end

			local var_330_2 = 0.001

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2
				local var_330_4 = Vector3.New(0, 100, 0)

				var_330_0.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1042ui_story, var_330_4, var_330_3)

				local var_330_5 = manager.ui.mainCamera.transform.position - var_330_0.position

				var_330_0.forward = Vector3.New(var_330_5.x, var_330_5.y, var_330_5.z)

				local var_330_6 = var_330_0.localEulerAngles

				var_330_6.z = 0
				var_330_6.x = 0
				var_330_0.localEulerAngles = var_330_6
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 then
				var_330_0.localPosition = Vector3.New(0, 100, 0)

				local var_330_7 = manager.ui.mainCamera.transform.position - var_330_0.position

				var_330_0.forward = Vector3.New(var_330_7.x, var_330_7.y, var_330_7.z)

				local var_330_8 = var_330_0.localEulerAngles

				var_330_8.z = 0
				var_330_8.x = 0
				var_330_0.localEulerAngles = var_330_8
			end

			local var_330_9 = arg_327_1.actors_["10006ui_story"].transform
			local var_330_10 = 0

			if var_330_10 < arg_327_1.time_ and arg_327_1.time_ <= var_330_10 + arg_330_0 then
				arg_327_1.var_.moveOldPos10006ui_story = var_330_9.localPosition
			end

			local var_330_11 = 0.001

			if var_330_10 <= arg_327_1.time_ and arg_327_1.time_ < var_330_10 + var_330_11 then
				local var_330_12 = (arg_327_1.time_ - var_330_10) / var_330_11
				local var_330_13 = Vector3.New(0, 100, 0)

				var_330_9.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos10006ui_story, var_330_13, var_330_12)

				local var_330_14 = manager.ui.mainCamera.transform.position - var_330_9.position

				var_330_9.forward = Vector3.New(var_330_14.x, var_330_14.y, var_330_14.z)

				local var_330_15 = var_330_9.localEulerAngles

				var_330_15.z = 0
				var_330_15.x = 0
				var_330_9.localEulerAngles = var_330_15
			end

			if arg_327_1.time_ >= var_330_10 + var_330_11 and arg_327_1.time_ < var_330_10 + var_330_11 + arg_330_0 then
				var_330_9.localPosition = Vector3.New(0, 100, 0)

				local var_330_16 = manager.ui.mainCamera.transform.position - var_330_9.position

				var_330_9.forward = Vector3.New(var_330_16.x, var_330_16.y, var_330_16.z)

				local var_330_17 = var_330_9.localEulerAngles

				var_330_17.z = 0
				var_330_17.x = 0
				var_330_9.localEulerAngles = var_330_17
			end

			local var_330_18 = 0
			local var_330_19 = 0.65

			if var_330_18 < arg_327_1.time_ and arg_327_1.time_ <= var_330_18 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_20 = arg_327_1:GetWordFromCfg(114182080)
				local var_330_21 = arg_327_1:FormatText(var_330_20.content)

				arg_327_1.text_.text = var_330_21

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_22 = 26
				local var_330_23 = utf8.len(var_330_21)
				local var_330_24 = var_330_22 <= 0 and var_330_19 or var_330_19 * (var_330_23 / var_330_22)

				if var_330_24 > 0 and var_330_19 < var_330_24 then
					arg_327_1.talkMaxDuration = var_330_24

					if var_330_24 + var_330_18 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_24 + var_330_18
					end
				end

				arg_327_1.text_.text = var_330_21
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_25 = math.max(var_330_19, arg_327_1.talkMaxDuration)

			if var_330_18 <= arg_327_1.time_ and arg_327_1.time_ < var_330_18 + var_330_25 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_18) / var_330_25

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_18 + var_330_25 and arg_327_1.time_ < var_330_18 + var_330_25 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play114182081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 114182081
		arg_331_1.duration_ = 11.4

		local var_331_0 = {
			ja = 11.4,
			ko = 7.666,
			zh = 5.7,
			en = 8.3
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
				arg_331_0:Play114182082(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1042ui_story"].transform
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.var_.moveOldPos1042ui_story = var_334_0.localPosition
			end

			local var_334_2 = 0.001

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2
				local var_334_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_334_0.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1042ui_story, var_334_4, var_334_3)

				local var_334_5 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_5.x, var_334_5.y, var_334_5.z)

				local var_334_6 = var_334_0.localEulerAngles

				var_334_6.z = 0
				var_334_6.x = 0
				var_334_0.localEulerAngles = var_334_6
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 then
				var_334_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_334_7 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_7.x, var_334_7.y, var_334_7.z)

				local var_334_8 = var_334_0.localEulerAngles

				var_334_8.z = 0
				var_334_8.x = 0
				var_334_0.localEulerAngles = var_334_8
			end

			local var_334_9 = 0

			if var_334_9 < arg_331_1.time_ and arg_331_1.time_ <= var_334_9 + arg_334_0 then
				arg_331_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 then
				arg_331_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_334_11 = arg_331_1.actors_["1042ui_story"]
			local var_334_12 = 0

			if var_334_12 < arg_331_1.time_ and arg_331_1.time_ <= var_334_12 + arg_334_0 and arg_331_1.var_.characterEffect1042ui_story == nil then
				arg_331_1.var_.characterEffect1042ui_story = var_334_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_13 = 0.2

			if var_334_12 <= arg_331_1.time_ and arg_331_1.time_ < var_334_12 + var_334_13 then
				local var_334_14 = (arg_331_1.time_ - var_334_12) / var_334_13

				if arg_331_1.var_.characterEffect1042ui_story then
					arg_331_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_12 + var_334_13 and arg_331_1.time_ < var_334_12 + var_334_13 + arg_334_0 and arg_331_1.var_.characterEffect1042ui_story then
				arg_331_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_334_15 = 0
			local var_334_16 = 0.7

			if var_334_15 < arg_331_1.time_ and arg_331_1.time_ <= var_334_15 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_17 = arg_331_1:FormatText(StoryNameCfg[205].name)

				arg_331_1.leftNameTxt_.text = var_334_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_18 = arg_331_1:GetWordFromCfg(114182081)
				local var_334_19 = arg_331_1:FormatText(var_334_18.content)

				arg_331_1.text_.text = var_334_19

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_20 = 28
				local var_334_21 = utf8.len(var_334_19)
				local var_334_22 = var_334_20 <= 0 and var_334_16 or var_334_16 * (var_334_21 / var_334_20)

				if var_334_22 > 0 and var_334_16 < var_334_22 then
					arg_331_1.talkMaxDuration = var_334_22

					if var_334_22 + var_334_15 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_22 + var_334_15
					end
				end

				arg_331_1.text_.text = var_334_19
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182081", "story_v_out_114182.awb") ~= 0 then
					local var_334_23 = manager.audio:GetVoiceLength("story_v_out_114182", "114182081", "story_v_out_114182.awb") / 1000

					if var_334_23 + var_334_15 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_23 + var_334_15
					end

					if var_334_18.prefab_name ~= "" and arg_331_1.actors_[var_334_18.prefab_name] ~= nil then
						local var_334_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_18.prefab_name].transform, "story_v_out_114182", "114182081", "story_v_out_114182.awb")

						arg_331_1:RecordAudio("114182081", var_334_24)
						arg_331_1:RecordAudio("114182081", var_334_24)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_114182", "114182081", "story_v_out_114182.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_114182", "114182081", "story_v_out_114182.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_25 = math.max(var_334_16, arg_331_1.talkMaxDuration)

			if var_334_15 <= arg_331_1.time_ and arg_331_1.time_ < var_334_15 + var_334_25 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_15) / var_334_25

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_15 + var_334_25 and arg_331_1.time_ < var_334_15 + var_334_25 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play114182082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 114182082
		arg_335_1.duration_ = 3.133

		local var_335_0 = {
			ja = 2.9,
			ko = 2.3,
			zh = 2.766,
			en = 3.133
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
				arg_335_0:Play114182083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["10006ui_story"].transform
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 then
				arg_335_1.var_.moveOldPos10006ui_story = var_338_0.localPosition
			end

			local var_338_2 = 0.001

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2
				local var_338_4 = Vector3.New(0.7, -0.98, -5.65)

				var_338_0.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos10006ui_story, var_338_4, var_338_3)

				local var_338_5 = manager.ui.mainCamera.transform.position - var_338_0.position

				var_338_0.forward = Vector3.New(var_338_5.x, var_338_5.y, var_338_5.z)

				local var_338_6 = var_338_0.localEulerAngles

				var_338_6.z = 0
				var_338_6.x = 0
				var_338_0.localEulerAngles = var_338_6
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 then
				var_338_0.localPosition = Vector3.New(0.7, -0.98, -5.65)

				local var_338_7 = manager.ui.mainCamera.transform.position - var_338_0.position

				var_338_0.forward = Vector3.New(var_338_7.x, var_338_7.y, var_338_7.z)

				local var_338_8 = var_338_0.localEulerAngles

				var_338_8.z = 0
				var_338_8.x = 0
				var_338_0.localEulerAngles = var_338_8
			end

			local var_338_9 = 0

			if var_338_9 < arg_335_1.time_ and arg_335_1.time_ <= var_338_9 + arg_338_0 then
				arg_335_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action1_1")
			end

			local var_338_10 = 0

			if var_338_10 < arg_335_1.time_ and arg_335_1.time_ <= var_338_10 + arg_338_0 then
				arg_335_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_338_11 = arg_335_1.actors_["10006ui_story"]
			local var_338_12 = 0

			if var_338_12 < arg_335_1.time_ and arg_335_1.time_ <= var_338_12 + arg_338_0 and arg_335_1.var_.characterEffect10006ui_story == nil then
				arg_335_1.var_.characterEffect10006ui_story = var_338_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_13 = 0.2

			if var_338_12 <= arg_335_1.time_ and arg_335_1.time_ < var_338_12 + var_338_13 then
				local var_338_14 = (arg_335_1.time_ - var_338_12) / var_338_13

				if arg_335_1.var_.characterEffect10006ui_story then
					arg_335_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_12 + var_338_13 and arg_335_1.time_ < var_338_12 + var_338_13 + arg_338_0 and arg_335_1.var_.characterEffect10006ui_story then
				arg_335_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_338_15 = arg_335_1.actors_["1042ui_story"]
			local var_338_16 = 0

			if var_338_16 < arg_335_1.time_ and arg_335_1.time_ <= var_338_16 + arg_338_0 and arg_335_1.var_.characterEffect1042ui_story == nil then
				arg_335_1.var_.characterEffect1042ui_story = var_338_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_17 = 0.2

			if var_338_16 <= arg_335_1.time_ and arg_335_1.time_ < var_338_16 + var_338_17 then
				local var_338_18 = (arg_335_1.time_ - var_338_16) / var_338_17

				if arg_335_1.var_.characterEffect1042ui_story then
					local var_338_19 = Mathf.Lerp(0, 0.5, var_338_18)

					arg_335_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_335_1.var_.characterEffect1042ui_story.fillRatio = var_338_19
				end
			end

			if arg_335_1.time_ >= var_338_16 + var_338_17 and arg_335_1.time_ < var_338_16 + var_338_17 + arg_338_0 and arg_335_1.var_.characterEffect1042ui_story then
				local var_338_20 = 0.5

				arg_335_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_335_1.var_.characterEffect1042ui_story.fillRatio = var_338_20
			end

			local var_338_21 = 0
			local var_338_22 = 0.125

			if var_338_21 < arg_335_1.time_ and arg_335_1.time_ <= var_338_21 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_23 = arg_335_1:FormatText(StoryNameCfg[212].name)

				arg_335_1.leftNameTxt_.text = var_338_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_24 = arg_335_1:GetWordFromCfg(114182082)
				local var_338_25 = arg_335_1:FormatText(var_338_24.content)

				arg_335_1.text_.text = var_338_25

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_26 = 5
				local var_338_27 = utf8.len(var_338_25)
				local var_338_28 = var_338_26 <= 0 and var_338_22 or var_338_22 * (var_338_27 / var_338_26)

				if var_338_28 > 0 and var_338_22 < var_338_28 then
					arg_335_1.talkMaxDuration = var_338_28

					if var_338_28 + var_338_21 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_28 + var_338_21
					end
				end

				arg_335_1.text_.text = var_338_25
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182082", "story_v_out_114182.awb") ~= 0 then
					local var_338_29 = manager.audio:GetVoiceLength("story_v_out_114182", "114182082", "story_v_out_114182.awb") / 1000

					if var_338_29 + var_338_21 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_29 + var_338_21
					end

					if var_338_24.prefab_name ~= "" and arg_335_1.actors_[var_338_24.prefab_name] ~= nil then
						local var_338_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_24.prefab_name].transform, "story_v_out_114182", "114182082", "story_v_out_114182.awb")

						arg_335_1:RecordAudio("114182082", var_338_30)
						arg_335_1:RecordAudio("114182082", var_338_30)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_114182", "114182082", "story_v_out_114182.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_114182", "114182082", "story_v_out_114182.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_31 = math.max(var_338_22, arg_335_1.talkMaxDuration)

			if var_338_21 <= arg_335_1.time_ and arg_335_1.time_ < var_338_21 + var_338_31 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_21) / var_338_31

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_21 + var_338_31 and arg_335_1.time_ < var_338_21 + var_338_31 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play114182083 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 114182083
		arg_339_1.duration_ = 7.266

		local var_339_0 = {
			ja = 7.266,
			ko = 4.6,
			zh = 3.9,
			en = 4.766
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
			arg_339_1.auto_ = false
		end

		function arg_339_1.playNext_(arg_341_0)
			arg_339_1.onStoryFinished_()
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["10006ui_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and arg_339_1.var_.characterEffect10006ui_story == nil then
				arg_339_1.var_.characterEffect10006ui_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.2

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect10006ui_story then
					local var_342_4 = Mathf.Lerp(0, 0.5, var_342_3)

					arg_339_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_339_1.var_.characterEffect10006ui_story.fillRatio = var_342_4
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect10006ui_story then
				local var_342_5 = 0.5

				arg_339_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_339_1.var_.characterEffect10006ui_story.fillRatio = var_342_5
			end

			local var_342_6 = arg_339_1.actors_["1042ui_story"]
			local var_342_7 = 0

			if var_342_7 < arg_339_1.time_ and arg_339_1.time_ <= var_342_7 + arg_342_0 and arg_339_1.var_.characterEffect1042ui_story == nil then
				arg_339_1.var_.characterEffect1042ui_story = var_342_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_8 = 0.2

			if var_342_7 <= arg_339_1.time_ and arg_339_1.time_ < var_342_7 + var_342_8 then
				local var_342_9 = (arg_339_1.time_ - var_342_7) / var_342_8

				if arg_339_1.var_.characterEffect1042ui_story then
					arg_339_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_7 + var_342_8 and arg_339_1.time_ < var_342_7 + var_342_8 + arg_342_0 and arg_339_1.var_.characterEffect1042ui_story then
				arg_339_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 then
				arg_339_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_342_11 = 0
			local var_342_12 = 0.45

			if var_342_11 < arg_339_1.time_ and arg_339_1.time_ <= var_342_11 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_13 = arg_339_1:FormatText(StoryNameCfg[205].name)

				arg_339_1.leftNameTxt_.text = var_342_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_14 = arg_339_1:GetWordFromCfg(114182083)
				local var_342_15 = arg_339_1:FormatText(var_342_14.content)

				arg_339_1.text_.text = var_342_15

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_16 = 18
				local var_342_17 = utf8.len(var_342_15)
				local var_342_18 = var_342_16 <= 0 and var_342_12 or var_342_12 * (var_342_17 / var_342_16)

				if var_342_18 > 0 and var_342_12 < var_342_18 then
					arg_339_1.talkMaxDuration = var_342_18

					if var_342_18 + var_342_11 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_18 + var_342_11
					end
				end

				arg_339_1.text_.text = var_342_15
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114182", "114182083", "story_v_out_114182.awb") ~= 0 then
					local var_342_19 = manager.audio:GetVoiceLength("story_v_out_114182", "114182083", "story_v_out_114182.awb") / 1000

					if var_342_19 + var_342_11 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_19 + var_342_11
					end

					if var_342_14.prefab_name ~= "" and arg_339_1.actors_[var_342_14.prefab_name] ~= nil then
						local var_342_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_14.prefab_name].transform, "story_v_out_114182", "114182083", "story_v_out_114182.awb")

						arg_339_1:RecordAudio("114182083", var_342_20)
						arg_339_1:RecordAudio("114182083", var_342_20)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_114182", "114182083", "story_v_out_114182.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_114182", "114182083", "story_v_out_114182.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_21 = math.max(var_342_12, arg_339_1.talkMaxDuration)

			if var_342_11 <= arg_339_1.time_ and arg_339_1.time_ < var_342_11 + var_342_21 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_11) / var_342_21

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_11 + var_342_21 and arg_339_1.time_ < var_342_11 + var_342_21 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F06",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F04",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_114182.awb"
	}
}
