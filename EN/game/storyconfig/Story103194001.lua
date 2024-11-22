return {
	Play319401001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319401001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319401002(arg_1_1)
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

			local var_4_22 = 0.1
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon.awb")
			end

			local var_4_26 = 0
			local var_4_27 = 0.0666666666666667

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.675

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

				local var_4_33 = arg_1_1:GetWordFromCfg(319401001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 27
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
	Play319401002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319401002
		arg_7_1.duration_ = 4.033

		local var_7_0 = {
			zh = 2.233,
			ja = 4.033
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
				arg_7_0:Play319401003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1084ui_story"

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

			local var_10_4 = arg_7_1.actors_["1084ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1084ui_story = var_10_4.localPosition

				local var_10_6 = "1084ui_story"

				arg_7_1:ShowWeapon(arg_7_1.var_[var_10_6 .. "Animator"].transform, false)
			end

			local var_10_7 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_7 then
				local var_10_8 = (arg_7_1.time_ - var_10_5) / var_10_7
				local var_10_9 = Vector3.New(0, -0.97, -6)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1084ui_story, var_10_9, var_10_8)

				local var_10_10 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_10.x, var_10_10.y, var_10_10.z)

				local var_10_11 = var_10_4.localEulerAngles

				var_10_11.z = 0
				var_10_11.x = 0
				var_10_4.localEulerAngles = var_10_11
			end

			if arg_7_1.time_ >= var_10_5 + var_10_7 and arg_7_1.time_ < var_10_5 + var_10_7 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_10_12 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_12.x, var_10_12.y, var_10_12.z)

				local var_10_13 = var_10_4.localEulerAngles

				var_10_13.z = 0
				var_10_13.x = 0
				var_10_4.localEulerAngles = var_10_13
			end

			local var_10_14 = arg_7_1.actors_["1084ui_story"]
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_16 = 0.200000002980232

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16

				if arg_7_1.var_.characterEffect1084ui_story then
					arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_20 = 0
			local var_10_21 = 0.2

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_22 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_23 = arg_7_1:GetWordFromCfg(319401002)
				local var_10_24 = arg_7_1:FormatText(var_10_23.content)

				arg_7_1.text_.text = var_10_24

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_25 = 8
				local var_10_26 = utf8.len(var_10_24)
				local var_10_27 = var_10_25 <= 0 and var_10_21 or var_10_21 * (var_10_26 / var_10_25)

				if var_10_27 > 0 and var_10_21 < var_10_27 then
					arg_7_1.talkMaxDuration = var_10_27

					if var_10_27 + var_10_20 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_20
					end
				end

				arg_7_1.text_.text = var_10_24
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319401", "319401002", "story_v_out_319401.awb") ~= 0 then
					local var_10_28 = manager.audio:GetVoiceLength("story_v_out_319401", "319401002", "story_v_out_319401.awb") / 1000

					if var_10_28 + var_10_20 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_28 + var_10_20
					end

					if var_10_23.prefab_name ~= "" and arg_7_1.actors_[var_10_23.prefab_name] ~= nil then
						local var_10_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_23.prefab_name].transform, "story_v_out_319401", "319401002", "story_v_out_319401.awb")

						arg_7_1:RecordAudio("319401002", var_10_29)
						arg_7_1:RecordAudio("319401002", var_10_29)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319401", "319401002", "story_v_out_319401.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319401", "319401002", "story_v_out_319401.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_30 = math.max(var_10_21, arg_7_1.talkMaxDuration)

			if var_10_20 <= arg_7_1.time_ and arg_7_1.time_ < var_10_20 + var_10_30 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_20) / var_10_30

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_20 + var_10_30 and arg_7_1.time_ < var_10_20 + var_10_30 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319401003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319401003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play319401004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1084ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1084ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.875

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

				local var_14_8 = arg_11_1:GetWordFromCfg(319401003)
				local var_14_9 = arg_11_1:FormatText(var_14_8.content)

				arg_11_1.text_.text = var_14_9

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_10 = 35
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
	Play319401004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319401004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play319401005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.45

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_2 = arg_15_1:GetWordFromCfg(319401004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 58
				local var_18_5 = utf8.len(var_18_3)
				local var_18_6 = var_18_4 <= 0 and var_18_1 or var_18_1 * (var_18_5 / var_18_4)

				if var_18_6 > 0 and var_18_1 < var_18_6 then
					arg_15_1.talkMaxDuration = var_18_6

					if var_18_6 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_6 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_3
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_7 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_7 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_7

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_7 and arg_15_1.time_ < var_18_0 + var_18_7 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319401005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319401005
		arg_19_1.duration_ = 5.033

		local var_19_0 = {
			zh = 4.633,
			ja = 5.033
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
				arg_19_0:Play319401006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1084ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1084ui_story then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_4 = 0

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_6 = 0
			local var_22_7 = 0.625

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(319401005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_319401", "319401005", "story_v_out_319401.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_319401", "319401005", "story_v_out_319401.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_319401", "319401005", "story_v_out_319401.awb")

						arg_19_1:RecordAudio("319401005", var_22_15)
						arg_19_1:RecordAudio("319401005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319401", "319401005", "story_v_out_319401.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319401", "319401005", "story_v_out_319401.awb")
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
	Play319401006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319401006
		arg_23_1.duration_ = 4.133

		local var_23_0 = {
			zh = 3.8,
			ja = 4.133
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
				arg_23_0:Play319401007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.325

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[6].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(319401006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_319401", "319401006", "story_v_out_319401.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_319401", "319401006", "story_v_out_319401.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_319401", "319401006", "story_v_out_319401.awb")

						arg_23_1:RecordAudio("319401006", var_26_9)
						arg_23_1:RecordAudio("319401006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319401", "319401006", "story_v_out_319401.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319401", "319401006", "story_v_out_319401.awb")
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
	Play319401007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319401007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play319401008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1084ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story == nil then
				arg_27_1.var_.characterEffect1084ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1084ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1084ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1084ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 1.225

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

				local var_30_8 = arg_27_1:GetWordFromCfg(319401007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 49
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
	Play319401008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319401008
		arg_31_1.duration_ = 8.933

		local var_31_0 = {
			zh = 8.933,
			ja = 4.266
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
				arg_31_0:Play319401009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1084ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1084ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, -0.97, -6)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1084ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1084ui_story"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story == nil then
				arg_31_1.var_.characterEffect1084ui_story = var_34_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_11 = 0.200000002980232

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.characterEffect1084ui_story then
					arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story then
				arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_15 = 0
			local var_34_16 = 0.875

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_17 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_18 = arg_31_1:GetWordFromCfg(319401008)
				local var_34_19 = arg_31_1:FormatText(var_34_18.content)

				arg_31_1.text_.text = var_34_19

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_20 = 35
				local var_34_21 = utf8.len(var_34_19)
				local var_34_22 = var_34_20 <= 0 and var_34_16 or var_34_16 * (var_34_21 / var_34_20)

				if var_34_22 > 0 and var_34_16 < var_34_22 then
					arg_31_1.talkMaxDuration = var_34_22

					if var_34_22 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_22 + var_34_15
					end
				end

				arg_31_1.text_.text = var_34_19
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319401", "319401008", "story_v_out_319401.awb") ~= 0 then
					local var_34_23 = manager.audio:GetVoiceLength("story_v_out_319401", "319401008", "story_v_out_319401.awb") / 1000

					if var_34_23 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_23 + var_34_15
					end

					if var_34_18.prefab_name ~= "" and arg_31_1.actors_[var_34_18.prefab_name] ~= nil then
						local var_34_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_18.prefab_name].transform, "story_v_out_319401", "319401008", "story_v_out_319401.awb")

						arg_31_1:RecordAudio("319401008", var_34_24)
						arg_31_1:RecordAudio("319401008", var_34_24)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319401", "319401008", "story_v_out_319401.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319401", "319401008", "story_v_out_319401.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_25 = math.max(var_34_16, arg_31_1.talkMaxDuration)

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_25 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_15) / var_34_25

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_15 + var_34_25 and arg_31_1.time_ < var_34_15 + var_34_25 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319401009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319401009
		arg_35_1.duration_ = 4.7

		local var_35_0 = {
			zh = 2.133,
			ja = 4.7
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
				arg_35_0:Play319401010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1084ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story == nil then
				arg_35_1.var_.characterEffect1084ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1084ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1084ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1084ui_story.fillRatio = var_38_5
			end

			local var_38_6 = 0
			local var_38_7 = 0.1

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[36].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(319401009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 4
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_7 or var_38_7 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_7 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319401", "319401009", "story_v_out_319401.awb") ~= 0 then
					local var_38_14 = manager.audio:GetVoiceLength("story_v_out_319401", "319401009", "story_v_out_319401.awb") / 1000

					if var_38_14 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_14 + var_38_6
					end

					if var_38_9.prefab_name ~= "" and arg_35_1.actors_[var_38_9.prefab_name] ~= nil then
						local var_38_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_9.prefab_name].transform, "story_v_out_319401", "319401009", "story_v_out_319401.awb")

						arg_35_1:RecordAudio("319401009", var_38_15)
						arg_35_1:RecordAudio("319401009", var_38_15)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319401", "319401009", "story_v_out_319401.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319401", "319401009", "story_v_out_319401.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_16 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_16 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_16

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_16 and arg_35_1.time_ < var_38_6 + var_38_16 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319401010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319401010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play319401011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_42_1 = 0
			local var_42_2 = 1.075

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(319401010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 43
				local var_42_6 = utf8.len(var_42_4)
				local var_42_7 = var_42_5 <= 0 and var_42_2 or var_42_2 * (var_42_6 / var_42_5)

				if var_42_7 > 0 and var_42_2 < var_42_7 then
					arg_39_1.talkMaxDuration = var_42_7

					if var_42_7 + var_42_1 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_7 + var_42_1
					end
				end

				arg_39_1.text_.text = var_42_4
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_8 = math.max(var_42_2, arg_39_1.talkMaxDuration)

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_8 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_1) / var_42_8

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_1 + var_42_8 and arg_39_1.time_ < var_42_1 + var_42_8 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319401011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319401011
		arg_43_1.duration_ = 6.9

		local var_43_0 = {
			zh = 1.999999999999,
			ja = 6.9
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
				arg_43_0:Play319401012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1084ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1084ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, -0.97, -6)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1084ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1084ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1084ui_story then
					arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_46_14 = 0
			local var_46_15 = 0.2

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_16 = arg_43_1:FormatText(StoryNameCfg[6].name)

				arg_43_1.leftNameTxt_.text = var_46_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_17 = arg_43_1:GetWordFromCfg(319401011)
				local var_46_18 = arg_43_1:FormatText(var_46_17.content)

				arg_43_1.text_.text = var_46_18

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_19 = 8
				local var_46_20 = utf8.len(var_46_18)
				local var_46_21 = var_46_19 <= 0 and var_46_15 or var_46_15 * (var_46_20 / var_46_19)

				if var_46_21 > 0 and var_46_15 < var_46_21 then
					arg_43_1.talkMaxDuration = var_46_21

					if var_46_21 + var_46_14 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_21 + var_46_14
					end
				end

				arg_43_1.text_.text = var_46_18
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319401", "319401011", "story_v_out_319401.awb") ~= 0 then
					local var_46_22 = manager.audio:GetVoiceLength("story_v_out_319401", "319401011", "story_v_out_319401.awb") / 1000

					if var_46_22 + var_46_14 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_22 + var_46_14
					end

					if var_46_17.prefab_name ~= "" and arg_43_1.actors_[var_46_17.prefab_name] ~= nil then
						local var_46_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_17.prefab_name].transform, "story_v_out_319401", "319401011", "story_v_out_319401.awb")

						arg_43_1:RecordAudio("319401011", var_46_23)
						arg_43_1:RecordAudio("319401011", var_46_23)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319401", "319401011", "story_v_out_319401.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319401", "319401011", "story_v_out_319401.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_24 = math.max(var_46_15, arg_43_1.talkMaxDuration)

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_24 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_14) / var_46_24

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_14 + var_46_24 and arg_43_1.time_ < var_46_14 + var_46_24 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319401012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319401012
		arg_47_1.duration_ = 10.333

		local var_47_0 = {
			zh = 8.3,
			ja = 10.333
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
				arg_47_0:Play319401013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "10066ui_story"

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

			local var_50_4 = arg_47_1.actors_["10066ui_story"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos10066ui_story = var_50_4.localPosition
			end

			local var_50_6 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6
				local var_50_8 = Vector3.New(0.7, -0.99, -5.83)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10066ui_story, var_50_8, var_50_7)

				local var_50_9 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_9.x, var_50_9.y, var_50_9.z)

				local var_50_10 = var_50_4.localEulerAngles

				var_50_10.z = 0
				var_50_10.x = 0
				var_50_4.localEulerAngles = var_50_10
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_50_11 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_11.x, var_50_11.y, var_50_11.z)

				local var_50_12 = var_50_4.localEulerAngles

				var_50_12.z = 0
				var_50_12.x = 0
				var_50_4.localEulerAngles = var_50_12
			end

			local var_50_13 = arg_47_1.actors_["10066ui_story"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.characterEffect10066ui_story == nil then
				arg_47_1.var_.characterEffect10066ui_story = var_50_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_15 = 0.200000002980232

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.characterEffect10066ui_story then
					arg_47_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect10066ui_story then
				arg_47_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_50_17 = 0

			if var_50_17 < arg_47_1.time_ and arg_47_1.time_ <= var_50_17 + arg_50_0 then
				arg_47_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action5_1")
			end

			local var_50_18 = 0

			if var_50_18 < arg_47_1.time_ and arg_47_1.time_ <= var_50_18 + arg_50_0 then
				arg_47_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_19 = arg_47_1.actors_["1084ui_story"].transform
			local var_50_20 = 0

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.var_.moveOldPos1084ui_story = var_50_19.localPosition
			end

			local var_50_21 = 0.001

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_21 then
				local var_50_22 = (arg_47_1.time_ - var_50_20) / var_50_21
				local var_50_23 = Vector3.New(-0.7, -0.97, -6)

				var_50_19.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1084ui_story, var_50_23, var_50_22)

				local var_50_24 = manager.ui.mainCamera.transform.position - var_50_19.position

				var_50_19.forward = Vector3.New(var_50_24.x, var_50_24.y, var_50_24.z)

				local var_50_25 = var_50_19.localEulerAngles

				var_50_25.z = 0
				var_50_25.x = 0
				var_50_19.localEulerAngles = var_50_25
			end

			if arg_47_1.time_ >= var_50_20 + var_50_21 and arg_47_1.time_ < var_50_20 + var_50_21 + arg_50_0 then
				var_50_19.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_50_26 = manager.ui.mainCamera.transform.position - var_50_19.position

				var_50_19.forward = Vector3.New(var_50_26.x, var_50_26.y, var_50_26.z)

				local var_50_27 = var_50_19.localEulerAngles

				var_50_27.z = 0
				var_50_27.x = 0
				var_50_19.localEulerAngles = var_50_27
			end

			local var_50_28 = arg_47_1.actors_["1084ui_story"]
			local var_50_29 = 0

			if var_50_29 < arg_47_1.time_ and arg_47_1.time_ <= var_50_29 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_30 = 0.200000002980232

			if var_50_29 <= arg_47_1.time_ and arg_47_1.time_ < var_50_29 + var_50_30 then
				local var_50_31 = (arg_47_1.time_ - var_50_29) / var_50_30

				if arg_47_1.var_.characterEffect1084ui_story then
					local var_50_32 = Mathf.Lerp(0, 0.5, var_50_31)

					arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_32
				end
			end

			if arg_47_1.time_ >= var_50_29 + var_50_30 and arg_47_1.time_ < var_50_29 + var_50_30 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				local var_50_33 = 0.5

				arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_33
			end

			local var_50_34 = 0
			local var_50_35 = 0.925

			if var_50_34 < arg_47_1.time_ and arg_47_1.time_ <= var_50_34 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_36 = arg_47_1:FormatText(StoryNameCfg[640].name)

				arg_47_1.leftNameTxt_.text = var_50_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_37 = arg_47_1:GetWordFromCfg(319401012)
				local var_50_38 = arg_47_1:FormatText(var_50_37.content)

				arg_47_1.text_.text = var_50_38

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_39 = 37
				local var_50_40 = utf8.len(var_50_38)
				local var_50_41 = var_50_39 <= 0 and var_50_35 or var_50_35 * (var_50_40 / var_50_39)

				if var_50_41 > 0 and var_50_35 < var_50_41 then
					arg_47_1.talkMaxDuration = var_50_41

					if var_50_41 + var_50_34 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_41 + var_50_34
					end
				end

				arg_47_1.text_.text = var_50_38
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319401", "319401012", "story_v_out_319401.awb") ~= 0 then
					local var_50_42 = manager.audio:GetVoiceLength("story_v_out_319401", "319401012", "story_v_out_319401.awb") / 1000

					if var_50_42 + var_50_34 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_42 + var_50_34
					end

					if var_50_37.prefab_name ~= "" and arg_47_1.actors_[var_50_37.prefab_name] ~= nil then
						local var_50_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_37.prefab_name].transform, "story_v_out_319401", "319401012", "story_v_out_319401.awb")

						arg_47_1:RecordAudio("319401012", var_50_43)
						arg_47_1:RecordAudio("319401012", var_50_43)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319401", "319401012", "story_v_out_319401.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319401", "319401012", "story_v_out_319401.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_44 = math.max(var_50_35, arg_47_1.talkMaxDuration)

			if var_50_34 <= arg_47_1.time_ and arg_47_1.time_ < var_50_34 + var_50_44 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_34) / var_50_44

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_34 + var_50_44 and arg_47_1.time_ < var_50_34 + var_50_44 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319401013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319401013
		arg_51_1.duration_ = 6.1

		local var_51_0 = {
			zh = 2.6,
			ja = 6.1
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
				arg_51_0:Play319401014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action454")
			end

			local var_54_1 = 0
			local var_54_2 = 0.175

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_3 = arg_51_1:FormatText(StoryNameCfg[640].name)

				arg_51_1.leftNameTxt_.text = var_54_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_4 = arg_51_1:GetWordFromCfg(319401013)
				local var_54_5 = arg_51_1:FormatText(var_54_4.content)

				arg_51_1.text_.text = var_54_5

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_6 = 7
				local var_54_7 = utf8.len(var_54_5)
				local var_54_8 = var_54_6 <= 0 and var_54_2 or var_54_2 * (var_54_7 / var_54_6)

				if var_54_8 > 0 and var_54_2 < var_54_8 then
					arg_51_1.talkMaxDuration = var_54_8

					if var_54_8 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_1
					end
				end

				arg_51_1.text_.text = var_54_5
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319401", "319401013", "story_v_out_319401.awb") ~= 0 then
					local var_54_9 = manager.audio:GetVoiceLength("story_v_out_319401", "319401013", "story_v_out_319401.awb") / 1000

					if var_54_9 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_9 + var_54_1
					end

					if var_54_4.prefab_name ~= "" and arg_51_1.actors_[var_54_4.prefab_name] ~= nil then
						local var_54_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_4.prefab_name].transform, "story_v_out_319401", "319401013", "story_v_out_319401.awb")

						arg_51_1:RecordAudio("319401013", var_54_10)
						arg_51_1:RecordAudio("319401013", var_54_10)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319401", "319401013", "story_v_out_319401.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319401", "319401013", "story_v_out_319401.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_11 = math.max(var_54_2, arg_51_1.talkMaxDuration)

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_11 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_1) / var_54_11

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_1 + var_54_11 and arg_51_1.time_ < var_54_1 + var_54_11 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319401014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319401014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play319401015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10066ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect10066ui_story == nil then
				arg_55_1.var_.characterEffect10066ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect10066ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_55_1.var_.characterEffect10066ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect10066ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_55_1.var_.characterEffect10066ui_story.fillRatio = var_58_5
			end

			local var_58_6 = 0
			local var_58_7 = 1.1

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

				local var_58_8 = arg_55_1:GetWordFromCfg(319401014)
				local var_58_9 = arg_55_1:FormatText(var_58_8.content)

				arg_55_1.text_.text = var_58_9

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_10 = 44
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
	Play319401015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319401015
		arg_59_1.duration_ = 7.133

		local var_59_0 = {
			zh = 4.366,
			ja = 7.133
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
				arg_59_0:Play319401016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1084ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story == nil then
				arg_59_1.var_.characterEffect1084ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1084ui_story then
					arg_59_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story then
				arg_59_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_62_4 = 0

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_2")
			end

			local var_62_5 = 0
			local var_62_6 = 0.325

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_7 = arg_59_1:FormatText(StoryNameCfg[6].name)

				arg_59_1.leftNameTxt_.text = var_62_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_8 = arg_59_1:GetWordFromCfg(319401015)
				local var_62_9 = arg_59_1:FormatText(var_62_8.content)

				arg_59_1.text_.text = var_62_9

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_10 = 13
				local var_62_11 = utf8.len(var_62_9)
				local var_62_12 = var_62_10 <= 0 and var_62_6 or var_62_6 * (var_62_11 / var_62_10)

				if var_62_12 > 0 and var_62_6 < var_62_12 then
					arg_59_1.talkMaxDuration = var_62_12

					if var_62_12 + var_62_5 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_12 + var_62_5
					end
				end

				arg_59_1.text_.text = var_62_9
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319401", "319401015", "story_v_out_319401.awb") ~= 0 then
					local var_62_13 = manager.audio:GetVoiceLength("story_v_out_319401", "319401015", "story_v_out_319401.awb") / 1000

					if var_62_13 + var_62_5 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_5
					end

					if var_62_8.prefab_name ~= "" and arg_59_1.actors_[var_62_8.prefab_name] ~= nil then
						local var_62_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_8.prefab_name].transform, "story_v_out_319401", "319401015", "story_v_out_319401.awb")

						arg_59_1:RecordAudio("319401015", var_62_14)
						arg_59_1:RecordAudio("319401015", var_62_14)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_319401", "319401015", "story_v_out_319401.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_319401", "319401015", "story_v_out_319401.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_15 = math.max(var_62_6, arg_59_1.talkMaxDuration)

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_15 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_5) / var_62_15

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_5 + var_62_15 and arg_59_1.time_ < var_62_5 + var_62_15 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319401016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319401016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play319401017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10066ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos10066ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, 100, 0)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10066ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, 100, 0)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1084ui_story"].transform
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.var_.moveOldPos1084ui_story = var_66_9.localPosition
			end

			local var_66_11 = 0.001

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11
				local var_66_13 = Vector3.New(0, 100, 0)

				var_66_9.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1084ui_story, var_66_13, var_66_12)

				local var_66_14 = manager.ui.mainCamera.transform.position - var_66_9.position

				var_66_9.forward = Vector3.New(var_66_14.x, var_66_14.y, var_66_14.z)

				local var_66_15 = var_66_9.localEulerAngles

				var_66_15.z = 0
				var_66_15.x = 0
				var_66_9.localEulerAngles = var_66_15
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 then
				var_66_9.localPosition = Vector3.New(0, 100, 0)

				local var_66_16 = manager.ui.mainCamera.transform.position - var_66_9.position

				var_66_9.forward = Vector3.New(var_66_16.x, var_66_16.y, var_66_16.z)

				local var_66_17 = var_66_9.localEulerAngles

				var_66_17.z = 0
				var_66_17.x = 0
				var_66_9.localEulerAngles = var_66_17
			end

			local var_66_18 = 0
			local var_66_19 = 1.2

			if var_66_18 < arg_63_1.time_ and arg_63_1.time_ <= var_66_18 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_20 = arg_63_1:GetWordFromCfg(319401016)
				local var_66_21 = arg_63_1:FormatText(var_66_20.content)

				arg_63_1.text_.text = var_66_21

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_22 = 48
				local var_66_23 = utf8.len(var_66_21)
				local var_66_24 = var_66_22 <= 0 and var_66_19 or var_66_19 * (var_66_23 / var_66_22)

				if var_66_24 > 0 and var_66_19 < var_66_24 then
					arg_63_1.talkMaxDuration = var_66_24

					if var_66_24 + var_66_18 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_24 + var_66_18
					end
				end

				arg_63_1.text_.text = var_66_21
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_25 = math.max(var_66_19, arg_63_1.talkMaxDuration)

			if var_66_18 <= arg_63_1.time_ and arg_63_1.time_ < var_66_18 + var_66_25 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_18) / var_66_25

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_18 + var_66_25 and arg_63_1.time_ < var_66_18 + var_66_25 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play319401017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319401017
		arg_67_1.duration_ = 7.33333333333333

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
			arg_67_1.auto_ = false
		end

		function arg_67_1.playNext_(arg_69_0)
			arg_67_1.onStoryFinished_()
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "STwhite"

			if arg_67_1.bgs_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(arg_67_1.paintGo_)

				var_70_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_70_0)
				var_70_1.name = var_70_0
				var_70_1.transform.parent = arg_67_1.stage_.transform
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.bgs_[var_70_0] = var_70_1
			end

			local var_70_2 = 1

			if var_70_2 < arg_67_1.time_ and arg_67_1.time_ <= var_70_2 + arg_70_0 then
				local var_70_3 = manager.ui.mainCamera.transform.localPosition
				local var_70_4 = Vector3.New(0, 0, 10) + Vector3.New(var_70_3.x, var_70_3.y, 0)
				local var_70_5 = arg_67_1.bgs_.STwhite

				var_70_5.transform.localPosition = var_70_4
				var_70_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_6 = var_70_5:GetComponent("SpriteRenderer")

				if var_70_6 and var_70_6.sprite then
					local var_70_7 = (var_70_5.transform.localPosition - var_70_3).z
					local var_70_8 = manager.ui.mainCameraCom_
					local var_70_9 = 2 * var_70_7 * Mathf.Tan(var_70_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_10 = var_70_9 * var_70_8.aspect
					local var_70_11 = var_70_6.sprite.bounds.size.x
					local var_70_12 = var_70_6.sprite.bounds.size.y
					local var_70_13 = var_70_10 / var_70_11
					local var_70_14 = var_70_9 / var_70_12
					local var_70_15 = var_70_14 < var_70_13 and var_70_13 or var_70_14

					var_70_5.transform.localScale = Vector3.New(var_70_15, var_70_15, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "STwhite" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_17 = 1

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17
				local var_70_19 = Color.New(1, 1, 1)

				var_70_19.a = Mathf.Lerp(0, 1, var_70_18)
				arg_67_1.mask_.color = var_70_19
			end

			if arg_67_1.time_ >= var_70_16 + var_70_17 and arg_67_1.time_ < var_70_16 + var_70_17 + arg_70_0 then
				local var_70_20 = Color.New(1, 1, 1)

				var_70_20.a = 1
				arg_67_1.mask_.color = var_70_20
			end

			local var_70_21 = 1

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_22 = 2

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_22 then
				local var_70_23 = (arg_67_1.time_ - var_70_21) / var_70_22
				local var_70_24 = Color.New(1, 1, 1)

				var_70_24.a = Mathf.Lerp(1, 0, var_70_23)
				arg_67_1.mask_.color = var_70_24
			end

			if arg_67_1.time_ >= var_70_21 + var_70_22 and arg_67_1.time_ < var_70_21 + var_70_22 + arg_70_0 then
				local var_70_25 = Color.New(1, 1, 1)
				local var_70_26 = 0

				arg_67_1.mask_.enabled = false
				var_70_25.a = var_70_26
				arg_67_1.mask_.color = var_70_25
			end

			local var_70_27 = arg_67_1.actors_["10066ui_story"].transform
			local var_70_28 = 1

			if var_70_28 < arg_67_1.time_ and arg_67_1.time_ <= var_70_28 + arg_70_0 then
				arg_67_1.var_.moveOldPos10066ui_story = var_70_27.localPosition
			end

			local var_70_29 = 0.001

			if var_70_28 <= arg_67_1.time_ and arg_67_1.time_ < var_70_28 + var_70_29 then
				local var_70_30 = (arg_67_1.time_ - var_70_28) / var_70_29
				local var_70_31 = Vector3.New(0, 100, 0)

				var_70_27.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10066ui_story, var_70_31, var_70_30)

				local var_70_32 = manager.ui.mainCamera.transform.position - var_70_27.position

				var_70_27.forward = Vector3.New(var_70_32.x, var_70_32.y, var_70_32.z)

				local var_70_33 = var_70_27.localEulerAngles

				var_70_33.z = 0
				var_70_33.x = 0
				var_70_27.localEulerAngles = var_70_33
			end

			if arg_67_1.time_ >= var_70_28 + var_70_29 and arg_67_1.time_ < var_70_28 + var_70_29 + arg_70_0 then
				var_70_27.localPosition = Vector3.New(0, 100, 0)

				local var_70_34 = manager.ui.mainCamera.transform.position - var_70_27.position

				var_70_27.forward = Vector3.New(var_70_34.x, var_70_34.y, var_70_34.z)

				local var_70_35 = var_70_27.localEulerAngles

				var_70_35.z = 0
				var_70_35.x = 0
				var_70_27.localEulerAngles = var_70_35
			end

			local var_70_36 = arg_67_1.actors_["10066ui_story"]
			local var_70_37 = 1

			if var_70_37 < arg_67_1.time_ and arg_67_1.time_ <= var_70_37 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story == nil then
				arg_67_1.var_.characterEffect10066ui_story = var_70_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_38 = 0.2

			if var_70_37 <= arg_67_1.time_ and arg_67_1.time_ < var_70_37 + var_70_38 then
				local var_70_39 = (arg_67_1.time_ - var_70_37) / var_70_38

				if arg_67_1.var_.characterEffect10066ui_story then
					local var_70_40 = Mathf.Lerp(0, 0.5, var_70_39)

					arg_67_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10066ui_story.fillRatio = var_70_40
				end
			end

			if arg_67_1.time_ >= var_70_37 + var_70_38 and arg_67_1.time_ < var_70_37 + var_70_38 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story then
				local var_70_41 = 0.5

				arg_67_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10066ui_story.fillRatio = var_70_41
			end

			local var_70_42 = arg_67_1.actors_["1084ui_story"].transform
			local var_70_43 = 1

			if var_70_43 < arg_67_1.time_ and arg_67_1.time_ <= var_70_43 + arg_70_0 then
				arg_67_1.var_.moveOldPos1084ui_story = var_70_42.localPosition
			end

			local var_70_44 = 0.001

			if var_70_43 <= arg_67_1.time_ and arg_67_1.time_ < var_70_43 + var_70_44 then
				local var_70_45 = (arg_67_1.time_ - var_70_43) / var_70_44
				local var_70_46 = Vector3.New(0, 100, 0)

				var_70_42.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1084ui_story, var_70_46, var_70_45)

				local var_70_47 = manager.ui.mainCamera.transform.position - var_70_42.position

				var_70_42.forward = Vector3.New(var_70_47.x, var_70_47.y, var_70_47.z)

				local var_70_48 = var_70_42.localEulerAngles

				var_70_48.z = 0
				var_70_48.x = 0
				var_70_42.localEulerAngles = var_70_48
			end

			if arg_67_1.time_ >= var_70_43 + var_70_44 and arg_67_1.time_ < var_70_43 + var_70_44 + arg_70_0 then
				var_70_42.localPosition = Vector3.New(0, 100, 0)

				local var_70_49 = manager.ui.mainCamera.transform.position - var_70_42.position

				var_70_42.forward = Vector3.New(var_70_49.x, var_70_49.y, var_70_49.z)

				local var_70_50 = var_70_42.localEulerAngles

				var_70_50.z = 0
				var_70_50.x = 0
				var_70_42.localEulerAngles = var_70_50
			end

			local var_70_51 = arg_67_1.actors_["1084ui_story"]
			local var_70_52 = 1

			if var_70_52 < arg_67_1.time_ and arg_67_1.time_ <= var_70_52 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story == nil then
				arg_67_1.var_.characterEffect1084ui_story = var_70_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_53 = 0.200000002980232

			if var_70_52 <= arg_67_1.time_ and arg_67_1.time_ < var_70_52 + var_70_53 then
				local var_70_54 = (arg_67_1.time_ - var_70_52) / var_70_53

				if arg_67_1.var_.characterEffect1084ui_story then
					local var_70_55 = Mathf.Lerp(0, 0.5, var_70_54)

					arg_67_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1084ui_story.fillRatio = var_70_55
				end
			end

			if arg_67_1.time_ >= var_70_52 + var_70_53 and arg_67_1.time_ < var_70_52 + var_70_53 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story then
				local var_70_56 = 0.5

				arg_67_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1084ui_story.fillRatio = var_70_56
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_57 = 2.33333333333333
			local var_70_58 = 1.125

			if var_70_57 < arg_67_1.time_ and arg_67_1.time_ <= var_70_57 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_59 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_59:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_60 = arg_67_1:GetWordFromCfg(319401017)
				local var_70_61 = arg_67_1:FormatText(var_70_60.content)

				arg_67_1.text_.text = var_70_61

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_62 = 45
				local var_70_63 = utf8.len(var_70_61)
				local var_70_64 = var_70_62 <= 0 and var_70_58 or var_70_58 * (var_70_63 / var_70_62)

				if var_70_64 > 0 and var_70_58 < var_70_64 then
					arg_67_1.talkMaxDuration = var_70_64
					var_70_57 = var_70_57 + 0.3

					if var_70_64 + var_70_57 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_64 + var_70_57
					end
				end

				arg_67_1.text_.text = var_70_61
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_65 = var_70_57 + 0.3
			local var_70_66 = math.max(var_70_58, arg_67_1.talkMaxDuration)

			if var_70_65 <= arg_67_1.time_ and arg_67_1.time_ < var_70_65 + var_70_66 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_65) / var_70_66

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_65 + var_70_66 and arg_67_1.time_ < var_70_65 + var_70_66 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite"
	},
	voices = {
		"story_v_out_319401.awb"
	}
}
