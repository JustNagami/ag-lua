return {
	Play317012001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317012001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play317012002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K11f"

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
				local var_4_5 = arg_1_1.bgs_.K11f

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
					if iter_4_0 ~= "K11f" then
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

			local var_4_26 = 1.56666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo.awb")
			end

			local var_4_30 = 1.75
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "effect"

				arg_1_1:AudioAction(var_4_32, var_4_33, "se_story_123_01", "se_story_123_01_crake", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.75

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

				local var_4_37 = arg_1_1:GetWordFromCfg(317012001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 30
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
	Play317012002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 317012002
		arg_7_1.duration_ = 3.666

		local var_7_0 = {
			zh = 2.4,
			ja = 3.666
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
				arg_7_0:Play317012003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1199ui_story"

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

			local var_10_4 = arg_7_1.actors_["1199ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1199ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -1.08, -5.9)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1199ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 then
				arg_7_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_10_15 = arg_7_1.actors_["1199ui_story"]
			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 and arg_7_1.var_.characterEffect1199ui_story == nil then
				arg_7_1.var_.characterEffect1199ui_story = var_10_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_17 = 0.2

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_17 then
				local var_10_18 = (arg_7_1.time_ - var_10_16) / var_10_17

				if arg_7_1.var_.characterEffect1199ui_story then
					arg_7_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_16 + var_10_17 and arg_7_1.time_ < var_10_16 + var_10_17 + arg_10_0 and arg_7_1.var_.characterEffect1199ui_story then
				arg_7_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_10_19 = 0
			local var_10_20 = 0.2

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[84].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(317012002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012002", "story_v_out_317012.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_317012", "317012002", "story_v_out_317012.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_317012", "317012002", "story_v_out_317012.awb")

						arg_7_1:RecordAudio("317012002", var_10_28)
						arg_7_1:RecordAudio("317012002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_317012", "317012002", "story_v_out_317012.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_317012", "317012002", "story_v_out_317012.awb")
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
	Play317012003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 317012003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play317012004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1199ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1199ui_story == nil then
				arg_11_1.var_.characterEffect1199ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.2

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1199ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1199ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1199ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1199ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 1.025

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_8 = arg_11_1:GetWordFromCfg(317012003)
				local var_14_9 = arg_11_1:FormatText(var_14_8.content)

				arg_11_1.text_.text = var_14_9

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_10 = 41
				local var_14_11 = utf8.len(var_14_9)
				local var_14_12 = var_14_10 <= 0 and var_14_7 or var_14_7 * (var_14_11 / var_14_10)

				if var_14_12 > 0 and var_14_7 < var_14_12 then
					arg_11_1.talkMaxDuration = var_14_12

					if var_14_12 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_12 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_9
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_13 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_13 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_13

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_13 and arg_11_1.time_ < var_14_6 + var_14_13 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play317012004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 317012004
		arg_15_1.duration_ = 11.633

		local var_15_0 = {
			zh = 9.633,
			ja = 11.633
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
				arg_15_0:Play317012005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1199ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1199ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, -1.08, -5.9)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1199ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 then
				arg_15_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_18_11 = arg_15_1.actors_["1199ui_story"]
			local var_18_12 = 0

			if var_18_12 < arg_15_1.time_ and arg_15_1.time_ <= var_18_12 + arg_18_0 and arg_15_1.var_.characterEffect1199ui_story == nil then
				arg_15_1.var_.characterEffect1199ui_story = var_18_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_13 = 0.2

			if var_18_12 <= arg_15_1.time_ and arg_15_1.time_ < var_18_12 + var_18_13 then
				local var_18_14 = (arg_15_1.time_ - var_18_12) / var_18_13

				if arg_15_1.var_.characterEffect1199ui_story then
					arg_15_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_12 + var_18_13 and arg_15_1.time_ < var_18_12 + var_18_13 + arg_18_0 and arg_15_1.var_.characterEffect1199ui_story then
				arg_15_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_18_15 = 0
			local var_18_16 = 1.225

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_17 = arg_15_1:FormatText(StoryNameCfg[84].name)

				arg_15_1.leftNameTxt_.text = var_18_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_18 = arg_15_1:GetWordFromCfg(317012004)
				local var_18_19 = arg_15_1:FormatText(var_18_18.content)

				arg_15_1.text_.text = var_18_19

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_20 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012004", "story_v_out_317012.awb") ~= 0 then
					local var_18_23 = manager.audio:GetVoiceLength("story_v_out_317012", "317012004", "story_v_out_317012.awb") / 1000

					if var_18_23 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_23 + var_18_15
					end

					if var_18_18.prefab_name ~= "" and arg_15_1.actors_[var_18_18.prefab_name] ~= nil then
						local var_18_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_18.prefab_name].transform, "story_v_out_317012", "317012004", "story_v_out_317012.awb")

						arg_15_1:RecordAudio("317012004", var_18_24)
						arg_15_1:RecordAudio("317012004", var_18_24)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_317012", "317012004", "story_v_out_317012.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_317012", "317012004", "story_v_out_317012.awb")
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
	Play317012005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 317012005
		arg_19_1.duration_ = 3.666

		local var_19_0 = {
			zh = 1.999999999999,
			ja = 3.666
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
				arg_19_0:Play317012006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1199ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1199ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, -1.08, -5.9)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1199ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = 0

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 then
				arg_19_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_22_11 = 0
			local var_22_12 = 0.1

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_13 = arg_19_1:FormatText(StoryNameCfg[84].name)

				arg_19_1.leftNameTxt_.text = var_22_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_14 = arg_19_1:GetWordFromCfg(317012005)
				local var_22_15 = arg_19_1:FormatText(var_22_14.content)

				arg_19_1.text_.text = var_22_15

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_16 = 4
				local var_22_17 = utf8.len(var_22_15)
				local var_22_18 = var_22_16 <= 0 and var_22_12 or var_22_12 * (var_22_17 / var_22_16)

				if var_22_18 > 0 and var_22_12 < var_22_18 then
					arg_19_1.talkMaxDuration = var_22_18

					if var_22_18 + var_22_11 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_18 + var_22_11
					end
				end

				arg_19_1.text_.text = var_22_15
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012005", "story_v_out_317012.awb") ~= 0 then
					local var_22_19 = manager.audio:GetVoiceLength("story_v_out_317012", "317012005", "story_v_out_317012.awb") / 1000

					if var_22_19 + var_22_11 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_11
					end

					if var_22_14.prefab_name ~= "" and arg_19_1.actors_[var_22_14.prefab_name] ~= nil then
						local var_22_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_14.prefab_name].transform, "story_v_out_317012", "317012005", "story_v_out_317012.awb")

						arg_19_1:RecordAudio("317012005", var_22_20)
						arg_19_1:RecordAudio("317012005", var_22_20)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_317012", "317012005", "story_v_out_317012.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_317012", "317012005", "story_v_out_317012.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_21 = math.max(var_22_12, arg_19_1.talkMaxDuration)

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_21 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_11) / var_22_21

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_11 + var_22_21 and arg_19_1.time_ < var_22_11 + var_22_21 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play317012006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 317012006
		arg_23_1.duration_ = 9

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play317012007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "K09g"

			if arg_23_1.bgs_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(arg_23_1.paintGo_)

				var_26_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_26_0)
				var_26_1.name = var_26_0
				var_26_1.transform.parent = arg_23_1.stage_.transform
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.bgs_[var_26_0] = var_26_1
			end

			local var_26_2 = 2

			if var_26_2 < arg_23_1.time_ and arg_23_1.time_ <= var_26_2 + arg_26_0 then
				local var_26_3 = manager.ui.mainCamera.transform.localPosition
				local var_26_4 = Vector3.New(0, 0, 10) + Vector3.New(var_26_3.x, var_26_3.y, 0)
				local var_26_5 = arg_23_1.bgs_.K09g

				var_26_5.transform.localPosition = var_26_4
				var_26_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_26_6 = var_26_5:GetComponent("SpriteRenderer")

				if var_26_6 and var_26_6.sprite then
					local var_26_7 = (var_26_5.transform.localPosition - var_26_3).z
					local var_26_8 = manager.ui.mainCameraCom_
					local var_26_9 = 2 * var_26_7 * Mathf.Tan(var_26_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_26_10 = var_26_9 * var_26_8.aspect
					local var_26_11 = var_26_6.sprite.bounds.size.x
					local var_26_12 = var_26_6.sprite.bounds.size.y
					local var_26_13 = var_26_10 / var_26_11
					local var_26_14 = var_26_9 / var_26_12
					local var_26_15 = var_26_14 < var_26_13 and var_26_13 or var_26_14

					var_26_5.transform.localScale = Vector3.New(var_26_15, var_26_15, 0)
				end

				for iter_26_0, iter_26_1 in pairs(arg_23_1.bgs_) do
					if iter_26_0 ~= "K09g" then
						iter_26_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.mask_.enabled = true
				arg_23_1.mask_.raycastTarget = true

				arg_23_1:SetGaussion(false)
			end

			local var_26_17 = 2

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17
				local var_26_19 = Color.New(0, 0, 0)

				var_26_19.a = Mathf.Lerp(0, 1, var_26_18)
				arg_23_1.mask_.color = var_26_19
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				local var_26_20 = Color.New(0, 0, 0)

				var_26_20.a = 1
				arg_23_1.mask_.color = var_26_20
			end

			local var_26_21 = 2

			if var_26_21 < arg_23_1.time_ and arg_23_1.time_ <= var_26_21 + arg_26_0 then
				arg_23_1.mask_.enabled = true
				arg_23_1.mask_.raycastTarget = true

				arg_23_1:SetGaussion(false)
			end

			local var_26_22 = 2

			if var_26_21 <= arg_23_1.time_ and arg_23_1.time_ < var_26_21 + var_26_22 then
				local var_26_23 = (arg_23_1.time_ - var_26_21) / var_26_22
				local var_26_24 = Color.New(0, 0, 0)

				var_26_24.a = Mathf.Lerp(1, 0, var_26_23)
				arg_23_1.mask_.color = var_26_24
			end

			if arg_23_1.time_ >= var_26_21 + var_26_22 and arg_23_1.time_ < var_26_21 + var_26_22 + arg_26_0 then
				local var_26_25 = Color.New(0, 0, 0)
				local var_26_26 = 0

				arg_23_1.mask_.enabled = false
				var_26_25.a = var_26_26
				arg_23_1.mask_.color = var_26_25
			end

			local var_26_27 = arg_23_1.actors_["1199ui_story"].transform
			local var_26_28 = 2

			if var_26_28 < arg_23_1.time_ and arg_23_1.time_ <= var_26_28 + arg_26_0 then
				arg_23_1.var_.moveOldPos1199ui_story = var_26_27.localPosition
			end

			local var_26_29 = 0.001

			if var_26_28 <= arg_23_1.time_ and arg_23_1.time_ < var_26_28 + var_26_29 then
				local var_26_30 = (arg_23_1.time_ - var_26_28) / var_26_29
				local var_26_31 = Vector3.New(0, 100, 0)

				var_26_27.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1199ui_story, var_26_31, var_26_30)

				local var_26_32 = manager.ui.mainCamera.transform.position - var_26_27.position

				var_26_27.forward = Vector3.New(var_26_32.x, var_26_32.y, var_26_32.z)

				local var_26_33 = var_26_27.localEulerAngles

				var_26_33.z = 0
				var_26_33.x = 0
				var_26_27.localEulerAngles = var_26_33
			end

			if arg_23_1.time_ >= var_26_28 + var_26_29 and arg_23_1.time_ < var_26_28 + var_26_29 + arg_26_0 then
				var_26_27.localPosition = Vector3.New(0, 100, 0)

				local var_26_34 = manager.ui.mainCamera.transform.position - var_26_27.position

				var_26_27.forward = Vector3.New(var_26_34.x, var_26_34.y, var_26_34.z)

				local var_26_35 = var_26_27.localEulerAngles

				var_26_35.z = 0
				var_26_35.x = 0
				var_26_27.localEulerAngles = var_26_35
			end

			local var_26_36 = manager.ui.mainCamera.transform
			local var_26_37 = 4

			if var_26_37 < arg_23_1.time_ and arg_23_1.time_ <= var_26_37 + arg_26_0 then
				local var_26_38 = arg_23_1.var_.effectposui1

				if not var_26_38 then
					var_26_38 = Object.Instantiate(Asset.Load("Effect/Scene/fx_scence_pingmu_niuqu"))
					var_26_38.name = "posui1"
					arg_23_1.var_.effectposui1 = var_26_38
				end

				local var_26_39 = var_26_36:Find("")

				if var_26_39 then
					var_26_38.transform.parent = var_26_39
				else
					var_26_38.transform.parent = var_26_36
				end

				var_26_38.transform.localPosition = Vector3.New(0, 0, 0)
				var_26_38.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			if arg_23_1.frameCnt_ <= 1 then
				arg_23_1.dialog_:SetActive(false)
			end

			local var_26_40 = 4
			local var_26_41 = 1.425

			if var_26_40 < arg_23_1.time_ and arg_23_1.time_ <= var_26_40 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0

				arg_23_1.dialog_:SetActive(true)

				local var_26_42 = LeanTween.value(arg_23_1.dialog_, 0, 1, 0.3)

				var_26_42:setOnUpdate(LuaHelper.FloatAction(function(arg_27_0)
					arg_23_1.dialogCg_.alpha = arg_27_0
				end))
				var_26_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_23_1.dialog_)
					var_26_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_23_1.duration_ = arg_23_1.duration_ + 0.3

				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_43 = arg_23_1:GetWordFromCfg(317012006)
				local var_26_44 = arg_23_1:FormatText(var_26_43.content)

				arg_23_1.text_.text = var_26_44

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_45 = 57
				local var_26_46 = utf8.len(var_26_44)
				local var_26_47 = var_26_45 <= 0 and var_26_41 or var_26_41 * (var_26_46 / var_26_45)

				if var_26_47 > 0 and var_26_41 < var_26_47 then
					arg_23_1.talkMaxDuration = var_26_47
					var_26_40 = var_26_40 + 0.3

					if var_26_47 + var_26_40 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_47 + var_26_40
					end
				end

				arg_23_1.text_.text = var_26_44
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_48 = var_26_40 + 0.3
			local var_26_49 = math.max(var_26_41, arg_23_1.talkMaxDuration)

			if var_26_48 <= arg_23_1.time_ and arg_23_1.time_ < var_26_48 + var_26_49 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_48) / var_26_49

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_48 + var_26_49 and arg_23_1.time_ < var_26_48 + var_26_49 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play317012007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 317012007
		arg_29_1.duration_ = 10

		local var_29_0 = {
			zh = 9.366,
			ja = 10
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play317012008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = "K09h"

			if arg_29_1.bgs_[var_32_0] == nil then
				local var_32_1 = Object.Instantiate(arg_29_1.paintGo_)

				var_32_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_32_0)
				var_32_1.name = var_32_0
				var_32_1.transform.parent = arg_29_1.stage_.transform
				var_32_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.bgs_[var_32_0] = var_32_1
			end

			local var_32_2 = 2

			if var_32_2 < arg_29_1.time_ and arg_29_1.time_ <= var_32_2 + arg_32_0 then
				local var_32_3 = manager.ui.mainCamera.transform.localPosition
				local var_32_4 = Vector3.New(0, 0, 10) + Vector3.New(var_32_3.x, var_32_3.y, 0)
				local var_32_5 = arg_29_1.bgs_.K09h

				var_32_5.transform.localPosition = var_32_4
				var_32_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_32_6 = var_32_5:GetComponent("SpriteRenderer")

				if var_32_6 and var_32_6.sprite then
					local var_32_7 = (var_32_5.transform.localPosition - var_32_3).z
					local var_32_8 = manager.ui.mainCameraCom_
					local var_32_9 = 2 * var_32_7 * Mathf.Tan(var_32_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_32_10 = var_32_9 * var_32_8.aspect
					local var_32_11 = var_32_6.sprite.bounds.size.x
					local var_32_12 = var_32_6.sprite.bounds.size.y
					local var_32_13 = var_32_10 / var_32_11
					local var_32_14 = var_32_9 / var_32_12
					local var_32_15 = var_32_14 < var_32_13 and var_32_13 or var_32_14

					var_32_5.transform.localScale = Vector3.New(var_32_15, var_32_15, 0)
				end

				for iter_32_0, iter_32_1 in pairs(arg_29_1.bgs_) do
					if iter_32_0 ~= "K09h" then
						iter_32_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_32_16 = 0

			if var_32_16 < arg_29_1.time_ and arg_29_1.time_ <= var_32_16 + arg_32_0 then
				arg_29_1.mask_.enabled = true
				arg_29_1.mask_.raycastTarget = true

				arg_29_1:SetGaussion(false)
			end

			local var_32_17 = 2

			if var_32_16 <= arg_29_1.time_ and arg_29_1.time_ < var_32_16 + var_32_17 then
				local var_32_18 = (arg_29_1.time_ - var_32_16) / var_32_17
				local var_32_19 = Color.New(0, 0, 0)

				var_32_19.a = Mathf.Lerp(0, 1, var_32_18)
				arg_29_1.mask_.color = var_32_19
			end

			if arg_29_1.time_ >= var_32_16 + var_32_17 and arg_29_1.time_ < var_32_16 + var_32_17 + arg_32_0 then
				local var_32_20 = Color.New(0, 0, 0)

				var_32_20.a = 1
				arg_29_1.mask_.color = var_32_20
			end

			local var_32_21 = 2

			if var_32_21 < arg_29_1.time_ and arg_29_1.time_ <= var_32_21 + arg_32_0 then
				arg_29_1.mask_.enabled = true
				arg_29_1.mask_.raycastTarget = true

				arg_29_1:SetGaussion(false)
			end

			local var_32_22 = 2

			if var_32_21 <= arg_29_1.time_ and arg_29_1.time_ < var_32_21 + var_32_22 then
				local var_32_23 = (arg_29_1.time_ - var_32_21) / var_32_22
				local var_32_24 = Color.New(0, 0, 0)

				var_32_24.a = Mathf.Lerp(1, 0, var_32_23)
				arg_29_1.mask_.color = var_32_24
			end

			if arg_29_1.time_ >= var_32_21 + var_32_22 and arg_29_1.time_ < var_32_21 + var_32_22 + arg_32_0 then
				local var_32_25 = Color.New(0, 0, 0)
				local var_32_26 = 0

				arg_29_1.mask_.enabled = false
				var_32_25.a = var_32_26
				arg_29_1.mask_.color = var_32_25
			end

			local var_32_27 = manager.ui.mainCamera.transform
			local var_32_28 = 2

			if var_32_28 < arg_29_1.time_ and arg_29_1.time_ <= var_32_28 + arg_32_0 then
				local var_32_29 = arg_29_1.var_.effectposui1

				if var_32_29 then
					Object.Destroy(var_32_29)

					arg_29_1.var_.effectposui1 = nil
				end
			end

			if arg_29_1.frameCnt_ <= 1 then
				arg_29_1.dialog_:SetActive(false)
			end

			local var_32_30 = 4
			local var_32_31 = 0.525

			if var_32_30 < arg_29_1.time_ and arg_29_1.time_ <= var_32_30 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0

				arg_29_1.dialog_:SetActive(true)

				local var_32_32 = LeanTween.value(arg_29_1.dialog_, 0, 1, 0.3)

				var_32_32:setOnUpdate(LuaHelper.FloatAction(function(arg_33_0)
					arg_29_1.dialogCg_.alpha = arg_33_0
				end))
				var_32_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_29_1.dialog_)
					var_32_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_29_1.duration_ = arg_29_1.duration_ + 0.3

				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_33 = arg_29_1:FormatText(StoryNameCfg[477].name)

				arg_29_1.leftNameTxt_.text = var_32_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, true)
				arg_29_1.iconController_:SetSelectedState("hero")

				arg_29_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10053")

				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_34 = arg_29_1:GetWordFromCfg(317012007)
				local var_32_35 = arg_29_1:FormatText(var_32_34.content)

				arg_29_1.text_.text = var_32_35

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_36 = 21
				local var_32_37 = utf8.len(var_32_35)
				local var_32_38 = var_32_36 <= 0 and var_32_31 or var_32_31 * (var_32_37 / var_32_36)

				if var_32_38 > 0 and var_32_31 < var_32_38 then
					arg_29_1.talkMaxDuration = var_32_38
					var_32_30 = var_32_30 + 0.3

					if var_32_38 + var_32_30 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_38 + var_32_30
					end
				end

				arg_29_1.text_.text = var_32_35
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012007", "story_v_out_317012.awb") ~= 0 then
					local var_32_39 = manager.audio:GetVoiceLength("story_v_out_317012", "317012007", "story_v_out_317012.awb") / 1000

					if var_32_39 + var_32_30 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_39 + var_32_30
					end

					if var_32_34.prefab_name ~= "" and arg_29_1.actors_[var_32_34.prefab_name] ~= nil then
						local var_32_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_34.prefab_name].transform, "story_v_out_317012", "317012007", "story_v_out_317012.awb")

						arg_29_1:RecordAudio("317012007", var_32_40)
						arg_29_1:RecordAudio("317012007", var_32_40)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_317012", "317012007", "story_v_out_317012.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_317012", "317012007", "story_v_out_317012.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_41 = var_32_30 + 0.3
			local var_32_42 = math.max(var_32_31, arg_29_1.talkMaxDuration)

			if var_32_41 <= arg_29_1.time_ and arg_29_1.time_ < var_32_41 + var_32_42 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_41) / var_32_42

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_41 + var_32_42 and arg_29_1.time_ < var_32_41 + var_32_42 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play317012008 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 317012008
		arg_35_1.duration_ = 4.3

		local var_35_0 = {
			zh = 1.366,
			ja = 4.3
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
				arg_35_0:Play317012009(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.125

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[526].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(317012008)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012008", "story_v_out_317012.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012008", "story_v_out_317012.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_317012", "317012008", "story_v_out_317012.awb")

						arg_35_1:RecordAudio("317012008", var_38_9)
						arg_35_1:RecordAudio("317012008", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_317012", "317012008", "story_v_out_317012.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_317012", "317012008", "story_v_out_317012.awb")
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
	Play317012009 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 317012009
		arg_39_1.duration_ = 2.6

		local var_39_0 = {
			zh = 2.6,
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
				arg_39_0:Play317012010(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.3

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[477].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10053")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(317012009)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012009", "story_v_out_317012.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012009", "story_v_out_317012.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_317012", "317012009", "story_v_out_317012.awb")

						arg_39_1:RecordAudio("317012009", var_42_9)
						arg_39_1:RecordAudio("317012009", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_317012", "317012009", "story_v_out_317012.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_317012", "317012009", "story_v_out_317012.awb")
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
	Play317012010 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 317012010
		arg_43_1.duration_ = 9.5

		local var_43_0 = {
			zh = 3.633,
			ja = 9.5
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
				arg_43_0:Play317012011(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.375

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[526].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(317012010)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012010", "story_v_out_317012.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012010", "story_v_out_317012.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_317012", "317012010", "story_v_out_317012.awb")

						arg_43_1:RecordAudio("317012010", var_46_9)
						arg_43_1:RecordAudio("317012010", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_317012", "317012010", "story_v_out_317012.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_317012", "317012010", "story_v_out_317012.awb")
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
	Play317012011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 317012011
		arg_47_1.duration_ = 5.7

		local var_47_0 = {
			zh = 3.866,
			ja = 5.7
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
				arg_47_0:Play317012012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.275

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[477].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10053")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(317012011)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012011", "story_v_out_317012.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012011", "story_v_out_317012.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_317012", "317012011", "story_v_out_317012.awb")

						arg_47_1:RecordAudio("317012011", var_50_9)
						arg_47_1:RecordAudio("317012011", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_317012", "317012011", "story_v_out_317012.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_317012", "317012011", "story_v_out_317012.awb")
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
	Play317012012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 317012012
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play317012013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 1.125

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

				local var_54_2 = arg_51_1:GetWordFromCfg(317012012)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 45
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
	Play317012013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 317012013
		arg_55_1.duration_ = 4.333

		local var_55_0 = {
			zh = 2.1,
			ja = 4.333
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
				arg_55_0:Play317012014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.175

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[526].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(317012013)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012013", "story_v_out_317012.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012013", "story_v_out_317012.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_317012", "317012013", "story_v_out_317012.awb")

						arg_55_1:RecordAudio("317012013", var_58_9)
						arg_55_1:RecordAudio("317012013", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_317012", "317012013", "story_v_out_317012.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_317012", "317012013", "story_v_out_317012.awb")
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
	Play317012014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 317012014
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play317012015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.95

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

				local var_62_2 = arg_59_1:GetWordFromCfg(317012014)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 38
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
	Play317012015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 317012015
		arg_63_1.duration_ = 7.7

		local var_63_0 = {
			zh = 4.1,
			ja = 7.7
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
				arg_63_0:Play317012016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.35

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[526].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(317012015)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 14
				local var_66_6 = utf8.len(var_66_4)
				local var_66_7 = var_66_5 <= 0 and var_66_1 or var_66_1 * (var_66_6 / var_66_5)

				if var_66_7 > 0 and var_66_1 < var_66_7 then
					arg_63_1.talkMaxDuration = var_66_7

					if var_66_7 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_7 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_4
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012015", "story_v_out_317012.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012015", "story_v_out_317012.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_317012", "317012015", "story_v_out_317012.awb")

						arg_63_1:RecordAudio("317012015", var_66_9)
						arg_63_1:RecordAudio("317012015", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_317012", "317012015", "story_v_out_317012.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_317012", "317012015", "story_v_out_317012.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_10 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_10 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_10

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_10 and arg_63_1.time_ < var_66_0 + var_66_10 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play317012016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 317012016
		arg_67_1.duration_ = 2.666

		local var_67_0 = {
			zh = 2.666,
			ja = 2.233
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
				arg_67_0:Play317012017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.1

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[477].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10053")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(317012016)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 4
				local var_70_6 = utf8.len(var_70_4)
				local var_70_7 = var_70_5 <= 0 and var_70_1 or var_70_1 * (var_70_6 / var_70_5)

				if var_70_7 > 0 and var_70_1 < var_70_7 then
					arg_67_1.talkMaxDuration = var_70_7

					if var_70_7 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_7 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_4
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012016", "story_v_out_317012.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012016", "story_v_out_317012.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_317012", "317012016", "story_v_out_317012.awb")

						arg_67_1:RecordAudio("317012016", var_70_9)
						arg_67_1:RecordAudio("317012016", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_317012", "317012016", "story_v_out_317012.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_317012", "317012016", "story_v_out_317012.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_10 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_10 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_10

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_10 and arg_67_1.time_ < var_70_0 + var_70_10 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play317012017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 317012017
		arg_71_1.duration_ = 9

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play317012018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = "YA0101"

			if arg_71_1.bgs_[var_74_0] == nil then
				local var_74_1 = Object.Instantiate(arg_71_1.paintGo_)

				var_74_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_74_0)
				var_74_1.name = var_74_0
				var_74_1.transform.parent = arg_71_1.stage_.transform
				var_74_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_71_1.bgs_[var_74_0] = var_74_1
			end

			local var_74_2 = 2

			if var_74_2 < arg_71_1.time_ and arg_71_1.time_ <= var_74_2 + arg_74_0 then
				local var_74_3 = manager.ui.mainCamera.transform.localPosition
				local var_74_4 = Vector3.New(0, 0, 10) + Vector3.New(var_74_3.x, var_74_3.y, 0)
				local var_74_5 = arg_71_1.bgs_.YA0101

				var_74_5.transform.localPosition = var_74_4
				var_74_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_74_6 = var_74_5:GetComponent("SpriteRenderer")

				if var_74_6 and var_74_6.sprite then
					local var_74_7 = (var_74_5.transform.localPosition - var_74_3).z
					local var_74_8 = manager.ui.mainCameraCom_
					local var_74_9 = 2 * var_74_7 * Mathf.Tan(var_74_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_74_10 = var_74_9 * var_74_8.aspect
					local var_74_11 = var_74_6.sprite.bounds.size.x
					local var_74_12 = var_74_6.sprite.bounds.size.y
					local var_74_13 = var_74_10 / var_74_11
					local var_74_14 = var_74_9 / var_74_12
					local var_74_15 = var_74_14 < var_74_13 and var_74_13 or var_74_14

					var_74_5.transform.localScale = Vector3.New(var_74_15, var_74_15, 0)
				end

				for iter_74_0, iter_74_1 in pairs(arg_71_1.bgs_) do
					if iter_74_0 ~= "YA0101" then
						iter_74_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_17 = 2

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / var_74_17
				local var_74_19 = Color.New(0, 0, 0)

				var_74_19.a = Mathf.Lerp(0, 1, var_74_18)
				arg_71_1.mask_.color = var_74_19
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 then
				local var_74_20 = Color.New(0, 0, 0)

				var_74_20.a = 1
				arg_71_1.mask_.color = var_74_20
			end

			local var_74_21 = 2

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_22 = 2

			if var_74_21 <= arg_71_1.time_ and arg_71_1.time_ < var_74_21 + var_74_22 then
				local var_74_23 = (arg_71_1.time_ - var_74_21) / var_74_22
				local var_74_24 = Color.New(0, 0, 0)

				var_74_24.a = Mathf.Lerp(1, 0, var_74_23)
				arg_71_1.mask_.color = var_74_24
			end

			if arg_71_1.time_ >= var_74_21 + var_74_22 and arg_71_1.time_ < var_74_21 + var_74_22 + arg_74_0 then
				local var_74_25 = Color.New(0, 0, 0)
				local var_74_26 = 0

				arg_71_1.mask_.enabled = false
				var_74_25.a = var_74_26
				arg_71_1.mask_.color = var_74_25
			end

			local var_74_27 = arg_71_1.bgs_.YA0101.transform
			local var_74_28 = 2

			if var_74_28 < arg_71_1.time_ and arg_71_1.time_ <= var_74_28 + arg_74_0 then
				arg_71_1.var_.moveOldPosYA0101 = var_74_27.localPosition
			end

			local var_74_29 = 0.001

			if var_74_28 <= arg_71_1.time_ and arg_71_1.time_ < var_74_28 + var_74_29 then
				local var_74_30 = (arg_71_1.time_ - var_74_28) / var_74_29
				local var_74_31 = Vector3.New(0, 1, 10)

				var_74_27.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPosYA0101, var_74_31, var_74_30)
			end

			if arg_71_1.time_ >= var_74_28 + var_74_29 and arg_71_1.time_ < var_74_28 + var_74_29 + arg_74_0 then
				var_74_27.localPosition = Vector3.New(0, 1, 10)
			end

			local var_74_32 = arg_71_1.bgs_.YA0101.transform
			local var_74_33 = 2.034

			if var_74_33 < arg_71_1.time_ and arg_71_1.time_ <= var_74_33 + arg_74_0 then
				arg_71_1.var_.moveOldPosYA0101 = var_74_32.localPosition
			end

			local var_74_34 = 4

			if var_74_33 <= arg_71_1.time_ and arg_71_1.time_ < var_74_33 + var_74_34 then
				local var_74_35 = (arg_71_1.time_ - var_74_33) / var_74_34
				local var_74_36 = Vector3.New(0, 1, 9)

				var_74_32.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPosYA0101, var_74_36, var_74_35)
			end

			if arg_71_1.time_ >= var_74_33 + var_74_34 and arg_71_1.time_ < var_74_33 + var_74_34 + arg_74_0 then
				var_74_32.localPosition = Vector3.New(0, 1, 9)
			end

			if arg_71_1.frameCnt_ <= 1 then
				arg_71_1.dialog_:SetActive(false)
			end

			local var_74_37 = 4
			local var_74_38 = 2

			if var_74_37 < arg_71_1.time_ and arg_71_1.time_ <= var_74_37 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				arg_71_1.dialog_:SetActive(true)

				local var_74_39 = LeanTween.value(arg_71_1.dialog_, 0, 1, 0.3)

				var_74_39:setOnUpdate(LuaHelper.FloatAction(function(arg_75_0)
					arg_71_1.dialogCg_.alpha = arg_75_0
				end))
				var_74_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_71_1.dialog_)
					var_74_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_71_1.duration_ = arg_71_1.duration_ + 0.3

				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_40 = arg_71_1:GetWordFromCfg(317012017)
				local var_74_41 = arg_71_1:FormatText(var_74_40.content)

				arg_71_1.text_.text = var_74_41

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_42 = 80
				local var_74_43 = utf8.len(var_74_41)
				local var_74_44 = var_74_42 <= 0 and var_74_38 or var_74_38 * (var_74_43 / var_74_42)

				if var_74_44 > 0 and var_74_38 < var_74_44 then
					arg_71_1.talkMaxDuration = var_74_44
					var_74_37 = var_74_37 + 0.3

					if var_74_44 + var_74_37 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_44 + var_74_37
					end
				end

				arg_71_1.text_.text = var_74_41
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_45 = var_74_37 + 0.3
			local var_74_46 = math.max(var_74_38, arg_71_1.talkMaxDuration)

			if var_74_45 <= arg_71_1.time_ and arg_71_1.time_ < var_74_45 + var_74_46 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_45) / var_74_46

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_45 + var_74_46 and arg_71_1.time_ < var_74_45 + var_74_46 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play317012018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 317012018
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play317012019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.7

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_2 = arg_77_1:GetWordFromCfg(317012018)
				local var_80_3 = arg_77_1:FormatText(var_80_2.content)

				arg_77_1.text_.text = var_80_3

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_4 = 28
				local var_80_5 = utf8.len(var_80_3)
				local var_80_6 = var_80_4 <= 0 and var_80_1 or var_80_1 * (var_80_5 / var_80_4)

				if var_80_6 > 0 and var_80_1 < var_80_6 then
					arg_77_1.talkMaxDuration = var_80_6

					if var_80_6 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_6 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_3
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_7 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_7 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_7

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_7 and arg_77_1.time_ < var_80_0 + var_80_7 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play317012019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 317012019
		arg_81_1.duration_ = 11.266

		local var_81_0 = {
			zh = 7.2,
			ja = 11.266
		}
		local var_81_1 = manager.audio:GetLocalizationFlag()

		if var_81_0[var_81_1] ~= nil then
			arg_81_1.duration_ = var_81_0[var_81_1]
		end

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play317012020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.55

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[36].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(317012019)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 22
				local var_84_6 = utf8.len(var_84_4)
				local var_84_7 = var_84_5 <= 0 and var_84_1 or var_84_1 * (var_84_6 / var_84_5)

				if var_84_7 > 0 and var_84_1 < var_84_7 then
					arg_81_1.talkMaxDuration = var_84_7

					if var_84_7 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_7 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_4
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012019", "story_v_out_317012.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012019", "story_v_out_317012.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_317012", "317012019", "story_v_out_317012.awb")

						arg_81_1:RecordAudio("317012019", var_84_9)
						arg_81_1:RecordAudio("317012019", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_317012", "317012019", "story_v_out_317012.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_317012", "317012019", "story_v_out_317012.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_10 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_10 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_10

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_10 and arg_81_1.time_ < var_84_0 + var_84_10 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play317012020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 317012020
		arg_85_1.duration_ = 17.766

		local var_85_0 = {
			zh = 12.133,
			ja = 17.766
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
				arg_85_0:Play317012021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 1.1

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[36].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(317012020)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012020", "story_v_out_317012.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012020", "story_v_out_317012.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_317012", "317012020", "story_v_out_317012.awb")

						arg_85_1:RecordAudio("317012020", var_88_9)
						arg_85_1:RecordAudio("317012020", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_317012", "317012020", "story_v_out_317012.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_317012", "317012020", "story_v_out_317012.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_10 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_10 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_10

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_10 and arg_85_1.time_ < var_88_0 + var_88_10 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play317012021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 317012021
		arg_89_1.duration_ = 4.633

		local var_89_0 = {
			zh = 3.8,
			ja = 4.633
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
				arg_89_0:Play317012022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.4

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[526].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(317012021)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 16
				local var_92_6 = utf8.len(var_92_4)
				local var_92_7 = var_92_5 <= 0 and var_92_1 or var_92_1 * (var_92_6 / var_92_5)

				if var_92_7 > 0 and var_92_1 < var_92_7 then
					arg_89_1.talkMaxDuration = var_92_7

					if var_92_7 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_7 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_4
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012021", "story_v_out_317012.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012021", "story_v_out_317012.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_317012", "317012021", "story_v_out_317012.awb")

						arg_89_1:RecordAudio("317012021", var_92_9)
						arg_89_1:RecordAudio("317012021", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_317012", "317012021", "story_v_out_317012.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_317012", "317012021", "story_v_out_317012.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_10 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_10 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_10

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_10 and arg_89_1.time_ < var_92_0 + var_92_10 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play317012022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 317012022
		arg_93_1.duration_ = 22.2

		local var_93_0 = {
			zh = 16.1,
			ja = 22.2
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
				arg_93_0:Play317012023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 1.4

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[36].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(317012022)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012022", "story_v_out_317012.awb") ~= 0 then
					local var_96_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012022", "story_v_out_317012.awb") / 1000

					if var_96_8 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_8 + var_96_0
					end

					if var_96_3.prefab_name ~= "" and arg_93_1.actors_[var_96_3.prefab_name] ~= nil then
						local var_96_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_3.prefab_name].transform, "story_v_out_317012", "317012022", "story_v_out_317012.awb")

						arg_93_1:RecordAudio("317012022", var_96_9)
						arg_93_1:RecordAudio("317012022", var_96_9)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_317012", "317012022", "story_v_out_317012.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_317012", "317012022", "story_v_out_317012.awb")
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
	Play317012023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 317012023
		arg_97_1.duration_ = 5.133

		local var_97_0 = {
			zh = 1.666,
			ja = 5.133
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
				arg_97_0:Play317012024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.15

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[526].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(317012023)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012023", "story_v_out_317012.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012023", "story_v_out_317012.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_317012", "317012023", "story_v_out_317012.awb")

						arg_97_1:RecordAudio("317012023", var_100_9)
						arg_97_1:RecordAudio("317012023", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_317012", "317012023", "story_v_out_317012.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_317012", "317012023", "story_v_out_317012.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_10 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_10 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_10

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_10 and arg_97_1.time_ < var_100_0 + var_100_10 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play317012024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 317012024
		arg_101_1.duration_ = 21.366

		local var_101_0 = {
			zh = 10.6,
			ja = 21.366
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
				arg_101_0:Play317012025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 1.025

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[36].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(317012024)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012024", "story_v_out_317012.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012024", "story_v_out_317012.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_317012", "317012024", "story_v_out_317012.awb")

						arg_101_1:RecordAudio("317012024", var_104_9)
						arg_101_1:RecordAudio("317012024", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_317012", "317012024", "story_v_out_317012.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_317012", "317012024", "story_v_out_317012.awb")
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
	Play317012025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 317012025
		arg_105_1.duration_ = 2.033

		local var_105_0 = {
			zh = 0.999999999999,
			ja = 2.033
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
				arg_105_0:Play317012026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.05

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[526].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(317012025)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 2
				local var_108_6 = utf8.len(var_108_4)
				local var_108_7 = var_108_5 <= 0 and var_108_1 or var_108_1 * (var_108_6 / var_108_5)

				if var_108_7 > 0 and var_108_1 < var_108_7 then
					arg_105_1.talkMaxDuration = var_108_7

					if var_108_7 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_7 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_4
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012025", "story_v_out_317012.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012025", "story_v_out_317012.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_317012", "317012025", "story_v_out_317012.awb")

						arg_105_1:RecordAudio("317012025", var_108_9)
						arg_105_1:RecordAudio("317012025", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_317012", "317012025", "story_v_out_317012.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_317012", "317012025", "story_v_out_317012.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_10 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_10 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_10

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_10 and arg_105_1.time_ < var_108_0 + var_108_10 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play317012026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 317012026
		arg_109_1.duration_ = 22.9

		local var_109_0 = {
			zh = 18.7,
			ja = 22.9
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
				arg_109_0:Play317012027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1.375

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[36].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(317012026)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 55
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012026", "story_v_out_317012.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012026", "story_v_out_317012.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_317012", "317012026", "story_v_out_317012.awb")

						arg_109_1:RecordAudio("317012026", var_112_9)
						arg_109_1:RecordAudio("317012026", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_317012", "317012026", "story_v_out_317012.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_317012", "317012026", "story_v_out_317012.awb")
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
	Play317012027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 317012027
		arg_113_1.duration_ = 21.333

		local var_113_0 = {
			zh = 17.666,
			ja = 21.333
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
				arg_113_0:Play317012028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.375

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[36].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(317012027)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 55
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012027", "story_v_out_317012.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012027", "story_v_out_317012.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_317012", "317012027", "story_v_out_317012.awb")

						arg_113_1:RecordAudio("317012027", var_116_9)
						arg_113_1:RecordAudio("317012027", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_317012", "317012027", "story_v_out_317012.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_317012", "317012027", "story_v_out_317012.awb")
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
	Play317012028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 317012028
		arg_117_1.duration_ = 22.666

		local var_117_0 = {
			zh = 15.4,
			ja = 22.666
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
				arg_117_0:Play317012029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 1.35

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[36].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(317012028)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 54
				local var_120_6 = utf8.len(var_120_4)
				local var_120_7 = var_120_5 <= 0 and var_120_1 or var_120_1 * (var_120_6 / var_120_5)

				if var_120_7 > 0 and var_120_1 < var_120_7 then
					arg_117_1.talkMaxDuration = var_120_7

					if var_120_7 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_7 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_4
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012028", "story_v_out_317012.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012028", "story_v_out_317012.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_out_317012", "317012028", "story_v_out_317012.awb")

						arg_117_1:RecordAudio("317012028", var_120_9)
						arg_117_1:RecordAudio("317012028", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_317012", "317012028", "story_v_out_317012.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_317012", "317012028", "story_v_out_317012.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_10 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_10 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_10

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_10 and arg_117_1.time_ < var_120_0 + var_120_10 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play317012029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 317012029
		arg_121_1.duration_ = 9.1

		local var_121_0 = {
			zh = 4.633,
			ja = 9.1
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
				arg_121_0:Play317012030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.375

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[36].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(317012029)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 15
				local var_124_6 = utf8.len(var_124_4)
				local var_124_7 = var_124_5 <= 0 and var_124_1 or var_124_1 * (var_124_6 / var_124_5)

				if var_124_7 > 0 and var_124_1 < var_124_7 then
					arg_121_1.talkMaxDuration = var_124_7

					if var_124_7 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_7 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_4
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012029", "story_v_out_317012.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012029", "story_v_out_317012.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_out_317012", "317012029", "story_v_out_317012.awb")

						arg_121_1:RecordAudio("317012029", var_124_9)
						arg_121_1:RecordAudio("317012029", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_317012", "317012029", "story_v_out_317012.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_317012", "317012029", "story_v_out_317012.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_10 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_10 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_10

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_10 and arg_121_1.time_ < var_124_0 + var_124_10 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play317012030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 317012030
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play317012031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.725

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_2 = arg_125_1:GetWordFromCfg(317012030)
				local var_128_3 = arg_125_1:FormatText(var_128_2.content)

				arg_125_1.text_.text = var_128_3

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_4 = 29
				local var_128_5 = utf8.len(var_128_3)
				local var_128_6 = var_128_4 <= 0 and var_128_1 or var_128_1 * (var_128_5 / var_128_4)

				if var_128_6 > 0 and var_128_1 < var_128_6 then
					arg_125_1.talkMaxDuration = var_128_6

					if var_128_6 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_6 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_3
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_7 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_7 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_7

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_7 and arg_125_1.time_ < var_128_0 + var_128_7 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play317012031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 317012031
		arg_129_1.duration_ = 4.966

		local var_129_0 = {
			zh = 3.566,
			ja = 4.966
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
				arg_129_0:Play317012032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.3

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

				local var_132_3 = arg_129_1:GetWordFromCfg(317012031)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012031", "story_v_out_317012.awb") ~= 0 then
					local var_132_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012031", "story_v_out_317012.awb") / 1000

					if var_132_8 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_8 + var_132_0
					end

					if var_132_3.prefab_name ~= "" and arg_129_1.actors_[var_132_3.prefab_name] ~= nil then
						local var_132_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_3.prefab_name].transform, "story_v_out_317012", "317012031", "story_v_out_317012.awb")

						arg_129_1:RecordAudio("317012031", var_132_9)
						arg_129_1:RecordAudio("317012031", var_132_9)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_317012", "317012031", "story_v_out_317012.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_317012", "317012031", "story_v_out_317012.awb")
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
	Play317012032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 317012032
		arg_133_1.duration_ = 9.7

		local var_133_0 = {
			zh = 8.933,
			ja = 9.7
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
				arg_133_0:Play317012033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 0.75

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[526].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(317012032)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 30
				local var_136_6 = utf8.len(var_136_4)
				local var_136_7 = var_136_5 <= 0 and var_136_1 or var_136_1 * (var_136_6 / var_136_5)

				if var_136_7 > 0 and var_136_1 < var_136_7 then
					arg_133_1.talkMaxDuration = var_136_7

					if var_136_7 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_7 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_4
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012032", "story_v_out_317012.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012032", "story_v_out_317012.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_317012", "317012032", "story_v_out_317012.awb")

						arg_133_1:RecordAudio("317012032", var_136_9)
						arg_133_1:RecordAudio("317012032", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_317012", "317012032", "story_v_out_317012.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_317012", "317012032", "story_v_out_317012.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_10 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_10 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_10

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_10 and arg_133_1.time_ < var_136_0 + var_136_10 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play317012033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 317012033
		arg_137_1.duration_ = 5.7

		local var_137_0 = {
			zh = 4.3,
			ja = 5.7
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
				arg_137_0:Play317012034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.375

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[36].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(317012033)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 15
				local var_140_6 = utf8.len(var_140_4)
				local var_140_7 = var_140_5 <= 0 and var_140_1 or var_140_1 * (var_140_6 / var_140_5)

				if var_140_7 > 0 and var_140_1 < var_140_7 then
					arg_137_1.talkMaxDuration = var_140_7

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_4
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012033", "story_v_out_317012.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012033", "story_v_out_317012.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_317012", "317012033", "story_v_out_317012.awb")

						arg_137_1:RecordAudio("317012033", var_140_9)
						arg_137_1:RecordAudio("317012033", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_317012", "317012033", "story_v_out_317012.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_317012", "317012033", "story_v_out_317012.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_10 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_10 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_10

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_10 and arg_137_1.time_ < var_140_0 + var_140_10 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play317012034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 317012034
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play317012035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.9

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_2 = arg_141_1:GetWordFromCfg(317012034)
				local var_144_3 = arg_141_1:FormatText(var_144_2.content)

				arg_141_1.text_.text = var_144_3

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_4 = 36
				local var_144_5 = utf8.len(var_144_3)
				local var_144_6 = var_144_4 <= 0 and var_144_1 or var_144_1 * (var_144_5 / var_144_4)

				if var_144_6 > 0 and var_144_1 < var_144_6 then
					arg_141_1.talkMaxDuration = var_144_6

					if var_144_6 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_6 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_3
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_7 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_7 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_7

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_7 and arg_141_1.time_ < var_144_0 + var_144_7 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play317012035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 317012035
		arg_145_1.duration_ = 7

		local var_145_0 = {
			zh = 2.5,
			ja = 7
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
				arg_145_0:Play317012036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.125

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[36].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(317012035)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012035", "story_v_out_317012.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012035", "story_v_out_317012.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_317012", "317012035", "story_v_out_317012.awb")

						arg_145_1:RecordAudio("317012035", var_148_9)
						arg_145_1:RecordAudio("317012035", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_317012", "317012035", "story_v_out_317012.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_317012", "317012035", "story_v_out_317012.awb")
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
	Play317012036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 317012036
		arg_149_1.duration_ = 3.8

		local var_149_0 = {
			zh = 2.466,
			ja = 3.8
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
				arg_149_0:Play317012037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.325

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[526].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(317012036)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012036", "story_v_out_317012.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012036", "story_v_out_317012.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_317012", "317012036", "story_v_out_317012.awb")

						arg_149_1:RecordAudio("317012036", var_152_9)
						arg_149_1:RecordAudio("317012036", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_317012", "317012036", "story_v_out_317012.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_317012", "317012036", "story_v_out_317012.awb")
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
	Play317012037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 317012037
		arg_153_1.duration_ = 5.933

		local var_153_0 = {
			zh = 1.5,
			ja = 5.933
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
				arg_153_0:Play317012038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.175

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[526].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(317012037)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 7
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012037", "story_v_out_317012.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012037", "story_v_out_317012.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_317012", "317012037", "story_v_out_317012.awb")

						arg_153_1:RecordAudio("317012037", var_156_9)
						arg_153_1:RecordAudio("317012037", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_317012", "317012037", "story_v_out_317012.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_317012", "317012037", "story_v_out_317012.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_10 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_10 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_10

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_10 and arg_153_1.time_ < var_156_0 + var_156_10 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play317012038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 317012038
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play317012039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 1.175

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_2 = arg_157_1:GetWordFromCfg(317012038)
				local var_160_3 = arg_157_1:FormatText(var_160_2.content)

				arg_157_1.text_.text = var_160_3

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_4 = 47
				local var_160_5 = utf8.len(var_160_3)
				local var_160_6 = var_160_4 <= 0 and var_160_1 or var_160_1 * (var_160_5 / var_160_4)

				if var_160_6 > 0 and var_160_1 < var_160_6 then
					arg_157_1.talkMaxDuration = var_160_6

					if var_160_6 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_6 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_3
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_7 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_7 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_7

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_7 and arg_157_1.time_ < var_160_0 + var_160_7 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play317012039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 317012039
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play317012040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.375

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_2 = arg_161_1:GetWordFromCfg(317012039)
				local var_164_3 = arg_161_1:FormatText(var_164_2.content)

				arg_161_1.text_.text = var_164_3

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_4 = 15
				local var_164_5 = utf8.len(var_164_3)
				local var_164_6 = var_164_4 <= 0 and var_164_1 or var_164_1 * (var_164_5 / var_164_4)

				if var_164_6 > 0 and var_164_1 < var_164_6 then
					arg_161_1.talkMaxDuration = var_164_6

					if var_164_6 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_6 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_3
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_7 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_7 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_7

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_7 and arg_161_1.time_ < var_164_0 + var_164_7 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play317012040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 317012040
		arg_165_1.duration_ = 13

		local var_165_0 = {
			zh = 5.7,
			ja = 13
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
				arg_165_0:Play317012041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.475

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[36].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(317012040)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012040", "story_v_out_317012.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012040", "story_v_out_317012.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_out_317012", "317012040", "story_v_out_317012.awb")

						arg_165_1:RecordAudio("317012040", var_168_9)
						arg_165_1:RecordAudio("317012040", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_317012", "317012040", "story_v_out_317012.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_317012", "317012040", "story_v_out_317012.awb")
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
	Play317012041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 317012041
		arg_169_1.duration_ = 8.733

		local var_169_0 = {
			zh = 2.8,
			ja = 8.733
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
				arg_169_0:Play317012042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.325

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_2 = arg_169_1:FormatText(StoryNameCfg[526].name)

				arg_169_1.leftNameTxt_.text = var_172_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_3 = arg_169_1:GetWordFromCfg(317012041)
				local var_172_4 = arg_169_1:FormatText(var_172_3.content)

				arg_169_1.text_.text = var_172_4

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012041", "story_v_out_317012.awb") ~= 0 then
					local var_172_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012041", "story_v_out_317012.awb") / 1000

					if var_172_8 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_8 + var_172_0
					end

					if var_172_3.prefab_name ~= "" and arg_169_1.actors_[var_172_3.prefab_name] ~= nil then
						local var_172_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_3.prefab_name].transform, "story_v_out_317012", "317012041", "story_v_out_317012.awb")

						arg_169_1:RecordAudio("317012041", var_172_9)
						arg_169_1:RecordAudio("317012041", var_172_9)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_317012", "317012041", "story_v_out_317012.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_317012", "317012041", "story_v_out_317012.awb")
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
	Play317012042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 317012042
		arg_173_1.duration_ = 10.1

		local var_173_0 = {
			zh = 6.166,
			ja = 10.1
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
				arg_173_0:Play317012043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 0.35

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_2 = arg_173_1:FormatText(StoryNameCfg[36].name)

				arg_173_1.leftNameTxt_.text = var_176_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_3 = arg_173_1:GetWordFromCfg(317012042)
				local var_176_4 = arg_173_1:FormatText(var_176_3.content)

				arg_173_1.text_.text = var_176_4

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012042", "story_v_out_317012.awb") ~= 0 then
					local var_176_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012042", "story_v_out_317012.awb") / 1000

					if var_176_8 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_8 + var_176_0
					end

					if var_176_3.prefab_name ~= "" and arg_173_1.actors_[var_176_3.prefab_name] ~= nil then
						local var_176_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_3.prefab_name].transform, "story_v_out_317012", "317012042", "story_v_out_317012.awb")

						arg_173_1:RecordAudio("317012042", var_176_9)
						arg_173_1:RecordAudio("317012042", var_176_9)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_317012", "317012042", "story_v_out_317012.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_317012", "317012042", "story_v_out_317012.awb")
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
	Play317012043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 317012043
		arg_177_1.duration_ = 7

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play317012044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = "STblack"

			if arg_177_1.bgs_[var_180_0] == nil then
				local var_180_1 = Object.Instantiate(arg_177_1.paintGo_)

				var_180_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_180_0)
				var_180_1.name = var_180_0
				var_180_1.transform.parent = arg_177_1.stage_.transform
				var_180_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_177_1.bgs_[var_180_0] = var_180_1
			end

			local var_180_2 = 0

			if var_180_2 < arg_177_1.time_ and arg_177_1.time_ <= var_180_2 + arg_180_0 then
				local var_180_3 = manager.ui.mainCamera.transform.localPosition
				local var_180_4 = Vector3.New(0, 0, 10) + Vector3.New(var_180_3.x, var_180_3.y, 0)
				local var_180_5 = arg_177_1.bgs_.STblack

				var_180_5.transform.localPosition = var_180_4
				var_180_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_180_6 = var_180_5:GetComponent("SpriteRenderer")

				if var_180_6 and var_180_6.sprite then
					local var_180_7 = (var_180_5.transform.localPosition - var_180_3).z
					local var_180_8 = manager.ui.mainCameraCom_
					local var_180_9 = 2 * var_180_7 * Mathf.Tan(var_180_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_180_10 = var_180_9 * var_180_8.aspect
					local var_180_11 = var_180_6.sprite.bounds.size.x
					local var_180_12 = var_180_6.sprite.bounds.size.y
					local var_180_13 = var_180_10 / var_180_11
					local var_180_14 = var_180_9 / var_180_12
					local var_180_15 = var_180_14 < var_180_13 and var_180_13 or var_180_14

					var_180_5.transform.localScale = Vector3.New(var_180_15, var_180_15, 0)
				end

				for iter_180_0, iter_180_1 in pairs(arg_177_1.bgs_) do
					if iter_180_0 ~= "STblack" then
						iter_180_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_180_16 = 0

			if var_180_16 < arg_177_1.time_ and arg_177_1.time_ <= var_180_16 + arg_180_0 then
				arg_177_1.mask_.enabled = true
				arg_177_1.mask_.raycastTarget = true

				arg_177_1:SetGaussion(false)
			end

			local var_180_17 = 2

			if var_180_16 <= arg_177_1.time_ and arg_177_1.time_ < var_180_16 + var_180_17 then
				local var_180_18 = (arg_177_1.time_ - var_180_16) / var_180_17
				local var_180_19 = Color.New(0, 0, 0)

				var_180_19.a = Mathf.Lerp(1, 0, var_180_18)
				arg_177_1.mask_.color = var_180_19
			end

			if arg_177_1.time_ >= var_180_16 + var_180_17 and arg_177_1.time_ < var_180_16 + var_180_17 + arg_180_0 then
				local var_180_20 = Color.New(0, 0, 0)
				local var_180_21 = 0

				arg_177_1.mask_.enabled = false
				var_180_20.a = var_180_21
				arg_177_1.mask_.color = var_180_20
			end

			if arg_177_1.frameCnt_ <= 1 then
				arg_177_1.dialog_:SetActive(false)
			end

			local var_180_22 = 2
			local var_180_23 = 0.9

			if var_180_22 < arg_177_1.time_ and arg_177_1.time_ <= var_180_22 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0

				arg_177_1.dialog_:SetActive(true)

				local var_180_24 = LeanTween.value(arg_177_1.dialog_, 0, 1, 0.3)

				var_180_24:setOnUpdate(LuaHelper.FloatAction(function(arg_181_0)
					arg_177_1.dialogCg_.alpha = arg_181_0
				end))
				var_180_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_177_1.dialog_)
					var_180_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_177_1.duration_ = arg_177_1.duration_ + 0.3

				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_25 = arg_177_1:GetWordFromCfg(317012043)
				local var_180_26 = arg_177_1:FormatText(var_180_25.content)

				arg_177_1.text_.text = var_180_26

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_27 = 36
				local var_180_28 = utf8.len(var_180_26)
				local var_180_29 = var_180_27 <= 0 and var_180_23 or var_180_23 * (var_180_28 / var_180_27)

				if var_180_29 > 0 and var_180_23 < var_180_29 then
					arg_177_1.talkMaxDuration = var_180_29
					var_180_22 = var_180_22 + 0.3

					if var_180_29 + var_180_22 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_29 + var_180_22
					end
				end

				arg_177_1.text_.text = var_180_26
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_30 = var_180_22 + 0.3
			local var_180_31 = math.max(var_180_23, arg_177_1.talkMaxDuration)

			if var_180_30 <= arg_177_1.time_ and arg_177_1.time_ < var_180_30 + var_180_31 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_30) / var_180_31

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_30 + var_180_31 and arg_177_1.time_ < var_180_30 + var_180_31 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play317012044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 317012044
		arg_183_1.duration_ = 4.833

		local var_183_0 = {
			zh = 3.233,
			ja = 4.833
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
				arg_183_0:Play317012045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = "K02f"

			if arg_183_1.bgs_[var_186_0] == nil then
				local var_186_1 = Object.Instantiate(arg_183_1.paintGo_)

				var_186_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_186_0)
				var_186_1.name = var_186_0
				var_186_1.transform.parent = arg_183_1.stage_.transform
				var_186_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_183_1.bgs_[var_186_0] = var_186_1
			end

			local var_186_2 = 0

			if var_186_2 < arg_183_1.time_ and arg_183_1.time_ <= var_186_2 + arg_186_0 then
				local var_186_3 = manager.ui.mainCamera.transform.localPosition
				local var_186_4 = Vector3.New(0, 0, 10) + Vector3.New(var_186_3.x, var_186_3.y, 0)
				local var_186_5 = arg_183_1.bgs_.K02f

				var_186_5.transform.localPosition = var_186_4
				var_186_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_186_6 = var_186_5:GetComponent("SpriteRenderer")

				if var_186_6 and var_186_6.sprite then
					local var_186_7 = (var_186_5.transform.localPosition - var_186_3).z
					local var_186_8 = manager.ui.mainCameraCom_
					local var_186_9 = 2 * var_186_7 * Mathf.Tan(var_186_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_186_10 = var_186_9 * var_186_8.aspect
					local var_186_11 = var_186_6.sprite.bounds.size.x
					local var_186_12 = var_186_6.sprite.bounds.size.y
					local var_186_13 = var_186_10 / var_186_11
					local var_186_14 = var_186_9 / var_186_12
					local var_186_15 = var_186_14 < var_186_13 and var_186_13 or var_186_14

					var_186_5.transform.localScale = Vector3.New(var_186_15, var_186_15, 0)
				end

				for iter_186_0, iter_186_1 in pairs(arg_183_1.bgs_) do
					if iter_186_0 ~= "K02f" then
						iter_186_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_186_16 = 0

			if var_186_16 < arg_183_1.time_ and arg_183_1.time_ <= var_186_16 + arg_186_0 then
				arg_183_1.mask_.enabled = true
				arg_183_1.mask_.raycastTarget = true

				arg_183_1:SetGaussion(false)
			end

			local var_186_17 = 2

			if var_186_16 <= arg_183_1.time_ and arg_183_1.time_ < var_186_16 + var_186_17 then
				local var_186_18 = (arg_183_1.time_ - var_186_16) / var_186_17
				local var_186_19 = Color.New(0, 0, 0)

				var_186_19.a = Mathf.Lerp(1, 0, var_186_18)
				arg_183_1.mask_.color = var_186_19
			end

			if arg_183_1.time_ >= var_186_16 + var_186_17 and arg_183_1.time_ < var_186_16 + var_186_17 + arg_186_0 then
				local var_186_20 = Color.New(0, 0, 0)
				local var_186_21 = 0

				arg_183_1.mask_.enabled = false
				var_186_20.a = var_186_21
				arg_183_1.mask_.color = var_186_20
			end

			if arg_183_1.frameCnt_ <= 1 then
				arg_183_1.dialog_:SetActive(false)
			end

			local var_186_22 = 2
			local var_186_23 = 0.125

			if var_186_22 < arg_183_1.time_ and arg_183_1.time_ <= var_186_22 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0

				arg_183_1.dialog_:SetActive(true)

				local var_186_24 = LeanTween.value(arg_183_1.dialog_, 0, 1, 0.3)

				var_186_24:setOnUpdate(LuaHelper.FloatAction(function(arg_187_0)
					arg_183_1.dialogCg_.alpha = arg_187_0
				end))
				var_186_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_183_1.dialog_)
					var_186_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_183_1.duration_ = arg_183_1.duration_ + 0.3

				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_25 = arg_183_1:FormatText(StoryNameCfg[527].name)

				arg_183_1.leftNameTxt_.text = var_186_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, true)
				arg_183_1.iconController_:SetSelectedState("hero")

				arg_183_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_26 = arg_183_1:GetWordFromCfg(317012044)
				local var_186_27 = arg_183_1:FormatText(var_186_26.content)

				arg_183_1.text_.text = var_186_27

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_28 = 5
				local var_186_29 = utf8.len(var_186_27)
				local var_186_30 = var_186_28 <= 0 and var_186_23 or var_186_23 * (var_186_29 / var_186_28)

				if var_186_30 > 0 and var_186_23 < var_186_30 then
					arg_183_1.talkMaxDuration = var_186_30
					var_186_22 = var_186_22 + 0.3

					if var_186_30 + var_186_22 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_30 + var_186_22
					end
				end

				arg_183_1.text_.text = var_186_27
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012044", "story_v_out_317012.awb") ~= 0 then
					local var_186_31 = manager.audio:GetVoiceLength("story_v_out_317012", "317012044", "story_v_out_317012.awb") / 1000

					if var_186_31 + var_186_22 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_31 + var_186_22
					end

					if var_186_26.prefab_name ~= "" and arg_183_1.actors_[var_186_26.prefab_name] ~= nil then
						local var_186_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_26.prefab_name].transform, "story_v_out_317012", "317012044", "story_v_out_317012.awb")

						arg_183_1:RecordAudio("317012044", var_186_32)
						arg_183_1:RecordAudio("317012044", var_186_32)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_317012", "317012044", "story_v_out_317012.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_317012", "317012044", "story_v_out_317012.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_33 = var_186_22 + 0.3
			local var_186_34 = math.max(var_186_23, arg_183_1.talkMaxDuration)

			if var_186_33 <= arg_183_1.time_ and arg_183_1.time_ < var_186_33 + var_186_34 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_33) / var_186_34

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_33 + var_186_34 and arg_183_1.time_ < var_186_33 + var_186_34 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play317012045 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 317012045
		arg_189_1.duration_ = 7.7

		local var_189_0 = {
			zh = 7.7,
			ja = 7.433
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
				arg_189_0:Play317012046(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.875

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[490].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, true)
				arg_189_1.iconController_:SetSelectedState("hero")

				arg_189_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(317012045)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012045", "story_v_out_317012.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012045", "story_v_out_317012.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_317012", "317012045", "story_v_out_317012.awb")

						arg_189_1:RecordAudio("317012045", var_192_9)
						arg_189_1:RecordAudio("317012045", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_317012", "317012045", "story_v_out_317012.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_317012", "317012045", "story_v_out_317012.awb")
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
	Play317012046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 317012046
		arg_193_1.duration_ = 11

		local var_193_0 = {
			zh = 10.966,
			ja = 11
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
				arg_193_0:Play317012047(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 1.225

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[527].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, true)
				arg_193_1.iconController_:SetSelectedState("hero")

				arg_193_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(317012046)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012046", "story_v_out_317012.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012046", "story_v_out_317012.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_317012", "317012046", "story_v_out_317012.awb")

						arg_193_1:RecordAudio("317012046", var_196_9)
						arg_193_1:RecordAudio("317012046", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_317012", "317012046", "story_v_out_317012.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_317012", "317012046", "story_v_out_317012.awb")
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
	Play317012047 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 317012047
		arg_197_1.duration_ = 2.966

		local var_197_0 = {
			zh = 2.966,
			ja = 2.5
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
				arg_197_0:Play317012048(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.2

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[490].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, true)
				arg_197_1.iconController_:SetSelectedState("hero")

				arg_197_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(317012047)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 8
				local var_200_6 = utf8.len(var_200_4)
				local var_200_7 = var_200_5 <= 0 and var_200_1 or var_200_1 * (var_200_6 / var_200_5)

				if var_200_7 > 0 and var_200_1 < var_200_7 then
					arg_197_1.talkMaxDuration = var_200_7

					if var_200_7 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_7 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_4
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012047", "story_v_out_317012.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012047", "story_v_out_317012.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_317012", "317012047", "story_v_out_317012.awb")

						arg_197_1:RecordAudio("317012047", var_200_9)
						arg_197_1:RecordAudio("317012047", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_317012", "317012047", "story_v_out_317012.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_317012", "317012047", "story_v_out_317012.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_10 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_10 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_10

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_10 and arg_197_1.time_ < var_200_0 + var_200_10 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play317012048 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 317012048
		arg_201_1.duration_ = 2.966

		local var_201_0 = {
			zh = 2.366,
			ja = 2.966
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
				arg_201_0:Play317012049(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 0.15

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_2 = arg_201_1:FormatText(StoryNameCfg[527].name)

				arg_201_1.leftNameTxt_.text = var_204_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, true)
				arg_201_1.iconController_:SetSelectedState("hero")

				arg_201_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_3 = arg_201_1:GetWordFromCfg(317012048)
				local var_204_4 = arg_201_1:FormatText(var_204_3.content)

				arg_201_1.text_.text = var_204_4

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012048", "story_v_out_317012.awb") ~= 0 then
					local var_204_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012048", "story_v_out_317012.awb") / 1000

					if var_204_8 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_8 + var_204_0
					end

					if var_204_3.prefab_name ~= "" and arg_201_1.actors_[var_204_3.prefab_name] ~= nil then
						local var_204_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_3.prefab_name].transform, "story_v_out_317012", "317012048", "story_v_out_317012.awb")

						arg_201_1:RecordAudio("317012048", var_204_9)
						arg_201_1:RecordAudio("317012048", var_204_9)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_317012", "317012048", "story_v_out_317012.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_317012", "317012048", "story_v_out_317012.awb")
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
	Play317012049 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 317012049
		arg_205_1.duration_ = 7.2

		local var_205_0 = {
			zh = 4.1,
			ja = 7.2
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
				arg_205_0:Play317012050(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.425

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[490].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, true)
				arg_205_1.iconController_:SetSelectedState("hero")

				arg_205_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(317012049)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012049", "story_v_out_317012.awb") ~= 0 then
					local var_208_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012049", "story_v_out_317012.awb") / 1000

					if var_208_8 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_8 + var_208_0
					end

					if var_208_3.prefab_name ~= "" and arg_205_1.actors_[var_208_3.prefab_name] ~= nil then
						local var_208_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_3.prefab_name].transform, "story_v_out_317012", "317012049", "story_v_out_317012.awb")

						arg_205_1:RecordAudio("317012049", var_208_9)
						arg_205_1:RecordAudio("317012049", var_208_9)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_317012", "317012049", "story_v_out_317012.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_317012", "317012049", "story_v_out_317012.awb")
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
	Play317012050 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 317012050
		arg_209_1.duration_ = 2.9

		local var_209_0 = {
			zh = 1.533,
			ja = 2.9
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
				arg_209_0:Play317012051(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 0.175

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[527].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, true)
				arg_209_1.iconController_:SetSelectedState("hero")

				arg_209_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(317012050)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012050", "story_v_out_317012.awb") ~= 0 then
					local var_212_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012050", "story_v_out_317012.awb") / 1000

					if var_212_8 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_0
					end

					if var_212_3.prefab_name ~= "" and arg_209_1.actors_[var_212_3.prefab_name] ~= nil then
						local var_212_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_3.prefab_name].transform, "story_v_out_317012", "317012050", "story_v_out_317012.awb")

						arg_209_1:RecordAudio("317012050", var_212_9)
						arg_209_1:RecordAudio("317012050", var_212_9)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_317012", "317012050", "story_v_out_317012.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_317012", "317012050", "story_v_out_317012.awb")
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
	Play317012051 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 317012051
		arg_213_1.duration_ = 13.966

		local var_213_0 = {
			zh = 10.233,
			ja = 13.966
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
				arg_213_0:Play317012052(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 1.075

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_2 = arg_213_1:FormatText(StoryNameCfg[490].name)

				arg_213_1.leftNameTxt_.text = var_216_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, true)
				arg_213_1.iconController_:SetSelectedState("hero")

				arg_213_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_3 = arg_213_1:GetWordFromCfg(317012051)
				local var_216_4 = arg_213_1:FormatText(var_216_3.content)

				arg_213_1.text_.text = var_216_4

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012051", "story_v_out_317012.awb") ~= 0 then
					local var_216_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012051", "story_v_out_317012.awb") / 1000

					if var_216_8 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_8 + var_216_0
					end

					if var_216_3.prefab_name ~= "" and arg_213_1.actors_[var_216_3.prefab_name] ~= nil then
						local var_216_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_3.prefab_name].transform, "story_v_out_317012", "317012051", "story_v_out_317012.awb")

						arg_213_1:RecordAudio("317012051", var_216_9)
						arg_213_1:RecordAudio("317012051", var_216_9)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_317012", "317012051", "story_v_out_317012.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_317012", "317012051", "story_v_out_317012.awb")
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
	Play317012052 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 317012052
		arg_217_1.duration_ = 4.966

		local var_217_0 = {
			zh = 4.633,
			ja = 4.966
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
				arg_217_0:Play317012053(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.45

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[490].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, true)
				arg_217_1.iconController_:SetSelectedState("hero")

				arg_217_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(317012052)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012052", "story_v_out_317012.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012052", "story_v_out_317012.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_317012", "317012052", "story_v_out_317012.awb")

						arg_217_1:RecordAudio("317012052", var_220_9)
						arg_217_1:RecordAudio("317012052", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_317012", "317012052", "story_v_out_317012.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_317012", "317012052", "story_v_out_317012.awb")
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
	Play317012053 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 317012053
		arg_221_1.duration_ = 6.933

		local var_221_0 = {
			zh = 5.366,
			ja = 6.933
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
				arg_221_0:Play317012054(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 0.725

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_2 = arg_221_1:FormatText(StoryNameCfg[527].name)

				arg_221_1.leftNameTxt_.text = var_224_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, true)
				arg_221_1.iconController_:SetSelectedState("hero")

				arg_221_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_3 = arg_221_1:GetWordFromCfg(317012053)
				local var_224_4 = arg_221_1:FormatText(var_224_3.content)

				arg_221_1.text_.text = var_224_4

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012053", "story_v_out_317012.awb") ~= 0 then
					local var_224_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012053", "story_v_out_317012.awb") / 1000

					if var_224_8 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_8 + var_224_0
					end

					if var_224_3.prefab_name ~= "" and arg_221_1.actors_[var_224_3.prefab_name] ~= nil then
						local var_224_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_3.prefab_name].transform, "story_v_out_317012", "317012053", "story_v_out_317012.awb")

						arg_221_1:RecordAudio("317012053", var_224_9)
						arg_221_1:RecordAudio("317012053", var_224_9)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_317012", "317012053", "story_v_out_317012.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_317012", "317012053", "story_v_out_317012.awb")
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
	Play317012054 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 317012054
		arg_225_1.duration_ = 4.5

		local var_225_0 = {
			zh = 4.5,
			ja = 3.6
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
				arg_225_0:Play317012055(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.35

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[490].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, true)
				arg_225_1.iconController_:SetSelectedState("hero")

				arg_225_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(317012054)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 14
				local var_228_6 = utf8.len(var_228_4)
				local var_228_7 = var_228_5 <= 0 and var_228_1 or var_228_1 * (var_228_6 / var_228_5)

				if var_228_7 > 0 and var_228_1 < var_228_7 then
					arg_225_1.talkMaxDuration = var_228_7

					if var_228_7 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_7 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_4
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012054", "story_v_out_317012.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012054", "story_v_out_317012.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_out_317012", "317012054", "story_v_out_317012.awb")

						arg_225_1:RecordAudio("317012054", var_228_9)
						arg_225_1:RecordAudio("317012054", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_317012", "317012054", "story_v_out_317012.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_317012", "317012054", "story_v_out_317012.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_10 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_10 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_10

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_10 and arg_225_1.time_ < var_228_0 + var_228_10 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play317012055 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 317012055
		arg_229_1.duration_ = 5.1

		local var_229_0 = {
			zh = 5.1,
			ja = 4.633
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
				arg_229_0:Play317012056(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 0.275

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_2 = arg_229_1:FormatText(StoryNameCfg[527].name)

				arg_229_1.leftNameTxt_.text = var_232_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, true)
				arg_229_1.iconController_:SetSelectedState("hero")

				arg_229_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_3 = arg_229_1:GetWordFromCfg(317012055)
				local var_232_4 = arg_229_1:FormatText(var_232_3.content)

				arg_229_1.text_.text = var_232_4

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_5 = 11
				local var_232_6 = utf8.len(var_232_4)
				local var_232_7 = var_232_5 <= 0 and var_232_1 or var_232_1 * (var_232_6 / var_232_5)

				if var_232_7 > 0 and var_232_1 < var_232_7 then
					arg_229_1.talkMaxDuration = var_232_7

					if var_232_7 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_7 + var_232_0
					end
				end

				arg_229_1.text_.text = var_232_4
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012055", "story_v_out_317012.awb") ~= 0 then
					local var_232_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012055", "story_v_out_317012.awb") / 1000

					if var_232_8 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_8 + var_232_0
					end

					if var_232_3.prefab_name ~= "" and arg_229_1.actors_[var_232_3.prefab_name] ~= nil then
						local var_232_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_3.prefab_name].transform, "story_v_out_317012", "317012055", "story_v_out_317012.awb")

						arg_229_1:RecordAudio("317012055", var_232_9)
						arg_229_1:RecordAudio("317012055", var_232_9)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_317012", "317012055", "story_v_out_317012.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_317012", "317012055", "story_v_out_317012.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_10 = math.max(var_232_1, arg_229_1.talkMaxDuration)

			if var_232_0 <= arg_229_1.time_ and arg_229_1.time_ < var_232_0 + var_232_10 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_0) / var_232_10

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_0 + var_232_10 and arg_229_1.time_ < var_232_0 + var_232_10 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play317012056 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 317012056
		arg_233_1.duration_ = 7

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play317012057(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = "STwhite"

			if arg_233_1.bgs_[var_236_0] == nil then
				local var_236_1 = Object.Instantiate(arg_233_1.paintGo_)

				var_236_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_236_0)
				var_236_1.name = var_236_0
				var_236_1.transform.parent = arg_233_1.stage_.transform
				var_236_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_233_1.bgs_[var_236_0] = var_236_1
			end

			local var_236_2 = 0

			if var_236_2 < arg_233_1.time_ and arg_233_1.time_ <= var_236_2 + arg_236_0 then
				local var_236_3 = manager.ui.mainCamera.transform.localPosition
				local var_236_4 = Vector3.New(0, 0, 10) + Vector3.New(var_236_3.x, var_236_3.y, 0)
				local var_236_5 = arg_233_1.bgs_.STwhite

				var_236_5.transform.localPosition = var_236_4
				var_236_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_236_6 = var_236_5:GetComponent("SpriteRenderer")

				if var_236_6 and var_236_6.sprite then
					local var_236_7 = (var_236_5.transform.localPosition - var_236_3).z
					local var_236_8 = manager.ui.mainCameraCom_
					local var_236_9 = 2 * var_236_7 * Mathf.Tan(var_236_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_236_10 = var_236_9 * var_236_8.aspect
					local var_236_11 = var_236_6.sprite.bounds.size.x
					local var_236_12 = var_236_6.sprite.bounds.size.y
					local var_236_13 = var_236_10 / var_236_11
					local var_236_14 = var_236_9 / var_236_12
					local var_236_15 = var_236_14 < var_236_13 and var_236_13 or var_236_14

					var_236_5.transform.localScale = Vector3.New(var_236_15, var_236_15, 0)
				end

				for iter_236_0, iter_236_1 in pairs(arg_233_1.bgs_) do
					if iter_236_0 ~= "STwhite" then
						iter_236_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_236_16 = 0

			if var_236_16 < arg_233_1.time_ and arg_233_1.time_ <= var_236_16 + arg_236_0 then
				arg_233_1.mask_.enabled = true
				arg_233_1.mask_.raycastTarget = true

				arg_233_1:SetGaussion(false)
			end

			local var_236_17 = 2

			if var_236_16 <= arg_233_1.time_ and arg_233_1.time_ < var_236_16 + var_236_17 then
				local var_236_18 = (arg_233_1.time_ - var_236_16) / var_236_17
				local var_236_19 = Color.New(0, 0, 0)

				var_236_19.a = Mathf.Lerp(1, 0, var_236_18)
				arg_233_1.mask_.color = var_236_19
			end

			if arg_233_1.time_ >= var_236_16 + var_236_17 and arg_233_1.time_ < var_236_16 + var_236_17 + arg_236_0 then
				local var_236_20 = Color.New(0, 0, 0)
				local var_236_21 = 0

				arg_233_1.mask_.enabled = false
				var_236_20.a = var_236_21
				arg_233_1.mask_.color = var_236_20
			end

			local var_236_22 = 0
			local var_236_23 = 1

			if var_236_22 < arg_233_1.time_ and arg_233_1.time_ <= var_236_22 + arg_236_0 then
				local var_236_24 = "play"
				local var_236_25 = "music"

				arg_233_1:AudioAction(var_236_24, var_236_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_233_1.frameCnt_ <= 1 then
				arg_233_1.dialog_:SetActive(false)
			end

			local var_236_26 = 2
			local var_236_27 = 1.2

			if var_236_26 < arg_233_1.time_ and arg_233_1.time_ <= var_236_26 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0

				arg_233_1.dialog_:SetActive(true)

				local var_236_28 = LeanTween.value(arg_233_1.dialog_, 0, 1, 0.3)

				var_236_28:setOnUpdate(LuaHelper.FloatAction(function(arg_237_0)
					arg_233_1.dialogCg_.alpha = arg_237_0
				end))
				var_236_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_233_1.dialog_)
					var_236_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_233_1.duration_ = arg_233_1.duration_ + 0.3

				SetActive(arg_233_1.leftNameGo_, false)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_29 = arg_233_1:GetWordFromCfg(317012056)
				local var_236_30 = arg_233_1:FormatText(var_236_29.content)

				arg_233_1.text_.text = var_236_30

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_31 = 48
				local var_236_32 = utf8.len(var_236_30)
				local var_236_33 = var_236_31 <= 0 and var_236_27 or var_236_27 * (var_236_32 / var_236_31)

				if var_236_33 > 0 and var_236_27 < var_236_33 then
					arg_233_1.talkMaxDuration = var_236_33
					var_236_26 = var_236_26 + 0.3

					if var_236_33 + var_236_26 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_33 + var_236_26
					end
				end

				arg_233_1.text_.text = var_236_30
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_34 = var_236_26 + 0.3
			local var_236_35 = math.max(var_236_27, arg_233_1.talkMaxDuration)

			if var_236_34 <= arg_233_1.time_ and arg_233_1.time_ < var_236_34 + var_236_35 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_34) / var_236_35

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_34 + var_236_35 and arg_233_1.time_ < var_236_34 + var_236_35 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play317012057 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 317012057
		arg_239_1.duration_ = 7

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play317012058(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = "K06f"

			if arg_239_1.bgs_[var_242_0] == nil then
				local var_242_1 = Object.Instantiate(arg_239_1.paintGo_)

				var_242_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_242_0)
				var_242_1.name = var_242_0
				var_242_1.transform.parent = arg_239_1.stage_.transform
				var_242_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_239_1.bgs_[var_242_0] = var_242_1
			end

			local var_242_2 = 0

			if var_242_2 < arg_239_1.time_ and arg_239_1.time_ <= var_242_2 + arg_242_0 then
				local var_242_3 = manager.ui.mainCamera.transform.localPosition
				local var_242_4 = Vector3.New(0, 0, 10) + Vector3.New(var_242_3.x, var_242_3.y, 0)
				local var_242_5 = arg_239_1.bgs_.K06f

				var_242_5.transform.localPosition = var_242_4
				var_242_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_242_6 = var_242_5:GetComponent("SpriteRenderer")

				if var_242_6 and var_242_6.sprite then
					local var_242_7 = (var_242_5.transform.localPosition - var_242_3).z
					local var_242_8 = manager.ui.mainCameraCom_
					local var_242_9 = 2 * var_242_7 * Mathf.Tan(var_242_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_242_10 = var_242_9 * var_242_8.aspect
					local var_242_11 = var_242_6.sprite.bounds.size.x
					local var_242_12 = var_242_6.sprite.bounds.size.y
					local var_242_13 = var_242_10 / var_242_11
					local var_242_14 = var_242_9 / var_242_12
					local var_242_15 = var_242_14 < var_242_13 and var_242_13 or var_242_14

					var_242_5.transform.localScale = Vector3.New(var_242_15, var_242_15, 0)
				end

				for iter_242_0, iter_242_1 in pairs(arg_239_1.bgs_) do
					if iter_242_0 ~= "K06f" then
						iter_242_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_242_16 = 0

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 then
				arg_239_1.mask_.enabled = true
				arg_239_1.mask_.raycastTarget = true

				arg_239_1:SetGaussion(false)
			end

			local var_242_17 = 2

			if var_242_16 <= arg_239_1.time_ and arg_239_1.time_ < var_242_16 + var_242_17 then
				local var_242_18 = (arg_239_1.time_ - var_242_16) / var_242_17
				local var_242_19 = Color.New(0, 0, 0)

				var_242_19.a = Mathf.Lerp(1, 0, var_242_18)
				arg_239_1.mask_.color = var_242_19
			end

			if arg_239_1.time_ >= var_242_16 + var_242_17 and arg_239_1.time_ < var_242_16 + var_242_17 + arg_242_0 then
				local var_242_20 = Color.New(0, 0, 0)
				local var_242_21 = 0

				arg_239_1.mask_.enabled = false
				var_242_20.a = var_242_21
				arg_239_1.mask_.color = var_242_20
			end

			local var_242_22 = 0
			local var_242_23 = 1

			if var_242_22 < arg_239_1.time_ and arg_239_1.time_ <= var_242_22 + arg_242_0 then
				local var_242_24 = "play"
				local var_242_25 = "music"

				arg_239_1:AudioAction(var_242_24, var_242_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_242_26 = 1.56666666666667
			local var_242_27 = 1

			if var_242_26 < arg_239_1.time_ and arg_239_1.time_ <= var_242_26 + arg_242_0 then
				local var_242_28 = "play"
				local var_242_29 = "music"

				arg_239_1:AudioAction(var_242_28, var_242_29, "bgm_activity_2_4_story_xiajingqu", "bgm_activity_2_4_story_xiajingqu", "bgm_activity_2_4_story_xiajingqu.awb")
			end

			if arg_239_1.frameCnt_ <= 1 then
				arg_239_1.dialog_:SetActive(false)
			end

			local var_242_30 = 2
			local var_242_31 = 1.425

			if var_242_30 < arg_239_1.time_ and arg_239_1.time_ <= var_242_30 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0

				arg_239_1.dialog_:SetActive(true)

				local var_242_32 = LeanTween.value(arg_239_1.dialog_, 0, 1, 0.3)

				var_242_32:setOnUpdate(LuaHelper.FloatAction(function(arg_243_0)
					arg_239_1.dialogCg_.alpha = arg_243_0
				end))
				var_242_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_239_1.dialog_)
					var_242_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_239_1.duration_ = arg_239_1.duration_ + 0.3

				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_33 = arg_239_1:GetWordFromCfg(317012057)
				local var_242_34 = arg_239_1:FormatText(var_242_33.content)

				arg_239_1.text_.text = var_242_34

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_35 = 57
				local var_242_36 = utf8.len(var_242_34)
				local var_242_37 = var_242_35 <= 0 and var_242_31 or var_242_31 * (var_242_36 / var_242_35)

				if var_242_37 > 0 and var_242_31 < var_242_37 then
					arg_239_1.talkMaxDuration = var_242_37
					var_242_30 = var_242_30 + 0.3

					if var_242_37 + var_242_30 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_37 + var_242_30
					end
				end

				arg_239_1.text_.text = var_242_34
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_38 = var_242_30 + 0.3
			local var_242_39 = math.max(var_242_31, arg_239_1.talkMaxDuration)

			if var_242_38 <= arg_239_1.time_ and arg_239_1.time_ < var_242_38 + var_242_39 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_38) / var_242_39

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_38 + var_242_39 and arg_239_1.time_ < var_242_38 + var_242_39 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play317012058 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 317012058
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play317012059(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 1.725

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

				local var_248_2 = arg_245_1:GetWordFromCfg(317012058)
				local var_248_3 = arg_245_1:FormatText(var_248_2.content)

				arg_245_1.text_.text = var_248_3

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_4 = 69
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
	Play317012059 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 317012059
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play317012060(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.7

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, false)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_2 = arg_249_1:GetWordFromCfg(317012059)
				local var_252_3 = arg_249_1:FormatText(var_252_2.content)

				arg_249_1.text_.text = var_252_3

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_4 = 28
				local var_252_5 = utf8.len(var_252_3)
				local var_252_6 = var_252_4 <= 0 and var_252_1 or var_252_1 * (var_252_5 / var_252_4)

				if var_252_6 > 0 and var_252_1 < var_252_6 then
					arg_249_1.talkMaxDuration = var_252_6

					if var_252_6 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_6 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_3
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_7 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_7 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_7

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_7 and arg_249_1.time_ < var_252_0 + var_252_7 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play317012060 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 317012060
		arg_253_1.duration_ = 4

		local var_253_0 = {
			zh = 3.8,
			ja = 4
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
				arg_253_0:Play317012061(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.45

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[101].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, true)
				arg_253_1.iconController_:SetSelectedState("hero")

				arg_253_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(317012060)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012060", "story_v_out_317012.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012060", "story_v_out_317012.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_317012", "317012060", "story_v_out_317012.awb")

						arg_253_1:RecordAudio("317012060", var_256_9)
						arg_253_1:RecordAudio("317012060", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_317012", "317012060", "story_v_out_317012.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_317012", "317012060", "story_v_out_317012.awb")
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
	Play317012061 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 317012061
		arg_257_1.duration_ = 5.6

		local var_257_0 = {
			zh = 4.666,
			ja = 5.6
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
				arg_257_0:Play317012062(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.525

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[394].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, true)
				arg_257_1.iconController_:SetSelectedState("hero")

				arg_257_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10055_b")

				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(317012061)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012061", "story_v_out_317012.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012061", "story_v_out_317012.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_317012", "317012061", "story_v_out_317012.awb")

						arg_257_1:RecordAudio("317012061", var_260_9)
						arg_257_1:RecordAudio("317012061", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_317012", "317012061", "story_v_out_317012.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_317012", "317012061", "story_v_out_317012.awb")
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
	Play317012062 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 317012062
		arg_261_1.duration_ = 8.633

		local var_261_0 = {
			zh = 5.8,
			ja = 8.633
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
				arg_261_0:Play317012063(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.4

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[101].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, true)
				arg_261_1.iconController_:SetSelectedState("hero")

				arg_261_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(317012062)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012062", "story_v_out_317012.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012062", "story_v_out_317012.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_317012", "317012062", "story_v_out_317012.awb")

						arg_261_1:RecordAudio("317012062", var_264_9)
						arg_261_1:RecordAudio("317012062", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_317012", "317012062", "story_v_out_317012.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_317012", "317012062", "story_v_out_317012.awb")
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
	Play317012063 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 317012063
		arg_265_1.duration_ = 9.8

		local var_265_0 = {
			zh = 5.3,
			ja = 9.8
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
				arg_265_0:Play317012064(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.525

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[394].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, true)
				arg_265_1.iconController_:SetSelectedState("hero")

				arg_265_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10055_b")

				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(317012063)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012063", "story_v_out_317012.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012063", "story_v_out_317012.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_317012", "317012063", "story_v_out_317012.awb")

						arg_265_1:RecordAudio("317012063", var_268_9)
						arg_265_1:RecordAudio("317012063", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_317012", "317012063", "story_v_out_317012.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_317012", "317012063", "story_v_out_317012.awb")
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
	Play317012064 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 317012064
		arg_269_1.duration_ = 14.033

		local var_269_0 = {
			zh = 5.1,
			ja = 14.033
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
				arg_269_0:Play317012065(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.575

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[101].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, true)
				arg_269_1.iconController_:SetSelectedState("hero")

				arg_269_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(317012064)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012064", "story_v_out_317012.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012064", "story_v_out_317012.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_317012", "317012064", "story_v_out_317012.awb")

						arg_269_1:RecordAudio("317012064", var_272_9)
						arg_269_1:RecordAudio("317012064", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_317012", "317012064", "story_v_out_317012.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_317012", "317012064", "story_v_out_317012.awb")
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
	Play317012065 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 317012065
		arg_273_1.duration_ = 4.233

		local var_273_0 = {
			zh = 2.533,
			ja = 4.233
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
				arg_273_0:Play317012066(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.225

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_2 = arg_273_1:FormatText(StoryNameCfg[394].name)

				arg_273_1.leftNameTxt_.text = var_276_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, true)
				arg_273_1.iconController_:SetSelectedState("hero")

				arg_273_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10055_b")

				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_3 = arg_273_1:GetWordFromCfg(317012065)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012065", "story_v_out_317012.awb") ~= 0 then
					local var_276_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012065", "story_v_out_317012.awb") / 1000

					if var_276_8 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_8 + var_276_0
					end

					if var_276_3.prefab_name ~= "" and arg_273_1.actors_[var_276_3.prefab_name] ~= nil then
						local var_276_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_3.prefab_name].transform, "story_v_out_317012", "317012065", "story_v_out_317012.awb")

						arg_273_1:RecordAudio("317012065", var_276_9)
						arg_273_1:RecordAudio("317012065", var_276_9)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_317012", "317012065", "story_v_out_317012.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_317012", "317012065", "story_v_out_317012.awb")
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
	Play317012066 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 317012066
		arg_277_1.duration_ = 17

		local var_277_0 = {
			zh = 17,
			ja = 14.066
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
				arg_277_0:Play317012067(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 1.675

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[101].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, true)
				arg_277_1.iconController_:SetSelectedState("hero")

				arg_277_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(317012066)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 68
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012066", "story_v_out_317012.awb") ~= 0 then
					local var_280_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012066", "story_v_out_317012.awb") / 1000

					if var_280_8 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_8 + var_280_0
					end

					if var_280_3.prefab_name ~= "" and arg_277_1.actors_[var_280_3.prefab_name] ~= nil then
						local var_280_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_3.prefab_name].transform, "story_v_out_317012", "317012066", "story_v_out_317012.awb")

						arg_277_1:RecordAudio("317012066", var_280_9)
						arg_277_1:RecordAudio("317012066", var_280_9)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_317012", "317012066", "story_v_out_317012.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_317012", "317012066", "story_v_out_317012.awb")
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
	Play317012067 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 317012067
		arg_281_1.duration_ = 5.6

		local var_281_0 = {
			zh = 3.666,
			ja = 5.6
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
				arg_281_0:Play317012068(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.425

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[394].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, true)
				arg_281_1.iconController_:SetSelectedState("hero")

				arg_281_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10055_b")

				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(317012067)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012067", "story_v_out_317012.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012067", "story_v_out_317012.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_out_317012", "317012067", "story_v_out_317012.awb")

						arg_281_1:RecordAudio("317012067", var_284_9)
						arg_281_1:RecordAudio("317012067", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_317012", "317012067", "story_v_out_317012.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_317012", "317012067", "story_v_out_317012.awb")
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
	Play317012068 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 317012068
		arg_285_1.duration_ = 8.7

		local var_285_0 = {
			zh = 8.7,
			ja = 7.733
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
				arg_285_0:Play317012069(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.975

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[101].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(317012068)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012068", "story_v_out_317012.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012068", "story_v_out_317012.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_317012", "317012068", "story_v_out_317012.awb")

						arg_285_1:RecordAudio("317012068", var_288_9)
						arg_285_1:RecordAudio("317012068", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_317012", "317012068", "story_v_out_317012.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_317012", "317012068", "story_v_out_317012.awb")
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
	Play317012069 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 317012069
		arg_289_1.duration_ = 7.8

		local var_289_0 = {
			zh = 1.8,
			ja = 7.8
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
				arg_289_0:Play317012070(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.175

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[394].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, true)
				arg_289_1.iconController_:SetSelectedState("hero")

				arg_289_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10055_b")

				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(317012069)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012069", "story_v_out_317012.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_317012", "317012069", "story_v_out_317012.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_317012", "317012069", "story_v_out_317012.awb")

						arg_289_1:RecordAudio("317012069", var_292_9)
						arg_289_1:RecordAudio("317012069", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_317012", "317012069", "story_v_out_317012.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_317012", "317012069", "story_v_out_317012.awb")
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
	Play317012070 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 317012070
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play317012071(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 1.7

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_2 = arg_293_1:GetWordFromCfg(317012070)
				local var_296_3 = arg_293_1:FormatText(var_296_2.content)

				arg_293_1.text_.text = var_296_3

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_4 = 68
				local var_296_5 = utf8.len(var_296_3)
				local var_296_6 = var_296_4 <= 0 and var_296_1 or var_296_1 * (var_296_5 / var_296_4)

				if var_296_6 > 0 and var_296_1 < var_296_6 then
					arg_293_1.talkMaxDuration = var_296_6

					if var_296_6 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_6 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_3
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_7 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_7 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_7

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_7 and arg_293_1.time_ < var_296_0 + var_296_7 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play317012071 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 317012071
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play317012072(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.8

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, false)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_2 = arg_297_1:GetWordFromCfg(317012071)
				local var_300_3 = arg_297_1:FormatText(var_300_2.content)

				arg_297_1.text_.text = var_300_3

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_4 = 32
				local var_300_5 = utf8.len(var_300_3)
				local var_300_6 = var_300_4 <= 0 and var_300_1 or var_300_1 * (var_300_5 / var_300_4)

				if var_300_6 > 0 and var_300_1 < var_300_6 then
					arg_297_1.talkMaxDuration = var_300_6

					if var_300_6 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_6 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_3
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_7 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_7 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_7

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_7 and arg_297_1.time_ < var_300_0 + var_300_7 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play317012072 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 317012072
		arg_301_1.duration_ = 7.033

		local var_301_0 = {
			zh = 6.466,
			ja = 7.033
		}
		local var_301_1 = manager.audio:GetLocalizationFlag()

		if var_301_0[var_301_1] ~= nil then
			arg_301_1.duration_ = var_301_0[var_301_1]
		end

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play317012073(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = "2078ui_story"

			if arg_301_1.actors_[var_304_0] == nil then
				local var_304_1 = Object.Instantiate(Asset.Load("Char/" .. var_304_0), arg_301_1.stage_.transform)

				var_304_1.name = var_304_0
				var_304_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_301_1.actors_[var_304_0] = var_304_1

				local var_304_2 = var_304_1:GetComponentInChildren(typeof(CharacterEffect))

				var_304_2.enabled = true

				local var_304_3 = GameObjectTools.GetOrAddComponent(var_304_1, typeof(DynamicBoneHelper))

				if var_304_3 then
					var_304_3:EnableDynamicBone(false)
				end

				arg_301_1:ShowWeapon(var_304_2.transform, false)

				arg_301_1.var_[var_304_0 .. "Animator"] = var_304_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_301_1.var_[var_304_0 .. "Animator"].applyRootMotion = true
				arg_301_1.var_[var_304_0 .. "LipSync"] = var_304_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_304_4 = arg_301_1.actors_["2078ui_story"].transform
			local var_304_5 = 0

			if var_304_5 < arg_301_1.time_ and arg_301_1.time_ <= var_304_5 + arg_304_0 then
				arg_301_1.var_.moveOldPos2078ui_story = var_304_4.localPosition
			end

			local var_304_6 = 0.001

			if var_304_5 <= arg_301_1.time_ and arg_301_1.time_ < var_304_5 + var_304_6 then
				local var_304_7 = (arg_301_1.time_ - var_304_5) / var_304_6
				local var_304_8 = Vector3.New(-0.7, -1.28, -5.6)

				var_304_4.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos2078ui_story, var_304_8, var_304_7)

				local var_304_9 = manager.ui.mainCamera.transform.position - var_304_4.position

				var_304_4.forward = Vector3.New(var_304_9.x, var_304_9.y, var_304_9.z)

				local var_304_10 = var_304_4.localEulerAngles

				var_304_10.z = 0
				var_304_10.x = 0
				var_304_4.localEulerAngles = var_304_10
			end

			if arg_301_1.time_ >= var_304_5 + var_304_6 and arg_301_1.time_ < var_304_5 + var_304_6 + arg_304_0 then
				var_304_4.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_304_11 = manager.ui.mainCamera.transform.position - var_304_4.position

				var_304_4.forward = Vector3.New(var_304_11.x, var_304_11.y, var_304_11.z)

				local var_304_12 = var_304_4.localEulerAngles

				var_304_12.z = 0
				var_304_12.x = 0
				var_304_4.localEulerAngles = var_304_12
			end

			local var_304_13 = arg_301_1.actors_["2078ui_story"]
			local var_304_14 = 0

			if var_304_14 < arg_301_1.time_ and arg_301_1.time_ <= var_304_14 + arg_304_0 and arg_301_1.var_.characterEffect2078ui_story == nil then
				arg_301_1.var_.characterEffect2078ui_story = var_304_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_15 = 0.200000002980232

			if var_304_14 <= arg_301_1.time_ and arg_301_1.time_ < var_304_14 + var_304_15 then
				local var_304_16 = (arg_301_1.time_ - var_304_14) / var_304_15

				if arg_301_1.var_.characterEffect2078ui_story then
					arg_301_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_14 + var_304_15 and arg_301_1.time_ < var_304_14 + var_304_15 + arg_304_0 and arg_301_1.var_.characterEffect2078ui_story then
				arg_301_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_304_17 = 0

			if var_304_17 < arg_301_1.time_ and arg_301_1.time_ <= var_304_17 + arg_304_0 then
				arg_301_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_304_18 = "1015ui_story"

			if arg_301_1.actors_[var_304_18] == nil then
				local var_304_19 = Object.Instantiate(Asset.Load("Char/" .. var_304_18), arg_301_1.stage_.transform)

				var_304_19.name = var_304_18
				var_304_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_301_1.actors_[var_304_18] = var_304_19

				local var_304_20 = var_304_19:GetComponentInChildren(typeof(CharacterEffect))

				var_304_20.enabled = true

				local var_304_21 = GameObjectTools.GetOrAddComponent(var_304_19, typeof(DynamicBoneHelper))

				if var_304_21 then
					var_304_21:EnableDynamicBone(false)
				end

				arg_301_1:ShowWeapon(var_304_20.transform, false)

				arg_301_1.var_[var_304_18 .. "Animator"] = var_304_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_301_1.var_[var_304_18 .. "Animator"].applyRootMotion = true
				arg_301_1.var_[var_304_18 .. "LipSync"] = var_304_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_304_22 = arg_301_1.actors_["1015ui_story"].transform
			local var_304_23 = 0

			if var_304_23 < arg_301_1.time_ and arg_301_1.time_ <= var_304_23 + arg_304_0 then
				arg_301_1.var_.moveOldPos1015ui_story = var_304_22.localPosition
			end

			local var_304_24 = 0.001

			if var_304_23 <= arg_301_1.time_ and arg_301_1.time_ < var_304_23 + var_304_24 then
				local var_304_25 = (arg_301_1.time_ - var_304_23) / var_304_24
				local var_304_26 = Vector3.New(0.7, -1.15, -6.2)

				var_304_22.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1015ui_story, var_304_26, var_304_25)

				local var_304_27 = manager.ui.mainCamera.transform.position - var_304_22.position

				var_304_22.forward = Vector3.New(var_304_27.x, var_304_27.y, var_304_27.z)

				local var_304_28 = var_304_22.localEulerAngles

				var_304_28.z = 0
				var_304_28.x = 0
				var_304_22.localEulerAngles = var_304_28
			end

			if arg_301_1.time_ >= var_304_23 + var_304_24 and arg_301_1.time_ < var_304_23 + var_304_24 + arg_304_0 then
				var_304_22.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_304_29 = manager.ui.mainCamera.transform.position - var_304_22.position

				var_304_22.forward = Vector3.New(var_304_29.x, var_304_29.y, var_304_29.z)

				local var_304_30 = var_304_22.localEulerAngles

				var_304_30.z = 0
				var_304_30.x = 0
				var_304_22.localEulerAngles = var_304_30
			end

			local var_304_31 = arg_301_1.actors_["1015ui_story"]
			local var_304_32 = 0

			if var_304_32 < arg_301_1.time_ and arg_301_1.time_ <= var_304_32 + arg_304_0 and arg_301_1.var_.characterEffect1015ui_story == nil then
				arg_301_1.var_.characterEffect1015ui_story = var_304_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_33 = 0.200000002980232

			if var_304_32 <= arg_301_1.time_ and arg_301_1.time_ < var_304_32 + var_304_33 then
				local var_304_34 = (arg_301_1.time_ - var_304_32) / var_304_33

				if arg_301_1.var_.characterEffect1015ui_story then
					local var_304_35 = Mathf.Lerp(0, 0.5, var_304_34)

					arg_301_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_301_1.var_.characterEffect1015ui_story.fillRatio = var_304_35
				end
			end

			if arg_301_1.time_ >= var_304_32 + var_304_33 and arg_301_1.time_ < var_304_32 + var_304_33 + arg_304_0 and arg_301_1.var_.characterEffect1015ui_story then
				local var_304_36 = 0.5

				arg_301_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_301_1.var_.characterEffect1015ui_story.fillRatio = var_304_36
			end

			local var_304_37 = 0

			if var_304_37 < arg_301_1.time_ and arg_301_1.time_ <= var_304_37 + arg_304_0 then
				arg_301_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_304_38 = 0
			local var_304_39 = 0.85

			if var_304_38 < arg_301_1.time_ and arg_301_1.time_ <= var_304_38 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_40 = arg_301_1:FormatText(StoryNameCfg[528].name)

				arg_301_1.leftNameTxt_.text = var_304_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_41 = arg_301_1:GetWordFromCfg(317012072)
				local var_304_42 = arg_301_1:FormatText(var_304_41.content)

				arg_301_1.text_.text = var_304_42

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_43 = 34
				local var_304_44 = utf8.len(var_304_42)
				local var_304_45 = var_304_43 <= 0 and var_304_39 or var_304_39 * (var_304_44 / var_304_43)

				if var_304_45 > 0 and var_304_39 < var_304_45 then
					arg_301_1.talkMaxDuration = var_304_45

					if var_304_45 + var_304_38 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_45 + var_304_38
					end
				end

				arg_301_1.text_.text = var_304_42
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012072", "story_v_out_317012.awb") ~= 0 then
					local var_304_46 = manager.audio:GetVoiceLength("story_v_out_317012", "317012072", "story_v_out_317012.awb") / 1000

					if var_304_46 + var_304_38 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_46 + var_304_38
					end

					if var_304_41.prefab_name ~= "" and arg_301_1.actors_[var_304_41.prefab_name] ~= nil then
						local var_304_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_41.prefab_name].transform, "story_v_out_317012", "317012072", "story_v_out_317012.awb")

						arg_301_1:RecordAudio("317012072", var_304_47)
						arg_301_1:RecordAudio("317012072", var_304_47)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_317012", "317012072", "story_v_out_317012.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_317012", "317012072", "story_v_out_317012.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_48 = math.max(var_304_39, arg_301_1.talkMaxDuration)

			if var_304_38 <= arg_301_1.time_ and arg_301_1.time_ < var_304_38 + var_304_48 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_38) / var_304_48

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_38 + var_304_48 and arg_301_1.time_ < var_304_38 + var_304_48 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play317012073 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 317012073
		arg_305_1.duration_ = 4.266

		local var_305_0 = {
			zh = 3.566,
			ja = 4.266
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
				arg_305_0:Play317012074(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["2078ui_story"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos2078ui_story = var_308_0.localPosition
			end

			local var_308_2 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2
				local var_308_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos2078ui_story, var_308_4, var_308_3)

				local var_308_5 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_5.x, var_308_5.y, var_308_5.z)

				local var_308_6 = var_308_0.localEulerAngles

				var_308_6.z = 0
				var_308_6.x = 0
				var_308_0.localEulerAngles = var_308_6
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_308_7 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_7.x, var_308_7.y, var_308_7.z)

				local var_308_8 = var_308_0.localEulerAngles

				var_308_8.z = 0
				var_308_8.x = 0
				var_308_0.localEulerAngles = var_308_8
			end

			local var_308_9 = arg_305_1.actors_["2078ui_story"]
			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 and arg_305_1.var_.characterEffect2078ui_story == nil then
				arg_305_1.var_.characterEffect2078ui_story = var_308_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_11 = 0.200000002980232

			if var_308_10 <= arg_305_1.time_ and arg_305_1.time_ < var_308_10 + var_308_11 then
				local var_308_12 = (arg_305_1.time_ - var_308_10) / var_308_11

				if arg_305_1.var_.characterEffect2078ui_story then
					local var_308_13 = Mathf.Lerp(0, 0.5, var_308_12)

					arg_305_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_305_1.var_.characterEffect2078ui_story.fillRatio = var_308_13
				end
			end

			if arg_305_1.time_ >= var_308_10 + var_308_11 and arg_305_1.time_ < var_308_10 + var_308_11 + arg_308_0 and arg_305_1.var_.characterEffect2078ui_story then
				local var_308_14 = 0.5

				arg_305_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_305_1.var_.characterEffect2078ui_story.fillRatio = var_308_14
			end

			local var_308_15 = arg_305_1.actors_["1015ui_story"].transform
			local var_308_16 = 0

			if var_308_16 < arg_305_1.time_ and arg_305_1.time_ <= var_308_16 + arg_308_0 then
				arg_305_1.var_.moveOldPos1015ui_story = var_308_15.localPosition
			end

			local var_308_17 = 0.001

			if var_308_16 <= arg_305_1.time_ and arg_305_1.time_ < var_308_16 + var_308_17 then
				local var_308_18 = (arg_305_1.time_ - var_308_16) / var_308_17
				local var_308_19 = Vector3.New(0.7, -1.15, -6.2)

				var_308_15.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1015ui_story, var_308_19, var_308_18)

				local var_308_20 = manager.ui.mainCamera.transform.position - var_308_15.position

				var_308_15.forward = Vector3.New(var_308_20.x, var_308_20.y, var_308_20.z)

				local var_308_21 = var_308_15.localEulerAngles

				var_308_21.z = 0
				var_308_21.x = 0
				var_308_15.localEulerAngles = var_308_21
			end

			if arg_305_1.time_ >= var_308_16 + var_308_17 and arg_305_1.time_ < var_308_16 + var_308_17 + arg_308_0 then
				var_308_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_308_22 = manager.ui.mainCamera.transform.position - var_308_15.position

				var_308_15.forward = Vector3.New(var_308_22.x, var_308_22.y, var_308_22.z)

				local var_308_23 = var_308_15.localEulerAngles

				var_308_23.z = 0
				var_308_23.x = 0
				var_308_15.localEulerAngles = var_308_23
			end

			local var_308_24 = arg_305_1.actors_["1015ui_story"]
			local var_308_25 = 0

			if var_308_25 < arg_305_1.time_ and arg_305_1.time_ <= var_308_25 + arg_308_0 and arg_305_1.var_.characterEffect1015ui_story == nil then
				arg_305_1.var_.characterEffect1015ui_story = var_308_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_26 = 0.200000002980232

			if var_308_25 <= arg_305_1.time_ and arg_305_1.time_ < var_308_25 + var_308_26 then
				local var_308_27 = (arg_305_1.time_ - var_308_25) / var_308_26

				if arg_305_1.var_.characterEffect1015ui_story then
					arg_305_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_25 + var_308_26 and arg_305_1.time_ < var_308_25 + var_308_26 + arg_308_0 and arg_305_1.var_.characterEffect1015ui_story then
				arg_305_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_308_28 = 0

			if var_308_28 < arg_305_1.time_ and arg_305_1.time_ <= var_308_28 + arg_308_0 then
				arg_305_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_308_29 = 0

			if var_308_29 < arg_305_1.time_ and arg_305_1.time_ <= var_308_29 + arg_308_0 then
				arg_305_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_308_30 = 0
			local var_308_31 = 0.425

			if var_308_30 < arg_305_1.time_ and arg_305_1.time_ <= var_308_30 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_32 = arg_305_1:FormatText(StoryNameCfg[479].name)

				arg_305_1.leftNameTxt_.text = var_308_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_33 = arg_305_1:GetWordFromCfg(317012073)
				local var_308_34 = arg_305_1:FormatText(var_308_33.content)

				arg_305_1.text_.text = var_308_34

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_35 = 17
				local var_308_36 = utf8.len(var_308_34)
				local var_308_37 = var_308_35 <= 0 and var_308_31 or var_308_31 * (var_308_36 / var_308_35)

				if var_308_37 > 0 and var_308_31 < var_308_37 then
					arg_305_1.talkMaxDuration = var_308_37

					if var_308_37 + var_308_30 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_37 + var_308_30
					end
				end

				arg_305_1.text_.text = var_308_34
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012073", "story_v_out_317012.awb") ~= 0 then
					local var_308_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012073", "story_v_out_317012.awb") / 1000

					if var_308_38 + var_308_30 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_38 + var_308_30
					end

					if var_308_33.prefab_name ~= "" and arg_305_1.actors_[var_308_33.prefab_name] ~= nil then
						local var_308_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_33.prefab_name].transform, "story_v_out_317012", "317012073", "story_v_out_317012.awb")

						arg_305_1:RecordAudio("317012073", var_308_39)
						arg_305_1:RecordAudio("317012073", var_308_39)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_317012", "317012073", "story_v_out_317012.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_317012", "317012073", "story_v_out_317012.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_40 = math.max(var_308_31, arg_305_1.talkMaxDuration)

			if var_308_30 <= arg_305_1.time_ and arg_305_1.time_ < var_308_30 + var_308_40 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_30) / var_308_40

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_30 + var_308_40 and arg_305_1.time_ < var_308_30 + var_308_40 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play317012074 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 317012074
		arg_309_1.duration_ = 10.466

		local var_309_0 = {
			zh = 9.533,
			ja = 10.466
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
				arg_309_0:Play317012075(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_312_1 = 0
			local var_312_2 = 1.15

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_3 = arg_309_1:FormatText(StoryNameCfg[479].name)

				arg_309_1.leftNameTxt_.text = var_312_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_4 = arg_309_1:GetWordFromCfg(317012074)
				local var_312_5 = arg_309_1:FormatText(var_312_4.content)

				arg_309_1.text_.text = var_312_5

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_6 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012074", "story_v_out_317012.awb") ~= 0 then
					local var_312_9 = manager.audio:GetVoiceLength("story_v_out_317012", "317012074", "story_v_out_317012.awb") / 1000

					if var_312_9 + var_312_1 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_9 + var_312_1
					end

					if var_312_4.prefab_name ~= "" and arg_309_1.actors_[var_312_4.prefab_name] ~= nil then
						local var_312_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_4.prefab_name].transform, "story_v_out_317012", "317012074", "story_v_out_317012.awb")

						arg_309_1:RecordAudio("317012074", var_312_10)
						arg_309_1:RecordAudio("317012074", var_312_10)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_317012", "317012074", "story_v_out_317012.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_317012", "317012074", "story_v_out_317012.awb")
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
	Play317012075 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 317012075
		arg_313_1.duration_ = 0.999999999999

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play317012076(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["2078ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect2078ui_story == nil then
				arg_313_1.var_.characterEffect2078ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.200000002980232

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect2078ui_story then
					arg_313_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect2078ui_story then
				arg_313_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_316_4 = arg_313_1.actors_["1015ui_story"]
			local var_316_5 = 0

			if var_316_5 < arg_313_1.time_ and arg_313_1.time_ <= var_316_5 + arg_316_0 and arg_313_1.var_.characterEffect1015ui_story == nil then
				arg_313_1.var_.characterEffect1015ui_story = var_316_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_6 = 0.200000002980232

			if var_316_5 <= arg_313_1.time_ and arg_313_1.time_ < var_316_5 + var_316_6 then
				local var_316_7 = (arg_313_1.time_ - var_316_5) / var_316_6

				if arg_313_1.var_.characterEffect1015ui_story then
					local var_316_8 = Mathf.Lerp(0, 0.5, var_316_7)

					arg_313_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1015ui_story.fillRatio = var_316_8
				end
			end

			if arg_313_1.time_ >= var_316_5 + var_316_6 and arg_313_1.time_ < var_316_5 + var_316_6 + arg_316_0 and arg_313_1.var_.characterEffect1015ui_story then
				local var_316_9 = 0.5

				arg_313_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1015ui_story.fillRatio = var_316_9
			end

			local var_316_10 = 0
			local var_316_11 = 0.075

			if var_316_10 < arg_313_1.time_ and arg_313_1.time_ <= var_316_10 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_12 = arg_313_1:FormatText(StoryNameCfg[528].name)

				arg_313_1.leftNameTxt_.text = var_316_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_13 = arg_313_1:GetWordFromCfg(317012075)
				local var_316_14 = arg_313_1:FormatText(var_316_13.content)

				arg_313_1.text_.text = var_316_14

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_15 = 3
				local var_316_16 = utf8.len(var_316_14)
				local var_316_17 = var_316_15 <= 0 and var_316_11 or var_316_11 * (var_316_16 / var_316_15)

				if var_316_17 > 0 and var_316_11 < var_316_17 then
					arg_313_1.talkMaxDuration = var_316_17

					if var_316_17 + var_316_10 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_17 + var_316_10
					end
				end

				arg_313_1.text_.text = var_316_14
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012075", "story_v_out_317012.awb") ~= 0 then
					local var_316_18 = manager.audio:GetVoiceLength("story_v_out_317012", "317012075", "story_v_out_317012.awb") / 1000

					if var_316_18 + var_316_10 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_18 + var_316_10
					end

					if var_316_13.prefab_name ~= "" and arg_313_1.actors_[var_316_13.prefab_name] ~= nil then
						local var_316_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_13.prefab_name].transform, "story_v_out_317012", "317012075", "story_v_out_317012.awb")

						arg_313_1:RecordAudio("317012075", var_316_19)
						arg_313_1:RecordAudio("317012075", var_316_19)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_317012", "317012075", "story_v_out_317012.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_317012", "317012075", "story_v_out_317012.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_20 = math.max(var_316_11, arg_313_1.talkMaxDuration)

			if var_316_10 <= arg_313_1.time_ and arg_313_1.time_ < var_316_10 + var_316_20 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_10) / var_316_20

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_10 + var_316_20 and arg_313_1.time_ < var_316_10 + var_316_20 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play317012076 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 317012076
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play317012077(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["2078ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect2078ui_story == nil then
				arg_317_1.var_.characterEffect2078ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.200000002980232

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect2078ui_story then
					local var_320_4 = Mathf.Lerp(0, 0.5, var_320_3)

					arg_317_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_317_1.var_.characterEffect2078ui_story.fillRatio = var_320_4
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect2078ui_story then
				local var_320_5 = 0.5

				arg_317_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_317_1.var_.characterEffect2078ui_story.fillRatio = var_320_5
			end

			local var_320_6 = 0
			local var_320_7 = 1.175

			if var_320_6 < arg_317_1.time_ and arg_317_1.time_ <= var_320_6 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, false)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_8 = arg_317_1:GetWordFromCfg(317012076)
				local var_320_9 = arg_317_1:FormatText(var_320_8.content)

				arg_317_1.text_.text = var_320_9

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_10 = 47
				local var_320_11 = utf8.len(var_320_9)
				local var_320_12 = var_320_10 <= 0 and var_320_7 or var_320_7 * (var_320_11 / var_320_10)

				if var_320_12 > 0 and var_320_7 < var_320_12 then
					arg_317_1.talkMaxDuration = var_320_12

					if var_320_12 + var_320_6 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_12 + var_320_6
					end
				end

				arg_317_1.text_.text = var_320_9
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_13 = math.max(var_320_7, arg_317_1.talkMaxDuration)

			if var_320_6 <= arg_317_1.time_ and arg_317_1.time_ < var_320_6 + var_320_13 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_6) / var_320_13

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_6 + var_320_13 and arg_317_1.time_ < var_320_6 + var_320_13 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play317012077 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 317012077
		arg_321_1.duration_ = 12.333

		local var_321_0 = {
			zh = 12.333,
			ja = 9.4
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
				arg_321_0:Play317012078(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["2078ui_story"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos2078ui_story = var_324_0.localPosition
			end

			local var_324_2 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2
				local var_324_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos2078ui_story, var_324_4, var_324_3)

				local var_324_5 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_5.x, var_324_5.y, var_324_5.z)

				local var_324_6 = var_324_0.localEulerAngles

				var_324_6.z = 0
				var_324_6.x = 0
				var_324_0.localEulerAngles = var_324_6
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_324_7 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_7.x, var_324_7.y, var_324_7.z)

				local var_324_8 = var_324_0.localEulerAngles

				var_324_8.z = 0
				var_324_8.x = 0
				var_324_0.localEulerAngles = var_324_8
			end

			local var_324_9 = arg_321_1.actors_["2078ui_story"]
			local var_324_10 = 0

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 and arg_321_1.var_.characterEffect2078ui_story == nil then
				arg_321_1.var_.characterEffect2078ui_story = var_324_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_11 = 0.200000002980232

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_11 then
				local var_324_12 = (arg_321_1.time_ - var_324_10) / var_324_11

				if arg_321_1.var_.characterEffect2078ui_story then
					local var_324_13 = Mathf.Lerp(0, 0.5, var_324_12)

					arg_321_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_321_1.var_.characterEffect2078ui_story.fillRatio = var_324_13
				end
			end

			if arg_321_1.time_ >= var_324_10 + var_324_11 and arg_321_1.time_ < var_324_10 + var_324_11 + arg_324_0 and arg_321_1.var_.characterEffect2078ui_story then
				local var_324_14 = 0.5

				arg_321_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_321_1.var_.characterEffect2078ui_story.fillRatio = var_324_14
			end

			local var_324_15 = arg_321_1.actors_["1015ui_story"].transform
			local var_324_16 = 0

			if var_324_16 < arg_321_1.time_ and arg_321_1.time_ <= var_324_16 + arg_324_0 then
				arg_321_1.var_.moveOldPos1015ui_story = var_324_15.localPosition
			end

			local var_324_17 = 0.001

			if var_324_16 <= arg_321_1.time_ and arg_321_1.time_ < var_324_16 + var_324_17 then
				local var_324_18 = (arg_321_1.time_ - var_324_16) / var_324_17
				local var_324_19 = Vector3.New(0.7, -1.15, -6.2)

				var_324_15.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1015ui_story, var_324_19, var_324_18)

				local var_324_20 = manager.ui.mainCamera.transform.position - var_324_15.position

				var_324_15.forward = Vector3.New(var_324_20.x, var_324_20.y, var_324_20.z)

				local var_324_21 = var_324_15.localEulerAngles

				var_324_21.z = 0
				var_324_21.x = 0
				var_324_15.localEulerAngles = var_324_21
			end

			if arg_321_1.time_ >= var_324_16 + var_324_17 and arg_321_1.time_ < var_324_16 + var_324_17 + arg_324_0 then
				var_324_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_324_22 = manager.ui.mainCamera.transform.position - var_324_15.position

				var_324_15.forward = Vector3.New(var_324_22.x, var_324_22.y, var_324_22.z)

				local var_324_23 = var_324_15.localEulerAngles

				var_324_23.z = 0
				var_324_23.x = 0
				var_324_15.localEulerAngles = var_324_23
			end

			local var_324_24 = arg_321_1.actors_["1015ui_story"]
			local var_324_25 = 0

			if var_324_25 < arg_321_1.time_ and arg_321_1.time_ <= var_324_25 + arg_324_0 and arg_321_1.var_.characterEffect1015ui_story == nil then
				arg_321_1.var_.characterEffect1015ui_story = var_324_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_26 = 0.200000002980232

			if var_324_25 <= arg_321_1.time_ and arg_321_1.time_ < var_324_25 + var_324_26 then
				local var_324_27 = (arg_321_1.time_ - var_324_25) / var_324_26

				if arg_321_1.var_.characterEffect1015ui_story then
					arg_321_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_25 + var_324_26 and arg_321_1.time_ < var_324_25 + var_324_26 + arg_324_0 and arg_321_1.var_.characterEffect1015ui_story then
				arg_321_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_324_28 = 0

			if var_324_28 < arg_321_1.time_ and arg_321_1.time_ <= var_324_28 + arg_324_0 then
				arg_321_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_2")
			end

			local var_324_29 = 0

			if var_324_29 < arg_321_1.time_ and arg_321_1.time_ <= var_324_29 + arg_324_0 then
				arg_321_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_324_30 = 0
			local var_324_31 = 1.425

			if var_324_30 < arg_321_1.time_ and arg_321_1.time_ <= var_324_30 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_32 = arg_321_1:FormatText(StoryNameCfg[479].name)

				arg_321_1.leftNameTxt_.text = var_324_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_33 = arg_321_1:GetWordFromCfg(317012077)
				local var_324_34 = arg_321_1:FormatText(var_324_33.content)

				arg_321_1.text_.text = var_324_34

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_35 = 57
				local var_324_36 = utf8.len(var_324_34)
				local var_324_37 = var_324_35 <= 0 and var_324_31 or var_324_31 * (var_324_36 / var_324_35)

				if var_324_37 > 0 and var_324_31 < var_324_37 then
					arg_321_1.talkMaxDuration = var_324_37

					if var_324_37 + var_324_30 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_37 + var_324_30
					end
				end

				arg_321_1.text_.text = var_324_34
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012077", "story_v_out_317012.awb") ~= 0 then
					local var_324_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012077", "story_v_out_317012.awb") / 1000

					if var_324_38 + var_324_30 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_38 + var_324_30
					end

					if var_324_33.prefab_name ~= "" and arg_321_1.actors_[var_324_33.prefab_name] ~= nil then
						local var_324_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_33.prefab_name].transform, "story_v_out_317012", "317012077", "story_v_out_317012.awb")

						arg_321_1:RecordAudio("317012077", var_324_39)
						arg_321_1:RecordAudio("317012077", var_324_39)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_317012", "317012077", "story_v_out_317012.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_317012", "317012077", "story_v_out_317012.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_40 = math.max(var_324_31, arg_321_1.talkMaxDuration)

			if var_324_30 <= arg_321_1.time_ and arg_321_1.time_ < var_324_30 + var_324_40 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_30) / var_324_40

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_30 + var_324_40 and arg_321_1.time_ < var_324_30 + var_324_40 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play317012078 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 317012078
		arg_325_1.duration_ = 6.366

		local var_325_0 = {
			zh = 3.8,
			ja = 6.366
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
				arg_325_0:Play317012079(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1015ui_story"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos1015ui_story = var_328_0.localPosition
			end

			local var_328_2 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2
				local var_328_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos1015ui_story, var_328_4, var_328_3)

				local var_328_5 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_5.x, var_328_5.y, var_328_5.z)

				local var_328_6 = var_328_0.localEulerAngles

				var_328_6.z = 0
				var_328_6.x = 0
				var_328_0.localEulerAngles = var_328_6
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_328_7 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_7.x, var_328_7.y, var_328_7.z)

				local var_328_8 = var_328_0.localEulerAngles

				var_328_8.z = 0
				var_328_8.x = 0
				var_328_0.localEulerAngles = var_328_8
			end

			local var_328_9 = arg_325_1.actors_["1015ui_story"]
			local var_328_10 = 0

			if var_328_10 < arg_325_1.time_ and arg_325_1.time_ <= var_328_10 + arg_328_0 and arg_325_1.var_.characterEffect1015ui_story == nil then
				arg_325_1.var_.characterEffect1015ui_story = var_328_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_11 = 0.200000002980232

			if var_328_10 <= arg_325_1.time_ and arg_325_1.time_ < var_328_10 + var_328_11 then
				local var_328_12 = (arg_325_1.time_ - var_328_10) / var_328_11

				if arg_325_1.var_.characterEffect1015ui_story then
					local var_328_13 = Mathf.Lerp(0, 0.5, var_328_12)

					arg_325_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_325_1.var_.characterEffect1015ui_story.fillRatio = var_328_13
				end
			end

			if arg_325_1.time_ >= var_328_10 + var_328_11 and arg_325_1.time_ < var_328_10 + var_328_11 + arg_328_0 and arg_325_1.var_.characterEffect1015ui_story then
				local var_328_14 = 0.5

				arg_325_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_325_1.var_.characterEffect1015ui_story.fillRatio = var_328_14
			end

			local var_328_15 = "2079ui_story"

			if arg_325_1.actors_[var_328_15] == nil then
				local var_328_16 = Object.Instantiate(Asset.Load("Char/" .. var_328_15), arg_325_1.stage_.transform)

				var_328_16.name = var_328_15
				var_328_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_325_1.actors_[var_328_15] = var_328_16

				local var_328_17 = var_328_16:GetComponentInChildren(typeof(CharacterEffect))

				var_328_17.enabled = true

				local var_328_18 = GameObjectTools.GetOrAddComponent(var_328_16, typeof(DynamicBoneHelper))

				if var_328_18 then
					var_328_18:EnableDynamicBone(false)
				end

				arg_325_1:ShowWeapon(var_328_17.transform, false)

				arg_325_1.var_[var_328_15 .. "Animator"] = var_328_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_325_1.var_[var_328_15 .. "Animator"].applyRootMotion = true
				arg_325_1.var_[var_328_15 .. "LipSync"] = var_328_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_328_19 = arg_325_1.actors_["2079ui_story"]
			local var_328_20 = 0

			if var_328_20 < arg_325_1.time_ and arg_325_1.time_ <= var_328_20 + arg_328_0 and arg_325_1.var_.characterEffect2079ui_story == nil then
				arg_325_1.var_.characterEffect2079ui_story = var_328_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_21 = 0.200000002980232

			if var_328_20 <= arg_325_1.time_ and arg_325_1.time_ < var_328_20 + var_328_21 then
				local var_328_22 = (arg_325_1.time_ - var_328_20) / var_328_21

				if arg_325_1.var_.characterEffect2079ui_story then
					arg_325_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_20 + var_328_21 and arg_325_1.time_ < var_328_20 + var_328_21 + arg_328_0 and arg_325_1.var_.characterEffect2079ui_story then
				arg_325_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_328_23 = 0

			if var_328_23 < arg_325_1.time_ and arg_325_1.time_ <= var_328_23 + arg_328_0 then
				arg_325_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_328_24 = arg_325_1.actors_["2078ui_story"].transform
			local var_328_25 = 0

			if var_328_25 < arg_325_1.time_ and arg_325_1.time_ <= var_328_25 + arg_328_0 then
				arg_325_1.var_.moveOldPos2078ui_story = var_328_24.localPosition
			end

			local var_328_26 = 0.001

			if var_328_25 <= arg_325_1.time_ and arg_325_1.time_ < var_328_25 + var_328_26 then
				local var_328_27 = (arg_325_1.time_ - var_328_25) / var_328_26
				local var_328_28 = Vector3.New(0, 100, 0)

				var_328_24.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos2078ui_story, var_328_28, var_328_27)

				local var_328_29 = manager.ui.mainCamera.transform.position - var_328_24.position

				var_328_24.forward = Vector3.New(var_328_29.x, var_328_29.y, var_328_29.z)

				local var_328_30 = var_328_24.localEulerAngles

				var_328_30.z = 0
				var_328_30.x = 0
				var_328_24.localEulerAngles = var_328_30
			end

			if arg_325_1.time_ >= var_328_25 + var_328_26 and arg_325_1.time_ < var_328_25 + var_328_26 + arg_328_0 then
				var_328_24.localPosition = Vector3.New(0, 100, 0)

				local var_328_31 = manager.ui.mainCamera.transform.position - var_328_24.position

				var_328_24.forward = Vector3.New(var_328_31.x, var_328_31.y, var_328_31.z)

				local var_328_32 = var_328_24.localEulerAngles

				var_328_32.z = 0
				var_328_32.x = 0
				var_328_24.localEulerAngles = var_328_32
			end

			local var_328_33 = arg_325_1.actors_["2078ui_story"]
			local var_328_34 = 0

			if var_328_34 < arg_325_1.time_ and arg_325_1.time_ <= var_328_34 + arg_328_0 and arg_325_1.var_.characterEffect2078ui_story == nil then
				arg_325_1.var_.characterEffect2078ui_story = var_328_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_35 = 0.200000002980232

			if var_328_34 <= arg_325_1.time_ and arg_325_1.time_ < var_328_34 + var_328_35 then
				local var_328_36 = (arg_325_1.time_ - var_328_34) / var_328_35

				if arg_325_1.var_.characterEffect2078ui_story then
					local var_328_37 = Mathf.Lerp(0, 0.5, var_328_36)

					arg_325_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_325_1.var_.characterEffect2078ui_story.fillRatio = var_328_37
				end
			end

			if arg_325_1.time_ >= var_328_34 + var_328_35 and arg_325_1.time_ < var_328_34 + var_328_35 + arg_328_0 and arg_325_1.var_.characterEffect2078ui_story then
				local var_328_38 = 0.5

				arg_325_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_325_1.var_.characterEffect2078ui_story.fillRatio = var_328_38
			end

			local var_328_39 = 0

			if var_328_39 < arg_325_1.time_ and arg_325_1.time_ <= var_328_39 + arg_328_0 then
				arg_325_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_328_40 = arg_325_1.actors_["2079ui_story"].transform
			local var_328_41 = 0

			if var_328_41 < arg_325_1.time_ and arg_325_1.time_ <= var_328_41 + arg_328_0 then
				arg_325_1.var_.moveOldPos2079ui_story = var_328_40.localPosition
			end

			local var_328_42 = 0.001

			if var_328_41 <= arg_325_1.time_ and arg_325_1.time_ < var_328_41 + var_328_42 then
				local var_328_43 = (arg_325_1.time_ - var_328_41) / var_328_42
				local var_328_44 = Vector3.New(0.7, -1.28, -5.6)

				var_328_40.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos2079ui_story, var_328_44, var_328_43)

				local var_328_45 = manager.ui.mainCamera.transform.position - var_328_40.position

				var_328_40.forward = Vector3.New(var_328_45.x, var_328_45.y, var_328_45.z)

				local var_328_46 = var_328_40.localEulerAngles

				var_328_46.z = 0
				var_328_46.x = 0
				var_328_40.localEulerAngles = var_328_46
			end

			if arg_325_1.time_ >= var_328_41 + var_328_42 and arg_325_1.time_ < var_328_41 + var_328_42 + arg_328_0 then
				var_328_40.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_328_47 = manager.ui.mainCamera.transform.position - var_328_40.position

				var_328_40.forward = Vector3.New(var_328_47.x, var_328_47.y, var_328_47.z)

				local var_328_48 = var_328_40.localEulerAngles

				var_328_48.z = 0
				var_328_48.x = 0
				var_328_40.localEulerAngles = var_328_48
			end

			local var_328_49 = 0
			local var_328_50 = 0.475

			if var_328_49 < arg_325_1.time_ and arg_325_1.time_ <= var_328_49 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_51 = arg_325_1:FormatText(StoryNameCfg[529].name)

				arg_325_1.leftNameTxt_.text = var_328_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_52 = arg_325_1:GetWordFromCfg(317012078)
				local var_328_53 = arg_325_1:FormatText(var_328_52.content)

				arg_325_1.text_.text = var_328_53

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_54 = 19
				local var_328_55 = utf8.len(var_328_53)
				local var_328_56 = var_328_54 <= 0 and var_328_50 or var_328_50 * (var_328_55 / var_328_54)

				if var_328_56 > 0 and var_328_50 < var_328_56 then
					arg_325_1.talkMaxDuration = var_328_56

					if var_328_56 + var_328_49 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_56 + var_328_49
					end
				end

				arg_325_1.text_.text = var_328_53
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012078", "story_v_out_317012.awb") ~= 0 then
					local var_328_57 = manager.audio:GetVoiceLength("story_v_out_317012", "317012078", "story_v_out_317012.awb") / 1000

					if var_328_57 + var_328_49 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_57 + var_328_49
					end

					if var_328_52.prefab_name ~= "" and arg_325_1.actors_[var_328_52.prefab_name] ~= nil then
						local var_328_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_52.prefab_name].transform, "story_v_out_317012", "317012078", "story_v_out_317012.awb")

						arg_325_1:RecordAudio("317012078", var_328_58)
						arg_325_1:RecordAudio("317012078", var_328_58)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_317012", "317012078", "story_v_out_317012.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_317012", "317012078", "story_v_out_317012.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_59 = math.max(var_328_50, arg_325_1.talkMaxDuration)

			if var_328_49 <= arg_325_1.time_ and arg_325_1.time_ < var_328_49 + var_328_59 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_49) / var_328_59

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_49 + var_328_59 and arg_325_1.time_ < var_328_49 + var_328_59 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play317012079 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 317012079
		arg_329_1.duration_ = 2.5

		local var_329_0 = {
			zh = 1.999999999999,
			ja = 2.5
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
				arg_329_0:Play317012080(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1015ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1015ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1015ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["1015ui_story"]
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 and arg_329_1.var_.characterEffect1015ui_story == nil then
				arg_329_1.var_.characterEffect1015ui_story = var_332_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_11 = 0.200000002980232

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11

				if arg_329_1.var_.characterEffect1015ui_story then
					arg_329_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 and arg_329_1.var_.characterEffect1015ui_story then
				arg_329_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_332_13 = 0

			if var_332_13 < arg_329_1.time_ and arg_329_1.time_ <= var_332_13 + arg_332_0 then
				arg_329_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action5_1")
			end

			local var_332_14 = 0

			if var_332_14 < arg_329_1.time_ and arg_329_1.time_ <= var_332_14 + arg_332_0 then
				arg_329_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_332_15 = arg_329_1.actors_["2079ui_story"].transform
			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 then
				arg_329_1.var_.moveOldPos2079ui_story = var_332_15.localPosition
			end

			local var_332_17 = 0.001

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17
				local var_332_19 = Vector3.New(0.7, -1.28, -5.6)

				var_332_15.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos2079ui_story, var_332_19, var_332_18)

				local var_332_20 = manager.ui.mainCamera.transform.position - var_332_15.position

				var_332_15.forward = Vector3.New(var_332_20.x, var_332_20.y, var_332_20.z)

				local var_332_21 = var_332_15.localEulerAngles

				var_332_21.z = 0
				var_332_21.x = 0
				var_332_15.localEulerAngles = var_332_21
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 then
				var_332_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_332_22 = manager.ui.mainCamera.transform.position - var_332_15.position

				var_332_15.forward = Vector3.New(var_332_22.x, var_332_22.y, var_332_22.z)

				local var_332_23 = var_332_15.localEulerAngles

				var_332_23.z = 0
				var_332_23.x = 0
				var_332_15.localEulerAngles = var_332_23
			end

			local var_332_24 = arg_329_1.actors_["2079ui_story"]
			local var_332_25 = 0

			if var_332_25 < arg_329_1.time_ and arg_329_1.time_ <= var_332_25 + arg_332_0 and arg_329_1.var_.characterEffect2079ui_story == nil then
				arg_329_1.var_.characterEffect2079ui_story = var_332_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_26 = 0.200000002980232

			if var_332_25 <= arg_329_1.time_ and arg_329_1.time_ < var_332_25 + var_332_26 then
				local var_332_27 = (arg_329_1.time_ - var_332_25) / var_332_26

				if arg_329_1.var_.characterEffect2079ui_story then
					local var_332_28 = Mathf.Lerp(0, 0.5, var_332_27)

					arg_329_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_329_1.var_.characterEffect2079ui_story.fillRatio = var_332_28
				end
			end

			if arg_329_1.time_ >= var_332_25 + var_332_26 and arg_329_1.time_ < var_332_25 + var_332_26 + arg_332_0 and arg_329_1.var_.characterEffect2079ui_story then
				local var_332_29 = 0.5

				arg_329_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_329_1.var_.characterEffect2079ui_story.fillRatio = var_332_29
			end

			local var_332_30 = 0
			local var_332_31 = 0.1

			if var_332_30 < arg_329_1.time_ and arg_329_1.time_ <= var_332_30 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_32 = arg_329_1:FormatText(StoryNameCfg[479].name)

				arg_329_1.leftNameTxt_.text = var_332_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_33 = arg_329_1:GetWordFromCfg(317012079)
				local var_332_34 = arg_329_1:FormatText(var_332_33.content)

				arg_329_1.text_.text = var_332_34

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_35 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012079", "story_v_out_317012.awb") ~= 0 then
					local var_332_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012079", "story_v_out_317012.awb") / 1000

					if var_332_38 + var_332_30 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_38 + var_332_30
					end

					if var_332_33.prefab_name ~= "" and arg_329_1.actors_[var_332_33.prefab_name] ~= nil then
						local var_332_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_33.prefab_name].transform, "story_v_out_317012", "317012079", "story_v_out_317012.awb")

						arg_329_1:RecordAudio("317012079", var_332_39)
						arg_329_1:RecordAudio("317012079", var_332_39)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_317012", "317012079", "story_v_out_317012.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_317012", "317012079", "story_v_out_317012.awb")
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
	Play317012080 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 317012080
		arg_333_1.duration_ = 9.866

		local var_333_0 = {
			zh = 6.733,
			ja = 9.866
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
				arg_333_0:Play317012081(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["2078ui_story"].transform
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1.var_.moveOldPos2078ui_story = var_336_0.localPosition
			end

			local var_336_2 = 0.001

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2
				local var_336_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_336_0.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos2078ui_story, var_336_4, var_336_3)

				local var_336_5 = manager.ui.mainCamera.transform.position - var_336_0.position

				var_336_0.forward = Vector3.New(var_336_5.x, var_336_5.y, var_336_5.z)

				local var_336_6 = var_336_0.localEulerAngles

				var_336_6.z = 0
				var_336_6.x = 0
				var_336_0.localEulerAngles = var_336_6
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 then
				var_336_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_336_7 = manager.ui.mainCamera.transform.position - var_336_0.position

				var_336_0.forward = Vector3.New(var_336_7.x, var_336_7.y, var_336_7.z)

				local var_336_8 = var_336_0.localEulerAngles

				var_336_8.z = 0
				var_336_8.x = 0
				var_336_0.localEulerAngles = var_336_8
			end

			local var_336_9 = arg_333_1.actors_["2078ui_story"]
			local var_336_10 = 0

			if var_336_10 < arg_333_1.time_ and arg_333_1.time_ <= var_336_10 + arg_336_0 and arg_333_1.var_.characterEffect2078ui_story == nil then
				arg_333_1.var_.characterEffect2078ui_story = var_336_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_11 = 0.200000002980232

			if var_336_10 <= arg_333_1.time_ and arg_333_1.time_ < var_336_10 + var_336_11 then
				local var_336_12 = (arg_333_1.time_ - var_336_10) / var_336_11

				if arg_333_1.var_.characterEffect2078ui_story then
					arg_333_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_10 + var_336_11 and arg_333_1.time_ < var_336_10 + var_336_11 + arg_336_0 and arg_333_1.var_.characterEffect2078ui_story then
				arg_333_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_336_13 = 0

			if var_336_13 < arg_333_1.time_ and arg_333_1.time_ <= var_336_13 + arg_336_0 then
				arg_333_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_336_14 = 0

			if var_336_14 < arg_333_1.time_ and arg_333_1.time_ <= var_336_14 + arg_336_0 then
				arg_333_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_336_15 = arg_333_1.actors_["1015ui_story"].transform
			local var_336_16 = 0

			if var_336_16 < arg_333_1.time_ and arg_333_1.time_ <= var_336_16 + arg_336_0 then
				arg_333_1.var_.moveOldPos1015ui_story = var_336_15.localPosition
			end

			local var_336_17 = 0.001

			if var_336_16 <= arg_333_1.time_ and arg_333_1.time_ < var_336_16 + var_336_17 then
				local var_336_18 = (arg_333_1.time_ - var_336_16) / var_336_17
				local var_336_19 = Vector3.New(0.7, -1.15, -6.2)

				var_336_15.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1015ui_story, var_336_19, var_336_18)

				local var_336_20 = manager.ui.mainCamera.transform.position - var_336_15.position

				var_336_15.forward = Vector3.New(var_336_20.x, var_336_20.y, var_336_20.z)

				local var_336_21 = var_336_15.localEulerAngles

				var_336_21.z = 0
				var_336_21.x = 0
				var_336_15.localEulerAngles = var_336_21
			end

			if arg_333_1.time_ >= var_336_16 + var_336_17 and arg_333_1.time_ < var_336_16 + var_336_17 + arg_336_0 then
				var_336_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_336_22 = manager.ui.mainCamera.transform.position - var_336_15.position

				var_336_15.forward = Vector3.New(var_336_22.x, var_336_22.y, var_336_22.z)

				local var_336_23 = var_336_15.localEulerAngles

				var_336_23.z = 0
				var_336_23.x = 0
				var_336_15.localEulerAngles = var_336_23
			end

			local var_336_24 = arg_333_1.actors_["1015ui_story"]
			local var_336_25 = 0

			if var_336_25 < arg_333_1.time_ and arg_333_1.time_ <= var_336_25 + arg_336_0 and arg_333_1.var_.characterEffect1015ui_story == nil then
				arg_333_1.var_.characterEffect1015ui_story = var_336_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_26 = 0.200000002980232

			if var_336_25 <= arg_333_1.time_ and arg_333_1.time_ < var_336_25 + var_336_26 then
				local var_336_27 = (arg_333_1.time_ - var_336_25) / var_336_26

				if arg_333_1.var_.characterEffect1015ui_story then
					local var_336_28 = Mathf.Lerp(0, 0.5, var_336_27)

					arg_333_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1015ui_story.fillRatio = var_336_28
				end
			end

			if arg_333_1.time_ >= var_336_25 + var_336_26 and arg_333_1.time_ < var_336_25 + var_336_26 + arg_336_0 and arg_333_1.var_.characterEffect1015ui_story then
				local var_336_29 = 0.5

				arg_333_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1015ui_story.fillRatio = var_336_29
			end

			local var_336_30 = arg_333_1.actors_["2079ui_story"].transform
			local var_336_31 = 0

			if var_336_31 < arg_333_1.time_ and arg_333_1.time_ <= var_336_31 + arg_336_0 then
				arg_333_1.var_.moveOldPos2079ui_story = var_336_30.localPosition
			end

			local var_336_32 = 0.001

			if var_336_31 <= arg_333_1.time_ and arg_333_1.time_ < var_336_31 + var_336_32 then
				local var_336_33 = (arg_333_1.time_ - var_336_31) / var_336_32
				local var_336_34 = Vector3.New(0, 100, 0)

				var_336_30.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos2079ui_story, var_336_34, var_336_33)

				local var_336_35 = manager.ui.mainCamera.transform.position - var_336_30.position

				var_336_30.forward = Vector3.New(var_336_35.x, var_336_35.y, var_336_35.z)

				local var_336_36 = var_336_30.localEulerAngles

				var_336_36.z = 0
				var_336_36.x = 0
				var_336_30.localEulerAngles = var_336_36
			end

			if arg_333_1.time_ >= var_336_31 + var_336_32 and arg_333_1.time_ < var_336_31 + var_336_32 + arg_336_0 then
				var_336_30.localPosition = Vector3.New(0, 100, 0)

				local var_336_37 = manager.ui.mainCamera.transform.position - var_336_30.position

				var_336_30.forward = Vector3.New(var_336_37.x, var_336_37.y, var_336_37.z)

				local var_336_38 = var_336_30.localEulerAngles

				var_336_38.z = 0
				var_336_38.x = 0
				var_336_30.localEulerAngles = var_336_38
			end

			local var_336_39 = arg_333_1.actors_["2079ui_story"]
			local var_336_40 = 0

			if var_336_40 < arg_333_1.time_ and arg_333_1.time_ <= var_336_40 + arg_336_0 and arg_333_1.var_.characterEffect2079ui_story == nil then
				arg_333_1.var_.characterEffect2079ui_story = var_336_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_41 = 0.200000002980232

			if var_336_40 <= arg_333_1.time_ and arg_333_1.time_ < var_336_40 + var_336_41 then
				local var_336_42 = (arg_333_1.time_ - var_336_40) / var_336_41

				if arg_333_1.var_.characterEffect2079ui_story then
					local var_336_43 = Mathf.Lerp(0, 0.5, var_336_42)

					arg_333_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_333_1.var_.characterEffect2079ui_story.fillRatio = var_336_43
				end
			end

			if arg_333_1.time_ >= var_336_40 + var_336_41 and arg_333_1.time_ < var_336_40 + var_336_41 + arg_336_0 and arg_333_1.var_.characterEffect2079ui_story then
				local var_336_44 = 0.5

				arg_333_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_333_1.var_.characterEffect2079ui_story.fillRatio = var_336_44
			end

			local var_336_45 = 0
			local var_336_46 = 0.925

			if var_336_45 < arg_333_1.time_ and arg_333_1.time_ <= var_336_45 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_47 = arg_333_1:FormatText(StoryNameCfg[530].name)

				arg_333_1.leftNameTxt_.text = var_336_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_48 = arg_333_1:GetWordFromCfg(317012080)
				local var_336_49 = arg_333_1:FormatText(var_336_48.content)

				arg_333_1.text_.text = var_336_49

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_50 = 37
				local var_336_51 = utf8.len(var_336_49)
				local var_336_52 = var_336_50 <= 0 and var_336_46 or var_336_46 * (var_336_51 / var_336_50)

				if var_336_52 > 0 and var_336_46 < var_336_52 then
					arg_333_1.talkMaxDuration = var_336_52

					if var_336_52 + var_336_45 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_52 + var_336_45
					end
				end

				arg_333_1.text_.text = var_336_49
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012080", "story_v_out_317012.awb") ~= 0 then
					local var_336_53 = manager.audio:GetVoiceLength("story_v_out_317012", "317012080", "story_v_out_317012.awb") / 1000

					if var_336_53 + var_336_45 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_53 + var_336_45
					end

					if var_336_48.prefab_name ~= "" and arg_333_1.actors_[var_336_48.prefab_name] ~= nil then
						local var_336_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_48.prefab_name].transform, "story_v_out_317012", "317012080", "story_v_out_317012.awb")

						arg_333_1:RecordAudio("317012080", var_336_54)
						arg_333_1:RecordAudio("317012080", var_336_54)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_317012", "317012080", "story_v_out_317012.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_317012", "317012080", "story_v_out_317012.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_55 = math.max(var_336_46, arg_333_1.talkMaxDuration)

			if var_336_45 <= arg_333_1.time_ and arg_333_1.time_ < var_336_45 + var_336_55 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_45) / var_336_55

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_45 + var_336_55 and arg_333_1.time_ < var_336_45 + var_336_55 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play317012081 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 317012081
		arg_337_1.duration_ = 2.533

		local var_337_0 = {
			zh = 1.999999999999,
			ja = 2.533
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
				arg_337_0:Play317012082(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["2078ui_story"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos2078ui_story = var_340_0.localPosition
			end

			local var_340_2 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2
				local var_340_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos2078ui_story, var_340_4, var_340_3)

				local var_340_5 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_5.x, var_340_5.y, var_340_5.z)

				local var_340_6 = var_340_0.localEulerAngles

				var_340_6.z = 0
				var_340_6.x = 0
				var_340_0.localEulerAngles = var_340_6
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_340_7 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_7.x, var_340_7.y, var_340_7.z)

				local var_340_8 = var_340_0.localEulerAngles

				var_340_8.z = 0
				var_340_8.x = 0
				var_340_0.localEulerAngles = var_340_8
			end

			local var_340_9 = arg_337_1.actors_["2078ui_story"]
			local var_340_10 = 0

			if var_340_10 < arg_337_1.time_ and arg_337_1.time_ <= var_340_10 + arg_340_0 and arg_337_1.var_.characterEffect2078ui_story == nil then
				arg_337_1.var_.characterEffect2078ui_story = var_340_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_11 = 0.200000002980232

			if var_340_10 <= arg_337_1.time_ and arg_337_1.time_ < var_340_10 + var_340_11 then
				local var_340_12 = (arg_337_1.time_ - var_340_10) / var_340_11

				if arg_337_1.var_.characterEffect2078ui_story then
					local var_340_13 = Mathf.Lerp(0, 0.5, var_340_12)

					arg_337_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_337_1.var_.characterEffect2078ui_story.fillRatio = var_340_13
				end
			end

			if arg_337_1.time_ >= var_340_10 + var_340_11 and arg_337_1.time_ < var_340_10 + var_340_11 + arg_340_0 and arg_337_1.var_.characterEffect2078ui_story then
				local var_340_14 = 0.5

				arg_337_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_337_1.var_.characterEffect2078ui_story.fillRatio = var_340_14
			end

			local var_340_15 = arg_337_1.actors_["1015ui_story"].transform
			local var_340_16 = 0

			if var_340_16 < arg_337_1.time_ and arg_337_1.time_ <= var_340_16 + arg_340_0 then
				arg_337_1.var_.moveOldPos1015ui_story = var_340_15.localPosition
			end

			local var_340_17 = 0.001

			if var_340_16 <= arg_337_1.time_ and arg_337_1.time_ < var_340_16 + var_340_17 then
				local var_340_18 = (arg_337_1.time_ - var_340_16) / var_340_17
				local var_340_19 = Vector3.New(0.7, -1.15, -6.2)

				var_340_15.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1015ui_story, var_340_19, var_340_18)

				local var_340_20 = manager.ui.mainCamera.transform.position - var_340_15.position

				var_340_15.forward = Vector3.New(var_340_20.x, var_340_20.y, var_340_20.z)

				local var_340_21 = var_340_15.localEulerAngles

				var_340_21.z = 0
				var_340_21.x = 0
				var_340_15.localEulerAngles = var_340_21
			end

			if arg_337_1.time_ >= var_340_16 + var_340_17 and arg_337_1.time_ < var_340_16 + var_340_17 + arg_340_0 then
				var_340_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_340_22 = manager.ui.mainCamera.transform.position - var_340_15.position

				var_340_15.forward = Vector3.New(var_340_22.x, var_340_22.y, var_340_22.z)

				local var_340_23 = var_340_15.localEulerAngles

				var_340_23.z = 0
				var_340_23.x = 0
				var_340_15.localEulerAngles = var_340_23
			end

			local var_340_24 = arg_337_1.actors_["1015ui_story"]
			local var_340_25 = 0

			if var_340_25 < arg_337_1.time_ and arg_337_1.time_ <= var_340_25 + arg_340_0 and arg_337_1.var_.characterEffect1015ui_story == nil then
				arg_337_1.var_.characterEffect1015ui_story = var_340_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_26 = 0.200000002980232

			if var_340_25 <= arg_337_1.time_ and arg_337_1.time_ < var_340_25 + var_340_26 then
				local var_340_27 = (arg_337_1.time_ - var_340_25) / var_340_26

				if arg_337_1.var_.characterEffect1015ui_story then
					arg_337_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_25 + var_340_26 and arg_337_1.time_ < var_340_25 + var_340_26 + arg_340_0 and arg_337_1.var_.characterEffect1015ui_story then
				arg_337_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_340_28 = 0

			if var_340_28 < arg_337_1.time_ and arg_337_1.time_ <= var_340_28 + arg_340_0 then
				arg_337_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_340_29 = 0
			local var_340_30 = 0.1

			if var_340_29 < arg_337_1.time_ and arg_337_1.time_ <= var_340_29 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_31 = arg_337_1:FormatText(StoryNameCfg[479].name)

				arg_337_1.leftNameTxt_.text = var_340_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_32 = arg_337_1:GetWordFromCfg(317012081)
				local var_340_33 = arg_337_1:FormatText(var_340_32.content)

				arg_337_1.text_.text = var_340_33

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_34 = 4
				local var_340_35 = utf8.len(var_340_33)
				local var_340_36 = var_340_34 <= 0 and var_340_30 or var_340_30 * (var_340_35 / var_340_34)

				if var_340_36 > 0 and var_340_30 < var_340_36 then
					arg_337_1.talkMaxDuration = var_340_36

					if var_340_36 + var_340_29 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_36 + var_340_29
					end
				end

				arg_337_1.text_.text = var_340_33
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012081", "story_v_out_317012.awb") ~= 0 then
					local var_340_37 = manager.audio:GetVoiceLength("story_v_out_317012", "317012081", "story_v_out_317012.awb") / 1000

					if var_340_37 + var_340_29 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_37 + var_340_29
					end

					if var_340_32.prefab_name ~= "" and arg_337_1.actors_[var_340_32.prefab_name] ~= nil then
						local var_340_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_32.prefab_name].transform, "story_v_out_317012", "317012081", "story_v_out_317012.awb")

						arg_337_1:RecordAudio("317012081", var_340_38)
						arg_337_1:RecordAudio("317012081", var_340_38)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_317012", "317012081", "story_v_out_317012.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_317012", "317012081", "story_v_out_317012.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_39 = math.max(var_340_30, arg_337_1.talkMaxDuration)

			if var_340_29 <= arg_337_1.time_ and arg_337_1.time_ < var_340_29 + var_340_39 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_29) / var_340_39

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_29 + var_340_39 and arg_337_1.time_ < var_340_29 + var_340_39 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play317012082 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 317012082
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play317012083(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1015ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1015ui_story == nil then
				arg_341_1.var_.characterEffect1015ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.200000002980232

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1015ui_story then
					local var_344_4 = Mathf.Lerp(0, 0.5, var_344_3)

					arg_341_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1015ui_story.fillRatio = var_344_4
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1015ui_story then
				local var_344_5 = 0.5

				arg_341_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1015ui_story.fillRatio = var_344_5
			end

			local var_344_6 = 0
			local var_344_7 = 0.35

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, false)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_8 = arg_341_1:GetWordFromCfg(317012082)
				local var_344_9 = arg_341_1:FormatText(var_344_8.content)

				arg_341_1.text_.text = var_344_9

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_10 = 14
				local var_344_11 = utf8.len(var_344_9)
				local var_344_12 = var_344_10 <= 0 and var_344_7 or var_344_7 * (var_344_11 / var_344_10)

				if var_344_12 > 0 and var_344_7 < var_344_12 then
					arg_341_1.talkMaxDuration = var_344_12

					if var_344_12 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_12 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_9
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_13 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_13 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_13

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_13 and arg_341_1.time_ < var_344_6 + var_344_13 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play317012083 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 317012083
		arg_345_1.duration_ = 3.133

		local var_345_0 = {
			zh = 3.133,
			ja = 2.9
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
				arg_345_0:Play317012084(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["2078ui_story"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos2078ui_story = var_348_0.localPosition
			end

			local var_348_2 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2
				local var_348_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos2078ui_story, var_348_4, var_348_3)

				local var_348_5 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_5.x, var_348_5.y, var_348_5.z)

				local var_348_6 = var_348_0.localEulerAngles

				var_348_6.z = 0
				var_348_6.x = 0
				var_348_0.localEulerAngles = var_348_6
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_348_7 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_7.x, var_348_7.y, var_348_7.z)

				local var_348_8 = var_348_0.localEulerAngles

				var_348_8.z = 0
				var_348_8.x = 0
				var_348_0.localEulerAngles = var_348_8
			end

			local var_348_9 = arg_345_1.actors_["2078ui_story"]
			local var_348_10 = 0

			if var_348_10 < arg_345_1.time_ and arg_345_1.time_ <= var_348_10 + arg_348_0 and arg_345_1.var_.characterEffect2078ui_story == nil then
				arg_345_1.var_.characterEffect2078ui_story = var_348_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_11 = 0.200000002980232

			if var_348_10 <= arg_345_1.time_ and arg_345_1.time_ < var_348_10 + var_348_11 then
				local var_348_12 = (arg_345_1.time_ - var_348_10) / var_348_11

				if arg_345_1.var_.characterEffect2078ui_story then
					local var_348_13 = Mathf.Lerp(0, 0.5, var_348_12)

					arg_345_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_345_1.var_.characterEffect2078ui_story.fillRatio = var_348_13
				end
			end

			if arg_345_1.time_ >= var_348_10 + var_348_11 and arg_345_1.time_ < var_348_10 + var_348_11 + arg_348_0 and arg_345_1.var_.characterEffect2078ui_story then
				local var_348_14 = 0.5

				arg_345_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_345_1.var_.characterEffect2078ui_story.fillRatio = var_348_14
			end

			local var_348_15 = arg_345_1.actors_["1015ui_story"].transform
			local var_348_16 = 0

			if var_348_16 < arg_345_1.time_ and arg_345_1.time_ <= var_348_16 + arg_348_0 then
				arg_345_1.var_.moveOldPos1015ui_story = var_348_15.localPosition
			end

			local var_348_17 = 0.001

			if var_348_16 <= arg_345_1.time_ and arg_345_1.time_ < var_348_16 + var_348_17 then
				local var_348_18 = (arg_345_1.time_ - var_348_16) / var_348_17
				local var_348_19 = Vector3.New(0.7, -1.15, -6.2)

				var_348_15.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1015ui_story, var_348_19, var_348_18)

				local var_348_20 = manager.ui.mainCamera.transform.position - var_348_15.position

				var_348_15.forward = Vector3.New(var_348_20.x, var_348_20.y, var_348_20.z)

				local var_348_21 = var_348_15.localEulerAngles

				var_348_21.z = 0
				var_348_21.x = 0
				var_348_15.localEulerAngles = var_348_21
			end

			if arg_345_1.time_ >= var_348_16 + var_348_17 and arg_345_1.time_ < var_348_16 + var_348_17 + arg_348_0 then
				var_348_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_348_22 = manager.ui.mainCamera.transform.position - var_348_15.position

				var_348_15.forward = Vector3.New(var_348_22.x, var_348_22.y, var_348_22.z)

				local var_348_23 = var_348_15.localEulerAngles

				var_348_23.z = 0
				var_348_23.x = 0
				var_348_15.localEulerAngles = var_348_23
			end

			local var_348_24 = arg_345_1.actors_["1015ui_story"]
			local var_348_25 = 0

			if var_348_25 < arg_345_1.time_ and arg_345_1.time_ <= var_348_25 + arg_348_0 and arg_345_1.var_.characterEffect1015ui_story == nil then
				arg_345_1.var_.characterEffect1015ui_story = var_348_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_26 = 0.200000002980232

			if var_348_25 <= arg_345_1.time_ and arg_345_1.time_ < var_348_25 + var_348_26 then
				local var_348_27 = (arg_345_1.time_ - var_348_25) / var_348_26

				if arg_345_1.var_.characterEffect1015ui_story then
					arg_345_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_345_1.time_ >= var_348_25 + var_348_26 and arg_345_1.time_ < var_348_25 + var_348_26 + arg_348_0 and arg_345_1.var_.characterEffect1015ui_story then
				arg_345_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_348_28 = 0

			if var_348_28 < arg_345_1.time_ and arg_345_1.time_ <= var_348_28 + arg_348_0 then
				arg_345_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action5_2")
			end

			local var_348_29 = 0

			if var_348_29 < arg_345_1.time_ and arg_345_1.time_ <= var_348_29 + arg_348_0 then
				arg_345_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_348_30 = 0
			local var_348_31 = 0.325

			if var_348_30 < arg_345_1.time_ and arg_345_1.time_ <= var_348_30 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_32 = arg_345_1:FormatText(StoryNameCfg[479].name)

				arg_345_1.leftNameTxt_.text = var_348_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_33 = arg_345_1:GetWordFromCfg(317012083)
				local var_348_34 = arg_345_1:FormatText(var_348_33.content)

				arg_345_1.text_.text = var_348_34

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_35 = 13
				local var_348_36 = utf8.len(var_348_34)
				local var_348_37 = var_348_35 <= 0 and var_348_31 or var_348_31 * (var_348_36 / var_348_35)

				if var_348_37 > 0 and var_348_31 < var_348_37 then
					arg_345_1.talkMaxDuration = var_348_37

					if var_348_37 + var_348_30 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_37 + var_348_30
					end
				end

				arg_345_1.text_.text = var_348_34
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012083", "story_v_out_317012.awb") ~= 0 then
					local var_348_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012083", "story_v_out_317012.awb") / 1000

					if var_348_38 + var_348_30 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_38 + var_348_30
					end

					if var_348_33.prefab_name ~= "" and arg_345_1.actors_[var_348_33.prefab_name] ~= nil then
						local var_348_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_33.prefab_name].transform, "story_v_out_317012", "317012083", "story_v_out_317012.awb")

						arg_345_1:RecordAudio("317012083", var_348_39)
						arg_345_1:RecordAudio("317012083", var_348_39)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_317012", "317012083", "story_v_out_317012.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_317012", "317012083", "story_v_out_317012.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_40 = math.max(var_348_31, arg_345_1.talkMaxDuration)

			if var_348_30 <= arg_345_1.time_ and arg_345_1.time_ < var_348_30 + var_348_40 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_30) / var_348_40

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_30 + var_348_40 and arg_345_1.time_ < var_348_30 + var_348_40 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play317012084 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 317012084
		arg_349_1.duration_ = 2.866

		local var_349_0 = {
			zh = 2.866,
			ja = 2
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
				arg_349_0:Play317012085(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["2078ui_story"].transform
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos2078ui_story = var_352_0.localPosition
			end

			local var_352_2 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2
				local var_352_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos2078ui_story, var_352_4, var_352_3)

				local var_352_5 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_5.x, var_352_5.y, var_352_5.z)

				local var_352_6 = var_352_0.localEulerAngles

				var_352_6.z = 0
				var_352_6.x = 0
				var_352_0.localEulerAngles = var_352_6
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_352_7 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_7.x, var_352_7.y, var_352_7.z)

				local var_352_8 = var_352_0.localEulerAngles

				var_352_8.z = 0
				var_352_8.x = 0
				var_352_0.localEulerAngles = var_352_8
			end

			local var_352_9 = arg_349_1.actors_["2078ui_story"]
			local var_352_10 = 0

			if var_352_10 < arg_349_1.time_ and arg_349_1.time_ <= var_352_10 + arg_352_0 and arg_349_1.var_.characterEffect2078ui_story == nil then
				arg_349_1.var_.characterEffect2078ui_story = var_352_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_11 = 0.200000002980232

			if var_352_10 <= arg_349_1.time_ and arg_349_1.time_ < var_352_10 + var_352_11 then
				local var_352_12 = (arg_349_1.time_ - var_352_10) / var_352_11

				if arg_349_1.var_.characterEffect2078ui_story then
					arg_349_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_10 + var_352_11 and arg_349_1.time_ < var_352_10 + var_352_11 + arg_352_0 and arg_349_1.var_.characterEffect2078ui_story then
				arg_349_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_352_13 = 0

			if var_352_13 < arg_349_1.time_ and arg_349_1.time_ <= var_352_13 + arg_352_0 then
				arg_349_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_352_14 = 0

			if var_352_14 < arg_349_1.time_ and arg_349_1.time_ <= var_352_14 + arg_352_0 then
				arg_349_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_352_15 = arg_349_1.actors_["1015ui_story"].transform
			local var_352_16 = 0

			if var_352_16 < arg_349_1.time_ and arg_349_1.time_ <= var_352_16 + arg_352_0 then
				arg_349_1.var_.moveOldPos1015ui_story = var_352_15.localPosition
			end

			local var_352_17 = 0.001

			if var_352_16 <= arg_349_1.time_ and arg_349_1.time_ < var_352_16 + var_352_17 then
				local var_352_18 = (arg_349_1.time_ - var_352_16) / var_352_17
				local var_352_19 = Vector3.New(0.7, -1.15, -6.2)

				var_352_15.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1015ui_story, var_352_19, var_352_18)

				local var_352_20 = manager.ui.mainCamera.transform.position - var_352_15.position

				var_352_15.forward = Vector3.New(var_352_20.x, var_352_20.y, var_352_20.z)

				local var_352_21 = var_352_15.localEulerAngles

				var_352_21.z = 0
				var_352_21.x = 0
				var_352_15.localEulerAngles = var_352_21
			end

			if arg_349_1.time_ >= var_352_16 + var_352_17 and arg_349_1.time_ < var_352_16 + var_352_17 + arg_352_0 then
				var_352_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_352_22 = manager.ui.mainCamera.transform.position - var_352_15.position

				var_352_15.forward = Vector3.New(var_352_22.x, var_352_22.y, var_352_22.z)

				local var_352_23 = var_352_15.localEulerAngles

				var_352_23.z = 0
				var_352_23.x = 0
				var_352_15.localEulerAngles = var_352_23
			end

			local var_352_24 = arg_349_1.actors_["1015ui_story"]
			local var_352_25 = 0

			if var_352_25 < arg_349_1.time_ and arg_349_1.time_ <= var_352_25 + arg_352_0 and arg_349_1.var_.characterEffect1015ui_story == nil then
				arg_349_1.var_.characterEffect1015ui_story = var_352_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_26 = 0.200000002980232

			if var_352_25 <= arg_349_1.time_ and arg_349_1.time_ < var_352_25 + var_352_26 then
				local var_352_27 = (arg_349_1.time_ - var_352_25) / var_352_26

				if arg_349_1.var_.characterEffect1015ui_story then
					local var_352_28 = Mathf.Lerp(0, 0.5, var_352_27)

					arg_349_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_349_1.var_.characterEffect1015ui_story.fillRatio = var_352_28
				end
			end

			if arg_349_1.time_ >= var_352_25 + var_352_26 and arg_349_1.time_ < var_352_25 + var_352_26 + arg_352_0 and arg_349_1.var_.characterEffect1015ui_story then
				local var_352_29 = 0.5

				arg_349_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_349_1.var_.characterEffect1015ui_story.fillRatio = var_352_29
			end

			local var_352_30 = 0
			local var_352_31 = 0.3

			if var_352_30 < arg_349_1.time_ and arg_349_1.time_ <= var_352_30 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_32 = arg_349_1:FormatText(StoryNameCfg[528].name)

				arg_349_1.leftNameTxt_.text = var_352_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_33 = arg_349_1:GetWordFromCfg(317012084)
				local var_352_34 = arg_349_1:FormatText(var_352_33.content)

				arg_349_1.text_.text = var_352_34

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_35 = 12
				local var_352_36 = utf8.len(var_352_34)
				local var_352_37 = var_352_35 <= 0 and var_352_31 or var_352_31 * (var_352_36 / var_352_35)

				if var_352_37 > 0 and var_352_31 < var_352_37 then
					arg_349_1.talkMaxDuration = var_352_37

					if var_352_37 + var_352_30 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_37 + var_352_30
					end
				end

				arg_349_1.text_.text = var_352_34
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012084", "story_v_out_317012.awb") ~= 0 then
					local var_352_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012084", "story_v_out_317012.awb") / 1000

					if var_352_38 + var_352_30 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_38 + var_352_30
					end

					if var_352_33.prefab_name ~= "" and arg_349_1.actors_[var_352_33.prefab_name] ~= nil then
						local var_352_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_33.prefab_name].transform, "story_v_out_317012", "317012084", "story_v_out_317012.awb")

						arg_349_1:RecordAudio("317012084", var_352_39)
						arg_349_1:RecordAudio("317012084", var_352_39)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_317012", "317012084", "story_v_out_317012.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_317012", "317012084", "story_v_out_317012.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_40 = math.max(var_352_31, arg_349_1.talkMaxDuration)

			if var_352_30 <= arg_349_1.time_ and arg_349_1.time_ < var_352_30 + var_352_40 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_30) / var_352_40

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_30 + var_352_40 and arg_349_1.time_ < var_352_30 + var_352_40 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play317012085 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 317012085
		arg_353_1.duration_ = 12.7

		local var_353_0 = {
			zh = 12.266,
			ja = 12.7
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
				arg_353_0:Play317012086(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["2078ui_story"].transform
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.var_.moveOldPos2078ui_story = var_356_0.localPosition
			end

			local var_356_2 = 0.001

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2
				local var_356_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_356_0.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos2078ui_story, var_356_4, var_356_3)

				local var_356_5 = manager.ui.mainCamera.transform.position - var_356_0.position

				var_356_0.forward = Vector3.New(var_356_5.x, var_356_5.y, var_356_5.z)

				local var_356_6 = var_356_0.localEulerAngles

				var_356_6.z = 0
				var_356_6.x = 0
				var_356_0.localEulerAngles = var_356_6
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 then
				var_356_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_356_7 = manager.ui.mainCamera.transform.position - var_356_0.position

				var_356_0.forward = Vector3.New(var_356_7.x, var_356_7.y, var_356_7.z)

				local var_356_8 = var_356_0.localEulerAngles

				var_356_8.z = 0
				var_356_8.x = 0
				var_356_0.localEulerAngles = var_356_8
			end

			local var_356_9 = arg_353_1.actors_["2078ui_story"]
			local var_356_10 = 0

			if var_356_10 < arg_353_1.time_ and arg_353_1.time_ <= var_356_10 + arg_356_0 and arg_353_1.var_.characterEffect2078ui_story == nil then
				arg_353_1.var_.characterEffect2078ui_story = var_356_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_11 = 0.200000002980232

			if var_356_10 <= arg_353_1.time_ and arg_353_1.time_ < var_356_10 + var_356_11 then
				local var_356_12 = (arg_353_1.time_ - var_356_10) / var_356_11

				if arg_353_1.var_.characterEffect2078ui_story then
					local var_356_13 = Mathf.Lerp(0, 0.5, var_356_12)

					arg_353_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_353_1.var_.characterEffect2078ui_story.fillRatio = var_356_13
				end
			end

			if arg_353_1.time_ >= var_356_10 + var_356_11 and arg_353_1.time_ < var_356_10 + var_356_11 + arg_356_0 and arg_353_1.var_.characterEffect2078ui_story then
				local var_356_14 = 0.5

				arg_353_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_353_1.var_.characterEffect2078ui_story.fillRatio = var_356_14
			end

			local var_356_15 = arg_353_1.actors_["1015ui_story"].transform
			local var_356_16 = 0

			if var_356_16 < arg_353_1.time_ and arg_353_1.time_ <= var_356_16 + arg_356_0 then
				arg_353_1.var_.moveOldPos1015ui_story = var_356_15.localPosition
			end

			local var_356_17 = 0.001

			if var_356_16 <= arg_353_1.time_ and arg_353_1.time_ < var_356_16 + var_356_17 then
				local var_356_18 = (arg_353_1.time_ - var_356_16) / var_356_17
				local var_356_19 = Vector3.New(0.7, -1.15, -6.2)

				var_356_15.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos1015ui_story, var_356_19, var_356_18)

				local var_356_20 = manager.ui.mainCamera.transform.position - var_356_15.position

				var_356_15.forward = Vector3.New(var_356_20.x, var_356_20.y, var_356_20.z)

				local var_356_21 = var_356_15.localEulerAngles

				var_356_21.z = 0
				var_356_21.x = 0
				var_356_15.localEulerAngles = var_356_21
			end

			if arg_353_1.time_ >= var_356_16 + var_356_17 and arg_353_1.time_ < var_356_16 + var_356_17 + arg_356_0 then
				var_356_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_356_22 = manager.ui.mainCamera.transform.position - var_356_15.position

				var_356_15.forward = Vector3.New(var_356_22.x, var_356_22.y, var_356_22.z)

				local var_356_23 = var_356_15.localEulerAngles

				var_356_23.z = 0
				var_356_23.x = 0
				var_356_15.localEulerAngles = var_356_23
			end

			local var_356_24 = arg_353_1.actors_["1015ui_story"]
			local var_356_25 = 0

			if var_356_25 < arg_353_1.time_ and arg_353_1.time_ <= var_356_25 + arg_356_0 and arg_353_1.var_.characterEffect1015ui_story == nil then
				arg_353_1.var_.characterEffect1015ui_story = var_356_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_26 = 0.200000002980232

			if var_356_25 <= arg_353_1.time_ and arg_353_1.time_ < var_356_25 + var_356_26 then
				local var_356_27 = (arg_353_1.time_ - var_356_25) / var_356_26

				if arg_353_1.var_.characterEffect1015ui_story then
					arg_353_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_353_1.time_ >= var_356_25 + var_356_26 and arg_353_1.time_ < var_356_25 + var_356_26 + arg_356_0 and arg_353_1.var_.characterEffect1015ui_story then
				arg_353_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_356_28 = 0

			if var_356_28 < arg_353_1.time_ and arg_353_1.time_ <= var_356_28 + arg_356_0 then
				arg_353_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_356_29 = 0

			if var_356_29 < arg_353_1.time_ and arg_353_1.time_ <= var_356_29 + arg_356_0 then
				arg_353_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_356_30 = 0
			local var_356_31 = 1.1

			if var_356_30 < arg_353_1.time_ and arg_353_1.time_ <= var_356_30 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_32 = arg_353_1:FormatText(StoryNameCfg[479].name)

				arg_353_1.leftNameTxt_.text = var_356_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_33 = arg_353_1:GetWordFromCfg(317012085)
				local var_356_34 = arg_353_1:FormatText(var_356_33.content)

				arg_353_1.text_.text = var_356_34

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_35 = 44
				local var_356_36 = utf8.len(var_356_34)
				local var_356_37 = var_356_35 <= 0 and var_356_31 or var_356_31 * (var_356_36 / var_356_35)

				if var_356_37 > 0 and var_356_31 < var_356_37 then
					arg_353_1.talkMaxDuration = var_356_37

					if var_356_37 + var_356_30 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_37 + var_356_30
					end
				end

				arg_353_1.text_.text = var_356_34
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012085", "story_v_out_317012.awb") ~= 0 then
					local var_356_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012085", "story_v_out_317012.awb") / 1000

					if var_356_38 + var_356_30 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_38 + var_356_30
					end

					if var_356_33.prefab_name ~= "" and arg_353_1.actors_[var_356_33.prefab_name] ~= nil then
						local var_356_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_33.prefab_name].transform, "story_v_out_317012", "317012085", "story_v_out_317012.awb")

						arg_353_1:RecordAudio("317012085", var_356_39)
						arg_353_1:RecordAudio("317012085", var_356_39)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_317012", "317012085", "story_v_out_317012.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_317012", "317012085", "story_v_out_317012.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_40 = math.max(var_356_31, arg_353_1.talkMaxDuration)

			if var_356_30 <= arg_353_1.time_ and arg_353_1.time_ < var_356_30 + var_356_40 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_30) / var_356_40

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_30 + var_356_40 and arg_353_1.time_ < var_356_30 + var_356_40 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play317012086 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 317012086
		arg_357_1.duration_ = 2.066

		local var_357_0 = {
			zh = 1.999999999999,
			ja = 2.066
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
				arg_357_0:Play317012087(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["2078ui_story"].transform
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				arg_357_1.var_.moveOldPos2078ui_story = var_360_0.localPosition
			end

			local var_360_2 = 0.001

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2
				local var_360_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_360_0.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos2078ui_story, var_360_4, var_360_3)

				local var_360_5 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_5.x, var_360_5.y, var_360_5.z)

				local var_360_6 = var_360_0.localEulerAngles

				var_360_6.z = 0
				var_360_6.x = 0
				var_360_0.localEulerAngles = var_360_6
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 then
				var_360_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_360_7 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_7.x, var_360_7.y, var_360_7.z)

				local var_360_8 = var_360_0.localEulerAngles

				var_360_8.z = 0
				var_360_8.x = 0
				var_360_0.localEulerAngles = var_360_8
			end

			local var_360_9 = arg_357_1.actors_["2078ui_story"]
			local var_360_10 = 0

			if var_360_10 < arg_357_1.time_ and arg_357_1.time_ <= var_360_10 + arg_360_0 and arg_357_1.var_.characterEffect2078ui_story == nil then
				arg_357_1.var_.characterEffect2078ui_story = var_360_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_11 = 0.200000002980232

			if var_360_10 <= arg_357_1.time_ and arg_357_1.time_ < var_360_10 + var_360_11 then
				local var_360_12 = (arg_357_1.time_ - var_360_10) / var_360_11

				if arg_357_1.var_.characterEffect2078ui_story then
					arg_357_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_10 + var_360_11 and arg_357_1.time_ < var_360_10 + var_360_11 + arg_360_0 and arg_357_1.var_.characterEffect2078ui_story then
				arg_357_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_360_13 = 0

			if var_360_13 < arg_357_1.time_ and arg_357_1.time_ <= var_360_13 + arg_360_0 then
				arg_357_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_360_14 = 0

			if var_360_14 < arg_357_1.time_ and arg_357_1.time_ <= var_360_14 + arg_360_0 then
				arg_357_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_360_15 = arg_357_1.actors_["1015ui_story"].transform
			local var_360_16 = 0

			if var_360_16 < arg_357_1.time_ and arg_357_1.time_ <= var_360_16 + arg_360_0 then
				arg_357_1.var_.moveOldPos1015ui_story = var_360_15.localPosition
			end

			local var_360_17 = 0.001

			if var_360_16 <= arg_357_1.time_ and arg_357_1.time_ < var_360_16 + var_360_17 then
				local var_360_18 = (arg_357_1.time_ - var_360_16) / var_360_17
				local var_360_19 = Vector3.New(0, 100, 0)

				var_360_15.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos1015ui_story, var_360_19, var_360_18)

				local var_360_20 = manager.ui.mainCamera.transform.position - var_360_15.position

				var_360_15.forward = Vector3.New(var_360_20.x, var_360_20.y, var_360_20.z)

				local var_360_21 = var_360_15.localEulerAngles

				var_360_21.z = 0
				var_360_21.x = 0
				var_360_15.localEulerAngles = var_360_21
			end

			if arg_357_1.time_ >= var_360_16 + var_360_17 and arg_357_1.time_ < var_360_16 + var_360_17 + arg_360_0 then
				var_360_15.localPosition = Vector3.New(0, 100, 0)

				local var_360_22 = manager.ui.mainCamera.transform.position - var_360_15.position

				var_360_15.forward = Vector3.New(var_360_22.x, var_360_22.y, var_360_22.z)

				local var_360_23 = var_360_15.localEulerAngles

				var_360_23.z = 0
				var_360_23.x = 0
				var_360_15.localEulerAngles = var_360_23
			end

			local var_360_24 = arg_357_1.actors_["1015ui_story"]
			local var_360_25 = 0

			if var_360_25 < arg_357_1.time_ and arg_357_1.time_ <= var_360_25 + arg_360_0 and arg_357_1.var_.characterEffect1015ui_story == nil then
				arg_357_1.var_.characterEffect1015ui_story = var_360_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_26 = 0.200000002980232

			if var_360_25 <= arg_357_1.time_ and arg_357_1.time_ < var_360_25 + var_360_26 then
				local var_360_27 = (arg_357_1.time_ - var_360_25) / var_360_26

				if arg_357_1.var_.characterEffect1015ui_story then
					local var_360_28 = Mathf.Lerp(0, 0.5, var_360_27)

					arg_357_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_357_1.var_.characterEffect1015ui_story.fillRatio = var_360_28
				end
			end

			if arg_357_1.time_ >= var_360_25 + var_360_26 and arg_357_1.time_ < var_360_25 + var_360_26 + arg_360_0 and arg_357_1.var_.characterEffect1015ui_story then
				local var_360_29 = 0.5

				arg_357_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_357_1.var_.characterEffect1015ui_story.fillRatio = var_360_29
			end

			local var_360_30 = arg_357_1.actors_["2079ui_story"].transform
			local var_360_31 = 0

			if var_360_31 < arg_357_1.time_ and arg_357_1.time_ <= var_360_31 + arg_360_0 then
				arg_357_1.var_.moveOldPos2079ui_story = var_360_30.localPosition
			end

			local var_360_32 = 0.001

			if var_360_31 <= arg_357_1.time_ and arg_357_1.time_ < var_360_31 + var_360_32 then
				local var_360_33 = (arg_357_1.time_ - var_360_31) / var_360_32
				local var_360_34 = Vector3.New(0.7, -1.28, -5.6)

				var_360_30.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos2079ui_story, var_360_34, var_360_33)

				local var_360_35 = manager.ui.mainCamera.transform.position - var_360_30.position

				var_360_30.forward = Vector3.New(var_360_35.x, var_360_35.y, var_360_35.z)

				local var_360_36 = var_360_30.localEulerAngles

				var_360_36.z = 0
				var_360_36.x = 0
				var_360_30.localEulerAngles = var_360_36
			end

			if arg_357_1.time_ >= var_360_31 + var_360_32 and arg_357_1.time_ < var_360_31 + var_360_32 + arg_360_0 then
				var_360_30.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_360_37 = manager.ui.mainCamera.transform.position - var_360_30.position

				var_360_30.forward = Vector3.New(var_360_37.x, var_360_37.y, var_360_37.z)

				local var_360_38 = var_360_30.localEulerAngles

				var_360_38.z = 0
				var_360_38.x = 0
				var_360_30.localEulerAngles = var_360_38
			end

			local var_360_39 = 0
			local var_360_40 = 0.075

			if var_360_39 < arg_357_1.time_ and arg_357_1.time_ <= var_360_39 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_41 = arg_357_1:FormatText(StoryNameCfg[528].name)

				arg_357_1.leftNameTxt_.text = var_360_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_42 = arg_357_1:GetWordFromCfg(317012086)
				local var_360_43 = arg_357_1:FormatText(var_360_42.content)

				arg_357_1.text_.text = var_360_43

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_44 = 3
				local var_360_45 = utf8.len(var_360_43)
				local var_360_46 = var_360_44 <= 0 and var_360_40 or var_360_40 * (var_360_45 / var_360_44)

				if var_360_46 > 0 and var_360_40 < var_360_46 then
					arg_357_1.talkMaxDuration = var_360_46

					if var_360_46 + var_360_39 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_46 + var_360_39
					end
				end

				arg_357_1.text_.text = var_360_43
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012086", "story_v_out_317012.awb") ~= 0 then
					local var_360_47 = manager.audio:GetVoiceLength("story_v_out_317012", "317012086", "story_v_out_317012.awb") / 1000

					if var_360_47 + var_360_39 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_47 + var_360_39
					end

					if var_360_42.prefab_name ~= "" and arg_357_1.actors_[var_360_42.prefab_name] ~= nil then
						local var_360_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_42.prefab_name].transform, "story_v_out_317012", "317012086", "story_v_out_317012.awb")

						arg_357_1:RecordAudio("317012086", var_360_48)
						arg_357_1:RecordAudio("317012086", var_360_48)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_317012", "317012086", "story_v_out_317012.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_317012", "317012086", "story_v_out_317012.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_49 = math.max(var_360_40, arg_357_1.talkMaxDuration)

			if var_360_39 <= arg_357_1.time_ and arg_357_1.time_ < var_360_39 + var_360_49 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_39) / var_360_49

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_39 + var_360_49 and arg_357_1.time_ < var_360_39 + var_360_49 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play317012087 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 317012087
		arg_361_1.duration_ = 2.3

		local var_361_0 = {
			zh = 2.3,
			ja = 1.999999999999
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
				arg_361_0:Play317012088(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["2079ui_story"].transform
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1.var_.moveOldPos2079ui_story = var_364_0.localPosition
			end

			local var_364_2 = 0.001

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2
				local var_364_4 = Vector3.New(0.7, -1.28, -5.6)

				var_364_0.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos2079ui_story, var_364_4, var_364_3)

				local var_364_5 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_5.x, var_364_5.y, var_364_5.z)

				local var_364_6 = var_364_0.localEulerAngles

				var_364_6.z = 0
				var_364_6.x = 0
				var_364_0.localEulerAngles = var_364_6
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 then
				var_364_0.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_364_7 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_7.x, var_364_7.y, var_364_7.z)

				local var_364_8 = var_364_0.localEulerAngles

				var_364_8.z = 0
				var_364_8.x = 0
				var_364_0.localEulerAngles = var_364_8
			end

			local var_364_9 = arg_361_1.actors_["2079ui_story"]
			local var_364_10 = 0

			if var_364_10 < arg_361_1.time_ and arg_361_1.time_ <= var_364_10 + arg_364_0 and arg_361_1.var_.characterEffect2079ui_story == nil then
				arg_361_1.var_.characterEffect2079ui_story = var_364_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_11 = 0.200000002980232

			if var_364_10 <= arg_361_1.time_ and arg_361_1.time_ < var_364_10 + var_364_11 then
				local var_364_12 = (arg_361_1.time_ - var_364_10) / var_364_11

				if arg_361_1.var_.characterEffect2079ui_story then
					arg_361_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_361_1.time_ >= var_364_10 + var_364_11 and arg_361_1.time_ < var_364_10 + var_364_11 + arg_364_0 and arg_361_1.var_.characterEffect2079ui_story then
				arg_361_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_364_13 = 0

			if var_364_13 < arg_361_1.time_ and arg_361_1.time_ <= var_364_13 + arg_364_0 then
				arg_361_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_364_14 = 0

			if var_364_14 < arg_361_1.time_ and arg_361_1.time_ <= var_364_14 + arg_364_0 then
				arg_361_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_364_15 = arg_361_1.actors_["2078ui_story"].transform
			local var_364_16 = 0

			if var_364_16 < arg_361_1.time_ and arg_361_1.time_ <= var_364_16 + arg_364_0 then
				arg_361_1.var_.moveOldPos2078ui_story = var_364_15.localPosition
			end

			local var_364_17 = 0.001

			if var_364_16 <= arg_361_1.time_ and arg_361_1.time_ < var_364_16 + var_364_17 then
				local var_364_18 = (arg_361_1.time_ - var_364_16) / var_364_17
				local var_364_19 = Vector3.New(-0.7, -1.28, -5.6)

				var_364_15.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos2078ui_story, var_364_19, var_364_18)

				local var_364_20 = manager.ui.mainCamera.transform.position - var_364_15.position

				var_364_15.forward = Vector3.New(var_364_20.x, var_364_20.y, var_364_20.z)

				local var_364_21 = var_364_15.localEulerAngles

				var_364_21.z = 0
				var_364_21.x = 0
				var_364_15.localEulerAngles = var_364_21
			end

			if arg_361_1.time_ >= var_364_16 + var_364_17 and arg_361_1.time_ < var_364_16 + var_364_17 + arg_364_0 then
				var_364_15.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_364_22 = manager.ui.mainCamera.transform.position - var_364_15.position

				var_364_15.forward = Vector3.New(var_364_22.x, var_364_22.y, var_364_22.z)

				local var_364_23 = var_364_15.localEulerAngles

				var_364_23.z = 0
				var_364_23.x = 0
				var_364_15.localEulerAngles = var_364_23
			end

			local var_364_24 = arg_361_1.actors_["2078ui_story"]
			local var_364_25 = 0

			if var_364_25 < arg_361_1.time_ and arg_361_1.time_ <= var_364_25 + arg_364_0 and arg_361_1.var_.characterEffect2078ui_story == nil then
				arg_361_1.var_.characterEffect2078ui_story = var_364_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_26 = 0.200000002980232

			if var_364_25 <= arg_361_1.time_ and arg_361_1.time_ < var_364_25 + var_364_26 then
				local var_364_27 = (arg_361_1.time_ - var_364_25) / var_364_26

				if arg_361_1.var_.characterEffect2078ui_story then
					local var_364_28 = Mathf.Lerp(0, 0.5, var_364_27)

					arg_361_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_361_1.var_.characterEffect2078ui_story.fillRatio = var_364_28
				end
			end

			if arg_361_1.time_ >= var_364_25 + var_364_26 and arg_361_1.time_ < var_364_25 + var_364_26 + arg_364_0 and arg_361_1.var_.characterEffect2078ui_story then
				local var_364_29 = 0.5

				arg_361_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_361_1.var_.characterEffect2078ui_story.fillRatio = var_364_29
			end

			local var_364_30 = 0
			local var_364_31 = 0.075

			if var_364_30 < arg_361_1.time_ and arg_361_1.time_ <= var_364_30 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_32 = arg_361_1:FormatText(StoryNameCfg[529].name)

				arg_361_1.leftNameTxt_.text = var_364_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_33 = arg_361_1:GetWordFromCfg(317012087)
				local var_364_34 = arg_361_1:FormatText(var_364_33.content)

				arg_361_1.text_.text = var_364_34

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_35 = 3
				local var_364_36 = utf8.len(var_364_34)
				local var_364_37 = var_364_35 <= 0 and var_364_31 or var_364_31 * (var_364_36 / var_364_35)

				if var_364_37 > 0 and var_364_31 < var_364_37 then
					arg_361_1.talkMaxDuration = var_364_37

					if var_364_37 + var_364_30 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_37 + var_364_30
					end
				end

				arg_361_1.text_.text = var_364_34
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012087", "story_v_out_317012.awb") ~= 0 then
					local var_364_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012087", "story_v_out_317012.awb") / 1000

					if var_364_38 + var_364_30 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_38 + var_364_30
					end

					if var_364_33.prefab_name ~= "" and arg_361_1.actors_[var_364_33.prefab_name] ~= nil then
						local var_364_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_33.prefab_name].transform, "story_v_out_317012", "317012087", "story_v_out_317012.awb")

						arg_361_1:RecordAudio("317012087", var_364_39)
						arg_361_1:RecordAudio("317012087", var_364_39)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_317012", "317012087", "story_v_out_317012.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_317012", "317012087", "story_v_out_317012.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_40 = math.max(var_364_31, arg_361_1.talkMaxDuration)

			if var_364_30 <= arg_361_1.time_ and arg_361_1.time_ < var_364_30 + var_364_40 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_30) / var_364_40

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_30 + var_364_40 and arg_361_1.time_ < var_364_30 + var_364_40 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play317012088 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 317012088
		arg_365_1.duration_ = 1.6

		local var_365_0 = {
			zh = 1.4,
			ja = 1.6
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
				arg_365_0:Play317012089(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["2078ui_story"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos2078ui_story = var_368_0.localPosition
			end

			local var_368_2 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2
				local var_368_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos2078ui_story, var_368_4, var_368_3)

				local var_368_5 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_5.x, var_368_5.y, var_368_5.z)

				local var_368_6 = var_368_0.localEulerAngles

				var_368_6.z = 0
				var_368_6.x = 0
				var_368_0.localEulerAngles = var_368_6
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_368_7 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_7.x, var_368_7.y, var_368_7.z)

				local var_368_8 = var_368_0.localEulerAngles

				var_368_8.z = 0
				var_368_8.x = 0
				var_368_0.localEulerAngles = var_368_8
			end

			local var_368_9 = arg_365_1.actors_["2078ui_story"]
			local var_368_10 = 0

			if var_368_10 < arg_365_1.time_ and arg_365_1.time_ <= var_368_10 + arg_368_0 and arg_365_1.var_.characterEffect2078ui_story == nil then
				arg_365_1.var_.characterEffect2078ui_story = var_368_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_11 = 0.200000002980232

			if var_368_10 <= arg_365_1.time_ and arg_365_1.time_ < var_368_10 + var_368_11 then
				local var_368_12 = (arg_365_1.time_ - var_368_10) / var_368_11

				if arg_365_1.var_.characterEffect2078ui_story then
					arg_365_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_10 + var_368_11 and arg_365_1.time_ < var_368_10 + var_368_11 + arg_368_0 and arg_365_1.var_.characterEffect2078ui_story then
				arg_365_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_368_13 = 0

			if var_368_13 < arg_365_1.time_ and arg_365_1.time_ <= var_368_13 + arg_368_0 then
				arg_365_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_368_14 = 0

			if var_368_14 < arg_365_1.time_ and arg_365_1.time_ <= var_368_14 + arg_368_0 then
				arg_365_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_368_15 = arg_365_1.actors_["1015ui_story"].transform
			local var_368_16 = 0

			if var_368_16 < arg_365_1.time_ and arg_365_1.time_ <= var_368_16 + arg_368_0 then
				arg_365_1.var_.moveOldPos1015ui_story = var_368_15.localPosition
			end

			local var_368_17 = 0.001

			if var_368_16 <= arg_365_1.time_ and arg_365_1.time_ < var_368_16 + var_368_17 then
				local var_368_18 = (arg_365_1.time_ - var_368_16) / var_368_17
				local var_368_19 = Vector3.New(0.7, -1.15, -6.2)

				var_368_15.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1015ui_story, var_368_19, var_368_18)

				local var_368_20 = manager.ui.mainCamera.transform.position - var_368_15.position

				var_368_15.forward = Vector3.New(var_368_20.x, var_368_20.y, var_368_20.z)

				local var_368_21 = var_368_15.localEulerAngles

				var_368_21.z = 0
				var_368_21.x = 0
				var_368_15.localEulerAngles = var_368_21
			end

			if arg_365_1.time_ >= var_368_16 + var_368_17 and arg_365_1.time_ < var_368_16 + var_368_17 + arg_368_0 then
				var_368_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_368_22 = manager.ui.mainCamera.transform.position - var_368_15.position

				var_368_15.forward = Vector3.New(var_368_22.x, var_368_22.y, var_368_22.z)

				local var_368_23 = var_368_15.localEulerAngles

				var_368_23.z = 0
				var_368_23.x = 0
				var_368_15.localEulerAngles = var_368_23
			end

			local var_368_24 = arg_365_1.actors_["1015ui_story"]
			local var_368_25 = 0

			if var_368_25 < arg_365_1.time_ and arg_365_1.time_ <= var_368_25 + arg_368_0 and arg_365_1.var_.characterEffect1015ui_story == nil then
				arg_365_1.var_.characterEffect1015ui_story = var_368_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_26 = 0.200000002980232

			if var_368_25 <= arg_365_1.time_ and arg_365_1.time_ < var_368_25 + var_368_26 then
				local var_368_27 = (arg_365_1.time_ - var_368_25) / var_368_26

				if arg_365_1.var_.characterEffect1015ui_story then
					local var_368_28 = Mathf.Lerp(0, 0.5, var_368_27)

					arg_365_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_365_1.var_.characterEffect1015ui_story.fillRatio = var_368_28
				end
			end

			if arg_365_1.time_ >= var_368_25 + var_368_26 and arg_365_1.time_ < var_368_25 + var_368_26 + arg_368_0 and arg_365_1.var_.characterEffect1015ui_story then
				local var_368_29 = 0.5

				arg_365_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_365_1.var_.characterEffect1015ui_story.fillRatio = var_368_29
			end

			local var_368_30 = arg_365_1.actors_["2079ui_story"].transform
			local var_368_31 = 0

			if var_368_31 < arg_365_1.time_ and arg_365_1.time_ <= var_368_31 + arg_368_0 then
				arg_365_1.var_.moveOldPos2079ui_story = var_368_30.localPosition
			end

			local var_368_32 = 0.001

			if var_368_31 <= arg_365_1.time_ and arg_365_1.time_ < var_368_31 + var_368_32 then
				local var_368_33 = (arg_365_1.time_ - var_368_31) / var_368_32
				local var_368_34 = Vector3.New(0, 100, 0)

				var_368_30.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos2079ui_story, var_368_34, var_368_33)

				local var_368_35 = manager.ui.mainCamera.transform.position - var_368_30.position

				var_368_30.forward = Vector3.New(var_368_35.x, var_368_35.y, var_368_35.z)

				local var_368_36 = var_368_30.localEulerAngles

				var_368_36.z = 0
				var_368_36.x = 0
				var_368_30.localEulerAngles = var_368_36
			end

			if arg_365_1.time_ >= var_368_31 + var_368_32 and arg_365_1.time_ < var_368_31 + var_368_32 + arg_368_0 then
				var_368_30.localPosition = Vector3.New(0, 100, 0)

				local var_368_37 = manager.ui.mainCamera.transform.position - var_368_30.position

				var_368_30.forward = Vector3.New(var_368_37.x, var_368_37.y, var_368_37.z)

				local var_368_38 = var_368_30.localEulerAngles

				var_368_38.z = 0
				var_368_38.x = 0
				var_368_30.localEulerAngles = var_368_38
			end

			local var_368_39 = arg_365_1.actors_["2079ui_story"]
			local var_368_40 = 0

			if var_368_40 < arg_365_1.time_ and arg_365_1.time_ <= var_368_40 + arg_368_0 and arg_365_1.var_.characterEffect2079ui_story == nil then
				arg_365_1.var_.characterEffect2079ui_story = var_368_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_41 = 0.200000002980232

			if var_368_40 <= arg_365_1.time_ and arg_365_1.time_ < var_368_40 + var_368_41 then
				local var_368_42 = (arg_365_1.time_ - var_368_40) / var_368_41

				if arg_365_1.var_.characterEffect2079ui_story then
					local var_368_43 = Mathf.Lerp(0, 0.5, var_368_42)

					arg_365_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_365_1.var_.characterEffect2079ui_story.fillRatio = var_368_43
				end
			end

			if arg_365_1.time_ >= var_368_40 + var_368_41 and arg_365_1.time_ < var_368_40 + var_368_41 + arg_368_0 and arg_365_1.var_.characterEffect2079ui_story then
				local var_368_44 = 0.5

				arg_365_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_365_1.var_.characterEffect2079ui_story.fillRatio = var_368_44
			end

			local var_368_45 = 0
			local var_368_46 = 0.075

			if var_368_45 < arg_365_1.time_ and arg_365_1.time_ <= var_368_45 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_47 = arg_365_1:FormatText(StoryNameCfg[530].name)

				arg_365_1.leftNameTxt_.text = var_368_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_48 = arg_365_1:GetWordFromCfg(317012088)
				local var_368_49 = arg_365_1:FormatText(var_368_48.content)

				arg_365_1.text_.text = var_368_49

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_50 = 3
				local var_368_51 = utf8.len(var_368_49)
				local var_368_52 = var_368_50 <= 0 and var_368_46 or var_368_46 * (var_368_51 / var_368_50)

				if var_368_52 > 0 and var_368_46 < var_368_52 then
					arg_365_1.talkMaxDuration = var_368_52

					if var_368_52 + var_368_45 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_52 + var_368_45
					end
				end

				arg_365_1.text_.text = var_368_49
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012088", "story_v_out_317012.awb") ~= 0 then
					local var_368_53 = manager.audio:GetVoiceLength("story_v_out_317012", "317012088", "story_v_out_317012.awb") / 1000

					if var_368_53 + var_368_45 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_53 + var_368_45
					end

					if var_368_48.prefab_name ~= "" and arg_365_1.actors_[var_368_48.prefab_name] ~= nil then
						local var_368_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_48.prefab_name].transform, "story_v_out_317012", "317012088", "story_v_out_317012.awb")

						arg_365_1:RecordAudio("317012088", var_368_54)
						arg_365_1:RecordAudio("317012088", var_368_54)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_317012", "317012088", "story_v_out_317012.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_317012", "317012088", "story_v_out_317012.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_55 = math.max(var_368_46, arg_365_1.talkMaxDuration)

			if var_368_45 <= arg_365_1.time_ and arg_365_1.time_ < var_368_45 + var_368_55 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_45) / var_368_55

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_45 + var_368_55 and arg_365_1.time_ < var_368_45 + var_368_55 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play317012089 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 317012089
		arg_369_1.duration_ = 9.9

		local var_369_0 = {
			zh = 9.9,
			ja = 6
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
				arg_369_0:Play317012090(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_372_2 = arg_369_1.actors_["1015ui_story"]
			local var_372_3 = 0

			if var_372_3 < arg_369_1.time_ and arg_369_1.time_ <= var_372_3 + arg_372_0 and arg_369_1.var_.characterEffect1015ui_story == nil then
				arg_369_1.var_.characterEffect1015ui_story = var_372_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_4 = 0.200000002980232

			if var_372_3 <= arg_369_1.time_ and arg_369_1.time_ < var_372_3 + var_372_4 then
				local var_372_5 = (arg_369_1.time_ - var_372_3) / var_372_4

				if arg_369_1.var_.characterEffect1015ui_story then
					arg_369_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_369_1.time_ >= var_372_3 + var_372_4 and arg_369_1.time_ < var_372_3 + var_372_4 + arg_372_0 and arg_369_1.var_.characterEffect1015ui_story then
				arg_369_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_372_6 = arg_369_1.actors_["2078ui_story"]
			local var_372_7 = 0

			if var_372_7 < arg_369_1.time_ and arg_369_1.time_ <= var_372_7 + arg_372_0 and arg_369_1.var_.characterEffect2078ui_story == nil then
				arg_369_1.var_.characterEffect2078ui_story = var_372_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_8 = 0.200000002980232

			if var_372_7 <= arg_369_1.time_ and arg_369_1.time_ < var_372_7 + var_372_8 then
				local var_372_9 = (arg_369_1.time_ - var_372_7) / var_372_8

				if arg_369_1.var_.characterEffect2078ui_story then
					local var_372_10 = Mathf.Lerp(0, 0.5, var_372_9)

					arg_369_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_369_1.var_.characterEffect2078ui_story.fillRatio = var_372_10
				end
			end

			if arg_369_1.time_ >= var_372_7 + var_372_8 and arg_369_1.time_ < var_372_7 + var_372_8 + arg_372_0 and arg_369_1.var_.characterEffect2078ui_story then
				local var_372_11 = 0.5

				arg_369_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_369_1.var_.characterEffect2078ui_story.fillRatio = var_372_11
			end

			local var_372_12 = 0
			local var_372_13 = 1.175

			if var_372_12 < arg_369_1.time_ and arg_369_1.time_ <= var_372_12 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_14 = arg_369_1:FormatText(StoryNameCfg[479].name)

				arg_369_1.leftNameTxt_.text = var_372_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_15 = arg_369_1:GetWordFromCfg(317012089)
				local var_372_16 = arg_369_1:FormatText(var_372_15.content)

				arg_369_1.text_.text = var_372_16

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_17 = 47
				local var_372_18 = utf8.len(var_372_16)
				local var_372_19 = var_372_17 <= 0 and var_372_13 or var_372_13 * (var_372_18 / var_372_17)

				if var_372_19 > 0 and var_372_13 < var_372_19 then
					arg_369_1.talkMaxDuration = var_372_19

					if var_372_19 + var_372_12 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_19 + var_372_12
					end
				end

				arg_369_1.text_.text = var_372_16
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012089", "story_v_out_317012.awb") ~= 0 then
					local var_372_20 = manager.audio:GetVoiceLength("story_v_out_317012", "317012089", "story_v_out_317012.awb") / 1000

					if var_372_20 + var_372_12 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_20 + var_372_12
					end

					if var_372_15.prefab_name ~= "" and arg_369_1.actors_[var_372_15.prefab_name] ~= nil then
						local var_372_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_15.prefab_name].transform, "story_v_out_317012", "317012089", "story_v_out_317012.awb")

						arg_369_1:RecordAudio("317012089", var_372_21)
						arg_369_1:RecordAudio("317012089", var_372_21)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_317012", "317012089", "story_v_out_317012.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_317012", "317012089", "story_v_out_317012.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_22 = math.max(var_372_13, arg_369_1.talkMaxDuration)

			if var_372_12 <= arg_369_1.time_ and arg_369_1.time_ < var_372_12 + var_372_22 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_12) / var_372_22

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_12 + var_372_22 and arg_369_1.time_ < var_372_12 + var_372_22 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play317012090 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 317012090
		arg_373_1.duration_ = 6.9

		local var_373_0 = {
			zh = 5.466,
			ja = 6.9
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
				arg_373_0:Play317012091(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1015ui_story"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos1015ui_story = var_376_0.localPosition
			end

			local var_376_2 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2
				local var_376_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1015ui_story, var_376_4, var_376_3)

				local var_376_5 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_5.x, var_376_5.y, var_376_5.z)

				local var_376_6 = var_376_0.localEulerAngles

				var_376_6.z = 0
				var_376_6.x = 0
				var_376_0.localEulerAngles = var_376_6
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_376_7 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_7.x, var_376_7.y, var_376_7.z)

				local var_376_8 = var_376_0.localEulerAngles

				var_376_8.z = 0
				var_376_8.x = 0
				var_376_0.localEulerAngles = var_376_8
			end

			local var_376_9 = arg_373_1.actors_["1015ui_story"]
			local var_376_10 = 0

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 and arg_373_1.var_.characterEffect1015ui_story == nil then
				arg_373_1.var_.characterEffect1015ui_story = var_376_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_11 = 0.200000002980232

			if var_376_10 <= arg_373_1.time_ and arg_373_1.time_ < var_376_10 + var_376_11 then
				local var_376_12 = (arg_373_1.time_ - var_376_10) / var_376_11

				if arg_373_1.var_.characterEffect1015ui_story then
					local var_376_13 = Mathf.Lerp(0, 0.5, var_376_12)

					arg_373_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_373_1.var_.characterEffect1015ui_story.fillRatio = var_376_13
				end
			end

			if arg_373_1.time_ >= var_376_10 + var_376_11 and arg_373_1.time_ < var_376_10 + var_376_11 + arg_376_0 and arg_373_1.var_.characterEffect1015ui_story then
				local var_376_14 = 0.5

				arg_373_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_373_1.var_.characterEffect1015ui_story.fillRatio = var_376_14
			end

			local var_376_15 = arg_373_1.actors_["2079ui_story"].transform
			local var_376_16 = 0

			if var_376_16 < arg_373_1.time_ and arg_373_1.time_ <= var_376_16 + arg_376_0 then
				arg_373_1.var_.moveOldPos2079ui_story = var_376_15.localPosition
			end

			local var_376_17 = 0.001

			if var_376_16 <= arg_373_1.time_ and arg_373_1.time_ < var_376_16 + var_376_17 then
				local var_376_18 = (arg_373_1.time_ - var_376_16) / var_376_17
				local var_376_19 = Vector3.New(0.7, -1.28, -5.6)

				var_376_15.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos2079ui_story, var_376_19, var_376_18)

				local var_376_20 = manager.ui.mainCamera.transform.position - var_376_15.position

				var_376_15.forward = Vector3.New(var_376_20.x, var_376_20.y, var_376_20.z)

				local var_376_21 = var_376_15.localEulerAngles

				var_376_21.z = 0
				var_376_21.x = 0
				var_376_15.localEulerAngles = var_376_21
			end

			if arg_373_1.time_ >= var_376_16 + var_376_17 and arg_373_1.time_ < var_376_16 + var_376_17 + arg_376_0 then
				var_376_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_376_22 = manager.ui.mainCamera.transform.position - var_376_15.position

				var_376_15.forward = Vector3.New(var_376_22.x, var_376_22.y, var_376_22.z)

				local var_376_23 = var_376_15.localEulerAngles

				var_376_23.z = 0
				var_376_23.x = 0
				var_376_15.localEulerAngles = var_376_23
			end

			local var_376_24 = arg_373_1.actors_["2079ui_story"]
			local var_376_25 = 0

			if var_376_25 < arg_373_1.time_ and arg_373_1.time_ <= var_376_25 + arg_376_0 and arg_373_1.var_.characterEffect2079ui_story == nil then
				arg_373_1.var_.characterEffect2079ui_story = var_376_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_26 = 0.200000002980232

			if var_376_25 <= arg_373_1.time_ and arg_373_1.time_ < var_376_25 + var_376_26 then
				local var_376_27 = (arg_373_1.time_ - var_376_25) / var_376_26

				if arg_373_1.var_.characterEffect2079ui_story then
					arg_373_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_25 + var_376_26 and arg_373_1.time_ < var_376_25 + var_376_26 + arg_376_0 and arg_373_1.var_.characterEffect2079ui_story then
				arg_373_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_376_28 = 0

			if var_376_28 < arg_373_1.time_ and arg_373_1.time_ <= var_376_28 + arg_376_0 then
				arg_373_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_376_29 = 0

			if var_376_29 < arg_373_1.time_ and arg_373_1.time_ <= var_376_29 + arg_376_0 then
				arg_373_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_376_30 = arg_373_1.actors_["2078ui_story"].transform
			local var_376_31 = 0

			if var_376_31 < arg_373_1.time_ and arg_373_1.time_ <= var_376_31 + arg_376_0 then
				arg_373_1.var_.moveOldPos2078ui_story = var_376_30.localPosition
			end

			local var_376_32 = 0.001

			if var_376_31 <= arg_373_1.time_ and arg_373_1.time_ < var_376_31 + var_376_32 then
				local var_376_33 = (arg_373_1.time_ - var_376_31) / var_376_32
				local var_376_34 = Vector3.New(0, 100, 0)

				var_376_30.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos2078ui_story, var_376_34, var_376_33)

				local var_376_35 = manager.ui.mainCamera.transform.position - var_376_30.position

				var_376_30.forward = Vector3.New(var_376_35.x, var_376_35.y, var_376_35.z)

				local var_376_36 = var_376_30.localEulerAngles

				var_376_36.z = 0
				var_376_36.x = 0
				var_376_30.localEulerAngles = var_376_36
			end

			if arg_373_1.time_ >= var_376_31 + var_376_32 and arg_373_1.time_ < var_376_31 + var_376_32 + arg_376_0 then
				var_376_30.localPosition = Vector3.New(0, 100, 0)

				local var_376_37 = manager.ui.mainCamera.transform.position - var_376_30.position

				var_376_30.forward = Vector3.New(var_376_37.x, var_376_37.y, var_376_37.z)

				local var_376_38 = var_376_30.localEulerAngles

				var_376_38.z = 0
				var_376_38.x = 0
				var_376_30.localEulerAngles = var_376_38
			end

			local var_376_39 = 0
			local var_376_40 = 0.5

			if var_376_39 < arg_373_1.time_ and arg_373_1.time_ <= var_376_39 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_41 = arg_373_1:FormatText(StoryNameCfg[529].name)

				arg_373_1.leftNameTxt_.text = var_376_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_42 = arg_373_1:GetWordFromCfg(317012090)
				local var_376_43 = arg_373_1:FormatText(var_376_42.content)

				arg_373_1.text_.text = var_376_43

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_44 = 20
				local var_376_45 = utf8.len(var_376_43)
				local var_376_46 = var_376_44 <= 0 and var_376_40 or var_376_40 * (var_376_45 / var_376_44)

				if var_376_46 > 0 and var_376_40 < var_376_46 then
					arg_373_1.talkMaxDuration = var_376_46

					if var_376_46 + var_376_39 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_46 + var_376_39
					end
				end

				arg_373_1.text_.text = var_376_43
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012090", "story_v_out_317012.awb") ~= 0 then
					local var_376_47 = manager.audio:GetVoiceLength("story_v_out_317012", "317012090", "story_v_out_317012.awb") / 1000

					if var_376_47 + var_376_39 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_47 + var_376_39
					end

					if var_376_42.prefab_name ~= "" and arg_373_1.actors_[var_376_42.prefab_name] ~= nil then
						local var_376_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_42.prefab_name].transform, "story_v_out_317012", "317012090", "story_v_out_317012.awb")

						arg_373_1:RecordAudio("317012090", var_376_48)
						arg_373_1:RecordAudio("317012090", var_376_48)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_317012", "317012090", "story_v_out_317012.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_317012", "317012090", "story_v_out_317012.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_49 = math.max(var_376_40, arg_373_1.talkMaxDuration)

			if var_376_39 <= arg_373_1.time_ and arg_373_1.time_ < var_376_39 + var_376_49 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_39) / var_376_49

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_39 + var_376_49 and arg_373_1.time_ < var_376_39 + var_376_49 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play317012091 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 317012091
		arg_377_1.duration_ = 12.133

		local var_377_0 = {
			zh = 12.133,
			ja = 10.5
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
				arg_377_0:Play317012092(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["2078ui_story"].transform
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1.var_.moveOldPos2078ui_story = var_380_0.localPosition
			end

			local var_380_2 = 0.001

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2
				local var_380_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_380_0.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos2078ui_story, var_380_4, var_380_3)

				local var_380_5 = manager.ui.mainCamera.transform.position - var_380_0.position

				var_380_0.forward = Vector3.New(var_380_5.x, var_380_5.y, var_380_5.z)

				local var_380_6 = var_380_0.localEulerAngles

				var_380_6.z = 0
				var_380_6.x = 0
				var_380_0.localEulerAngles = var_380_6
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 then
				var_380_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_380_7 = manager.ui.mainCamera.transform.position - var_380_0.position

				var_380_0.forward = Vector3.New(var_380_7.x, var_380_7.y, var_380_7.z)

				local var_380_8 = var_380_0.localEulerAngles

				var_380_8.z = 0
				var_380_8.x = 0
				var_380_0.localEulerAngles = var_380_8
			end

			local var_380_9 = arg_377_1.actors_["2078ui_story"]
			local var_380_10 = 0

			if var_380_10 < arg_377_1.time_ and arg_377_1.time_ <= var_380_10 + arg_380_0 and arg_377_1.var_.characterEffect2078ui_story == nil then
				arg_377_1.var_.characterEffect2078ui_story = var_380_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_11 = 0.200000002980232

			if var_380_10 <= arg_377_1.time_ and arg_377_1.time_ < var_380_10 + var_380_11 then
				local var_380_12 = (arg_377_1.time_ - var_380_10) / var_380_11

				if arg_377_1.var_.characterEffect2078ui_story then
					arg_377_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_377_1.time_ >= var_380_10 + var_380_11 and arg_377_1.time_ < var_380_10 + var_380_11 + arg_380_0 and arg_377_1.var_.characterEffect2078ui_story then
				arg_377_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_380_13 = 0

			if var_380_13 < arg_377_1.time_ and arg_377_1.time_ <= var_380_13 + arg_380_0 then
				arg_377_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_380_14 = 0

			if var_380_14 < arg_377_1.time_ and arg_377_1.time_ <= var_380_14 + arg_380_0 then
				arg_377_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_380_15 = arg_377_1.actors_["1015ui_story"].transform
			local var_380_16 = 0

			if var_380_16 < arg_377_1.time_ and arg_377_1.time_ <= var_380_16 + arg_380_0 then
				arg_377_1.var_.moveOldPos1015ui_story = var_380_15.localPosition
			end

			local var_380_17 = 0.001

			if var_380_16 <= arg_377_1.time_ and arg_377_1.time_ < var_380_16 + var_380_17 then
				local var_380_18 = (arg_377_1.time_ - var_380_16) / var_380_17
				local var_380_19 = Vector3.New(0.7, -1.15, -6.2)

				var_380_15.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1015ui_story, var_380_19, var_380_18)

				local var_380_20 = manager.ui.mainCamera.transform.position - var_380_15.position

				var_380_15.forward = Vector3.New(var_380_20.x, var_380_20.y, var_380_20.z)

				local var_380_21 = var_380_15.localEulerAngles

				var_380_21.z = 0
				var_380_21.x = 0
				var_380_15.localEulerAngles = var_380_21
			end

			if arg_377_1.time_ >= var_380_16 + var_380_17 and arg_377_1.time_ < var_380_16 + var_380_17 + arg_380_0 then
				var_380_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_380_22 = manager.ui.mainCamera.transform.position - var_380_15.position

				var_380_15.forward = Vector3.New(var_380_22.x, var_380_22.y, var_380_22.z)

				local var_380_23 = var_380_15.localEulerAngles

				var_380_23.z = 0
				var_380_23.x = 0
				var_380_15.localEulerAngles = var_380_23
			end

			local var_380_24 = arg_377_1.actors_["1015ui_story"]
			local var_380_25 = 0

			if var_380_25 < arg_377_1.time_ and arg_377_1.time_ <= var_380_25 + arg_380_0 and arg_377_1.var_.characterEffect1015ui_story == nil then
				arg_377_1.var_.characterEffect1015ui_story = var_380_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_26 = 0.200000002980232

			if var_380_25 <= arg_377_1.time_ and arg_377_1.time_ < var_380_25 + var_380_26 then
				local var_380_27 = (arg_377_1.time_ - var_380_25) / var_380_26

				if arg_377_1.var_.characterEffect1015ui_story then
					local var_380_28 = Mathf.Lerp(0, 0.5, var_380_27)

					arg_377_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1015ui_story.fillRatio = var_380_28
				end
			end

			if arg_377_1.time_ >= var_380_25 + var_380_26 and arg_377_1.time_ < var_380_25 + var_380_26 + arg_380_0 and arg_377_1.var_.characterEffect1015ui_story then
				local var_380_29 = 0.5

				arg_377_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1015ui_story.fillRatio = var_380_29
			end

			local var_380_30 = arg_377_1.actors_["2079ui_story"].transform
			local var_380_31 = 0

			if var_380_31 < arg_377_1.time_ and arg_377_1.time_ <= var_380_31 + arg_380_0 then
				arg_377_1.var_.moveOldPos2079ui_story = var_380_30.localPosition
			end

			local var_380_32 = 0.001

			if var_380_31 <= arg_377_1.time_ and arg_377_1.time_ < var_380_31 + var_380_32 then
				local var_380_33 = (arg_377_1.time_ - var_380_31) / var_380_32
				local var_380_34 = Vector3.New(0, 100, 0)

				var_380_30.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos2079ui_story, var_380_34, var_380_33)

				local var_380_35 = manager.ui.mainCamera.transform.position - var_380_30.position

				var_380_30.forward = Vector3.New(var_380_35.x, var_380_35.y, var_380_35.z)

				local var_380_36 = var_380_30.localEulerAngles

				var_380_36.z = 0
				var_380_36.x = 0
				var_380_30.localEulerAngles = var_380_36
			end

			if arg_377_1.time_ >= var_380_31 + var_380_32 and arg_377_1.time_ < var_380_31 + var_380_32 + arg_380_0 then
				var_380_30.localPosition = Vector3.New(0, 100, 0)

				local var_380_37 = manager.ui.mainCamera.transform.position - var_380_30.position

				var_380_30.forward = Vector3.New(var_380_37.x, var_380_37.y, var_380_37.z)

				local var_380_38 = var_380_30.localEulerAngles

				var_380_38.z = 0
				var_380_38.x = 0
				var_380_30.localEulerAngles = var_380_38
			end

			local var_380_39 = arg_377_1.actors_["2079ui_story"]
			local var_380_40 = 0

			if var_380_40 < arg_377_1.time_ and arg_377_1.time_ <= var_380_40 + arg_380_0 and arg_377_1.var_.characterEffect2079ui_story == nil then
				arg_377_1.var_.characterEffect2079ui_story = var_380_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_41 = 0.200000002980232

			if var_380_40 <= arg_377_1.time_ and arg_377_1.time_ < var_380_40 + var_380_41 then
				local var_380_42 = (arg_377_1.time_ - var_380_40) / var_380_41

				if arg_377_1.var_.characterEffect2079ui_story then
					local var_380_43 = Mathf.Lerp(0, 0.5, var_380_42)

					arg_377_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_377_1.var_.characterEffect2079ui_story.fillRatio = var_380_43
				end
			end

			if arg_377_1.time_ >= var_380_40 + var_380_41 and arg_377_1.time_ < var_380_40 + var_380_41 + arg_380_0 and arg_377_1.var_.characterEffect2079ui_story then
				local var_380_44 = 0.5

				arg_377_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_377_1.var_.characterEffect2079ui_story.fillRatio = var_380_44
			end

			local var_380_45 = 0
			local var_380_46 = 1.425

			if var_380_45 < arg_377_1.time_ and arg_377_1.time_ <= var_380_45 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_47 = arg_377_1:FormatText(StoryNameCfg[530].name)

				arg_377_1.leftNameTxt_.text = var_380_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_48 = arg_377_1:GetWordFromCfg(317012091)
				local var_380_49 = arg_377_1:FormatText(var_380_48.content)

				arg_377_1.text_.text = var_380_49

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_50 = 57
				local var_380_51 = utf8.len(var_380_49)
				local var_380_52 = var_380_50 <= 0 and var_380_46 or var_380_46 * (var_380_51 / var_380_50)

				if var_380_52 > 0 and var_380_46 < var_380_52 then
					arg_377_1.talkMaxDuration = var_380_52

					if var_380_52 + var_380_45 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_52 + var_380_45
					end
				end

				arg_377_1.text_.text = var_380_49
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012091", "story_v_out_317012.awb") ~= 0 then
					local var_380_53 = manager.audio:GetVoiceLength("story_v_out_317012", "317012091", "story_v_out_317012.awb") / 1000

					if var_380_53 + var_380_45 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_53 + var_380_45
					end

					if var_380_48.prefab_name ~= "" and arg_377_1.actors_[var_380_48.prefab_name] ~= nil then
						local var_380_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_48.prefab_name].transform, "story_v_out_317012", "317012091", "story_v_out_317012.awb")

						arg_377_1:RecordAudio("317012091", var_380_54)
						arg_377_1:RecordAudio("317012091", var_380_54)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_317012", "317012091", "story_v_out_317012.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_317012", "317012091", "story_v_out_317012.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_55 = math.max(var_380_46, arg_377_1.talkMaxDuration)

			if var_380_45 <= arg_377_1.time_ and arg_377_1.time_ < var_380_45 + var_380_55 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_45) / var_380_55

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_45 + var_380_55 and arg_377_1.time_ < var_380_45 + var_380_55 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play317012092 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 317012092
		arg_381_1.duration_ = 1.866

		local var_381_0 = {
			zh = 1.866,
			ja = 1.733
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
				arg_381_0:Play317012093(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["2078ui_story"].transform
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 then
				arg_381_1.var_.moveOldPos2078ui_story = var_384_0.localPosition
			end

			local var_384_2 = 0.001

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2
				local var_384_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_384_0.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos2078ui_story, var_384_4, var_384_3)

				local var_384_5 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_5.x, var_384_5.y, var_384_5.z)

				local var_384_6 = var_384_0.localEulerAngles

				var_384_6.z = 0
				var_384_6.x = 0
				var_384_0.localEulerAngles = var_384_6
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 then
				var_384_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_384_7 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_7.x, var_384_7.y, var_384_7.z)

				local var_384_8 = var_384_0.localEulerAngles

				var_384_8.z = 0
				var_384_8.x = 0
				var_384_0.localEulerAngles = var_384_8
			end

			local var_384_9 = arg_381_1.actors_["2078ui_story"]
			local var_384_10 = 0

			if var_384_10 < arg_381_1.time_ and arg_381_1.time_ <= var_384_10 + arg_384_0 and arg_381_1.var_.characterEffect2078ui_story == nil then
				arg_381_1.var_.characterEffect2078ui_story = var_384_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_11 = 0.200000002980232

			if var_384_10 <= arg_381_1.time_ and arg_381_1.time_ < var_384_10 + var_384_11 then
				local var_384_12 = (arg_381_1.time_ - var_384_10) / var_384_11

				if arg_381_1.var_.characterEffect2078ui_story then
					local var_384_13 = Mathf.Lerp(0, 0.5, var_384_12)

					arg_381_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_381_1.var_.characterEffect2078ui_story.fillRatio = var_384_13
				end
			end

			if arg_381_1.time_ >= var_384_10 + var_384_11 and arg_381_1.time_ < var_384_10 + var_384_11 + arg_384_0 and arg_381_1.var_.characterEffect2078ui_story then
				local var_384_14 = 0.5

				arg_381_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_381_1.var_.characterEffect2078ui_story.fillRatio = var_384_14
			end

			local var_384_15 = arg_381_1.actors_["1015ui_story"].transform
			local var_384_16 = 0

			if var_384_16 < arg_381_1.time_ and arg_381_1.time_ <= var_384_16 + arg_384_0 then
				arg_381_1.var_.moveOldPos1015ui_story = var_384_15.localPosition
			end

			local var_384_17 = 0.001

			if var_384_16 <= arg_381_1.time_ and arg_381_1.time_ < var_384_16 + var_384_17 then
				local var_384_18 = (arg_381_1.time_ - var_384_16) / var_384_17
				local var_384_19 = Vector3.New(0.7, -1.15, -6.2)

				var_384_15.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos1015ui_story, var_384_19, var_384_18)

				local var_384_20 = manager.ui.mainCamera.transform.position - var_384_15.position

				var_384_15.forward = Vector3.New(var_384_20.x, var_384_20.y, var_384_20.z)

				local var_384_21 = var_384_15.localEulerAngles

				var_384_21.z = 0
				var_384_21.x = 0
				var_384_15.localEulerAngles = var_384_21
			end

			if arg_381_1.time_ >= var_384_16 + var_384_17 and arg_381_1.time_ < var_384_16 + var_384_17 + arg_384_0 then
				var_384_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_384_22 = manager.ui.mainCamera.transform.position - var_384_15.position

				var_384_15.forward = Vector3.New(var_384_22.x, var_384_22.y, var_384_22.z)

				local var_384_23 = var_384_15.localEulerAngles

				var_384_23.z = 0
				var_384_23.x = 0
				var_384_15.localEulerAngles = var_384_23
			end

			local var_384_24 = arg_381_1.actors_["1015ui_story"]
			local var_384_25 = 0

			if var_384_25 < arg_381_1.time_ and arg_381_1.time_ <= var_384_25 + arg_384_0 and arg_381_1.var_.characterEffect1015ui_story == nil then
				arg_381_1.var_.characterEffect1015ui_story = var_384_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_26 = 0.200000002980232

			if var_384_25 <= arg_381_1.time_ and arg_381_1.time_ < var_384_25 + var_384_26 then
				local var_384_27 = (arg_381_1.time_ - var_384_25) / var_384_26

				if arg_381_1.var_.characterEffect1015ui_story then
					arg_381_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_381_1.time_ >= var_384_25 + var_384_26 and arg_381_1.time_ < var_384_25 + var_384_26 + arg_384_0 and arg_381_1.var_.characterEffect1015ui_story then
				arg_381_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_384_28 = 0

			if var_384_28 < arg_381_1.time_ and arg_381_1.time_ <= var_384_28 + arg_384_0 then
				arg_381_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_384_29 = 0

			if var_384_29 < arg_381_1.time_ and arg_381_1.time_ <= var_384_29 + arg_384_0 then
				arg_381_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_384_30 = 0
			local var_384_31 = 0.25

			if var_384_30 < arg_381_1.time_ and arg_381_1.time_ <= var_384_30 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_32 = arg_381_1:FormatText(StoryNameCfg[479].name)

				arg_381_1.leftNameTxt_.text = var_384_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_33 = arg_381_1:GetWordFromCfg(317012092)
				local var_384_34 = arg_381_1:FormatText(var_384_33.content)

				arg_381_1.text_.text = var_384_34

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_35 = 10
				local var_384_36 = utf8.len(var_384_34)
				local var_384_37 = var_384_35 <= 0 and var_384_31 or var_384_31 * (var_384_36 / var_384_35)

				if var_384_37 > 0 and var_384_31 < var_384_37 then
					arg_381_1.talkMaxDuration = var_384_37

					if var_384_37 + var_384_30 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_37 + var_384_30
					end
				end

				arg_381_1.text_.text = var_384_34
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012092", "story_v_out_317012.awb") ~= 0 then
					local var_384_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012092", "story_v_out_317012.awb") / 1000

					if var_384_38 + var_384_30 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_38 + var_384_30
					end

					if var_384_33.prefab_name ~= "" and arg_381_1.actors_[var_384_33.prefab_name] ~= nil then
						local var_384_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_33.prefab_name].transform, "story_v_out_317012", "317012092", "story_v_out_317012.awb")

						arg_381_1:RecordAudio("317012092", var_384_39)
						arg_381_1:RecordAudio("317012092", var_384_39)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_317012", "317012092", "story_v_out_317012.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_317012", "317012092", "story_v_out_317012.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_40 = math.max(var_384_31, arg_381_1.talkMaxDuration)

			if var_384_30 <= arg_381_1.time_ and arg_381_1.time_ < var_384_30 + var_384_40 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_30) / var_384_40

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_30 + var_384_40 and arg_381_1.time_ < var_384_30 + var_384_40 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play317012093 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 317012093
		arg_385_1.duration_ = 2.9

		local var_385_0 = {
			zh = 1.866,
			ja = 2.9
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
				arg_385_0:Play317012094(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["2078ui_story"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos2078ui_story = var_388_0.localPosition
			end

			local var_388_2 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2
				local var_388_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos2078ui_story, var_388_4, var_388_3)

				local var_388_5 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_5.x, var_388_5.y, var_388_5.z)

				local var_388_6 = var_388_0.localEulerAngles

				var_388_6.z = 0
				var_388_6.x = 0
				var_388_0.localEulerAngles = var_388_6
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_388_7 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_7.x, var_388_7.y, var_388_7.z)

				local var_388_8 = var_388_0.localEulerAngles

				var_388_8.z = 0
				var_388_8.x = 0
				var_388_0.localEulerAngles = var_388_8
			end

			local var_388_9 = arg_385_1.actors_["2078ui_story"]
			local var_388_10 = 0

			if var_388_10 < arg_385_1.time_ and arg_385_1.time_ <= var_388_10 + arg_388_0 and arg_385_1.var_.characterEffect2078ui_story == nil then
				arg_385_1.var_.characterEffect2078ui_story = var_388_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_11 = 0.200000002980232

			if var_388_10 <= arg_385_1.time_ and arg_385_1.time_ < var_388_10 + var_388_11 then
				local var_388_12 = (arg_385_1.time_ - var_388_10) / var_388_11

				if arg_385_1.var_.characterEffect2078ui_story then
					arg_385_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_385_1.time_ >= var_388_10 + var_388_11 and arg_385_1.time_ < var_388_10 + var_388_11 + arg_388_0 and arg_385_1.var_.characterEffect2078ui_story then
				arg_385_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_388_13 = 0

			if var_388_13 < arg_385_1.time_ and arg_385_1.time_ <= var_388_13 + arg_388_0 then
				arg_385_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_388_14 = 0

			if var_388_14 < arg_385_1.time_ and arg_385_1.time_ <= var_388_14 + arg_388_0 then
				arg_385_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_388_15 = arg_385_1.actors_["1015ui_story"].transform
			local var_388_16 = 0

			if var_388_16 < arg_385_1.time_ and arg_385_1.time_ <= var_388_16 + arg_388_0 then
				arg_385_1.var_.moveOldPos1015ui_story = var_388_15.localPosition
			end

			local var_388_17 = 0.001

			if var_388_16 <= arg_385_1.time_ and arg_385_1.time_ < var_388_16 + var_388_17 then
				local var_388_18 = (arg_385_1.time_ - var_388_16) / var_388_17
				local var_388_19 = Vector3.New(0.7, -1.15, -6.2)

				var_388_15.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1015ui_story, var_388_19, var_388_18)

				local var_388_20 = manager.ui.mainCamera.transform.position - var_388_15.position

				var_388_15.forward = Vector3.New(var_388_20.x, var_388_20.y, var_388_20.z)

				local var_388_21 = var_388_15.localEulerAngles

				var_388_21.z = 0
				var_388_21.x = 0
				var_388_15.localEulerAngles = var_388_21
			end

			if arg_385_1.time_ >= var_388_16 + var_388_17 and arg_385_1.time_ < var_388_16 + var_388_17 + arg_388_0 then
				var_388_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_388_22 = manager.ui.mainCamera.transform.position - var_388_15.position

				var_388_15.forward = Vector3.New(var_388_22.x, var_388_22.y, var_388_22.z)

				local var_388_23 = var_388_15.localEulerAngles

				var_388_23.z = 0
				var_388_23.x = 0
				var_388_15.localEulerAngles = var_388_23
			end

			local var_388_24 = arg_385_1.actors_["1015ui_story"]
			local var_388_25 = 0

			if var_388_25 < arg_385_1.time_ and arg_385_1.time_ <= var_388_25 + arg_388_0 and arg_385_1.var_.characterEffect1015ui_story == nil then
				arg_385_1.var_.characterEffect1015ui_story = var_388_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_26 = 0.200000002980232

			if var_388_25 <= arg_385_1.time_ and arg_385_1.time_ < var_388_25 + var_388_26 then
				local var_388_27 = (arg_385_1.time_ - var_388_25) / var_388_26

				if arg_385_1.var_.characterEffect1015ui_story then
					local var_388_28 = Mathf.Lerp(0, 0.5, var_388_27)

					arg_385_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_385_1.var_.characterEffect1015ui_story.fillRatio = var_388_28
				end
			end

			if arg_385_1.time_ >= var_388_25 + var_388_26 and arg_385_1.time_ < var_388_25 + var_388_26 + arg_388_0 and arg_385_1.var_.characterEffect1015ui_story then
				local var_388_29 = 0.5

				arg_385_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_385_1.var_.characterEffect1015ui_story.fillRatio = var_388_29
			end

			local var_388_30 = 0
			local var_388_31 = 0.25

			if var_388_30 < arg_385_1.time_ and arg_385_1.time_ <= var_388_30 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_32 = arg_385_1:FormatText(StoryNameCfg[528].name)

				arg_385_1.leftNameTxt_.text = var_388_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_33 = arg_385_1:GetWordFromCfg(317012093)
				local var_388_34 = arg_385_1:FormatText(var_388_33.content)

				arg_385_1.text_.text = var_388_34

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_35 = 10
				local var_388_36 = utf8.len(var_388_34)
				local var_388_37 = var_388_35 <= 0 and var_388_31 or var_388_31 * (var_388_36 / var_388_35)

				if var_388_37 > 0 and var_388_31 < var_388_37 then
					arg_385_1.talkMaxDuration = var_388_37

					if var_388_37 + var_388_30 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_37 + var_388_30
					end
				end

				arg_385_1.text_.text = var_388_34
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012093", "story_v_out_317012.awb") ~= 0 then
					local var_388_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012093", "story_v_out_317012.awb") / 1000

					if var_388_38 + var_388_30 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_38 + var_388_30
					end

					if var_388_33.prefab_name ~= "" and arg_385_1.actors_[var_388_33.prefab_name] ~= nil then
						local var_388_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_33.prefab_name].transform, "story_v_out_317012", "317012093", "story_v_out_317012.awb")

						arg_385_1:RecordAudio("317012093", var_388_39)
						arg_385_1:RecordAudio("317012093", var_388_39)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_317012", "317012093", "story_v_out_317012.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_317012", "317012093", "story_v_out_317012.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_40 = math.max(var_388_31, arg_385_1.talkMaxDuration)

			if var_388_30 <= arg_385_1.time_ and arg_385_1.time_ < var_388_30 + var_388_40 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_30) / var_388_40

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_30 + var_388_40 and arg_385_1.time_ < var_388_30 + var_388_40 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play317012094 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 317012094
		arg_389_1.duration_ = 16.366

		local var_389_0 = {
			zh = 16.366,
			ja = 9.7
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
				arg_389_0:Play317012095(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["2078ui_story"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos2078ui_story = var_392_0.localPosition
			end

			local var_392_2 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2
				local var_392_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos2078ui_story, var_392_4, var_392_3)

				local var_392_5 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_5.x, var_392_5.y, var_392_5.z)

				local var_392_6 = var_392_0.localEulerAngles

				var_392_6.z = 0
				var_392_6.x = 0
				var_392_0.localEulerAngles = var_392_6
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_392_7 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_7.x, var_392_7.y, var_392_7.z)

				local var_392_8 = var_392_0.localEulerAngles

				var_392_8.z = 0
				var_392_8.x = 0
				var_392_0.localEulerAngles = var_392_8
			end

			local var_392_9 = arg_389_1.actors_["2078ui_story"]
			local var_392_10 = 0

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 and arg_389_1.var_.characterEffect2078ui_story == nil then
				arg_389_1.var_.characterEffect2078ui_story = var_392_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_11 = 0.200000002980232

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_11 then
				local var_392_12 = (arg_389_1.time_ - var_392_10) / var_392_11

				if arg_389_1.var_.characterEffect2078ui_story then
					local var_392_13 = Mathf.Lerp(0, 0.5, var_392_12)

					arg_389_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_389_1.var_.characterEffect2078ui_story.fillRatio = var_392_13
				end
			end

			if arg_389_1.time_ >= var_392_10 + var_392_11 and arg_389_1.time_ < var_392_10 + var_392_11 + arg_392_0 and arg_389_1.var_.characterEffect2078ui_story then
				local var_392_14 = 0.5

				arg_389_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_389_1.var_.characterEffect2078ui_story.fillRatio = var_392_14
			end

			local var_392_15 = arg_389_1.actors_["1015ui_story"].transform
			local var_392_16 = 0

			if var_392_16 < arg_389_1.time_ and arg_389_1.time_ <= var_392_16 + arg_392_0 then
				arg_389_1.var_.moveOldPos1015ui_story = var_392_15.localPosition
			end

			local var_392_17 = 0.001

			if var_392_16 <= arg_389_1.time_ and arg_389_1.time_ < var_392_16 + var_392_17 then
				local var_392_18 = (arg_389_1.time_ - var_392_16) / var_392_17
				local var_392_19 = Vector3.New(0.7, -1.15, -6.2)

				var_392_15.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1015ui_story, var_392_19, var_392_18)

				local var_392_20 = manager.ui.mainCamera.transform.position - var_392_15.position

				var_392_15.forward = Vector3.New(var_392_20.x, var_392_20.y, var_392_20.z)

				local var_392_21 = var_392_15.localEulerAngles

				var_392_21.z = 0
				var_392_21.x = 0
				var_392_15.localEulerAngles = var_392_21
			end

			if arg_389_1.time_ >= var_392_16 + var_392_17 and arg_389_1.time_ < var_392_16 + var_392_17 + arg_392_0 then
				var_392_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_392_22 = manager.ui.mainCamera.transform.position - var_392_15.position

				var_392_15.forward = Vector3.New(var_392_22.x, var_392_22.y, var_392_22.z)

				local var_392_23 = var_392_15.localEulerAngles

				var_392_23.z = 0
				var_392_23.x = 0
				var_392_15.localEulerAngles = var_392_23
			end

			local var_392_24 = arg_389_1.actors_["1015ui_story"]
			local var_392_25 = 0

			if var_392_25 < arg_389_1.time_ and arg_389_1.time_ <= var_392_25 + arg_392_0 and arg_389_1.var_.characterEffect1015ui_story == nil then
				arg_389_1.var_.characterEffect1015ui_story = var_392_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_26 = 0.200000002980232

			if var_392_25 <= arg_389_1.time_ and arg_389_1.time_ < var_392_25 + var_392_26 then
				local var_392_27 = (arg_389_1.time_ - var_392_25) / var_392_26

				if arg_389_1.var_.characterEffect1015ui_story then
					arg_389_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_25 + var_392_26 and arg_389_1.time_ < var_392_25 + var_392_26 + arg_392_0 and arg_389_1.var_.characterEffect1015ui_story then
				arg_389_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_392_28 = 0

			if var_392_28 < arg_389_1.time_ and arg_389_1.time_ <= var_392_28 + arg_392_0 then
				arg_389_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_392_29 = 0

			if var_392_29 < arg_389_1.time_ and arg_389_1.time_ <= var_392_29 + arg_392_0 then
				arg_389_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_392_30 = 0
			local var_392_31 = 1.75

			if var_392_30 < arg_389_1.time_ and arg_389_1.time_ <= var_392_30 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_32 = arg_389_1:FormatText(StoryNameCfg[479].name)

				arg_389_1.leftNameTxt_.text = var_392_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_33 = arg_389_1:GetWordFromCfg(317012094)
				local var_392_34 = arg_389_1:FormatText(var_392_33.content)

				arg_389_1.text_.text = var_392_34

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_35 = 70
				local var_392_36 = utf8.len(var_392_34)
				local var_392_37 = var_392_35 <= 0 and var_392_31 or var_392_31 * (var_392_36 / var_392_35)

				if var_392_37 > 0 and var_392_31 < var_392_37 then
					arg_389_1.talkMaxDuration = var_392_37

					if var_392_37 + var_392_30 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_37 + var_392_30
					end
				end

				arg_389_1.text_.text = var_392_34
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012094", "story_v_out_317012.awb") ~= 0 then
					local var_392_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012094", "story_v_out_317012.awb") / 1000

					if var_392_38 + var_392_30 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_38 + var_392_30
					end

					if var_392_33.prefab_name ~= "" and arg_389_1.actors_[var_392_33.prefab_name] ~= nil then
						local var_392_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_33.prefab_name].transform, "story_v_out_317012", "317012094", "story_v_out_317012.awb")

						arg_389_1:RecordAudio("317012094", var_392_39)
						arg_389_1:RecordAudio("317012094", var_392_39)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_317012", "317012094", "story_v_out_317012.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_317012", "317012094", "story_v_out_317012.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_40 = math.max(var_392_31, arg_389_1.talkMaxDuration)

			if var_392_30 <= arg_389_1.time_ and arg_389_1.time_ < var_392_30 + var_392_40 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_30) / var_392_40

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_30 + var_392_40 and arg_389_1.time_ < var_392_30 + var_392_40 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play317012095 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 317012095
		arg_393_1.duration_ = 10.766

		local var_393_0 = {
			zh = 10.766,
			ja = 9.6
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
				arg_393_0:Play317012096(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_2")
			end

			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 then
				arg_393_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_396_2 = 0
			local var_396_3 = 1.375

			if var_396_2 < arg_393_1.time_ and arg_393_1.time_ <= var_396_2 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_4 = arg_393_1:FormatText(StoryNameCfg[479].name)

				arg_393_1.leftNameTxt_.text = var_396_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_5 = arg_393_1:GetWordFromCfg(317012095)
				local var_396_6 = arg_393_1:FormatText(var_396_5.content)

				arg_393_1.text_.text = var_396_6

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_7 = 55
				local var_396_8 = utf8.len(var_396_6)
				local var_396_9 = var_396_7 <= 0 and var_396_3 or var_396_3 * (var_396_8 / var_396_7)

				if var_396_9 > 0 and var_396_3 < var_396_9 then
					arg_393_1.talkMaxDuration = var_396_9

					if var_396_9 + var_396_2 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_9 + var_396_2
					end
				end

				arg_393_1.text_.text = var_396_6
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012095", "story_v_out_317012.awb") ~= 0 then
					local var_396_10 = manager.audio:GetVoiceLength("story_v_out_317012", "317012095", "story_v_out_317012.awb") / 1000

					if var_396_10 + var_396_2 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_10 + var_396_2
					end

					if var_396_5.prefab_name ~= "" and arg_393_1.actors_[var_396_5.prefab_name] ~= nil then
						local var_396_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_5.prefab_name].transform, "story_v_out_317012", "317012095", "story_v_out_317012.awb")

						arg_393_1:RecordAudio("317012095", var_396_11)
						arg_393_1:RecordAudio("317012095", var_396_11)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_317012", "317012095", "story_v_out_317012.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_317012", "317012095", "story_v_out_317012.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_12 = math.max(var_396_3, arg_393_1.talkMaxDuration)

			if var_396_2 <= arg_393_1.time_ and arg_393_1.time_ < var_396_2 + var_396_12 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_2) / var_396_12

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_2 + var_396_12 and arg_393_1.time_ < var_396_2 + var_396_12 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play317012096 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 317012096
		arg_397_1.duration_ = 12.233

		local var_397_0 = {
			zh = 9.566,
			ja = 12.233
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
				arg_397_0:Play317012097(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 then
				arg_397_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_400_2 = 0
			local var_400_3 = 1.275

			if var_400_2 < arg_397_1.time_ and arg_397_1.time_ <= var_400_2 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_4 = arg_397_1:FormatText(StoryNameCfg[479].name)

				arg_397_1.leftNameTxt_.text = var_400_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_5 = arg_397_1:GetWordFromCfg(317012096)
				local var_400_6 = arg_397_1:FormatText(var_400_5.content)

				arg_397_1.text_.text = var_400_6

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_7 = 51
				local var_400_8 = utf8.len(var_400_6)
				local var_400_9 = var_400_7 <= 0 and var_400_3 or var_400_3 * (var_400_8 / var_400_7)

				if var_400_9 > 0 and var_400_3 < var_400_9 then
					arg_397_1.talkMaxDuration = var_400_9

					if var_400_9 + var_400_2 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_9 + var_400_2
					end
				end

				arg_397_1.text_.text = var_400_6
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012096", "story_v_out_317012.awb") ~= 0 then
					local var_400_10 = manager.audio:GetVoiceLength("story_v_out_317012", "317012096", "story_v_out_317012.awb") / 1000

					if var_400_10 + var_400_2 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_10 + var_400_2
					end

					if var_400_5.prefab_name ~= "" and arg_397_1.actors_[var_400_5.prefab_name] ~= nil then
						local var_400_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_5.prefab_name].transform, "story_v_out_317012", "317012096", "story_v_out_317012.awb")

						arg_397_1:RecordAudio("317012096", var_400_11)
						arg_397_1:RecordAudio("317012096", var_400_11)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_317012", "317012096", "story_v_out_317012.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_317012", "317012096", "story_v_out_317012.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_12 = math.max(var_400_3, arg_397_1.talkMaxDuration)

			if var_400_2 <= arg_397_1.time_ and arg_397_1.time_ < var_400_2 + var_400_12 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_2) / var_400_12

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_2 + var_400_12 and arg_397_1.time_ < var_400_2 + var_400_12 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play317012097 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 317012097
		arg_401_1.duration_ = 4.3

		local var_401_0 = {
			zh = 4.3,
			ja = 3
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
				arg_401_0:Play317012098(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1015ui_story"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos1015ui_story = var_404_0.localPosition
			end

			local var_404_2 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2
				local var_404_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1015ui_story, var_404_4, var_404_3)

				local var_404_5 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_5.x, var_404_5.y, var_404_5.z)

				local var_404_6 = var_404_0.localEulerAngles

				var_404_6.z = 0
				var_404_6.x = 0
				var_404_0.localEulerAngles = var_404_6
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_404_7 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_7.x, var_404_7.y, var_404_7.z)

				local var_404_8 = var_404_0.localEulerAngles

				var_404_8.z = 0
				var_404_8.x = 0
				var_404_0.localEulerAngles = var_404_8
			end

			local var_404_9 = arg_401_1.actors_["1015ui_story"]
			local var_404_10 = 0

			if var_404_10 < arg_401_1.time_ and arg_401_1.time_ <= var_404_10 + arg_404_0 and arg_401_1.var_.characterEffect1015ui_story == nil then
				arg_401_1.var_.characterEffect1015ui_story = var_404_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_11 = 0.200000002980232

			if var_404_10 <= arg_401_1.time_ and arg_401_1.time_ < var_404_10 + var_404_11 then
				local var_404_12 = (arg_401_1.time_ - var_404_10) / var_404_11

				if arg_401_1.var_.characterEffect1015ui_story then
					local var_404_13 = Mathf.Lerp(0, 0.5, var_404_12)

					arg_401_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_401_1.var_.characterEffect1015ui_story.fillRatio = var_404_13
				end
			end

			if arg_401_1.time_ >= var_404_10 + var_404_11 and arg_401_1.time_ < var_404_10 + var_404_11 + arg_404_0 and arg_401_1.var_.characterEffect1015ui_story then
				local var_404_14 = 0.5

				arg_401_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_401_1.var_.characterEffect1015ui_story.fillRatio = var_404_14
			end

			local var_404_15 = arg_401_1.actors_["2079ui_story"].transform
			local var_404_16 = 0

			if var_404_16 < arg_401_1.time_ and arg_401_1.time_ <= var_404_16 + arg_404_0 then
				arg_401_1.var_.moveOldPos2079ui_story = var_404_15.localPosition
			end

			local var_404_17 = 0.001

			if var_404_16 <= arg_401_1.time_ and arg_401_1.time_ < var_404_16 + var_404_17 then
				local var_404_18 = (arg_401_1.time_ - var_404_16) / var_404_17
				local var_404_19 = Vector3.New(0.7, -1.28, -5.6)

				var_404_15.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos2079ui_story, var_404_19, var_404_18)

				local var_404_20 = manager.ui.mainCamera.transform.position - var_404_15.position

				var_404_15.forward = Vector3.New(var_404_20.x, var_404_20.y, var_404_20.z)

				local var_404_21 = var_404_15.localEulerAngles

				var_404_21.z = 0
				var_404_21.x = 0
				var_404_15.localEulerAngles = var_404_21
			end

			if arg_401_1.time_ >= var_404_16 + var_404_17 and arg_401_1.time_ < var_404_16 + var_404_17 + arg_404_0 then
				var_404_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_404_22 = manager.ui.mainCamera.transform.position - var_404_15.position

				var_404_15.forward = Vector3.New(var_404_22.x, var_404_22.y, var_404_22.z)

				local var_404_23 = var_404_15.localEulerAngles

				var_404_23.z = 0
				var_404_23.x = 0
				var_404_15.localEulerAngles = var_404_23
			end

			local var_404_24 = arg_401_1.actors_["2079ui_story"]
			local var_404_25 = 0

			if var_404_25 < arg_401_1.time_ and arg_401_1.time_ <= var_404_25 + arg_404_0 and arg_401_1.var_.characterEffect2079ui_story == nil then
				arg_401_1.var_.characterEffect2079ui_story = var_404_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_26 = 0.200000002980232

			if var_404_25 <= arg_401_1.time_ and arg_401_1.time_ < var_404_25 + var_404_26 then
				local var_404_27 = (arg_401_1.time_ - var_404_25) / var_404_26

				if arg_401_1.var_.characterEffect2079ui_story then
					arg_401_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_25 + var_404_26 and arg_401_1.time_ < var_404_25 + var_404_26 + arg_404_0 and arg_401_1.var_.characterEffect2079ui_story then
				arg_401_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_404_28 = 0

			if var_404_28 < arg_401_1.time_ and arg_401_1.time_ <= var_404_28 + arg_404_0 then
				arg_401_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_404_29 = 0

			if var_404_29 < arg_401_1.time_ and arg_401_1.time_ <= var_404_29 + arg_404_0 then
				arg_401_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_404_30 = arg_401_1.actors_["2078ui_story"].transform
			local var_404_31 = 0

			if var_404_31 < arg_401_1.time_ and arg_401_1.time_ <= var_404_31 + arg_404_0 then
				arg_401_1.var_.moveOldPos2078ui_story = var_404_30.localPosition
			end

			local var_404_32 = 0.001

			if var_404_31 <= arg_401_1.time_ and arg_401_1.time_ < var_404_31 + var_404_32 then
				local var_404_33 = (arg_401_1.time_ - var_404_31) / var_404_32
				local var_404_34 = Vector3.New(0, 100, 0)

				var_404_30.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos2078ui_story, var_404_34, var_404_33)

				local var_404_35 = manager.ui.mainCamera.transform.position - var_404_30.position

				var_404_30.forward = Vector3.New(var_404_35.x, var_404_35.y, var_404_35.z)

				local var_404_36 = var_404_30.localEulerAngles

				var_404_36.z = 0
				var_404_36.x = 0
				var_404_30.localEulerAngles = var_404_36
			end

			if arg_401_1.time_ >= var_404_31 + var_404_32 and arg_401_1.time_ < var_404_31 + var_404_32 + arg_404_0 then
				var_404_30.localPosition = Vector3.New(0, 100, 0)

				local var_404_37 = manager.ui.mainCamera.transform.position - var_404_30.position

				var_404_30.forward = Vector3.New(var_404_37.x, var_404_37.y, var_404_37.z)

				local var_404_38 = var_404_30.localEulerAngles

				var_404_38.z = 0
				var_404_38.x = 0
				var_404_30.localEulerAngles = var_404_38
			end

			local var_404_39 = arg_401_1.actors_["2078ui_story"]
			local var_404_40 = 0

			if var_404_40 < arg_401_1.time_ and arg_401_1.time_ <= var_404_40 + arg_404_0 and arg_401_1.var_.characterEffect2078ui_story == nil then
				arg_401_1.var_.characterEffect2078ui_story = var_404_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_41 = 0.200000002980232

			if var_404_40 <= arg_401_1.time_ and arg_401_1.time_ < var_404_40 + var_404_41 then
				local var_404_42 = (arg_401_1.time_ - var_404_40) / var_404_41

				if arg_401_1.var_.characterEffect2078ui_story then
					local var_404_43 = Mathf.Lerp(0, 0.5, var_404_42)

					arg_401_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_401_1.var_.characterEffect2078ui_story.fillRatio = var_404_43
				end
			end

			if arg_401_1.time_ >= var_404_40 + var_404_41 and arg_401_1.time_ < var_404_40 + var_404_41 + arg_404_0 and arg_401_1.var_.characterEffect2078ui_story then
				local var_404_44 = 0.5

				arg_401_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_401_1.var_.characterEffect2078ui_story.fillRatio = var_404_44
			end

			local var_404_45 = 0
			local var_404_46 = 0.275

			if var_404_45 < arg_401_1.time_ and arg_401_1.time_ <= var_404_45 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_47 = arg_401_1:FormatText(StoryNameCfg[529].name)

				arg_401_1.leftNameTxt_.text = var_404_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_48 = arg_401_1:GetWordFromCfg(317012097)
				local var_404_49 = arg_401_1:FormatText(var_404_48.content)

				arg_401_1.text_.text = var_404_49

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_50 = 11
				local var_404_51 = utf8.len(var_404_49)
				local var_404_52 = var_404_50 <= 0 and var_404_46 or var_404_46 * (var_404_51 / var_404_50)

				if var_404_52 > 0 and var_404_46 < var_404_52 then
					arg_401_1.talkMaxDuration = var_404_52

					if var_404_52 + var_404_45 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_52 + var_404_45
					end
				end

				arg_401_1.text_.text = var_404_49
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012097", "story_v_out_317012.awb") ~= 0 then
					local var_404_53 = manager.audio:GetVoiceLength("story_v_out_317012", "317012097", "story_v_out_317012.awb") / 1000

					if var_404_53 + var_404_45 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_53 + var_404_45
					end

					if var_404_48.prefab_name ~= "" and arg_401_1.actors_[var_404_48.prefab_name] ~= nil then
						local var_404_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_48.prefab_name].transform, "story_v_out_317012", "317012097", "story_v_out_317012.awb")

						arg_401_1:RecordAudio("317012097", var_404_54)
						arg_401_1:RecordAudio("317012097", var_404_54)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_317012", "317012097", "story_v_out_317012.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_317012", "317012097", "story_v_out_317012.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_55 = math.max(var_404_46, arg_401_1.talkMaxDuration)

			if var_404_45 <= arg_401_1.time_ and arg_401_1.time_ < var_404_45 + var_404_55 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_45) / var_404_55

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_45 + var_404_55 and arg_401_1.time_ < var_404_45 + var_404_55 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play317012098 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 317012098
		arg_405_1.duration_ = 4.933

		local var_405_0 = {
			zh = 4.166,
			ja = 4.933
		}
		local var_405_1 = manager.audio:GetLocalizationFlag()

		if var_405_0[var_405_1] ~= nil then
			arg_405_1.duration_ = var_405_0[var_405_1]
		end

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play317012099(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1015ui_story"].transform
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1.var_.moveOldPos1015ui_story = var_408_0.localPosition
			end

			local var_408_2 = 0.001

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2
				local var_408_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos1015ui_story, var_408_4, var_408_3)

				local var_408_5 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_5.x, var_408_5.y, var_408_5.z)

				local var_408_6 = var_408_0.localEulerAngles

				var_408_6.z = 0
				var_408_6.x = 0
				var_408_0.localEulerAngles = var_408_6
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_408_7 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_7.x, var_408_7.y, var_408_7.z)

				local var_408_8 = var_408_0.localEulerAngles

				var_408_8.z = 0
				var_408_8.x = 0
				var_408_0.localEulerAngles = var_408_8
			end

			local var_408_9 = arg_405_1.actors_["1015ui_story"]
			local var_408_10 = 0

			if var_408_10 < arg_405_1.time_ and arg_405_1.time_ <= var_408_10 + arg_408_0 and arg_405_1.var_.characterEffect1015ui_story == nil then
				arg_405_1.var_.characterEffect1015ui_story = var_408_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_11 = 0.200000002980232

			if var_408_10 <= arg_405_1.time_ and arg_405_1.time_ < var_408_10 + var_408_11 then
				local var_408_12 = (arg_405_1.time_ - var_408_10) / var_408_11

				if arg_405_1.var_.characterEffect1015ui_story then
					arg_405_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_405_1.time_ >= var_408_10 + var_408_11 and arg_405_1.time_ < var_408_10 + var_408_11 + arg_408_0 and arg_405_1.var_.characterEffect1015ui_story then
				arg_405_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_408_13 = 0

			if var_408_13 < arg_405_1.time_ and arg_405_1.time_ <= var_408_13 + arg_408_0 then
				arg_405_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_408_14 = 0

			if var_408_14 < arg_405_1.time_ and arg_405_1.time_ <= var_408_14 + arg_408_0 then
				arg_405_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_408_15 = arg_405_1.actors_["2079ui_story"].transform
			local var_408_16 = 0

			if var_408_16 < arg_405_1.time_ and arg_405_1.time_ <= var_408_16 + arg_408_0 then
				arg_405_1.var_.moveOldPos2079ui_story = var_408_15.localPosition
			end

			local var_408_17 = 0.001

			if var_408_16 <= arg_405_1.time_ and arg_405_1.time_ < var_408_16 + var_408_17 then
				local var_408_18 = (arg_405_1.time_ - var_408_16) / var_408_17
				local var_408_19 = Vector3.New(0.7, -1.28, -5.6)

				var_408_15.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos2079ui_story, var_408_19, var_408_18)

				local var_408_20 = manager.ui.mainCamera.transform.position - var_408_15.position

				var_408_15.forward = Vector3.New(var_408_20.x, var_408_20.y, var_408_20.z)

				local var_408_21 = var_408_15.localEulerAngles

				var_408_21.z = 0
				var_408_21.x = 0
				var_408_15.localEulerAngles = var_408_21
			end

			if arg_405_1.time_ >= var_408_16 + var_408_17 and arg_405_1.time_ < var_408_16 + var_408_17 + arg_408_0 then
				var_408_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_408_22 = manager.ui.mainCamera.transform.position - var_408_15.position

				var_408_15.forward = Vector3.New(var_408_22.x, var_408_22.y, var_408_22.z)

				local var_408_23 = var_408_15.localEulerAngles

				var_408_23.z = 0
				var_408_23.x = 0
				var_408_15.localEulerAngles = var_408_23
			end

			local var_408_24 = arg_405_1.actors_["2079ui_story"]
			local var_408_25 = 0

			if var_408_25 < arg_405_1.time_ and arg_405_1.time_ <= var_408_25 + arg_408_0 and arg_405_1.var_.characterEffect2079ui_story == nil then
				arg_405_1.var_.characterEffect2079ui_story = var_408_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_26 = 0.200000002980232

			if var_408_25 <= arg_405_1.time_ and arg_405_1.time_ < var_408_25 + var_408_26 then
				local var_408_27 = (arg_405_1.time_ - var_408_25) / var_408_26

				if arg_405_1.var_.characterEffect2079ui_story then
					local var_408_28 = Mathf.Lerp(0, 0.5, var_408_27)

					arg_405_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_405_1.var_.characterEffect2079ui_story.fillRatio = var_408_28
				end
			end

			if arg_405_1.time_ >= var_408_25 + var_408_26 and arg_405_1.time_ < var_408_25 + var_408_26 + arg_408_0 and arg_405_1.var_.characterEffect2079ui_story then
				local var_408_29 = 0.5

				arg_405_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_405_1.var_.characterEffect2079ui_story.fillRatio = var_408_29
			end

			local var_408_30 = 0
			local var_408_31 = 0.525

			if var_408_30 < arg_405_1.time_ and arg_405_1.time_ <= var_408_30 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_32 = arg_405_1:FormatText(StoryNameCfg[479].name)

				arg_405_1.leftNameTxt_.text = var_408_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_33 = arg_405_1:GetWordFromCfg(317012098)
				local var_408_34 = arg_405_1:FormatText(var_408_33.content)

				arg_405_1.text_.text = var_408_34

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_35 = 21
				local var_408_36 = utf8.len(var_408_34)
				local var_408_37 = var_408_35 <= 0 and var_408_31 or var_408_31 * (var_408_36 / var_408_35)

				if var_408_37 > 0 and var_408_31 < var_408_37 then
					arg_405_1.talkMaxDuration = var_408_37

					if var_408_37 + var_408_30 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_37 + var_408_30
					end
				end

				arg_405_1.text_.text = var_408_34
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012098", "story_v_out_317012.awb") ~= 0 then
					local var_408_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012098", "story_v_out_317012.awb") / 1000

					if var_408_38 + var_408_30 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_38 + var_408_30
					end

					if var_408_33.prefab_name ~= "" and arg_405_1.actors_[var_408_33.prefab_name] ~= nil then
						local var_408_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_33.prefab_name].transform, "story_v_out_317012", "317012098", "story_v_out_317012.awb")

						arg_405_1:RecordAudio("317012098", var_408_39)
						arg_405_1:RecordAudio("317012098", var_408_39)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_317012", "317012098", "story_v_out_317012.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_317012", "317012098", "story_v_out_317012.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_40 = math.max(var_408_31, arg_405_1.talkMaxDuration)

			if var_408_30 <= arg_405_1.time_ and arg_405_1.time_ < var_408_30 + var_408_40 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_30) / var_408_40

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_30 + var_408_40 and arg_405_1.time_ < var_408_30 + var_408_40 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play317012099 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 317012099
		arg_409_1.duration_ = 1.8

		local var_409_0 = {
			zh = 1.533,
			ja = 1.8
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
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play317012100(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1015ui_story"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos1015ui_story = var_412_0.localPosition
			end

			local var_412_2 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2
				local var_412_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos1015ui_story, var_412_4, var_412_3)

				local var_412_5 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_5.x, var_412_5.y, var_412_5.z)

				local var_412_6 = var_412_0.localEulerAngles

				var_412_6.z = 0
				var_412_6.x = 0
				var_412_0.localEulerAngles = var_412_6
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_412_7 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_7.x, var_412_7.y, var_412_7.z)

				local var_412_8 = var_412_0.localEulerAngles

				var_412_8.z = 0
				var_412_8.x = 0
				var_412_0.localEulerAngles = var_412_8
			end

			local var_412_9 = arg_409_1.actors_["1015ui_story"]
			local var_412_10 = 0

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 and arg_409_1.var_.characterEffect1015ui_story == nil then
				arg_409_1.var_.characterEffect1015ui_story = var_412_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_11 = 0.200000002980232

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_11 then
				local var_412_12 = (arg_409_1.time_ - var_412_10) / var_412_11

				if arg_409_1.var_.characterEffect1015ui_story then
					local var_412_13 = Mathf.Lerp(0, 0.5, var_412_12)

					arg_409_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_409_1.var_.characterEffect1015ui_story.fillRatio = var_412_13
				end
			end

			if arg_409_1.time_ >= var_412_10 + var_412_11 and arg_409_1.time_ < var_412_10 + var_412_11 + arg_412_0 and arg_409_1.var_.characterEffect1015ui_story then
				local var_412_14 = 0.5

				arg_409_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_409_1.var_.characterEffect1015ui_story.fillRatio = var_412_14
			end

			local var_412_15 = arg_409_1.actors_["2079ui_story"].transform
			local var_412_16 = 0

			if var_412_16 < arg_409_1.time_ and arg_409_1.time_ <= var_412_16 + arg_412_0 then
				arg_409_1.var_.moveOldPos2079ui_story = var_412_15.localPosition
			end

			local var_412_17 = 0.001

			if var_412_16 <= arg_409_1.time_ and arg_409_1.time_ < var_412_16 + var_412_17 then
				local var_412_18 = (arg_409_1.time_ - var_412_16) / var_412_17
				local var_412_19 = Vector3.New(0.7, -1.28, -5.6)

				var_412_15.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos2079ui_story, var_412_19, var_412_18)

				local var_412_20 = manager.ui.mainCamera.transform.position - var_412_15.position

				var_412_15.forward = Vector3.New(var_412_20.x, var_412_20.y, var_412_20.z)

				local var_412_21 = var_412_15.localEulerAngles

				var_412_21.z = 0
				var_412_21.x = 0
				var_412_15.localEulerAngles = var_412_21
			end

			if arg_409_1.time_ >= var_412_16 + var_412_17 and arg_409_1.time_ < var_412_16 + var_412_17 + arg_412_0 then
				var_412_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_412_22 = manager.ui.mainCamera.transform.position - var_412_15.position

				var_412_15.forward = Vector3.New(var_412_22.x, var_412_22.y, var_412_22.z)

				local var_412_23 = var_412_15.localEulerAngles

				var_412_23.z = 0
				var_412_23.x = 0
				var_412_15.localEulerAngles = var_412_23
			end

			local var_412_24 = arg_409_1.actors_["2079ui_story"]
			local var_412_25 = 0

			if var_412_25 < arg_409_1.time_ and arg_409_1.time_ <= var_412_25 + arg_412_0 and arg_409_1.var_.characterEffect2079ui_story == nil then
				arg_409_1.var_.characterEffect2079ui_story = var_412_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_26 = 0.200000002980232

			if var_412_25 <= arg_409_1.time_ and arg_409_1.time_ < var_412_25 + var_412_26 then
				local var_412_27 = (arg_409_1.time_ - var_412_25) / var_412_26

				if arg_409_1.var_.characterEffect2079ui_story then
					arg_409_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_25 + var_412_26 and arg_409_1.time_ < var_412_25 + var_412_26 + arg_412_0 and arg_409_1.var_.characterEffect2079ui_story then
				arg_409_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_412_28 = 0

			if var_412_28 < arg_409_1.time_ and arg_409_1.time_ <= var_412_28 + arg_412_0 then
				arg_409_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_412_29 = 0

			if var_412_29 < arg_409_1.time_ and arg_409_1.time_ <= var_412_29 + arg_412_0 then
				arg_409_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_412_30 = 0
			local var_412_31 = 0.075

			if var_412_30 < arg_409_1.time_ and arg_409_1.time_ <= var_412_30 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_32 = arg_409_1:FormatText(StoryNameCfg[529].name)

				arg_409_1.leftNameTxt_.text = var_412_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_33 = arg_409_1:GetWordFromCfg(317012099)
				local var_412_34 = arg_409_1:FormatText(var_412_33.content)

				arg_409_1.text_.text = var_412_34

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_35 = 3
				local var_412_36 = utf8.len(var_412_34)
				local var_412_37 = var_412_35 <= 0 and var_412_31 or var_412_31 * (var_412_36 / var_412_35)

				if var_412_37 > 0 and var_412_31 < var_412_37 then
					arg_409_1.talkMaxDuration = var_412_37

					if var_412_37 + var_412_30 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_37 + var_412_30
					end
				end

				arg_409_1.text_.text = var_412_34
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012099", "story_v_out_317012.awb") ~= 0 then
					local var_412_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012099", "story_v_out_317012.awb") / 1000

					if var_412_38 + var_412_30 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_38 + var_412_30
					end

					if var_412_33.prefab_name ~= "" and arg_409_1.actors_[var_412_33.prefab_name] ~= nil then
						local var_412_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_33.prefab_name].transform, "story_v_out_317012", "317012099", "story_v_out_317012.awb")

						arg_409_1:RecordAudio("317012099", var_412_39)
						arg_409_1:RecordAudio("317012099", var_412_39)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_317012", "317012099", "story_v_out_317012.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_317012", "317012099", "story_v_out_317012.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_40 = math.max(var_412_31, arg_409_1.talkMaxDuration)

			if var_412_30 <= arg_409_1.time_ and arg_409_1.time_ < var_412_30 + var_412_40 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_30) / var_412_40

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_30 + var_412_40 and arg_409_1.time_ < var_412_30 + var_412_40 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play317012100 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 317012100
		arg_413_1.duration_ = 5.433

		local var_413_0 = {
			zh = 5.433,
			ja = 4.366
		}
		local var_413_1 = manager.audio:GetLocalizationFlag()

		if var_413_0[var_413_1] ~= nil then
			arg_413_1.duration_ = var_413_0[var_413_1]
		end

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play317012101(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1015ui_story"].transform
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.var_.moveOldPos1015ui_story = var_416_0.localPosition
			end

			local var_416_2 = 0.001

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2
				local var_416_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_416_0.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1015ui_story, var_416_4, var_416_3)

				local var_416_5 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_5.x, var_416_5.y, var_416_5.z)

				local var_416_6 = var_416_0.localEulerAngles

				var_416_6.z = 0
				var_416_6.x = 0
				var_416_0.localEulerAngles = var_416_6
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 then
				var_416_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_416_7 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_7.x, var_416_7.y, var_416_7.z)

				local var_416_8 = var_416_0.localEulerAngles

				var_416_8.z = 0
				var_416_8.x = 0
				var_416_0.localEulerAngles = var_416_8
			end

			local var_416_9 = arg_413_1.actors_["1015ui_story"]
			local var_416_10 = 0

			if var_416_10 < arg_413_1.time_ and arg_413_1.time_ <= var_416_10 + arg_416_0 and arg_413_1.var_.characterEffect1015ui_story == nil then
				arg_413_1.var_.characterEffect1015ui_story = var_416_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_11 = 0.200000002980232

			if var_416_10 <= arg_413_1.time_ and arg_413_1.time_ < var_416_10 + var_416_11 then
				local var_416_12 = (arg_413_1.time_ - var_416_10) / var_416_11

				if arg_413_1.var_.characterEffect1015ui_story then
					arg_413_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_10 + var_416_11 and arg_413_1.time_ < var_416_10 + var_416_11 + arg_416_0 and arg_413_1.var_.characterEffect1015ui_story then
				arg_413_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_416_13 = 0

			if var_416_13 < arg_413_1.time_ and arg_413_1.time_ <= var_416_13 + arg_416_0 then
				arg_413_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_416_14 = 0

			if var_416_14 < arg_413_1.time_ and arg_413_1.time_ <= var_416_14 + arg_416_0 then
				arg_413_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_416_15 = arg_413_1.actors_["2079ui_story"].transform
			local var_416_16 = 0

			if var_416_16 < arg_413_1.time_ and arg_413_1.time_ <= var_416_16 + arg_416_0 then
				arg_413_1.var_.moveOldPos2079ui_story = var_416_15.localPosition
			end

			local var_416_17 = 0.001

			if var_416_16 <= arg_413_1.time_ and arg_413_1.time_ < var_416_16 + var_416_17 then
				local var_416_18 = (arg_413_1.time_ - var_416_16) / var_416_17
				local var_416_19 = Vector3.New(0.7, -1.28, -5.6)

				var_416_15.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos2079ui_story, var_416_19, var_416_18)

				local var_416_20 = manager.ui.mainCamera.transform.position - var_416_15.position

				var_416_15.forward = Vector3.New(var_416_20.x, var_416_20.y, var_416_20.z)

				local var_416_21 = var_416_15.localEulerAngles

				var_416_21.z = 0
				var_416_21.x = 0
				var_416_15.localEulerAngles = var_416_21
			end

			if arg_413_1.time_ >= var_416_16 + var_416_17 and arg_413_1.time_ < var_416_16 + var_416_17 + arg_416_0 then
				var_416_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_416_22 = manager.ui.mainCamera.transform.position - var_416_15.position

				var_416_15.forward = Vector3.New(var_416_22.x, var_416_22.y, var_416_22.z)

				local var_416_23 = var_416_15.localEulerAngles

				var_416_23.z = 0
				var_416_23.x = 0
				var_416_15.localEulerAngles = var_416_23
			end

			local var_416_24 = arg_413_1.actors_["2079ui_story"]
			local var_416_25 = 0

			if var_416_25 < arg_413_1.time_ and arg_413_1.time_ <= var_416_25 + arg_416_0 and arg_413_1.var_.characterEffect2079ui_story == nil then
				arg_413_1.var_.characterEffect2079ui_story = var_416_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_26 = 0.200000002980232

			if var_416_25 <= arg_413_1.time_ and arg_413_1.time_ < var_416_25 + var_416_26 then
				local var_416_27 = (arg_413_1.time_ - var_416_25) / var_416_26

				if arg_413_1.var_.characterEffect2079ui_story then
					local var_416_28 = Mathf.Lerp(0, 0.5, var_416_27)

					arg_413_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_413_1.var_.characterEffect2079ui_story.fillRatio = var_416_28
				end
			end

			if arg_413_1.time_ >= var_416_25 + var_416_26 and arg_413_1.time_ < var_416_25 + var_416_26 + arg_416_0 and arg_413_1.var_.characterEffect2079ui_story then
				local var_416_29 = 0.5

				arg_413_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_413_1.var_.characterEffect2079ui_story.fillRatio = var_416_29
			end

			local var_416_30 = 0
			local var_416_31 = 0.75

			if var_416_30 < arg_413_1.time_ and arg_413_1.time_ <= var_416_30 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_32 = arg_413_1:FormatText(StoryNameCfg[479].name)

				arg_413_1.leftNameTxt_.text = var_416_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_33 = arg_413_1:GetWordFromCfg(317012100)
				local var_416_34 = arg_413_1:FormatText(var_416_33.content)

				arg_413_1.text_.text = var_416_34

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_35 = 30
				local var_416_36 = utf8.len(var_416_34)
				local var_416_37 = var_416_35 <= 0 and var_416_31 or var_416_31 * (var_416_36 / var_416_35)

				if var_416_37 > 0 and var_416_31 < var_416_37 then
					arg_413_1.talkMaxDuration = var_416_37

					if var_416_37 + var_416_30 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_37 + var_416_30
					end
				end

				arg_413_1.text_.text = var_416_34
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012100", "story_v_out_317012.awb") ~= 0 then
					local var_416_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012100", "story_v_out_317012.awb") / 1000

					if var_416_38 + var_416_30 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_38 + var_416_30
					end

					if var_416_33.prefab_name ~= "" and arg_413_1.actors_[var_416_33.prefab_name] ~= nil then
						local var_416_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_33.prefab_name].transform, "story_v_out_317012", "317012100", "story_v_out_317012.awb")

						arg_413_1:RecordAudio("317012100", var_416_39)
						arg_413_1:RecordAudio("317012100", var_416_39)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_317012", "317012100", "story_v_out_317012.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_317012", "317012100", "story_v_out_317012.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_40 = math.max(var_416_31, arg_413_1.talkMaxDuration)

			if var_416_30 <= arg_413_1.time_ and arg_413_1.time_ < var_416_30 + var_416_40 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_30) / var_416_40

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_30 + var_416_40 and arg_413_1.time_ < var_416_30 + var_416_40 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play317012101 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 317012101
		arg_417_1.duration_ = 10.9

		local var_417_0 = {
			zh = 9.366,
			ja = 10.9
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
				arg_417_0:Play317012102(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = 0

			if var_420_0 < arg_417_1.time_ and arg_417_1.time_ <= var_420_0 + arg_420_0 then
				arg_417_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_420_1 = 0
			local var_420_2 = 1.325

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_3 = arg_417_1:FormatText(StoryNameCfg[479].name)

				arg_417_1.leftNameTxt_.text = var_420_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_4 = arg_417_1:GetWordFromCfg(317012101)
				local var_420_5 = arg_417_1:FormatText(var_420_4.content)

				arg_417_1.text_.text = var_420_5

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_6 = 53
				local var_420_7 = utf8.len(var_420_5)
				local var_420_8 = var_420_6 <= 0 and var_420_2 or var_420_2 * (var_420_7 / var_420_6)

				if var_420_8 > 0 and var_420_2 < var_420_8 then
					arg_417_1.talkMaxDuration = var_420_8

					if var_420_8 + var_420_1 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_8 + var_420_1
					end
				end

				arg_417_1.text_.text = var_420_5
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012101", "story_v_out_317012.awb") ~= 0 then
					local var_420_9 = manager.audio:GetVoiceLength("story_v_out_317012", "317012101", "story_v_out_317012.awb") / 1000

					if var_420_9 + var_420_1 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_9 + var_420_1
					end

					if var_420_4.prefab_name ~= "" and arg_417_1.actors_[var_420_4.prefab_name] ~= nil then
						local var_420_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_4.prefab_name].transform, "story_v_out_317012", "317012101", "story_v_out_317012.awb")

						arg_417_1:RecordAudio("317012101", var_420_10)
						arg_417_1:RecordAudio("317012101", var_420_10)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_317012", "317012101", "story_v_out_317012.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_317012", "317012101", "story_v_out_317012.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_11 = math.max(var_420_2, arg_417_1.talkMaxDuration)

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_11 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_1) / var_420_11

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_1 + var_420_11 and arg_417_1.time_ < var_420_1 + var_420_11 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play317012102 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 317012102
		arg_421_1.duration_ = 5.4

		local var_421_0 = {
			zh = 3.633,
			ja = 5.4
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
				arg_421_0:Play317012103(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["2078ui_story"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos2078ui_story = var_424_0.localPosition
			end

			local var_424_2 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2
				local var_424_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos2078ui_story, var_424_4, var_424_3)

				local var_424_5 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_5.x, var_424_5.y, var_424_5.z)

				local var_424_6 = var_424_0.localEulerAngles

				var_424_6.z = 0
				var_424_6.x = 0
				var_424_0.localEulerAngles = var_424_6
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 then
				var_424_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_424_7 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_7.x, var_424_7.y, var_424_7.z)

				local var_424_8 = var_424_0.localEulerAngles

				var_424_8.z = 0
				var_424_8.x = 0
				var_424_0.localEulerAngles = var_424_8
			end

			local var_424_9 = arg_421_1.actors_["2078ui_story"]
			local var_424_10 = 0

			if var_424_10 < arg_421_1.time_ and arg_421_1.time_ <= var_424_10 + arg_424_0 and arg_421_1.var_.characterEffect2078ui_story == nil then
				arg_421_1.var_.characterEffect2078ui_story = var_424_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_11 = 0.200000002980232

			if var_424_10 <= arg_421_1.time_ and arg_421_1.time_ < var_424_10 + var_424_11 then
				local var_424_12 = (arg_421_1.time_ - var_424_10) / var_424_11

				if arg_421_1.var_.characterEffect2078ui_story then
					arg_421_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_421_1.time_ >= var_424_10 + var_424_11 and arg_421_1.time_ < var_424_10 + var_424_11 + arg_424_0 and arg_421_1.var_.characterEffect2078ui_story then
				arg_421_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_424_13 = 0

			if var_424_13 < arg_421_1.time_ and arg_421_1.time_ <= var_424_13 + arg_424_0 then
				arg_421_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_424_14 = 0

			if var_424_14 < arg_421_1.time_ and arg_421_1.time_ <= var_424_14 + arg_424_0 then
				arg_421_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_424_15 = arg_421_1.actors_["1015ui_story"].transform
			local var_424_16 = 0

			if var_424_16 < arg_421_1.time_ and arg_421_1.time_ <= var_424_16 + arg_424_0 then
				arg_421_1.var_.moveOldPos1015ui_story = var_424_15.localPosition
			end

			local var_424_17 = 0.001

			if var_424_16 <= arg_421_1.time_ and arg_421_1.time_ < var_424_16 + var_424_17 then
				local var_424_18 = (arg_421_1.time_ - var_424_16) / var_424_17
				local var_424_19 = Vector3.New(0.7, -1.15, -6.2)

				var_424_15.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos1015ui_story, var_424_19, var_424_18)

				local var_424_20 = manager.ui.mainCamera.transform.position - var_424_15.position

				var_424_15.forward = Vector3.New(var_424_20.x, var_424_20.y, var_424_20.z)

				local var_424_21 = var_424_15.localEulerAngles

				var_424_21.z = 0
				var_424_21.x = 0
				var_424_15.localEulerAngles = var_424_21
			end

			if arg_421_1.time_ >= var_424_16 + var_424_17 and arg_421_1.time_ < var_424_16 + var_424_17 + arg_424_0 then
				var_424_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_424_22 = manager.ui.mainCamera.transform.position - var_424_15.position

				var_424_15.forward = Vector3.New(var_424_22.x, var_424_22.y, var_424_22.z)

				local var_424_23 = var_424_15.localEulerAngles

				var_424_23.z = 0
				var_424_23.x = 0
				var_424_15.localEulerAngles = var_424_23
			end

			local var_424_24 = arg_421_1.actors_["1015ui_story"]
			local var_424_25 = 0

			if var_424_25 < arg_421_1.time_ and arg_421_1.time_ <= var_424_25 + arg_424_0 and arg_421_1.var_.characterEffect1015ui_story == nil then
				arg_421_1.var_.characterEffect1015ui_story = var_424_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_26 = 0.200000002980232

			if var_424_25 <= arg_421_1.time_ and arg_421_1.time_ < var_424_25 + var_424_26 then
				local var_424_27 = (arg_421_1.time_ - var_424_25) / var_424_26

				if arg_421_1.var_.characterEffect1015ui_story then
					local var_424_28 = Mathf.Lerp(0, 0.5, var_424_27)

					arg_421_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1015ui_story.fillRatio = var_424_28
				end
			end

			if arg_421_1.time_ >= var_424_25 + var_424_26 and arg_421_1.time_ < var_424_25 + var_424_26 + arg_424_0 and arg_421_1.var_.characterEffect1015ui_story then
				local var_424_29 = 0.5

				arg_421_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1015ui_story.fillRatio = var_424_29
			end

			local var_424_30 = arg_421_1.actors_["2079ui_story"].transform
			local var_424_31 = 0

			if var_424_31 < arg_421_1.time_ and arg_421_1.time_ <= var_424_31 + arg_424_0 then
				arg_421_1.var_.moveOldPos2079ui_story = var_424_30.localPosition
			end

			local var_424_32 = 0.001

			if var_424_31 <= arg_421_1.time_ and arg_421_1.time_ < var_424_31 + var_424_32 then
				local var_424_33 = (arg_421_1.time_ - var_424_31) / var_424_32
				local var_424_34 = Vector3.New(0, 100, 0)

				var_424_30.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos2079ui_story, var_424_34, var_424_33)

				local var_424_35 = manager.ui.mainCamera.transform.position - var_424_30.position

				var_424_30.forward = Vector3.New(var_424_35.x, var_424_35.y, var_424_35.z)

				local var_424_36 = var_424_30.localEulerAngles

				var_424_36.z = 0
				var_424_36.x = 0
				var_424_30.localEulerAngles = var_424_36
			end

			if arg_421_1.time_ >= var_424_31 + var_424_32 and arg_421_1.time_ < var_424_31 + var_424_32 + arg_424_0 then
				var_424_30.localPosition = Vector3.New(0, 100, 0)

				local var_424_37 = manager.ui.mainCamera.transform.position - var_424_30.position

				var_424_30.forward = Vector3.New(var_424_37.x, var_424_37.y, var_424_37.z)

				local var_424_38 = var_424_30.localEulerAngles

				var_424_38.z = 0
				var_424_38.x = 0
				var_424_30.localEulerAngles = var_424_38
			end

			local var_424_39 = arg_421_1.actors_["2079ui_story"]
			local var_424_40 = 0

			if var_424_40 < arg_421_1.time_ and arg_421_1.time_ <= var_424_40 + arg_424_0 and arg_421_1.var_.characterEffect2079ui_story == nil then
				arg_421_1.var_.characterEffect2079ui_story = var_424_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_41 = 0.200000002980232

			if var_424_40 <= arg_421_1.time_ and arg_421_1.time_ < var_424_40 + var_424_41 then
				local var_424_42 = (arg_421_1.time_ - var_424_40) / var_424_41

				if arg_421_1.var_.characterEffect2079ui_story then
					local var_424_43 = Mathf.Lerp(0, 0.5, var_424_42)

					arg_421_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_421_1.var_.characterEffect2079ui_story.fillRatio = var_424_43
				end
			end

			if arg_421_1.time_ >= var_424_40 + var_424_41 and arg_421_1.time_ < var_424_40 + var_424_41 + arg_424_0 and arg_421_1.var_.characterEffect2079ui_story then
				local var_424_44 = 0.5

				arg_421_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_421_1.var_.characterEffect2079ui_story.fillRatio = var_424_44
			end

			local var_424_45 = 0
			local var_424_46 = 0.375

			if var_424_45 < arg_421_1.time_ and arg_421_1.time_ <= var_424_45 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_47 = arg_421_1:FormatText(StoryNameCfg[528].name)

				arg_421_1.leftNameTxt_.text = var_424_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_48 = arg_421_1:GetWordFromCfg(317012102)
				local var_424_49 = arg_421_1:FormatText(var_424_48.content)

				arg_421_1.text_.text = var_424_49

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_50 = 15
				local var_424_51 = utf8.len(var_424_49)
				local var_424_52 = var_424_50 <= 0 and var_424_46 or var_424_46 * (var_424_51 / var_424_50)

				if var_424_52 > 0 and var_424_46 < var_424_52 then
					arg_421_1.talkMaxDuration = var_424_52

					if var_424_52 + var_424_45 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_52 + var_424_45
					end
				end

				arg_421_1.text_.text = var_424_49
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012102", "story_v_out_317012.awb") ~= 0 then
					local var_424_53 = manager.audio:GetVoiceLength("story_v_out_317012", "317012102", "story_v_out_317012.awb") / 1000

					if var_424_53 + var_424_45 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_53 + var_424_45
					end

					if var_424_48.prefab_name ~= "" and arg_421_1.actors_[var_424_48.prefab_name] ~= nil then
						local var_424_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_48.prefab_name].transform, "story_v_out_317012", "317012102", "story_v_out_317012.awb")

						arg_421_1:RecordAudio("317012102", var_424_54)
						arg_421_1:RecordAudio("317012102", var_424_54)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_317012", "317012102", "story_v_out_317012.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_317012", "317012102", "story_v_out_317012.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_55 = math.max(var_424_46, arg_421_1.talkMaxDuration)

			if var_424_45 <= arg_421_1.time_ and arg_421_1.time_ < var_424_45 + var_424_55 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_45) / var_424_55

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_45 + var_424_55 and arg_421_1.time_ < var_424_45 + var_424_55 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play317012103 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 317012103
		arg_425_1.duration_ = 11.433

		local var_425_0 = {
			zh = 11.433,
			ja = 8.333
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
				arg_425_0:Play317012104(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["2078ui_story"].transform
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 then
				arg_425_1.var_.moveOldPos2078ui_story = var_428_0.localPosition
			end

			local var_428_2 = 0.001

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2
				local var_428_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_428_0.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos2078ui_story, var_428_4, var_428_3)

				local var_428_5 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_5.x, var_428_5.y, var_428_5.z)

				local var_428_6 = var_428_0.localEulerAngles

				var_428_6.z = 0
				var_428_6.x = 0
				var_428_0.localEulerAngles = var_428_6
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 then
				var_428_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_428_7 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_7.x, var_428_7.y, var_428_7.z)

				local var_428_8 = var_428_0.localEulerAngles

				var_428_8.z = 0
				var_428_8.x = 0
				var_428_0.localEulerAngles = var_428_8
			end

			local var_428_9 = arg_425_1.actors_["2078ui_story"]
			local var_428_10 = 0

			if var_428_10 < arg_425_1.time_ and arg_425_1.time_ <= var_428_10 + arg_428_0 and arg_425_1.var_.characterEffect2078ui_story == nil then
				arg_425_1.var_.characterEffect2078ui_story = var_428_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_11 = 0.200000002980232

			if var_428_10 <= arg_425_1.time_ and arg_425_1.time_ < var_428_10 + var_428_11 then
				local var_428_12 = (arg_425_1.time_ - var_428_10) / var_428_11

				if arg_425_1.var_.characterEffect2078ui_story then
					local var_428_13 = Mathf.Lerp(0, 0.5, var_428_12)

					arg_425_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_425_1.var_.characterEffect2078ui_story.fillRatio = var_428_13
				end
			end

			if arg_425_1.time_ >= var_428_10 + var_428_11 and arg_425_1.time_ < var_428_10 + var_428_11 + arg_428_0 and arg_425_1.var_.characterEffect2078ui_story then
				local var_428_14 = 0.5

				arg_425_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_425_1.var_.characterEffect2078ui_story.fillRatio = var_428_14
			end

			local var_428_15 = arg_425_1.actors_["1015ui_story"].transform
			local var_428_16 = 0

			if var_428_16 < arg_425_1.time_ and arg_425_1.time_ <= var_428_16 + arg_428_0 then
				arg_425_1.var_.moveOldPos1015ui_story = var_428_15.localPosition
			end

			local var_428_17 = 0.001

			if var_428_16 <= arg_425_1.time_ and arg_425_1.time_ < var_428_16 + var_428_17 then
				local var_428_18 = (arg_425_1.time_ - var_428_16) / var_428_17
				local var_428_19 = Vector3.New(0.7, -1.15, -6.2)

				var_428_15.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos1015ui_story, var_428_19, var_428_18)

				local var_428_20 = manager.ui.mainCamera.transform.position - var_428_15.position

				var_428_15.forward = Vector3.New(var_428_20.x, var_428_20.y, var_428_20.z)

				local var_428_21 = var_428_15.localEulerAngles

				var_428_21.z = 0
				var_428_21.x = 0
				var_428_15.localEulerAngles = var_428_21
			end

			if arg_425_1.time_ >= var_428_16 + var_428_17 and arg_425_1.time_ < var_428_16 + var_428_17 + arg_428_0 then
				var_428_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_428_22 = manager.ui.mainCamera.transform.position - var_428_15.position

				var_428_15.forward = Vector3.New(var_428_22.x, var_428_22.y, var_428_22.z)

				local var_428_23 = var_428_15.localEulerAngles

				var_428_23.z = 0
				var_428_23.x = 0
				var_428_15.localEulerAngles = var_428_23
			end

			local var_428_24 = arg_425_1.actors_["1015ui_story"]
			local var_428_25 = 0

			if var_428_25 < arg_425_1.time_ and arg_425_1.time_ <= var_428_25 + arg_428_0 and arg_425_1.var_.characterEffect1015ui_story == nil then
				arg_425_1.var_.characterEffect1015ui_story = var_428_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_26 = 0.200000002980232

			if var_428_25 <= arg_425_1.time_ and arg_425_1.time_ < var_428_25 + var_428_26 then
				local var_428_27 = (arg_425_1.time_ - var_428_25) / var_428_26

				if arg_425_1.var_.characterEffect1015ui_story then
					arg_425_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_25 + var_428_26 and arg_425_1.time_ < var_428_25 + var_428_26 + arg_428_0 and arg_425_1.var_.characterEffect1015ui_story then
				arg_425_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_428_28 = 0

			if var_428_28 < arg_425_1.time_ and arg_425_1.time_ <= var_428_28 + arg_428_0 then
				arg_425_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_428_29 = 0

			if var_428_29 < arg_425_1.time_ and arg_425_1.time_ <= var_428_29 + arg_428_0 then
				arg_425_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_428_30 = 0
			local var_428_31 = 1.275

			if var_428_30 < arg_425_1.time_ and arg_425_1.time_ <= var_428_30 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_32 = arg_425_1:FormatText(StoryNameCfg[479].name)

				arg_425_1.leftNameTxt_.text = var_428_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_33 = arg_425_1:GetWordFromCfg(317012103)
				local var_428_34 = arg_425_1:FormatText(var_428_33.content)

				arg_425_1.text_.text = var_428_34

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_35 = 51
				local var_428_36 = utf8.len(var_428_34)
				local var_428_37 = var_428_35 <= 0 and var_428_31 or var_428_31 * (var_428_36 / var_428_35)

				if var_428_37 > 0 and var_428_31 < var_428_37 then
					arg_425_1.talkMaxDuration = var_428_37

					if var_428_37 + var_428_30 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_37 + var_428_30
					end
				end

				arg_425_1.text_.text = var_428_34
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012103", "story_v_out_317012.awb") ~= 0 then
					local var_428_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012103", "story_v_out_317012.awb") / 1000

					if var_428_38 + var_428_30 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_38 + var_428_30
					end

					if var_428_33.prefab_name ~= "" and arg_425_1.actors_[var_428_33.prefab_name] ~= nil then
						local var_428_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_33.prefab_name].transform, "story_v_out_317012", "317012103", "story_v_out_317012.awb")

						arg_425_1:RecordAudio("317012103", var_428_39)
						arg_425_1:RecordAudio("317012103", var_428_39)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_317012", "317012103", "story_v_out_317012.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_317012", "317012103", "story_v_out_317012.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_40 = math.max(var_428_31, arg_425_1.talkMaxDuration)

			if var_428_30 <= arg_425_1.time_ and arg_425_1.time_ < var_428_30 + var_428_40 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_30) / var_428_40

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_30 + var_428_40 and arg_425_1.time_ < var_428_30 + var_428_40 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play317012104 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 317012104
		arg_429_1.duration_ = 5.1

		local var_429_0 = {
			zh = 5.1,
			ja = 4.666
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
				arg_429_0:Play317012105(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["2078ui_story"].transform
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 then
				arg_429_1.var_.moveOldPos2078ui_story = var_432_0.localPosition
			end

			local var_432_2 = 0.001

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2
				local var_432_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_432_0.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos2078ui_story, var_432_4, var_432_3)

				local var_432_5 = manager.ui.mainCamera.transform.position - var_432_0.position

				var_432_0.forward = Vector3.New(var_432_5.x, var_432_5.y, var_432_5.z)

				local var_432_6 = var_432_0.localEulerAngles

				var_432_6.z = 0
				var_432_6.x = 0
				var_432_0.localEulerAngles = var_432_6
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 then
				var_432_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_432_7 = manager.ui.mainCamera.transform.position - var_432_0.position

				var_432_0.forward = Vector3.New(var_432_7.x, var_432_7.y, var_432_7.z)

				local var_432_8 = var_432_0.localEulerAngles

				var_432_8.z = 0
				var_432_8.x = 0
				var_432_0.localEulerAngles = var_432_8
			end

			local var_432_9 = arg_429_1.actors_["2078ui_story"]
			local var_432_10 = 0

			if var_432_10 < arg_429_1.time_ and arg_429_1.time_ <= var_432_10 + arg_432_0 and arg_429_1.var_.characterEffect2078ui_story == nil then
				arg_429_1.var_.characterEffect2078ui_story = var_432_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_11 = 0.200000002980232

			if var_432_10 <= arg_429_1.time_ and arg_429_1.time_ < var_432_10 + var_432_11 then
				local var_432_12 = (arg_429_1.time_ - var_432_10) / var_432_11

				if arg_429_1.var_.characterEffect2078ui_story then
					arg_429_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_10 + var_432_11 and arg_429_1.time_ < var_432_10 + var_432_11 + arg_432_0 and arg_429_1.var_.characterEffect2078ui_story then
				arg_429_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_432_13 = 0

			if var_432_13 < arg_429_1.time_ and arg_429_1.time_ <= var_432_13 + arg_432_0 then
				arg_429_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_432_14 = 0

			if var_432_14 < arg_429_1.time_ and arg_429_1.time_ <= var_432_14 + arg_432_0 then
				arg_429_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_432_15 = arg_429_1.actors_["1015ui_story"].transform
			local var_432_16 = 0

			if var_432_16 < arg_429_1.time_ and arg_429_1.time_ <= var_432_16 + arg_432_0 then
				arg_429_1.var_.moveOldPos1015ui_story = var_432_15.localPosition
			end

			local var_432_17 = 0.001

			if var_432_16 <= arg_429_1.time_ and arg_429_1.time_ < var_432_16 + var_432_17 then
				local var_432_18 = (arg_429_1.time_ - var_432_16) / var_432_17
				local var_432_19 = Vector3.New(0.7, -1.15, -6.2)

				var_432_15.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1015ui_story, var_432_19, var_432_18)

				local var_432_20 = manager.ui.mainCamera.transform.position - var_432_15.position

				var_432_15.forward = Vector3.New(var_432_20.x, var_432_20.y, var_432_20.z)

				local var_432_21 = var_432_15.localEulerAngles

				var_432_21.z = 0
				var_432_21.x = 0
				var_432_15.localEulerAngles = var_432_21
			end

			if arg_429_1.time_ >= var_432_16 + var_432_17 and arg_429_1.time_ < var_432_16 + var_432_17 + arg_432_0 then
				var_432_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_432_22 = manager.ui.mainCamera.transform.position - var_432_15.position

				var_432_15.forward = Vector3.New(var_432_22.x, var_432_22.y, var_432_22.z)

				local var_432_23 = var_432_15.localEulerAngles

				var_432_23.z = 0
				var_432_23.x = 0
				var_432_15.localEulerAngles = var_432_23
			end

			local var_432_24 = arg_429_1.actors_["1015ui_story"]
			local var_432_25 = 0

			if var_432_25 < arg_429_1.time_ and arg_429_1.time_ <= var_432_25 + arg_432_0 and arg_429_1.var_.characterEffect1015ui_story == nil then
				arg_429_1.var_.characterEffect1015ui_story = var_432_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_26 = 0.200000002980232

			if var_432_25 <= arg_429_1.time_ and arg_429_1.time_ < var_432_25 + var_432_26 then
				local var_432_27 = (arg_429_1.time_ - var_432_25) / var_432_26

				if arg_429_1.var_.characterEffect1015ui_story then
					local var_432_28 = Mathf.Lerp(0, 0.5, var_432_27)

					arg_429_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_429_1.var_.characterEffect1015ui_story.fillRatio = var_432_28
				end
			end

			if arg_429_1.time_ >= var_432_25 + var_432_26 and arg_429_1.time_ < var_432_25 + var_432_26 + arg_432_0 and arg_429_1.var_.characterEffect1015ui_story then
				local var_432_29 = 0.5

				arg_429_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_429_1.var_.characterEffect1015ui_story.fillRatio = var_432_29
			end

			local var_432_30 = 0
			local var_432_31 = 0.55

			if var_432_30 < arg_429_1.time_ and arg_429_1.time_ <= var_432_30 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_32 = arg_429_1:FormatText(StoryNameCfg[530].name)

				arg_429_1.leftNameTxt_.text = var_432_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_33 = arg_429_1:GetWordFromCfg(317012104)
				local var_432_34 = arg_429_1:FormatText(var_432_33.content)

				arg_429_1.text_.text = var_432_34

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_35 = 22
				local var_432_36 = utf8.len(var_432_34)
				local var_432_37 = var_432_35 <= 0 and var_432_31 or var_432_31 * (var_432_36 / var_432_35)

				if var_432_37 > 0 and var_432_31 < var_432_37 then
					arg_429_1.talkMaxDuration = var_432_37

					if var_432_37 + var_432_30 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_37 + var_432_30
					end
				end

				arg_429_1.text_.text = var_432_34
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012104", "story_v_out_317012.awb") ~= 0 then
					local var_432_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012104", "story_v_out_317012.awb") / 1000

					if var_432_38 + var_432_30 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_38 + var_432_30
					end

					if var_432_33.prefab_name ~= "" and arg_429_1.actors_[var_432_33.prefab_name] ~= nil then
						local var_432_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_33.prefab_name].transform, "story_v_out_317012", "317012104", "story_v_out_317012.awb")

						arg_429_1:RecordAudio("317012104", var_432_39)
						arg_429_1:RecordAudio("317012104", var_432_39)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_317012", "317012104", "story_v_out_317012.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_317012", "317012104", "story_v_out_317012.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_40 = math.max(var_432_31, arg_429_1.talkMaxDuration)

			if var_432_30 <= arg_429_1.time_ and arg_429_1.time_ < var_432_30 + var_432_40 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_30) / var_432_40

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_30 + var_432_40 and arg_429_1.time_ < var_432_30 + var_432_40 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play317012105 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 317012105
		arg_433_1.duration_ = 11.3

		local var_433_0 = {
			zh = 11.3,
			ja = 11
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
				arg_433_0:Play317012106(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["2078ui_story"].transform
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.var_.moveOldPos2078ui_story = var_436_0.localPosition
			end

			local var_436_2 = 0.001

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2
				local var_436_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_436_0.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos2078ui_story, var_436_4, var_436_3)

				local var_436_5 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_5.x, var_436_5.y, var_436_5.z)

				local var_436_6 = var_436_0.localEulerAngles

				var_436_6.z = 0
				var_436_6.x = 0
				var_436_0.localEulerAngles = var_436_6
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 then
				var_436_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_436_7 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_7.x, var_436_7.y, var_436_7.z)

				local var_436_8 = var_436_0.localEulerAngles

				var_436_8.z = 0
				var_436_8.x = 0
				var_436_0.localEulerAngles = var_436_8
			end

			local var_436_9 = arg_433_1.actors_["2078ui_story"]
			local var_436_10 = 0

			if var_436_10 < arg_433_1.time_ and arg_433_1.time_ <= var_436_10 + arg_436_0 and arg_433_1.var_.characterEffect2078ui_story == nil then
				arg_433_1.var_.characterEffect2078ui_story = var_436_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_11 = 0.200000002980232

			if var_436_10 <= arg_433_1.time_ and arg_433_1.time_ < var_436_10 + var_436_11 then
				local var_436_12 = (arg_433_1.time_ - var_436_10) / var_436_11

				if arg_433_1.var_.characterEffect2078ui_story then
					local var_436_13 = Mathf.Lerp(0, 0.5, var_436_12)

					arg_433_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_433_1.var_.characterEffect2078ui_story.fillRatio = var_436_13
				end
			end

			if arg_433_1.time_ >= var_436_10 + var_436_11 and arg_433_1.time_ < var_436_10 + var_436_11 + arg_436_0 and arg_433_1.var_.characterEffect2078ui_story then
				local var_436_14 = 0.5

				arg_433_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_433_1.var_.characterEffect2078ui_story.fillRatio = var_436_14
			end

			local var_436_15 = arg_433_1.actors_["1015ui_story"].transform
			local var_436_16 = 0

			if var_436_16 < arg_433_1.time_ and arg_433_1.time_ <= var_436_16 + arg_436_0 then
				arg_433_1.var_.moveOldPos1015ui_story = var_436_15.localPosition
			end

			local var_436_17 = 0.001

			if var_436_16 <= arg_433_1.time_ and arg_433_1.time_ < var_436_16 + var_436_17 then
				local var_436_18 = (arg_433_1.time_ - var_436_16) / var_436_17
				local var_436_19 = Vector3.New(0.7, -1.15, -6.2)

				var_436_15.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos1015ui_story, var_436_19, var_436_18)

				local var_436_20 = manager.ui.mainCamera.transform.position - var_436_15.position

				var_436_15.forward = Vector3.New(var_436_20.x, var_436_20.y, var_436_20.z)

				local var_436_21 = var_436_15.localEulerAngles

				var_436_21.z = 0
				var_436_21.x = 0
				var_436_15.localEulerAngles = var_436_21
			end

			if arg_433_1.time_ >= var_436_16 + var_436_17 and arg_433_1.time_ < var_436_16 + var_436_17 + arg_436_0 then
				var_436_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_436_22 = manager.ui.mainCamera.transform.position - var_436_15.position

				var_436_15.forward = Vector3.New(var_436_22.x, var_436_22.y, var_436_22.z)

				local var_436_23 = var_436_15.localEulerAngles

				var_436_23.z = 0
				var_436_23.x = 0
				var_436_15.localEulerAngles = var_436_23
			end

			local var_436_24 = arg_433_1.actors_["1015ui_story"]
			local var_436_25 = 0

			if var_436_25 < arg_433_1.time_ and arg_433_1.time_ <= var_436_25 + arg_436_0 and arg_433_1.var_.characterEffect1015ui_story == nil then
				arg_433_1.var_.characterEffect1015ui_story = var_436_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_26 = 0.200000002980232

			if var_436_25 <= arg_433_1.time_ and arg_433_1.time_ < var_436_25 + var_436_26 then
				local var_436_27 = (arg_433_1.time_ - var_436_25) / var_436_26

				if arg_433_1.var_.characterEffect1015ui_story then
					arg_433_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_433_1.time_ >= var_436_25 + var_436_26 and arg_433_1.time_ < var_436_25 + var_436_26 + arg_436_0 and arg_433_1.var_.characterEffect1015ui_story then
				arg_433_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_436_28 = 0

			if var_436_28 < arg_433_1.time_ and arg_433_1.time_ <= var_436_28 + arg_436_0 then
				arg_433_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_436_29 = 0

			if var_436_29 < arg_433_1.time_ and arg_433_1.time_ <= var_436_29 + arg_436_0 then
				arg_433_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_436_30 = 0
			local var_436_31 = 1.325

			if var_436_30 < arg_433_1.time_ and arg_433_1.time_ <= var_436_30 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_32 = arg_433_1:FormatText(StoryNameCfg[479].name)

				arg_433_1.leftNameTxt_.text = var_436_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_33 = arg_433_1:GetWordFromCfg(317012105)
				local var_436_34 = arg_433_1:FormatText(var_436_33.content)

				arg_433_1.text_.text = var_436_34

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_35 = 53
				local var_436_36 = utf8.len(var_436_34)
				local var_436_37 = var_436_35 <= 0 and var_436_31 or var_436_31 * (var_436_36 / var_436_35)

				if var_436_37 > 0 and var_436_31 < var_436_37 then
					arg_433_1.talkMaxDuration = var_436_37

					if var_436_37 + var_436_30 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_37 + var_436_30
					end
				end

				arg_433_1.text_.text = var_436_34
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012105", "story_v_out_317012.awb") ~= 0 then
					local var_436_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012105", "story_v_out_317012.awb") / 1000

					if var_436_38 + var_436_30 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_38 + var_436_30
					end

					if var_436_33.prefab_name ~= "" and arg_433_1.actors_[var_436_33.prefab_name] ~= nil then
						local var_436_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_33.prefab_name].transform, "story_v_out_317012", "317012105", "story_v_out_317012.awb")

						arg_433_1:RecordAudio("317012105", var_436_39)
						arg_433_1:RecordAudio("317012105", var_436_39)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_317012", "317012105", "story_v_out_317012.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_317012", "317012105", "story_v_out_317012.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_40 = math.max(var_436_31, arg_433_1.talkMaxDuration)

			if var_436_30 <= arg_433_1.time_ and arg_433_1.time_ < var_436_30 + var_436_40 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_30) / var_436_40

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_30 + var_436_40 and arg_433_1.time_ < var_436_30 + var_436_40 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play317012106 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 317012106
		arg_437_1.duration_ = 1.9

		local var_437_0 = {
			zh = 1.3,
			ja = 1.9
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
				arg_437_0:Play317012107(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["2078ui_story"].transform
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 then
				arg_437_1.var_.moveOldPos2078ui_story = var_440_0.localPosition
			end

			local var_440_2 = 0.001

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2
				local var_440_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_440_0.localPosition = Vector3.Lerp(arg_437_1.var_.moveOldPos2078ui_story, var_440_4, var_440_3)

				local var_440_5 = manager.ui.mainCamera.transform.position - var_440_0.position

				var_440_0.forward = Vector3.New(var_440_5.x, var_440_5.y, var_440_5.z)

				local var_440_6 = var_440_0.localEulerAngles

				var_440_6.z = 0
				var_440_6.x = 0
				var_440_0.localEulerAngles = var_440_6
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 then
				var_440_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_440_7 = manager.ui.mainCamera.transform.position - var_440_0.position

				var_440_0.forward = Vector3.New(var_440_7.x, var_440_7.y, var_440_7.z)

				local var_440_8 = var_440_0.localEulerAngles

				var_440_8.z = 0
				var_440_8.x = 0
				var_440_0.localEulerAngles = var_440_8
			end

			local var_440_9 = arg_437_1.actors_["2078ui_story"]
			local var_440_10 = 0

			if var_440_10 < arg_437_1.time_ and arg_437_1.time_ <= var_440_10 + arg_440_0 and arg_437_1.var_.characterEffect2078ui_story == nil then
				arg_437_1.var_.characterEffect2078ui_story = var_440_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_11 = 0.200000002980232

			if var_440_10 <= arg_437_1.time_ and arg_437_1.time_ < var_440_10 + var_440_11 then
				local var_440_12 = (arg_437_1.time_ - var_440_10) / var_440_11

				if arg_437_1.var_.characterEffect2078ui_story then
					arg_437_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_437_1.time_ >= var_440_10 + var_440_11 and arg_437_1.time_ < var_440_10 + var_440_11 + arg_440_0 and arg_437_1.var_.characterEffect2078ui_story then
				arg_437_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_440_13 = 0

			if var_440_13 < arg_437_1.time_ and arg_437_1.time_ <= var_440_13 + arg_440_0 then
				arg_437_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_440_14 = 0

			if var_440_14 < arg_437_1.time_ and arg_437_1.time_ <= var_440_14 + arg_440_0 then
				arg_437_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_440_15 = arg_437_1.actors_["1015ui_story"].transform
			local var_440_16 = 0

			if var_440_16 < arg_437_1.time_ and arg_437_1.time_ <= var_440_16 + arg_440_0 then
				arg_437_1.var_.moveOldPos1015ui_story = var_440_15.localPosition
			end

			local var_440_17 = 0.001

			if var_440_16 <= arg_437_1.time_ and arg_437_1.time_ < var_440_16 + var_440_17 then
				local var_440_18 = (arg_437_1.time_ - var_440_16) / var_440_17
				local var_440_19 = Vector3.New(0.7, -1.15, -6.2)

				var_440_15.localPosition = Vector3.Lerp(arg_437_1.var_.moveOldPos1015ui_story, var_440_19, var_440_18)

				local var_440_20 = manager.ui.mainCamera.transform.position - var_440_15.position

				var_440_15.forward = Vector3.New(var_440_20.x, var_440_20.y, var_440_20.z)

				local var_440_21 = var_440_15.localEulerAngles

				var_440_21.z = 0
				var_440_21.x = 0
				var_440_15.localEulerAngles = var_440_21
			end

			if arg_437_1.time_ >= var_440_16 + var_440_17 and arg_437_1.time_ < var_440_16 + var_440_17 + arg_440_0 then
				var_440_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_440_22 = manager.ui.mainCamera.transform.position - var_440_15.position

				var_440_15.forward = Vector3.New(var_440_22.x, var_440_22.y, var_440_22.z)

				local var_440_23 = var_440_15.localEulerAngles

				var_440_23.z = 0
				var_440_23.x = 0
				var_440_15.localEulerAngles = var_440_23
			end

			local var_440_24 = arg_437_1.actors_["1015ui_story"]
			local var_440_25 = 0

			if var_440_25 < arg_437_1.time_ and arg_437_1.time_ <= var_440_25 + arg_440_0 and arg_437_1.var_.characterEffect1015ui_story == nil then
				arg_437_1.var_.characterEffect1015ui_story = var_440_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_26 = 0.200000002980232

			if var_440_25 <= arg_437_1.time_ and arg_437_1.time_ < var_440_25 + var_440_26 then
				local var_440_27 = (arg_437_1.time_ - var_440_25) / var_440_26

				if arg_437_1.var_.characterEffect1015ui_story then
					local var_440_28 = Mathf.Lerp(0, 0.5, var_440_27)

					arg_437_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_437_1.var_.characterEffect1015ui_story.fillRatio = var_440_28
				end
			end

			if arg_437_1.time_ >= var_440_25 + var_440_26 and arg_437_1.time_ < var_440_25 + var_440_26 + arg_440_0 and arg_437_1.var_.characterEffect1015ui_story then
				local var_440_29 = 0.5

				arg_437_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_437_1.var_.characterEffect1015ui_story.fillRatio = var_440_29
			end

			local var_440_30 = 0
			local var_440_31 = 0.075

			if var_440_30 < arg_437_1.time_ and arg_437_1.time_ <= var_440_30 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_32 = arg_437_1:FormatText(StoryNameCfg[530].name)

				arg_437_1.leftNameTxt_.text = var_440_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_33 = arg_437_1:GetWordFromCfg(317012106)
				local var_440_34 = arg_437_1:FormatText(var_440_33.content)

				arg_437_1.text_.text = var_440_34

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_35 = 3
				local var_440_36 = utf8.len(var_440_34)
				local var_440_37 = var_440_35 <= 0 and var_440_31 or var_440_31 * (var_440_36 / var_440_35)

				if var_440_37 > 0 and var_440_31 < var_440_37 then
					arg_437_1.talkMaxDuration = var_440_37

					if var_440_37 + var_440_30 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_37 + var_440_30
					end
				end

				arg_437_1.text_.text = var_440_34
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012106", "story_v_out_317012.awb") ~= 0 then
					local var_440_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012106", "story_v_out_317012.awb") / 1000

					if var_440_38 + var_440_30 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_38 + var_440_30
					end

					if var_440_33.prefab_name ~= "" and arg_437_1.actors_[var_440_33.prefab_name] ~= nil then
						local var_440_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_33.prefab_name].transform, "story_v_out_317012", "317012106", "story_v_out_317012.awb")

						arg_437_1:RecordAudio("317012106", var_440_39)
						arg_437_1:RecordAudio("317012106", var_440_39)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_317012", "317012106", "story_v_out_317012.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_317012", "317012106", "story_v_out_317012.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_40 = math.max(var_440_31, arg_437_1.talkMaxDuration)

			if var_440_30 <= arg_437_1.time_ and arg_437_1.time_ < var_440_30 + var_440_40 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_30) / var_440_40

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_30 + var_440_40 and arg_437_1.time_ < var_440_30 + var_440_40 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play317012107 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 317012107
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play317012108(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["2078ui_story"]
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 and arg_441_1.var_.characterEffect2078ui_story == nil then
				arg_441_1.var_.characterEffect2078ui_story = var_444_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_2 = 0.200000002980232

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2

				if arg_441_1.var_.characterEffect2078ui_story then
					local var_444_4 = Mathf.Lerp(0, 0.5, var_444_3)

					arg_441_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_441_1.var_.characterEffect2078ui_story.fillRatio = var_444_4
				end
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 and arg_441_1.var_.characterEffect2078ui_story then
				local var_444_5 = 0.5

				arg_441_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_441_1.var_.characterEffect2078ui_story.fillRatio = var_444_5
			end

			local var_444_6 = 0
			local var_444_7 = 0.9

			if var_444_6 < arg_441_1.time_ and arg_441_1.time_ <= var_444_6 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, false)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_8 = arg_441_1:GetWordFromCfg(317012107)
				local var_444_9 = arg_441_1:FormatText(var_444_8.content)

				arg_441_1.text_.text = var_444_9

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_10 = 36
				local var_444_11 = utf8.len(var_444_9)
				local var_444_12 = var_444_10 <= 0 and var_444_7 or var_444_7 * (var_444_11 / var_444_10)

				if var_444_12 > 0 and var_444_7 < var_444_12 then
					arg_441_1.talkMaxDuration = var_444_12

					if var_444_12 + var_444_6 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_12 + var_444_6
					end
				end

				arg_441_1.text_.text = var_444_9
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)
				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_13 = math.max(var_444_7, arg_441_1.talkMaxDuration)

			if var_444_6 <= arg_441_1.time_ and arg_441_1.time_ < var_444_6 + var_444_13 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_6) / var_444_13

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_6 + var_444_13 and arg_441_1.time_ < var_444_6 + var_444_13 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play317012108 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 317012108
		arg_445_1.duration_ = 8.833

		local var_445_0 = {
			zh = 7.533,
			ja = 8.833
		}
		local var_445_1 = manager.audio:GetLocalizationFlag()

		if var_445_0[var_445_1] ~= nil then
			arg_445_1.duration_ = var_445_0[var_445_1]
		end

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play317012109(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["2078ui_story"].transform
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 then
				arg_445_1.var_.moveOldPos2078ui_story = var_448_0.localPosition
			end

			local var_448_2 = 0.001

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2
				local var_448_4 = Vector3.New(0, 100, 0)

				var_448_0.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos2078ui_story, var_448_4, var_448_3)

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

			local var_448_9 = arg_445_1.actors_["2078ui_story"]
			local var_448_10 = 0

			if var_448_10 < arg_445_1.time_ and arg_445_1.time_ <= var_448_10 + arg_448_0 and arg_445_1.var_.characterEffect2078ui_story == nil then
				arg_445_1.var_.characterEffect2078ui_story = var_448_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_11 = 0.200000002980232

			if var_448_10 <= arg_445_1.time_ and arg_445_1.time_ < var_448_10 + var_448_11 then
				local var_448_12 = (arg_445_1.time_ - var_448_10) / var_448_11

				if arg_445_1.var_.characterEffect2078ui_story then
					local var_448_13 = Mathf.Lerp(0, 0.5, var_448_12)

					arg_445_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_445_1.var_.characterEffect2078ui_story.fillRatio = var_448_13
				end
			end

			if arg_445_1.time_ >= var_448_10 + var_448_11 and arg_445_1.time_ < var_448_10 + var_448_11 + arg_448_0 and arg_445_1.var_.characterEffect2078ui_story then
				local var_448_14 = 0.5

				arg_445_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_445_1.var_.characterEffect2078ui_story.fillRatio = var_448_14
			end

			local var_448_15 = arg_445_1.actors_["1015ui_story"].transform
			local var_448_16 = 0

			if var_448_16 < arg_445_1.time_ and arg_445_1.time_ <= var_448_16 + arg_448_0 then
				arg_445_1.var_.moveOldPos1015ui_story = var_448_15.localPosition
			end

			local var_448_17 = 0.001

			if var_448_16 <= arg_445_1.time_ and arg_445_1.time_ < var_448_16 + var_448_17 then
				local var_448_18 = (arg_445_1.time_ - var_448_16) / var_448_17
				local var_448_19 = Vector3.New(0, -1.15, -6.2)

				var_448_15.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos1015ui_story, var_448_19, var_448_18)

				local var_448_20 = manager.ui.mainCamera.transform.position - var_448_15.position

				var_448_15.forward = Vector3.New(var_448_20.x, var_448_20.y, var_448_20.z)

				local var_448_21 = var_448_15.localEulerAngles

				var_448_21.z = 0
				var_448_21.x = 0
				var_448_15.localEulerAngles = var_448_21
			end

			if arg_445_1.time_ >= var_448_16 + var_448_17 and arg_445_1.time_ < var_448_16 + var_448_17 + arg_448_0 then
				var_448_15.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_448_22 = manager.ui.mainCamera.transform.position - var_448_15.position

				var_448_15.forward = Vector3.New(var_448_22.x, var_448_22.y, var_448_22.z)

				local var_448_23 = var_448_15.localEulerAngles

				var_448_23.z = 0
				var_448_23.x = 0
				var_448_15.localEulerAngles = var_448_23
			end

			local var_448_24 = arg_445_1.actors_["1015ui_story"]
			local var_448_25 = 0

			if var_448_25 < arg_445_1.time_ and arg_445_1.time_ <= var_448_25 + arg_448_0 and arg_445_1.var_.characterEffect1015ui_story == nil then
				arg_445_1.var_.characterEffect1015ui_story = var_448_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_26 = 0.200000002980232

			if var_448_25 <= arg_445_1.time_ and arg_445_1.time_ < var_448_25 + var_448_26 then
				local var_448_27 = (arg_445_1.time_ - var_448_25) / var_448_26

				if arg_445_1.var_.characterEffect1015ui_story then
					arg_445_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_445_1.time_ >= var_448_25 + var_448_26 and arg_445_1.time_ < var_448_25 + var_448_26 + arg_448_0 and arg_445_1.var_.characterEffect1015ui_story then
				arg_445_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_448_28 = 0

			if var_448_28 < arg_445_1.time_ and arg_445_1.time_ <= var_448_28 + arg_448_0 then
				arg_445_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_448_29 = 0

			if var_448_29 < arg_445_1.time_ and arg_445_1.time_ <= var_448_29 + arg_448_0 then
				arg_445_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_448_30 = 0
			local var_448_31 = 0.975

			if var_448_30 < arg_445_1.time_ and arg_445_1.time_ <= var_448_30 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_32 = arg_445_1:FormatText(StoryNameCfg[479].name)

				arg_445_1.leftNameTxt_.text = var_448_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_33 = arg_445_1:GetWordFromCfg(317012108)
				local var_448_34 = arg_445_1:FormatText(var_448_33.content)

				arg_445_1.text_.text = var_448_34

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_35 = 39
				local var_448_36 = utf8.len(var_448_34)
				local var_448_37 = var_448_35 <= 0 and var_448_31 or var_448_31 * (var_448_36 / var_448_35)

				if var_448_37 > 0 and var_448_31 < var_448_37 then
					arg_445_1.talkMaxDuration = var_448_37

					if var_448_37 + var_448_30 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_37 + var_448_30
					end
				end

				arg_445_1.text_.text = var_448_34
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012108", "story_v_out_317012.awb") ~= 0 then
					local var_448_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012108", "story_v_out_317012.awb") / 1000

					if var_448_38 + var_448_30 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_38 + var_448_30
					end

					if var_448_33.prefab_name ~= "" and arg_445_1.actors_[var_448_33.prefab_name] ~= nil then
						local var_448_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_33.prefab_name].transform, "story_v_out_317012", "317012108", "story_v_out_317012.awb")

						arg_445_1:RecordAudio("317012108", var_448_39)
						arg_445_1:RecordAudio("317012108", var_448_39)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_317012", "317012108", "story_v_out_317012.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_317012", "317012108", "story_v_out_317012.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_40 = math.max(var_448_31, arg_445_1.talkMaxDuration)

			if var_448_30 <= arg_445_1.time_ and arg_445_1.time_ < var_448_30 + var_448_40 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_30) / var_448_40

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_30 + var_448_40 and arg_445_1.time_ < var_448_30 + var_448_40 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play317012109 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 317012109
		arg_449_1.duration_ = 1

		local var_449_0 = {
			zh = 1,
			ja = 0.999999999999
		}
		local var_449_1 = manager.audio:GetLocalizationFlag()

		if var_449_0[var_449_1] ~= nil then
			arg_449_1.duration_ = var_449_0[var_449_1]
		end

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play317012110(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["1015ui_story"].transform
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 then
				arg_449_1.var_.moveOldPos1015ui_story = var_452_0.localPosition
			end

			local var_452_2 = 0.001

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_2 then
				local var_452_3 = (arg_449_1.time_ - var_452_1) / var_452_2
				local var_452_4 = Vector3.New(0, 100, 0)

				var_452_0.localPosition = Vector3.Lerp(arg_449_1.var_.moveOldPos1015ui_story, var_452_4, var_452_3)

				local var_452_5 = manager.ui.mainCamera.transform.position - var_452_0.position

				var_452_0.forward = Vector3.New(var_452_5.x, var_452_5.y, var_452_5.z)

				local var_452_6 = var_452_0.localEulerAngles

				var_452_6.z = 0
				var_452_6.x = 0
				var_452_0.localEulerAngles = var_452_6
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 then
				var_452_0.localPosition = Vector3.New(0, 100, 0)

				local var_452_7 = manager.ui.mainCamera.transform.position - var_452_0.position

				var_452_0.forward = Vector3.New(var_452_7.x, var_452_7.y, var_452_7.z)

				local var_452_8 = var_452_0.localEulerAngles

				var_452_8.z = 0
				var_452_8.x = 0
				var_452_0.localEulerAngles = var_452_8
			end

			local var_452_9 = arg_449_1.actors_["1015ui_story"]
			local var_452_10 = 0

			if var_452_10 < arg_449_1.time_ and arg_449_1.time_ <= var_452_10 + arg_452_0 and arg_449_1.var_.characterEffect1015ui_story == nil then
				arg_449_1.var_.characterEffect1015ui_story = var_452_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_11 = 0.200000002980232

			if var_452_10 <= arg_449_1.time_ and arg_449_1.time_ < var_452_10 + var_452_11 then
				local var_452_12 = (arg_449_1.time_ - var_452_10) / var_452_11

				if arg_449_1.var_.characterEffect1015ui_story then
					local var_452_13 = Mathf.Lerp(0, 0.5, var_452_12)

					arg_449_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_449_1.var_.characterEffect1015ui_story.fillRatio = var_452_13
				end
			end

			if arg_449_1.time_ >= var_452_10 + var_452_11 and arg_449_1.time_ < var_452_10 + var_452_11 + arg_452_0 and arg_449_1.var_.characterEffect1015ui_story then
				local var_452_14 = 0.5

				arg_449_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_449_1.var_.characterEffect1015ui_story.fillRatio = var_452_14
			end

			local var_452_15 = arg_449_1.actors_["2078ui_story"].transform
			local var_452_16 = 0

			if var_452_16 < arg_449_1.time_ and arg_449_1.time_ <= var_452_16 + arg_452_0 then
				arg_449_1.var_.moveOldPos2078ui_story = var_452_15.localPosition
			end

			local var_452_17 = 0.001

			if var_452_16 <= arg_449_1.time_ and arg_449_1.time_ < var_452_16 + var_452_17 then
				local var_452_18 = (arg_449_1.time_ - var_452_16) / var_452_17
				local var_452_19 = Vector3.New(0, -1.28, -5.6)

				var_452_15.localPosition = Vector3.Lerp(arg_449_1.var_.moveOldPos2078ui_story, var_452_19, var_452_18)

				local var_452_20 = manager.ui.mainCamera.transform.position - var_452_15.position

				var_452_15.forward = Vector3.New(var_452_20.x, var_452_20.y, var_452_20.z)

				local var_452_21 = var_452_15.localEulerAngles

				var_452_21.z = 0
				var_452_21.x = 0
				var_452_15.localEulerAngles = var_452_21
			end

			if arg_449_1.time_ >= var_452_16 + var_452_17 and arg_449_1.time_ < var_452_16 + var_452_17 + arg_452_0 then
				var_452_15.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_452_22 = manager.ui.mainCamera.transform.position - var_452_15.position

				var_452_15.forward = Vector3.New(var_452_22.x, var_452_22.y, var_452_22.z)

				local var_452_23 = var_452_15.localEulerAngles

				var_452_23.z = 0
				var_452_23.x = 0
				var_452_15.localEulerAngles = var_452_23
			end

			local var_452_24 = arg_449_1.actors_["2078ui_story"]
			local var_452_25 = 0

			if var_452_25 < arg_449_1.time_ and arg_449_1.time_ <= var_452_25 + arg_452_0 and arg_449_1.var_.characterEffect2078ui_story == nil then
				arg_449_1.var_.characterEffect2078ui_story = var_452_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_26 = 0.200000002980232

			if var_452_25 <= arg_449_1.time_ and arg_449_1.time_ < var_452_25 + var_452_26 then
				local var_452_27 = (arg_449_1.time_ - var_452_25) / var_452_26

				if arg_449_1.var_.characterEffect2078ui_story then
					arg_449_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_449_1.time_ >= var_452_25 + var_452_26 and arg_449_1.time_ < var_452_25 + var_452_26 + arg_452_0 and arg_449_1.var_.characterEffect2078ui_story then
				arg_449_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_452_28 = 0

			if var_452_28 < arg_449_1.time_ and arg_449_1.time_ <= var_452_28 + arg_452_0 then
				arg_449_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_452_29 = 0

			if var_452_29 < arg_449_1.time_ and arg_449_1.time_ <= var_452_29 + arg_452_0 then
				arg_449_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_452_30 = 0
			local var_452_31 = 0.075

			if var_452_30 < arg_449_1.time_ and arg_449_1.time_ <= var_452_30 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_32 = arg_449_1:FormatText(StoryNameCfg[528].name)

				arg_449_1.leftNameTxt_.text = var_452_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_33 = arg_449_1:GetWordFromCfg(317012109)
				local var_452_34 = arg_449_1:FormatText(var_452_33.content)

				arg_449_1.text_.text = var_452_34

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_35 = 3
				local var_452_36 = utf8.len(var_452_34)
				local var_452_37 = var_452_35 <= 0 and var_452_31 or var_452_31 * (var_452_36 / var_452_35)

				if var_452_37 > 0 and var_452_31 < var_452_37 then
					arg_449_1.talkMaxDuration = var_452_37

					if var_452_37 + var_452_30 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_37 + var_452_30
					end
				end

				arg_449_1.text_.text = var_452_34
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012109", "story_v_out_317012.awb") ~= 0 then
					local var_452_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012109", "story_v_out_317012.awb") / 1000

					if var_452_38 + var_452_30 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_38 + var_452_30
					end

					if var_452_33.prefab_name ~= "" and arg_449_1.actors_[var_452_33.prefab_name] ~= nil then
						local var_452_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_33.prefab_name].transform, "story_v_out_317012", "317012109", "story_v_out_317012.awb")

						arg_449_1:RecordAudio("317012109", var_452_39)
						arg_449_1:RecordAudio("317012109", var_452_39)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_317012", "317012109", "story_v_out_317012.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_317012", "317012109", "story_v_out_317012.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_40 = math.max(var_452_31, arg_449_1.talkMaxDuration)

			if var_452_30 <= arg_449_1.time_ and arg_449_1.time_ < var_452_30 + var_452_40 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_30) / var_452_40

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_30 + var_452_40 and arg_449_1.time_ < var_452_30 + var_452_40 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play317012110 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 317012110
		arg_453_1.duration_ = 5

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play317012111(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["2078ui_story"]
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 and arg_453_1.var_.characterEffect2078ui_story == nil then
				arg_453_1.var_.characterEffect2078ui_story = var_456_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_2 = 0.200000002980232

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2

				if arg_453_1.var_.characterEffect2078ui_story then
					local var_456_4 = Mathf.Lerp(0, 0.5, var_456_3)

					arg_453_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_453_1.var_.characterEffect2078ui_story.fillRatio = var_456_4
				end
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 and arg_453_1.var_.characterEffect2078ui_story then
				local var_456_5 = 0.5

				arg_453_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_453_1.var_.characterEffect2078ui_story.fillRatio = var_456_5
			end

			local var_456_6 = 0
			local var_456_7 = 0.625

			if var_456_6 < arg_453_1.time_ and arg_453_1.time_ <= var_456_6 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, false)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_8 = arg_453_1:GetWordFromCfg(317012110)
				local var_456_9 = arg_453_1:FormatText(var_456_8.content)

				arg_453_1.text_.text = var_456_9

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_10 = 25
				local var_456_11 = utf8.len(var_456_9)
				local var_456_12 = var_456_10 <= 0 and var_456_7 or var_456_7 * (var_456_11 / var_456_10)

				if var_456_12 > 0 and var_456_7 < var_456_12 then
					arg_453_1.talkMaxDuration = var_456_12

					if var_456_12 + var_456_6 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_12 + var_456_6
					end
				end

				arg_453_1.text_.text = var_456_9
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)
				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_13 = math.max(var_456_7, arg_453_1.talkMaxDuration)

			if var_456_6 <= arg_453_1.time_ and arg_453_1.time_ < var_456_6 + var_456_13 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_6) / var_456_13

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_6 + var_456_13 and arg_453_1.time_ < var_456_6 + var_456_13 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play317012111 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 317012111
		arg_457_1.duration_ = 5.3

		local var_457_0 = {
			zh = 1.333,
			ja = 5.3
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
				arg_457_0:Play317012112(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["2078ui_story"].transform
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 then
				arg_457_1.var_.moveOldPos2078ui_story = var_460_0.localPosition
			end

			local var_460_2 = 0.001

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2
				local var_460_4 = Vector3.New(0, 100, 0)

				var_460_0.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos2078ui_story, var_460_4, var_460_3)

				local var_460_5 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_5.x, var_460_5.y, var_460_5.z)

				local var_460_6 = var_460_0.localEulerAngles

				var_460_6.z = 0
				var_460_6.x = 0
				var_460_0.localEulerAngles = var_460_6
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 then
				var_460_0.localPosition = Vector3.New(0, 100, 0)

				local var_460_7 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_7.x, var_460_7.y, var_460_7.z)

				local var_460_8 = var_460_0.localEulerAngles

				var_460_8.z = 0
				var_460_8.x = 0
				var_460_0.localEulerAngles = var_460_8
			end

			local var_460_9 = arg_457_1.actors_["2078ui_story"]
			local var_460_10 = 0

			if var_460_10 < arg_457_1.time_ and arg_457_1.time_ <= var_460_10 + arg_460_0 and arg_457_1.var_.characterEffect2078ui_story == nil then
				arg_457_1.var_.characterEffect2078ui_story = var_460_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_11 = 0.200000002980232

			if var_460_10 <= arg_457_1.time_ and arg_457_1.time_ < var_460_10 + var_460_11 then
				local var_460_12 = (arg_457_1.time_ - var_460_10) / var_460_11

				if arg_457_1.var_.characterEffect2078ui_story then
					local var_460_13 = Mathf.Lerp(0, 0.5, var_460_12)

					arg_457_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_457_1.var_.characterEffect2078ui_story.fillRatio = var_460_13
				end
			end

			if arg_457_1.time_ >= var_460_10 + var_460_11 and arg_457_1.time_ < var_460_10 + var_460_11 + arg_460_0 and arg_457_1.var_.characterEffect2078ui_story then
				local var_460_14 = 0.5

				arg_457_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_457_1.var_.characterEffect2078ui_story.fillRatio = var_460_14
			end

			local var_460_15 = arg_457_1.actors_["1015ui_story"].transform
			local var_460_16 = 0

			if var_460_16 < arg_457_1.time_ and arg_457_1.time_ <= var_460_16 + arg_460_0 then
				arg_457_1.var_.moveOldPos1015ui_story = var_460_15.localPosition
			end

			local var_460_17 = 0.001

			if var_460_16 <= arg_457_1.time_ and arg_457_1.time_ < var_460_16 + var_460_17 then
				local var_460_18 = (arg_457_1.time_ - var_460_16) / var_460_17
				local var_460_19 = Vector3.New(0, -1.15, -6.2)

				var_460_15.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos1015ui_story, var_460_19, var_460_18)

				local var_460_20 = manager.ui.mainCamera.transform.position - var_460_15.position

				var_460_15.forward = Vector3.New(var_460_20.x, var_460_20.y, var_460_20.z)

				local var_460_21 = var_460_15.localEulerAngles

				var_460_21.z = 0
				var_460_21.x = 0
				var_460_15.localEulerAngles = var_460_21
			end

			if arg_457_1.time_ >= var_460_16 + var_460_17 and arg_457_1.time_ < var_460_16 + var_460_17 + arg_460_0 then
				var_460_15.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_460_22 = manager.ui.mainCamera.transform.position - var_460_15.position

				var_460_15.forward = Vector3.New(var_460_22.x, var_460_22.y, var_460_22.z)

				local var_460_23 = var_460_15.localEulerAngles

				var_460_23.z = 0
				var_460_23.x = 0
				var_460_15.localEulerAngles = var_460_23
			end

			local var_460_24 = arg_457_1.actors_["1015ui_story"]
			local var_460_25 = 0

			if var_460_25 < arg_457_1.time_ and arg_457_1.time_ <= var_460_25 + arg_460_0 and arg_457_1.var_.characterEffect1015ui_story == nil then
				arg_457_1.var_.characterEffect1015ui_story = var_460_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_26 = 0.200000002980232

			if var_460_25 <= arg_457_1.time_ and arg_457_1.time_ < var_460_25 + var_460_26 then
				local var_460_27 = (arg_457_1.time_ - var_460_25) / var_460_26

				if arg_457_1.var_.characterEffect1015ui_story then
					arg_457_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_457_1.time_ >= var_460_25 + var_460_26 and arg_457_1.time_ < var_460_25 + var_460_26 + arg_460_0 and arg_457_1.var_.characterEffect1015ui_story then
				arg_457_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_460_28 = 0

			if var_460_28 < arg_457_1.time_ and arg_457_1.time_ <= var_460_28 + arg_460_0 then
				arg_457_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_460_29 = 0

			if var_460_29 < arg_457_1.time_ and arg_457_1.time_ <= var_460_29 + arg_460_0 then
				arg_457_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_460_30 = 0
			local var_460_31 = 0.125

			if var_460_30 < arg_457_1.time_ and arg_457_1.time_ <= var_460_30 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_32 = arg_457_1:FormatText(StoryNameCfg[479].name)

				arg_457_1.leftNameTxt_.text = var_460_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_33 = arg_457_1:GetWordFromCfg(317012111)
				local var_460_34 = arg_457_1:FormatText(var_460_33.content)

				arg_457_1.text_.text = var_460_34

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_35 = 5
				local var_460_36 = utf8.len(var_460_34)
				local var_460_37 = var_460_35 <= 0 and var_460_31 or var_460_31 * (var_460_36 / var_460_35)

				if var_460_37 > 0 and var_460_31 < var_460_37 then
					arg_457_1.talkMaxDuration = var_460_37

					if var_460_37 + var_460_30 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_37 + var_460_30
					end
				end

				arg_457_1.text_.text = var_460_34
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012111", "story_v_out_317012.awb") ~= 0 then
					local var_460_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012111", "story_v_out_317012.awb") / 1000

					if var_460_38 + var_460_30 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_38 + var_460_30
					end

					if var_460_33.prefab_name ~= "" and arg_457_1.actors_[var_460_33.prefab_name] ~= nil then
						local var_460_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_33.prefab_name].transform, "story_v_out_317012", "317012111", "story_v_out_317012.awb")

						arg_457_1:RecordAudio("317012111", var_460_39)
						arg_457_1:RecordAudio("317012111", var_460_39)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_317012", "317012111", "story_v_out_317012.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_317012", "317012111", "story_v_out_317012.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_40 = math.max(var_460_31, arg_457_1.talkMaxDuration)

			if var_460_30 <= arg_457_1.time_ and arg_457_1.time_ < var_460_30 + var_460_40 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_30) / var_460_40

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_30 + var_460_40 and arg_457_1.time_ < var_460_30 + var_460_40 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play317012112 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 317012112
		arg_461_1.duration_ = 5

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play317012113(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1015ui_story"]
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 and arg_461_1.var_.characterEffect1015ui_story == nil then
				arg_461_1.var_.characterEffect1015ui_story = var_464_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_2 = 0.200000002980232

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2

				if arg_461_1.var_.characterEffect1015ui_story then
					local var_464_4 = Mathf.Lerp(0, 0.5, var_464_3)

					arg_461_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_461_1.var_.characterEffect1015ui_story.fillRatio = var_464_4
				end
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 and arg_461_1.var_.characterEffect1015ui_story then
				local var_464_5 = 0.5

				arg_461_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_461_1.var_.characterEffect1015ui_story.fillRatio = var_464_5
			end

			local var_464_6 = 0
			local var_464_7 = 1.175

			if var_464_6 < arg_461_1.time_ and arg_461_1.time_ <= var_464_6 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, false)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_8 = arg_461_1:GetWordFromCfg(317012112)
				local var_464_9 = arg_461_1:FormatText(var_464_8.content)

				arg_461_1.text_.text = var_464_9

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_10 = 47
				local var_464_11 = utf8.len(var_464_9)
				local var_464_12 = var_464_10 <= 0 and var_464_7 or var_464_7 * (var_464_11 / var_464_10)

				if var_464_12 > 0 and var_464_7 < var_464_12 then
					arg_461_1.talkMaxDuration = var_464_12

					if var_464_12 + var_464_6 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_12 + var_464_6
					end
				end

				arg_461_1.text_.text = var_464_9
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)
				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_13 = math.max(var_464_7, arg_461_1.talkMaxDuration)

			if var_464_6 <= arg_461_1.time_ and arg_461_1.time_ < var_464_6 + var_464_13 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_6) / var_464_13

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_6 + var_464_13 and arg_461_1.time_ < var_464_6 + var_464_13 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play317012113 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 317012113
		arg_465_1.duration_ = 11.666

		local var_465_0 = {
			zh = 11.666,
			ja = 3.466
		}
		local var_465_1 = manager.audio:GetLocalizationFlag()

		if var_465_0[var_465_1] ~= nil then
			arg_465_1.duration_ = var_465_0[var_465_1]
		end

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play317012114(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["2078ui_story"].transform
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 then
				arg_465_1.var_.moveOldPos2078ui_story = var_468_0.localPosition
			end

			local var_468_2 = 0.001

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2
				local var_468_4 = Vector3.New(0, -1.28, -5.6)

				var_468_0.localPosition = Vector3.Lerp(arg_465_1.var_.moveOldPos2078ui_story, var_468_4, var_468_3)

				local var_468_5 = manager.ui.mainCamera.transform.position - var_468_0.position

				var_468_0.forward = Vector3.New(var_468_5.x, var_468_5.y, var_468_5.z)

				local var_468_6 = var_468_0.localEulerAngles

				var_468_6.z = 0
				var_468_6.x = 0
				var_468_0.localEulerAngles = var_468_6
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 then
				var_468_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_468_7 = manager.ui.mainCamera.transform.position - var_468_0.position

				var_468_0.forward = Vector3.New(var_468_7.x, var_468_7.y, var_468_7.z)

				local var_468_8 = var_468_0.localEulerAngles

				var_468_8.z = 0
				var_468_8.x = 0
				var_468_0.localEulerAngles = var_468_8
			end

			local var_468_9 = arg_465_1.actors_["2078ui_story"]
			local var_468_10 = 0

			if var_468_10 < arg_465_1.time_ and arg_465_1.time_ <= var_468_10 + arg_468_0 and arg_465_1.var_.characterEffect2078ui_story == nil then
				arg_465_1.var_.characterEffect2078ui_story = var_468_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_11 = 0.200000002980232

			if var_468_10 <= arg_465_1.time_ and arg_465_1.time_ < var_468_10 + var_468_11 then
				local var_468_12 = (arg_465_1.time_ - var_468_10) / var_468_11

				if arg_465_1.var_.characterEffect2078ui_story then
					arg_465_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_465_1.time_ >= var_468_10 + var_468_11 and arg_465_1.time_ < var_468_10 + var_468_11 + arg_468_0 and arg_465_1.var_.characterEffect2078ui_story then
				arg_465_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_468_13 = 0

			if var_468_13 < arg_465_1.time_ and arg_465_1.time_ <= var_468_13 + arg_468_0 then
				arg_465_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_468_14 = 0

			if var_468_14 < arg_465_1.time_ and arg_465_1.time_ <= var_468_14 + arg_468_0 then
				arg_465_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_468_15 = arg_465_1.actors_["1015ui_story"].transform
			local var_468_16 = 0

			if var_468_16 < arg_465_1.time_ and arg_465_1.time_ <= var_468_16 + arg_468_0 then
				arg_465_1.var_.moveOldPos1015ui_story = var_468_15.localPosition
			end

			local var_468_17 = 0.001

			if var_468_16 <= arg_465_1.time_ and arg_465_1.time_ < var_468_16 + var_468_17 then
				local var_468_18 = (arg_465_1.time_ - var_468_16) / var_468_17
				local var_468_19 = Vector3.New(0, 100, 0)

				var_468_15.localPosition = Vector3.Lerp(arg_465_1.var_.moveOldPos1015ui_story, var_468_19, var_468_18)

				local var_468_20 = manager.ui.mainCamera.transform.position - var_468_15.position

				var_468_15.forward = Vector3.New(var_468_20.x, var_468_20.y, var_468_20.z)

				local var_468_21 = var_468_15.localEulerAngles

				var_468_21.z = 0
				var_468_21.x = 0
				var_468_15.localEulerAngles = var_468_21
			end

			if arg_465_1.time_ >= var_468_16 + var_468_17 and arg_465_1.time_ < var_468_16 + var_468_17 + arg_468_0 then
				var_468_15.localPosition = Vector3.New(0, 100, 0)

				local var_468_22 = manager.ui.mainCamera.transform.position - var_468_15.position

				var_468_15.forward = Vector3.New(var_468_22.x, var_468_22.y, var_468_22.z)

				local var_468_23 = var_468_15.localEulerAngles

				var_468_23.z = 0
				var_468_23.x = 0
				var_468_15.localEulerAngles = var_468_23
			end

			local var_468_24 = arg_465_1.actors_["1015ui_story"]
			local var_468_25 = 0

			if var_468_25 < arg_465_1.time_ and arg_465_1.time_ <= var_468_25 + arg_468_0 and arg_465_1.var_.characterEffect1015ui_story == nil then
				arg_465_1.var_.characterEffect1015ui_story = var_468_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_26 = 0.200000002980232

			if var_468_25 <= arg_465_1.time_ and arg_465_1.time_ < var_468_25 + var_468_26 then
				local var_468_27 = (arg_465_1.time_ - var_468_25) / var_468_26

				if arg_465_1.var_.characterEffect1015ui_story then
					local var_468_28 = Mathf.Lerp(0, 0.5, var_468_27)

					arg_465_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_465_1.var_.characterEffect1015ui_story.fillRatio = var_468_28
				end
			end

			if arg_465_1.time_ >= var_468_25 + var_468_26 and arg_465_1.time_ < var_468_25 + var_468_26 + arg_468_0 and arg_465_1.var_.characterEffect1015ui_story then
				local var_468_29 = 0.5

				arg_465_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_465_1.var_.characterEffect1015ui_story.fillRatio = var_468_29
			end

			local var_468_30 = 0
			local var_468_31 = 1.475

			if var_468_30 < arg_465_1.time_ and arg_465_1.time_ <= var_468_30 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_32 = arg_465_1:FormatText(StoryNameCfg[528].name)

				arg_465_1.leftNameTxt_.text = var_468_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_33 = arg_465_1:GetWordFromCfg(317012113)
				local var_468_34 = arg_465_1:FormatText(var_468_33.content)

				arg_465_1.text_.text = var_468_34

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_35 = 59
				local var_468_36 = utf8.len(var_468_34)
				local var_468_37 = var_468_35 <= 0 and var_468_31 or var_468_31 * (var_468_36 / var_468_35)

				if var_468_37 > 0 and var_468_31 < var_468_37 then
					arg_465_1.talkMaxDuration = var_468_37

					if var_468_37 + var_468_30 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_37 + var_468_30
					end
				end

				arg_465_1.text_.text = var_468_34
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012113", "story_v_out_317012.awb") ~= 0 then
					local var_468_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012113", "story_v_out_317012.awb") / 1000

					if var_468_38 + var_468_30 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_38 + var_468_30
					end

					if var_468_33.prefab_name ~= "" and arg_465_1.actors_[var_468_33.prefab_name] ~= nil then
						local var_468_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_33.prefab_name].transform, "story_v_out_317012", "317012113", "story_v_out_317012.awb")

						arg_465_1:RecordAudio("317012113", var_468_39)
						arg_465_1:RecordAudio("317012113", var_468_39)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_317012", "317012113", "story_v_out_317012.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_317012", "317012113", "story_v_out_317012.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_40 = math.max(var_468_31, arg_465_1.talkMaxDuration)

			if var_468_30 <= arg_465_1.time_ and arg_465_1.time_ < var_468_30 + var_468_40 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_30) / var_468_40

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_30 + var_468_40 and arg_465_1.time_ < var_468_30 + var_468_40 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play317012114 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 317012114
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play317012115(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["2078ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect2078ui_story == nil then
				arg_469_1.var_.characterEffect2078ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.200000002980232

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect2078ui_story then
					local var_472_4 = Mathf.Lerp(0, 0.5, var_472_3)

					arg_469_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_469_1.var_.characterEffect2078ui_story.fillRatio = var_472_4
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect2078ui_story then
				local var_472_5 = 0.5

				arg_469_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_469_1.var_.characterEffect2078ui_story.fillRatio = var_472_5
			end

			local var_472_6 = 0
			local var_472_7 = 0.625

			if var_472_6 < arg_469_1.time_ and arg_469_1.time_ <= var_472_6 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, false)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_8 = arg_469_1:GetWordFromCfg(317012114)
				local var_472_9 = arg_469_1:FormatText(var_472_8.content)

				arg_469_1.text_.text = var_472_9

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_10 = 25
				local var_472_11 = utf8.len(var_472_9)
				local var_472_12 = var_472_10 <= 0 and var_472_7 or var_472_7 * (var_472_11 / var_472_10)

				if var_472_12 > 0 and var_472_7 < var_472_12 then
					arg_469_1.talkMaxDuration = var_472_12

					if var_472_12 + var_472_6 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_12 + var_472_6
					end
				end

				arg_469_1.text_.text = var_472_9
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_13 = math.max(var_472_7, arg_469_1.talkMaxDuration)

			if var_472_6 <= arg_469_1.time_ and arg_469_1.time_ < var_472_6 + var_472_13 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_6) / var_472_13

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_6 + var_472_13 and arg_469_1.time_ < var_472_6 + var_472_13 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play317012115 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 317012115
		arg_473_1.duration_ = 4.066

		local var_473_0 = {
			zh = 3.866,
			ja = 4.066
		}
		local var_473_1 = manager.audio:GetLocalizationFlag()

		if var_473_0[var_473_1] ~= nil then
			arg_473_1.duration_ = var_473_0[var_473_1]
		end

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play317012116(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["2078ui_story"].transform
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 then
				arg_473_1.var_.moveOldPos2078ui_story = var_476_0.localPosition
			end

			local var_476_2 = 0.001

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2
				local var_476_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_476_0.localPosition = Vector3.Lerp(arg_473_1.var_.moveOldPos2078ui_story, var_476_4, var_476_3)

				local var_476_5 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_5.x, var_476_5.y, var_476_5.z)

				local var_476_6 = var_476_0.localEulerAngles

				var_476_6.z = 0
				var_476_6.x = 0
				var_476_0.localEulerAngles = var_476_6
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 then
				var_476_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_476_7 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_7.x, var_476_7.y, var_476_7.z)

				local var_476_8 = var_476_0.localEulerAngles

				var_476_8.z = 0
				var_476_8.x = 0
				var_476_0.localEulerAngles = var_476_8
			end

			local var_476_9 = arg_473_1.actors_["2078ui_story"]
			local var_476_10 = 0

			if var_476_10 < arg_473_1.time_ and arg_473_1.time_ <= var_476_10 + arg_476_0 and arg_473_1.var_.characterEffect2078ui_story == nil then
				arg_473_1.var_.characterEffect2078ui_story = var_476_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_11 = 0.200000002980232

			if var_476_10 <= arg_473_1.time_ and arg_473_1.time_ < var_476_10 + var_476_11 then
				local var_476_12 = (arg_473_1.time_ - var_476_10) / var_476_11

				if arg_473_1.var_.characterEffect2078ui_story then
					local var_476_13 = Mathf.Lerp(0, 0.5, var_476_12)

					arg_473_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_473_1.var_.characterEffect2078ui_story.fillRatio = var_476_13
				end
			end

			if arg_473_1.time_ >= var_476_10 + var_476_11 and arg_473_1.time_ < var_476_10 + var_476_11 + arg_476_0 and arg_473_1.var_.characterEffect2078ui_story then
				local var_476_14 = 0.5

				arg_473_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_473_1.var_.characterEffect2078ui_story.fillRatio = var_476_14
			end

			local var_476_15 = arg_473_1.actors_["2079ui_story"].transform
			local var_476_16 = 0

			if var_476_16 < arg_473_1.time_ and arg_473_1.time_ <= var_476_16 + arg_476_0 then
				arg_473_1.var_.moveOldPos2079ui_story = var_476_15.localPosition
			end

			local var_476_17 = 0.001

			if var_476_16 <= arg_473_1.time_ and arg_473_1.time_ < var_476_16 + var_476_17 then
				local var_476_18 = (arg_473_1.time_ - var_476_16) / var_476_17
				local var_476_19 = Vector3.New(0.7, -1.28, -5.6)

				var_476_15.localPosition = Vector3.Lerp(arg_473_1.var_.moveOldPos2079ui_story, var_476_19, var_476_18)

				local var_476_20 = manager.ui.mainCamera.transform.position - var_476_15.position

				var_476_15.forward = Vector3.New(var_476_20.x, var_476_20.y, var_476_20.z)

				local var_476_21 = var_476_15.localEulerAngles

				var_476_21.z = 0
				var_476_21.x = 0
				var_476_15.localEulerAngles = var_476_21
			end

			if arg_473_1.time_ >= var_476_16 + var_476_17 and arg_473_1.time_ < var_476_16 + var_476_17 + arg_476_0 then
				var_476_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_476_22 = manager.ui.mainCamera.transform.position - var_476_15.position

				var_476_15.forward = Vector3.New(var_476_22.x, var_476_22.y, var_476_22.z)

				local var_476_23 = var_476_15.localEulerAngles

				var_476_23.z = 0
				var_476_23.x = 0
				var_476_15.localEulerAngles = var_476_23
			end

			local var_476_24 = arg_473_1.actors_["2079ui_story"]
			local var_476_25 = 0

			if var_476_25 < arg_473_1.time_ and arg_473_1.time_ <= var_476_25 + arg_476_0 and arg_473_1.var_.characterEffect2079ui_story == nil then
				arg_473_1.var_.characterEffect2079ui_story = var_476_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_26 = 0.200000002980232

			if var_476_25 <= arg_473_1.time_ and arg_473_1.time_ < var_476_25 + var_476_26 then
				local var_476_27 = (arg_473_1.time_ - var_476_25) / var_476_26

				if arg_473_1.var_.characterEffect2079ui_story then
					arg_473_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_473_1.time_ >= var_476_25 + var_476_26 and arg_473_1.time_ < var_476_25 + var_476_26 + arg_476_0 and arg_473_1.var_.characterEffect2079ui_story then
				arg_473_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_476_28 = 0

			if var_476_28 < arg_473_1.time_ and arg_473_1.time_ <= var_476_28 + arg_476_0 then
				arg_473_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_476_29 = 0

			if var_476_29 < arg_473_1.time_ and arg_473_1.time_ <= var_476_29 + arg_476_0 then
				arg_473_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_476_30 = 0
			local var_476_31 = 0.375

			if var_476_30 < arg_473_1.time_ and arg_473_1.time_ <= var_476_30 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_32 = arg_473_1:FormatText(StoryNameCfg[529].name)

				arg_473_1.leftNameTxt_.text = var_476_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_33 = arg_473_1:GetWordFromCfg(317012115)
				local var_476_34 = arg_473_1:FormatText(var_476_33.content)

				arg_473_1.text_.text = var_476_34

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_35 = 15
				local var_476_36 = utf8.len(var_476_34)
				local var_476_37 = var_476_35 <= 0 and var_476_31 or var_476_31 * (var_476_36 / var_476_35)

				if var_476_37 > 0 and var_476_31 < var_476_37 then
					arg_473_1.talkMaxDuration = var_476_37

					if var_476_37 + var_476_30 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_37 + var_476_30
					end
				end

				arg_473_1.text_.text = var_476_34
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012115", "story_v_out_317012.awb") ~= 0 then
					local var_476_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012115", "story_v_out_317012.awb") / 1000

					if var_476_38 + var_476_30 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_38 + var_476_30
					end

					if var_476_33.prefab_name ~= "" and arg_473_1.actors_[var_476_33.prefab_name] ~= nil then
						local var_476_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_33.prefab_name].transform, "story_v_out_317012", "317012115", "story_v_out_317012.awb")

						arg_473_1:RecordAudio("317012115", var_476_39)
						arg_473_1:RecordAudio("317012115", var_476_39)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_317012", "317012115", "story_v_out_317012.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_317012", "317012115", "story_v_out_317012.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_40 = math.max(var_476_31, arg_473_1.talkMaxDuration)

			if var_476_30 <= arg_473_1.time_ and arg_473_1.time_ < var_476_30 + var_476_40 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_30) / var_476_40

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_30 + var_476_40 and arg_473_1.time_ < var_476_30 + var_476_40 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play317012116 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 317012116
		arg_477_1.duration_ = 9.366

		local var_477_0 = {
			zh = 8.133,
			ja = 9.366
		}
		local var_477_1 = manager.audio:GetLocalizationFlag()

		if var_477_0[var_477_1] ~= nil then
			arg_477_1.duration_ = var_477_0[var_477_1]
		end

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play317012117(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["2078ui_story"].transform
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.var_.moveOldPos2078ui_story = var_480_0.localPosition
			end

			local var_480_2 = 0.001

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2
				local var_480_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_480_0.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos2078ui_story, var_480_4, var_480_3)

				local var_480_5 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_5.x, var_480_5.y, var_480_5.z)

				local var_480_6 = var_480_0.localEulerAngles

				var_480_6.z = 0
				var_480_6.x = 0
				var_480_0.localEulerAngles = var_480_6
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 then
				var_480_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_480_7 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_7.x, var_480_7.y, var_480_7.z)

				local var_480_8 = var_480_0.localEulerAngles

				var_480_8.z = 0
				var_480_8.x = 0
				var_480_0.localEulerAngles = var_480_8
			end

			local var_480_9 = arg_477_1.actors_["2078ui_story"]
			local var_480_10 = 0

			if var_480_10 < arg_477_1.time_ and arg_477_1.time_ <= var_480_10 + arg_480_0 and arg_477_1.var_.characterEffect2078ui_story == nil then
				arg_477_1.var_.characterEffect2078ui_story = var_480_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_11 = 0.200000002980232

			if var_480_10 <= arg_477_1.time_ and arg_477_1.time_ < var_480_10 + var_480_11 then
				local var_480_12 = (arg_477_1.time_ - var_480_10) / var_480_11

				if arg_477_1.var_.characterEffect2078ui_story then
					arg_477_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_477_1.time_ >= var_480_10 + var_480_11 and arg_477_1.time_ < var_480_10 + var_480_11 + arg_480_0 and arg_477_1.var_.characterEffect2078ui_story then
				arg_477_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_480_13 = 0

			if var_480_13 < arg_477_1.time_ and arg_477_1.time_ <= var_480_13 + arg_480_0 then
				arg_477_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_480_14 = 0

			if var_480_14 < arg_477_1.time_ and arg_477_1.time_ <= var_480_14 + arg_480_0 then
				arg_477_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_480_15 = arg_477_1.actors_["2079ui_story"].transform
			local var_480_16 = 0

			if var_480_16 < arg_477_1.time_ and arg_477_1.time_ <= var_480_16 + arg_480_0 then
				arg_477_1.var_.moveOldPos2079ui_story = var_480_15.localPosition
			end

			local var_480_17 = 0.001

			if var_480_16 <= arg_477_1.time_ and arg_477_1.time_ < var_480_16 + var_480_17 then
				local var_480_18 = (arg_477_1.time_ - var_480_16) / var_480_17
				local var_480_19 = Vector3.New(0.7, -1.28, -5.6)

				var_480_15.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos2079ui_story, var_480_19, var_480_18)

				local var_480_20 = manager.ui.mainCamera.transform.position - var_480_15.position

				var_480_15.forward = Vector3.New(var_480_20.x, var_480_20.y, var_480_20.z)

				local var_480_21 = var_480_15.localEulerAngles

				var_480_21.z = 0
				var_480_21.x = 0
				var_480_15.localEulerAngles = var_480_21
			end

			if arg_477_1.time_ >= var_480_16 + var_480_17 and arg_477_1.time_ < var_480_16 + var_480_17 + arg_480_0 then
				var_480_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_480_22 = manager.ui.mainCamera.transform.position - var_480_15.position

				var_480_15.forward = Vector3.New(var_480_22.x, var_480_22.y, var_480_22.z)

				local var_480_23 = var_480_15.localEulerAngles

				var_480_23.z = 0
				var_480_23.x = 0
				var_480_15.localEulerAngles = var_480_23
			end

			local var_480_24 = arg_477_1.actors_["2079ui_story"]
			local var_480_25 = 0

			if var_480_25 < arg_477_1.time_ and arg_477_1.time_ <= var_480_25 + arg_480_0 and arg_477_1.var_.characterEffect2079ui_story == nil then
				arg_477_1.var_.characterEffect2079ui_story = var_480_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_26 = 0.200000002980232

			if var_480_25 <= arg_477_1.time_ and arg_477_1.time_ < var_480_25 + var_480_26 then
				local var_480_27 = (arg_477_1.time_ - var_480_25) / var_480_26

				if arg_477_1.var_.characterEffect2079ui_story then
					local var_480_28 = Mathf.Lerp(0, 0.5, var_480_27)

					arg_477_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_477_1.var_.characterEffect2079ui_story.fillRatio = var_480_28
				end
			end

			if arg_477_1.time_ >= var_480_25 + var_480_26 and arg_477_1.time_ < var_480_25 + var_480_26 + arg_480_0 and arg_477_1.var_.characterEffect2079ui_story then
				local var_480_29 = 0.5

				arg_477_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_477_1.var_.characterEffect2079ui_story.fillRatio = var_480_29
			end

			local var_480_30 = 0
			local var_480_31 = 0.9

			if var_480_30 < arg_477_1.time_ and arg_477_1.time_ <= var_480_30 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_32 = arg_477_1:FormatText(StoryNameCfg[530].name)

				arg_477_1.leftNameTxt_.text = var_480_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_33 = arg_477_1:GetWordFromCfg(317012116)
				local var_480_34 = arg_477_1:FormatText(var_480_33.content)

				arg_477_1.text_.text = var_480_34

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_35 = 36
				local var_480_36 = utf8.len(var_480_34)
				local var_480_37 = var_480_35 <= 0 and var_480_31 or var_480_31 * (var_480_36 / var_480_35)

				if var_480_37 > 0 and var_480_31 < var_480_37 then
					arg_477_1.talkMaxDuration = var_480_37

					if var_480_37 + var_480_30 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_37 + var_480_30
					end
				end

				arg_477_1.text_.text = var_480_34
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012116", "story_v_out_317012.awb") ~= 0 then
					local var_480_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012116", "story_v_out_317012.awb") / 1000

					if var_480_38 + var_480_30 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_38 + var_480_30
					end

					if var_480_33.prefab_name ~= "" and arg_477_1.actors_[var_480_33.prefab_name] ~= nil then
						local var_480_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_33.prefab_name].transform, "story_v_out_317012", "317012116", "story_v_out_317012.awb")

						arg_477_1:RecordAudio("317012116", var_480_39)
						arg_477_1:RecordAudio("317012116", var_480_39)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_317012", "317012116", "story_v_out_317012.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_317012", "317012116", "story_v_out_317012.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_40 = math.max(var_480_31, arg_477_1.talkMaxDuration)

			if var_480_30 <= arg_477_1.time_ and arg_477_1.time_ < var_480_30 + var_480_40 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_30) / var_480_40

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_30 + var_480_40 and arg_477_1.time_ < var_480_30 + var_480_40 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play317012117 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 317012117
		arg_481_1.duration_ = 7.533

		local var_481_0 = {
			zh = 3.866,
			ja = 7.533
		}
		local var_481_1 = manager.audio:GetLocalizationFlag()

		if var_481_0[var_481_1] ~= nil then
			arg_481_1.duration_ = var_481_0[var_481_1]
		end

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play317012118(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["2078ui_story"].transform
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 then
				arg_481_1.var_.moveOldPos2078ui_story = var_484_0.localPosition
			end

			local var_484_2 = 0.001

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2
				local var_484_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_484_0.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPos2078ui_story, var_484_4, var_484_3)

				local var_484_5 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_5.x, var_484_5.y, var_484_5.z)

				local var_484_6 = var_484_0.localEulerAngles

				var_484_6.z = 0
				var_484_6.x = 0
				var_484_0.localEulerAngles = var_484_6
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 then
				var_484_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_484_7 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_7.x, var_484_7.y, var_484_7.z)

				local var_484_8 = var_484_0.localEulerAngles

				var_484_8.z = 0
				var_484_8.x = 0
				var_484_0.localEulerAngles = var_484_8
			end

			local var_484_9 = arg_481_1.actors_["2078ui_story"]
			local var_484_10 = 0

			if var_484_10 < arg_481_1.time_ and arg_481_1.time_ <= var_484_10 + arg_484_0 and arg_481_1.var_.characterEffect2078ui_story == nil then
				arg_481_1.var_.characterEffect2078ui_story = var_484_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_11 = 0.200000002980232

			if var_484_10 <= arg_481_1.time_ and arg_481_1.time_ < var_484_10 + var_484_11 then
				local var_484_12 = (arg_481_1.time_ - var_484_10) / var_484_11

				if arg_481_1.var_.characterEffect2078ui_story then
					local var_484_13 = Mathf.Lerp(0, 0.5, var_484_12)

					arg_481_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_481_1.var_.characterEffect2078ui_story.fillRatio = var_484_13
				end
			end

			if arg_481_1.time_ >= var_484_10 + var_484_11 and arg_481_1.time_ < var_484_10 + var_484_11 + arg_484_0 and arg_481_1.var_.characterEffect2078ui_story then
				local var_484_14 = 0.5

				arg_481_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_481_1.var_.characterEffect2078ui_story.fillRatio = var_484_14
			end

			local var_484_15 = arg_481_1.actors_["2079ui_story"].transform
			local var_484_16 = 0

			if var_484_16 < arg_481_1.time_ and arg_481_1.time_ <= var_484_16 + arg_484_0 then
				arg_481_1.var_.moveOldPos2079ui_story = var_484_15.localPosition
			end

			local var_484_17 = 0.001

			if var_484_16 <= arg_481_1.time_ and arg_481_1.time_ < var_484_16 + var_484_17 then
				local var_484_18 = (arg_481_1.time_ - var_484_16) / var_484_17
				local var_484_19 = Vector3.New(0.7, -1.28, -5.6)

				var_484_15.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPos2079ui_story, var_484_19, var_484_18)

				local var_484_20 = manager.ui.mainCamera.transform.position - var_484_15.position

				var_484_15.forward = Vector3.New(var_484_20.x, var_484_20.y, var_484_20.z)

				local var_484_21 = var_484_15.localEulerAngles

				var_484_21.z = 0
				var_484_21.x = 0
				var_484_15.localEulerAngles = var_484_21
			end

			if arg_481_1.time_ >= var_484_16 + var_484_17 and arg_481_1.time_ < var_484_16 + var_484_17 + arg_484_0 then
				var_484_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_484_22 = manager.ui.mainCamera.transform.position - var_484_15.position

				var_484_15.forward = Vector3.New(var_484_22.x, var_484_22.y, var_484_22.z)

				local var_484_23 = var_484_15.localEulerAngles

				var_484_23.z = 0
				var_484_23.x = 0
				var_484_15.localEulerAngles = var_484_23
			end

			local var_484_24 = arg_481_1.actors_["2079ui_story"]
			local var_484_25 = 0

			if var_484_25 < arg_481_1.time_ and arg_481_1.time_ <= var_484_25 + arg_484_0 and arg_481_1.var_.characterEffect2079ui_story == nil then
				arg_481_1.var_.characterEffect2079ui_story = var_484_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_26 = 0.200000002980232

			if var_484_25 <= arg_481_1.time_ and arg_481_1.time_ < var_484_25 + var_484_26 then
				local var_484_27 = (arg_481_1.time_ - var_484_25) / var_484_26

				if arg_481_1.var_.characterEffect2079ui_story then
					arg_481_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_481_1.time_ >= var_484_25 + var_484_26 and arg_481_1.time_ < var_484_25 + var_484_26 + arg_484_0 and arg_481_1.var_.characterEffect2079ui_story then
				arg_481_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_484_28 = 0

			if var_484_28 < arg_481_1.time_ and arg_481_1.time_ <= var_484_28 + arg_484_0 then
				arg_481_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_484_29 = 0

			if var_484_29 < arg_481_1.time_ and arg_481_1.time_ <= var_484_29 + arg_484_0 then
				arg_481_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_484_30 = 0
			local var_484_31 = 0.35

			if var_484_30 < arg_481_1.time_ and arg_481_1.time_ <= var_484_30 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_32 = arg_481_1:FormatText(StoryNameCfg[529].name)

				arg_481_1.leftNameTxt_.text = var_484_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_33 = arg_481_1:GetWordFromCfg(317012117)
				local var_484_34 = arg_481_1:FormatText(var_484_33.content)

				arg_481_1.text_.text = var_484_34

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_35 = 14
				local var_484_36 = utf8.len(var_484_34)
				local var_484_37 = var_484_35 <= 0 and var_484_31 or var_484_31 * (var_484_36 / var_484_35)

				if var_484_37 > 0 and var_484_31 < var_484_37 then
					arg_481_1.talkMaxDuration = var_484_37

					if var_484_37 + var_484_30 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_37 + var_484_30
					end
				end

				arg_481_1.text_.text = var_484_34
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012117", "story_v_out_317012.awb") ~= 0 then
					local var_484_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012117", "story_v_out_317012.awb") / 1000

					if var_484_38 + var_484_30 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_38 + var_484_30
					end

					if var_484_33.prefab_name ~= "" and arg_481_1.actors_[var_484_33.prefab_name] ~= nil then
						local var_484_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_33.prefab_name].transform, "story_v_out_317012", "317012117", "story_v_out_317012.awb")

						arg_481_1:RecordAudio("317012117", var_484_39)
						arg_481_1:RecordAudio("317012117", var_484_39)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_317012", "317012117", "story_v_out_317012.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_317012", "317012117", "story_v_out_317012.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_40 = math.max(var_484_31, arg_481_1.talkMaxDuration)

			if var_484_30 <= arg_481_1.time_ and arg_481_1.time_ < var_484_30 + var_484_40 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_30) / var_484_40

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_30 + var_484_40 and arg_481_1.time_ < var_484_30 + var_484_40 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play317012118 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 317012118
		arg_485_1.duration_ = 5

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play317012119(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = arg_485_1.actors_["2079ui_story"]
			local var_488_1 = 0

			if var_488_1 < arg_485_1.time_ and arg_485_1.time_ <= var_488_1 + arg_488_0 and arg_485_1.var_.characterEffect2079ui_story == nil then
				arg_485_1.var_.characterEffect2079ui_story = var_488_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_2 = 0.200000002980232

			if var_488_1 <= arg_485_1.time_ and arg_485_1.time_ < var_488_1 + var_488_2 then
				local var_488_3 = (arg_485_1.time_ - var_488_1) / var_488_2

				if arg_485_1.var_.characterEffect2079ui_story then
					local var_488_4 = Mathf.Lerp(0, 0.5, var_488_3)

					arg_485_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_485_1.var_.characterEffect2079ui_story.fillRatio = var_488_4
				end
			end

			if arg_485_1.time_ >= var_488_1 + var_488_2 and arg_485_1.time_ < var_488_1 + var_488_2 + arg_488_0 and arg_485_1.var_.characterEffect2079ui_story then
				local var_488_5 = 0.5

				arg_485_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_485_1.var_.characterEffect2079ui_story.fillRatio = var_488_5
			end

			local var_488_6 = 0
			local var_488_7 = 0.5

			if var_488_6 < arg_485_1.time_ and arg_485_1.time_ <= var_488_6 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, false)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_8 = arg_485_1:GetWordFromCfg(317012118)
				local var_488_9 = arg_485_1:FormatText(var_488_8.content)

				arg_485_1.text_.text = var_488_9

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_10 = 20
				local var_488_11 = utf8.len(var_488_9)
				local var_488_12 = var_488_10 <= 0 and var_488_7 or var_488_7 * (var_488_11 / var_488_10)

				if var_488_12 > 0 and var_488_7 < var_488_12 then
					arg_485_1.talkMaxDuration = var_488_12

					if var_488_12 + var_488_6 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_12 + var_488_6
					end
				end

				arg_485_1.text_.text = var_488_9
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)
				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_13 = math.max(var_488_7, arg_485_1.talkMaxDuration)

			if var_488_6 <= arg_485_1.time_ and arg_485_1.time_ < var_488_6 + var_488_13 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_6) / var_488_13

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_6 + var_488_13 and arg_485_1.time_ < var_488_6 + var_488_13 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play317012119 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 317012119
		arg_489_1.duration_ = 12.433

		local var_489_0 = {
			zh = 10.4,
			ja = 12.433
		}
		local var_489_1 = manager.audio:GetLocalizationFlag()

		if var_489_0[var_489_1] ~= nil then
			arg_489_1.duration_ = var_489_0[var_489_1]
		end

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play317012120(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["2078ui_story"].transform
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 then
				arg_489_1.var_.moveOldPos2078ui_story = var_492_0.localPosition
			end

			local var_492_2 = 0.001

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2
				local var_492_4 = Vector3.New(0, 100, 0)

				var_492_0.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos2078ui_story, var_492_4, var_492_3)

				local var_492_5 = manager.ui.mainCamera.transform.position - var_492_0.position

				var_492_0.forward = Vector3.New(var_492_5.x, var_492_5.y, var_492_5.z)

				local var_492_6 = var_492_0.localEulerAngles

				var_492_6.z = 0
				var_492_6.x = 0
				var_492_0.localEulerAngles = var_492_6
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 then
				var_492_0.localPosition = Vector3.New(0, 100, 0)

				local var_492_7 = manager.ui.mainCamera.transform.position - var_492_0.position

				var_492_0.forward = Vector3.New(var_492_7.x, var_492_7.y, var_492_7.z)

				local var_492_8 = var_492_0.localEulerAngles

				var_492_8.z = 0
				var_492_8.x = 0
				var_492_0.localEulerAngles = var_492_8
			end

			local var_492_9 = arg_489_1.actors_["2078ui_story"]
			local var_492_10 = 0

			if var_492_10 < arg_489_1.time_ and arg_489_1.time_ <= var_492_10 + arg_492_0 and arg_489_1.var_.characterEffect2078ui_story == nil then
				arg_489_1.var_.characterEffect2078ui_story = var_492_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_11 = 0.200000002980232

			if var_492_10 <= arg_489_1.time_ and arg_489_1.time_ < var_492_10 + var_492_11 then
				local var_492_12 = (arg_489_1.time_ - var_492_10) / var_492_11

				if arg_489_1.var_.characterEffect2078ui_story then
					local var_492_13 = Mathf.Lerp(0, 0.5, var_492_12)

					arg_489_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_489_1.var_.characterEffect2078ui_story.fillRatio = var_492_13
				end
			end

			if arg_489_1.time_ >= var_492_10 + var_492_11 and arg_489_1.time_ < var_492_10 + var_492_11 + arg_492_0 and arg_489_1.var_.characterEffect2078ui_story then
				local var_492_14 = 0.5

				arg_489_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_489_1.var_.characterEffect2078ui_story.fillRatio = var_492_14
			end

			local var_492_15 = arg_489_1.actors_["2079ui_story"].transform
			local var_492_16 = 0

			if var_492_16 < arg_489_1.time_ and arg_489_1.time_ <= var_492_16 + arg_492_0 then
				arg_489_1.var_.moveOldPos2079ui_story = var_492_15.localPosition
			end

			local var_492_17 = 0.001

			if var_492_16 <= arg_489_1.time_ and arg_489_1.time_ < var_492_16 + var_492_17 then
				local var_492_18 = (arg_489_1.time_ - var_492_16) / var_492_17
				local var_492_19 = Vector3.New(0, 100, 0)

				var_492_15.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos2079ui_story, var_492_19, var_492_18)

				local var_492_20 = manager.ui.mainCamera.transform.position - var_492_15.position

				var_492_15.forward = Vector3.New(var_492_20.x, var_492_20.y, var_492_20.z)

				local var_492_21 = var_492_15.localEulerAngles

				var_492_21.z = 0
				var_492_21.x = 0
				var_492_15.localEulerAngles = var_492_21
			end

			if arg_489_1.time_ >= var_492_16 + var_492_17 and arg_489_1.time_ < var_492_16 + var_492_17 + arg_492_0 then
				var_492_15.localPosition = Vector3.New(0, 100, 0)

				local var_492_22 = manager.ui.mainCamera.transform.position - var_492_15.position

				var_492_15.forward = Vector3.New(var_492_22.x, var_492_22.y, var_492_22.z)

				local var_492_23 = var_492_15.localEulerAngles

				var_492_23.z = 0
				var_492_23.x = 0
				var_492_15.localEulerAngles = var_492_23
			end

			local var_492_24 = arg_489_1.actors_["2079ui_story"]
			local var_492_25 = 0

			if var_492_25 < arg_489_1.time_ and arg_489_1.time_ <= var_492_25 + arg_492_0 and arg_489_1.var_.characterEffect2079ui_story == nil then
				arg_489_1.var_.characterEffect2079ui_story = var_492_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_26 = 0.200000002980232

			if var_492_25 <= arg_489_1.time_ and arg_489_1.time_ < var_492_25 + var_492_26 then
				local var_492_27 = (arg_489_1.time_ - var_492_25) / var_492_26

				if arg_489_1.var_.characterEffect2079ui_story then
					local var_492_28 = Mathf.Lerp(0, 0.5, var_492_27)

					arg_489_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_489_1.var_.characterEffect2079ui_story.fillRatio = var_492_28
				end
			end

			if arg_489_1.time_ >= var_492_25 + var_492_26 and arg_489_1.time_ < var_492_25 + var_492_26 + arg_492_0 and arg_489_1.var_.characterEffect2079ui_story then
				local var_492_29 = 0.5

				arg_489_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_489_1.var_.characterEffect2079ui_story.fillRatio = var_492_29
			end

			local var_492_30 = arg_489_1.actors_["1015ui_story"].transform
			local var_492_31 = 0

			if var_492_31 < arg_489_1.time_ and arg_489_1.time_ <= var_492_31 + arg_492_0 then
				arg_489_1.var_.moveOldPos1015ui_story = var_492_30.localPosition
			end

			local var_492_32 = 0.001

			if var_492_31 <= arg_489_1.time_ and arg_489_1.time_ < var_492_31 + var_492_32 then
				local var_492_33 = (arg_489_1.time_ - var_492_31) / var_492_32
				local var_492_34 = Vector3.New(0, -1.15, -6.2)

				var_492_30.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos1015ui_story, var_492_34, var_492_33)

				local var_492_35 = manager.ui.mainCamera.transform.position - var_492_30.position

				var_492_30.forward = Vector3.New(var_492_35.x, var_492_35.y, var_492_35.z)

				local var_492_36 = var_492_30.localEulerAngles

				var_492_36.z = 0
				var_492_36.x = 0
				var_492_30.localEulerAngles = var_492_36
			end

			if arg_489_1.time_ >= var_492_31 + var_492_32 and arg_489_1.time_ < var_492_31 + var_492_32 + arg_492_0 then
				var_492_30.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_492_37 = manager.ui.mainCamera.transform.position - var_492_30.position

				var_492_30.forward = Vector3.New(var_492_37.x, var_492_37.y, var_492_37.z)

				local var_492_38 = var_492_30.localEulerAngles

				var_492_38.z = 0
				var_492_38.x = 0
				var_492_30.localEulerAngles = var_492_38
			end

			local var_492_39 = arg_489_1.actors_["1015ui_story"]
			local var_492_40 = 0

			if var_492_40 < arg_489_1.time_ and arg_489_1.time_ <= var_492_40 + arg_492_0 and arg_489_1.var_.characterEffect1015ui_story == nil then
				arg_489_1.var_.characterEffect1015ui_story = var_492_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_41 = 0.200000002980232

			if var_492_40 <= arg_489_1.time_ and arg_489_1.time_ < var_492_40 + var_492_41 then
				local var_492_42 = (arg_489_1.time_ - var_492_40) / var_492_41

				if arg_489_1.var_.characterEffect1015ui_story then
					arg_489_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_489_1.time_ >= var_492_40 + var_492_41 and arg_489_1.time_ < var_492_40 + var_492_41 + arg_492_0 and arg_489_1.var_.characterEffect1015ui_story then
				arg_489_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_492_43 = 0

			if var_492_43 < arg_489_1.time_ and arg_489_1.time_ <= var_492_43 + arg_492_0 then
				arg_489_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_492_44 = 0

			if var_492_44 < arg_489_1.time_ and arg_489_1.time_ <= var_492_44 + arg_492_0 then
				arg_489_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_492_45 = 0
			local var_492_46 = 1.1

			if var_492_45 < arg_489_1.time_ and arg_489_1.time_ <= var_492_45 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_47 = arg_489_1:FormatText(StoryNameCfg[479].name)

				arg_489_1.leftNameTxt_.text = var_492_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_48 = arg_489_1:GetWordFromCfg(317012119)
				local var_492_49 = arg_489_1:FormatText(var_492_48.content)

				arg_489_1.text_.text = var_492_49

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_50 = 44
				local var_492_51 = utf8.len(var_492_49)
				local var_492_52 = var_492_50 <= 0 and var_492_46 or var_492_46 * (var_492_51 / var_492_50)

				if var_492_52 > 0 and var_492_46 < var_492_52 then
					arg_489_1.talkMaxDuration = var_492_52

					if var_492_52 + var_492_45 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_52 + var_492_45
					end
				end

				arg_489_1.text_.text = var_492_49
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012119", "story_v_out_317012.awb") ~= 0 then
					local var_492_53 = manager.audio:GetVoiceLength("story_v_out_317012", "317012119", "story_v_out_317012.awb") / 1000

					if var_492_53 + var_492_45 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_53 + var_492_45
					end

					if var_492_48.prefab_name ~= "" and arg_489_1.actors_[var_492_48.prefab_name] ~= nil then
						local var_492_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_489_1.actors_[var_492_48.prefab_name].transform, "story_v_out_317012", "317012119", "story_v_out_317012.awb")

						arg_489_1:RecordAudio("317012119", var_492_54)
						arg_489_1:RecordAudio("317012119", var_492_54)
					else
						arg_489_1:AudioAction("play", "voice", "story_v_out_317012", "317012119", "story_v_out_317012.awb")
					end

					arg_489_1:RecordHistoryTalkVoice("story_v_out_317012", "317012119", "story_v_out_317012.awb")
				end

				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_55 = math.max(var_492_46, arg_489_1.talkMaxDuration)

			if var_492_45 <= arg_489_1.time_ and arg_489_1.time_ < var_492_45 + var_492_55 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_45) / var_492_55

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_45 + var_492_55 and arg_489_1.time_ < var_492_45 + var_492_55 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play317012120 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 317012120
		arg_493_1.duration_ = 5

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play317012121(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["1015ui_story"]
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 and arg_493_1.var_.characterEffect1015ui_story == nil then
				arg_493_1.var_.characterEffect1015ui_story = var_496_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_2 = 0.200000002980232

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_2 then
				local var_496_3 = (arg_493_1.time_ - var_496_1) / var_496_2

				if arg_493_1.var_.characterEffect1015ui_story then
					local var_496_4 = Mathf.Lerp(0, 0.5, var_496_3)

					arg_493_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_493_1.var_.characterEffect1015ui_story.fillRatio = var_496_4
				end
			end

			if arg_493_1.time_ >= var_496_1 + var_496_2 and arg_493_1.time_ < var_496_1 + var_496_2 + arg_496_0 and arg_493_1.var_.characterEffect1015ui_story then
				local var_496_5 = 0.5

				arg_493_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_493_1.var_.characterEffect1015ui_story.fillRatio = var_496_5
			end

			local var_496_6 = 0
			local var_496_7 = 0.3

			if var_496_6 < arg_493_1.time_ and arg_493_1.time_ <= var_496_6 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, false)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_8 = arg_493_1:GetWordFromCfg(317012120)
				local var_496_9 = arg_493_1:FormatText(var_496_8.content)

				arg_493_1.text_.text = var_496_9

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_10 = 12
				local var_496_11 = utf8.len(var_496_9)
				local var_496_12 = var_496_10 <= 0 and var_496_7 or var_496_7 * (var_496_11 / var_496_10)

				if var_496_12 > 0 and var_496_7 < var_496_12 then
					arg_493_1.talkMaxDuration = var_496_12

					if var_496_12 + var_496_6 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_12 + var_496_6
					end
				end

				arg_493_1.text_.text = var_496_9
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_13 = math.max(var_496_7, arg_493_1.talkMaxDuration)

			if var_496_6 <= arg_493_1.time_ and arg_493_1.time_ < var_496_6 + var_496_13 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_6) / var_496_13

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_6 + var_496_13 and arg_493_1.time_ < var_496_6 + var_496_13 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play317012121 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 317012121
		arg_497_1.duration_ = 8.9

		local var_497_0 = {
			zh = 7.7,
			ja = 8.9
		}
		local var_497_1 = manager.audio:GetLocalizationFlag()

		if var_497_0[var_497_1] ~= nil then
			arg_497_1.duration_ = var_497_0[var_497_1]
		end

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play317012122(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = arg_497_1.actors_["1015ui_story"].transform
			local var_500_1 = 0

			if var_500_1 < arg_497_1.time_ and arg_497_1.time_ <= var_500_1 + arg_500_0 then
				arg_497_1.var_.moveOldPos1015ui_story = var_500_0.localPosition
			end

			local var_500_2 = 0.001

			if var_500_1 <= arg_497_1.time_ and arg_497_1.time_ < var_500_1 + var_500_2 then
				local var_500_3 = (arg_497_1.time_ - var_500_1) / var_500_2
				local var_500_4 = Vector3.New(0, -1.15, -6.2)

				var_500_0.localPosition = Vector3.Lerp(arg_497_1.var_.moveOldPos1015ui_story, var_500_4, var_500_3)

				local var_500_5 = manager.ui.mainCamera.transform.position - var_500_0.position

				var_500_0.forward = Vector3.New(var_500_5.x, var_500_5.y, var_500_5.z)

				local var_500_6 = var_500_0.localEulerAngles

				var_500_6.z = 0
				var_500_6.x = 0
				var_500_0.localEulerAngles = var_500_6
			end

			if arg_497_1.time_ >= var_500_1 + var_500_2 and arg_497_1.time_ < var_500_1 + var_500_2 + arg_500_0 then
				var_500_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_500_7 = manager.ui.mainCamera.transform.position - var_500_0.position

				var_500_0.forward = Vector3.New(var_500_7.x, var_500_7.y, var_500_7.z)

				local var_500_8 = var_500_0.localEulerAngles

				var_500_8.z = 0
				var_500_8.x = 0
				var_500_0.localEulerAngles = var_500_8
			end

			local var_500_9 = arg_497_1.actors_["1015ui_story"]
			local var_500_10 = 0

			if var_500_10 < arg_497_1.time_ and arg_497_1.time_ <= var_500_10 + arg_500_0 and arg_497_1.var_.characterEffect1015ui_story == nil then
				arg_497_1.var_.characterEffect1015ui_story = var_500_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_11 = 0.200000002980232

			if var_500_10 <= arg_497_1.time_ and arg_497_1.time_ < var_500_10 + var_500_11 then
				local var_500_12 = (arg_497_1.time_ - var_500_10) / var_500_11

				if arg_497_1.var_.characterEffect1015ui_story then
					arg_497_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_497_1.time_ >= var_500_10 + var_500_11 and arg_497_1.time_ < var_500_10 + var_500_11 + arg_500_0 and arg_497_1.var_.characterEffect1015ui_story then
				arg_497_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_500_13 = 0

			if var_500_13 < arg_497_1.time_ and arg_497_1.time_ <= var_500_13 + arg_500_0 then
				arg_497_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_500_14 = 0

			if var_500_14 < arg_497_1.time_ and arg_497_1.time_ <= var_500_14 + arg_500_0 then
				arg_497_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_500_15 = 0
			local var_500_16 = 0.8

			if var_500_15 < arg_497_1.time_ and arg_497_1.time_ <= var_500_15 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_17 = arg_497_1:FormatText(StoryNameCfg[479].name)

				arg_497_1.leftNameTxt_.text = var_500_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_18 = arg_497_1:GetWordFromCfg(317012121)
				local var_500_19 = arg_497_1:FormatText(var_500_18.content)

				arg_497_1.text_.text = var_500_19

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_20 = 32
				local var_500_21 = utf8.len(var_500_19)
				local var_500_22 = var_500_20 <= 0 and var_500_16 or var_500_16 * (var_500_21 / var_500_20)

				if var_500_22 > 0 and var_500_16 < var_500_22 then
					arg_497_1.talkMaxDuration = var_500_22

					if var_500_22 + var_500_15 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_22 + var_500_15
					end
				end

				arg_497_1.text_.text = var_500_19
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012121", "story_v_out_317012.awb") ~= 0 then
					local var_500_23 = manager.audio:GetVoiceLength("story_v_out_317012", "317012121", "story_v_out_317012.awb") / 1000

					if var_500_23 + var_500_15 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_23 + var_500_15
					end

					if var_500_18.prefab_name ~= "" and arg_497_1.actors_[var_500_18.prefab_name] ~= nil then
						local var_500_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_497_1.actors_[var_500_18.prefab_name].transform, "story_v_out_317012", "317012121", "story_v_out_317012.awb")

						arg_497_1:RecordAudio("317012121", var_500_24)
						arg_497_1:RecordAudio("317012121", var_500_24)
					else
						arg_497_1:AudioAction("play", "voice", "story_v_out_317012", "317012121", "story_v_out_317012.awb")
					end

					arg_497_1:RecordHistoryTalkVoice("story_v_out_317012", "317012121", "story_v_out_317012.awb")
				end

				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_25 = math.max(var_500_16, arg_497_1.talkMaxDuration)

			if var_500_15 <= arg_497_1.time_ and arg_497_1.time_ < var_500_15 + var_500_25 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_15) / var_500_25

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_15 + var_500_25 and arg_497_1.time_ < var_500_15 + var_500_25 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play317012122 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 317012122
		arg_501_1.duration_ = 4.466

		local var_501_0 = {
			zh = 2,
			ja = 4.466
		}
		local var_501_1 = manager.audio:GetLocalizationFlag()

		if var_501_0[var_501_1] ~= nil then
			arg_501_1.duration_ = var_501_0[var_501_1]
		end

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play317012123(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = arg_501_1.actors_["2078ui_story"].transform
			local var_504_1 = 0

			if var_504_1 < arg_501_1.time_ and arg_501_1.time_ <= var_504_1 + arg_504_0 then
				arg_501_1.var_.moveOldPos2078ui_story = var_504_0.localPosition
			end

			local var_504_2 = 0.001

			if var_504_1 <= arg_501_1.time_ and arg_501_1.time_ < var_504_1 + var_504_2 then
				local var_504_3 = (arg_501_1.time_ - var_504_1) / var_504_2
				local var_504_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_504_0.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos2078ui_story, var_504_4, var_504_3)

				local var_504_5 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_5.x, var_504_5.y, var_504_5.z)

				local var_504_6 = var_504_0.localEulerAngles

				var_504_6.z = 0
				var_504_6.x = 0
				var_504_0.localEulerAngles = var_504_6
			end

			if arg_501_1.time_ >= var_504_1 + var_504_2 and arg_501_1.time_ < var_504_1 + var_504_2 + arg_504_0 then
				var_504_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_504_7 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_7.x, var_504_7.y, var_504_7.z)

				local var_504_8 = var_504_0.localEulerAngles

				var_504_8.z = 0
				var_504_8.x = 0
				var_504_0.localEulerAngles = var_504_8
			end

			local var_504_9 = arg_501_1.actors_["2078ui_story"]
			local var_504_10 = 0

			if var_504_10 < arg_501_1.time_ and arg_501_1.time_ <= var_504_10 + arg_504_0 and arg_501_1.var_.characterEffect2078ui_story == nil then
				arg_501_1.var_.characterEffect2078ui_story = var_504_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_11 = 0.200000002980232

			if var_504_10 <= arg_501_1.time_ and arg_501_1.time_ < var_504_10 + var_504_11 then
				local var_504_12 = (arg_501_1.time_ - var_504_10) / var_504_11

				if arg_501_1.var_.characterEffect2078ui_story then
					local var_504_13 = Mathf.Lerp(0, 0.5, var_504_12)

					arg_501_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_501_1.var_.characterEffect2078ui_story.fillRatio = var_504_13
				end
			end

			if arg_501_1.time_ >= var_504_10 + var_504_11 and arg_501_1.time_ < var_504_10 + var_504_11 + arg_504_0 and arg_501_1.var_.characterEffect2078ui_story then
				local var_504_14 = 0.5

				arg_501_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_501_1.var_.characterEffect2078ui_story.fillRatio = var_504_14
			end

			local var_504_15 = arg_501_1.actors_["2079ui_story"].transform
			local var_504_16 = 0

			if var_504_16 < arg_501_1.time_ and arg_501_1.time_ <= var_504_16 + arg_504_0 then
				arg_501_1.var_.moveOldPos2079ui_story = var_504_15.localPosition
			end

			local var_504_17 = 0.001

			if var_504_16 <= arg_501_1.time_ and arg_501_1.time_ < var_504_16 + var_504_17 then
				local var_504_18 = (arg_501_1.time_ - var_504_16) / var_504_17
				local var_504_19 = Vector3.New(0.7, -1.28, -5.6)

				var_504_15.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos2079ui_story, var_504_19, var_504_18)

				local var_504_20 = manager.ui.mainCamera.transform.position - var_504_15.position

				var_504_15.forward = Vector3.New(var_504_20.x, var_504_20.y, var_504_20.z)

				local var_504_21 = var_504_15.localEulerAngles

				var_504_21.z = 0
				var_504_21.x = 0
				var_504_15.localEulerAngles = var_504_21
			end

			if arg_501_1.time_ >= var_504_16 + var_504_17 and arg_501_1.time_ < var_504_16 + var_504_17 + arg_504_0 then
				var_504_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_504_22 = manager.ui.mainCamera.transform.position - var_504_15.position

				var_504_15.forward = Vector3.New(var_504_22.x, var_504_22.y, var_504_22.z)

				local var_504_23 = var_504_15.localEulerAngles

				var_504_23.z = 0
				var_504_23.x = 0
				var_504_15.localEulerAngles = var_504_23
			end

			local var_504_24 = arg_501_1.actors_["2079ui_story"]
			local var_504_25 = 0

			if var_504_25 < arg_501_1.time_ and arg_501_1.time_ <= var_504_25 + arg_504_0 and arg_501_1.var_.characterEffect2079ui_story == nil then
				arg_501_1.var_.characterEffect2079ui_story = var_504_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_26 = 0.200000002980232

			if var_504_25 <= arg_501_1.time_ and arg_501_1.time_ < var_504_25 + var_504_26 then
				local var_504_27 = (arg_501_1.time_ - var_504_25) / var_504_26

				if arg_501_1.var_.characterEffect2079ui_story then
					arg_501_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_501_1.time_ >= var_504_25 + var_504_26 and arg_501_1.time_ < var_504_25 + var_504_26 + arg_504_0 and arg_501_1.var_.characterEffect2079ui_story then
				arg_501_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_504_28 = 0

			if var_504_28 < arg_501_1.time_ and arg_501_1.time_ <= var_504_28 + arg_504_0 then
				arg_501_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_504_29 = 0

			if var_504_29 < arg_501_1.time_ and arg_501_1.time_ <= var_504_29 + arg_504_0 then
				arg_501_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_504_30 = arg_501_1.actors_["1015ui_story"].transform
			local var_504_31 = 0

			if var_504_31 < arg_501_1.time_ and arg_501_1.time_ <= var_504_31 + arg_504_0 then
				arg_501_1.var_.moveOldPos1015ui_story = var_504_30.localPosition
			end

			local var_504_32 = 0.001

			if var_504_31 <= arg_501_1.time_ and arg_501_1.time_ < var_504_31 + var_504_32 then
				local var_504_33 = (arg_501_1.time_ - var_504_31) / var_504_32
				local var_504_34 = Vector3.New(0, 100, 0)

				var_504_30.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos1015ui_story, var_504_34, var_504_33)

				local var_504_35 = manager.ui.mainCamera.transform.position - var_504_30.position

				var_504_30.forward = Vector3.New(var_504_35.x, var_504_35.y, var_504_35.z)

				local var_504_36 = var_504_30.localEulerAngles

				var_504_36.z = 0
				var_504_36.x = 0
				var_504_30.localEulerAngles = var_504_36
			end

			if arg_501_1.time_ >= var_504_31 + var_504_32 and arg_501_1.time_ < var_504_31 + var_504_32 + arg_504_0 then
				var_504_30.localPosition = Vector3.New(0, 100, 0)

				local var_504_37 = manager.ui.mainCamera.transform.position - var_504_30.position

				var_504_30.forward = Vector3.New(var_504_37.x, var_504_37.y, var_504_37.z)

				local var_504_38 = var_504_30.localEulerAngles

				var_504_38.z = 0
				var_504_38.x = 0
				var_504_30.localEulerAngles = var_504_38
			end

			local var_504_39 = arg_501_1.actors_["1015ui_story"]
			local var_504_40 = 0

			if var_504_40 < arg_501_1.time_ and arg_501_1.time_ <= var_504_40 + arg_504_0 and arg_501_1.var_.characterEffect1015ui_story == nil then
				arg_501_1.var_.characterEffect1015ui_story = var_504_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_41 = 0.200000002980232

			if var_504_40 <= arg_501_1.time_ and arg_501_1.time_ < var_504_40 + var_504_41 then
				local var_504_42 = (arg_501_1.time_ - var_504_40) / var_504_41

				if arg_501_1.var_.characterEffect1015ui_story then
					local var_504_43 = Mathf.Lerp(0, 0.5, var_504_42)

					arg_501_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_501_1.var_.characterEffect1015ui_story.fillRatio = var_504_43
				end
			end

			if arg_501_1.time_ >= var_504_40 + var_504_41 and arg_501_1.time_ < var_504_40 + var_504_41 + arg_504_0 and arg_501_1.var_.characterEffect1015ui_story then
				local var_504_44 = 0.5

				arg_501_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_501_1.var_.characterEffect1015ui_story.fillRatio = var_504_44
			end

			local var_504_45 = 0
			local var_504_46 = 0.25

			if var_504_45 < arg_501_1.time_ and arg_501_1.time_ <= var_504_45 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_47 = arg_501_1:FormatText(StoryNameCfg[529].name)

				arg_501_1.leftNameTxt_.text = var_504_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_48 = arg_501_1:GetWordFromCfg(317012122)
				local var_504_49 = arg_501_1:FormatText(var_504_48.content)

				arg_501_1.text_.text = var_504_49

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_50 = 10
				local var_504_51 = utf8.len(var_504_49)
				local var_504_52 = var_504_50 <= 0 and var_504_46 or var_504_46 * (var_504_51 / var_504_50)

				if var_504_52 > 0 and var_504_46 < var_504_52 then
					arg_501_1.talkMaxDuration = var_504_52

					if var_504_52 + var_504_45 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_52 + var_504_45
					end
				end

				arg_501_1.text_.text = var_504_49
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012122", "story_v_out_317012.awb") ~= 0 then
					local var_504_53 = manager.audio:GetVoiceLength("story_v_out_317012", "317012122", "story_v_out_317012.awb") / 1000

					if var_504_53 + var_504_45 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_53 + var_504_45
					end

					if var_504_48.prefab_name ~= "" and arg_501_1.actors_[var_504_48.prefab_name] ~= nil then
						local var_504_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_48.prefab_name].transform, "story_v_out_317012", "317012122", "story_v_out_317012.awb")

						arg_501_1:RecordAudio("317012122", var_504_54)
						arg_501_1:RecordAudio("317012122", var_504_54)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_317012", "317012122", "story_v_out_317012.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_317012", "317012122", "story_v_out_317012.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_55 = math.max(var_504_46, arg_501_1.talkMaxDuration)

			if var_504_45 <= arg_501_1.time_ and arg_501_1.time_ < var_504_45 + var_504_55 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_45) / var_504_55

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_45 + var_504_55 and arg_501_1.time_ < var_504_45 + var_504_55 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play317012123 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 317012123
		arg_505_1.duration_ = 5.6

		local var_505_0 = {
			zh = 5.6,
			ja = 5.066
		}
		local var_505_1 = manager.audio:GetLocalizationFlag()

		if var_505_0[var_505_1] ~= nil then
			arg_505_1.duration_ = var_505_0[var_505_1]
		end

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play317012124(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = arg_505_1.actors_["2078ui_story"].transform
			local var_508_1 = 0

			if var_508_1 < arg_505_1.time_ and arg_505_1.time_ <= var_508_1 + arg_508_0 then
				arg_505_1.var_.moveOldPos2078ui_story = var_508_0.localPosition
			end

			local var_508_2 = 0.001

			if var_508_1 <= arg_505_1.time_ and arg_505_1.time_ < var_508_1 + var_508_2 then
				local var_508_3 = (arg_505_1.time_ - var_508_1) / var_508_2
				local var_508_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_508_0.localPosition = Vector3.Lerp(arg_505_1.var_.moveOldPos2078ui_story, var_508_4, var_508_3)

				local var_508_5 = manager.ui.mainCamera.transform.position - var_508_0.position

				var_508_0.forward = Vector3.New(var_508_5.x, var_508_5.y, var_508_5.z)

				local var_508_6 = var_508_0.localEulerAngles

				var_508_6.z = 0
				var_508_6.x = 0
				var_508_0.localEulerAngles = var_508_6
			end

			if arg_505_1.time_ >= var_508_1 + var_508_2 and arg_505_1.time_ < var_508_1 + var_508_2 + arg_508_0 then
				var_508_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_508_7 = manager.ui.mainCamera.transform.position - var_508_0.position

				var_508_0.forward = Vector3.New(var_508_7.x, var_508_7.y, var_508_7.z)

				local var_508_8 = var_508_0.localEulerAngles

				var_508_8.z = 0
				var_508_8.x = 0
				var_508_0.localEulerAngles = var_508_8
			end

			local var_508_9 = arg_505_1.actors_["2078ui_story"]
			local var_508_10 = 0

			if var_508_10 < arg_505_1.time_ and arg_505_1.time_ <= var_508_10 + arg_508_0 and arg_505_1.var_.characterEffect2078ui_story == nil then
				arg_505_1.var_.characterEffect2078ui_story = var_508_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_11 = 0.200000002980232

			if var_508_10 <= arg_505_1.time_ and arg_505_1.time_ < var_508_10 + var_508_11 then
				local var_508_12 = (arg_505_1.time_ - var_508_10) / var_508_11

				if arg_505_1.var_.characterEffect2078ui_story then
					arg_505_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_505_1.time_ >= var_508_10 + var_508_11 and arg_505_1.time_ < var_508_10 + var_508_11 + arg_508_0 and arg_505_1.var_.characterEffect2078ui_story then
				arg_505_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_508_13 = 0

			if var_508_13 < arg_505_1.time_ and arg_505_1.time_ <= var_508_13 + arg_508_0 then
				arg_505_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_508_14 = 0

			if var_508_14 < arg_505_1.time_ and arg_505_1.time_ <= var_508_14 + arg_508_0 then
				arg_505_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_508_15 = arg_505_1.actors_["2079ui_story"].transform
			local var_508_16 = 0

			if var_508_16 < arg_505_1.time_ and arg_505_1.time_ <= var_508_16 + arg_508_0 then
				arg_505_1.var_.moveOldPos2079ui_story = var_508_15.localPosition
			end

			local var_508_17 = 0.001

			if var_508_16 <= arg_505_1.time_ and arg_505_1.time_ < var_508_16 + var_508_17 then
				local var_508_18 = (arg_505_1.time_ - var_508_16) / var_508_17
				local var_508_19 = Vector3.New(0.7, -1.28, -5.6)

				var_508_15.localPosition = Vector3.Lerp(arg_505_1.var_.moveOldPos2079ui_story, var_508_19, var_508_18)

				local var_508_20 = manager.ui.mainCamera.transform.position - var_508_15.position

				var_508_15.forward = Vector3.New(var_508_20.x, var_508_20.y, var_508_20.z)

				local var_508_21 = var_508_15.localEulerAngles

				var_508_21.z = 0
				var_508_21.x = 0
				var_508_15.localEulerAngles = var_508_21
			end

			if arg_505_1.time_ >= var_508_16 + var_508_17 and arg_505_1.time_ < var_508_16 + var_508_17 + arg_508_0 then
				var_508_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_508_22 = manager.ui.mainCamera.transform.position - var_508_15.position

				var_508_15.forward = Vector3.New(var_508_22.x, var_508_22.y, var_508_22.z)

				local var_508_23 = var_508_15.localEulerAngles

				var_508_23.z = 0
				var_508_23.x = 0
				var_508_15.localEulerAngles = var_508_23
			end

			local var_508_24 = arg_505_1.actors_["2079ui_story"]
			local var_508_25 = 0

			if var_508_25 < arg_505_1.time_ and arg_505_1.time_ <= var_508_25 + arg_508_0 and arg_505_1.var_.characterEffect2079ui_story == nil then
				arg_505_1.var_.characterEffect2079ui_story = var_508_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_26 = 0.200000002980232

			if var_508_25 <= arg_505_1.time_ and arg_505_1.time_ < var_508_25 + var_508_26 then
				local var_508_27 = (arg_505_1.time_ - var_508_25) / var_508_26

				if arg_505_1.var_.characterEffect2079ui_story then
					local var_508_28 = Mathf.Lerp(0, 0.5, var_508_27)

					arg_505_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_505_1.var_.characterEffect2079ui_story.fillRatio = var_508_28
				end
			end

			if arg_505_1.time_ >= var_508_25 + var_508_26 and arg_505_1.time_ < var_508_25 + var_508_26 + arg_508_0 and arg_505_1.var_.characterEffect2079ui_story then
				local var_508_29 = 0.5

				arg_505_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_505_1.var_.characterEffect2079ui_story.fillRatio = var_508_29
			end

			local var_508_30 = 0
			local var_508_31 = 0.675

			if var_508_30 < arg_505_1.time_ and arg_505_1.time_ <= var_508_30 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, true)

				local var_508_32 = arg_505_1:FormatText(StoryNameCfg[530].name)

				arg_505_1.leftNameTxt_.text = var_508_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_505_1.leftNameTxt_.transform)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1.leftNameTxt_.text)
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_33 = arg_505_1:GetWordFromCfg(317012123)
				local var_508_34 = arg_505_1:FormatText(var_508_33.content)

				arg_505_1.text_.text = var_508_34

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_35 = 27
				local var_508_36 = utf8.len(var_508_34)
				local var_508_37 = var_508_35 <= 0 and var_508_31 or var_508_31 * (var_508_36 / var_508_35)

				if var_508_37 > 0 and var_508_31 < var_508_37 then
					arg_505_1.talkMaxDuration = var_508_37

					if var_508_37 + var_508_30 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_37 + var_508_30
					end
				end

				arg_505_1.text_.text = var_508_34
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012123", "story_v_out_317012.awb") ~= 0 then
					local var_508_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012123", "story_v_out_317012.awb") / 1000

					if var_508_38 + var_508_30 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_38 + var_508_30
					end

					if var_508_33.prefab_name ~= "" and arg_505_1.actors_[var_508_33.prefab_name] ~= nil then
						local var_508_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_505_1.actors_[var_508_33.prefab_name].transform, "story_v_out_317012", "317012123", "story_v_out_317012.awb")

						arg_505_1:RecordAudio("317012123", var_508_39)
						arg_505_1:RecordAudio("317012123", var_508_39)
					else
						arg_505_1:AudioAction("play", "voice", "story_v_out_317012", "317012123", "story_v_out_317012.awb")
					end

					arg_505_1:RecordHistoryTalkVoice("story_v_out_317012", "317012123", "story_v_out_317012.awb")
				end

				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_40 = math.max(var_508_31, arg_505_1.talkMaxDuration)

			if var_508_30 <= arg_505_1.time_ and arg_505_1.time_ < var_508_30 + var_508_40 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_30) / var_508_40

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_30 + var_508_40 and arg_505_1.time_ < var_508_30 + var_508_40 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play317012124 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 317012124
		arg_509_1.duration_ = 4.1

		local var_509_0 = {
			zh = 2.766,
			ja = 4.1
		}
		local var_509_1 = manager.audio:GetLocalizationFlag()

		if var_509_0[var_509_1] ~= nil then
			arg_509_1.duration_ = var_509_0[var_509_1]
		end

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play317012125(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = arg_509_1.actors_["2078ui_story"].transform
			local var_512_1 = 0

			if var_512_1 < arg_509_1.time_ and arg_509_1.time_ <= var_512_1 + arg_512_0 then
				arg_509_1.var_.moveOldPos2078ui_story = var_512_0.localPosition
			end

			local var_512_2 = 0.001

			if var_512_1 <= arg_509_1.time_ and arg_509_1.time_ < var_512_1 + var_512_2 then
				local var_512_3 = (arg_509_1.time_ - var_512_1) / var_512_2
				local var_512_4 = Vector3.New(0, 100, 0)

				var_512_0.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos2078ui_story, var_512_4, var_512_3)

				local var_512_5 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_5.x, var_512_5.y, var_512_5.z)

				local var_512_6 = var_512_0.localEulerAngles

				var_512_6.z = 0
				var_512_6.x = 0
				var_512_0.localEulerAngles = var_512_6
			end

			if arg_509_1.time_ >= var_512_1 + var_512_2 and arg_509_1.time_ < var_512_1 + var_512_2 + arg_512_0 then
				var_512_0.localPosition = Vector3.New(0, 100, 0)

				local var_512_7 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_7.x, var_512_7.y, var_512_7.z)

				local var_512_8 = var_512_0.localEulerAngles

				var_512_8.z = 0
				var_512_8.x = 0
				var_512_0.localEulerAngles = var_512_8
			end

			local var_512_9 = arg_509_1.actors_["2078ui_story"]
			local var_512_10 = 0

			if var_512_10 < arg_509_1.time_ and arg_509_1.time_ <= var_512_10 + arg_512_0 and arg_509_1.var_.characterEffect2078ui_story == nil then
				arg_509_1.var_.characterEffect2078ui_story = var_512_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_11 = 0.200000002980232

			if var_512_10 <= arg_509_1.time_ and arg_509_1.time_ < var_512_10 + var_512_11 then
				local var_512_12 = (arg_509_1.time_ - var_512_10) / var_512_11

				if arg_509_1.var_.characterEffect2078ui_story then
					local var_512_13 = Mathf.Lerp(0, 0.5, var_512_12)

					arg_509_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_509_1.var_.characterEffect2078ui_story.fillRatio = var_512_13
				end
			end

			if arg_509_1.time_ >= var_512_10 + var_512_11 and arg_509_1.time_ < var_512_10 + var_512_11 + arg_512_0 and arg_509_1.var_.characterEffect2078ui_story then
				local var_512_14 = 0.5

				arg_509_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_509_1.var_.characterEffect2078ui_story.fillRatio = var_512_14
			end

			local var_512_15 = arg_509_1.actors_["2079ui_story"].transform
			local var_512_16 = 0

			if var_512_16 < arg_509_1.time_ and arg_509_1.time_ <= var_512_16 + arg_512_0 then
				arg_509_1.var_.moveOldPos2079ui_story = var_512_15.localPosition
			end

			local var_512_17 = 0.001

			if var_512_16 <= arg_509_1.time_ and arg_509_1.time_ < var_512_16 + var_512_17 then
				local var_512_18 = (arg_509_1.time_ - var_512_16) / var_512_17
				local var_512_19 = Vector3.New(0, 100, 0)

				var_512_15.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos2079ui_story, var_512_19, var_512_18)

				local var_512_20 = manager.ui.mainCamera.transform.position - var_512_15.position

				var_512_15.forward = Vector3.New(var_512_20.x, var_512_20.y, var_512_20.z)

				local var_512_21 = var_512_15.localEulerAngles

				var_512_21.z = 0
				var_512_21.x = 0
				var_512_15.localEulerAngles = var_512_21
			end

			if arg_509_1.time_ >= var_512_16 + var_512_17 and arg_509_1.time_ < var_512_16 + var_512_17 + arg_512_0 then
				var_512_15.localPosition = Vector3.New(0, 100, 0)

				local var_512_22 = manager.ui.mainCamera.transform.position - var_512_15.position

				var_512_15.forward = Vector3.New(var_512_22.x, var_512_22.y, var_512_22.z)

				local var_512_23 = var_512_15.localEulerAngles

				var_512_23.z = 0
				var_512_23.x = 0
				var_512_15.localEulerAngles = var_512_23
			end

			local var_512_24 = arg_509_1.actors_["2079ui_story"]
			local var_512_25 = 0

			if var_512_25 < arg_509_1.time_ and arg_509_1.time_ <= var_512_25 + arg_512_0 and arg_509_1.var_.characterEffect2079ui_story == nil then
				arg_509_1.var_.characterEffect2079ui_story = var_512_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_26 = 0.200000002980232

			if var_512_25 <= arg_509_1.time_ and arg_509_1.time_ < var_512_25 + var_512_26 then
				local var_512_27 = (arg_509_1.time_ - var_512_25) / var_512_26

				if arg_509_1.var_.characterEffect2079ui_story then
					local var_512_28 = Mathf.Lerp(0, 0.5, var_512_27)

					arg_509_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_509_1.var_.characterEffect2079ui_story.fillRatio = var_512_28
				end
			end

			if arg_509_1.time_ >= var_512_25 + var_512_26 and arg_509_1.time_ < var_512_25 + var_512_26 + arg_512_0 and arg_509_1.var_.characterEffect2079ui_story then
				local var_512_29 = 0.5

				arg_509_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_509_1.var_.characterEffect2079ui_story.fillRatio = var_512_29
			end

			local var_512_30 = arg_509_1.actors_["1015ui_story"].transform
			local var_512_31 = 0

			if var_512_31 < arg_509_1.time_ and arg_509_1.time_ <= var_512_31 + arg_512_0 then
				arg_509_1.var_.moveOldPos1015ui_story = var_512_30.localPosition
			end

			local var_512_32 = 0.001

			if var_512_31 <= arg_509_1.time_ and arg_509_1.time_ < var_512_31 + var_512_32 then
				local var_512_33 = (arg_509_1.time_ - var_512_31) / var_512_32
				local var_512_34 = Vector3.New(0, -1.15, -6.2)

				var_512_30.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos1015ui_story, var_512_34, var_512_33)

				local var_512_35 = manager.ui.mainCamera.transform.position - var_512_30.position

				var_512_30.forward = Vector3.New(var_512_35.x, var_512_35.y, var_512_35.z)

				local var_512_36 = var_512_30.localEulerAngles

				var_512_36.z = 0
				var_512_36.x = 0
				var_512_30.localEulerAngles = var_512_36
			end

			if arg_509_1.time_ >= var_512_31 + var_512_32 and arg_509_1.time_ < var_512_31 + var_512_32 + arg_512_0 then
				var_512_30.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_512_37 = manager.ui.mainCamera.transform.position - var_512_30.position

				var_512_30.forward = Vector3.New(var_512_37.x, var_512_37.y, var_512_37.z)

				local var_512_38 = var_512_30.localEulerAngles

				var_512_38.z = 0
				var_512_38.x = 0
				var_512_30.localEulerAngles = var_512_38
			end

			local var_512_39 = arg_509_1.actors_["1015ui_story"]
			local var_512_40 = 0

			if var_512_40 < arg_509_1.time_ and arg_509_1.time_ <= var_512_40 + arg_512_0 and arg_509_1.var_.characterEffect1015ui_story == nil then
				arg_509_1.var_.characterEffect1015ui_story = var_512_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_41 = 0.200000002980232

			if var_512_40 <= arg_509_1.time_ and arg_509_1.time_ < var_512_40 + var_512_41 then
				local var_512_42 = (arg_509_1.time_ - var_512_40) / var_512_41

				if arg_509_1.var_.characterEffect1015ui_story then
					arg_509_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_509_1.time_ >= var_512_40 + var_512_41 and arg_509_1.time_ < var_512_40 + var_512_41 + arg_512_0 and arg_509_1.var_.characterEffect1015ui_story then
				arg_509_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_512_43 = 0

			if var_512_43 < arg_509_1.time_ and arg_509_1.time_ <= var_512_43 + arg_512_0 then
				arg_509_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_512_44 = 0

			if var_512_44 < arg_509_1.time_ and arg_509_1.time_ <= var_512_44 + arg_512_0 then
				arg_509_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_512_45 = 0
			local var_512_46 = 0.35

			if var_512_45 < arg_509_1.time_ and arg_509_1.time_ <= var_512_45 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, true)

				local var_512_47 = arg_509_1:FormatText(StoryNameCfg[479].name)

				arg_509_1.leftNameTxt_.text = var_512_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_509_1.leftNameTxt_.transform)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1.leftNameTxt_.text)
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_48 = arg_509_1:GetWordFromCfg(317012124)
				local var_512_49 = arg_509_1:FormatText(var_512_48.content)

				arg_509_1.text_.text = var_512_49

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_50 = 14
				local var_512_51 = utf8.len(var_512_49)
				local var_512_52 = var_512_50 <= 0 and var_512_46 or var_512_46 * (var_512_51 / var_512_50)

				if var_512_52 > 0 and var_512_46 < var_512_52 then
					arg_509_1.talkMaxDuration = var_512_52

					if var_512_52 + var_512_45 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_52 + var_512_45
					end
				end

				arg_509_1.text_.text = var_512_49
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012124", "story_v_out_317012.awb") ~= 0 then
					local var_512_53 = manager.audio:GetVoiceLength("story_v_out_317012", "317012124", "story_v_out_317012.awb") / 1000

					if var_512_53 + var_512_45 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_53 + var_512_45
					end

					if var_512_48.prefab_name ~= "" and arg_509_1.actors_[var_512_48.prefab_name] ~= nil then
						local var_512_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_509_1.actors_[var_512_48.prefab_name].transform, "story_v_out_317012", "317012124", "story_v_out_317012.awb")

						arg_509_1:RecordAudio("317012124", var_512_54)
						arg_509_1:RecordAudio("317012124", var_512_54)
					else
						arg_509_1:AudioAction("play", "voice", "story_v_out_317012", "317012124", "story_v_out_317012.awb")
					end

					arg_509_1:RecordHistoryTalkVoice("story_v_out_317012", "317012124", "story_v_out_317012.awb")
				end

				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_55 = math.max(var_512_46, arg_509_1.talkMaxDuration)

			if var_512_45 <= arg_509_1.time_ and arg_509_1.time_ < var_512_45 + var_512_55 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_45) / var_512_55

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_45 + var_512_55 and arg_509_1.time_ < var_512_45 + var_512_55 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play317012125 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 317012125
		arg_513_1.duration_ = 5

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play317012126(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = arg_513_1.actors_["2078ui_story"].transform
			local var_516_1 = 0

			if var_516_1 < arg_513_1.time_ and arg_513_1.time_ <= var_516_1 + arg_516_0 then
				arg_513_1.var_.moveOldPos2078ui_story = var_516_0.localPosition
			end

			local var_516_2 = 0.001

			if var_516_1 <= arg_513_1.time_ and arg_513_1.time_ < var_516_1 + var_516_2 then
				local var_516_3 = (arg_513_1.time_ - var_516_1) / var_516_2
				local var_516_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_516_0.localPosition = Vector3.Lerp(arg_513_1.var_.moveOldPos2078ui_story, var_516_4, var_516_3)

				local var_516_5 = manager.ui.mainCamera.transform.position - var_516_0.position

				var_516_0.forward = Vector3.New(var_516_5.x, var_516_5.y, var_516_5.z)

				local var_516_6 = var_516_0.localEulerAngles

				var_516_6.z = 0
				var_516_6.x = 0
				var_516_0.localEulerAngles = var_516_6
			end

			if arg_513_1.time_ >= var_516_1 + var_516_2 and arg_513_1.time_ < var_516_1 + var_516_2 + arg_516_0 then
				var_516_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_516_7 = manager.ui.mainCamera.transform.position - var_516_0.position

				var_516_0.forward = Vector3.New(var_516_7.x, var_516_7.y, var_516_7.z)

				local var_516_8 = var_516_0.localEulerAngles

				var_516_8.z = 0
				var_516_8.x = 0
				var_516_0.localEulerAngles = var_516_8
			end

			local var_516_9 = arg_513_1.actors_["2078ui_story"]
			local var_516_10 = 0

			if var_516_10 < arg_513_1.time_ and arg_513_1.time_ <= var_516_10 + arg_516_0 and arg_513_1.var_.characterEffect2078ui_story == nil then
				arg_513_1.var_.characterEffect2078ui_story = var_516_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_11 = 0.200000002980232

			if var_516_10 <= arg_513_1.time_ and arg_513_1.time_ < var_516_10 + var_516_11 then
				local var_516_12 = (arg_513_1.time_ - var_516_10) / var_516_11

				if arg_513_1.var_.characterEffect2078ui_story then
					local var_516_13 = Mathf.Lerp(0, 0.5, var_516_12)

					arg_513_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_513_1.var_.characterEffect2078ui_story.fillRatio = var_516_13
				end
			end

			if arg_513_1.time_ >= var_516_10 + var_516_11 and arg_513_1.time_ < var_516_10 + var_516_11 + arg_516_0 and arg_513_1.var_.characterEffect2078ui_story then
				local var_516_14 = 0.5

				arg_513_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_513_1.var_.characterEffect2078ui_story.fillRatio = var_516_14
			end

			local var_516_15 = arg_513_1.actors_["2079ui_story"].transform
			local var_516_16 = 0

			if var_516_16 < arg_513_1.time_ and arg_513_1.time_ <= var_516_16 + arg_516_0 then
				arg_513_1.var_.moveOldPos2079ui_story = var_516_15.localPosition
			end

			local var_516_17 = 0.001

			if var_516_16 <= arg_513_1.time_ and arg_513_1.time_ < var_516_16 + var_516_17 then
				local var_516_18 = (arg_513_1.time_ - var_516_16) / var_516_17
				local var_516_19 = Vector3.New(0.7, -1.28, -5.6)

				var_516_15.localPosition = Vector3.Lerp(arg_513_1.var_.moveOldPos2079ui_story, var_516_19, var_516_18)

				local var_516_20 = manager.ui.mainCamera.transform.position - var_516_15.position

				var_516_15.forward = Vector3.New(var_516_20.x, var_516_20.y, var_516_20.z)

				local var_516_21 = var_516_15.localEulerAngles

				var_516_21.z = 0
				var_516_21.x = 0
				var_516_15.localEulerAngles = var_516_21
			end

			if arg_513_1.time_ >= var_516_16 + var_516_17 and arg_513_1.time_ < var_516_16 + var_516_17 + arg_516_0 then
				var_516_15.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_516_22 = manager.ui.mainCamera.transform.position - var_516_15.position

				var_516_15.forward = Vector3.New(var_516_22.x, var_516_22.y, var_516_22.z)

				local var_516_23 = var_516_15.localEulerAngles

				var_516_23.z = 0
				var_516_23.x = 0
				var_516_15.localEulerAngles = var_516_23
			end

			local var_516_24 = arg_513_1.actors_["2079ui_story"]
			local var_516_25 = 0

			if var_516_25 < arg_513_1.time_ and arg_513_1.time_ <= var_516_25 + arg_516_0 and arg_513_1.var_.characterEffect2079ui_story == nil then
				arg_513_1.var_.characterEffect2079ui_story = var_516_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_26 = 0.200000002980232

			if var_516_25 <= arg_513_1.time_ and arg_513_1.time_ < var_516_25 + var_516_26 then
				local var_516_27 = (arg_513_1.time_ - var_516_25) / var_516_26

				if arg_513_1.var_.characterEffect2079ui_story then
					local var_516_28 = Mathf.Lerp(0, 0.5, var_516_27)

					arg_513_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_513_1.var_.characterEffect2079ui_story.fillRatio = var_516_28
				end
			end

			if arg_513_1.time_ >= var_516_25 + var_516_26 and arg_513_1.time_ < var_516_25 + var_516_26 + arg_516_0 and arg_513_1.var_.characterEffect2079ui_story then
				local var_516_29 = 0.5

				arg_513_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_513_1.var_.characterEffect2079ui_story.fillRatio = var_516_29
			end

			local var_516_30 = arg_513_1.actors_["1015ui_story"].transform
			local var_516_31 = 0

			if var_516_31 < arg_513_1.time_ and arg_513_1.time_ <= var_516_31 + arg_516_0 then
				arg_513_1.var_.moveOldPos1015ui_story = var_516_30.localPosition
			end

			local var_516_32 = 0.001

			if var_516_31 <= arg_513_1.time_ and arg_513_1.time_ < var_516_31 + var_516_32 then
				local var_516_33 = (arg_513_1.time_ - var_516_31) / var_516_32
				local var_516_34 = Vector3.New(0, 100, 0)

				var_516_30.localPosition = Vector3.Lerp(arg_513_1.var_.moveOldPos1015ui_story, var_516_34, var_516_33)

				local var_516_35 = manager.ui.mainCamera.transform.position - var_516_30.position

				var_516_30.forward = Vector3.New(var_516_35.x, var_516_35.y, var_516_35.z)

				local var_516_36 = var_516_30.localEulerAngles

				var_516_36.z = 0
				var_516_36.x = 0
				var_516_30.localEulerAngles = var_516_36
			end

			if arg_513_1.time_ >= var_516_31 + var_516_32 and arg_513_1.time_ < var_516_31 + var_516_32 + arg_516_0 then
				var_516_30.localPosition = Vector3.New(0, 100, 0)

				local var_516_37 = manager.ui.mainCamera.transform.position - var_516_30.position

				var_516_30.forward = Vector3.New(var_516_37.x, var_516_37.y, var_516_37.z)

				local var_516_38 = var_516_30.localEulerAngles

				var_516_38.z = 0
				var_516_38.x = 0
				var_516_30.localEulerAngles = var_516_38
			end

			local var_516_39 = arg_513_1.actors_["1015ui_story"]
			local var_516_40 = 0

			if var_516_40 < arg_513_1.time_ and arg_513_1.time_ <= var_516_40 + arg_516_0 and arg_513_1.var_.characterEffect1015ui_story == nil then
				arg_513_1.var_.characterEffect1015ui_story = var_516_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_41 = 0.200000002980232

			if var_516_40 <= arg_513_1.time_ and arg_513_1.time_ < var_516_40 + var_516_41 then
				local var_516_42 = (arg_513_1.time_ - var_516_40) / var_516_41

				if arg_513_1.var_.characterEffect1015ui_story then
					local var_516_43 = Mathf.Lerp(0, 0.5, var_516_42)

					arg_513_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_513_1.var_.characterEffect1015ui_story.fillRatio = var_516_43
				end
			end

			if arg_513_1.time_ >= var_516_40 + var_516_41 and arg_513_1.time_ < var_516_40 + var_516_41 + arg_516_0 and arg_513_1.var_.characterEffect1015ui_story then
				local var_516_44 = 0.5

				arg_513_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_513_1.var_.characterEffect1015ui_story.fillRatio = var_516_44
			end

			local var_516_45 = 0
			local var_516_46 = 1.475

			if var_516_45 < arg_513_1.time_ and arg_513_1.time_ <= var_516_45 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, false)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_47 = arg_513_1:GetWordFromCfg(317012125)
				local var_516_48 = arg_513_1:FormatText(var_516_47.content)

				arg_513_1.text_.text = var_516_48

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_49 = 59
				local var_516_50 = utf8.len(var_516_48)
				local var_516_51 = var_516_49 <= 0 and var_516_46 or var_516_46 * (var_516_50 / var_516_49)

				if var_516_51 > 0 and var_516_46 < var_516_51 then
					arg_513_1.talkMaxDuration = var_516_51

					if var_516_51 + var_516_45 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_51 + var_516_45
					end
				end

				arg_513_1.text_.text = var_516_48
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)
				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_52 = math.max(var_516_46, arg_513_1.talkMaxDuration)

			if var_516_45 <= arg_513_1.time_ and arg_513_1.time_ < var_516_45 + var_516_52 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_45) / var_516_52

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_45 + var_516_52 and arg_513_1.time_ < var_516_45 + var_516_52 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play317012126 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 317012126
		arg_517_1.duration_ = 9.533

		local var_517_0 = {
			zh = 9.533,
			ja = 9.366
		}
		local var_517_1 = manager.audio:GetLocalizationFlag()

		if var_517_0[var_517_1] ~= nil then
			arg_517_1.duration_ = var_517_0[var_517_1]
		end

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play317012127(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = arg_517_1.actors_["2078ui_story"].transform
			local var_520_1 = 0

			if var_520_1 < arg_517_1.time_ and arg_517_1.time_ <= var_520_1 + arg_520_0 then
				arg_517_1.var_.moveOldPos2078ui_story = var_520_0.localPosition
			end

			local var_520_2 = 0.001

			if var_520_1 <= arg_517_1.time_ and arg_517_1.time_ < var_520_1 + var_520_2 then
				local var_520_3 = (arg_517_1.time_ - var_520_1) / var_520_2
				local var_520_4 = Vector3.New(0, 100, 0)

				var_520_0.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPos2078ui_story, var_520_4, var_520_3)

				local var_520_5 = manager.ui.mainCamera.transform.position - var_520_0.position

				var_520_0.forward = Vector3.New(var_520_5.x, var_520_5.y, var_520_5.z)

				local var_520_6 = var_520_0.localEulerAngles

				var_520_6.z = 0
				var_520_6.x = 0
				var_520_0.localEulerAngles = var_520_6
			end

			if arg_517_1.time_ >= var_520_1 + var_520_2 and arg_517_1.time_ < var_520_1 + var_520_2 + arg_520_0 then
				var_520_0.localPosition = Vector3.New(0, 100, 0)

				local var_520_7 = manager.ui.mainCamera.transform.position - var_520_0.position

				var_520_0.forward = Vector3.New(var_520_7.x, var_520_7.y, var_520_7.z)

				local var_520_8 = var_520_0.localEulerAngles

				var_520_8.z = 0
				var_520_8.x = 0
				var_520_0.localEulerAngles = var_520_8
			end

			local var_520_9 = arg_517_1.actors_["2078ui_story"]
			local var_520_10 = 0

			if var_520_10 < arg_517_1.time_ and arg_517_1.time_ <= var_520_10 + arg_520_0 and arg_517_1.var_.characterEffect2078ui_story == nil then
				arg_517_1.var_.characterEffect2078ui_story = var_520_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_11 = 0.200000002980232

			if var_520_10 <= arg_517_1.time_ and arg_517_1.time_ < var_520_10 + var_520_11 then
				local var_520_12 = (arg_517_1.time_ - var_520_10) / var_520_11

				if arg_517_1.var_.characterEffect2078ui_story then
					local var_520_13 = Mathf.Lerp(0, 0.5, var_520_12)

					arg_517_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_517_1.var_.characterEffect2078ui_story.fillRatio = var_520_13
				end
			end

			if arg_517_1.time_ >= var_520_10 + var_520_11 and arg_517_1.time_ < var_520_10 + var_520_11 + arg_520_0 and arg_517_1.var_.characterEffect2078ui_story then
				local var_520_14 = 0.5

				arg_517_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_517_1.var_.characterEffect2078ui_story.fillRatio = var_520_14
			end

			local var_520_15 = arg_517_1.actors_["2079ui_story"].transform
			local var_520_16 = 0

			if var_520_16 < arg_517_1.time_ and arg_517_1.time_ <= var_520_16 + arg_520_0 then
				arg_517_1.var_.moveOldPos2079ui_story = var_520_15.localPosition
			end

			local var_520_17 = 0.001

			if var_520_16 <= arg_517_1.time_ and arg_517_1.time_ < var_520_16 + var_520_17 then
				local var_520_18 = (arg_517_1.time_ - var_520_16) / var_520_17
				local var_520_19 = Vector3.New(0, 100, 0)

				var_520_15.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPos2079ui_story, var_520_19, var_520_18)

				local var_520_20 = manager.ui.mainCamera.transform.position - var_520_15.position

				var_520_15.forward = Vector3.New(var_520_20.x, var_520_20.y, var_520_20.z)

				local var_520_21 = var_520_15.localEulerAngles

				var_520_21.z = 0
				var_520_21.x = 0
				var_520_15.localEulerAngles = var_520_21
			end

			if arg_517_1.time_ >= var_520_16 + var_520_17 and arg_517_1.time_ < var_520_16 + var_520_17 + arg_520_0 then
				var_520_15.localPosition = Vector3.New(0, 100, 0)

				local var_520_22 = manager.ui.mainCamera.transform.position - var_520_15.position

				var_520_15.forward = Vector3.New(var_520_22.x, var_520_22.y, var_520_22.z)

				local var_520_23 = var_520_15.localEulerAngles

				var_520_23.z = 0
				var_520_23.x = 0
				var_520_15.localEulerAngles = var_520_23
			end

			local var_520_24 = arg_517_1.actors_["2079ui_story"]
			local var_520_25 = 0

			if var_520_25 < arg_517_1.time_ and arg_517_1.time_ <= var_520_25 + arg_520_0 and arg_517_1.var_.characterEffect2079ui_story == nil then
				arg_517_1.var_.characterEffect2079ui_story = var_520_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_26 = 0.200000002980232

			if var_520_25 <= arg_517_1.time_ and arg_517_1.time_ < var_520_25 + var_520_26 then
				local var_520_27 = (arg_517_1.time_ - var_520_25) / var_520_26

				if arg_517_1.var_.characterEffect2079ui_story then
					local var_520_28 = Mathf.Lerp(0, 0.5, var_520_27)

					arg_517_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_517_1.var_.characterEffect2079ui_story.fillRatio = var_520_28
				end
			end

			if arg_517_1.time_ >= var_520_25 + var_520_26 and arg_517_1.time_ < var_520_25 + var_520_26 + arg_520_0 and arg_517_1.var_.characterEffect2079ui_story then
				local var_520_29 = 0.5

				arg_517_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_517_1.var_.characterEffect2079ui_story.fillRatio = var_520_29
			end

			local var_520_30 = arg_517_1.actors_["1015ui_story"].transform
			local var_520_31 = 0

			if var_520_31 < arg_517_1.time_ and arg_517_1.time_ <= var_520_31 + arg_520_0 then
				arg_517_1.var_.moveOldPos1015ui_story = var_520_30.localPosition
			end

			local var_520_32 = 0.001

			if var_520_31 <= arg_517_1.time_ and arg_517_1.time_ < var_520_31 + var_520_32 then
				local var_520_33 = (arg_517_1.time_ - var_520_31) / var_520_32
				local var_520_34 = Vector3.New(0, -1.15, -6.2)

				var_520_30.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPos1015ui_story, var_520_34, var_520_33)

				local var_520_35 = manager.ui.mainCamera.transform.position - var_520_30.position

				var_520_30.forward = Vector3.New(var_520_35.x, var_520_35.y, var_520_35.z)

				local var_520_36 = var_520_30.localEulerAngles

				var_520_36.z = 0
				var_520_36.x = 0
				var_520_30.localEulerAngles = var_520_36
			end

			if arg_517_1.time_ >= var_520_31 + var_520_32 and arg_517_1.time_ < var_520_31 + var_520_32 + arg_520_0 then
				var_520_30.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_520_37 = manager.ui.mainCamera.transform.position - var_520_30.position

				var_520_30.forward = Vector3.New(var_520_37.x, var_520_37.y, var_520_37.z)

				local var_520_38 = var_520_30.localEulerAngles

				var_520_38.z = 0
				var_520_38.x = 0
				var_520_30.localEulerAngles = var_520_38
			end

			local var_520_39 = arg_517_1.actors_["1015ui_story"]
			local var_520_40 = 0

			if var_520_40 < arg_517_1.time_ and arg_517_1.time_ <= var_520_40 + arg_520_0 and arg_517_1.var_.characterEffect1015ui_story == nil then
				arg_517_1.var_.characterEffect1015ui_story = var_520_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_41 = 0.200000002980232

			if var_520_40 <= arg_517_1.time_ and arg_517_1.time_ < var_520_40 + var_520_41 then
				local var_520_42 = (arg_517_1.time_ - var_520_40) / var_520_41

				if arg_517_1.var_.characterEffect1015ui_story then
					arg_517_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_517_1.time_ >= var_520_40 + var_520_41 and arg_517_1.time_ < var_520_40 + var_520_41 + arg_520_0 and arg_517_1.var_.characterEffect1015ui_story then
				arg_517_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_520_43 = 0

			if var_520_43 < arg_517_1.time_ and arg_517_1.time_ <= var_520_43 + arg_520_0 then
				arg_517_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_520_44 = 0

			if var_520_44 < arg_517_1.time_ and arg_517_1.time_ <= var_520_44 + arg_520_0 then
				arg_517_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_520_45 = 0
			local var_520_46 = 1.05

			if var_520_45 < arg_517_1.time_ and arg_517_1.time_ <= var_520_45 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_47 = arg_517_1:FormatText(StoryNameCfg[479].name)

				arg_517_1.leftNameTxt_.text = var_520_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_48 = arg_517_1:GetWordFromCfg(317012126)
				local var_520_49 = arg_517_1:FormatText(var_520_48.content)

				arg_517_1.text_.text = var_520_49

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_50 = 42
				local var_520_51 = utf8.len(var_520_49)
				local var_520_52 = var_520_50 <= 0 and var_520_46 or var_520_46 * (var_520_51 / var_520_50)

				if var_520_52 > 0 and var_520_46 < var_520_52 then
					arg_517_1.talkMaxDuration = var_520_52

					if var_520_52 + var_520_45 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_52 + var_520_45
					end
				end

				arg_517_1.text_.text = var_520_49
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012126", "story_v_out_317012.awb") ~= 0 then
					local var_520_53 = manager.audio:GetVoiceLength("story_v_out_317012", "317012126", "story_v_out_317012.awb") / 1000

					if var_520_53 + var_520_45 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_53 + var_520_45
					end

					if var_520_48.prefab_name ~= "" and arg_517_1.actors_[var_520_48.prefab_name] ~= nil then
						local var_520_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_48.prefab_name].transform, "story_v_out_317012", "317012126", "story_v_out_317012.awb")

						arg_517_1:RecordAudio("317012126", var_520_54)
						arg_517_1:RecordAudio("317012126", var_520_54)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_out_317012", "317012126", "story_v_out_317012.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_out_317012", "317012126", "story_v_out_317012.awb")
				end

				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_55 = math.max(var_520_46, arg_517_1.talkMaxDuration)

			if var_520_45 <= arg_517_1.time_ and arg_517_1.time_ < var_520_45 + var_520_55 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_45) / var_520_55

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_45 + var_520_55 and arg_517_1.time_ < var_520_45 + var_520_55 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play317012127 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 317012127
		arg_521_1.duration_ = 1.3

		local var_521_0 = {
			zh = 1.133,
			ja = 1.3
		}
		local var_521_1 = manager.audio:GetLocalizationFlag()

		if var_521_0[var_521_1] ~= nil then
			arg_521_1.duration_ = var_521_0[var_521_1]
		end

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
			arg_521_1.auto_ = false
		end

		function arg_521_1.playNext_(arg_523_0)
			arg_521_1.onStoryFinished_()
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = arg_521_1.actors_["2078ui_story"].transform
			local var_524_1 = 0

			if var_524_1 < arg_521_1.time_ and arg_521_1.time_ <= var_524_1 + arg_524_0 then
				arg_521_1.var_.moveOldPos2078ui_story = var_524_0.localPosition
			end

			local var_524_2 = 0.001

			if var_524_1 <= arg_521_1.time_ and arg_521_1.time_ < var_524_1 + var_524_2 then
				local var_524_3 = (arg_521_1.time_ - var_524_1) / var_524_2
				local var_524_4 = Vector3.New(0, -1.28, -5.6)

				var_524_0.localPosition = Vector3.Lerp(arg_521_1.var_.moveOldPos2078ui_story, var_524_4, var_524_3)

				local var_524_5 = manager.ui.mainCamera.transform.position - var_524_0.position

				var_524_0.forward = Vector3.New(var_524_5.x, var_524_5.y, var_524_5.z)

				local var_524_6 = var_524_0.localEulerAngles

				var_524_6.z = 0
				var_524_6.x = 0
				var_524_0.localEulerAngles = var_524_6
			end

			if arg_521_1.time_ >= var_524_1 + var_524_2 and arg_521_1.time_ < var_524_1 + var_524_2 + arg_524_0 then
				var_524_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_524_7 = manager.ui.mainCamera.transform.position - var_524_0.position

				var_524_0.forward = Vector3.New(var_524_7.x, var_524_7.y, var_524_7.z)

				local var_524_8 = var_524_0.localEulerAngles

				var_524_8.z = 0
				var_524_8.x = 0
				var_524_0.localEulerAngles = var_524_8
			end

			local var_524_9 = arg_521_1.actors_["2078ui_story"]
			local var_524_10 = 0

			if var_524_10 < arg_521_1.time_ and arg_521_1.time_ <= var_524_10 + arg_524_0 and arg_521_1.var_.characterEffect2078ui_story == nil then
				arg_521_1.var_.characterEffect2078ui_story = var_524_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_11 = 0.200000002980232

			if var_524_10 <= arg_521_1.time_ and arg_521_1.time_ < var_524_10 + var_524_11 then
				local var_524_12 = (arg_521_1.time_ - var_524_10) / var_524_11

				if arg_521_1.var_.characterEffect2078ui_story then
					arg_521_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_521_1.time_ >= var_524_10 + var_524_11 and arg_521_1.time_ < var_524_10 + var_524_11 + arg_524_0 and arg_521_1.var_.characterEffect2078ui_story then
				arg_521_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_524_13 = 0

			if var_524_13 < arg_521_1.time_ and arg_521_1.time_ <= var_524_13 + arg_524_0 then
				arg_521_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_524_14 = 0

			if var_524_14 < arg_521_1.time_ and arg_521_1.time_ <= var_524_14 + arg_524_0 then
				arg_521_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_524_15 = arg_521_1.actors_["1015ui_story"].transform
			local var_524_16 = 0

			if var_524_16 < arg_521_1.time_ and arg_521_1.time_ <= var_524_16 + arg_524_0 then
				arg_521_1.var_.moveOldPos1015ui_story = var_524_15.localPosition
			end

			local var_524_17 = 0.001

			if var_524_16 <= arg_521_1.time_ and arg_521_1.time_ < var_524_16 + var_524_17 then
				local var_524_18 = (arg_521_1.time_ - var_524_16) / var_524_17
				local var_524_19 = Vector3.New(0, 100, 0)

				var_524_15.localPosition = Vector3.Lerp(arg_521_1.var_.moveOldPos1015ui_story, var_524_19, var_524_18)

				local var_524_20 = manager.ui.mainCamera.transform.position - var_524_15.position

				var_524_15.forward = Vector3.New(var_524_20.x, var_524_20.y, var_524_20.z)

				local var_524_21 = var_524_15.localEulerAngles

				var_524_21.z = 0
				var_524_21.x = 0
				var_524_15.localEulerAngles = var_524_21
			end

			if arg_521_1.time_ >= var_524_16 + var_524_17 and arg_521_1.time_ < var_524_16 + var_524_17 + arg_524_0 then
				var_524_15.localPosition = Vector3.New(0, 100, 0)

				local var_524_22 = manager.ui.mainCamera.transform.position - var_524_15.position

				var_524_15.forward = Vector3.New(var_524_22.x, var_524_22.y, var_524_22.z)

				local var_524_23 = var_524_15.localEulerAngles

				var_524_23.z = 0
				var_524_23.x = 0
				var_524_15.localEulerAngles = var_524_23
			end

			local var_524_24 = arg_521_1.actors_["1015ui_story"]
			local var_524_25 = 0

			if var_524_25 < arg_521_1.time_ and arg_521_1.time_ <= var_524_25 + arg_524_0 and arg_521_1.var_.characterEffect1015ui_story == nil then
				arg_521_1.var_.characterEffect1015ui_story = var_524_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_26 = 0.200000002980232

			if var_524_25 <= arg_521_1.time_ and arg_521_1.time_ < var_524_25 + var_524_26 then
				local var_524_27 = (arg_521_1.time_ - var_524_25) / var_524_26

				if arg_521_1.var_.characterEffect1015ui_story then
					local var_524_28 = Mathf.Lerp(0, 0.5, var_524_27)

					arg_521_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_521_1.var_.characterEffect1015ui_story.fillRatio = var_524_28
				end
			end

			if arg_521_1.time_ >= var_524_25 + var_524_26 and arg_521_1.time_ < var_524_25 + var_524_26 + arg_524_0 and arg_521_1.var_.characterEffect1015ui_story then
				local var_524_29 = 0.5

				arg_521_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_521_1.var_.characterEffect1015ui_story.fillRatio = var_524_29
			end

			local var_524_30 = 0
			local var_524_31 = 0.1

			if var_524_30 < arg_521_1.time_ and arg_521_1.time_ <= var_524_30 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_32 = arg_521_1:FormatText(StoryNameCfg[528].name)

				arg_521_1.leftNameTxt_.text = var_524_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_33 = arg_521_1:GetWordFromCfg(317012127)
				local var_524_34 = arg_521_1:FormatText(var_524_33.content)

				arg_521_1.text_.text = var_524_34

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_35 = 4
				local var_524_36 = utf8.len(var_524_34)
				local var_524_37 = var_524_35 <= 0 and var_524_31 or var_524_31 * (var_524_36 / var_524_35)

				if var_524_37 > 0 and var_524_31 < var_524_37 then
					arg_521_1.talkMaxDuration = var_524_37

					if var_524_37 + var_524_30 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_37 + var_524_30
					end
				end

				arg_521_1.text_.text = var_524_34
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317012", "317012127", "story_v_out_317012.awb") ~= 0 then
					local var_524_38 = manager.audio:GetVoiceLength("story_v_out_317012", "317012127", "story_v_out_317012.awb") / 1000

					if var_524_38 + var_524_30 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_38 + var_524_30
					end

					if var_524_33.prefab_name ~= "" and arg_521_1.actors_[var_524_33.prefab_name] ~= nil then
						local var_524_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_33.prefab_name].transform, "story_v_out_317012", "317012127", "story_v_out_317012.awb")

						arg_521_1:RecordAudio("317012127", var_524_39)
						arg_521_1:RecordAudio("317012127", var_524_39)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_out_317012", "317012127", "story_v_out_317012.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_out_317012", "317012127", "story_v_out_317012.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_40 = math.max(var_524_31, arg_521_1.talkMaxDuration)

			if var_524_30 <= arg_521_1.time_ and arg_521_1.time_ < var_524_30 + var_524_40 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_30) / var_524_40

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_30 + var_524_40 and arg_521_1.time_ < var_524_30 + var_524_40 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K11f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K09g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K09h",
		"Assets/UIResources/UI_AB/TextureConfig/Background/YA0101",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K02f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K06f"
	},
	voices = {
		"story_v_out_317012.awb"
	}
}
