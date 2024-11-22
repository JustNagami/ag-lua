return {
	Play319551001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319551001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319551002(arg_1_1)
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
			local var_4_23 = 0.0666666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.1
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.6

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

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[698].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(319551001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 24
				local var_4_37 = utf8.len(var_4_35)
				local var_4_38 = var_4_36 <= 0 and var_4_31 or var_4_31 * (var_4_37 / var_4_36)

				if var_4_38 > 0 and var_4_31 < var_4_38 then
					arg_1_1.talkMaxDuration = var_4_38
					var_4_30 = var_4_30 + 0.3

					if var_4_38 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_38 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_35
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_39 = var_4_30 + 0.3
			local var_4_40 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_39 <= arg_1_1.time_ and arg_1_1.time_ < var_4_39 + var_4_40 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_39) / var_4_40

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_39 + var_4_40 and arg_1_1.time_ < var_4_39 + var_4_40 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319551002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319551002
		arg_7_1.duration_ = 4.3

		local var_7_0 = {
			zh = 2.966,
			ja = 4.3
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
				arg_7_0:Play319551003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10058ui_story"

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

			local var_10_4 = arg_7_1.actors_["10058ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos10058ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -0.98, -6.1)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10058ui_story, var_10_8, var_10_7)

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

			local var_10_13 = arg_7_1.actors_["10058ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect10058ui_story == nil then
				arg_7_1.var_.characterEffect10058ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect10058ui_story then
					arg_7_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect10058ui_story then
				arg_7_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.225

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

				local var_10_22 = arg_7_1:GetWordFromCfg(319551002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551002", "story_v_out_319551.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_319551", "319551002", "story_v_out_319551.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_319551", "319551002", "story_v_out_319551.awb")

						arg_7_1:RecordAudio("319551002", var_10_28)
						arg_7_1:RecordAudio("319551002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319551", "319551002", "story_v_out_319551.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319551", "319551002", "story_v_out_319551.awb")
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
	Play319551003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319551003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play319551004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10058ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect10058ui_story == nil then
				arg_11_1.var_.characterEffect10058ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect10058ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_11_1.var_.characterEffect10058ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect10058ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_11_1.var_.characterEffect10058ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_14_7 = 0
			local var_14_8 = 1.175

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(319551003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 47
				local var_14_12 = utf8.len(var_14_10)
				local var_14_13 = var_14_11 <= 0 and var_14_8 or var_14_8 * (var_14_12 / var_14_11)

				if var_14_13 > 0 and var_14_8 < var_14_13 then
					arg_11_1.talkMaxDuration = var_14_13

					if var_14_13 + var_14_7 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_7
					end
				end

				arg_11_1.text_.text = var_14_10
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_14 = math.max(var_14_8, arg_11_1.talkMaxDuration)

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_14 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_7) / var_14_14

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_7 + var_14_14 and arg_11_1.time_ < var_14_7 + var_14_14 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319551004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319551004
		arg_15_1.duration_ = 13.733

		local var_15_0 = {
			zh = 8.6,
			ja = 13.733
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
				arg_15_0:Play319551005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "10066ui_story"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("Char/" .. var_18_0), arg_15_1.stage_.transform)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_0] = var_18_1

				local var_18_2 = var_18_1:GetComponentInChildren(typeof(CharacterEffect))

				var_18_2.enabled = true

				local var_18_3 = GameObjectTools.GetOrAddComponent(var_18_1, typeof(DynamicBoneHelper))

				if var_18_3 then
					var_18_3:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_2.transform, false)

				arg_15_1.var_[var_18_0 .. "Animator"] = var_18_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_0 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_0 .. "LipSync"] = var_18_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_4 = arg_15_1.actors_["10066ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos10066ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(0.7, -0.99, -5.83)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10066ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = arg_15_1.actors_["10066ui_story"]
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 and arg_15_1.var_.characterEffect10066ui_story == nil then
				arg_15_1.var_.characterEffect10066ui_story = var_18_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_15 = 0.200000002980232

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_15 then
				local var_18_16 = (arg_15_1.time_ - var_18_14) / var_18_15

				if arg_15_1.var_.characterEffect10066ui_story then
					arg_15_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_14 + var_18_15 and arg_15_1.time_ < var_18_14 + var_18_15 + arg_18_0 and arg_15_1.var_.characterEffect10066ui_story then
				arg_15_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action1_1")
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_19 = arg_15_1.actors_["10058ui_story"].transform
			local var_18_20 = 0

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 then
				arg_15_1.var_.moveOldPos10058ui_story = var_18_19.localPosition
			end

			local var_18_21 = 0.001

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_21 then
				local var_18_22 = (arg_15_1.time_ - var_18_20) / var_18_21
				local var_18_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_18_19.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10058ui_story, var_18_23, var_18_22)

				local var_18_24 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_24.x, var_18_24.y, var_18_24.z)

				local var_18_25 = var_18_19.localEulerAngles

				var_18_25.z = 0
				var_18_25.x = 0
				var_18_19.localEulerAngles = var_18_25
			end

			if arg_15_1.time_ >= var_18_20 + var_18_21 and arg_15_1.time_ < var_18_20 + var_18_21 + arg_18_0 then
				var_18_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_18_26 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_26.x, var_18_26.y, var_18_26.z)

				local var_18_27 = var_18_19.localEulerAngles

				var_18_27.z = 0
				var_18_27.x = 0
				var_18_19.localEulerAngles = var_18_27
			end

			local var_18_28 = arg_15_1.actors_["10058ui_story"]
			local var_18_29 = 0

			if var_18_29 < arg_15_1.time_ and arg_15_1.time_ <= var_18_29 + arg_18_0 and arg_15_1.var_.characterEffect10058ui_story == nil then
				arg_15_1.var_.characterEffect10058ui_story = var_18_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_30 = 0.200000002980232

			if var_18_29 <= arg_15_1.time_ and arg_15_1.time_ < var_18_29 + var_18_30 then
				local var_18_31 = (arg_15_1.time_ - var_18_29) / var_18_30

				if arg_15_1.var_.characterEffect10058ui_story then
					local var_18_32 = Mathf.Lerp(0, 0.5, var_18_31)

					arg_15_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_15_1.var_.characterEffect10058ui_story.fillRatio = var_18_32
				end
			end

			if arg_15_1.time_ >= var_18_29 + var_18_30 and arg_15_1.time_ < var_18_29 + var_18_30 + arg_18_0 and arg_15_1.var_.characterEffect10058ui_story then
				local var_18_33 = 0.5

				arg_15_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_15_1.var_.characterEffect10058ui_story.fillRatio = var_18_33
			end

			local var_18_34 = 0
			local var_18_35 = 0.875

			if var_18_34 < arg_15_1.time_ and arg_15_1.time_ <= var_18_34 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_36 = arg_15_1:FormatText(StoryNameCfg[640].name)

				arg_15_1.leftNameTxt_.text = var_18_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_37 = arg_15_1:GetWordFromCfg(319551004)
				local var_18_38 = arg_15_1:FormatText(var_18_37.content)

				arg_15_1.text_.text = var_18_38

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_39 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551004", "story_v_out_319551.awb") ~= 0 then
					local var_18_42 = manager.audio:GetVoiceLength("story_v_out_319551", "319551004", "story_v_out_319551.awb") / 1000

					if var_18_42 + var_18_34 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_42 + var_18_34
					end

					if var_18_37.prefab_name ~= "" and arg_15_1.actors_[var_18_37.prefab_name] ~= nil then
						local var_18_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_37.prefab_name].transform, "story_v_out_319551", "319551004", "story_v_out_319551.awb")

						arg_15_1:RecordAudio("319551004", var_18_43)
						arg_15_1:RecordAudio("319551004", var_18_43)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319551", "319551004", "story_v_out_319551.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319551", "319551004", "story_v_out_319551.awb")
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
	Play319551005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319551005
		arg_19_1.duration_ = 4.4

		local var_19_0 = {
			zh = 1.999999999999,
			ja = 4.4
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
				arg_19_0:Play319551006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1084ui_story"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(Asset.Load("Char/" .. var_22_0), arg_19_1.stage_.transform)

				var_22_1.name = var_22_0
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_0] = var_22_1

				local var_22_2 = var_22_1:GetComponentInChildren(typeof(CharacterEffect))

				var_22_2.enabled = true

				local var_22_3 = GameObjectTools.GetOrAddComponent(var_22_1, typeof(DynamicBoneHelper))

				if var_22_3 then
					var_22_3:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_2.transform, false)

				arg_19_1.var_[var_22_0 .. "Animator"] = var_22_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_0 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_0 .. "LipSync"] = var_22_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_4 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0, -0.97, -6)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = arg_19_1.actors_["1084ui_story"]
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_15 = 0.200000002980232

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15

				if arg_19_1.var_.characterEffect1084ui_story then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_19 = arg_19_1.actors_["10066ui_story"].transform
			local var_22_20 = 0

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				arg_19_1.var_.moveOldPos10066ui_story = var_22_19.localPosition
			end

			local var_22_21 = 0.001

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_21 then
				local var_22_22 = (arg_19_1.time_ - var_22_20) / var_22_21
				local var_22_23 = Vector3.New(0, 100, 0)

				var_22_19.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10066ui_story, var_22_23, var_22_22)

				local var_22_24 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_24.x, var_22_24.y, var_22_24.z)

				local var_22_25 = var_22_19.localEulerAngles

				var_22_25.z = 0
				var_22_25.x = 0
				var_22_19.localEulerAngles = var_22_25
			end

			if arg_19_1.time_ >= var_22_20 + var_22_21 and arg_19_1.time_ < var_22_20 + var_22_21 + arg_22_0 then
				var_22_19.localPosition = Vector3.New(0, 100, 0)

				local var_22_26 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_26.x, var_22_26.y, var_22_26.z)

				local var_22_27 = var_22_19.localEulerAngles

				var_22_27.z = 0
				var_22_27.x = 0
				var_22_19.localEulerAngles = var_22_27
			end

			local var_22_28 = arg_19_1.actors_["10066ui_story"]
			local var_22_29 = 0

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 and arg_19_1.var_.characterEffect10066ui_story == nil then
				arg_19_1.var_.characterEffect10066ui_story = var_22_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_30 = 0.200000002980232

			if var_22_29 <= arg_19_1.time_ and arg_19_1.time_ < var_22_29 + var_22_30 then
				local var_22_31 = (arg_19_1.time_ - var_22_29) / var_22_30

				if arg_19_1.var_.characterEffect10066ui_story then
					local var_22_32 = Mathf.Lerp(0, 0.5, var_22_31)

					arg_19_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_19_1.var_.characterEffect10066ui_story.fillRatio = var_22_32
				end
			end

			if arg_19_1.time_ >= var_22_29 + var_22_30 and arg_19_1.time_ < var_22_29 + var_22_30 + arg_22_0 and arg_19_1.var_.characterEffect10066ui_story then
				local var_22_33 = 0.5

				arg_19_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_19_1.var_.characterEffect10066ui_story.fillRatio = var_22_33
			end

			local var_22_34 = arg_19_1.actors_["10058ui_story"].transform
			local var_22_35 = 0

			if var_22_35 < arg_19_1.time_ and arg_19_1.time_ <= var_22_35 + arg_22_0 then
				arg_19_1.var_.moveOldPos10058ui_story = var_22_34.localPosition
			end

			local var_22_36 = 0.001

			if var_22_35 <= arg_19_1.time_ and arg_19_1.time_ < var_22_35 + var_22_36 then
				local var_22_37 = (arg_19_1.time_ - var_22_35) / var_22_36
				local var_22_38 = Vector3.New(0, 100, 0)

				var_22_34.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10058ui_story, var_22_38, var_22_37)

				local var_22_39 = manager.ui.mainCamera.transform.position - var_22_34.position

				var_22_34.forward = Vector3.New(var_22_39.x, var_22_39.y, var_22_39.z)

				local var_22_40 = var_22_34.localEulerAngles

				var_22_40.z = 0
				var_22_40.x = 0
				var_22_34.localEulerAngles = var_22_40
			end

			if arg_19_1.time_ >= var_22_35 + var_22_36 and arg_19_1.time_ < var_22_35 + var_22_36 + arg_22_0 then
				var_22_34.localPosition = Vector3.New(0, 100, 0)

				local var_22_41 = manager.ui.mainCamera.transform.position - var_22_34.position

				var_22_34.forward = Vector3.New(var_22_41.x, var_22_41.y, var_22_41.z)

				local var_22_42 = var_22_34.localEulerAngles

				var_22_42.z = 0
				var_22_42.x = 0
				var_22_34.localEulerAngles = var_22_42
			end

			local var_22_43 = arg_19_1.actors_["10058ui_story"]
			local var_22_44 = 0

			if var_22_44 < arg_19_1.time_ and arg_19_1.time_ <= var_22_44 + arg_22_0 and arg_19_1.var_.characterEffect10058ui_story == nil then
				arg_19_1.var_.characterEffect10058ui_story = var_22_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_45 = 0.200000002980232

			if var_22_44 <= arg_19_1.time_ and arg_19_1.time_ < var_22_44 + var_22_45 then
				local var_22_46 = (arg_19_1.time_ - var_22_44) / var_22_45

				if arg_19_1.var_.characterEffect10058ui_story then
					local var_22_47 = Mathf.Lerp(0, 0.5, var_22_46)

					arg_19_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_19_1.var_.characterEffect10058ui_story.fillRatio = var_22_47
				end
			end

			if arg_19_1.time_ >= var_22_44 + var_22_45 and arg_19_1.time_ < var_22_44 + var_22_45 + arg_22_0 and arg_19_1.var_.characterEffect10058ui_story then
				local var_22_48 = 0.5

				arg_19_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_19_1.var_.characterEffect10058ui_story.fillRatio = var_22_48
			end

			local var_22_49 = 0
			local var_22_50 = 0.175

			if var_22_49 < arg_19_1.time_ and arg_19_1.time_ <= var_22_49 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_51 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_52 = arg_19_1:GetWordFromCfg(319551005)
				local var_22_53 = arg_19_1:FormatText(var_22_52.content)

				arg_19_1.text_.text = var_22_53

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_54 = 7
				local var_22_55 = utf8.len(var_22_53)
				local var_22_56 = var_22_54 <= 0 and var_22_50 or var_22_50 * (var_22_55 / var_22_54)

				if var_22_56 > 0 and var_22_50 < var_22_56 then
					arg_19_1.talkMaxDuration = var_22_56

					if var_22_56 + var_22_49 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_56 + var_22_49
					end
				end

				arg_19_1.text_.text = var_22_53
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551005", "story_v_out_319551.awb") ~= 0 then
					local var_22_57 = manager.audio:GetVoiceLength("story_v_out_319551", "319551005", "story_v_out_319551.awb") / 1000

					if var_22_57 + var_22_49 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_57 + var_22_49
					end

					if var_22_52.prefab_name ~= "" and arg_19_1.actors_[var_22_52.prefab_name] ~= nil then
						local var_22_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_52.prefab_name].transform, "story_v_out_319551", "319551005", "story_v_out_319551.awb")

						arg_19_1:RecordAudio("319551005", var_22_58)
						arg_19_1:RecordAudio("319551005", var_22_58)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319551", "319551005", "story_v_out_319551.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319551", "319551005", "story_v_out_319551.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_59 = math.max(var_22_50, arg_19_1.talkMaxDuration)

			if var_22_49 <= arg_19_1.time_ and arg_19_1.time_ < var_22_49 + var_22_59 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_49) / var_22_59

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_49 + var_22_59 and arg_19_1.time_ < var_22_49 + var_22_59 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319551006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319551006
		arg_23_1.duration_ = 6.366

		local var_23_0 = {
			zh = 6.366,
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
				arg_23_0:Play319551007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10066ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos10066ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, -0.99, -5.83)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10066ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["10066ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect10066ui_story == nil then
				arg_23_1.var_.characterEffect10066ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect10066ui_story then
					arg_23_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect10066ui_story then
				arg_23_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action1_1")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_15 = arg_23_1.actors_["1084ui_story"].transform
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.var_.moveOldPos1084ui_story = var_26_15.localPosition
			end

			local var_26_17 = 0.001

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17
				local var_26_19 = Vector3.New(0, 100, 0)

				var_26_15.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1084ui_story, var_26_19, var_26_18)

				local var_26_20 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_20.x, var_26_20.y, var_26_20.z)

				local var_26_21 = var_26_15.localEulerAngles

				var_26_21.z = 0
				var_26_21.x = 0
				var_26_15.localEulerAngles = var_26_21
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				var_26_15.localPosition = Vector3.New(0, 100, 0)

				local var_26_22 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_22.x, var_26_22.y, var_26_22.z)

				local var_26_23 = var_26_15.localEulerAngles

				var_26_23.z = 0
				var_26_23.x = 0
				var_26_15.localEulerAngles = var_26_23
			end

			local var_26_24 = arg_23_1.actors_["1084ui_story"]
			local var_26_25 = 0

			if var_26_25 < arg_23_1.time_ and arg_23_1.time_ <= var_26_25 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_26 = 0.200000002980232

			if var_26_25 <= arg_23_1.time_ and arg_23_1.time_ < var_26_25 + var_26_26 then
				local var_26_27 = (arg_23_1.time_ - var_26_25) / var_26_26

				if arg_23_1.var_.characterEffect1084ui_story then
					local var_26_28 = Mathf.Lerp(0, 0.5, var_26_27)

					arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_28
				end
			end

			if arg_23_1.time_ >= var_26_25 + var_26_26 and arg_23_1.time_ < var_26_25 + var_26_26 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				local var_26_29 = 0.5

				arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_29
			end

			local var_26_30 = 0
			local var_26_31 = 0.675

			if var_26_30 < arg_23_1.time_ and arg_23_1.time_ <= var_26_30 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_32 = arg_23_1:FormatText(StoryNameCfg[640].name)

				arg_23_1.leftNameTxt_.text = var_26_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_33 = arg_23_1:GetWordFromCfg(319551006)
				local var_26_34 = arg_23_1:FormatText(var_26_33.content)

				arg_23_1.text_.text = var_26_34

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_35 = 27
				local var_26_36 = utf8.len(var_26_34)
				local var_26_37 = var_26_35 <= 0 and var_26_31 or var_26_31 * (var_26_36 / var_26_35)

				if var_26_37 > 0 and var_26_31 < var_26_37 then
					arg_23_1.talkMaxDuration = var_26_37

					if var_26_37 + var_26_30 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_37 + var_26_30
					end
				end

				arg_23_1.text_.text = var_26_34
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551006", "story_v_out_319551.awb") ~= 0 then
					local var_26_38 = manager.audio:GetVoiceLength("story_v_out_319551", "319551006", "story_v_out_319551.awb") / 1000

					if var_26_38 + var_26_30 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_38 + var_26_30
					end

					if var_26_33.prefab_name ~= "" and arg_23_1.actors_[var_26_33.prefab_name] ~= nil then
						local var_26_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_33.prefab_name].transform, "story_v_out_319551", "319551006", "story_v_out_319551.awb")

						arg_23_1:RecordAudio("319551006", var_26_39)
						arg_23_1:RecordAudio("319551006", var_26_39)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319551", "319551006", "story_v_out_319551.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319551", "319551006", "story_v_out_319551.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_40 = math.max(var_26_31, arg_23_1.talkMaxDuration)

			if var_26_30 <= arg_23_1.time_ and arg_23_1.time_ < var_26_30 + var_26_40 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_30) / var_26_40

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_30 + var_26_40 and arg_23_1.time_ < var_26_30 + var_26_40 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319551007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319551007
		arg_27_1.duration_ = 2.733

		local var_27_0 = {
			zh = 2.733,
			ja = 2
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
				arg_27_0:Play319551008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10058ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10058ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, -0.98, -6.1)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10058ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["10058ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect10058ui_story == nil then
				arg_27_1.var_.characterEffect10058ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect10058ui_story then
					arg_27_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect10058ui_story then
				arg_27_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_15 = arg_27_1.actors_["10066ui_story"].transform
			local var_30_16 = 0

			if var_30_16 < arg_27_1.time_ and arg_27_1.time_ <= var_30_16 + arg_30_0 then
				arg_27_1.var_.moveOldPos10066ui_story = var_30_15.localPosition
			end

			local var_30_17 = 0.001

			if var_30_16 <= arg_27_1.time_ and arg_27_1.time_ < var_30_16 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_16) / var_30_17
				local var_30_19 = Vector3.New(0, 100, 0)

				var_30_15.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10066ui_story, var_30_19, var_30_18)

				local var_30_20 = manager.ui.mainCamera.transform.position - var_30_15.position

				var_30_15.forward = Vector3.New(var_30_20.x, var_30_20.y, var_30_20.z)

				local var_30_21 = var_30_15.localEulerAngles

				var_30_21.z = 0
				var_30_21.x = 0
				var_30_15.localEulerAngles = var_30_21
			end

			if arg_27_1.time_ >= var_30_16 + var_30_17 and arg_27_1.time_ < var_30_16 + var_30_17 + arg_30_0 then
				var_30_15.localPosition = Vector3.New(0, 100, 0)

				local var_30_22 = manager.ui.mainCamera.transform.position - var_30_15.position

				var_30_15.forward = Vector3.New(var_30_22.x, var_30_22.y, var_30_22.z)

				local var_30_23 = var_30_15.localEulerAngles

				var_30_23.z = 0
				var_30_23.x = 0
				var_30_15.localEulerAngles = var_30_23
			end

			local var_30_24 = arg_27_1.actors_["10066ui_story"]
			local var_30_25 = 0

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 and arg_27_1.var_.characterEffect10066ui_story == nil then
				arg_27_1.var_.characterEffect10066ui_story = var_30_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_26 = 0.200000002980232

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_26 then
				local var_30_27 = (arg_27_1.time_ - var_30_25) / var_30_26

				if arg_27_1.var_.characterEffect10066ui_story then
					local var_30_28 = Mathf.Lerp(0, 0.5, var_30_27)

					arg_27_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_27_1.var_.characterEffect10066ui_story.fillRatio = var_30_28
				end
			end

			if arg_27_1.time_ >= var_30_25 + var_30_26 and arg_27_1.time_ < var_30_25 + var_30_26 + arg_30_0 and arg_27_1.var_.characterEffect10066ui_story then
				local var_30_29 = 0.5

				arg_27_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_27_1.var_.characterEffect10066ui_story.fillRatio = var_30_29
			end

			local var_30_30 = 0
			local var_30_31 = 0.275

			if var_30_30 < arg_27_1.time_ and arg_27_1.time_ <= var_30_30 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_32 = arg_27_1:FormatText(StoryNameCfg[471].name)

				arg_27_1.leftNameTxt_.text = var_30_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_33 = arg_27_1:GetWordFromCfg(319551007)
				local var_30_34 = arg_27_1:FormatText(var_30_33.content)

				arg_27_1.text_.text = var_30_34

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_35 = 11
				local var_30_36 = utf8.len(var_30_34)
				local var_30_37 = var_30_35 <= 0 and var_30_31 or var_30_31 * (var_30_36 / var_30_35)

				if var_30_37 > 0 and var_30_31 < var_30_37 then
					arg_27_1.talkMaxDuration = var_30_37

					if var_30_37 + var_30_30 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_37 + var_30_30
					end
				end

				arg_27_1.text_.text = var_30_34
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551007", "story_v_out_319551.awb") ~= 0 then
					local var_30_38 = manager.audio:GetVoiceLength("story_v_out_319551", "319551007", "story_v_out_319551.awb") / 1000

					if var_30_38 + var_30_30 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_38 + var_30_30
					end

					if var_30_33.prefab_name ~= "" and arg_27_1.actors_[var_30_33.prefab_name] ~= nil then
						local var_30_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_33.prefab_name].transform, "story_v_out_319551", "319551007", "story_v_out_319551.awb")

						arg_27_1:RecordAudio("319551007", var_30_39)
						arg_27_1:RecordAudio("319551007", var_30_39)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_319551", "319551007", "story_v_out_319551.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_319551", "319551007", "story_v_out_319551.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_40 = math.max(var_30_31, arg_27_1.talkMaxDuration)

			if var_30_30 <= arg_27_1.time_ and arg_27_1.time_ < var_30_30 + var_30_40 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_30) / var_30_40

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_30 + var_30_40 and arg_27_1.time_ < var_30_30 + var_30_40 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319551008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319551008
		arg_31_1.duration_ = 9.433

		local var_31_0 = {
			zh = 4.333,
			ja = 9.433
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
				arg_31_0:Play319551009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.575

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

				local var_34_3 = arg_31_1:GetWordFromCfg(319551008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551008", "story_v_out_319551.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_319551", "319551008", "story_v_out_319551.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_319551", "319551008", "story_v_out_319551.awb")

						arg_31_1:RecordAudio("319551008", var_34_9)
						arg_31_1:RecordAudio("319551008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319551", "319551008", "story_v_out_319551.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319551", "319551008", "story_v_out_319551.awb")
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
	Play319551009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319551009
		arg_35_1.duration_ = 1.633

		local var_35_0 = {
			zh = 1.4,
			ja = 1.633
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
				arg_35_0:Play319551010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1084ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1084ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0.7, -0.97, -6)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1084ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1084ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story == nil then
				arg_35_1.var_.characterEffect1084ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1084ui_story then
					arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story then
				arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_15 = arg_35_1.actors_["10058ui_story"].transform
			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.var_.moveOldPos10058ui_story = var_38_15.localPosition
			end

			local var_38_17 = 0.001

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17
				local var_38_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_38_15.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10058ui_story, var_38_19, var_38_18)

				local var_38_20 = manager.ui.mainCamera.transform.position - var_38_15.position

				var_38_15.forward = Vector3.New(var_38_20.x, var_38_20.y, var_38_20.z)

				local var_38_21 = var_38_15.localEulerAngles

				var_38_21.z = 0
				var_38_21.x = 0
				var_38_15.localEulerAngles = var_38_21
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 then
				var_38_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_38_22 = manager.ui.mainCamera.transform.position - var_38_15.position

				var_38_15.forward = Vector3.New(var_38_22.x, var_38_22.y, var_38_22.z)

				local var_38_23 = var_38_15.localEulerAngles

				var_38_23.z = 0
				var_38_23.x = 0
				var_38_15.localEulerAngles = var_38_23
			end

			local var_38_24 = arg_35_1.actors_["10058ui_story"]
			local var_38_25 = 0

			if var_38_25 < arg_35_1.time_ and arg_35_1.time_ <= var_38_25 + arg_38_0 and arg_35_1.var_.characterEffect10058ui_story == nil then
				arg_35_1.var_.characterEffect10058ui_story = var_38_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_26 = 0.200000002980232

			if var_38_25 <= arg_35_1.time_ and arg_35_1.time_ < var_38_25 + var_38_26 then
				local var_38_27 = (arg_35_1.time_ - var_38_25) / var_38_26

				if arg_35_1.var_.characterEffect10058ui_story then
					local var_38_28 = Mathf.Lerp(0, 0.5, var_38_27)

					arg_35_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_35_1.var_.characterEffect10058ui_story.fillRatio = var_38_28
				end
			end

			if arg_35_1.time_ >= var_38_25 + var_38_26 and arg_35_1.time_ < var_38_25 + var_38_26 + arg_38_0 and arg_35_1.var_.characterEffect10058ui_story then
				local var_38_29 = 0.5

				arg_35_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_35_1.var_.characterEffect10058ui_story.fillRatio = var_38_29
			end

			local var_38_30 = 0
			local var_38_31 = 0.125

			if var_38_30 < arg_35_1.time_ and arg_35_1.time_ <= var_38_30 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_32 = arg_35_1:FormatText(StoryNameCfg[6].name)

				arg_35_1.leftNameTxt_.text = var_38_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_33 = arg_35_1:GetWordFromCfg(319551009)
				local var_38_34 = arg_35_1:FormatText(var_38_33.content)

				arg_35_1.text_.text = var_38_34

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_35 = 5
				local var_38_36 = utf8.len(var_38_34)
				local var_38_37 = var_38_35 <= 0 and var_38_31 or var_38_31 * (var_38_36 / var_38_35)

				if var_38_37 > 0 and var_38_31 < var_38_37 then
					arg_35_1.talkMaxDuration = var_38_37

					if var_38_37 + var_38_30 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_37 + var_38_30
					end
				end

				arg_35_1.text_.text = var_38_34
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551009", "story_v_out_319551.awb") ~= 0 then
					local var_38_38 = manager.audio:GetVoiceLength("story_v_out_319551", "319551009", "story_v_out_319551.awb") / 1000

					if var_38_38 + var_38_30 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_38 + var_38_30
					end

					if var_38_33.prefab_name ~= "" and arg_35_1.actors_[var_38_33.prefab_name] ~= nil then
						local var_38_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_33.prefab_name].transform, "story_v_out_319551", "319551009", "story_v_out_319551.awb")

						arg_35_1:RecordAudio("319551009", var_38_39)
						arg_35_1:RecordAudio("319551009", var_38_39)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319551", "319551009", "story_v_out_319551.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319551", "319551009", "story_v_out_319551.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_40 = math.max(var_38_31, arg_35_1.talkMaxDuration)

			if var_38_30 <= arg_35_1.time_ and arg_35_1.time_ < var_38_30 + var_38_40 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_30) / var_38_40

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_30 + var_38_40 and arg_35_1.time_ < var_38_30 + var_38_40 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319551010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319551010
		arg_39_1.duration_ = 8.333

		local var_39_0 = {
			zh = 4.6,
			ja = 8.333
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
				arg_39_0:Play319551011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1084ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story == nil then
				arg_39_1.var_.characterEffect1084ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1084ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1084ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1084ui_story.fillRatio = var_42_5
			end

			local var_42_6 = arg_39_1.actors_["10058ui_story"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.characterEffect10058ui_story == nil then
				arg_39_1.var_.characterEffect10058ui_story = var_42_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_8 = 0.200000002980232

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.characterEffect10058ui_story then
					arg_39_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.characterEffect10058ui_story then
				arg_39_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_42_10 = 0
			local var_42_11 = 0.55

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_12 = arg_39_1:FormatText(StoryNameCfg[471].name)

				arg_39_1.leftNameTxt_.text = var_42_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_13 = arg_39_1:GetWordFromCfg(319551010)
				local var_42_14 = arg_39_1:FormatText(var_42_13.content)

				arg_39_1.text_.text = var_42_14

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_15 = 22
				local var_42_16 = utf8.len(var_42_14)
				local var_42_17 = var_42_15 <= 0 and var_42_11 or var_42_11 * (var_42_16 / var_42_15)

				if var_42_17 > 0 and var_42_11 < var_42_17 then
					arg_39_1.talkMaxDuration = var_42_17

					if var_42_17 + var_42_10 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_17 + var_42_10
					end
				end

				arg_39_1.text_.text = var_42_14
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551010", "story_v_out_319551.awb") ~= 0 then
					local var_42_18 = manager.audio:GetVoiceLength("story_v_out_319551", "319551010", "story_v_out_319551.awb") / 1000

					if var_42_18 + var_42_10 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_18 + var_42_10
					end

					if var_42_13.prefab_name ~= "" and arg_39_1.actors_[var_42_13.prefab_name] ~= nil then
						local var_42_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_13.prefab_name].transform, "story_v_out_319551", "319551010", "story_v_out_319551.awb")

						arg_39_1:RecordAudio("319551010", var_42_19)
						arg_39_1:RecordAudio("319551010", var_42_19)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319551", "319551010", "story_v_out_319551.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319551", "319551010", "story_v_out_319551.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_20 = math.max(var_42_11, arg_39_1.talkMaxDuration)

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_20 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_10) / var_42_20

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_10 + var_42_20 and arg_39_1.time_ < var_42_10 + var_42_20 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319551011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319551011
		arg_43_1.duration_ = 10.033

		local var_43_0 = {
			zh = 7.7,
			ja = 10.033
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
				arg_43_0:Play319551012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1084ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1084ui_story then
					arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["10058ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and arg_43_1.var_.characterEffect10058ui_story == nil then
				arg_43_1.var_.characterEffect10058ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.200000002980232

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect10058ui_story then
					local var_46_8 = Mathf.Lerp(0, 0.5, var_46_7)

					arg_43_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_43_1.var_.characterEffect10058ui_story.fillRatio = var_46_8
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect10058ui_story then
				local var_46_9 = 0.5

				arg_43_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_43_1.var_.characterEffect10058ui_story.fillRatio = var_46_9
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_46_11 = 0

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_46_12 = 0
			local var_46_13 = 0.925

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_14 = arg_43_1:FormatText(StoryNameCfg[6].name)

				arg_43_1.leftNameTxt_.text = var_46_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_15 = arg_43_1:GetWordFromCfg(319551011)
				local var_46_16 = arg_43_1:FormatText(var_46_15.content)

				arg_43_1.text_.text = var_46_16

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_17 = 37
				local var_46_18 = utf8.len(var_46_16)
				local var_46_19 = var_46_17 <= 0 and var_46_13 or var_46_13 * (var_46_18 / var_46_17)

				if var_46_19 > 0 and var_46_13 < var_46_19 then
					arg_43_1.talkMaxDuration = var_46_19

					if var_46_19 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_12
					end
				end

				arg_43_1.text_.text = var_46_16
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551011", "story_v_out_319551.awb") ~= 0 then
					local var_46_20 = manager.audio:GetVoiceLength("story_v_out_319551", "319551011", "story_v_out_319551.awb") / 1000

					if var_46_20 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_20 + var_46_12
					end

					if var_46_15.prefab_name ~= "" and arg_43_1.actors_[var_46_15.prefab_name] ~= nil then
						local var_46_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_15.prefab_name].transform, "story_v_out_319551", "319551011", "story_v_out_319551.awb")

						arg_43_1:RecordAudio("319551011", var_46_21)
						arg_43_1:RecordAudio("319551011", var_46_21)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319551", "319551011", "story_v_out_319551.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319551", "319551011", "story_v_out_319551.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_22 = math.max(var_46_13, arg_43_1.talkMaxDuration)

			if var_46_12 <= arg_43_1.time_ and arg_43_1.time_ < var_46_12 + var_46_22 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_12) / var_46_22

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_12 + var_46_22 and arg_43_1.time_ < var_46_12 + var_46_22 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319551012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319551012
		arg_47_1.duration_ = 13.2

		local var_47_0 = {
			zh = 7.4,
			ja = 13.2
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
				arg_47_0:Play319551013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_50_2 = 0
			local var_50_3 = 1

			if var_50_2 < arg_47_1.time_ and arg_47_1.time_ <= var_50_2 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_4 = arg_47_1:FormatText(StoryNameCfg[6].name)

				arg_47_1.leftNameTxt_.text = var_50_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_5 = arg_47_1:GetWordFromCfg(319551012)
				local var_50_6 = arg_47_1:FormatText(var_50_5.content)

				arg_47_1.text_.text = var_50_6

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_7 = 40
				local var_50_8 = utf8.len(var_50_6)
				local var_50_9 = var_50_7 <= 0 and var_50_3 or var_50_3 * (var_50_8 / var_50_7)

				if var_50_9 > 0 and var_50_3 < var_50_9 then
					arg_47_1.talkMaxDuration = var_50_9

					if var_50_9 + var_50_2 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_9 + var_50_2
					end
				end

				arg_47_1.text_.text = var_50_6
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551012", "story_v_out_319551.awb") ~= 0 then
					local var_50_10 = manager.audio:GetVoiceLength("story_v_out_319551", "319551012", "story_v_out_319551.awb") / 1000

					if var_50_10 + var_50_2 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_10 + var_50_2
					end

					if var_50_5.prefab_name ~= "" and arg_47_1.actors_[var_50_5.prefab_name] ~= nil then
						local var_50_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_5.prefab_name].transform, "story_v_out_319551", "319551012", "story_v_out_319551.awb")

						arg_47_1:RecordAudio("319551012", var_50_11)
						arg_47_1:RecordAudio("319551012", var_50_11)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319551", "319551012", "story_v_out_319551.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319551", "319551012", "story_v_out_319551.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_12 = math.max(var_50_3, arg_47_1.talkMaxDuration)

			if var_50_2 <= arg_47_1.time_ and arg_47_1.time_ < var_50_2 + var_50_12 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_2) / var_50_12

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_2 + var_50_12 and arg_47_1.time_ < var_50_2 + var_50_12 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319551013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319551013
		arg_51_1.duration_ = 9.2

		local var_51_0 = {
			zh = 6.8,
			ja = 9.2
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
				arg_51_0:Play319551014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1084ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story == nil then
				arg_51_1.var_.characterEffect1084ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1084ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_5
			end

			local var_54_6 = arg_51_1.actors_["10058ui_story"]
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 and arg_51_1.var_.characterEffect10058ui_story == nil then
				arg_51_1.var_.characterEffect10058ui_story = var_54_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_8 = 0.200000002980232

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_8 then
				local var_54_9 = (arg_51_1.time_ - var_54_7) / var_54_8

				if arg_51_1.var_.characterEffect10058ui_story then
					arg_51_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_7 + var_54_8 and arg_51_1.time_ < var_54_7 + var_54_8 + arg_54_0 and arg_51_1.var_.characterEffect10058ui_story then
				arg_51_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_54_10 = 0
			local var_54_11 = 0.8

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_12 = arg_51_1:FormatText(StoryNameCfg[471].name)

				arg_51_1.leftNameTxt_.text = var_54_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_13 = arg_51_1:GetWordFromCfg(319551013)
				local var_54_14 = arg_51_1:FormatText(var_54_13.content)

				arg_51_1.text_.text = var_54_14

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_15 = 32
				local var_54_16 = utf8.len(var_54_14)
				local var_54_17 = var_54_15 <= 0 and var_54_11 or var_54_11 * (var_54_16 / var_54_15)

				if var_54_17 > 0 and var_54_11 < var_54_17 then
					arg_51_1.talkMaxDuration = var_54_17

					if var_54_17 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_17 + var_54_10
					end
				end

				arg_51_1.text_.text = var_54_14
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551013", "story_v_out_319551.awb") ~= 0 then
					local var_54_18 = manager.audio:GetVoiceLength("story_v_out_319551", "319551013", "story_v_out_319551.awb") / 1000

					if var_54_18 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_10
					end

					if var_54_13.prefab_name ~= "" and arg_51_1.actors_[var_54_13.prefab_name] ~= nil then
						local var_54_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_13.prefab_name].transform, "story_v_out_319551", "319551013", "story_v_out_319551.awb")

						arg_51_1:RecordAudio("319551013", var_54_19)
						arg_51_1:RecordAudio("319551013", var_54_19)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319551", "319551013", "story_v_out_319551.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319551", "319551013", "story_v_out_319551.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_20 = math.max(var_54_11, arg_51_1.talkMaxDuration)

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_20 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_10) / var_54_20

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_10 + var_54_20 and arg_51_1.time_ < var_54_10 + var_54_20 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319551014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319551014
		arg_55_1.duration_ = 11.333

		local var_55_0 = {
			zh = 11.333,
			ja = 11.266
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
				arg_55_0:Play319551015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.4

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[471].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(319551014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551014", "story_v_out_319551.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_319551", "319551014", "story_v_out_319551.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_319551", "319551014", "story_v_out_319551.awb")

						arg_55_1:RecordAudio("319551014", var_58_9)
						arg_55_1:RecordAudio("319551014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_319551", "319551014", "story_v_out_319551.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_319551", "319551014", "story_v_out_319551.awb")
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
	Play319551015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319551015
		arg_59_1.duration_ = 8.433

		local var_59_0 = {
			zh = 3.233,
			ja = 8.433
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
				arg_59_0:Play319551016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1084ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1084ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(0.7, -0.97, -6)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1084ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = arg_59_1.actors_["1084ui_story"]
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story == nil then
				arg_59_1.var_.characterEffect1084ui_story = var_62_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_11 = 0.200000002980232

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11

				if arg_59_1.var_.characterEffect1084ui_story then
					arg_59_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story then
				arg_59_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_62_13 = 0

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_62_15 = arg_59_1.actors_["10058ui_story"]
			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 and arg_59_1.var_.characterEffect10058ui_story == nil then
				arg_59_1.var_.characterEffect10058ui_story = var_62_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_17 = 0.200000002980232

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_17 then
				local var_62_18 = (arg_59_1.time_ - var_62_16) / var_62_17

				if arg_59_1.var_.characterEffect10058ui_story then
					local var_62_19 = Mathf.Lerp(0, 0.5, var_62_18)

					arg_59_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_59_1.var_.characterEffect10058ui_story.fillRatio = var_62_19
				end
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 and arg_59_1.var_.characterEffect10058ui_story then
				local var_62_20 = 0.5

				arg_59_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_59_1.var_.characterEffect10058ui_story.fillRatio = var_62_20
			end

			local var_62_21 = 0
			local var_62_22 = 0.35

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_23 = arg_59_1:FormatText(StoryNameCfg[6].name)

				arg_59_1.leftNameTxt_.text = var_62_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_24 = arg_59_1:GetWordFromCfg(319551015)
				local var_62_25 = arg_59_1:FormatText(var_62_24.content)

				arg_59_1.text_.text = var_62_25

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_26 = 14
				local var_62_27 = utf8.len(var_62_25)
				local var_62_28 = var_62_26 <= 0 and var_62_22 or var_62_22 * (var_62_27 / var_62_26)

				if var_62_28 > 0 and var_62_22 < var_62_28 then
					arg_59_1.talkMaxDuration = var_62_28

					if var_62_28 + var_62_21 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_28 + var_62_21
					end
				end

				arg_59_1.text_.text = var_62_25
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551015", "story_v_out_319551.awb") ~= 0 then
					local var_62_29 = manager.audio:GetVoiceLength("story_v_out_319551", "319551015", "story_v_out_319551.awb") / 1000

					if var_62_29 + var_62_21 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_29 + var_62_21
					end

					if var_62_24.prefab_name ~= "" and arg_59_1.actors_[var_62_24.prefab_name] ~= nil then
						local var_62_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_24.prefab_name].transform, "story_v_out_319551", "319551015", "story_v_out_319551.awb")

						arg_59_1:RecordAudio("319551015", var_62_30)
						arg_59_1:RecordAudio("319551015", var_62_30)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_319551", "319551015", "story_v_out_319551.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_319551", "319551015", "story_v_out_319551.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_31 = math.max(var_62_22, arg_59_1.talkMaxDuration)

			if var_62_21 <= arg_59_1.time_ and arg_59_1.time_ < var_62_21 + var_62_31 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_21) / var_62_31

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_21 + var_62_31 and arg_59_1.time_ < var_62_21 + var_62_31 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319551016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319551016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play319551017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1084ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1084ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1084ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1084ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0
			local var_66_7 = 0.7

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

				local var_66_8 = arg_63_1:GetWordFromCfg(319551016)
				local var_66_9 = arg_63_1:FormatText(var_66_8.content)

				arg_63_1.text_.text = var_66_9

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_10 = 28
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
	Play319551017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319551017
		arg_67_1.duration_ = 5

		local var_67_0 = {
			zh = 1.999999999999,
			ja = 5
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
				arg_67_0:Play319551018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10058ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos10058ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10058ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["10058ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect10058ui_story == nil then
				arg_67_1.var_.characterEffect10058ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect10058ui_story then
					arg_67_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect10058ui_story then
				arg_67_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_15 = 0
			local var_70_16 = 0.3

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_17 = arg_67_1:FormatText(StoryNameCfg[471].name)

				arg_67_1.leftNameTxt_.text = var_70_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_18 = arg_67_1:GetWordFromCfg(319551017)
				local var_70_19 = arg_67_1:FormatText(var_70_18.content)

				arg_67_1.text_.text = var_70_19

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_20 = 9
				local var_70_21 = utf8.len(var_70_19)
				local var_70_22 = var_70_20 <= 0 and var_70_16 or var_70_16 * (var_70_21 / var_70_20)

				if var_70_22 > 0 and var_70_16 < var_70_22 then
					arg_67_1.talkMaxDuration = var_70_22

					if var_70_22 + var_70_15 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_22 + var_70_15
					end
				end

				arg_67_1.text_.text = var_70_19
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551017", "story_v_out_319551.awb") ~= 0 then
					local var_70_23 = manager.audio:GetVoiceLength("story_v_out_319551", "319551017", "story_v_out_319551.awb") / 1000

					if var_70_23 + var_70_15 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_23 + var_70_15
					end

					if var_70_18.prefab_name ~= "" and arg_67_1.actors_[var_70_18.prefab_name] ~= nil then
						local var_70_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_18.prefab_name].transform, "story_v_out_319551", "319551017", "story_v_out_319551.awb")

						arg_67_1:RecordAudio("319551017", var_70_24)
						arg_67_1:RecordAudio("319551017", var_70_24)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_319551", "319551017", "story_v_out_319551.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_319551", "319551017", "story_v_out_319551.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_25 = math.max(var_70_16, arg_67_1.talkMaxDuration)

			if var_70_15 <= arg_67_1.time_ and arg_67_1.time_ < var_70_15 + var_70_25 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_15) / var_70_25

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_15 + var_70_25 and arg_67_1.time_ < var_70_15 + var_70_25 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319551018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319551018
		arg_71_1.duration_ = 10.333

		local var_71_0 = {
			zh = 7.933,
			ja = 10.333
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
				arg_71_0:Play319551019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10058ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect10058ui_story == nil then
				arg_71_1.var_.characterEffect10058ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect10058ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_71_1.var_.characterEffect10058ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect10058ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_71_1.var_.characterEffect10058ui_story.fillRatio = var_74_5
			end

			local var_74_6 = arg_71_1.actors_["1084ui_story"]
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story == nil then
				arg_71_1.var_.characterEffect1084ui_story = var_74_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_8 = 0.200000002980232

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / var_74_8

				if arg_71_1.var_.characterEffect1084ui_story then
					arg_71_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story then
				arg_71_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 then
				arg_71_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_74_11 = 0

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_74_12 = 0
			local var_74_13 = 1.025

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_14 = arg_71_1:FormatText(StoryNameCfg[6].name)

				arg_71_1.leftNameTxt_.text = var_74_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_15 = arg_71_1:GetWordFromCfg(319551018)
				local var_74_16 = arg_71_1:FormatText(var_74_15.content)

				arg_71_1.text_.text = var_74_16

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_17 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551018", "story_v_out_319551.awb") ~= 0 then
					local var_74_20 = manager.audio:GetVoiceLength("story_v_out_319551", "319551018", "story_v_out_319551.awb") / 1000

					if var_74_20 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_12
					end

					if var_74_15.prefab_name ~= "" and arg_71_1.actors_[var_74_15.prefab_name] ~= nil then
						local var_74_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_15.prefab_name].transform, "story_v_out_319551", "319551018", "story_v_out_319551.awb")

						arg_71_1:RecordAudio("319551018", var_74_21)
						arg_71_1:RecordAudio("319551018", var_74_21)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_319551", "319551018", "story_v_out_319551.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_319551", "319551018", "story_v_out_319551.awb")
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
	Play319551019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319551019
		arg_75_1.duration_ = 5.233

		local var_75_0 = {
			zh = 3.8,
			ja = 5.233
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
				arg_75_0:Play319551020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1084ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story == nil then
				arg_75_1.var_.characterEffect1084ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1084ui_story then
					local var_78_4 = Mathf.Lerp(0, 0.5, var_78_3)

					arg_75_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1084ui_story.fillRatio = var_78_4
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story then
				local var_78_5 = 0.5

				arg_75_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1084ui_story.fillRatio = var_78_5
			end

			local var_78_6 = arg_75_1.actors_["10058ui_story"]
			local var_78_7 = 0

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 and arg_75_1.var_.characterEffect10058ui_story == nil then
				arg_75_1.var_.characterEffect10058ui_story = var_78_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_8 = 0.200000002980232

			if var_78_7 <= arg_75_1.time_ and arg_75_1.time_ < var_78_7 + var_78_8 then
				local var_78_9 = (arg_75_1.time_ - var_78_7) / var_78_8

				if arg_75_1.var_.characterEffect10058ui_story then
					arg_75_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_7 + var_78_8 and arg_75_1.time_ < var_78_7 + var_78_8 + arg_78_0 and arg_75_1.var_.characterEffect10058ui_story then
				arg_75_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_78_10 = 0
			local var_78_11 = 0.425

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_12 = arg_75_1:FormatText(StoryNameCfg[471].name)

				arg_75_1.leftNameTxt_.text = var_78_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_13 = arg_75_1:GetWordFromCfg(319551019)
				local var_78_14 = arg_75_1:FormatText(var_78_13.content)

				arg_75_1.text_.text = var_78_14

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_15 = 17
				local var_78_16 = utf8.len(var_78_14)
				local var_78_17 = var_78_15 <= 0 and var_78_11 or var_78_11 * (var_78_16 / var_78_15)

				if var_78_17 > 0 and var_78_11 < var_78_17 then
					arg_75_1.talkMaxDuration = var_78_17

					if var_78_17 + var_78_10 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_17 + var_78_10
					end
				end

				arg_75_1.text_.text = var_78_14
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551019", "story_v_out_319551.awb") ~= 0 then
					local var_78_18 = manager.audio:GetVoiceLength("story_v_out_319551", "319551019", "story_v_out_319551.awb") / 1000

					if var_78_18 + var_78_10 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_18 + var_78_10
					end

					if var_78_13.prefab_name ~= "" and arg_75_1.actors_[var_78_13.prefab_name] ~= nil then
						local var_78_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_13.prefab_name].transform, "story_v_out_319551", "319551019", "story_v_out_319551.awb")

						arg_75_1:RecordAudio("319551019", var_78_19)
						arg_75_1:RecordAudio("319551019", var_78_19)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319551", "319551019", "story_v_out_319551.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319551", "319551019", "story_v_out_319551.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_20 = math.max(var_78_11, arg_75_1.talkMaxDuration)

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_20 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_10) / var_78_20

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_10 + var_78_20 and arg_75_1.time_ < var_78_10 + var_78_20 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play319551020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319551020
		arg_79_1.duration_ = 7.833

		local var_79_0 = {
			zh = 5.266,
			ja = 7.833
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
				arg_79_0:Play319551021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1084ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1084ui_story then
					arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["10058ui_story"]
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 and arg_79_1.var_.characterEffect10058ui_story == nil then
				arg_79_1.var_.characterEffect10058ui_story = var_82_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_6 = 0.200000002980232

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6

				if arg_79_1.var_.characterEffect10058ui_story then
					local var_82_8 = Mathf.Lerp(0, 0.5, var_82_7)

					arg_79_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_79_1.var_.characterEffect10058ui_story.fillRatio = var_82_8
				end
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 and arg_79_1.var_.characterEffect10058ui_story then
				local var_82_9 = 0.5

				arg_79_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_79_1.var_.characterEffect10058ui_story.fillRatio = var_82_9
			end

			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_82_11 = 0

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_82_12 = 0
			local var_82_13 = 0.625

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_14 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_15 = arg_79_1:GetWordFromCfg(319551020)
				local var_82_16 = arg_79_1:FormatText(var_82_15.content)

				arg_79_1.text_.text = var_82_16

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_17 = 25
				local var_82_18 = utf8.len(var_82_16)
				local var_82_19 = var_82_17 <= 0 and var_82_13 or var_82_13 * (var_82_18 / var_82_17)

				if var_82_19 > 0 and var_82_13 < var_82_19 then
					arg_79_1.talkMaxDuration = var_82_19

					if var_82_19 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_19 + var_82_12
					end
				end

				arg_79_1.text_.text = var_82_16
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551020", "story_v_out_319551.awb") ~= 0 then
					local var_82_20 = manager.audio:GetVoiceLength("story_v_out_319551", "319551020", "story_v_out_319551.awb") / 1000

					if var_82_20 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_20 + var_82_12
					end

					if var_82_15.prefab_name ~= "" and arg_79_1.actors_[var_82_15.prefab_name] ~= nil then
						local var_82_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_15.prefab_name].transform, "story_v_out_319551", "319551020", "story_v_out_319551.awb")

						arg_79_1:RecordAudio("319551020", var_82_21)
						arg_79_1:RecordAudio("319551020", var_82_21)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_319551", "319551020", "story_v_out_319551.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_319551", "319551020", "story_v_out_319551.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_22 = math.max(var_82_13, arg_79_1.talkMaxDuration)

			if var_82_12 <= arg_79_1.time_ and arg_79_1.time_ < var_82_12 + var_82_22 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_12) / var_82_22

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_12 + var_82_22 and arg_79_1.time_ < var_82_12 + var_82_22 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play319551021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319551021
		arg_83_1.duration_ = 6.9

		local var_83_0 = {
			zh = 5.266,
			ja = 6.9
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
				arg_83_0:Play319551022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1084ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story == nil then
				arg_83_1.var_.characterEffect1084ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1084ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1084ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1084ui_story.fillRatio = var_86_5
			end

			local var_86_6 = arg_83_1.actors_["10058ui_story"]
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 and arg_83_1.var_.characterEffect10058ui_story == nil then
				arg_83_1.var_.characterEffect10058ui_story = var_86_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_8 = 0.200000002980232

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8

				if arg_83_1.var_.characterEffect10058ui_story then
					arg_83_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 and arg_83_1.var_.characterEffect10058ui_story then
				arg_83_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_86_10 = 0
			local var_86_11 = 0.55

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_12 = arg_83_1:FormatText(StoryNameCfg[471].name)

				arg_83_1.leftNameTxt_.text = var_86_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_13 = arg_83_1:GetWordFromCfg(319551021)
				local var_86_14 = arg_83_1:FormatText(var_86_13.content)

				arg_83_1.text_.text = var_86_14

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_15 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551021", "story_v_out_319551.awb") ~= 0 then
					local var_86_18 = manager.audio:GetVoiceLength("story_v_out_319551", "319551021", "story_v_out_319551.awb") / 1000

					if var_86_18 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_18 + var_86_10
					end

					if var_86_13.prefab_name ~= "" and arg_83_1.actors_[var_86_13.prefab_name] ~= nil then
						local var_86_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_13.prefab_name].transform, "story_v_out_319551", "319551021", "story_v_out_319551.awb")

						arg_83_1:RecordAudio("319551021", var_86_19)
						arg_83_1:RecordAudio("319551021", var_86_19)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_319551", "319551021", "story_v_out_319551.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_319551", "319551021", "story_v_out_319551.awb")
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
	Play319551022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319551022
		arg_87_1.duration_ = 16.6

		local var_87_0 = {
			zh = 6.333,
			ja = 16.6
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
				arg_87_0:Play319551023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10066ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos10066ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, -0.99, -5.83)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10066ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["10066ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect10066ui_story == nil then
				arg_87_1.var_.characterEffect10066ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect10066ui_story then
					arg_87_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect10066ui_story then
				arg_87_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action1_1")
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_15 = arg_87_1.actors_["1084ui_story"].transform
			local var_90_16 = 0

			if var_90_16 < arg_87_1.time_ and arg_87_1.time_ <= var_90_16 + arg_90_0 then
				arg_87_1.var_.moveOldPos1084ui_story = var_90_15.localPosition
			end

			local var_90_17 = 0.001

			if var_90_16 <= arg_87_1.time_ and arg_87_1.time_ < var_90_16 + var_90_17 then
				local var_90_18 = (arg_87_1.time_ - var_90_16) / var_90_17
				local var_90_19 = Vector3.New(0, 100, 0)

				var_90_15.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1084ui_story, var_90_19, var_90_18)

				local var_90_20 = manager.ui.mainCamera.transform.position - var_90_15.position

				var_90_15.forward = Vector3.New(var_90_20.x, var_90_20.y, var_90_20.z)

				local var_90_21 = var_90_15.localEulerAngles

				var_90_21.z = 0
				var_90_21.x = 0
				var_90_15.localEulerAngles = var_90_21
			end

			if arg_87_1.time_ >= var_90_16 + var_90_17 and arg_87_1.time_ < var_90_16 + var_90_17 + arg_90_0 then
				var_90_15.localPosition = Vector3.New(0, 100, 0)

				local var_90_22 = manager.ui.mainCamera.transform.position - var_90_15.position

				var_90_15.forward = Vector3.New(var_90_22.x, var_90_22.y, var_90_22.z)

				local var_90_23 = var_90_15.localEulerAngles

				var_90_23.z = 0
				var_90_23.x = 0
				var_90_15.localEulerAngles = var_90_23
			end

			local var_90_24 = arg_87_1.actors_["1084ui_story"]
			local var_90_25 = 0

			if var_90_25 < arg_87_1.time_ and arg_87_1.time_ <= var_90_25 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story == nil then
				arg_87_1.var_.characterEffect1084ui_story = var_90_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_26 = 0.200000002980232

			if var_90_25 <= arg_87_1.time_ and arg_87_1.time_ < var_90_25 + var_90_26 then
				local var_90_27 = (arg_87_1.time_ - var_90_25) / var_90_26

				if arg_87_1.var_.characterEffect1084ui_story then
					local var_90_28 = Mathf.Lerp(0, 0.5, var_90_27)

					arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_28
				end
			end

			if arg_87_1.time_ >= var_90_25 + var_90_26 and arg_87_1.time_ < var_90_25 + var_90_26 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story then
				local var_90_29 = 0.5

				arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_29
			end

			local var_90_30 = arg_87_1.actors_["10058ui_story"].transform
			local var_90_31 = 0

			if var_90_31 < arg_87_1.time_ and arg_87_1.time_ <= var_90_31 + arg_90_0 then
				arg_87_1.var_.moveOldPos10058ui_story = var_90_30.localPosition
			end

			local var_90_32 = 0.001

			if var_90_31 <= arg_87_1.time_ and arg_87_1.time_ < var_90_31 + var_90_32 then
				local var_90_33 = (arg_87_1.time_ - var_90_31) / var_90_32
				local var_90_34 = Vector3.New(0, 100, 0)

				var_90_30.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10058ui_story, var_90_34, var_90_33)

				local var_90_35 = manager.ui.mainCamera.transform.position - var_90_30.position

				var_90_30.forward = Vector3.New(var_90_35.x, var_90_35.y, var_90_35.z)

				local var_90_36 = var_90_30.localEulerAngles

				var_90_36.z = 0
				var_90_36.x = 0
				var_90_30.localEulerAngles = var_90_36
			end

			if arg_87_1.time_ >= var_90_31 + var_90_32 and arg_87_1.time_ < var_90_31 + var_90_32 + arg_90_0 then
				var_90_30.localPosition = Vector3.New(0, 100, 0)

				local var_90_37 = manager.ui.mainCamera.transform.position - var_90_30.position

				var_90_30.forward = Vector3.New(var_90_37.x, var_90_37.y, var_90_37.z)

				local var_90_38 = var_90_30.localEulerAngles

				var_90_38.z = 0
				var_90_38.x = 0
				var_90_30.localEulerAngles = var_90_38
			end

			local var_90_39 = arg_87_1.actors_["10058ui_story"]
			local var_90_40 = 0

			if var_90_40 < arg_87_1.time_ and arg_87_1.time_ <= var_90_40 + arg_90_0 and arg_87_1.var_.characterEffect10058ui_story == nil then
				arg_87_1.var_.characterEffect10058ui_story = var_90_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_41 = 0.200000002980232

			if var_90_40 <= arg_87_1.time_ and arg_87_1.time_ < var_90_40 + var_90_41 then
				local var_90_42 = (arg_87_1.time_ - var_90_40) / var_90_41

				if arg_87_1.var_.characterEffect10058ui_story then
					local var_90_43 = Mathf.Lerp(0, 0.5, var_90_42)

					arg_87_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_87_1.var_.characterEffect10058ui_story.fillRatio = var_90_43
				end
			end

			if arg_87_1.time_ >= var_90_40 + var_90_41 and arg_87_1.time_ < var_90_40 + var_90_41 + arg_90_0 and arg_87_1.var_.characterEffect10058ui_story then
				local var_90_44 = 0.5

				arg_87_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_87_1.var_.characterEffect10058ui_story.fillRatio = var_90_44
			end

			local var_90_45 = 0
			local var_90_46 = 0.775

			if var_90_45 < arg_87_1.time_ and arg_87_1.time_ <= var_90_45 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_47 = arg_87_1:FormatText(StoryNameCfg[640].name)

				arg_87_1.leftNameTxt_.text = var_90_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_48 = arg_87_1:GetWordFromCfg(319551022)
				local var_90_49 = arg_87_1:FormatText(var_90_48.content)

				arg_87_1.text_.text = var_90_49

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_50 = 31
				local var_90_51 = utf8.len(var_90_49)
				local var_90_52 = var_90_50 <= 0 and var_90_46 or var_90_46 * (var_90_51 / var_90_50)

				if var_90_52 > 0 and var_90_46 < var_90_52 then
					arg_87_1.talkMaxDuration = var_90_52

					if var_90_52 + var_90_45 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_52 + var_90_45
					end
				end

				arg_87_1.text_.text = var_90_49
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551022", "story_v_out_319551.awb") ~= 0 then
					local var_90_53 = manager.audio:GetVoiceLength("story_v_out_319551", "319551022", "story_v_out_319551.awb") / 1000

					if var_90_53 + var_90_45 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_53 + var_90_45
					end

					if var_90_48.prefab_name ~= "" and arg_87_1.actors_[var_90_48.prefab_name] ~= nil then
						local var_90_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_48.prefab_name].transform, "story_v_out_319551", "319551022", "story_v_out_319551.awb")

						arg_87_1:RecordAudio("319551022", var_90_54)
						arg_87_1:RecordAudio("319551022", var_90_54)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319551", "319551022", "story_v_out_319551.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319551", "319551022", "story_v_out_319551.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_55 = math.max(var_90_46, arg_87_1.talkMaxDuration)

			if var_90_45 <= arg_87_1.time_ and arg_87_1.time_ < var_90_45 + var_90_55 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_45) / var_90_55

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_45 + var_90_55 and arg_87_1.time_ < var_90_45 + var_90_55 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319551023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319551023
		arg_91_1.duration_ = 9.166

		local var_91_0 = {
			zh = 5.4,
			ja = 9.166
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
				arg_91_0:Play319551024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.675

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

				local var_94_3 = arg_91_1:GetWordFromCfg(319551023)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551023", "story_v_out_319551.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_319551", "319551023", "story_v_out_319551.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_319551", "319551023", "story_v_out_319551.awb")

						arg_91_1:RecordAudio("319551023", var_94_9)
						arg_91_1:RecordAudio("319551023", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319551", "319551023", "story_v_out_319551.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319551", "319551023", "story_v_out_319551.awb")
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
	Play319551024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319551024
		arg_95_1.duration_ = 3.833

		local var_95_0 = {
			zh = 1.7,
			ja = 3.833
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
				arg_95_0:Play319551025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1084ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1084ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0.7, -0.97, -6)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1084ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["1084ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story == nil then
				arg_95_1.var_.characterEffect1084ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect1084ui_story then
					arg_95_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story then
				arg_95_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_15 = arg_95_1.actors_["10066ui_story"].transform
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				arg_95_1.var_.moveOldPos10066ui_story = var_98_15.localPosition
			end

			local var_98_17 = 0.001

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17
				local var_98_19 = Vector3.New(-0.7, -0.99, -5.83)

				var_98_15.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10066ui_story, var_98_19, var_98_18)

				local var_98_20 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_20.x, var_98_20.y, var_98_20.z)

				local var_98_21 = var_98_15.localEulerAngles

				var_98_21.z = 0
				var_98_21.x = 0
				var_98_15.localEulerAngles = var_98_21
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 then
				var_98_15.localPosition = Vector3.New(-0.7, -0.99, -5.83)

				local var_98_22 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_22.x, var_98_22.y, var_98_22.z)

				local var_98_23 = var_98_15.localEulerAngles

				var_98_23.z = 0
				var_98_23.x = 0
				var_98_15.localEulerAngles = var_98_23
			end

			local var_98_24 = arg_95_1.actors_["10066ui_story"]
			local var_98_25 = 0

			if var_98_25 < arg_95_1.time_ and arg_95_1.time_ <= var_98_25 + arg_98_0 and arg_95_1.var_.characterEffect10066ui_story == nil then
				arg_95_1.var_.characterEffect10066ui_story = var_98_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_26 = 0.200000002980232

			if var_98_25 <= arg_95_1.time_ and arg_95_1.time_ < var_98_25 + var_98_26 then
				local var_98_27 = (arg_95_1.time_ - var_98_25) / var_98_26

				if arg_95_1.var_.characterEffect10066ui_story then
					local var_98_28 = Mathf.Lerp(0, 0.5, var_98_27)

					arg_95_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10066ui_story.fillRatio = var_98_28
				end
			end

			if arg_95_1.time_ >= var_98_25 + var_98_26 and arg_95_1.time_ < var_98_25 + var_98_26 + arg_98_0 and arg_95_1.var_.characterEffect10066ui_story then
				local var_98_29 = 0.5

				arg_95_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10066ui_story.fillRatio = var_98_29
			end

			local var_98_30 = 0
			local var_98_31 = 0.175

			if var_98_30 < arg_95_1.time_ and arg_95_1.time_ <= var_98_30 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_32 = arg_95_1:FormatText(StoryNameCfg[6].name)

				arg_95_1.leftNameTxt_.text = var_98_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_33 = arg_95_1:GetWordFromCfg(319551024)
				local var_98_34 = arg_95_1:FormatText(var_98_33.content)

				arg_95_1.text_.text = var_98_34

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_35 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551024", "story_v_out_319551.awb") ~= 0 then
					local var_98_38 = manager.audio:GetVoiceLength("story_v_out_319551", "319551024", "story_v_out_319551.awb") / 1000

					if var_98_38 + var_98_30 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_38 + var_98_30
					end

					if var_98_33.prefab_name ~= "" and arg_95_1.actors_[var_98_33.prefab_name] ~= nil then
						local var_98_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_33.prefab_name].transform, "story_v_out_319551", "319551024", "story_v_out_319551.awb")

						arg_95_1:RecordAudio("319551024", var_98_39)
						arg_95_1:RecordAudio("319551024", var_98_39)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_319551", "319551024", "story_v_out_319551.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_319551", "319551024", "story_v_out_319551.awb")
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
	Play319551025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319551025
		arg_99_1.duration_ = 6.633

		local var_99_0 = {
			zh = 4.866,
			ja = 6.633
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
				arg_99_0:Play319551026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1084ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story == nil then
				arg_99_1.var_.characterEffect1084ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1084ui_story then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1084ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1084ui_story.fillRatio = var_102_5
			end

			local var_102_6 = arg_99_1.actors_["10066ui_story"]
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 and arg_99_1.var_.characterEffect10066ui_story == nil then
				arg_99_1.var_.characterEffect10066ui_story = var_102_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_8 = 0.200000002980232

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8

				if arg_99_1.var_.characterEffect10066ui_story then
					arg_99_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 and arg_99_1.var_.characterEffect10066ui_story then
				arg_99_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 then
				arg_99_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_102_11 = 0
			local var_102_12 = 0.425

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_13 = arg_99_1:FormatText(StoryNameCfg[640].name)

				arg_99_1.leftNameTxt_.text = var_102_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_14 = arg_99_1:GetWordFromCfg(319551025)
				local var_102_15 = arg_99_1:FormatText(var_102_14.content)

				arg_99_1.text_.text = var_102_15

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_16 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551025", "story_v_out_319551.awb") ~= 0 then
					local var_102_19 = manager.audio:GetVoiceLength("story_v_out_319551", "319551025", "story_v_out_319551.awb") / 1000

					if var_102_19 + var_102_11 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_11
					end

					if var_102_14.prefab_name ~= "" and arg_99_1.actors_[var_102_14.prefab_name] ~= nil then
						local var_102_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_14.prefab_name].transform, "story_v_out_319551", "319551025", "story_v_out_319551.awb")

						arg_99_1:RecordAudio("319551025", var_102_20)
						arg_99_1:RecordAudio("319551025", var_102_20)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_319551", "319551025", "story_v_out_319551.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_319551", "319551025", "story_v_out_319551.awb")
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
	Play319551026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319551026
		arg_103_1.duration_ = 10.5

		local var_103_0 = {
			zh = 9.2,
			ja = 10.5
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
				arg_103_0:Play319551027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10058ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10058ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, -0.98, -6.1)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10058ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["10058ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect10058ui_story == nil then
				arg_103_1.var_.characterEffect10058ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect10058ui_story then
					arg_103_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect10058ui_story then
				arg_103_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_106_15 = arg_103_1.actors_["1084ui_story"].transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.moveOldPos1084ui_story = var_106_15.localPosition
			end

			local var_106_17 = 0.001

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Vector3.New(0, 100, 0)

				var_106_15.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1084ui_story, var_106_19, var_106_18)

				local var_106_20 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_20.x, var_106_20.y, var_106_20.z)

				local var_106_21 = var_106_15.localEulerAngles

				var_106_21.z = 0
				var_106_21.x = 0
				var_106_15.localEulerAngles = var_106_21
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				var_106_15.localPosition = Vector3.New(0, 100, 0)

				local var_106_22 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_22.x, var_106_22.y, var_106_22.z)

				local var_106_23 = var_106_15.localEulerAngles

				var_106_23.z = 0
				var_106_23.x = 0
				var_106_15.localEulerAngles = var_106_23
			end

			local var_106_24 = arg_103_1.actors_["1084ui_story"]
			local var_106_25 = 0

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story == nil then
				arg_103_1.var_.characterEffect1084ui_story = var_106_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_26 = 0.200000002980232

			if var_106_25 <= arg_103_1.time_ and arg_103_1.time_ < var_106_25 + var_106_26 then
				local var_106_27 = (arg_103_1.time_ - var_106_25) / var_106_26

				if arg_103_1.var_.characterEffect1084ui_story then
					local var_106_28 = Mathf.Lerp(0, 0.5, var_106_27)

					arg_103_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1084ui_story.fillRatio = var_106_28
				end
			end

			if arg_103_1.time_ >= var_106_25 + var_106_26 and arg_103_1.time_ < var_106_25 + var_106_26 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story then
				local var_106_29 = 0.5

				arg_103_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1084ui_story.fillRatio = var_106_29
			end

			local var_106_30 = arg_103_1.actors_["10066ui_story"].transform
			local var_106_31 = 0

			if var_106_31 < arg_103_1.time_ and arg_103_1.time_ <= var_106_31 + arg_106_0 then
				arg_103_1.var_.moveOldPos10066ui_story = var_106_30.localPosition
			end

			local var_106_32 = 0.001

			if var_106_31 <= arg_103_1.time_ and arg_103_1.time_ < var_106_31 + var_106_32 then
				local var_106_33 = (arg_103_1.time_ - var_106_31) / var_106_32
				local var_106_34 = Vector3.New(0, 100, 0)

				var_106_30.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10066ui_story, var_106_34, var_106_33)

				local var_106_35 = manager.ui.mainCamera.transform.position - var_106_30.position

				var_106_30.forward = Vector3.New(var_106_35.x, var_106_35.y, var_106_35.z)

				local var_106_36 = var_106_30.localEulerAngles

				var_106_36.z = 0
				var_106_36.x = 0
				var_106_30.localEulerAngles = var_106_36
			end

			if arg_103_1.time_ >= var_106_31 + var_106_32 and arg_103_1.time_ < var_106_31 + var_106_32 + arg_106_0 then
				var_106_30.localPosition = Vector3.New(0, 100, 0)

				local var_106_37 = manager.ui.mainCamera.transform.position - var_106_30.position

				var_106_30.forward = Vector3.New(var_106_37.x, var_106_37.y, var_106_37.z)

				local var_106_38 = var_106_30.localEulerAngles

				var_106_38.z = 0
				var_106_38.x = 0
				var_106_30.localEulerAngles = var_106_38
			end

			local var_106_39 = arg_103_1.actors_["10066ui_story"]
			local var_106_40 = 0

			if var_106_40 < arg_103_1.time_ and arg_103_1.time_ <= var_106_40 + arg_106_0 and arg_103_1.var_.characterEffect10066ui_story == nil then
				arg_103_1.var_.characterEffect10066ui_story = var_106_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_41 = 0.200000002980232

			if var_106_40 <= arg_103_1.time_ and arg_103_1.time_ < var_106_40 + var_106_41 then
				local var_106_42 = (arg_103_1.time_ - var_106_40) / var_106_41

				if arg_103_1.var_.characterEffect10066ui_story then
					local var_106_43 = Mathf.Lerp(0, 0.5, var_106_42)

					arg_103_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_103_1.var_.characterEffect10066ui_story.fillRatio = var_106_43
				end
			end

			if arg_103_1.time_ >= var_106_40 + var_106_41 and arg_103_1.time_ < var_106_40 + var_106_41 + arg_106_0 and arg_103_1.var_.characterEffect10066ui_story then
				local var_106_44 = 0.5

				arg_103_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_103_1.var_.characterEffect10066ui_story.fillRatio = var_106_44
			end

			local var_106_45 = 0
			local var_106_46 = 1.25

			if var_106_45 < arg_103_1.time_ and arg_103_1.time_ <= var_106_45 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_47 = arg_103_1:FormatText(StoryNameCfg[471].name)

				arg_103_1.leftNameTxt_.text = var_106_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_48 = arg_103_1:GetWordFromCfg(319551026)
				local var_106_49 = arg_103_1:FormatText(var_106_48.content)

				arg_103_1.text_.text = var_106_49

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_50 = 50
				local var_106_51 = utf8.len(var_106_49)
				local var_106_52 = var_106_50 <= 0 and var_106_46 or var_106_46 * (var_106_51 / var_106_50)

				if var_106_52 > 0 and var_106_46 < var_106_52 then
					arg_103_1.talkMaxDuration = var_106_52

					if var_106_52 + var_106_45 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_52 + var_106_45
					end
				end

				arg_103_1.text_.text = var_106_49
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551026", "story_v_out_319551.awb") ~= 0 then
					local var_106_53 = manager.audio:GetVoiceLength("story_v_out_319551", "319551026", "story_v_out_319551.awb") / 1000

					if var_106_53 + var_106_45 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_53 + var_106_45
					end

					if var_106_48.prefab_name ~= "" and arg_103_1.actors_[var_106_48.prefab_name] ~= nil then
						local var_106_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_48.prefab_name].transform, "story_v_out_319551", "319551026", "story_v_out_319551.awb")

						arg_103_1:RecordAudio("319551026", var_106_54)
						arg_103_1:RecordAudio("319551026", var_106_54)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_319551", "319551026", "story_v_out_319551.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_319551", "319551026", "story_v_out_319551.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_55 = math.max(var_106_46, arg_103_1.talkMaxDuration)

			if var_106_45 <= arg_103_1.time_ and arg_103_1.time_ < var_106_45 + var_106_55 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_45) / var_106_55

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_45 + var_106_55 and arg_103_1.time_ < var_106_45 + var_106_55 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play319551027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319551027
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play319551028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10058ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect10058ui_story == nil then
				arg_107_1.var_.characterEffect10058ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect10058ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_107_1.var_.characterEffect10058ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect10058ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_107_1.var_.characterEffect10058ui_story.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 1.075

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_8 = arg_107_1:GetWordFromCfg(319551027)
				local var_110_9 = arg_107_1:FormatText(var_110_8.content)

				arg_107_1.text_.text = var_110_9

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_10 = 43
				local var_110_11 = utf8.len(var_110_9)
				local var_110_12 = var_110_10 <= 0 and var_110_7 or var_110_7 * (var_110_11 / var_110_10)

				if var_110_12 > 0 and var_110_7 < var_110_12 then
					arg_107_1.talkMaxDuration = var_110_12

					if var_110_12 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_12 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_9
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_13 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_13 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_13

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_13 and arg_107_1.time_ < var_110_6 + var_110_13 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play319551028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 319551028
		arg_111_1.duration_ = 14.233

		local var_111_0 = {
			zh = 8.866,
			ja = 14.233
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
				arg_111_0:Play319551029(arg_111_1)
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
			local var_114_5 = 1.075

			if var_114_4 < arg_111_1.time_ and arg_111_1.time_ <= var_114_4 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_6 = arg_111_1:FormatText(StoryNameCfg[471].name)

				arg_111_1.leftNameTxt_.text = var_114_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_7 = arg_111_1:GetWordFromCfg(319551028)
				local var_114_8 = arg_111_1:FormatText(var_114_7.content)

				arg_111_1.text_.text = var_114_8

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_9 = 43
				local var_114_10 = utf8.len(var_114_8)
				local var_114_11 = var_114_9 <= 0 and var_114_5 or var_114_5 * (var_114_10 / var_114_9)

				if var_114_11 > 0 and var_114_5 < var_114_11 then
					arg_111_1.talkMaxDuration = var_114_11

					if var_114_11 + var_114_4 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_11 + var_114_4
					end
				end

				arg_111_1.text_.text = var_114_8
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551028", "story_v_out_319551.awb") ~= 0 then
					local var_114_12 = manager.audio:GetVoiceLength("story_v_out_319551", "319551028", "story_v_out_319551.awb") / 1000

					if var_114_12 + var_114_4 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_12 + var_114_4
					end

					if var_114_7.prefab_name ~= "" and arg_111_1.actors_[var_114_7.prefab_name] ~= nil then
						local var_114_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_7.prefab_name].transform, "story_v_out_319551", "319551028", "story_v_out_319551.awb")

						arg_111_1:RecordAudio("319551028", var_114_13)
						arg_111_1:RecordAudio("319551028", var_114_13)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_319551", "319551028", "story_v_out_319551.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_319551", "319551028", "story_v_out_319551.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_14 = math.max(var_114_5, arg_111_1.talkMaxDuration)

			if var_114_4 <= arg_111_1.time_ and arg_111_1.time_ < var_114_4 + var_114_14 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_4) / var_114_14

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_4 + var_114_14 and arg_111_1.time_ < var_114_4 + var_114_14 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play319551029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 319551029
		arg_115_1.duration_ = 14.166

		local var_115_0 = {
			zh = 10.6,
			ja = 14.166
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
				arg_115_0:Play319551030(arg_115_1)
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

				local var_118_3 = arg_115_1:GetWordFromCfg(319551029)
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551029", "story_v_out_319551.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_319551", "319551029", "story_v_out_319551.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_319551", "319551029", "story_v_out_319551.awb")

						arg_115_1:RecordAudio("319551029", var_118_9)
						arg_115_1:RecordAudio("319551029", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_319551", "319551029", "story_v_out_319551.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_319551", "319551029", "story_v_out_319551.awb")
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
	Play319551030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319551030
		arg_119_1.duration_ = 11.966

		local var_119_0 = {
			zh = 10.833,
			ja = 11.966
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
				arg_119_0:Play319551031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 1.475

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

				local var_122_3 = arg_119_1:GetWordFromCfg(319551030)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551030", "story_v_out_319551.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_319551", "319551030", "story_v_out_319551.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_319551", "319551030", "story_v_out_319551.awb")

						arg_119_1:RecordAudio("319551030", var_122_9)
						arg_119_1:RecordAudio("319551030", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_319551", "319551030", "story_v_out_319551.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_319551", "319551030", "story_v_out_319551.awb")
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
	Play319551031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319551031
		arg_123_1.duration_ = 3.633

		local var_123_0 = {
			zh = 3.633,
			ja = 2.233
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
				arg_123_0:Play319551032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1084ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1084ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0.7, -0.97, -6)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1084ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["1084ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story == nil then
				arg_123_1.var_.characterEffect1084ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect1084ui_story then
					arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story then
				arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action9_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_126_15 = arg_123_1.actors_["10058ui_story"].transform
			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.var_.moveOldPos10058ui_story = var_126_15.localPosition
			end

			local var_126_17 = 0.001

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17
				local var_126_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_126_15.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10058ui_story, var_126_19, var_126_18)

				local var_126_20 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_20.x, var_126_20.y, var_126_20.z)

				local var_126_21 = var_126_15.localEulerAngles

				var_126_21.z = 0
				var_126_21.x = 0
				var_126_15.localEulerAngles = var_126_21
			end

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 then
				var_126_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_126_22 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_22.x, var_126_22.y, var_126_22.z)

				local var_126_23 = var_126_15.localEulerAngles

				var_126_23.z = 0
				var_126_23.x = 0
				var_126_15.localEulerAngles = var_126_23
			end

			local var_126_24 = arg_123_1.actors_["10058ui_story"]
			local var_126_25 = 0

			if var_126_25 < arg_123_1.time_ and arg_123_1.time_ <= var_126_25 + arg_126_0 and arg_123_1.var_.characterEffect10058ui_story == nil then
				arg_123_1.var_.characterEffect10058ui_story = var_126_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_26 = 0.200000002980232

			if var_126_25 <= arg_123_1.time_ and arg_123_1.time_ < var_126_25 + var_126_26 then
				local var_126_27 = (arg_123_1.time_ - var_126_25) / var_126_26

				if arg_123_1.var_.characterEffect10058ui_story then
					local var_126_28 = Mathf.Lerp(0, 0.5, var_126_27)

					arg_123_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_123_1.var_.characterEffect10058ui_story.fillRatio = var_126_28
				end
			end

			if arg_123_1.time_ >= var_126_25 + var_126_26 and arg_123_1.time_ < var_126_25 + var_126_26 + arg_126_0 and arg_123_1.var_.characterEffect10058ui_story then
				local var_126_29 = 0.5

				arg_123_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_123_1.var_.characterEffect10058ui_story.fillRatio = var_126_29
			end

			local var_126_30 = 0
			local var_126_31 = 0.35

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_32 = arg_123_1:FormatText(StoryNameCfg[6].name)

				arg_123_1.leftNameTxt_.text = var_126_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_33 = arg_123_1:GetWordFromCfg(319551031)
				local var_126_34 = arg_123_1:FormatText(var_126_33.content)

				arg_123_1.text_.text = var_126_34

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_35 = 14
				local var_126_36 = utf8.len(var_126_34)
				local var_126_37 = var_126_35 <= 0 and var_126_31 or var_126_31 * (var_126_36 / var_126_35)

				if var_126_37 > 0 and var_126_31 < var_126_37 then
					arg_123_1.talkMaxDuration = var_126_37

					if var_126_37 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_37 + var_126_30
					end
				end

				arg_123_1.text_.text = var_126_34
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551031", "story_v_out_319551.awb") ~= 0 then
					local var_126_38 = manager.audio:GetVoiceLength("story_v_out_319551", "319551031", "story_v_out_319551.awb") / 1000

					if var_126_38 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_38 + var_126_30
					end

					if var_126_33.prefab_name ~= "" and arg_123_1.actors_[var_126_33.prefab_name] ~= nil then
						local var_126_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_33.prefab_name].transform, "story_v_out_319551", "319551031", "story_v_out_319551.awb")

						arg_123_1:RecordAudio("319551031", var_126_39)
						arg_123_1:RecordAudio("319551031", var_126_39)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_319551", "319551031", "story_v_out_319551.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_319551", "319551031", "story_v_out_319551.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_40 = math.max(var_126_31, arg_123_1.talkMaxDuration)

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_40 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_30) / var_126_40

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_30 + var_126_40 and arg_123_1.time_ < var_126_30 + var_126_40 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play319551032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 319551032
		arg_127_1.duration_ = 12.066

		local var_127_0 = {
			zh = 8.233,
			ja = 12.066
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
				arg_127_0:Play319551033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1084ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1084ui_story == nil then
				arg_127_1.var_.characterEffect1084ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1084ui_story then
					local var_130_4 = Mathf.Lerp(0, 0.5, var_130_3)

					arg_127_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1084ui_story.fillRatio = var_130_4
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1084ui_story then
				local var_130_5 = 0.5

				arg_127_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1084ui_story.fillRatio = var_130_5
			end

			local var_130_6 = arg_127_1.actors_["10058ui_story"]
			local var_130_7 = 0

			if var_130_7 < arg_127_1.time_ and arg_127_1.time_ <= var_130_7 + arg_130_0 and arg_127_1.var_.characterEffect10058ui_story == nil then
				arg_127_1.var_.characterEffect10058ui_story = var_130_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_8 = 0.200000002980232

			if var_130_7 <= arg_127_1.time_ and arg_127_1.time_ < var_130_7 + var_130_8 then
				local var_130_9 = (arg_127_1.time_ - var_130_7) / var_130_8

				if arg_127_1.var_.characterEffect10058ui_story then
					arg_127_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_7 + var_130_8 and arg_127_1.time_ < var_130_7 + var_130_8 + arg_130_0 and arg_127_1.var_.characterEffect10058ui_story then
				arg_127_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_130_10 = 0
			local var_130_11 = 1.05

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_12 = arg_127_1:FormatText(StoryNameCfg[471].name)

				arg_127_1.leftNameTxt_.text = var_130_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_13 = arg_127_1:GetWordFromCfg(319551032)
				local var_130_14 = arg_127_1:FormatText(var_130_13.content)

				arg_127_1.text_.text = var_130_14

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_15 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551032", "story_v_out_319551.awb") ~= 0 then
					local var_130_18 = manager.audio:GetVoiceLength("story_v_out_319551", "319551032", "story_v_out_319551.awb") / 1000

					if var_130_18 + var_130_10 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_18 + var_130_10
					end

					if var_130_13.prefab_name ~= "" and arg_127_1.actors_[var_130_13.prefab_name] ~= nil then
						local var_130_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_13.prefab_name].transform, "story_v_out_319551", "319551032", "story_v_out_319551.awb")

						arg_127_1:RecordAudio("319551032", var_130_19)
						arg_127_1:RecordAudio("319551032", var_130_19)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_319551", "319551032", "story_v_out_319551.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_319551", "319551032", "story_v_out_319551.awb")
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
	Play319551033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 319551033
		arg_131_1.duration_ = 3.266

		local var_131_0 = {
			zh = 2.433,
			ja = 3.266
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
				arg_131_0:Play319551034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10066ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10066ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, -0.99, -5.83)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10066ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["10066ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect10066ui_story == nil then
				arg_131_1.var_.characterEffect10066ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.200000002980232

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect10066ui_story then
					arg_131_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect10066ui_story then
				arg_131_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action7_1")
			end

			local var_134_14 = arg_131_1.actors_["1084ui_story"].transform
			local var_134_15 = 0

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				arg_131_1.var_.moveOldPos1084ui_story = var_134_14.localPosition
			end

			local var_134_16 = 0.001

			if var_134_15 <= arg_131_1.time_ and arg_131_1.time_ < var_134_15 + var_134_16 then
				local var_134_17 = (arg_131_1.time_ - var_134_15) / var_134_16
				local var_134_18 = Vector3.New(0, 100, 0)

				var_134_14.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1084ui_story, var_134_18, var_134_17)

				local var_134_19 = manager.ui.mainCamera.transform.position - var_134_14.position

				var_134_14.forward = Vector3.New(var_134_19.x, var_134_19.y, var_134_19.z)

				local var_134_20 = var_134_14.localEulerAngles

				var_134_20.z = 0
				var_134_20.x = 0
				var_134_14.localEulerAngles = var_134_20
			end

			if arg_131_1.time_ >= var_134_15 + var_134_16 and arg_131_1.time_ < var_134_15 + var_134_16 + arg_134_0 then
				var_134_14.localPosition = Vector3.New(0, 100, 0)

				local var_134_21 = manager.ui.mainCamera.transform.position - var_134_14.position

				var_134_14.forward = Vector3.New(var_134_21.x, var_134_21.y, var_134_21.z)

				local var_134_22 = var_134_14.localEulerAngles

				var_134_22.z = 0
				var_134_22.x = 0
				var_134_14.localEulerAngles = var_134_22
			end

			local var_134_23 = arg_131_1.actors_["1084ui_story"]
			local var_134_24 = 0

			if var_134_24 < arg_131_1.time_ and arg_131_1.time_ <= var_134_24 + arg_134_0 and arg_131_1.var_.characterEffect1084ui_story == nil then
				arg_131_1.var_.characterEffect1084ui_story = var_134_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_25 = 0.200000002980232

			if var_134_24 <= arg_131_1.time_ and arg_131_1.time_ < var_134_24 + var_134_25 then
				local var_134_26 = (arg_131_1.time_ - var_134_24) / var_134_25

				if arg_131_1.var_.characterEffect1084ui_story then
					local var_134_27 = Mathf.Lerp(0, 0.5, var_134_26)

					arg_131_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1084ui_story.fillRatio = var_134_27
				end
			end

			if arg_131_1.time_ >= var_134_24 + var_134_25 and arg_131_1.time_ < var_134_24 + var_134_25 + arg_134_0 and arg_131_1.var_.characterEffect1084ui_story then
				local var_134_28 = 0.5

				arg_131_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1084ui_story.fillRatio = var_134_28
			end

			local var_134_29 = arg_131_1.actors_["10058ui_story"].transform
			local var_134_30 = 0

			if var_134_30 < arg_131_1.time_ and arg_131_1.time_ <= var_134_30 + arg_134_0 then
				arg_131_1.var_.moveOldPos10058ui_story = var_134_29.localPosition
			end

			local var_134_31 = 0.001

			if var_134_30 <= arg_131_1.time_ and arg_131_1.time_ < var_134_30 + var_134_31 then
				local var_134_32 = (arg_131_1.time_ - var_134_30) / var_134_31
				local var_134_33 = Vector3.New(0, 100, 0)

				var_134_29.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10058ui_story, var_134_33, var_134_32)

				local var_134_34 = manager.ui.mainCamera.transform.position - var_134_29.position

				var_134_29.forward = Vector3.New(var_134_34.x, var_134_34.y, var_134_34.z)

				local var_134_35 = var_134_29.localEulerAngles

				var_134_35.z = 0
				var_134_35.x = 0
				var_134_29.localEulerAngles = var_134_35
			end

			if arg_131_1.time_ >= var_134_30 + var_134_31 and arg_131_1.time_ < var_134_30 + var_134_31 + arg_134_0 then
				var_134_29.localPosition = Vector3.New(0, 100, 0)

				local var_134_36 = manager.ui.mainCamera.transform.position - var_134_29.position

				var_134_29.forward = Vector3.New(var_134_36.x, var_134_36.y, var_134_36.z)

				local var_134_37 = var_134_29.localEulerAngles

				var_134_37.z = 0
				var_134_37.x = 0
				var_134_29.localEulerAngles = var_134_37
			end

			local var_134_38 = arg_131_1.actors_["10058ui_story"]
			local var_134_39 = 0

			if var_134_39 < arg_131_1.time_ and arg_131_1.time_ <= var_134_39 + arg_134_0 and arg_131_1.var_.characterEffect10058ui_story == nil then
				arg_131_1.var_.characterEffect10058ui_story = var_134_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_40 = 0.200000002980232

			if var_134_39 <= arg_131_1.time_ and arg_131_1.time_ < var_134_39 + var_134_40 then
				local var_134_41 = (arg_131_1.time_ - var_134_39) / var_134_40

				if arg_131_1.var_.characterEffect10058ui_story then
					local var_134_42 = Mathf.Lerp(0, 0.5, var_134_41)

					arg_131_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_131_1.var_.characterEffect10058ui_story.fillRatio = var_134_42
				end
			end

			if arg_131_1.time_ >= var_134_39 + var_134_40 and arg_131_1.time_ < var_134_39 + var_134_40 + arg_134_0 and arg_131_1.var_.characterEffect10058ui_story then
				local var_134_43 = 0.5

				arg_131_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_131_1.var_.characterEffect10058ui_story.fillRatio = var_134_43
			end

			local var_134_44 = 0

			if var_134_44 < arg_131_1.time_ and arg_131_1.time_ <= var_134_44 + arg_134_0 then
				arg_131_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_134_45 = 0
			local var_134_46 = 0.25

			if var_134_45 < arg_131_1.time_ and arg_131_1.time_ <= var_134_45 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_47 = arg_131_1:FormatText(StoryNameCfg[640].name)

				arg_131_1.leftNameTxt_.text = var_134_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_48 = arg_131_1:GetWordFromCfg(319551033)
				local var_134_49 = arg_131_1:FormatText(var_134_48.content)

				arg_131_1.text_.text = var_134_49

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_50 = 10
				local var_134_51 = utf8.len(var_134_49)
				local var_134_52 = var_134_50 <= 0 and var_134_46 or var_134_46 * (var_134_51 / var_134_50)

				if var_134_52 > 0 and var_134_46 < var_134_52 then
					arg_131_1.talkMaxDuration = var_134_52

					if var_134_52 + var_134_45 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_52 + var_134_45
					end
				end

				arg_131_1.text_.text = var_134_49
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551033", "story_v_out_319551.awb") ~= 0 then
					local var_134_53 = manager.audio:GetVoiceLength("story_v_out_319551", "319551033", "story_v_out_319551.awb") / 1000

					if var_134_53 + var_134_45 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_53 + var_134_45
					end

					if var_134_48.prefab_name ~= "" and arg_131_1.actors_[var_134_48.prefab_name] ~= nil then
						local var_134_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_48.prefab_name].transform, "story_v_out_319551", "319551033", "story_v_out_319551.awb")

						arg_131_1:RecordAudio("319551033", var_134_54)
						arg_131_1:RecordAudio("319551033", var_134_54)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_319551", "319551033", "story_v_out_319551.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_319551", "319551033", "story_v_out_319551.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_55 = math.max(var_134_46, arg_131_1.talkMaxDuration)

			if var_134_45 <= arg_131_1.time_ and arg_131_1.time_ < var_134_45 + var_134_55 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_45) / var_134_55

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_45 + var_134_55 and arg_131_1.time_ < var_134_45 + var_134_55 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play319551034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 319551034
		arg_135_1.duration_ = 7

		local var_135_0 = {
			zh = 5.2,
			ja = 7
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
				arg_135_0:Play319551035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10058ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos10058ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, -0.98, -6.1)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10058ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = arg_135_1.actors_["10058ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect10058ui_story == nil then
				arg_135_1.var_.characterEffect10058ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect10058ui_story then
					arg_135_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect10058ui_story then
				arg_135_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_138_15 = arg_135_1.actors_["10066ui_story"].transform
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 then
				arg_135_1.var_.moveOldPos10066ui_story = var_138_15.localPosition
			end

			local var_138_17 = 0.001

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17
				local var_138_19 = Vector3.New(0, 100, 0)

				var_138_15.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10066ui_story, var_138_19, var_138_18)

				local var_138_20 = manager.ui.mainCamera.transform.position - var_138_15.position

				var_138_15.forward = Vector3.New(var_138_20.x, var_138_20.y, var_138_20.z)

				local var_138_21 = var_138_15.localEulerAngles

				var_138_21.z = 0
				var_138_21.x = 0
				var_138_15.localEulerAngles = var_138_21
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 then
				var_138_15.localPosition = Vector3.New(0, 100, 0)

				local var_138_22 = manager.ui.mainCamera.transform.position - var_138_15.position

				var_138_15.forward = Vector3.New(var_138_22.x, var_138_22.y, var_138_22.z)

				local var_138_23 = var_138_15.localEulerAngles

				var_138_23.z = 0
				var_138_23.x = 0
				var_138_15.localEulerAngles = var_138_23
			end

			local var_138_24 = arg_135_1.actors_["10066ui_story"]
			local var_138_25 = 0

			if var_138_25 < arg_135_1.time_ and arg_135_1.time_ <= var_138_25 + arg_138_0 and arg_135_1.var_.characterEffect10066ui_story == nil then
				arg_135_1.var_.characterEffect10066ui_story = var_138_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_26 = 0.200000002980232

			if var_138_25 <= arg_135_1.time_ and arg_135_1.time_ < var_138_25 + var_138_26 then
				local var_138_27 = (arg_135_1.time_ - var_138_25) / var_138_26

				if arg_135_1.var_.characterEffect10066ui_story then
					arg_135_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_25 + var_138_26 and arg_135_1.time_ < var_138_25 + var_138_26 + arg_138_0 and arg_135_1.var_.characterEffect10066ui_story then
				arg_135_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_138_28 = 0
			local var_138_29 = 0.8

			if var_138_28 < arg_135_1.time_ and arg_135_1.time_ <= var_138_28 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_30 = arg_135_1:FormatText(StoryNameCfg[471].name)

				arg_135_1.leftNameTxt_.text = var_138_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_31 = arg_135_1:GetWordFromCfg(319551034)
				local var_138_32 = arg_135_1:FormatText(var_138_31.content)

				arg_135_1.text_.text = var_138_32

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_33 = 32
				local var_138_34 = utf8.len(var_138_32)
				local var_138_35 = var_138_33 <= 0 and var_138_29 or var_138_29 * (var_138_34 / var_138_33)

				if var_138_35 > 0 and var_138_29 < var_138_35 then
					arg_135_1.talkMaxDuration = var_138_35

					if var_138_35 + var_138_28 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_35 + var_138_28
					end
				end

				arg_135_1.text_.text = var_138_32
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551034", "story_v_out_319551.awb") ~= 0 then
					local var_138_36 = manager.audio:GetVoiceLength("story_v_out_319551", "319551034", "story_v_out_319551.awb") / 1000

					if var_138_36 + var_138_28 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_36 + var_138_28
					end

					if var_138_31.prefab_name ~= "" and arg_135_1.actors_[var_138_31.prefab_name] ~= nil then
						local var_138_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_31.prefab_name].transform, "story_v_out_319551", "319551034", "story_v_out_319551.awb")

						arg_135_1:RecordAudio("319551034", var_138_37)
						arg_135_1:RecordAudio("319551034", var_138_37)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_319551", "319551034", "story_v_out_319551.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_319551", "319551034", "story_v_out_319551.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_38 = math.max(var_138_29, arg_135_1.talkMaxDuration)

			if var_138_28 <= arg_135_1.time_ and arg_135_1.time_ < var_138_28 + var_138_38 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_28) / var_138_38

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_28 + var_138_38 and arg_135_1.time_ < var_138_28 + var_138_38 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play319551035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 319551035
		arg_139_1.duration_ = 10.533

		local var_139_0 = {
			zh = 9.233,
			ja = 10.533
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
				arg_139_0:Play319551036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 1.15

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[471].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(319551035)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551035", "story_v_out_319551.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_319551", "319551035", "story_v_out_319551.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_319551", "319551035", "story_v_out_319551.awb")

						arg_139_1:RecordAudio("319551035", var_142_9)
						arg_139_1:RecordAudio("319551035", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_319551", "319551035", "story_v_out_319551.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_319551", "319551035", "story_v_out_319551.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_10 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_10 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_10

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_10 and arg_139_1.time_ < var_142_0 + var_142_10 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play319551036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 319551036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play319551037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10058ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect10058ui_story == nil then
				arg_143_1.var_.characterEffect10058ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect10058ui_story then
					local var_146_4 = Mathf.Lerp(0, 0.5, var_146_3)

					arg_143_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_143_1.var_.characterEffect10058ui_story.fillRatio = var_146_4
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect10058ui_story then
				local var_146_5 = 0.5

				arg_143_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_143_1.var_.characterEffect10058ui_story.fillRatio = var_146_5
			end

			local var_146_6 = 0
			local var_146_7 = 1.05

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

				local var_146_8 = arg_143_1:GetWordFromCfg(319551036)
				local var_146_9 = arg_143_1:FormatText(var_146_8.content)

				arg_143_1.text_.text = var_146_9

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_10 = 42
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
	Play319551037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 319551037
		arg_147_1.duration_ = 6.166

		local var_147_0 = {
			zh = 4.133,
			ja = 6.166
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
				arg_147_0:Play319551038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10058ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos10058ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10058ui_story, var_150_4, var_150_3)

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

			local var_150_9 = arg_147_1.actors_["10058ui_story"]
			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 and arg_147_1.var_.characterEffect10058ui_story == nil then
				arg_147_1.var_.characterEffect10058ui_story = var_150_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_11 = 0.200000002980232

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_11 then
				local var_150_12 = (arg_147_1.time_ - var_150_10) / var_150_11

				if arg_147_1.var_.characterEffect10058ui_story then
					arg_147_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_10 + var_150_11 and arg_147_1.time_ < var_150_10 + var_150_11 + arg_150_0 and arg_147_1.var_.characterEffect10058ui_story then
				arg_147_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_150_13 = 0

			if var_150_13 < arg_147_1.time_ and arg_147_1.time_ <= var_150_13 + arg_150_0 then
				arg_147_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_150_15 = arg_147_1.actors_["1084ui_story"].transform
			local var_150_16 = 0

			if var_150_16 < arg_147_1.time_ and arg_147_1.time_ <= var_150_16 + arg_150_0 then
				arg_147_1.var_.moveOldPos1084ui_story = var_150_15.localPosition
			end

			local var_150_17 = 0.001

			if var_150_16 <= arg_147_1.time_ and arg_147_1.time_ < var_150_16 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_16) / var_150_17
				local var_150_19 = Vector3.New(0.7, -0.97, -6)

				var_150_15.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1084ui_story, var_150_19, var_150_18)

				local var_150_20 = manager.ui.mainCamera.transform.position - var_150_15.position

				var_150_15.forward = Vector3.New(var_150_20.x, var_150_20.y, var_150_20.z)

				local var_150_21 = var_150_15.localEulerAngles

				var_150_21.z = 0
				var_150_21.x = 0
				var_150_15.localEulerAngles = var_150_21
			end

			if arg_147_1.time_ >= var_150_16 + var_150_17 and arg_147_1.time_ < var_150_16 + var_150_17 + arg_150_0 then
				var_150_15.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_150_22 = manager.ui.mainCamera.transform.position - var_150_15.position

				var_150_15.forward = Vector3.New(var_150_22.x, var_150_22.y, var_150_22.z)

				local var_150_23 = var_150_15.localEulerAngles

				var_150_23.z = 0
				var_150_23.x = 0
				var_150_15.localEulerAngles = var_150_23
			end

			local var_150_24 = arg_147_1.actors_["1084ui_story"]
			local var_150_25 = 0

			if var_150_25 < arg_147_1.time_ and arg_147_1.time_ <= var_150_25 + arg_150_0 and arg_147_1.var_.characterEffect1084ui_story == nil then
				arg_147_1.var_.characterEffect1084ui_story = var_150_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_26 = 0.200000002980232

			if var_150_25 <= arg_147_1.time_ and arg_147_1.time_ < var_150_25 + var_150_26 then
				local var_150_27 = (arg_147_1.time_ - var_150_25) / var_150_26

				if arg_147_1.var_.characterEffect1084ui_story then
					local var_150_28 = Mathf.Lerp(0, 0.5, var_150_27)

					arg_147_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1084ui_story.fillRatio = var_150_28
				end
			end

			if arg_147_1.time_ >= var_150_25 + var_150_26 and arg_147_1.time_ < var_150_25 + var_150_26 + arg_150_0 and arg_147_1.var_.characterEffect1084ui_story then
				local var_150_29 = 0.5

				arg_147_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1084ui_story.fillRatio = var_150_29
			end

			local var_150_30 = 0

			if var_150_30 < arg_147_1.time_ and arg_147_1.time_ <= var_150_30 + arg_150_0 then
				arg_147_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_150_31 = 0

			if var_150_31 < arg_147_1.time_ and arg_147_1.time_ <= var_150_31 + arg_150_0 then
				arg_147_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_150_32 = 0
			local var_150_33 = 0.6

			if var_150_32 < arg_147_1.time_ and arg_147_1.time_ <= var_150_32 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_34 = arg_147_1:FormatText(StoryNameCfg[471].name)

				arg_147_1.leftNameTxt_.text = var_150_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_35 = arg_147_1:GetWordFromCfg(319551037)
				local var_150_36 = arg_147_1:FormatText(var_150_35.content)

				arg_147_1.text_.text = var_150_36

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_37 = 24
				local var_150_38 = utf8.len(var_150_36)
				local var_150_39 = var_150_37 <= 0 and var_150_33 or var_150_33 * (var_150_38 / var_150_37)

				if var_150_39 > 0 and var_150_33 < var_150_39 then
					arg_147_1.talkMaxDuration = var_150_39

					if var_150_39 + var_150_32 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_39 + var_150_32
					end
				end

				arg_147_1.text_.text = var_150_36
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551037", "story_v_out_319551.awb") ~= 0 then
					local var_150_40 = manager.audio:GetVoiceLength("story_v_out_319551", "319551037", "story_v_out_319551.awb") / 1000

					if var_150_40 + var_150_32 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_40 + var_150_32
					end

					if var_150_35.prefab_name ~= "" and arg_147_1.actors_[var_150_35.prefab_name] ~= nil then
						local var_150_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_35.prefab_name].transform, "story_v_out_319551", "319551037", "story_v_out_319551.awb")

						arg_147_1:RecordAudio("319551037", var_150_41)
						arg_147_1:RecordAudio("319551037", var_150_41)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_319551", "319551037", "story_v_out_319551.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_319551", "319551037", "story_v_out_319551.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_42 = math.max(var_150_33, arg_147_1.talkMaxDuration)

			if var_150_32 <= arg_147_1.time_ and arg_147_1.time_ < var_150_32 + var_150_42 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_32) / var_150_42

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_32 + var_150_42 and arg_147_1.time_ < var_150_32 + var_150_42 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play319551038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 319551038
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play319551039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10058ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect10058ui_story == nil then
				arg_151_1.var_.characterEffect10058ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.200000002980232

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect10058ui_story then
					local var_154_4 = Mathf.Lerp(0, 0.5, var_154_3)

					arg_151_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_151_1.var_.characterEffect10058ui_story.fillRatio = var_154_4
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect10058ui_story then
				local var_154_5 = 0.5

				arg_151_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_151_1.var_.characterEffect10058ui_story.fillRatio = var_154_5
			end

			local var_154_6 = 0
			local var_154_7 = 0.95

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_8 = arg_151_1:GetWordFromCfg(319551038)
				local var_154_9 = arg_151_1:FormatText(var_154_8.content)

				arg_151_1.text_.text = var_154_9

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_10 = 38
				local var_154_11 = utf8.len(var_154_9)
				local var_154_12 = var_154_10 <= 0 and var_154_7 or var_154_7 * (var_154_11 / var_154_10)

				if var_154_12 > 0 and var_154_7 < var_154_12 then
					arg_151_1.talkMaxDuration = var_154_12

					if var_154_12 + var_154_6 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_12 + var_154_6
					end
				end

				arg_151_1.text_.text = var_154_9
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_13 = math.max(var_154_7, arg_151_1.talkMaxDuration)

			if var_154_6 <= arg_151_1.time_ and arg_151_1.time_ < var_154_6 + var_154_13 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_6) / var_154_13

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_6 + var_154_13 and arg_151_1.time_ < var_154_6 + var_154_13 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play319551039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 319551039
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play319551040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.025

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

				local var_158_2 = arg_155_1:GetWordFromCfg(319551039)
				local var_158_3 = arg_155_1:FormatText(var_158_2.content)

				arg_155_1.text_.text = var_158_3

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_4 = 41
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
	Play319551040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 319551040
		arg_159_1.duration_ = 9.166

		local var_159_0 = {
			zh = 3.7,
			ja = 9.166
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
				arg_159_0:Play319551041(arg_159_1)
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

			local var_162_6 = arg_159_1.actors_["1084ui_story"]
			local var_162_7 = 0

			if var_162_7 < arg_159_1.time_ and arg_159_1.time_ <= var_162_7 + arg_162_0 and arg_159_1.var_.characterEffect1084ui_story == nil then
				arg_159_1.var_.characterEffect1084ui_story = var_162_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_8 = 0.200000002980232

			if var_162_7 <= arg_159_1.time_ and arg_159_1.time_ < var_162_7 + var_162_8 then
				local var_162_9 = (arg_159_1.time_ - var_162_7) / var_162_8

				if arg_159_1.var_.characterEffect1084ui_story then
					arg_159_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_7 + var_162_8 and arg_159_1.time_ < var_162_7 + var_162_8 + arg_162_0 and arg_159_1.var_.characterEffect1084ui_story then
				arg_159_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_162_10 = 0
			local var_162_11 = 0.5

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_12 = arg_159_1:FormatText(StoryNameCfg[6].name)

				arg_159_1.leftNameTxt_.text = var_162_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_13 = arg_159_1:GetWordFromCfg(319551040)
				local var_162_14 = arg_159_1:FormatText(var_162_13.content)

				arg_159_1.text_.text = var_162_14

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_15 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551040", "story_v_out_319551.awb") ~= 0 then
					local var_162_18 = manager.audio:GetVoiceLength("story_v_out_319551", "319551040", "story_v_out_319551.awb") / 1000

					if var_162_18 + var_162_10 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_18 + var_162_10
					end

					if var_162_13.prefab_name ~= "" and arg_159_1.actors_[var_162_13.prefab_name] ~= nil then
						local var_162_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_13.prefab_name].transform, "story_v_out_319551", "319551040", "story_v_out_319551.awb")

						arg_159_1:RecordAudio("319551040", var_162_19)
						arg_159_1:RecordAudio("319551040", var_162_19)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_319551", "319551040", "story_v_out_319551.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_319551", "319551040", "story_v_out_319551.awb")
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
	Play319551041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 319551041
		arg_163_1.duration_ = 11.6

		local var_163_0 = {
			zh = 5.8,
			ja = 11.6
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
				arg_163_0:Play319551042(arg_163_1)
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

			local var_166_4 = arg_163_1.actors_["1084ui_story"]
			local var_166_5 = 0

			if var_166_5 < arg_163_1.time_ and arg_163_1.time_ <= var_166_5 + arg_166_0 and arg_163_1.var_.characterEffect1084ui_story == nil then
				arg_163_1.var_.characterEffect1084ui_story = var_166_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_6 = 0.200000002980232

			if var_166_5 <= arg_163_1.time_ and arg_163_1.time_ < var_166_5 + var_166_6 then
				local var_166_7 = (arg_163_1.time_ - var_166_5) / var_166_6

				if arg_163_1.var_.characterEffect1084ui_story then
					local var_166_8 = Mathf.Lerp(0, 0.5, var_166_7)

					arg_163_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1084ui_story.fillRatio = var_166_8
				end
			end

			if arg_163_1.time_ >= var_166_5 + var_166_6 and arg_163_1.time_ < var_166_5 + var_166_6 + arg_166_0 and arg_163_1.var_.characterEffect1084ui_story then
				local var_166_9 = 0.5

				arg_163_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1084ui_story.fillRatio = var_166_9
			end

			local var_166_10 = 0
			local var_166_11 = 0.675

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_12 = arg_163_1:FormatText(StoryNameCfg[471].name)

				arg_163_1.leftNameTxt_.text = var_166_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_13 = arg_163_1:GetWordFromCfg(319551041)
				local var_166_14 = arg_163_1:FormatText(var_166_13.content)

				arg_163_1.text_.text = var_166_14

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_15 = 27
				local var_166_16 = utf8.len(var_166_14)
				local var_166_17 = var_166_15 <= 0 and var_166_11 or var_166_11 * (var_166_16 / var_166_15)

				if var_166_17 > 0 and var_166_11 < var_166_17 then
					arg_163_1.talkMaxDuration = var_166_17

					if var_166_17 + var_166_10 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_17 + var_166_10
					end
				end

				arg_163_1.text_.text = var_166_14
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551041", "story_v_out_319551.awb") ~= 0 then
					local var_166_18 = manager.audio:GetVoiceLength("story_v_out_319551", "319551041", "story_v_out_319551.awb") / 1000

					if var_166_18 + var_166_10 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_18 + var_166_10
					end

					if var_166_13.prefab_name ~= "" and arg_163_1.actors_[var_166_13.prefab_name] ~= nil then
						local var_166_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_13.prefab_name].transform, "story_v_out_319551", "319551041", "story_v_out_319551.awb")

						arg_163_1:RecordAudio("319551041", var_166_19)
						arg_163_1:RecordAudio("319551041", var_166_19)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_319551", "319551041", "story_v_out_319551.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_319551", "319551041", "story_v_out_319551.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_20 = math.max(var_166_11, arg_163_1.talkMaxDuration)

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_20 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_10) / var_166_20

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_10 + var_166_20 and arg_163_1.time_ < var_166_10 + var_166_20 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play319551042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319551042
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play319551043(arg_167_1)
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

			if var_170_6 < arg_167_1.time_ and arg_167_1.time_ <= var_170_6 + arg_170_0 then
				arg_167_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_170_7 = 0

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 then
				arg_167_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_170_8 = 0
			local var_170_9 = 1.05

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_10 = arg_167_1:GetWordFromCfg(319551042)
				local var_170_11 = arg_167_1:FormatText(var_170_10.content)

				arg_167_1.text_.text = var_170_11

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_12 = 42
				local var_170_13 = utf8.len(var_170_11)
				local var_170_14 = var_170_12 <= 0 and var_170_9 or var_170_9 * (var_170_13 / var_170_12)

				if var_170_14 > 0 and var_170_9 < var_170_14 then
					arg_167_1.talkMaxDuration = var_170_14

					if var_170_14 + var_170_8 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_14 + var_170_8
					end
				end

				arg_167_1.text_.text = var_170_11
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_15 = math.max(var_170_9, arg_167_1.talkMaxDuration)

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_15 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_8) / var_170_15

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_8 + var_170_15 and arg_167_1.time_ < var_170_8 + var_170_15 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319551043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319551043
		arg_171_1.duration_ = 6.233

		local var_171_0 = {
			zh = 3.9,
			ja = 6.233
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
				arg_171_0:Play319551044(arg_171_1)
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
					arg_171_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect10058ui_story then
				arg_171_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_174_4 = arg_171_1.actors_["1084ui_story"]
			local var_174_5 = 0

			if var_174_5 < arg_171_1.time_ and arg_171_1.time_ <= var_174_5 + arg_174_0 and arg_171_1.var_.characterEffect1084ui_story == nil then
				arg_171_1.var_.characterEffect1084ui_story = var_174_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_6 = 0.200000002980232

			if var_174_5 <= arg_171_1.time_ and arg_171_1.time_ < var_174_5 + var_174_6 then
				local var_174_7 = (arg_171_1.time_ - var_174_5) / var_174_6

				if arg_171_1.var_.characterEffect1084ui_story then
					local var_174_8 = Mathf.Lerp(0, 0.5, var_174_7)

					arg_171_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1084ui_story.fillRatio = var_174_8
				end
			end

			if arg_171_1.time_ >= var_174_5 + var_174_6 and arg_171_1.time_ < var_174_5 + var_174_6 + arg_174_0 and arg_171_1.var_.characterEffect1084ui_story then
				local var_174_9 = 0.5

				arg_171_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1084ui_story.fillRatio = var_174_9
			end

			local var_174_10 = 0
			local var_174_11 = 0.3

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_12 = arg_171_1:FormatText(StoryNameCfg[471].name)

				arg_171_1.leftNameTxt_.text = var_174_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_13 = arg_171_1:GetWordFromCfg(319551043)
				local var_174_14 = arg_171_1:FormatText(var_174_13.content)

				arg_171_1.text_.text = var_174_14

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_15 = 12
				local var_174_16 = utf8.len(var_174_14)
				local var_174_17 = var_174_15 <= 0 and var_174_11 or var_174_11 * (var_174_16 / var_174_15)

				if var_174_17 > 0 and var_174_11 < var_174_17 then
					arg_171_1.talkMaxDuration = var_174_17

					if var_174_17 + var_174_10 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_17 + var_174_10
					end
				end

				arg_171_1.text_.text = var_174_14
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551043", "story_v_out_319551.awb") ~= 0 then
					local var_174_18 = manager.audio:GetVoiceLength("story_v_out_319551", "319551043", "story_v_out_319551.awb") / 1000

					if var_174_18 + var_174_10 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_18 + var_174_10
					end

					if var_174_13.prefab_name ~= "" and arg_171_1.actors_[var_174_13.prefab_name] ~= nil then
						local var_174_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_13.prefab_name].transform, "story_v_out_319551", "319551043", "story_v_out_319551.awb")

						arg_171_1:RecordAudio("319551043", var_174_19)
						arg_171_1:RecordAudio("319551043", var_174_19)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_319551", "319551043", "story_v_out_319551.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_319551", "319551043", "story_v_out_319551.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_20 = math.max(var_174_11, arg_171_1.talkMaxDuration)

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_20 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_10) / var_174_20

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_10 + var_174_20 and arg_171_1.time_ < var_174_10 + var_174_20 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play319551044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319551044
		arg_175_1.duration_ = 5.666

		local var_175_0 = {
			zh = 2.933,
			ja = 5.666
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
				arg_175_0:Play319551045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1084ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1084ui_story == nil then
				arg_175_1.var_.characterEffect1084ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1084ui_story then
					arg_175_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1084ui_story then
				arg_175_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_178_4 = 0

			if var_178_4 < arg_175_1.time_ and arg_175_1.time_ <= var_178_4 + arg_178_0 then
				arg_175_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_178_5 = 0

			if var_178_5 < arg_175_1.time_ and arg_175_1.time_ <= var_178_5 + arg_178_0 then
				arg_175_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_178_6 = arg_175_1.actors_["10058ui_story"]
			local var_178_7 = 0

			if var_178_7 < arg_175_1.time_ and arg_175_1.time_ <= var_178_7 + arg_178_0 and arg_175_1.var_.characterEffect10058ui_story == nil then
				arg_175_1.var_.characterEffect10058ui_story = var_178_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_8 = 0.200000002980232

			if var_178_7 <= arg_175_1.time_ and arg_175_1.time_ < var_178_7 + var_178_8 then
				local var_178_9 = (arg_175_1.time_ - var_178_7) / var_178_8

				if arg_175_1.var_.characterEffect10058ui_story then
					local var_178_10 = Mathf.Lerp(0, 0.5, var_178_9)

					arg_175_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_175_1.var_.characterEffect10058ui_story.fillRatio = var_178_10
				end
			end

			if arg_175_1.time_ >= var_178_7 + var_178_8 and arg_175_1.time_ < var_178_7 + var_178_8 + arg_178_0 and arg_175_1.var_.characterEffect10058ui_story then
				local var_178_11 = 0.5

				arg_175_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_175_1.var_.characterEffect10058ui_story.fillRatio = var_178_11
			end

			local var_178_12 = 0
			local var_178_13 = 0.325

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

				local var_178_15 = arg_175_1:GetWordFromCfg(319551044)
				local var_178_16 = arg_175_1:FormatText(var_178_15.content)

				arg_175_1.text_.text = var_178_16

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_17 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551044", "story_v_out_319551.awb") ~= 0 then
					local var_178_20 = manager.audio:GetVoiceLength("story_v_out_319551", "319551044", "story_v_out_319551.awb") / 1000

					if var_178_20 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_20 + var_178_12
					end

					if var_178_15.prefab_name ~= "" and arg_175_1.actors_[var_178_15.prefab_name] ~= nil then
						local var_178_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_15.prefab_name].transform, "story_v_out_319551", "319551044", "story_v_out_319551.awb")

						arg_175_1:RecordAudio("319551044", var_178_21)
						arg_175_1:RecordAudio("319551044", var_178_21)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_319551", "319551044", "story_v_out_319551.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_319551", "319551044", "story_v_out_319551.awb")
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
	Play319551045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319551045
		arg_179_1.duration_ = 11.766

		local var_179_0 = {
			zh = 3.9,
			ja = 11.766
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
				arg_179_0:Play319551046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1084ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1084ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0.7, -0.97, -6)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1084ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = 0
			local var_182_10 = 0.55

			if var_182_9 < arg_179_1.time_ and arg_179_1.time_ <= var_182_9 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_11 = arg_179_1:FormatText(StoryNameCfg[6].name)

				arg_179_1.leftNameTxt_.text = var_182_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_12 = arg_179_1:GetWordFromCfg(319551045)
				local var_182_13 = arg_179_1:FormatText(var_182_12.content)

				arg_179_1.text_.text = var_182_13

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_14 = 22
				local var_182_15 = utf8.len(var_182_13)
				local var_182_16 = var_182_14 <= 0 and var_182_10 or var_182_10 * (var_182_15 / var_182_14)

				if var_182_16 > 0 and var_182_10 < var_182_16 then
					arg_179_1.talkMaxDuration = var_182_16

					if var_182_16 + var_182_9 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_16 + var_182_9
					end
				end

				arg_179_1.text_.text = var_182_13
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551045", "story_v_out_319551.awb") ~= 0 then
					local var_182_17 = manager.audio:GetVoiceLength("story_v_out_319551", "319551045", "story_v_out_319551.awb") / 1000

					if var_182_17 + var_182_9 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_17 + var_182_9
					end

					if var_182_12.prefab_name ~= "" and arg_179_1.actors_[var_182_12.prefab_name] ~= nil then
						local var_182_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_12.prefab_name].transform, "story_v_out_319551", "319551045", "story_v_out_319551.awb")

						arg_179_1:RecordAudio("319551045", var_182_18)
						arg_179_1:RecordAudio("319551045", var_182_18)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_319551", "319551045", "story_v_out_319551.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_319551", "319551045", "story_v_out_319551.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_19 = math.max(var_182_10, arg_179_1.talkMaxDuration)

			if var_182_9 <= arg_179_1.time_ and arg_179_1.time_ < var_182_9 + var_182_19 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_9) / var_182_19

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_9 + var_182_19 and arg_179_1.time_ < var_182_9 + var_182_19 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319551046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 319551046
		arg_183_1.duration_ = 7.8

		local var_183_0 = {
			zh = 7.8,
			ja = 6.2
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
				arg_183_0:Play319551047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10058ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10058ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10058ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = arg_183_1.actors_["10058ui_story"]
			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 and arg_183_1.var_.characterEffect10058ui_story == nil then
				arg_183_1.var_.characterEffect10058ui_story = var_186_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_11 = 0.200000002980232

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_11 then
				local var_186_12 = (arg_183_1.time_ - var_186_10) / var_186_11

				if arg_183_1.var_.characterEffect10058ui_story then
					arg_183_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_10 + var_186_11 and arg_183_1.time_ < var_186_10 + var_186_11 + arg_186_0 and arg_183_1.var_.characterEffect10058ui_story then
				arg_183_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_186_13 = 0

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				arg_183_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 then
				arg_183_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_186_15 = arg_183_1.actors_["1084ui_story"]
			local var_186_16 = 0

			if var_186_16 < arg_183_1.time_ and arg_183_1.time_ <= var_186_16 + arg_186_0 and arg_183_1.var_.characterEffect1084ui_story == nil then
				arg_183_1.var_.characterEffect1084ui_story = var_186_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_17 = 0.200000002980232

			if var_186_16 <= arg_183_1.time_ and arg_183_1.time_ < var_186_16 + var_186_17 then
				local var_186_18 = (arg_183_1.time_ - var_186_16) / var_186_17

				if arg_183_1.var_.characterEffect1084ui_story then
					local var_186_19 = Mathf.Lerp(0, 0.5, var_186_18)

					arg_183_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1084ui_story.fillRatio = var_186_19
				end
			end

			if arg_183_1.time_ >= var_186_16 + var_186_17 and arg_183_1.time_ < var_186_16 + var_186_17 + arg_186_0 and arg_183_1.var_.characterEffect1084ui_story then
				local var_186_20 = 0.5

				arg_183_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1084ui_story.fillRatio = var_186_20
			end

			local var_186_21 = 0
			local var_186_22 = 0.975

			if var_186_21 < arg_183_1.time_ and arg_183_1.time_ <= var_186_21 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_23 = arg_183_1:FormatText(StoryNameCfg[471].name)

				arg_183_1.leftNameTxt_.text = var_186_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_24 = arg_183_1:GetWordFromCfg(319551046)
				local var_186_25 = arg_183_1:FormatText(var_186_24.content)

				arg_183_1.text_.text = var_186_25

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_26 = 39
				local var_186_27 = utf8.len(var_186_25)
				local var_186_28 = var_186_26 <= 0 and var_186_22 or var_186_22 * (var_186_27 / var_186_26)

				if var_186_28 > 0 and var_186_22 < var_186_28 then
					arg_183_1.talkMaxDuration = var_186_28

					if var_186_28 + var_186_21 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_28 + var_186_21
					end
				end

				arg_183_1.text_.text = var_186_25
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551046", "story_v_out_319551.awb") ~= 0 then
					local var_186_29 = manager.audio:GetVoiceLength("story_v_out_319551", "319551046", "story_v_out_319551.awb") / 1000

					if var_186_29 + var_186_21 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_29 + var_186_21
					end

					if var_186_24.prefab_name ~= "" and arg_183_1.actors_[var_186_24.prefab_name] ~= nil then
						local var_186_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_24.prefab_name].transform, "story_v_out_319551", "319551046", "story_v_out_319551.awb")

						arg_183_1:RecordAudio("319551046", var_186_30)
						arg_183_1:RecordAudio("319551046", var_186_30)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_319551", "319551046", "story_v_out_319551.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_319551", "319551046", "story_v_out_319551.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_31 = math.max(var_186_22, arg_183_1.talkMaxDuration)

			if var_186_21 <= arg_183_1.time_ and arg_183_1.time_ < var_186_21 + var_186_31 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_21) / var_186_31

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_21 + var_186_31 and arg_183_1.time_ < var_186_21 + var_186_31 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play319551047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 319551047
		arg_187_1.duration_ = 7.833

		local var_187_0 = {
			zh = 7.466,
			ja = 7.833
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
				arg_187_0:Play319551048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.875

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

				local var_190_3 = arg_187_1:GetWordFromCfg(319551047)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551047", "story_v_out_319551.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_319551", "319551047", "story_v_out_319551.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_319551", "319551047", "story_v_out_319551.awb")

						arg_187_1:RecordAudio("319551047", var_190_9)
						arg_187_1:RecordAudio("319551047", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_319551", "319551047", "story_v_out_319551.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_319551", "319551047", "story_v_out_319551.awb")
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
	Play319551048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 319551048
		arg_191_1.duration_ = 5.966

		local var_191_0 = {
			zh = 1.999999999999,
			ja = 5.966
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
				arg_191_0:Play319551049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1084ui_story"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1084ui_story = var_194_0.localPosition
			end

			local var_194_2 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2
				local var_194_4 = Vector3.New(0.7, -0.97, -6)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1084ui_story, var_194_4, var_194_3)

				local var_194_5 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_5.x, var_194_5.y, var_194_5.z)

				local var_194_6 = var_194_0.localEulerAngles

				var_194_6.z = 0
				var_194_6.x = 0
				var_194_0.localEulerAngles = var_194_6
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_194_7 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_7.x, var_194_7.y, var_194_7.z)

				local var_194_8 = var_194_0.localEulerAngles

				var_194_8.z = 0
				var_194_8.x = 0
				var_194_0.localEulerAngles = var_194_8
			end

			local var_194_9 = arg_191_1.actors_["1084ui_story"]
			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 and arg_191_1.var_.characterEffect1084ui_story == nil then
				arg_191_1.var_.characterEffect1084ui_story = var_194_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_11 = 0.200000002980232

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_11 then
				local var_194_12 = (arg_191_1.time_ - var_194_10) / var_194_11

				if arg_191_1.var_.characterEffect1084ui_story then
					arg_191_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_10 + var_194_11 and arg_191_1.time_ < var_194_10 + var_194_11 + arg_194_0 and arg_191_1.var_.characterEffect1084ui_story then
				arg_191_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_194_13 = 0

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 then
				arg_191_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_194_15 = arg_191_1.actors_["10058ui_story"]
			local var_194_16 = 0

			if var_194_16 < arg_191_1.time_ and arg_191_1.time_ <= var_194_16 + arg_194_0 and arg_191_1.var_.characterEffect10058ui_story == nil then
				arg_191_1.var_.characterEffect10058ui_story = var_194_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_17 = 0.200000002980232

			if var_194_16 <= arg_191_1.time_ and arg_191_1.time_ < var_194_16 + var_194_17 then
				local var_194_18 = (arg_191_1.time_ - var_194_16) / var_194_17

				if arg_191_1.var_.characterEffect10058ui_story then
					local var_194_19 = Mathf.Lerp(0, 0.5, var_194_18)

					arg_191_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_191_1.var_.characterEffect10058ui_story.fillRatio = var_194_19
				end
			end

			if arg_191_1.time_ >= var_194_16 + var_194_17 and arg_191_1.time_ < var_194_16 + var_194_17 + arg_194_0 and arg_191_1.var_.characterEffect10058ui_story then
				local var_194_20 = 0.5

				arg_191_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_191_1.var_.characterEffect10058ui_story.fillRatio = var_194_20
			end

			local var_194_21 = 0
			local var_194_22 = 0.175

			if var_194_21 < arg_191_1.time_ and arg_191_1.time_ <= var_194_21 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_23 = arg_191_1:FormatText(StoryNameCfg[6].name)

				arg_191_1.leftNameTxt_.text = var_194_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_24 = arg_191_1:GetWordFromCfg(319551048)
				local var_194_25 = arg_191_1:FormatText(var_194_24.content)

				arg_191_1.text_.text = var_194_25

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_26 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551048", "story_v_out_319551.awb") ~= 0 then
					local var_194_29 = manager.audio:GetVoiceLength("story_v_out_319551", "319551048", "story_v_out_319551.awb") / 1000

					if var_194_29 + var_194_21 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_29 + var_194_21
					end

					if var_194_24.prefab_name ~= "" and arg_191_1.actors_[var_194_24.prefab_name] ~= nil then
						local var_194_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_24.prefab_name].transform, "story_v_out_319551", "319551048", "story_v_out_319551.awb")

						arg_191_1:RecordAudio("319551048", var_194_30)
						arg_191_1:RecordAudio("319551048", var_194_30)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_319551", "319551048", "story_v_out_319551.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_319551", "319551048", "story_v_out_319551.awb")
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
	Play319551049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 319551049
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play319551050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1084ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1084ui_story == nil then
				arg_195_1.var_.characterEffect1084ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1084ui_story then
					local var_198_4 = Mathf.Lerp(0, 0.5, var_198_3)

					arg_195_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1084ui_story.fillRatio = var_198_4
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1084ui_story then
				local var_198_5 = 0.5

				arg_195_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1084ui_story.fillRatio = var_198_5
			end

			local var_198_6 = 0
			local var_198_7 = 0.9

			if var_198_6 < arg_195_1.time_ and arg_195_1.time_ <= var_198_6 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_8 = arg_195_1:GetWordFromCfg(319551049)
				local var_198_9 = arg_195_1:FormatText(var_198_8.content)

				arg_195_1.text_.text = var_198_9

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_10 = 36
				local var_198_11 = utf8.len(var_198_9)
				local var_198_12 = var_198_10 <= 0 and var_198_7 or var_198_7 * (var_198_11 / var_198_10)

				if var_198_12 > 0 and var_198_7 < var_198_12 then
					arg_195_1.talkMaxDuration = var_198_12

					if var_198_12 + var_198_6 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_12 + var_198_6
					end
				end

				arg_195_1.text_.text = var_198_9
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_13 = math.max(var_198_7, arg_195_1.talkMaxDuration)

			if var_198_6 <= arg_195_1.time_ and arg_195_1.time_ < var_198_6 + var_198_13 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_6) / var_198_13

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_6 + var_198_13 and arg_195_1.time_ < var_198_6 + var_198_13 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play319551050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319551050
		arg_199_1.duration_ = 3.366

		local var_199_0 = {
			zh = 1.999999999999,
			ja = 3.366
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
				arg_199_0:Play319551051(arg_199_1)
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

			local var_202_6 = arg_199_1.actors_["1084ui_story"]
			local var_202_7 = 0

			if var_202_7 < arg_199_1.time_ and arg_199_1.time_ <= var_202_7 + arg_202_0 and arg_199_1.var_.characterEffect1084ui_story == nil then
				arg_199_1.var_.characterEffect1084ui_story = var_202_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_8 = 0.200000002980232

			if var_202_7 <= arg_199_1.time_ and arg_199_1.time_ < var_202_7 + var_202_8 then
				local var_202_9 = (arg_199_1.time_ - var_202_7) / var_202_8

				if arg_199_1.var_.characterEffect1084ui_story then
					arg_199_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_7 + var_202_8 and arg_199_1.time_ < var_202_7 + var_202_8 + arg_202_0 and arg_199_1.var_.characterEffect1084ui_story then
				arg_199_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_202_11 = 0

			if var_202_11 < arg_199_1.time_ and arg_199_1.time_ <= var_202_11 + arg_202_0 then
				arg_199_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_202_12 = 0
			local var_202_13 = 0.175

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_14 = arg_199_1:FormatText(StoryNameCfg[6].name)

				arg_199_1.leftNameTxt_.text = var_202_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_15 = arg_199_1:GetWordFromCfg(319551050)
				local var_202_16 = arg_199_1:FormatText(var_202_15.content)

				arg_199_1.text_.text = var_202_16

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_17 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551050", "story_v_out_319551.awb") ~= 0 then
					local var_202_20 = manager.audio:GetVoiceLength("story_v_out_319551", "319551050", "story_v_out_319551.awb") / 1000

					if var_202_20 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_12
					end

					if var_202_15.prefab_name ~= "" and arg_199_1.actors_[var_202_15.prefab_name] ~= nil then
						local var_202_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_15.prefab_name].transform, "story_v_out_319551", "319551050", "story_v_out_319551.awb")

						arg_199_1:RecordAudio("319551050", var_202_21)
						arg_199_1:RecordAudio("319551050", var_202_21)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_319551", "319551050", "story_v_out_319551.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_319551", "319551050", "story_v_out_319551.awb")
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
	Play319551051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319551051
		arg_203_1.duration_ = 6.933

		local var_203_0 = {
			zh = 4.533,
			ja = 6.933
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
				arg_203_0:Play319551052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.675

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[6].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(319551051)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 27
				local var_206_6 = utf8.len(var_206_4)
				local var_206_7 = var_206_5 <= 0 and var_206_1 or var_206_1 * (var_206_6 / var_206_5)

				if var_206_7 > 0 and var_206_1 < var_206_7 then
					arg_203_1.talkMaxDuration = var_206_7

					if var_206_7 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_7 + var_206_0
					end
				end

				arg_203_1.text_.text = var_206_4
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551051", "story_v_out_319551.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_319551", "319551051", "story_v_out_319551.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_319551", "319551051", "story_v_out_319551.awb")

						arg_203_1:RecordAudio("319551051", var_206_9)
						arg_203_1:RecordAudio("319551051", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_319551", "319551051", "story_v_out_319551.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_319551", "319551051", "story_v_out_319551.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_10 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_10 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_10

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_10 and arg_203_1.time_ < var_206_0 + var_206_10 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play319551052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 319551052
		arg_207_1.duration_ = 4.9

		local var_207_0 = {
			zh = 3.766,
			ja = 4.9
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
				arg_207_0:Play319551053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["10058ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos10058ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10058ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["10058ui_story"]
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 and arg_207_1.var_.characterEffect10058ui_story == nil then
				arg_207_1.var_.characterEffect10058ui_story = var_210_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_11 = 0.200000002980232

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11

				if arg_207_1.var_.characterEffect10058ui_story then
					arg_207_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 and arg_207_1.var_.characterEffect10058ui_story then
				arg_207_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_210_13 = 0

			if var_210_13 < arg_207_1.time_ and arg_207_1.time_ <= var_210_13 + arg_210_0 then
				arg_207_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 then
				arg_207_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_210_15 = arg_207_1.actors_["1084ui_story"]
			local var_210_16 = 0

			if var_210_16 < arg_207_1.time_ and arg_207_1.time_ <= var_210_16 + arg_210_0 and arg_207_1.var_.characterEffect1084ui_story == nil then
				arg_207_1.var_.characterEffect1084ui_story = var_210_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_17 = 0.200000002980232

			if var_210_16 <= arg_207_1.time_ and arg_207_1.time_ < var_210_16 + var_210_17 then
				local var_210_18 = (arg_207_1.time_ - var_210_16) / var_210_17

				if arg_207_1.var_.characterEffect1084ui_story then
					local var_210_19 = Mathf.Lerp(0, 0.5, var_210_18)

					arg_207_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1084ui_story.fillRatio = var_210_19
				end
			end

			if arg_207_1.time_ >= var_210_16 + var_210_17 and arg_207_1.time_ < var_210_16 + var_210_17 + arg_210_0 and arg_207_1.var_.characterEffect1084ui_story then
				local var_210_20 = 0.5

				arg_207_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1084ui_story.fillRatio = var_210_20
			end

			local var_210_21 = 0

			if var_210_21 < arg_207_1.time_ and arg_207_1.time_ <= var_210_21 + arg_210_0 then
				arg_207_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_2")
			end

			local var_210_22 = 0

			if var_210_22 < arg_207_1.time_ and arg_207_1.time_ <= var_210_22 + arg_210_0 then
				arg_207_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_210_23 = 0
			local var_210_24 = 0.3

			if var_210_23 < arg_207_1.time_ and arg_207_1.time_ <= var_210_23 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_25 = arg_207_1:FormatText(StoryNameCfg[471].name)

				arg_207_1.leftNameTxt_.text = var_210_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_26 = arg_207_1:GetWordFromCfg(319551052)
				local var_210_27 = arg_207_1:FormatText(var_210_26.content)

				arg_207_1.text_.text = var_210_27

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_28 = 12
				local var_210_29 = utf8.len(var_210_27)
				local var_210_30 = var_210_28 <= 0 and var_210_24 or var_210_24 * (var_210_29 / var_210_28)

				if var_210_30 > 0 and var_210_24 < var_210_30 then
					arg_207_1.talkMaxDuration = var_210_30

					if var_210_30 + var_210_23 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_30 + var_210_23
					end
				end

				arg_207_1.text_.text = var_210_27
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551052", "story_v_out_319551.awb") ~= 0 then
					local var_210_31 = manager.audio:GetVoiceLength("story_v_out_319551", "319551052", "story_v_out_319551.awb") / 1000

					if var_210_31 + var_210_23 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_31 + var_210_23
					end

					if var_210_26.prefab_name ~= "" and arg_207_1.actors_[var_210_26.prefab_name] ~= nil then
						local var_210_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_26.prefab_name].transform, "story_v_out_319551", "319551052", "story_v_out_319551.awb")

						arg_207_1:RecordAudio("319551052", var_210_32)
						arg_207_1:RecordAudio("319551052", var_210_32)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_319551", "319551052", "story_v_out_319551.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_319551", "319551052", "story_v_out_319551.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_33 = math.max(var_210_24, arg_207_1.talkMaxDuration)

			if var_210_23 <= arg_207_1.time_ and arg_207_1.time_ < var_210_23 + var_210_33 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_23) / var_210_33

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_23 + var_210_33 and arg_207_1.time_ < var_210_23 + var_210_33 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play319551053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 319551053
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play319551054(arg_211_1)
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
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_211_1.var_.characterEffect10058ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect10058ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_211_1.var_.characterEffect10058ui_story.fillRatio = var_214_5
			end

			local var_214_6 = 0
			local var_214_7 = 0.95

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_8 = arg_211_1:GetWordFromCfg(319551053)
				local var_214_9 = arg_211_1:FormatText(var_214_8.content)

				arg_211_1.text_.text = var_214_9

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_10 = 38
				local var_214_11 = utf8.len(var_214_9)
				local var_214_12 = var_214_10 <= 0 and var_214_7 or var_214_7 * (var_214_11 / var_214_10)

				if var_214_12 > 0 and var_214_7 < var_214_12 then
					arg_211_1.talkMaxDuration = var_214_12

					if var_214_12 + var_214_6 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_12 + var_214_6
					end
				end

				arg_211_1.text_.text = var_214_9
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_13 = math.max(var_214_7, arg_211_1.talkMaxDuration)

			if var_214_6 <= arg_211_1.time_ and arg_211_1.time_ < var_214_6 + var_214_13 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_6) / var_214_13

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_6 + var_214_13 and arg_211_1.time_ < var_214_6 + var_214_13 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play319551054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 319551054
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play319551055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 1.275

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_2 = arg_215_1:GetWordFromCfg(319551054)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 51
				local var_218_5 = utf8.len(var_218_3)
				local var_218_6 = var_218_4 <= 0 and var_218_1 or var_218_1 * (var_218_5 / var_218_4)

				if var_218_6 > 0 and var_218_1 < var_218_6 then
					arg_215_1.talkMaxDuration = var_218_6

					if var_218_6 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_6 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_3
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_7 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_7 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_7

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_7 and arg_215_1.time_ < var_218_0 + var_218_7 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play319551055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 319551055
		arg_219_1.duration_ = 3.033

		local var_219_0 = {
			zh = 1.999999999999,
			ja = 3.033
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
				arg_219_0:Play319551056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1084ui_story"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1084ui_story = var_222_0.localPosition
			end

			local var_222_2 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2
				local var_222_4 = Vector3.New(0.7, -0.97, -6)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1084ui_story, var_222_4, var_222_3)

				local var_222_5 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_5.x, var_222_5.y, var_222_5.z)

				local var_222_6 = var_222_0.localEulerAngles

				var_222_6.z = 0
				var_222_6.x = 0
				var_222_0.localEulerAngles = var_222_6
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_222_7 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_7.x, var_222_7.y, var_222_7.z)

				local var_222_8 = var_222_0.localEulerAngles

				var_222_8.z = 0
				var_222_8.x = 0
				var_222_0.localEulerAngles = var_222_8
			end

			local var_222_9 = arg_219_1.actors_["1084ui_story"]
			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 and arg_219_1.var_.characterEffect1084ui_story == nil then
				arg_219_1.var_.characterEffect1084ui_story = var_222_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_11 = 0.200000002980232

			if var_222_10 <= arg_219_1.time_ and arg_219_1.time_ < var_222_10 + var_222_11 then
				local var_222_12 = (arg_219_1.time_ - var_222_10) / var_222_11

				if arg_219_1.var_.characterEffect1084ui_story then
					arg_219_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_10 + var_222_11 and arg_219_1.time_ < var_222_10 + var_222_11 + arg_222_0 and arg_219_1.var_.characterEffect1084ui_story then
				arg_219_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_222_13 = 0

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_222_15 = 0
			local var_222_16 = 0.1

			if var_222_15 < arg_219_1.time_ and arg_219_1.time_ <= var_222_15 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_17 = arg_219_1:FormatText(StoryNameCfg[6].name)

				arg_219_1.leftNameTxt_.text = var_222_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_18 = arg_219_1:GetWordFromCfg(319551055)
				local var_222_19 = arg_219_1:FormatText(var_222_18.content)

				arg_219_1.text_.text = var_222_19

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_20 = 4
				local var_222_21 = utf8.len(var_222_19)
				local var_222_22 = var_222_20 <= 0 and var_222_16 or var_222_16 * (var_222_21 / var_222_20)

				if var_222_22 > 0 and var_222_16 < var_222_22 then
					arg_219_1.talkMaxDuration = var_222_22

					if var_222_22 + var_222_15 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_22 + var_222_15
					end
				end

				arg_219_1.text_.text = var_222_19
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551055", "story_v_out_319551.awb") ~= 0 then
					local var_222_23 = manager.audio:GetVoiceLength("story_v_out_319551", "319551055", "story_v_out_319551.awb") / 1000

					if var_222_23 + var_222_15 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_23 + var_222_15
					end

					if var_222_18.prefab_name ~= "" and arg_219_1.actors_[var_222_18.prefab_name] ~= nil then
						local var_222_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_18.prefab_name].transform, "story_v_out_319551", "319551055", "story_v_out_319551.awb")

						arg_219_1:RecordAudio("319551055", var_222_24)
						arg_219_1:RecordAudio("319551055", var_222_24)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_319551", "319551055", "story_v_out_319551.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_319551", "319551055", "story_v_out_319551.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_25 = math.max(var_222_16, arg_219_1.talkMaxDuration)

			if var_222_15 <= arg_219_1.time_ and arg_219_1.time_ < var_222_15 + var_222_25 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_15) / var_222_25

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_15 + var_222_25 and arg_219_1.time_ < var_222_15 + var_222_25 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play319551056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 319551056
		arg_223_1.duration_ = 4.499333333332

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play319551057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = "STblack"

			if arg_223_1.bgs_[var_226_0] == nil then
				local var_226_1 = Object.Instantiate(arg_223_1.paintGo_)

				var_226_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_226_0)
				var_226_1.name = var_226_0
				var_226_1.transform.parent = arg_223_1.stage_.transform
				var_226_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_223_1.bgs_[var_226_0] = var_226_1
			end

			local var_226_2 = 4.44089209850063e-16

			if var_226_2 < arg_223_1.time_ and arg_223_1.time_ <= var_226_2 + arg_226_0 then
				local var_226_3 = manager.ui.mainCamera.transform.localPosition
				local var_226_4 = Vector3.New(0, 0, 10) + Vector3.New(var_226_3.x, var_226_3.y, 0)
				local var_226_5 = arg_223_1.bgs_.STblack

				var_226_5.transform.localPosition = var_226_4
				var_226_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_226_6 = var_226_5:GetComponent("SpriteRenderer")

				if var_226_6 and var_226_6.sprite then
					local var_226_7 = (var_226_5.transform.localPosition - var_226_3).z
					local var_226_8 = manager.ui.mainCameraCom_
					local var_226_9 = 2 * var_226_7 * Mathf.Tan(var_226_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_226_10 = var_226_9 * var_226_8.aspect
					local var_226_11 = var_226_6.sprite.bounds.size.x
					local var_226_12 = var_226_6.sprite.bounds.size.y
					local var_226_13 = var_226_10 / var_226_11
					local var_226_14 = var_226_9 / var_226_12
					local var_226_15 = var_226_14 < var_226_13 and var_226_13 or var_226_14

					var_226_5.transform.localScale = Vector3.New(var_226_15, var_226_15, 0)
				end

				for iter_226_0, iter_226_1 in pairs(arg_223_1.bgs_) do
					if iter_226_0 ~= "STblack" then
						iter_226_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_226_16 = 0

			if var_226_16 < arg_223_1.time_ and arg_223_1.time_ <= var_226_16 + arg_226_0 then
				local var_226_17 = arg_223_1.fswbg_.transform:Find("textbox/adapt/content") or arg_223_1.fswbg_.transform:Find("textbox/content")
				local var_226_18 = var_226_17:GetComponent("Text")
				local var_226_19 = var_226_17:GetComponent("RectTransform")

				var_226_18.alignment = UnityEngine.TextAnchor.LowerCenter
				var_226_19.offsetMin = Vector2.New(0, 0)
				var_226_19.offsetMax = Vector2.New(0, 0)
			end

			local var_226_20 = 0

			if var_226_20 < arg_223_1.time_ and arg_223_1.time_ <= var_226_20 + arg_226_0 then
				arg_223_1.fswbg_:SetActive(true)
				arg_223_1.dialog_:SetActive(false)

				arg_223_1.fswtw_.percent = 0

				local var_226_21 = arg_223_1:GetWordFromCfg(319551056)
				local var_226_22 = arg_223_1:FormatText(var_226_21.content)

				arg_223_1.fswt_.text = var_226_22

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.fswt_)

				arg_223_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_223_1.fswtw_:SetDirty()

				arg_223_1.typewritterCharCountI18N = 0

				SetActive(arg_223_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_223_1:ShowNextGo(false)
			end

			local var_226_23 = 0.433333333333334

			if var_226_23 < arg_223_1.time_ and arg_223_1.time_ <= var_226_23 + arg_226_0 then
				arg_223_1.var_.oldValueTypewriter = arg_223_1.fswtw_.percent

				arg_223_1:ShowNextGo(false)
			end

			local var_226_24 = 16
			local var_226_25 = 1.06666666666667
			local var_226_26 = arg_223_1:GetWordFromCfg(319551056)
			local var_226_27 = arg_223_1:FormatText(var_226_26.content)
			local var_226_28, var_226_29 = arg_223_1:GetPercentByPara(var_226_27, 1)

			if var_226_23 < arg_223_1.time_ and arg_223_1.time_ <= var_226_23 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0

				local var_226_30 = var_226_24 <= 0 and var_226_25 or var_226_25 * ((var_226_29 - arg_223_1.typewritterCharCountI18N) / var_226_24)

				if var_226_30 > 0 and var_226_25 < var_226_30 then
					arg_223_1.talkMaxDuration = var_226_30

					if var_226_30 + var_226_23 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_30 + var_226_23
					end
				end
			end

			local var_226_31 = 1.06666666666667
			local var_226_32 = math.max(var_226_31, arg_223_1.talkMaxDuration)

			if var_226_23 <= arg_223_1.time_ and arg_223_1.time_ < var_226_23 + var_226_32 then
				local var_226_33 = (arg_223_1.time_ - var_226_23) / var_226_32

				arg_223_1.fswtw_.percent = Mathf.Lerp(arg_223_1.var_.oldValueTypewriter, var_226_28, var_226_33)
				arg_223_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_223_1.fswtw_:SetDirty()
			end

			if arg_223_1.time_ >= var_226_23 + var_226_32 and arg_223_1.time_ < var_226_23 + var_226_32 + arg_226_0 then
				arg_223_1.fswtw_.percent = var_226_28

				arg_223_1.fswtw_:SetDirty()
				arg_223_1:ShowNextGo(true)

				arg_223_1.typewritterCharCountI18N = var_226_29
			end

			local var_226_34 = 4.44089209850063e-16

			if var_226_34 < arg_223_1.time_ and arg_223_1.time_ <= var_226_34 + arg_226_0 then
				arg_223_1.cswbg_:SetActive(true)

				local var_226_35 = arg_223_1.cswt_:GetComponent("RectTransform")

				arg_223_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_226_35.offsetMin = Vector2.New(410, 330)
				var_226_35.offsetMax = Vector2.New(-400, -175)

				local var_226_36 = arg_223_1:GetWordFromCfg(419029)
				local var_226_37 = arg_223_1:FormatText(var_226_36.content)

				arg_223_1.cswt_.text = var_226_37

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.cswt_)

				arg_223_1.cswt_.fontSize = 180
				arg_223_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_223_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_226_38 = arg_223_1.actors_["1084ui_story"].transform
			local var_226_39 = 0

			if var_226_39 < arg_223_1.time_ and arg_223_1.time_ <= var_226_39 + arg_226_0 then
				arg_223_1.var_.moveOldPos1084ui_story = var_226_38.localPosition
			end

			local var_226_40 = 0.001

			if var_226_39 <= arg_223_1.time_ and arg_223_1.time_ < var_226_39 + var_226_40 then
				local var_226_41 = (arg_223_1.time_ - var_226_39) / var_226_40
				local var_226_42 = Vector3.New(0, 100, 0)

				var_226_38.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1084ui_story, var_226_42, var_226_41)

				local var_226_43 = manager.ui.mainCamera.transform.position - var_226_38.position

				var_226_38.forward = Vector3.New(var_226_43.x, var_226_43.y, var_226_43.z)

				local var_226_44 = var_226_38.localEulerAngles

				var_226_44.z = 0
				var_226_44.x = 0
				var_226_38.localEulerAngles = var_226_44
			end

			if arg_223_1.time_ >= var_226_39 + var_226_40 and arg_223_1.time_ < var_226_39 + var_226_40 + arg_226_0 then
				var_226_38.localPosition = Vector3.New(0, 100, 0)

				local var_226_45 = manager.ui.mainCamera.transform.position - var_226_38.position

				var_226_38.forward = Vector3.New(var_226_45.x, var_226_45.y, var_226_45.z)

				local var_226_46 = var_226_38.localEulerAngles

				var_226_46.z = 0
				var_226_46.x = 0
				var_226_38.localEulerAngles = var_226_46
			end

			local var_226_47 = arg_223_1.actors_["10058ui_story"].transform
			local var_226_48 = 0

			if var_226_48 < arg_223_1.time_ and arg_223_1.time_ <= var_226_48 + arg_226_0 then
				arg_223_1.var_.moveOldPos10058ui_story = var_226_47.localPosition
			end

			local var_226_49 = 0.001

			if var_226_48 <= arg_223_1.time_ and arg_223_1.time_ < var_226_48 + var_226_49 then
				local var_226_50 = (arg_223_1.time_ - var_226_48) / var_226_49
				local var_226_51 = Vector3.New(0, 100, 0)

				var_226_47.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10058ui_story, var_226_51, var_226_50)

				local var_226_52 = manager.ui.mainCamera.transform.position - var_226_47.position

				var_226_47.forward = Vector3.New(var_226_52.x, var_226_52.y, var_226_52.z)

				local var_226_53 = var_226_47.localEulerAngles

				var_226_53.z = 0
				var_226_53.x = 0
				var_226_47.localEulerAngles = var_226_53
			end

			if arg_223_1.time_ >= var_226_48 + var_226_49 and arg_223_1.time_ < var_226_48 + var_226_49 + arg_226_0 then
				var_226_47.localPosition = Vector3.New(0, 100, 0)

				local var_226_54 = manager.ui.mainCamera.transform.position - var_226_47.position

				var_226_47.forward = Vector3.New(var_226_54.x, var_226_54.y, var_226_54.z)

				local var_226_55 = var_226_47.localEulerAngles

				var_226_55.z = 0
				var_226_55.x = 0
				var_226_47.localEulerAngles = var_226_55
			end

			local var_226_56 = 0.433333333333334
			local var_226_57 = 4.066
			local var_226_58 = manager.audio:GetVoiceLength("story_v_out_319551", "319551056", "story_v_out_319551.awb") / 1000

			if var_226_58 > 0 and var_226_57 < var_226_58 and var_226_58 + var_226_56 > arg_223_1.duration_ then
				local var_226_59 = var_226_58

				arg_223_1.duration_ = var_226_58 + var_226_56
			end

			if var_226_56 < arg_223_1.time_ and arg_223_1.time_ <= var_226_56 + arg_226_0 then
				local var_226_60 = "play"
				local var_226_61 = "voice"

				arg_223_1:AudioAction(var_226_60, var_226_61, "story_v_out_319551", "319551056", "story_v_out_319551.awb")
			end
		end
	end,
	Play319551057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 319551057
		arg_227_1.duration_ = 3.732666666666

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play319551058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.fswbg_:SetActive(true)
				arg_227_1.dialog_:SetActive(false)

				arg_227_1.fswtw_.percent = 0

				local var_230_1 = arg_227_1:GetWordFromCfg(319551057)
				local var_230_2 = arg_227_1:FormatText(var_230_1.content)

				arg_227_1.fswt_.text = var_230_2

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.fswt_)

				arg_227_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_227_1.fswtw_:SetDirty()

				arg_227_1.typewritterCharCountI18N = 0

				SetActive(arg_227_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_227_1:ShowNextGo(false)
			end

			local var_230_3 = 0.166666666666667

			if var_230_3 < arg_227_1.time_ and arg_227_1.time_ <= var_230_3 + arg_230_0 then
				arg_227_1.var_.oldValueTypewriter = arg_227_1.fswtw_.percent

				arg_227_1:ShowNextGo(false)
			end

			local var_230_4 = 15
			local var_230_5 = 1
			local var_230_6 = arg_227_1:GetWordFromCfg(319551057)
			local var_230_7 = arg_227_1:FormatText(var_230_6.content)
			local var_230_8, var_230_9 = arg_227_1:GetPercentByPara(var_230_7, 1)

			if var_230_3 < arg_227_1.time_ and arg_227_1.time_ <= var_230_3 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0

				local var_230_10 = var_230_4 <= 0 and var_230_5 or var_230_5 * ((var_230_9 - arg_227_1.typewritterCharCountI18N) / var_230_4)

				if var_230_10 > 0 and var_230_5 < var_230_10 then
					arg_227_1.talkMaxDuration = var_230_10

					if var_230_10 + var_230_3 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_10 + var_230_3
					end
				end
			end

			local var_230_11 = 1
			local var_230_12 = math.max(var_230_11, arg_227_1.talkMaxDuration)

			if var_230_3 <= arg_227_1.time_ and arg_227_1.time_ < var_230_3 + var_230_12 then
				local var_230_13 = (arg_227_1.time_ - var_230_3) / var_230_12

				arg_227_1.fswtw_.percent = Mathf.Lerp(arg_227_1.var_.oldValueTypewriter, var_230_8, var_230_13)
				arg_227_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_227_1.fswtw_:SetDirty()
			end

			if arg_227_1.time_ >= var_230_3 + var_230_12 and arg_227_1.time_ < var_230_3 + var_230_12 + arg_230_0 then
				arg_227_1.fswtw_.percent = var_230_8

				arg_227_1.fswtw_:SetDirty()
				arg_227_1:ShowNextGo(true)

				arg_227_1.typewritterCharCountI18N = var_230_9
			end

			local var_230_14 = 0.166666666666667
			local var_230_15 = 3.566
			local var_230_16 = manager.audio:GetVoiceLength("story_v_out_319551", "319551057", "story_v_out_319551.awb") / 1000

			if var_230_16 > 0 and var_230_15 < var_230_16 and var_230_16 + var_230_14 > arg_227_1.duration_ then
				local var_230_17 = var_230_16

				arg_227_1.duration_ = var_230_16 + var_230_14
			end

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 then
				local var_230_18 = "play"
				local var_230_19 = "voice"

				arg_227_1:AudioAction(var_230_18, var_230_19, "story_v_out_319551", "319551057", "story_v_out_319551.awb")
			end
		end
	end,
	Play319551058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 319551058
		arg_231_1.duration_ = 1.832666666666

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play319551059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.fswbg_:SetActive(true)
				arg_231_1.dialog_:SetActive(false)

				arg_231_1.fswtw_.percent = 0

				local var_234_1 = arg_231_1:GetWordFromCfg(319551058)
				local var_234_2 = arg_231_1:FormatText(var_234_1.content)

				arg_231_1.fswt_.text = var_234_2

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.fswt_)

				arg_231_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_231_1.fswtw_:SetDirty()

				arg_231_1.typewritterCharCountI18N = 0

				SetActive(arg_231_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_231_1:ShowNextGo(false)
			end

			local var_234_3 = 0.166666666666667

			if var_234_3 < arg_231_1.time_ and arg_231_1.time_ <= var_234_3 + arg_234_0 then
				arg_231_1.var_.oldValueTypewriter = arg_231_1.fswtw_.percent

				arg_231_1:ShowNextGo(false)
			end

			local var_234_4 = 6
			local var_234_5 = 0.4
			local var_234_6 = arg_231_1:GetWordFromCfg(319551058)
			local var_234_7 = arg_231_1:FormatText(var_234_6.content)
			local var_234_8, var_234_9 = arg_231_1:GetPercentByPara(var_234_7, 1)

			if var_234_3 < arg_231_1.time_ and arg_231_1.time_ <= var_234_3 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0

				local var_234_10 = var_234_4 <= 0 and var_234_5 or var_234_5 * ((var_234_9 - arg_231_1.typewritterCharCountI18N) / var_234_4)

				if var_234_10 > 0 and var_234_5 < var_234_10 then
					arg_231_1.talkMaxDuration = var_234_10

					if var_234_10 + var_234_3 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_10 + var_234_3
					end
				end
			end

			local var_234_11 = 0.4
			local var_234_12 = math.max(var_234_11, arg_231_1.talkMaxDuration)

			if var_234_3 <= arg_231_1.time_ and arg_231_1.time_ < var_234_3 + var_234_12 then
				local var_234_13 = (arg_231_1.time_ - var_234_3) / var_234_12

				arg_231_1.fswtw_.percent = Mathf.Lerp(arg_231_1.var_.oldValueTypewriter, var_234_8, var_234_13)
				arg_231_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_231_1.fswtw_:SetDirty()
			end

			if arg_231_1.time_ >= var_234_3 + var_234_12 and arg_231_1.time_ < var_234_3 + var_234_12 + arg_234_0 then
				arg_231_1.fswtw_.percent = var_234_8

				arg_231_1.fswtw_:SetDirty()
				arg_231_1:ShowNextGo(true)

				arg_231_1.typewritterCharCountI18N = var_234_9
			end

			local var_234_14 = 0.166666666666667
			local var_234_15 = 1.666
			local var_234_16 = manager.audio:GetVoiceLength("story_v_out_319551", "319551058", "story_v_out_319551.awb") / 1000

			if var_234_16 > 0 and var_234_15 < var_234_16 and var_234_16 + var_234_14 > arg_231_1.duration_ then
				local var_234_17 = var_234_16

				arg_231_1.duration_ = var_234_16 + var_234_14
			end

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 then
				local var_234_18 = "play"
				local var_234_19 = "voice"

				arg_231_1:AudioAction(var_234_18, var_234_19, "story_v_out_319551", "319551058", "story_v_out_319551.awb")
			end
		end
	end,
	Play319551059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 319551059
		arg_235_1.duration_ = 1.732666666666

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play319551060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.fswbg_:SetActive(true)
				arg_235_1.dialog_:SetActive(false)

				arg_235_1.fswtw_.percent = 0

				local var_238_1 = arg_235_1:GetWordFromCfg(319551059)
				local var_238_2 = arg_235_1:FormatText(var_238_1.content)

				arg_235_1.fswt_.text = var_238_2

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.fswt_)

				arg_235_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_235_1.fswtw_:SetDirty()

				arg_235_1.typewritterCharCountI18N = 0

				SetActive(arg_235_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_235_1:ShowNextGo(false)
			end

			local var_238_3 = 0.166666666666667

			if var_238_3 < arg_235_1.time_ and arg_235_1.time_ <= var_238_3 + arg_238_0 then
				arg_235_1.var_.oldValueTypewriter = arg_235_1.fswtw_.percent

				arg_235_1:ShowNextGo(false)
			end

			local var_238_4 = 8
			local var_238_5 = 0.533333333333333
			local var_238_6 = arg_235_1:GetWordFromCfg(319551059)
			local var_238_7 = arg_235_1:FormatText(var_238_6.content)
			local var_238_8, var_238_9 = arg_235_1:GetPercentByPara(var_238_7, 1)

			if var_238_3 < arg_235_1.time_ and arg_235_1.time_ <= var_238_3 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0

				local var_238_10 = var_238_4 <= 0 and var_238_5 or var_238_5 * ((var_238_9 - arg_235_1.typewritterCharCountI18N) / var_238_4)

				if var_238_10 > 0 and var_238_5 < var_238_10 then
					arg_235_1.talkMaxDuration = var_238_10

					if var_238_10 + var_238_3 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_10 + var_238_3
					end
				end
			end

			local var_238_11 = 0.533333333333333
			local var_238_12 = math.max(var_238_11, arg_235_1.talkMaxDuration)

			if var_238_3 <= arg_235_1.time_ and arg_235_1.time_ < var_238_3 + var_238_12 then
				local var_238_13 = (arg_235_1.time_ - var_238_3) / var_238_12

				arg_235_1.fswtw_.percent = Mathf.Lerp(arg_235_1.var_.oldValueTypewriter, var_238_8, var_238_13)
				arg_235_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_235_1.fswtw_:SetDirty()
			end

			if arg_235_1.time_ >= var_238_3 + var_238_12 and arg_235_1.time_ < var_238_3 + var_238_12 + arg_238_0 then
				arg_235_1.fswtw_.percent = var_238_8

				arg_235_1.fswtw_:SetDirty()
				arg_235_1:ShowNextGo(true)

				arg_235_1.typewritterCharCountI18N = var_238_9
			end

			local var_238_14 = 0.166666666666667
			local var_238_15 = 1.566
			local var_238_16 = manager.audio:GetVoiceLength("story_v_out_319551", "319551059", "story_v_out_319551.awb") / 1000

			if var_238_16 > 0 and var_238_15 < var_238_16 and var_238_16 + var_238_14 > arg_235_1.duration_ then
				local var_238_17 = var_238_16

				arg_235_1.duration_ = var_238_16 + var_238_14
			end

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				local var_238_18 = "play"
				local var_238_19 = "voice"

				arg_235_1:AudioAction(var_238_18, var_238_19, "story_v_out_319551", "319551059", "story_v_out_319551.awb")
			end
		end
	end,
	Play319551060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 319551060
		arg_239_1.duration_ = 5.73333333333333

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play319551061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				local var_242_1 = manager.ui.mainCamera.transform.localPosition
				local var_242_2 = Vector3.New(0, 0, 10) + Vector3.New(var_242_1.x, var_242_1.y, 0)
				local var_242_3 = arg_239_1.bgs_.ST74

				var_242_3.transform.localPosition = var_242_2
				var_242_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_242_4 = var_242_3:GetComponent("SpriteRenderer")

				if var_242_4 and var_242_4.sprite then
					local var_242_5 = (var_242_3.transform.localPosition - var_242_1).z
					local var_242_6 = manager.ui.mainCameraCom_
					local var_242_7 = 2 * var_242_5 * Mathf.Tan(var_242_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_242_8 = var_242_7 * var_242_6.aspect
					local var_242_9 = var_242_4.sprite.bounds.size.x
					local var_242_10 = var_242_4.sprite.bounds.size.y
					local var_242_11 = var_242_8 / var_242_9
					local var_242_12 = var_242_7 / var_242_10
					local var_242_13 = var_242_12 < var_242_11 and var_242_11 or var_242_12

					var_242_3.transform.localScale = Vector3.New(var_242_13, var_242_13, 0)
				end

				for iter_242_0, iter_242_1 in pairs(arg_239_1.bgs_) do
					if iter_242_0 ~= "ST74" then
						iter_242_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				arg_239_1.fswbg_:SetActive(false)
				arg_239_1.dialog_:SetActive(false)
				arg_239_1:ShowNextGo(false)
			end

			local var_242_15 = 0

			if var_242_15 < arg_239_1.time_ and arg_239_1.time_ <= var_242_15 + arg_242_0 then
				arg_239_1.cswbg_:SetActive(false)
			end

			if arg_239_1.frameCnt_ <= 1 then
				arg_239_1.dialog_:SetActive(false)
			end

			local var_242_16 = 0.733333333333333
			local var_242_17 = 1.175

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0

				arg_239_1.dialog_:SetActive(true)

				local var_242_18 = LeanTween.value(arg_239_1.dialog_, 0, 1, 0.3)

				var_242_18:setOnUpdate(LuaHelper.FloatAction(function(arg_243_0)
					arg_239_1.dialogCg_.alpha = arg_243_0
				end))
				var_242_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_239_1.dialog_)
					var_242_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_239_1.duration_ = arg_239_1.duration_ + 0.3

				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_19 = arg_239_1:GetWordFromCfg(319551060)
				local var_242_20 = arg_239_1:FormatText(var_242_19.content)

				arg_239_1.text_.text = var_242_20

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_21 = 47
				local var_242_22 = utf8.len(var_242_20)
				local var_242_23 = var_242_21 <= 0 and var_242_17 or var_242_17 * (var_242_22 / var_242_21)

				if var_242_23 > 0 and var_242_17 < var_242_23 then
					arg_239_1.talkMaxDuration = var_242_23
					var_242_16 = var_242_16 + 0.3

					if var_242_23 + var_242_16 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_23 + var_242_16
					end
				end

				arg_239_1.text_.text = var_242_20
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_24 = var_242_16 + 0.3
			local var_242_25 = math.max(var_242_17, arg_239_1.talkMaxDuration)

			if var_242_24 <= arg_239_1.time_ and arg_239_1.time_ < var_242_24 + var_242_25 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_24) / var_242_25

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_24 + var_242_25 and arg_239_1.time_ < var_242_24 + var_242_25 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play319551061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 319551061
		arg_245_1.duration_ = 11.3

		local var_245_0 = {
			zh = 7.2,
			ja = 11.3
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
				arg_245_0:Play319551062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10058ui_story"].transform
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos10058ui_story = var_248_0.localPosition
			end

			local var_248_2 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2
				local var_248_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos10058ui_story, var_248_4, var_248_3)

				local var_248_5 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_5.x, var_248_5.y, var_248_5.z)

				local var_248_6 = var_248_0.localEulerAngles

				var_248_6.z = 0
				var_248_6.x = 0
				var_248_0.localEulerAngles = var_248_6
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_248_7 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_7.x, var_248_7.y, var_248_7.z)

				local var_248_8 = var_248_0.localEulerAngles

				var_248_8.z = 0
				var_248_8.x = 0
				var_248_0.localEulerAngles = var_248_8
			end

			local var_248_9 = arg_245_1.actors_["10058ui_story"]
			local var_248_10 = 0

			if var_248_10 < arg_245_1.time_ and arg_245_1.time_ <= var_248_10 + arg_248_0 and arg_245_1.var_.characterEffect10058ui_story == nil then
				arg_245_1.var_.characterEffect10058ui_story = var_248_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_11 = 0.200000002980232

			if var_248_10 <= arg_245_1.time_ and arg_245_1.time_ < var_248_10 + var_248_11 then
				local var_248_12 = (arg_245_1.time_ - var_248_10) / var_248_11

				if arg_245_1.var_.characterEffect10058ui_story then
					arg_245_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_10 + var_248_11 and arg_245_1.time_ < var_248_10 + var_248_11 + arg_248_0 and arg_245_1.var_.characterEffect10058ui_story then
				arg_245_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_248_13 = 0

			if var_248_13 < arg_245_1.time_ and arg_245_1.time_ <= var_248_13 + arg_248_0 then
				arg_245_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 then
				arg_245_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_248_15 = 0
			local var_248_16 = 0.75

			if var_248_15 < arg_245_1.time_ and arg_245_1.time_ <= var_248_15 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_17 = arg_245_1:FormatText(StoryNameCfg[471].name)

				arg_245_1.leftNameTxt_.text = var_248_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_18 = arg_245_1:GetWordFromCfg(319551061)
				local var_248_19 = arg_245_1:FormatText(var_248_18.content)

				arg_245_1.text_.text = var_248_19

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_20 = 30
				local var_248_21 = utf8.len(var_248_19)
				local var_248_22 = var_248_20 <= 0 and var_248_16 or var_248_16 * (var_248_21 / var_248_20)

				if var_248_22 > 0 and var_248_16 < var_248_22 then
					arg_245_1.talkMaxDuration = var_248_22

					if var_248_22 + var_248_15 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_22 + var_248_15
					end
				end

				arg_245_1.text_.text = var_248_19
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551061", "story_v_out_319551.awb") ~= 0 then
					local var_248_23 = manager.audio:GetVoiceLength("story_v_out_319551", "319551061", "story_v_out_319551.awb") / 1000

					if var_248_23 + var_248_15 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_23 + var_248_15
					end

					if var_248_18.prefab_name ~= "" and arg_245_1.actors_[var_248_18.prefab_name] ~= nil then
						local var_248_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_18.prefab_name].transform, "story_v_out_319551", "319551061", "story_v_out_319551.awb")

						arg_245_1:RecordAudio("319551061", var_248_24)
						arg_245_1:RecordAudio("319551061", var_248_24)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_319551", "319551061", "story_v_out_319551.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_319551", "319551061", "story_v_out_319551.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_25 = math.max(var_248_16, arg_245_1.talkMaxDuration)

			if var_248_15 <= arg_245_1.time_ and arg_245_1.time_ < var_248_15 + var_248_25 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_15) / var_248_25

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_15 + var_248_25 and arg_245_1.time_ < var_248_15 + var_248_25 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play319551062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 319551062
		arg_249_1.duration_ = 6.5

		local var_249_0 = {
			zh = 2.3,
			ja = 6.5
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
				arg_249_0:Play319551063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1084ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1084ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0.7, -0.97, -6)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1084ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = arg_249_1.actors_["1084ui_story"]
			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 and arg_249_1.var_.characterEffect1084ui_story == nil then
				arg_249_1.var_.characterEffect1084ui_story = var_252_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_11 = 0.200000002980232

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_11 then
				local var_252_12 = (arg_249_1.time_ - var_252_10) / var_252_11

				if arg_249_1.var_.characterEffect1084ui_story then
					arg_249_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_10 + var_252_11 and arg_249_1.time_ < var_252_10 + var_252_11 + arg_252_0 and arg_249_1.var_.characterEffect1084ui_story then
				arg_249_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_252_13 = 0

			if var_252_13 < arg_249_1.time_ and arg_249_1.time_ <= var_252_13 + arg_252_0 then
				arg_249_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 then
				arg_249_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_252_15 = arg_249_1.actors_["10058ui_story"]
			local var_252_16 = 0

			if var_252_16 < arg_249_1.time_ and arg_249_1.time_ <= var_252_16 + arg_252_0 and arg_249_1.var_.characterEffect10058ui_story == nil then
				arg_249_1.var_.characterEffect10058ui_story = var_252_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_17 = 0.200000002980232

			if var_252_16 <= arg_249_1.time_ and arg_249_1.time_ < var_252_16 + var_252_17 then
				local var_252_18 = (arg_249_1.time_ - var_252_16) / var_252_17

				if arg_249_1.var_.characterEffect10058ui_story then
					local var_252_19 = Mathf.Lerp(0, 0.5, var_252_18)

					arg_249_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_249_1.var_.characterEffect10058ui_story.fillRatio = var_252_19
				end
			end

			if arg_249_1.time_ >= var_252_16 + var_252_17 and arg_249_1.time_ < var_252_16 + var_252_17 + arg_252_0 and arg_249_1.var_.characterEffect10058ui_story then
				local var_252_20 = 0.5

				arg_249_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_249_1.var_.characterEffect10058ui_story.fillRatio = var_252_20
			end

			local var_252_21 = 0
			local var_252_22 = 0.275

			if var_252_21 < arg_249_1.time_ and arg_249_1.time_ <= var_252_21 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_23 = arg_249_1:FormatText(StoryNameCfg[6].name)

				arg_249_1.leftNameTxt_.text = var_252_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_24 = arg_249_1:GetWordFromCfg(319551062)
				local var_252_25 = arg_249_1:FormatText(var_252_24.content)

				arg_249_1.text_.text = var_252_25

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_26 = 11
				local var_252_27 = utf8.len(var_252_25)
				local var_252_28 = var_252_26 <= 0 and var_252_22 or var_252_22 * (var_252_27 / var_252_26)

				if var_252_28 > 0 and var_252_22 < var_252_28 then
					arg_249_1.talkMaxDuration = var_252_28

					if var_252_28 + var_252_21 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_28 + var_252_21
					end
				end

				arg_249_1.text_.text = var_252_25
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551062", "story_v_out_319551.awb") ~= 0 then
					local var_252_29 = manager.audio:GetVoiceLength("story_v_out_319551", "319551062", "story_v_out_319551.awb") / 1000

					if var_252_29 + var_252_21 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_29 + var_252_21
					end

					if var_252_24.prefab_name ~= "" and arg_249_1.actors_[var_252_24.prefab_name] ~= nil then
						local var_252_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_24.prefab_name].transform, "story_v_out_319551", "319551062", "story_v_out_319551.awb")

						arg_249_1:RecordAudio("319551062", var_252_30)
						arg_249_1:RecordAudio("319551062", var_252_30)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_319551", "319551062", "story_v_out_319551.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_319551", "319551062", "story_v_out_319551.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_31 = math.max(var_252_22, arg_249_1.talkMaxDuration)

			if var_252_21 <= arg_249_1.time_ and arg_249_1.time_ < var_252_21 + var_252_31 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_21) / var_252_31

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_21 + var_252_31 and arg_249_1.time_ < var_252_21 + var_252_31 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play319551063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 319551063
		arg_253_1.duration_ = 5.7

		local var_253_0 = {
			zh = 2,
			ja = 5.7
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
				arg_253_0:Play319551064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1084ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1084ui_story == nil then
				arg_253_1.var_.characterEffect1084ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.200000002980232

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1084ui_story then
					local var_256_4 = Mathf.Lerp(0, 0.5, var_256_3)

					arg_253_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1084ui_story.fillRatio = var_256_4
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1084ui_story then
				local var_256_5 = 0.5

				arg_253_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1084ui_story.fillRatio = var_256_5
			end

			local var_256_6 = arg_253_1.actors_["10058ui_story"]
			local var_256_7 = 0

			if var_256_7 < arg_253_1.time_ and arg_253_1.time_ <= var_256_7 + arg_256_0 and arg_253_1.var_.characterEffect10058ui_story == nil then
				arg_253_1.var_.characterEffect10058ui_story = var_256_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_8 = 0.200000002980232

			if var_256_7 <= arg_253_1.time_ and arg_253_1.time_ < var_256_7 + var_256_8 then
				local var_256_9 = (arg_253_1.time_ - var_256_7) / var_256_8

				if arg_253_1.var_.characterEffect10058ui_story then
					arg_253_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_7 + var_256_8 and arg_253_1.time_ < var_256_7 + var_256_8 + arg_256_0 and arg_253_1.var_.characterEffect10058ui_story then
				arg_253_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 then
				arg_253_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_1")
			end

			local var_256_11 = 0

			if var_256_11 < arg_253_1.time_ and arg_253_1.time_ <= var_256_11 + arg_256_0 then
				arg_253_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_256_12 = 0
			local var_256_13 = 0.275

			if var_256_12 < arg_253_1.time_ and arg_253_1.time_ <= var_256_12 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_14 = arg_253_1:FormatText(StoryNameCfg[471].name)

				arg_253_1.leftNameTxt_.text = var_256_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_15 = arg_253_1:GetWordFromCfg(319551063)
				local var_256_16 = arg_253_1:FormatText(var_256_15.content)

				arg_253_1.text_.text = var_256_16

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_17 = 11
				local var_256_18 = utf8.len(var_256_16)
				local var_256_19 = var_256_17 <= 0 and var_256_13 or var_256_13 * (var_256_18 / var_256_17)

				if var_256_19 > 0 and var_256_13 < var_256_19 then
					arg_253_1.talkMaxDuration = var_256_19

					if var_256_19 + var_256_12 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_19 + var_256_12
					end
				end

				arg_253_1.text_.text = var_256_16
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551063", "story_v_out_319551.awb") ~= 0 then
					local var_256_20 = manager.audio:GetVoiceLength("story_v_out_319551", "319551063", "story_v_out_319551.awb") / 1000

					if var_256_20 + var_256_12 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_20 + var_256_12
					end

					if var_256_15.prefab_name ~= "" and arg_253_1.actors_[var_256_15.prefab_name] ~= nil then
						local var_256_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_15.prefab_name].transform, "story_v_out_319551", "319551063", "story_v_out_319551.awb")

						arg_253_1:RecordAudio("319551063", var_256_21)
						arg_253_1:RecordAudio("319551063", var_256_21)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_319551", "319551063", "story_v_out_319551.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_319551", "319551063", "story_v_out_319551.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_22 = math.max(var_256_13, arg_253_1.talkMaxDuration)

			if var_256_12 <= arg_253_1.time_ and arg_253_1.time_ < var_256_12 + var_256_22 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_12) / var_256_22

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_12 + var_256_22 and arg_253_1.time_ < var_256_12 + var_256_22 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play319551064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 319551064
		arg_257_1.duration_ = 10.066

		local var_257_0 = {
			zh = 3.433,
			ja = 10.066
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
			arg_257_1.auto_ = false
		end

		function arg_257_1.playNext_(arg_259_0)
			arg_257_1.onStoryFinished_()
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_2")
			end

			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 then
				arg_257_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_260_2 = 0
			local var_260_3 = 0.425

			if var_260_2 < arg_257_1.time_ and arg_257_1.time_ <= var_260_2 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_4 = arg_257_1:FormatText(StoryNameCfg[471].name)

				arg_257_1.leftNameTxt_.text = var_260_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_5 = arg_257_1:GetWordFromCfg(319551064)
				local var_260_6 = arg_257_1:FormatText(var_260_5.content)

				arg_257_1.text_.text = var_260_6

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_7 = 17
				local var_260_8 = utf8.len(var_260_6)
				local var_260_9 = var_260_7 <= 0 and var_260_3 or var_260_3 * (var_260_8 / var_260_7)

				if var_260_9 > 0 and var_260_3 < var_260_9 then
					arg_257_1.talkMaxDuration = var_260_9

					if var_260_9 + var_260_2 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_9 + var_260_2
					end
				end

				arg_257_1.text_.text = var_260_6
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319551", "319551064", "story_v_out_319551.awb") ~= 0 then
					local var_260_10 = manager.audio:GetVoiceLength("story_v_out_319551", "319551064", "story_v_out_319551.awb") / 1000

					if var_260_10 + var_260_2 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_10 + var_260_2
					end

					if var_260_5.prefab_name ~= "" and arg_257_1.actors_[var_260_5.prefab_name] ~= nil then
						local var_260_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_5.prefab_name].transform, "story_v_out_319551", "319551064", "story_v_out_319551.awb")

						arg_257_1:RecordAudio("319551064", var_260_11)
						arg_257_1:RecordAudio("319551064", var_260_11)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_319551", "319551064", "story_v_out_319551.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_319551", "319551064", "story_v_out_319551.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_12 = math.max(var_260_3, arg_257_1.talkMaxDuration)

			if var_260_2 <= arg_257_1.time_ and arg_257_1.time_ < var_260_2 + var_260_12 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_2) / var_260_12

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_2 + var_260_12 and arg_257_1.time_ < var_260_2 + var_260_12 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_319551.awb"
	}
}
