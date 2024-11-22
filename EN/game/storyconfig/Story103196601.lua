return {
	Play319661001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319661001
		arg_1_1.duration_ = 6.86666666666667

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319661002(arg_1_1)
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
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_17 = 0.3

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_19 = 2

			if var_4_18 <= arg_1_1.time_ and arg_1_1.time_ < var_4_18 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_18) / var_4_19
				local var_4_21 = Color.New(0, 0, 0)

				var_4_21.a = Mathf.Lerp(1, 0, var_4_20)
				arg_1_1.mask_.color = var_4_21
			end

			if arg_1_1.time_ >= var_4_18 + var_4_19 and arg_1_1.time_ < var_4_18 + var_4_19 + arg_4_0 then
				local var_4_22 = Color.New(0, 0, 0)
				local var_4_23 = 0

				arg_1_1.mask_.enabled = false
				var_4_22.a = var_4_23
				arg_1_1.mask_.color = var_4_22
			end

			local var_4_24 = 0
			local var_4_25 = 0.2

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_26 = "play"
				local var_4_27 = "music"

				arg_1_1:AudioAction(var_4_26, var_4_27, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_28 = 0.233333333333333
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_32 = 1.86666666666667
			local var_4_33 = 1.1

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_34 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_34:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_35 = arg_1_1:GetWordFromCfg(319661001)
				local var_4_36 = arg_1_1:FormatText(var_4_35.content)

				arg_1_1.text_.text = var_4_36

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_37 = 44
				local var_4_38 = utf8.len(var_4_36)
				local var_4_39 = var_4_37 <= 0 and var_4_33 or var_4_33 * (var_4_38 / var_4_37)

				if var_4_39 > 0 and var_4_33 < var_4_39 then
					arg_1_1.talkMaxDuration = var_4_39
					var_4_32 = var_4_32 + 0.3

					if var_4_39 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_32
					end
				end

				arg_1_1.text_.text = var_4_36
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_40 = var_4_32 + 0.3
			local var_4_41 = math.max(var_4_33, arg_1_1.talkMaxDuration)

			if var_4_40 <= arg_1_1.time_ and arg_1_1.time_ < var_4_40 + var_4_41 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_40) / var_4_41

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_40 + var_4_41 and arg_1_1.time_ < var_4_40 + var_4_41 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319661002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319661002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play319661003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.95

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

				local var_10_2 = arg_7_1:GetWordFromCfg(319661002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 38
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
	Play319661003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319661003
		arg_11_1.duration_ = 8.3

		local var_11_0 = {
			zh = 4,
			ja = 8.3
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
				arg_11_0:Play319661004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1084ui_story"

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

			local var_14_4 = arg_11_1.actors_["1084ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1084ui_story = var_14_4.localPosition

				local var_14_6 = "1084ui_story"

				arg_11_1:ShowWeapon(arg_11_1.var_[var_14_6 .. "Animator"].transform, false)
			end

			local var_14_7 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_7 then
				local var_14_8 = (arg_11_1.time_ - var_14_5) / var_14_7
				local var_14_9 = Vector3.New(0, -0.97, -6)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1084ui_story, var_14_9, var_14_8)

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

			local var_14_14 = arg_11_1.actors_["1084ui_story"]
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_16 = 0.200000002980232

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16

				if arg_11_1.var_.characterEffect1084ui_story then
					arg_11_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_15 + var_14_16 and arg_11_1.time_ < var_14_15 + var_14_16 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				arg_11_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_14_19 = 0

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_14_20 = 0
			local var_14_21 = 0.575

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

				local var_14_23 = arg_11_1:GetWordFromCfg(319661003)
				local var_14_24 = arg_11_1:FormatText(var_14_23.content)

				arg_11_1.text_.text = var_14_24

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_25 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661003", "story_v_out_319661.awb") ~= 0 then
					local var_14_28 = manager.audio:GetVoiceLength("story_v_out_319661", "319661003", "story_v_out_319661.awb") / 1000

					if var_14_28 + var_14_20 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_28 + var_14_20
					end

					if var_14_23.prefab_name ~= "" and arg_11_1.actors_[var_14_23.prefab_name] ~= nil then
						local var_14_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_23.prefab_name].transform, "story_v_out_319661", "319661003", "story_v_out_319661.awb")

						arg_11_1:RecordAudio("319661003", var_14_29)
						arg_11_1:RecordAudio("319661003", var_14_29)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319661", "319661003", "story_v_out_319661.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319661", "319661003", "story_v_out_319661.awb")
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
	Play319661004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319661004
		arg_15_1.duration_ = 12.2

		local var_15_0 = {
			zh = 12.2,
			ja = 10.8
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
				arg_15_0:Play319661005(arg_15_1)
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
				arg_15_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_18_19 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_20 = 0

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_19.localPosition
			end

			local var_18_21 = 0.001

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_21 then
				local var_18_22 = (arg_15_1.time_ - var_18_20) / var_18_21
				local var_18_23 = Vector3.New(-0.7, -0.97, -6)

				var_18_19.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_23, var_18_22)

				local var_18_24 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_24.x, var_18_24.y, var_18_24.z)

				local var_18_25 = var_18_19.localEulerAngles

				var_18_25.z = 0
				var_18_25.x = 0
				var_18_19.localEulerAngles = var_18_25
			end

			if arg_15_1.time_ >= var_18_20 + var_18_21 and arg_15_1.time_ < var_18_20 + var_18_21 + arg_18_0 then
				var_18_19.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_18_26 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_26.x, var_18_26.y, var_18_26.z)

				local var_18_27 = var_18_19.localEulerAngles

				var_18_27.z = 0
				var_18_27.x = 0
				var_18_19.localEulerAngles = var_18_27
			end

			local var_18_28 = arg_15_1.actors_["1084ui_story"]
			local var_18_29 = 0

			if var_18_29 < arg_15_1.time_ and arg_15_1.time_ <= var_18_29 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_30 = 0.200000002980232

			if var_18_29 <= arg_15_1.time_ and arg_15_1.time_ < var_18_29 + var_18_30 then
				local var_18_31 = (arg_15_1.time_ - var_18_29) / var_18_30

				if arg_15_1.var_.characterEffect1084ui_story then
					local var_18_32 = Mathf.Lerp(0, 0.5, var_18_31)

					arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_32
				end
			end

			if arg_15_1.time_ >= var_18_29 + var_18_30 and arg_15_1.time_ < var_18_29 + var_18_30 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				local var_18_33 = 0.5

				arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_33
			end

			local var_18_34 = 0
			local var_18_35 = 1.075

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

				local var_18_37 = arg_15_1:GetWordFromCfg(319661004)
				local var_18_38 = arg_15_1:FormatText(var_18_37.content)

				arg_15_1.text_.text = var_18_38

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_39 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661004", "story_v_out_319661.awb") ~= 0 then
					local var_18_42 = manager.audio:GetVoiceLength("story_v_out_319661", "319661004", "story_v_out_319661.awb") / 1000

					if var_18_42 + var_18_34 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_42 + var_18_34
					end

					if var_18_37.prefab_name ~= "" and arg_15_1.actors_[var_18_37.prefab_name] ~= nil then
						local var_18_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_37.prefab_name].transform, "story_v_out_319661", "319661004", "story_v_out_319661.awb")

						arg_15_1:RecordAudio("319661004", var_18_43)
						arg_15_1:RecordAudio("319661004", var_18_43)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319661", "319661004", "story_v_out_319661.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319661", "319661004", "story_v_out_319661.awb")
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
	Play319661005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319661005
		arg_19_1.duration_ = 10.533

		local var_19_0 = {
			zh = 6.066,
			ja = 10.533
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
				arg_19_0:Play319661006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10066ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect10066ui_story == nil then
				arg_19_1.var_.characterEffect10066ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect10066ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_19_1.var_.characterEffect10066ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect10066ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_19_1.var_.characterEffect10066ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_22_7 = arg_19_1.actors_["1084ui_story"]
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_9 = 0.200000002980232

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_8) / var_22_9

				if arg_19_1.var_.characterEffect1084ui_story then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_8 + var_22_9 and arg_19_1.time_ < var_22_8 + var_22_9 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_11 = 0

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_2")
			end

			local var_22_12 = 0
			local var_22_13 = 0.75

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_14 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(319661005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 30
				local var_22_18 = utf8.len(var_22_16)
				local var_22_19 = var_22_17 <= 0 and var_22_13 or var_22_13 * (var_22_18 / var_22_17)

				if var_22_19 > 0 and var_22_13 < var_22_19 then
					arg_19_1.talkMaxDuration = var_22_19

					if var_22_19 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_12
					end
				end

				arg_19_1.text_.text = var_22_16
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661005", "story_v_out_319661.awb") ~= 0 then
					local var_22_20 = manager.audio:GetVoiceLength("story_v_out_319661", "319661005", "story_v_out_319661.awb") / 1000

					if var_22_20 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_12
					end

					if var_22_15.prefab_name ~= "" and arg_19_1.actors_[var_22_15.prefab_name] ~= nil then
						local var_22_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_15.prefab_name].transform, "story_v_out_319661", "319661005", "story_v_out_319661.awb")

						arg_19_1:RecordAudio("319661005", var_22_21)
						arg_19_1:RecordAudio("319661005", var_22_21)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319661", "319661005", "story_v_out_319661.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319661", "319661005", "story_v_out_319661.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_22 = math.max(var_22_13, arg_19_1.talkMaxDuration)

			if var_22_12 <= arg_19_1.time_ and arg_19_1.time_ < var_22_12 + var_22_22 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_12) / var_22_22

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_12 + var_22_22 and arg_19_1.time_ < var_22_12 + var_22_22 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319661006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319661006
		arg_23_1.duration_ = 10.466

		local var_23_0 = {
			zh = 6.433,
			ja = 10.466
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
				arg_23_0:Play319661007(arg_23_1)
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
					arg_23_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect10066ui_story then
				arg_23_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_26_4 = arg_23_1.actors_["1084ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.200000002980232

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect1084ui_story then
					local var_26_8 = Mathf.Lerp(0, 0.5, var_26_7)

					arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_8
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				local var_26_9 = 0.5

				arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_9
			end

			local var_26_10 = 0
			local var_26_11 = 0.675

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_12 = arg_23_1:FormatText(StoryNameCfg[640].name)

				arg_23_1.leftNameTxt_.text = var_26_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_13 = arg_23_1:GetWordFromCfg(319661006)
				local var_26_14 = arg_23_1:FormatText(var_26_13.content)

				arg_23_1.text_.text = var_26_14

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_15 = 27
				local var_26_16 = utf8.len(var_26_14)
				local var_26_17 = var_26_15 <= 0 and var_26_11 or var_26_11 * (var_26_16 / var_26_15)

				if var_26_17 > 0 and var_26_11 < var_26_17 then
					arg_23_1.talkMaxDuration = var_26_17

					if var_26_17 + var_26_10 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_17 + var_26_10
					end
				end

				arg_23_1.text_.text = var_26_14
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661006", "story_v_out_319661.awb") ~= 0 then
					local var_26_18 = manager.audio:GetVoiceLength("story_v_out_319661", "319661006", "story_v_out_319661.awb") / 1000

					if var_26_18 + var_26_10 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_18 + var_26_10
					end

					if var_26_13.prefab_name ~= "" and arg_23_1.actors_[var_26_13.prefab_name] ~= nil then
						local var_26_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_13.prefab_name].transform, "story_v_out_319661", "319661006", "story_v_out_319661.awb")

						arg_23_1:RecordAudio("319661006", var_26_19)
						arg_23_1:RecordAudio("319661006", var_26_19)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319661", "319661006", "story_v_out_319661.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319661", "319661006", "story_v_out_319661.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_20 = math.max(var_26_11, arg_23_1.talkMaxDuration)

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_20 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_10) / var_26_20

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_10 + var_26_20 and arg_23_1.time_ < var_26_10 + var_26_20 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319661007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319661007
		arg_27_1.duration_ = 9.666

		local var_27_0 = {
			zh = 9.666,
			ja = 7.3
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
				arg_27_0:Play319661008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10066ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10066ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0.7, -0.99, -5.83)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10066ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_1")
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_11 = 0
			local var_30_12 = 0.85

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_13 = arg_27_1:FormatText(StoryNameCfg[640].name)

				arg_27_1.leftNameTxt_.text = var_30_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_14 = arg_27_1:GetWordFromCfg(319661007)
				local var_30_15 = arg_27_1:FormatText(var_30_14.content)

				arg_27_1.text_.text = var_30_15

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_16 = 34
				local var_30_17 = utf8.len(var_30_15)
				local var_30_18 = var_30_16 <= 0 and var_30_12 or var_30_12 * (var_30_17 / var_30_16)

				if var_30_18 > 0 and var_30_12 < var_30_18 then
					arg_27_1.talkMaxDuration = var_30_18

					if var_30_18 + var_30_11 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_18 + var_30_11
					end
				end

				arg_27_1.text_.text = var_30_15
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661007", "story_v_out_319661.awb") ~= 0 then
					local var_30_19 = manager.audio:GetVoiceLength("story_v_out_319661", "319661007", "story_v_out_319661.awb") / 1000

					if var_30_19 + var_30_11 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_19 + var_30_11
					end

					if var_30_14.prefab_name ~= "" and arg_27_1.actors_[var_30_14.prefab_name] ~= nil then
						local var_30_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_14.prefab_name].transform, "story_v_out_319661", "319661007", "story_v_out_319661.awb")

						arg_27_1:RecordAudio("319661007", var_30_20)
						arg_27_1:RecordAudio("319661007", var_30_20)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_319661", "319661007", "story_v_out_319661.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_319661", "319661007", "story_v_out_319661.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_21 = math.max(var_30_12, arg_27_1.talkMaxDuration)

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_21 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_11) / var_30_21

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_11 + var_30_21 and arg_27_1.time_ < var_30_11 + var_30_21 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319661008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319661008
		arg_31_1.duration_ = 4.1

		local var_31_0 = {
			zh = 4.1,
			ja = 3.733
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
				arg_31_0:Play319661009(arg_31_1)
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
				local var_34_4 = Vector3.New(-0.7, -0.97, -6)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1084ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-0.7, -0.97, -6)

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
				arg_31_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_15 = arg_31_1.actors_["10066ui_story"]
			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 and arg_31_1.var_.characterEffect10066ui_story == nil then
				arg_31_1.var_.characterEffect10066ui_story = var_34_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_17 = 0.200000002980232

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17

				if arg_31_1.var_.characterEffect10066ui_story then
					local var_34_19 = Mathf.Lerp(0, 0.5, var_34_18)

					arg_31_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_31_1.var_.characterEffect10066ui_story.fillRatio = var_34_19
				end
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 and arg_31_1.var_.characterEffect10066ui_story then
				local var_34_20 = 0.5

				arg_31_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_31_1.var_.characterEffect10066ui_story.fillRatio = var_34_20
			end

			local var_34_21 = 0
			local var_34_22 = 0.525

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_23 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_24 = arg_31_1:GetWordFromCfg(319661008)
				local var_34_25 = arg_31_1:FormatText(var_34_24.content)

				arg_31_1.text_.text = var_34_25

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_26 = 21
				local var_34_27 = utf8.len(var_34_25)
				local var_34_28 = var_34_26 <= 0 and var_34_22 or var_34_22 * (var_34_27 / var_34_26)

				if var_34_28 > 0 and var_34_22 < var_34_28 then
					arg_31_1.talkMaxDuration = var_34_28

					if var_34_28 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_28 + var_34_21
					end
				end

				arg_31_1.text_.text = var_34_25
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661008", "story_v_out_319661.awb") ~= 0 then
					local var_34_29 = manager.audio:GetVoiceLength("story_v_out_319661", "319661008", "story_v_out_319661.awb") / 1000

					if var_34_29 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_29 + var_34_21
					end

					if var_34_24.prefab_name ~= "" and arg_31_1.actors_[var_34_24.prefab_name] ~= nil then
						local var_34_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_24.prefab_name].transform, "story_v_out_319661", "319661008", "story_v_out_319661.awb")

						arg_31_1:RecordAudio("319661008", var_34_30)
						arg_31_1:RecordAudio("319661008", var_34_30)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319661", "319661008", "story_v_out_319661.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319661", "319661008", "story_v_out_319661.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_31 = math.max(var_34_22, arg_31_1.talkMaxDuration)

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_31 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_21) / var_34_31

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_21 + var_34_31 and arg_31_1.time_ < var_34_21 + var_34_31 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319661009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319661009
		arg_35_1.duration_ = 7.333

		local var_35_0 = {
			zh = 7.333,
			ja = 5.233
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
				arg_35_0:Play319661010(arg_35_1)
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

			local var_38_6 = arg_35_1.actors_["10066ui_story"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect10066ui_story == nil then
				arg_35_1.var_.characterEffect10066ui_story = var_38_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_8 = 0.200000002980232

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8

				if arg_35_1.var_.characterEffect10066ui_story then
					arg_35_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 and arg_35_1.var_.characterEffect10066ui_story then
				arg_35_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_38_11 = 0
			local var_38_12 = 0.7

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_13 = arg_35_1:FormatText(StoryNameCfg[640].name)

				arg_35_1.leftNameTxt_.text = var_38_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_14 = arg_35_1:GetWordFromCfg(319661009)
				local var_38_15 = arg_35_1:FormatText(var_38_14.content)

				arg_35_1.text_.text = var_38_15

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_16 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661009", "story_v_out_319661.awb") ~= 0 then
					local var_38_19 = manager.audio:GetVoiceLength("story_v_out_319661", "319661009", "story_v_out_319661.awb") / 1000

					if var_38_19 + var_38_11 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_11
					end

					if var_38_14.prefab_name ~= "" and arg_35_1.actors_[var_38_14.prefab_name] ~= nil then
						local var_38_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_14.prefab_name].transform, "story_v_out_319661", "319661009", "story_v_out_319661.awb")

						arg_35_1:RecordAudio("319661009", var_38_20)
						arg_35_1:RecordAudio("319661009", var_38_20)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319661", "319661009", "story_v_out_319661.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319661", "319661009", "story_v_out_319661.awb")
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
	Play319661010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319661010
		arg_39_1.duration_ = 12.133

		local var_39_0 = {
			zh = 8.166,
			ja = 12.133
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
				arg_39_0:Play319661011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10066ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10066ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0.7, -0.99, -5.83)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10066ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = 0

			if var_42_9 < arg_39_1.time_ and arg_39_1.time_ <= var_42_9 + arg_42_0 then
				arg_39_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action436")
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_42_11 = 0
			local var_42_12 = 0.875

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_13 = arg_39_1:FormatText(StoryNameCfg[640].name)

				arg_39_1.leftNameTxt_.text = var_42_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_14 = arg_39_1:GetWordFromCfg(319661010)
				local var_42_15 = arg_39_1:FormatText(var_42_14.content)

				arg_39_1.text_.text = var_42_15

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_16 = 35
				local var_42_17 = utf8.len(var_42_15)
				local var_42_18 = var_42_16 <= 0 and var_42_12 or var_42_12 * (var_42_17 / var_42_16)

				if var_42_18 > 0 and var_42_12 < var_42_18 then
					arg_39_1.talkMaxDuration = var_42_18

					if var_42_18 + var_42_11 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_18 + var_42_11
					end
				end

				arg_39_1.text_.text = var_42_15
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661010", "story_v_out_319661.awb") ~= 0 then
					local var_42_19 = manager.audio:GetVoiceLength("story_v_out_319661", "319661010", "story_v_out_319661.awb") / 1000

					if var_42_19 + var_42_11 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_11
					end

					if var_42_14.prefab_name ~= "" and arg_39_1.actors_[var_42_14.prefab_name] ~= nil then
						local var_42_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_14.prefab_name].transform, "story_v_out_319661", "319661010", "story_v_out_319661.awb")

						arg_39_1:RecordAudio("319661010", var_42_20)
						arg_39_1:RecordAudio("319661010", var_42_20)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319661", "319661010", "story_v_out_319661.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319661", "319661010", "story_v_out_319661.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_21 = math.max(var_42_12, arg_39_1.talkMaxDuration)

			if var_42_11 <= arg_39_1.time_ and arg_39_1.time_ < var_42_11 + var_42_21 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_11) / var_42_21

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_11 + var_42_21 and arg_39_1.time_ < var_42_11 + var_42_21 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319661011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319661011
		arg_43_1.duration_ = 4.8

		local var_43_0 = {
			zh = 2.766,
			ja = 4.8
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
				arg_43_0:Play319661012(arg_43_1)
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
				local var_46_4 = Vector3.New(-0.7, -0.97, -6)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1084ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-0.7, -0.97, -6)

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
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_46_15 = arg_43_1.actors_["10066ui_story"]
			local var_46_16 = 0

			if var_46_16 < arg_43_1.time_ and arg_43_1.time_ <= var_46_16 + arg_46_0 and arg_43_1.var_.characterEffect10066ui_story == nil then
				arg_43_1.var_.characterEffect10066ui_story = var_46_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_17 = 0.200000002980232

			if var_46_16 <= arg_43_1.time_ and arg_43_1.time_ < var_46_16 + var_46_17 then
				local var_46_18 = (arg_43_1.time_ - var_46_16) / var_46_17

				if arg_43_1.var_.characterEffect10066ui_story then
					local var_46_19 = Mathf.Lerp(0, 0.5, var_46_18)

					arg_43_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_43_1.var_.characterEffect10066ui_story.fillRatio = var_46_19
				end
			end

			if arg_43_1.time_ >= var_46_16 + var_46_17 and arg_43_1.time_ < var_46_16 + var_46_17 + arg_46_0 and arg_43_1.var_.characterEffect10066ui_story then
				local var_46_20 = 0.5

				arg_43_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_43_1.var_.characterEffect10066ui_story.fillRatio = var_46_20
			end

			local var_46_21 = 0
			local var_46_22 = 0.4

			if var_46_21 < arg_43_1.time_ and arg_43_1.time_ <= var_46_21 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_23 = arg_43_1:FormatText(StoryNameCfg[6].name)

				arg_43_1.leftNameTxt_.text = var_46_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_24 = arg_43_1:GetWordFromCfg(319661011)
				local var_46_25 = arg_43_1:FormatText(var_46_24.content)

				arg_43_1.text_.text = var_46_25

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_26 = 16
				local var_46_27 = utf8.len(var_46_25)
				local var_46_28 = var_46_26 <= 0 and var_46_22 or var_46_22 * (var_46_27 / var_46_26)

				if var_46_28 > 0 and var_46_22 < var_46_28 then
					arg_43_1.talkMaxDuration = var_46_28

					if var_46_28 + var_46_21 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_28 + var_46_21
					end
				end

				arg_43_1.text_.text = var_46_25
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661011", "story_v_out_319661.awb") ~= 0 then
					local var_46_29 = manager.audio:GetVoiceLength("story_v_out_319661", "319661011", "story_v_out_319661.awb") / 1000

					if var_46_29 + var_46_21 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_29 + var_46_21
					end

					if var_46_24.prefab_name ~= "" and arg_43_1.actors_[var_46_24.prefab_name] ~= nil then
						local var_46_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_24.prefab_name].transform, "story_v_out_319661", "319661011", "story_v_out_319661.awb")

						arg_43_1:RecordAudio("319661011", var_46_30)
						arg_43_1:RecordAudio("319661011", var_46_30)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319661", "319661011", "story_v_out_319661.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319661", "319661011", "story_v_out_319661.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_31 = math.max(var_46_22, arg_43_1.talkMaxDuration)

			if var_46_21 <= arg_43_1.time_ and arg_43_1.time_ < var_46_21 + var_46_31 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_21) / var_46_31

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_21 + var_46_31 and arg_43_1.time_ < var_46_21 + var_46_31 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319661012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319661012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play319661013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1084ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1084ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_50_7 = 0
			local var_50_8 = 0.8

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(319661012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 32
				local var_50_12 = utf8.len(var_50_10)
				local var_50_13 = var_50_11 <= 0 and var_50_8 or var_50_8 * (var_50_12 / var_50_11)

				if var_50_13 > 0 and var_50_8 < var_50_13 then
					arg_47_1.talkMaxDuration = var_50_13

					if var_50_13 + var_50_7 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_7
					end
				end

				arg_47_1.text_.text = var_50_10
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_14 = math.max(var_50_8, arg_47_1.talkMaxDuration)

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_14 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_7) / var_50_14

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_7 + var_50_14 and arg_47_1.time_ < var_50_7 + var_50_14 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319661013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319661013
		arg_51_1.duration_ = 6.4

		local var_51_0 = {
			zh = 3.966,
			ja = 6.4
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
				arg_51_0:Play319661014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10066ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10066ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0.7, -0.99, -5.83)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10066ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["10066ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect10066ui_story == nil then
				arg_51_1.var_.characterEffect10066ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect10066ui_story then
					arg_51_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect10066ui_story then
				arg_51_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action464")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_54_15 = 0
			local var_54_16 = 0.175

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_17 = arg_51_1:FormatText(StoryNameCfg[640].name)

				arg_51_1.leftNameTxt_.text = var_54_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_18 = arg_51_1:GetWordFromCfg(319661013)
				local var_54_19 = arg_51_1:FormatText(var_54_18.content)

				arg_51_1.text_.text = var_54_19

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_20 = 7
				local var_54_21 = utf8.len(var_54_19)
				local var_54_22 = var_54_20 <= 0 and var_54_16 or var_54_16 * (var_54_21 / var_54_20)

				if var_54_22 > 0 and var_54_16 < var_54_22 then
					arg_51_1.talkMaxDuration = var_54_22

					if var_54_22 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_22 + var_54_15
					end
				end

				arg_51_1.text_.text = var_54_19
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661013", "story_v_out_319661.awb") ~= 0 then
					local var_54_23 = manager.audio:GetVoiceLength("story_v_out_319661", "319661013", "story_v_out_319661.awb") / 1000

					if var_54_23 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_23 + var_54_15
					end

					if var_54_18.prefab_name ~= "" and arg_51_1.actors_[var_54_18.prefab_name] ~= nil then
						local var_54_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_18.prefab_name].transform, "story_v_out_319661", "319661013", "story_v_out_319661.awb")

						arg_51_1:RecordAudio("319661013", var_54_24)
						arg_51_1:RecordAudio("319661013", var_54_24)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319661", "319661013", "story_v_out_319661.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319661", "319661013", "story_v_out_319661.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_25 = math.max(var_54_16, arg_51_1.talkMaxDuration)

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_25 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_15) / var_54_25

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_15 + var_54_25 and arg_51_1.time_ < var_54_15 + var_54_25 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319661014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319661014
		arg_55_1.duration_ = 12

		local var_55_0 = {
			zh = 12,
			ja = 11.333
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
				arg_55_0:Play319661015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.225

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[640].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(319661014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661014", "story_v_out_319661.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_319661", "319661014", "story_v_out_319661.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_319661", "319661014", "story_v_out_319661.awb")

						arg_55_1:RecordAudio("319661014", var_58_9)
						arg_55_1:RecordAudio("319661014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_319661", "319661014", "story_v_out_319661.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_319661", "319661014", "story_v_out_319661.awb")
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
	Play319661015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319661015
		arg_59_1.duration_ = 5.5

		local var_59_0 = {
			zh = 3.666,
			ja = 5.5
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
				arg_59_0:Play319661016(arg_59_1)
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

			local var_62_4 = arg_59_1.actors_["10066ui_story"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect10066ui_story == nil then
				arg_59_1.var_.characterEffect10066ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.200000002980232

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect10066ui_story then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_59_1.var_.characterEffect10066ui_story.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect10066ui_story then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_59_1.var_.characterEffect10066ui_story.fillRatio = var_62_9
			end

			local var_62_10 = 0
			local var_62_11 = 0.275

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_12 = arg_59_1:FormatText(StoryNameCfg[6].name)

				arg_59_1.leftNameTxt_.text = var_62_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_13 = arg_59_1:GetWordFromCfg(319661015)
				local var_62_14 = arg_59_1:FormatText(var_62_13.content)

				arg_59_1.text_.text = var_62_14

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_15 = 11
				local var_62_16 = utf8.len(var_62_14)
				local var_62_17 = var_62_15 <= 0 and var_62_11 or var_62_11 * (var_62_16 / var_62_15)

				if var_62_17 > 0 and var_62_11 < var_62_17 then
					arg_59_1.talkMaxDuration = var_62_17

					if var_62_17 + var_62_10 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_17 + var_62_10
					end
				end

				arg_59_1.text_.text = var_62_14
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661015", "story_v_out_319661.awb") ~= 0 then
					local var_62_18 = manager.audio:GetVoiceLength("story_v_out_319661", "319661015", "story_v_out_319661.awb") / 1000

					if var_62_18 + var_62_10 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_18 + var_62_10
					end

					if var_62_13.prefab_name ~= "" and arg_59_1.actors_[var_62_13.prefab_name] ~= nil then
						local var_62_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_13.prefab_name].transform, "story_v_out_319661", "319661015", "story_v_out_319661.awb")

						arg_59_1:RecordAudio("319661015", var_62_19)
						arg_59_1:RecordAudio("319661015", var_62_19)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_319661", "319661015", "story_v_out_319661.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_319661", "319661015", "story_v_out_319661.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_20 = math.max(var_62_11, arg_59_1.talkMaxDuration)

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_20 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_10) / var_62_20

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_10 + var_62_20 and arg_59_1.time_ < var_62_10 + var_62_20 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319661016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319661016
		arg_63_1.duration_ = 6.6

		local var_63_0 = {
			zh = 2.9,
			ja = 6.6
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
				arg_63_0:Play319661017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action4_2")
			end

			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_66_2 = arg_63_1.actors_["1084ui_story"]
			local var_66_3 = 0

			if var_66_3 < arg_63_1.time_ and arg_63_1.time_ <= var_66_3 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_4 = 0.200000002980232

			if var_66_3 <= arg_63_1.time_ and arg_63_1.time_ < var_66_3 + var_66_4 then
				local var_66_5 = (arg_63_1.time_ - var_66_3) / var_66_4

				if arg_63_1.var_.characterEffect1084ui_story then
					local var_66_6 = Mathf.Lerp(0, 0.5, var_66_5)

					arg_63_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1084ui_story.fillRatio = var_66_6
				end
			end

			if arg_63_1.time_ >= var_66_3 + var_66_4 and arg_63_1.time_ < var_66_3 + var_66_4 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story then
				local var_66_7 = 0.5

				arg_63_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1084ui_story.fillRatio = var_66_7
			end

			local var_66_8 = arg_63_1.actors_["10066ui_story"]
			local var_66_9 = 0

			if var_66_9 < arg_63_1.time_ and arg_63_1.time_ <= var_66_9 + arg_66_0 and arg_63_1.var_.characterEffect10066ui_story == nil then
				arg_63_1.var_.characterEffect10066ui_story = var_66_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_10 = 0.200000002980232

			if var_66_9 <= arg_63_1.time_ and arg_63_1.time_ < var_66_9 + var_66_10 then
				local var_66_11 = (arg_63_1.time_ - var_66_9) / var_66_10

				if arg_63_1.var_.characterEffect10066ui_story then
					arg_63_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_9 + var_66_10 and arg_63_1.time_ < var_66_9 + var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect10066ui_story then
				arg_63_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_66_12 = 0
			local var_66_13 = 0.275

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_14 = arg_63_1:FormatText(StoryNameCfg[640].name)

				arg_63_1.leftNameTxt_.text = var_66_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_15 = arg_63_1:GetWordFromCfg(319661016)
				local var_66_16 = arg_63_1:FormatText(var_66_15.content)

				arg_63_1.text_.text = var_66_16

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_17 = 11
				local var_66_18 = utf8.len(var_66_16)
				local var_66_19 = var_66_17 <= 0 and var_66_13 or var_66_13 * (var_66_18 / var_66_17)

				if var_66_19 > 0 and var_66_13 < var_66_19 then
					arg_63_1.talkMaxDuration = var_66_19

					if var_66_19 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_12
					end
				end

				arg_63_1.text_.text = var_66_16
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661016", "story_v_out_319661.awb") ~= 0 then
					local var_66_20 = manager.audio:GetVoiceLength("story_v_out_319661", "319661016", "story_v_out_319661.awb") / 1000

					if var_66_20 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_12
					end

					if var_66_15.prefab_name ~= "" and arg_63_1.actors_[var_66_15.prefab_name] ~= nil then
						local var_66_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_15.prefab_name].transform, "story_v_out_319661", "319661016", "story_v_out_319661.awb")

						arg_63_1:RecordAudio("319661016", var_66_21)
						arg_63_1:RecordAudio("319661016", var_66_21)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_319661", "319661016", "story_v_out_319661.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_319661", "319661016", "story_v_out_319661.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_22 = math.max(var_66_13, arg_63_1.talkMaxDuration)

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_22 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_12) / var_66_22

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_12 + var_66_22 and arg_63_1.time_ < var_66_12 + var_66_22 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play319661017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319661017
		arg_67_1.duration_ = 10.2

		local var_67_0 = {
			zh = 6.166,
			ja = 10.2
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
				arg_67_0:Play319661018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_70_2 = arg_67_1.actors_["1084ui_story"]
			local var_70_3 = 0

			if var_70_3 < arg_67_1.time_ and arg_67_1.time_ <= var_70_3 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story == nil then
				arg_67_1.var_.characterEffect1084ui_story = var_70_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_4 = 0.200000002980232

			if var_70_3 <= arg_67_1.time_ and arg_67_1.time_ < var_70_3 + var_70_4 then
				local var_70_5 = (arg_67_1.time_ - var_70_3) / var_70_4

				if arg_67_1.var_.characterEffect1084ui_story then
					arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_3 + var_70_4 and arg_67_1.time_ < var_70_3 + var_70_4 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story then
				arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_70_6 = arg_67_1.actors_["10066ui_story"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story == nil then
				arg_67_1.var_.characterEffect10066ui_story = var_70_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_8 = 0.200000002980232

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.characterEffect10066ui_story then
					local var_70_10 = Mathf.Lerp(0, 0.5, var_70_9)

					arg_67_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10066ui_story.fillRatio = var_70_10
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story then
				local var_70_11 = 0.5

				arg_67_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10066ui_story.fillRatio = var_70_11
			end

			local var_70_12 = 0
			local var_70_13 = 0.7

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_14 = arg_67_1:FormatText(StoryNameCfg[6].name)

				arg_67_1.leftNameTxt_.text = var_70_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_15 = arg_67_1:GetWordFromCfg(319661017)
				local var_70_16 = arg_67_1:FormatText(var_70_15.content)

				arg_67_1.text_.text = var_70_16

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_17 = 28
				local var_70_18 = utf8.len(var_70_16)
				local var_70_19 = var_70_17 <= 0 and var_70_13 or var_70_13 * (var_70_18 / var_70_17)

				if var_70_19 > 0 and var_70_13 < var_70_19 then
					arg_67_1.talkMaxDuration = var_70_19

					if var_70_19 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_12
					end
				end

				arg_67_1.text_.text = var_70_16
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661017", "story_v_out_319661.awb") ~= 0 then
					local var_70_20 = manager.audio:GetVoiceLength("story_v_out_319661", "319661017", "story_v_out_319661.awb") / 1000

					if var_70_20 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_12
					end

					if var_70_15.prefab_name ~= "" and arg_67_1.actors_[var_70_15.prefab_name] ~= nil then
						local var_70_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_15.prefab_name].transform, "story_v_out_319661", "319661017", "story_v_out_319661.awb")

						arg_67_1:RecordAudio("319661017", var_70_21)
						arg_67_1:RecordAudio("319661017", var_70_21)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_319661", "319661017", "story_v_out_319661.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_319661", "319661017", "story_v_out_319661.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_22 = math.max(var_70_13, arg_67_1.talkMaxDuration)

			if var_70_12 <= arg_67_1.time_ and arg_67_1.time_ < var_70_12 + var_70_22 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_12) / var_70_22

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_12 + var_70_22 and arg_67_1.time_ < var_70_12 + var_70_22 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319661018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319661018
		arg_71_1.duration_ = 5.966

		local var_71_0 = {
			zh = 5.966,
			ja = 3.866
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
				arg_71_0:Play319661019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1084ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story == nil then
				arg_71_1.var_.characterEffect1084ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1084ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1084ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1084ui_story.fillRatio = var_74_5
			end

			local var_74_6 = arg_71_1.actors_["10066ui_story"]
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 and arg_71_1.var_.characterEffect10066ui_story == nil then
				arg_71_1.var_.characterEffect10066ui_story = var_74_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_8 = 0.200000002980232

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / var_74_8

				if arg_71_1.var_.characterEffect10066ui_story then
					arg_71_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 and arg_71_1.var_.characterEffect10066ui_story then
				arg_71_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_74_10 = 0
			local var_74_11 = 0.425

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_12 = arg_71_1:FormatText(StoryNameCfg[640].name)

				arg_71_1.leftNameTxt_.text = var_74_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_13 = arg_71_1:GetWordFromCfg(319661018)
				local var_74_14 = arg_71_1:FormatText(var_74_13.content)

				arg_71_1.text_.text = var_74_14

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_15 = 17
				local var_74_16 = utf8.len(var_74_14)
				local var_74_17 = var_74_15 <= 0 and var_74_11 or var_74_11 * (var_74_16 / var_74_15)

				if var_74_17 > 0 and var_74_11 < var_74_17 then
					arg_71_1.talkMaxDuration = var_74_17

					if var_74_17 + var_74_10 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_17 + var_74_10
					end
				end

				arg_71_1.text_.text = var_74_14
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661018", "story_v_out_319661.awb") ~= 0 then
					local var_74_18 = manager.audio:GetVoiceLength("story_v_out_319661", "319661018", "story_v_out_319661.awb") / 1000

					if var_74_18 + var_74_10 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_18 + var_74_10
					end

					if var_74_13.prefab_name ~= "" and arg_71_1.actors_[var_74_13.prefab_name] ~= nil then
						local var_74_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_13.prefab_name].transform, "story_v_out_319661", "319661018", "story_v_out_319661.awb")

						arg_71_1:RecordAudio("319661018", var_74_19)
						arg_71_1:RecordAudio("319661018", var_74_19)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_319661", "319661018", "story_v_out_319661.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_319661", "319661018", "story_v_out_319661.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_20 = math.max(var_74_11, arg_71_1.talkMaxDuration)

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_20 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_10) / var_74_20

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_10 + var_74_20 and arg_71_1.time_ < var_74_10 + var_74_20 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play319661019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319661019
		arg_75_1.duration_ = 8.366

		local var_75_0 = {
			zh = 8.366,
			ja = 8.2
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
				arg_75_0:Play319661020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.875

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[640].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(319661019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 35
				local var_78_6 = utf8.len(var_78_4)
				local var_78_7 = var_78_5 <= 0 and var_78_1 or var_78_1 * (var_78_6 / var_78_5)

				if var_78_7 > 0 and var_78_1 < var_78_7 then
					arg_75_1.talkMaxDuration = var_78_7

					if var_78_7 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_7 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_4
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661019", "story_v_out_319661.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_319661", "319661019", "story_v_out_319661.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_319661", "319661019", "story_v_out_319661.awb")

						arg_75_1:RecordAudio("319661019", var_78_9)
						arg_75_1:RecordAudio("319661019", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319661", "319661019", "story_v_out_319661.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319661", "319661019", "story_v_out_319661.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_10 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_10 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_10

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_10 and arg_75_1.time_ < var_78_0 + var_78_10 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play319661020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319661020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play319661021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10066ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect10066ui_story == nil then
				arg_79_1.var_.characterEffect10066ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect10066ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_79_1.var_.characterEffect10066ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect10066ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_79_1.var_.characterEffect10066ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_2")
			end

			local var_82_7 = 0
			local var_82_8 = 1.15

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(319661020)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 46
				local var_82_12 = utf8.len(var_82_10)
				local var_82_13 = var_82_11 <= 0 and var_82_8 or var_82_8 * (var_82_12 / var_82_11)

				if var_82_13 > 0 and var_82_8 < var_82_13 then
					arg_79_1.talkMaxDuration = var_82_13

					if var_82_13 + var_82_7 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_13 + var_82_7
					end
				end

				arg_79_1.text_.text = var_82_10
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_14 = math.max(var_82_8, arg_79_1.talkMaxDuration)

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_14 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_7) / var_82_14

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_7 + var_82_14 and arg_79_1.time_ < var_82_7 + var_82_14 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play319661021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319661021
		arg_83_1.duration_ = 8.433

		local var_83_0 = {
			zh = 8.433,
			ja = 8.1
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
				arg_83_0:Play319661022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10066ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect10066ui_story == nil then
				arg_83_1.var_.characterEffect10066ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect10066ui_story then
					arg_83_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect10066ui_story then
				arg_83_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_86_4 = 0

			if var_86_4 < arg_83_1.time_ and arg_83_1.time_ <= var_86_4 + arg_86_0 then
				arg_83_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action7_1")
			end

			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 then
				arg_83_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_86_6 = 0
			local var_86_7 = 0.625

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_8 = arg_83_1:FormatText(StoryNameCfg[640].name)

				arg_83_1.leftNameTxt_.text = var_86_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_9 = arg_83_1:GetWordFromCfg(319661021)
				local var_86_10 = arg_83_1:FormatText(var_86_9.content)

				arg_83_1.text_.text = var_86_10

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_11 = 25
				local var_86_12 = utf8.len(var_86_10)
				local var_86_13 = var_86_11 <= 0 and var_86_7 or var_86_7 * (var_86_12 / var_86_11)

				if var_86_13 > 0 and var_86_7 < var_86_13 then
					arg_83_1.talkMaxDuration = var_86_13

					if var_86_13 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_13 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_10
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661021", "story_v_out_319661.awb") ~= 0 then
					local var_86_14 = manager.audio:GetVoiceLength("story_v_out_319661", "319661021", "story_v_out_319661.awb") / 1000

					if var_86_14 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_14 + var_86_6
					end

					if var_86_9.prefab_name ~= "" and arg_83_1.actors_[var_86_9.prefab_name] ~= nil then
						local var_86_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_9.prefab_name].transform, "story_v_out_319661", "319661021", "story_v_out_319661.awb")

						arg_83_1:RecordAudio("319661021", var_86_15)
						arg_83_1:RecordAudio("319661021", var_86_15)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_319661", "319661021", "story_v_out_319661.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_319661", "319661021", "story_v_out_319661.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_16 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_16 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_16

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_16 and arg_83_1.time_ < var_86_6 + var_86_16 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play319661022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319661022
		arg_87_1.duration_ = 3.833

		local var_87_0 = {
			zh = 2.6,
			ja = 3.833
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
				arg_87_0:Play319661023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1084ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1084ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(-0.7, -0.97, -6)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1084ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1084ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story == nil then
				arg_87_1.var_.characterEffect1084ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect1084ui_story then
					arg_87_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story then
				arg_87_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_90_13 = arg_87_1.actors_["10066ui_story"]
			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 and arg_87_1.var_.characterEffect10066ui_story == nil then
				arg_87_1.var_.characterEffect10066ui_story = var_90_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_15 = 0.200000002980232

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15

				if arg_87_1.var_.characterEffect10066ui_story then
					local var_90_17 = Mathf.Lerp(0, 0.5, var_90_16)

					arg_87_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_87_1.var_.characterEffect10066ui_story.fillRatio = var_90_17
				end
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 and arg_87_1.var_.characterEffect10066ui_story then
				local var_90_18 = 0.5

				arg_87_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_87_1.var_.characterEffect10066ui_story.fillRatio = var_90_18
			end

			local var_90_19 = 0
			local var_90_20 = 0.3

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_21 = arg_87_1:FormatText(StoryNameCfg[6].name)

				arg_87_1.leftNameTxt_.text = var_90_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_22 = arg_87_1:GetWordFromCfg(319661022)
				local var_90_23 = arg_87_1:FormatText(var_90_22.content)

				arg_87_1.text_.text = var_90_23

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_24 = 12
				local var_90_25 = utf8.len(var_90_23)
				local var_90_26 = var_90_24 <= 0 and var_90_20 or var_90_20 * (var_90_25 / var_90_24)

				if var_90_26 > 0 and var_90_20 < var_90_26 then
					arg_87_1.talkMaxDuration = var_90_26

					if var_90_26 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_26 + var_90_19
					end
				end

				arg_87_1.text_.text = var_90_23
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661022", "story_v_out_319661.awb") ~= 0 then
					local var_90_27 = manager.audio:GetVoiceLength("story_v_out_319661", "319661022", "story_v_out_319661.awb") / 1000

					if var_90_27 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_19
					end

					if var_90_22.prefab_name ~= "" and arg_87_1.actors_[var_90_22.prefab_name] ~= nil then
						local var_90_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_22.prefab_name].transform, "story_v_out_319661", "319661022", "story_v_out_319661.awb")

						arg_87_1:RecordAudio("319661022", var_90_28)
						arg_87_1:RecordAudio("319661022", var_90_28)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319661", "319661022", "story_v_out_319661.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319661", "319661022", "story_v_out_319661.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_29 = math.max(var_90_20, arg_87_1.talkMaxDuration)

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_29 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_19) / var_90_29

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_19 + var_90_29 and arg_87_1.time_ < var_90_19 + var_90_29 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319661023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319661023
		arg_91_1.duration_ = 6.4

		local var_91_0 = {
			zh = 4.2,
			ja = 6.4
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
				arg_91_0:Play319661024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1084ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story == nil then
				arg_91_1.var_.characterEffect1084ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1084ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_5
			end

			local var_94_6 = arg_91_1.actors_["10066ui_story"]
			local var_94_7 = 0

			if var_94_7 < arg_91_1.time_ and arg_91_1.time_ <= var_94_7 + arg_94_0 and arg_91_1.var_.characterEffect10066ui_story == nil then
				arg_91_1.var_.characterEffect10066ui_story = var_94_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_8 = 0.200000002980232

			if var_94_7 <= arg_91_1.time_ and arg_91_1.time_ < var_94_7 + var_94_8 then
				local var_94_9 = (arg_91_1.time_ - var_94_7) / var_94_8

				if arg_91_1.var_.characterEffect10066ui_story then
					arg_91_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_7 + var_94_8 and arg_91_1.time_ < var_94_7 + var_94_8 + arg_94_0 and arg_91_1.var_.characterEffect10066ui_story then
				arg_91_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_94_10 = 0
			local var_94_11 = 0.425

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_12 = arg_91_1:FormatText(StoryNameCfg[640].name)

				arg_91_1.leftNameTxt_.text = var_94_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_13 = arg_91_1:GetWordFromCfg(319661023)
				local var_94_14 = arg_91_1:FormatText(var_94_13.content)

				arg_91_1.text_.text = var_94_14

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_15 = 17
				local var_94_16 = utf8.len(var_94_14)
				local var_94_17 = var_94_15 <= 0 and var_94_11 or var_94_11 * (var_94_16 / var_94_15)

				if var_94_17 > 0 and var_94_11 < var_94_17 then
					arg_91_1.talkMaxDuration = var_94_17

					if var_94_17 + var_94_10 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_17 + var_94_10
					end
				end

				arg_91_1.text_.text = var_94_14
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661023", "story_v_out_319661.awb") ~= 0 then
					local var_94_18 = manager.audio:GetVoiceLength("story_v_out_319661", "319661023", "story_v_out_319661.awb") / 1000

					if var_94_18 + var_94_10 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_18 + var_94_10
					end

					if var_94_13.prefab_name ~= "" and arg_91_1.actors_[var_94_13.prefab_name] ~= nil then
						local var_94_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_13.prefab_name].transform, "story_v_out_319661", "319661023", "story_v_out_319661.awb")

						arg_91_1:RecordAudio("319661023", var_94_19)
						arg_91_1:RecordAudio("319661023", var_94_19)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319661", "319661023", "story_v_out_319661.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319661", "319661023", "story_v_out_319661.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_20 = math.max(var_94_11, arg_91_1.talkMaxDuration)

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_20 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_10) / var_94_20

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_10 + var_94_20 and arg_91_1.time_ < var_94_10 + var_94_20 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319661024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319661024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play319661025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1084ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story == nil then
				arg_95_1.var_.characterEffect1084ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1084ui_story then
					arg_95_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story then
				arg_95_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_98_4 = arg_95_1.actors_["10066ui_story"]
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 and arg_95_1.var_.characterEffect10066ui_story == nil then
				arg_95_1.var_.characterEffect10066ui_story = var_98_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_6 = 0.200000002980232

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6

				if arg_95_1.var_.characterEffect10066ui_story then
					local var_98_8 = Mathf.Lerp(0, 0.5, var_98_7)

					arg_95_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10066ui_story.fillRatio = var_98_8
				end
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 and arg_95_1.var_.characterEffect10066ui_story then
				local var_98_9 = 0.5

				arg_95_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10066ui_story.fillRatio = var_98_9
			end

			local var_98_10 = arg_95_1.actors_["1084ui_story"].transform
			local var_98_11 = 0

			if var_98_11 < arg_95_1.time_ and arg_95_1.time_ <= var_98_11 + arg_98_0 then
				arg_95_1.var_.moveOldPos1084ui_story = var_98_10.localPosition
			end

			local var_98_12 = 0.001

			if var_98_11 <= arg_95_1.time_ and arg_95_1.time_ < var_98_11 + var_98_12 then
				local var_98_13 = (arg_95_1.time_ - var_98_11) / var_98_12
				local var_98_14 = Vector3.New(0, 100, 0)

				var_98_10.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1084ui_story, var_98_14, var_98_13)

				local var_98_15 = manager.ui.mainCamera.transform.position - var_98_10.position

				var_98_10.forward = Vector3.New(var_98_15.x, var_98_15.y, var_98_15.z)

				local var_98_16 = var_98_10.localEulerAngles

				var_98_16.z = 0
				var_98_16.x = 0
				var_98_10.localEulerAngles = var_98_16
			end

			if arg_95_1.time_ >= var_98_11 + var_98_12 and arg_95_1.time_ < var_98_11 + var_98_12 + arg_98_0 then
				var_98_10.localPosition = Vector3.New(0, 100, 0)

				local var_98_17 = manager.ui.mainCamera.transform.position - var_98_10.position

				var_98_10.forward = Vector3.New(var_98_17.x, var_98_17.y, var_98_17.z)

				local var_98_18 = var_98_10.localEulerAngles

				var_98_18.z = 0
				var_98_18.x = 0
				var_98_10.localEulerAngles = var_98_18
			end

			local var_98_19 = arg_95_1.actors_["10066ui_story"].transform
			local var_98_20 = 0

			if var_98_20 < arg_95_1.time_ and arg_95_1.time_ <= var_98_20 + arg_98_0 then
				arg_95_1.var_.moveOldPos10066ui_story = var_98_19.localPosition
			end

			local var_98_21 = 0.001

			if var_98_20 <= arg_95_1.time_ and arg_95_1.time_ < var_98_20 + var_98_21 then
				local var_98_22 = (arg_95_1.time_ - var_98_20) / var_98_21
				local var_98_23 = Vector3.New(0, 100, 0)

				var_98_19.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10066ui_story, var_98_23, var_98_22)

				local var_98_24 = manager.ui.mainCamera.transform.position - var_98_19.position

				var_98_19.forward = Vector3.New(var_98_24.x, var_98_24.y, var_98_24.z)

				local var_98_25 = var_98_19.localEulerAngles

				var_98_25.z = 0
				var_98_25.x = 0
				var_98_19.localEulerAngles = var_98_25
			end

			if arg_95_1.time_ >= var_98_20 + var_98_21 and arg_95_1.time_ < var_98_20 + var_98_21 + arg_98_0 then
				var_98_19.localPosition = Vector3.New(0, 100, 0)

				local var_98_26 = manager.ui.mainCamera.transform.position - var_98_19.position

				var_98_19.forward = Vector3.New(var_98_26.x, var_98_26.y, var_98_26.z)

				local var_98_27 = var_98_19.localEulerAngles

				var_98_27.z = 0
				var_98_27.x = 0
				var_98_19.localEulerAngles = var_98_27
			end

			local var_98_28 = 0
			local var_98_29 = 0.333333333333333

			if var_98_28 < arg_95_1.time_ and arg_95_1.time_ <= var_98_28 + arg_98_0 then
				local var_98_30 = "play"
				local var_98_31 = "effect"

				arg_95_1:AudioAction(var_98_30, var_98_31, "se_story_activity_1_4_3", "se_story_activity_1_4_3_door", "")
			end

			local var_98_32 = 0
			local var_98_33 = 1.125

			if var_98_32 < arg_95_1.time_ and arg_95_1.time_ <= var_98_32 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_34 = arg_95_1:GetWordFromCfg(319661024)
				local var_98_35 = arg_95_1:FormatText(var_98_34.content)

				arg_95_1.text_.text = var_98_35

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_36 = 45
				local var_98_37 = utf8.len(var_98_35)
				local var_98_38 = var_98_36 <= 0 and var_98_33 or var_98_33 * (var_98_37 / var_98_36)

				if var_98_38 > 0 and var_98_33 < var_98_38 then
					arg_95_1.talkMaxDuration = var_98_38

					if var_98_38 + var_98_32 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_38 + var_98_32
					end
				end

				arg_95_1.text_.text = var_98_35
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_39 = math.max(var_98_33, arg_95_1.talkMaxDuration)

			if var_98_32 <= arg_95_1.time_ and arg_95_1.time_ < var_98_32 + var_98_39 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_32) / var_98_39

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_32 + var_98_39 and arg_95_1.time_ < var_98_32 + var_98_39 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319661025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319661025
		arg_99_1.duration_ = 2.5

		local var_99_0 = {
			zh = 1.3,
			ja = 2.5
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
				arg_99_0:Play319661026(arg_99_1)
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
					arg_99_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story then
				arg_99_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_102_4 = arg_99_1.actors_["10066ui_story"]
			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 and arg_99_1.var_.characterEffect10066ui_story == nil then
				arg_99_1.var_.characterEffect10066ui_story = var_102_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_6 = 0.200000002980232

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_5) / var_102_6

				if arg_99_1.var_.characterEffect10066ui_story then
					local var_102_8 = Mathf.Lerp(0, 0.5, var_102_7)

					arg_99_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_99_1.var_.characterEffect10066ui_story.fillRatio = var_102_8
				end
			end

			if arg_99_1.time_ >= var_102_5 + var_102_6 and arg_99_1.time_ < var_102_5 + var_102_6 + arg_102_0 and arg_99_1.var_.characterEffect10066ui_story then
				local var_102_9 = 0.5

				arg_99_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_99_1.var_.characterEffect10066ui_story.fillRatio = var_102_9
			end

			local var_102_10 = arg_99_1.actors_["1084ui_story"].transform
			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1.var_.moveOldPos1084ui_story = var_102_10.localPosition
			end

			local var_102_12 = 0.001

			if var_102_11 <= arg_99_1.time_ and arg_99_1.time_ < var_102_11 + var_102_12 then
				local var_102_13 = (arg_99_1.time_ - var_102_11) / var_102_12
				local var_102_14 = Vector3.New(0, -0.97, -6)

				var_102_10.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1084ui_story, var_102_14, var_102_13)

				local var_102_15 = manager.ui.mainCamera.transform.position - var_102_10.position

				var_102_10.forward = Vector3.New(var_102_15.x, var_102_15.y, var_102_15.z)

				local var_102_16 = var_102_10.localEulerAngles

				var_102_16.z = 0
				var_102_16.x = 0
				var_102_10.localEulerAngles = var_102_16
			end

			if arg_99_1.time_ >= var_102_11 + var_102_12 and arg_99_1.time_ < var_102_11 + var_102_12 + arg_102_0 then
				var_102_10.localPosition = Vector3.New(0, -0.97, -6)

				local var_102_17 = manager.ui.mainCamera.transform.position - var_102_10.position

				var_102_10.forward = Vector3.New(var_102_17.x, var_102_17.y, var_102_17.z)

				local var_102_18 = var_102_10.localEulerAngles

				var_102_18.z = 0
				var_102_18.x = 0
				var_102_10.localEulerAngles = var_102_18
			end

			local var_102_19 = 0
			local var_102_20 = 0.125

			if var_102_19 < arg_99_1.time_ and arg_99_1.time_ <= var_102_19 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_21 = arg_99_1:FormatText(StoryNameCfg[6].name)

				arg_99_1.leftNameTxt_.text = var_102_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_22 = arg_99_1:GetWordFromCfg(319661025)
				local var_102_23 = arg_99_1:FormatText(var_102_22.content)

				arg_99_1.text_.text = var_102_23

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_24 = 5
				local var_102_25 = utf8.len(var_102_23)
				local var_102_26 = var_102_24 <= 0 and var_102_20 or var_102_20 * (var_102_25 / var_102_24)

				if var_102_26 > 0 and var_102_20 < var_102_26 then
					arg_99_1.talkMaxDuration = var_102_26

					if var_102_26 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_26 + var_102_19
					end
				end

				arg_99_1.text_.text = var_102_23
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661025", "story_v_out_319661.awb") ~= 0 then
					local var_102_27 = manager.audio:GetVoiceLength("story_v_out_319661", "319661025", "story_v_out_319661.awb") / 1000

					if var_102_27 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_27 + var_102_19
					end

					if var_102_22.prefab_name ~= "" and arg_99_1.actors_[var_102_22.prefab_name] ~= nil then
						local var_102_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_22.prefab_name].transform, "story_v_out_319661", "319661025", "story_v_out_319661.awb")

						arg_99_1:RecordAudio("319661025", var_102_28)
						arg_99_1:RecordAudio("319661025", var_102_28)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_319661", "319661025", "story_v_out_319661.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_319661", "319661025", "story_v_out_319661.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_29 = math.max(var_102_20, arg_99_1.talkMaxDuration)

			if var_102_19 <= arg_99_1.time_ and arg_99_1.time_ < var_102_19 + var_102_29 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_19) / var_102_29

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_19 + var_102_29 and arg_99_1.time_ < var_102_19 + var_102_29 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play319661026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319661026
		arg_103_1.duration_ = 2.666

		local var_103_0 = {
			zh = 2.033,
			ja = 2.666
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
				arg_103_0:Play319661027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10066ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10066ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0.7, -0.99, -5.83)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10066ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["10066ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect10066ui_story == nil then
				arg_103_1.var_.characterEffect10066ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect10066ui_story then
					arg_103_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect10066ui_story then
				arg_103_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_106_13 = arg_103_1.actors_["1084ui_story"].transform
			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1.var_.moveOldPos1084ui_story = var_106_13.localPosition
			end

			local var_106_15 = 0.001

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_15 then
				local var_106_16 = (arg_103_1.time_ - var_106_14) / var_106_15
				local var_106_17 = Vector3.New(-0.7, -0.97, -6)

				var_106_13.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1084ui_story, var_106_17, var_106_16)

				local var_106_18 = manager.ui.mainCamera.transform.position - var_106_13.position

				var_106_13.forward = Vector3.New(var_106_18.x, var_106_18.y, var_106_18.z)

				local var_106_19 = var_106_13.localEulerAngles

				var_106_19.z = 0
				var_106_19.x = 0
				var_106_13.localEulerAngles = var_106_19
			end

			if arg_103_1.time_ >= var_106_14 + var_106_15 and arg_103_1.time_ < var_106_14 + var_106_15 + arg_106_0 then
				var_106_13.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_106_20 = manager.ui.mainCamera.transform.position - var_106_13.position

				var_106_13.forward = Vector3.New(var_106_20.x, var_106_20.y, var_106_20.z)

				local var_106_21 = var_106_13.localEulerAngles

				var_106_21.z = 0
				var_106_21.x = 0
				var_106_13.localEulerAngles = var_106_21
			end

			local var_106_22 = arg_103_1.actors_["1084ui_story"]
			local var_106_23 = 0

			if var_106_23 < arg_103_1.time_ and arg_103_1.time_ <= var_106_23 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story == nil then
				arg_103_1.var_.characterEffect1084ui_story = var_106_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_24 = 0.200000002980232

			if var_106_23 <= arg_103_1.time_ and arg_103_1.time_ < var_106_23 + var_106_24 then
				local var_106_25 = (arg_103_1.time_ - var_106_23) / var_106_24

				if arg_103_1.var_.characterEffect1084ui_story then
					local var_106_26 = Mathf.Lerp(0, 0.5, var_106_25)

					arg_103_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1084ui_story.fillRatio = var_106_26
				end
			end

			if arg_103_1.time_ >= var_106_23 + var_106_24 and arg_103_1.time_ < var_106_23 + var_106_24 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story then
				local var_106_27 = 0.5

				arg_103_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1084ui_story.fillRatio = var_106_27
			end

			local var_106_28 = 0
			local var_106_29 = 0.125

			if var_106_28 < arg_103_1.time_ and arg_103_1.time_ <= var_106_28 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_30 = arg_103_1:FormatText(StoryNameCfg[640].name)

				arg_103_1.leftNameTxt_.text = var_106_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_31 = arg_103_1:GetWordFromCfg(319661026)
				local var_106_32 = arg_103_1:FormatText(var_106_31.content)

				arg_103_1.text_.text = var_106_32

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_33 = 5
				local var_106_34 = utf8.len(var_106_32)
				local var_106_35 = var_106_33 <= 0 and var_106_29 or var_106_29 * (var_106_34 / var_106_33)

				if var_106_35 > 0 and var_106_29 < var_106_35 then
					arg_103_1.talkMaxDuration = var_106_35

					if var_106_35 + var_106_28 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_35 + var_106_28
					end
				end

				arg_103_1.text_.text = var_106_32
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661026", "story_v_out_319661.awb") ~= 0 then
					local var_106_36 = manager.audio:GetVoiceLength("story_v_out_319661", "319661026", "story_v_out_319661.awb") / 1000

					if var_106_36 + var_106_28 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_36 + var_106_28
					end

					if var_106_31.prefab_name ~= "" and arg_103_1.actors_[var_106_31.prefab_name] ~= nil then
						local var_106_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_31.prefab_name].transform, "story_v_out_319661", "319661026", "story_v_out_319661.awb")

						arg_103_1:RecordAudio("319661026", var_106_37)
						arg_103_1:RecordAudio("319661026", var_106_37)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_319661", "319661026", "story_v_out_319661.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_319661", "319661026", "story_v_out_319661.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_38 = math.max(var_106_29, arg_103_1.talkMaxDuration)

			if var_106_28 <= arg_103_1.time_ and arg_103_1.time_ < var_106_28 + var_106_38 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_28) / var_106_38

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_28 + var_106_38 and arg_103_1.time_ < var_106_28 + var_106_38 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play319661027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319661027
		arg_107_1.duration_ = 2.69933333333333

		local var_107_0 = {
			zh = 2.63333333333333,
			ja = 2.69933333333333
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
				arg_107_0:Play319661028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = "1095ui_story"

			if arg_107_1.actors_[var_110_0] == nil then
				local var_110_1 = Object.Instantiate(Asset.Load("Char/" .. var_110_0), arg_107_1.stage_.transform)

				var_110_1.name = var_110_0
				var_110_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_107_1.actors_[var_110_0] = var_110_1

				local var_110_2 = var_110_1:GetComponentInChildren(typeof(CharacterEffect))

				var_110_2.enabled = true

				local var_110_3 = GameObjectTools.GetOrAddComponent(var_110_1, typeof(DynamicBoneHelper))

				if var_110_3 then
					var_110_3:EnableDynamicBone(false)
				end

				arg_107_1:ShowWeapon(var_110_2.transform, false)

				arg_107_1.var_[var_110_0 .. "Animator"] = var_110_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_107_1.var_[var_110_0 .. "Animator"].applyRootMotion = true
				arg_107_1.var_[var_110_0 .. "LipSync"] = var_110_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_110_4 = arg_107_1.actors_["1095ui_story"].transform
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 then
				arg_107_1.var_.moveOldPos1095ui_story = var_110_4.localPosition
			end

			local var_110_6 = 0.001

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6
				local var_110_8 = Vector3.New(0, -0.98, -6.1)

				var_110_4.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1095ui_story, var_110_8, var_110_7)

				local var_110_9 = manager.ui.mainCamera.transform.position - var_110_4.position

				var_110_4.forward = Vector3.New(var_110_9.x, var_110_9.y, var_110_9.z)

				local var_110_10 = var_110_4.localEulerAngles

				var_110_10.z = 0
				var_110_10.x = 0
				var_110_4.localEulerAngles = var_110_10
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 then
				var_110_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_110_11 = manager.ui.mainCamera.transform.position - var_110_4.position

				var_110_4.forward = Vector3.New(var_110_11.x, var_110_11.y, var_110_11.z)

				local var_110_12 = var_110_4.localEulerAngles

				var_110_12.z = 0
				var_110_12.x = 0
				var_110_4.localEulerAngles = var_110_12
			end

			local var_110_13 = arg_107_1.actors_["1095ui_story"]
			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 and arg_107_1.var_.characterEffect1095ui_story == nil then
				arg_107_1.var_.characterEffect1095ui_story = var_110_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_15 = 0.200000002980232

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_15 then
				local var_110_16 = (arg_107_1.time_ - var_110_14) / var_110_15

				if arg_107_1.var_.characterEffect1095ui_story then
					arg_107_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_14 + var_110_15 and arg_107_1.time_ < var_110_14 + var_110_15 + arg_110_0 and arg_107_1.var_.characterEffect1095ui_story then
				arg_107_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_110_17 = 0

			if var_110_17 < arg_107_1.time_ and arg_107_1.time_ <= var_110_17 + arg_110_0 then
				arg_107_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_110_18 = 0

			if var_110_18 < arg_107_1.time_ and arg_107_1.time_ <= var_110_18 + arg_110_0 then
				arg_107_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_19 = arg_107_1.actors_["10066ui_story"].transform
			local var_110_20 = 0

			if var_110_20 < arg_107_1.time_ and arg_107_1.time_ <= var_110_20 + arg_110_0 then
				arg_107_1.var_.moveOldPos10066ui_story = var_110_19.localPosition
			end

			local var_110_21 = 0.001

			if var_110_20 <= arg_107_1.time_ and arg_107_1.time_ < var_110_20 + var_110_21 then
				local var_110_22 = (arg_107_1.time_ - var_110_20) / var_110_21
				local var_110_23 = Vector3.New(0, 100, 0)

				var_110_19.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10066ui_story, var_110_23, var_110_22)

				local var_110_24 = manager.ui.mainCamera.transform.position - var_110_19.position

				var_110_19.forward = Vector3.New(var_110_24.x, var_110_24.y, var_110_24.z)

				local var_110_25 = var_110_19.localEulerAngles

				var_110_25.z = 0
				var_110_25.x = 0
				var_110_19.localEulerAngles = var_110_25
			end

			if arg_107_1.time_ >= var_110_20 + var_110_21 and arg_107_1.time_ < var_110_20 + var_110_21 + arg_110_0 then
				var_110_19.localPosition = Vector3.New(0, 100, 0)

				local var_110_26 = manager.ui.mainCamera.transform.position - var_110_19.position

				var_110_19.forward = Vector3.New(var_110_26.x, var_110_26.y, var_110_26.z)

				local var_110_27 = var_110_19.localEulerAngles

				var_110_27.z = 0
				var_110_27.x = 0
				var_110_19.localEulerAngles = var_110_27
			end

			local var_110_28 = arg_107_1.actors_["10066ui_story"]
			local var_110_29 = 0

			if var_110_29 < arg_107_1.time_ and arg_107_1.time_ <= var_110_29 + arg_110_0 and arg_107_1.var_.characterEffect10066ui_story == nil then
				arg_107_1.var_.characterEffect10066ui_story = var_110_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_30 = 0.200000002980232

			if var_110_29 <= arg_107_1.time_ and arg_107_1.time_ < var_110_29 + var_110_30 then
				local var_110_31 = (arg_107_1.time_ - var_110_29) / var_110_30

				if arg_107_1.var_.characterEffect10066ui_story then
					local var_110_32 = Mathf.Lerp(0, 0.5, var_110_31)

					arg_107_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_107_1.var_.characterEffect10066ui_story.fillRatio = var_110_32
				end
			end

			if arg_107_1.time_ >= var_110_29 + var_110_30 and arg_107_1.time_ < var_110_29 + var_110_30 + arg_110_0 and arg_107_1.var_.characterEffect10066ui_story then
				local var_110_33 = 0.5

				arg_107_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_107_1.var_.characterEffect10066ui_story.fillRatio = var_110_33
			end

			local var_110_34 = arg_107_1.actors_["1084ui_story"].transform
			local var_110_35 = 0

			if var_110_35 < arg_107_1.time_ and arg_107_1.time_ <= var_110_35 + arg_110_0 then
				arg_107_1.var_.moveOldPos1084ui_story = var_110_34.localPosition
			end

			local var_110_36 = 0.001

			if var_110_35 <= arg_107_1.time_ and arg_107_1.time_ < var_110_35 + var_110_36 then
				local var_110_37 = (arg_107_1.time_ - var_110_35) / var_110_36
				local var_110_38 = Vector3.New(0, 100, 0)

				var_110_34.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1084ui_story, var_110_38, var_110_37)

				local var_110_39 = manager.ui.mainCamera.transform.position - var_110_34.position

				var_110_34.forward = Vector3.New(var_110_39.x, var_110_39.y, var_110_39.z)

				local var_110_40 = var_110_34.localEulerAngles

				var_110_40.z = 0
				var_110_40.x = 0
				var_110_34.localEulerAngles = var_110_40
			end

			if arg_107_1.time_ >= var_110_35 + var_110_36 and arg_107_1.time_ < var_110_35 + var_110_36 + arg_110_0 then
				var_110_34.localPosition = Vector3.New(0, 100, 0)

				local var_110_41 = manager.ui.mainCamera.transform.position - var_110_34.position

				var_110_34.forward = Vector3.New(var_110_41.x, var_110_41.y, var_110_41.z)

				local var_110_42 = var_110_34.localEulerAngles

				var_110_42.z = 0
				var_110_42.x = 0
				var_110_34.localEulerAngles = var_110_42
			end

			local var_110_43 = arg_107_1.actors_["1084ui_story"]
			local var_110_44 = 0

			if var_110_44 < arg_107_1.time_ and arg_107_1.time_ <= var_110_44 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story == nil then
				arg_107_1.var_.characterEffect1084ui_story = var_110_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_45 = 0.200000002980232

			if var_110_44 <= arg_107_1.time_ and arg_107_1.time_ < var_110_44 + var_110_45 then
				local var_110_46 = (arg_107_1.time_ - var_110_44) / var_110_45

				if arg_107_1.var_.characterEffect1084ui_story then
					local var_110_47 = Mathf.Lerp(0, 0.5, var_110_46)

					arg_107_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1084ui_story.fillRatio = var_110_47
				end
			end

			if arg_107_1.time_ >= var_110_44 + var_110_45 and arg_107_1.time_ < var_110_44 + var_110_45 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story then
				local var_110_48 = 0.5

				arg_107_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1084ui_story.fillRatio = var_110_48
			end

			if arg_107_1.frameCnt_ <= 1 then
				arg_107_1.dialog_:SetActive(false)
			end

			local var_110_49 = 0.533333333333333
			local var_110_50 = 0.3

			if var_110_49 < arg_107_1.time_ and arg_107_1.time_ <= var_110_49 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0

				arg_107_1.dialog_:SetActive(true)

				local var_110_51 = LeanTween.value(arg_107_1.dialog_, 0, 1, 0.3)

				var_110_51:setOnUpdate(LuaHelper.FloatAction(function(arg_111_0)
					arg_107_1.dialogCg_.alpha = arg_111_0
				end))
				var_110_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_107_1.dialog_)
					var_110_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_107_1.duration_ = arg_107_1.duration_ + 0.3

				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_52 = arg_107_1:FormatText(StoryNameCfg[471].name)

				arg_107_1.leftNameTxt_.text = var_110_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_53 = arg_107_1:GetWordFromCfg(319661027)
				local var_110_54 = arg_107_1:FormatText(var_110_53.content)

				arg_107_1.text_.text = var_110_54

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_55 = 12
				local var_110_56 = utf8.len(var_110_54)
				local var_110_57 = var_110_55 <= 0 and var_110_50 or var_110_50 * (var_110_56 / var_110_55)

				if var_110_57 > 0 and var_110_50 < var_110_57 then
					arg_107_1.talkMaxDuration = var_110_57
					var_110_49 = var_110_49 + 0.3

					if var_110_57 + var_110_49 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_57 + var_110_49
					end
				end

				arg_107_1.text_.text = var_110_54
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661027", "story_v_out_319661.awb") ~= 0 then
					local var_110_58 = manager.audio:GetVoiceLength("story_v_out_319661", "319661027", "story_v_out_319661.awb") / 1000

					if var_110_58 + var_110_49 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_58 + var_110_49
					end

					if var_110_53.prefab_name ~= "" and arg_107_1.actors_[var_110_53.prefab_name] ~= nil then
						local var_110_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_53.prefab_name].transform, "story_v_out_319661", "319661027", "story_v_out_319661.awb")

						arg_107_1:RecordAudio("319661027", var_110_59)
						arg_107_1:RecordAudio("319661027", var_110_59)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_319661", "319661027", "story_v_out_319661.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_319661", "319661027", "story_v_out_319661.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_60 = var_110_49 + 0.3
			local var_110_61 = math.max(var_110_50, arg_107_1.talkMaxDuration)

			if var_110_60 <= arg_107_1.time_ and arg_107_1.time_ < var_110_60 + var_110_61 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_60) / var_110_61

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_60 + var_110_61 and arg_107_1.time_ < var_110_60 + var_110_61 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play319661028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319661028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play319661029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1095ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1095ui_story == nil then
				arg_113_1.var_.characterEffect1095ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1095ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1095ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1095ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1095ui_story.fillRatio = var_116_5
			end

			local var_116_6 = 0
			local var_116_7 = 1.325

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_8 = arg_113_1:GetWordFromCfg(319661028)
				local var_116_9 = arg_113_1:FormatText(var_116_8.content)

				arg_113_1.text_.text = var_116_9

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_10 = 53
				local var_116_11 = utf8.len(var_116_9)
				local var_116_12 = var_116_10 <= 0 and var_116_7 or var_116_7 * (var_116_11 / var_116_10)

				if var_116_12 > 0 and var_116_7 < var_116_12 then
					arg_113_1.talkMaxDuration = var_116_12

					if var_116_12 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_12 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_9
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_13 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_13 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_13

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_13 and arg_113_1.time_ < var_116_6 + var_116_13 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319661029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319661029
		arg_117_1.duration_ = 7.933

		local var_117_0 = {
			zh = 4.133,
			ja = 7.933
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
				arg_117_0:Play319661030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10066ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos10066ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0.7, -0.99, -5.83)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos10066ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["10066ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and arg_117_1.var_.characterEffect10066ui_story == nil then
				arg_117_1.var_.characterEffect10066ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect10066ui_story then
					arg_117_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and arg_117_1.var_.characterEffect10066ui_story then
				arg_117_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_120_13 = 0

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action7_2")
			end

			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_120_15 = arg_117_1.actors_["1095ui_story"].transform
			local var_120_16 = 0

			if var_120_16 < arg_117_1.time_ and arg_117_1.time_ <= var_120_16 + arg_120_0 then
				arg_117_1.var_.moveOldPos1095ui_story = var_120_15.localPosition
			end

			local var_120_17 = 0.001

			if var_120_16 <= arg_117_1.time_ and arg_117_1.time_ < var_120_16 + var_120_17 then
				local var_120_18 = (arg_117_1.time_ - var_120_16) / var_120_17
				local var_120_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_120_15.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1095ui_story, var_120_19, var_120_18)

				local var_120_20 = manager.ui.mainCamera.transform.position - var_120_15.position

				var_120_15.forward = Vector3.New(var_120_20.x, var_120_20.y, var_120_20.z)

				local var_120_21 = var_120_15.localEulerAngles

				var_120_21.z = 0
				var_120_21.x = 0
				var_120_15.localEulerAngles = var_120_21
			end

			if arg_117_1.time_ >= var_120_16 + var_120_17 and arg_117_1.time_ < var_120_16 + var_120_17 + arg_120_0 then
				var_120_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_120_22 = manager.ui.mainCamera.transform.position - var_120_15.position

				var_120_15.forward = Vector3.New(var_120_22.x, var_120_22.y, var_120_22.z)

				local var_120_23 = var_120_15.localEulerAngles

				var_120_23.z = 0
				var_120_23.x = 0
				var_120_15.localEulerAngles = var_120_23
			end

			local var_120_24 = 0
			local var_120_25 = 0.325

			if var_120_24 < arg_117_1.time_ and arg_117_1.time_ <= var_120_24 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_26 = arg_117_1:FormatText(StoryNameCfg[640].name)

				arg_117_1.leftNameTxt_.text = var_120_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_27 = arg_117_1:GetWordFromCfg(319661029)
				local var_120_28 = arg_117_1:FormatText(var_120_27.content)

				arg_117_1.text_.text = var_120_28

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_29 = 13
				local var_120_30 = utf8.len(var_120_28)
				local var_120_31 = var_120_29 <= 0 and var_120_25 or var_120_25 * (var_120_30 / var_120_29)

				if var_120_31 > 0 and var_120_25 < var_120_31 then
					arg_117_1.talkMaxDuration = var_120_31

					if var_120_31 + var_120_24 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_31 + var_120_24
					end
				end

				arg_117_1.text_.text = var_120_28
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661029", "story_v_out_319661.awb") ~= 0 then
					local var_120_32 = manager.audio:GetVoiceLength("story_v_out_319661", "319661029", "story_v_out_319661.awb") / 1000

					if var_120_32 + var_120_24 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_32 + var_120_24
					end

					if var_120_27.prefab_name ~= "" and arg_117_1.actors_[var_120_27.prefab_name] ~= nil then
						local var_120_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_27.prefab_name].transform, "story_v_out_319661", "319661029", "story_v_out_319661.awb")

						arg_117_1:RecordAudio("319661029", var_120_33)
						arg_117_1:RecordAudio("319661029", var_120_33)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_319661", "319661029", "story_v_out_319661.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_319661", "319661029", "story_v_out_319661.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_34 = math.max(var_120_25, arg_117_1.talkMaxDuration)

			if var_120_24 <= arg_117_1.time_ and arg_117_1.time_ < var_120_24 + var_120_34 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_24) / var_120_34

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_24 + var_120_34 and arg_117_1.time_ < var_120_24 + var_120_34 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319661030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319661030
		arg_121_1.duration_ = 10.066

		local var_121_0 = {
			zh = 6.2,
			ja = 10.066
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
				arg_121_0:Play319661031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10066ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect10066ui_story == nil then
				arg_121_1.var_.characterEffect10066ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.200000002980232

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect10066ui_story then
					local var_124_4 = Mathf.Lerp(0, 0.5, var_124_3)

					arg_121_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_121_1.var_.characterEffect10066ui_story.fillRatio = var_124_4
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect10066ui_story then
				local var_124_5 = 0.5

				arg_121_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_121_1.var_.characterEffect10066ui_story.fillRatio = var_124_5
			end

			local var_124_6 = arg_121_1.actors_["1095ui_story"]
			local var_124_7 = 0

			if var_124_7 < arg_121_1.time_ and arg_121_1.time_ <= var_124_7 + arg_124_0 and arg_121_1.var_.characterEffect1095ui_story == nil then
				arg_121_1.var_.characterEffect1095ui_story = var_124_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_8 = 0.200000002980232

			if var_124_7 <= arg_121_1.time_ and arg_121_1.time_ < var_124_7 + var_124_8 then
				local var_124_9 = (arg_121_1.time_ - var_124_7) / var_124_8

				if arg_121_1.var_.characterEffect1095ui_story then
					arg_121_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_7 + var_124_8 and arg_121_1.time_ < var_124_7 + var_124_8 + arg_124_0 and arg_121_1.var_.characterEffect1095ui_story then
				arg_121_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_124_10 = 0
			local var_124_11 = 0.6

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_12 = arg_121_1:FormatText(StoryNameCfg[471].name)

				arg_121_1.leftNameTxt_.text = var_124_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_13 = arg_121_1:GetWordFromCfg(319661030)
				local var_124_14 = arg_121_1:FormatText(var_124_13.content)

				arg_121_1.text_.text = var_124_14

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_15 = 24
				local var_124_16 = utf8.len(var_124_14)
				local var_124_17 = var_124_15 <= 0 and var_124_11 or var_124_11 * (var_124_16 / var_124_15)

				if var_124_17 > 0 and var_124_11 < var_124_17 then
					arg_121_1.talkMaxDuration = var_124_17

					if var_124_17 + var_124_10 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_17 + var_124_10
					end
				end

				arg_121_1.text_.text = var_124_14
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661030", "story_v_out_319661.awb") ~= 0 then
					local var_124_18 = manager.audio:GetVoiceLength("story_v_out_319661", "319661030", "story_v_out_319661.awb") / 1000

					if var_124_18 + var_124_10 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_18 + var_124_10
					end

					if var_124_13.prefab_name ~= "" and arg_121_1.actors_[var_124_13.prefab_name] ~= nil then
						local var_124_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_13.prefab_name].transform, "story_v_out_319661", "319661030", "story_v_out_319661.awb")

						arg_121_1:RecordAudio("319661030", var_124_19)
						arg_121_1:RecordAudio("319661030", var_124_19)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_319661", "319661030", "story_v_out_319661.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_319661", "319661030", "story_v_out_319661.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_20 = math.max(var_124_11, arg_121_1.talkMaxDuration)

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_20 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_10) / var_124_20

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_10 + var_124_20 and arg_121_1.time_ < var_124_10 + var_124_20 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play319661031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319661031
		arg_125_1.duration_ = 6.433

		local var_125_0 = {
			zh = 5.433,
			ja = 6.433
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
				arg_125_0:Play319661032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10066ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect10066ui_story == nil then
				arg_125_1.var_.characterEffect10066ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect10066ui_story then
					arg_125_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect10066ui_story then
				arg_125_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_128_4 = arg_125_1.actors_["1095ui_story"]
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 and arg_125_1.var_.characterEffect1095ui_story == nil then
				arg_125_1.var_.characterEffect1095ui_story = var_128_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_6 = 0.200000002980232

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_5) / var_128_6

				if arg_125_1.var_.characterEffect1095ui_story then
					local var_128_8 = Mathf.Lerp(0, 0.5, var_128_7)

					arg_125_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1095ui_story.fillRatio = var_128_8
				end
			end

			if arg_125_1.time_ >= var_128_5 + var_128_6 and arg_125_1.time_ < var_128_5 + var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect1095ui_story then
				local var_128_9 = 0.5

				arg_125_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1095ui_story.fillRatio = var_128_9
			end

			local var_128_10 = 0
			local var_128_11 = 0.375

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_12 = arg_125_1:FormatText(StoryNameCfg[640].name)

				arg_125_1.leftNameTxt_.text = var_128_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_13 = arg_125_1:GetWordFromCfg(319661031)
				local var_128_14 = arg_125_1:FormatText(var_128_13.content)

				arg_125_1.text_.text = var_128_14

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_15 = 15
				local var_128_16 = utf8.len(var_128_14)
				local var_128_17 = var_128_15 <= 0 and var_128_11 or var_128_11 * (var_128_16 / var_128_15)

				if var_128_17 > 0 and var_128_11 < var_128_17 then
					arg_125_1.talkMaxDuration = var_128_17

					if var_128_17 + var_128_10 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_17 + var_128_10
					end
				end

				arg_125_1.text_.text = var_128_14
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661031", "story_v_out_319661.awb") ~= 0 then
					local var_128_18 = manager.audio:GetVoiceLength("story_v_out_319661", "319661031", "story_v_out_319661.awb") / 1000

					if var_128_18 + var_128_10 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_18 + var_128_10
					end

					if var_128_13.prefab_name ~= "" and arg_125_1.actors_[var_128_13.prefab_name] ~= nil then
						local var_128_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_13.prefab_name].transform, "story_v_out_319661", "319661031", "story_v_out_319661.awb")

						arg_125_1:RecordAudio("319661031", var_128_19)
						arg_125_1:RecordAudio("319661031", var_128_19)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319661", "319661031", "story_v_out_319661.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319661", "319661031", "story_v_out_319661.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_20 = math.max(var_128_11, arg_125_1.talkMaxDuration)

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_20 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_10) / var_128_20

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_10 + var_128_20 and arg_125_1.time_ < var_128_10 + var_128_20 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319661032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319661032
		arg_129_1.duration_ = 1.999999999999

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play319661033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1095ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1095ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, -0.98, -6.1)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1095ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1095ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story == nil then
				arg_129_1.var_.characterEffect1095ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1095ui_story then
					arg_129_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story then
				arg_129_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_132_15 = arg_129_1.actors_["10066ui_story"]
			local var_132_16 = 0

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 and arg_129_1.var_.characterEffect10066ui_story == nil then
				arg_129_1.var_.characterEffect10066ui_story = var_132_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_17 = 0.200000002980232

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_17 then
				local var_132_18 = (arg_129_1.time_ - var_132_16) / var_132_17

				if arg_129_1.var_.characterEffect10066ui_story then
					local var_132_19 = Mathf.Lerp(0, 0.5, var_132_18)

					arg_129_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_129_1.var_.characterEffect10066ui_story.fillRatio = var_132_19
				end
			end

			if arg_129_1.time_ >= var_132_16 + var_132_17 and arg_129_1.time_ < var_132_16 + var_132_17 + arg_132_0 and arg_129_1.var_.characterEffect10066ui_story then
				local var_132_20 = 0.5

				arg_129_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_129_1.var_.characterEffect10066ui_story.fillRatio = var_132_20
			end

			local var_132_21 = arg_129_1.actors_["10066ui_story"].transform
			local var_132_22 = 0

			if var_132_22 < arg_129_1.time_ and arg_129_1.time_ <= var_132_22 + arg_132_0 then
				arg_129_1.var_.moveOldPos10066ui_story = var_132_21.localPosition
			end

			local var_132_23 = 0.001

			if var_132_22 <= arg_129_1.time_ and arg_129_1.time_ < var_132_22 + var_132_23 then
				local var_132_24 = (arg_129_1.time_ - var_132_22) / var_132_23
				local var_132_25 = Vector3.New(0, 100, 0)

				var_132_21.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10066ui_story, var_132_25, var_132_24)

				local var_132_26 = manager.ui.mainCamera.transform.position - var_132_21.position

				var_132_21.forward = Vector3.New(var_132_26.x, var_132_26.y, var_132_26.z)

				local var_132_27 = var_132_21.localEulerAngles

				var_132_27.z = 0
				var_132_27.x = 0
				var_132_21.localEulerAngles = var_132_27
			end

			if arg_129_1.time_ >= var_132_22 + var_132_23 and arg_129_1.time_ < var_132_22 + var_132_23 + arg_132_0 then
				var_132_21.localPosition = Vector3.New(0, 100, 0)

				local var_132_28 = manager.ui.mainCamera.transform.position - var_132_21.position

				var_132_21.forward = Vector3.New(var_132_28.x, var_132_28.y, var_132_28.z)

				local var_132_29 = var_132_21.localEulerAngles

				var_132_29.z = 0
				var_132_29.x = 0
				var_132_21.localEulerAngles = var_132_29
			end

			local var_132_30 = 0
			local var_132_31 = 0.225

			if var_132_30 < arg_129_1.time_ and arg_129_1.time_ <= var_132_30 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_32 = arg_129_1:FormatText(StoryNameCfg[471].name)

				arg_129_1.leftNameTxt_.text = var_132_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_33 = arg_129_1:GetWordFromCfg(319661032)
				local var_132_34 = arg_129_1:FormatText(var_132_33.content)

				arg_129_1.text_.text = var_132_34

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_35 = 9
				local var_132_36 = utf8.len(var_132_34)
				local var_132_37 = var_132_35 <= 0 and var_132_31 or var_132_31 * (var_132_36 / var_132_35)

				if var_132_37 > 0 and var_132_31 < var_132_37 then
					arg_129_1.talkMaxDuration = var_132_37

					if var_132_37 + var_132_30 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_37 + var_132_30
					end
				end

				arg_129_1.text_.text = var_132_34
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661032", "story_v_out_319661.awb") ~= 0 then
					local var_132_38 = manager.audio:GetVoiceLength("story_v_out_319661", "319661032", "story_v_out_319661.awb") / 1000

					if var_132_38 + var_132_30 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_38 + var_132_30
					end

					if var_132_33.prefab_name ~= "" and arg_129_1.actors_[var_132_33.prefab_name] ~= nil then
						local var_132_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_33.prefab_name].transform, "story_v_out_319661", "319661032", "story_v_out_319661.awb")

						arg_129_1:RecordAudio("319661032", var_132_39)
						arg_129_1:RecordAudio("319661032", var_132_39)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319661", "319661032", "story_v_out_319661.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319661", "319661032", "story_v_out_319661.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_40 = math.max(var_132_31, arg_129_1.talkMaxDuration)

			if var_132_30 <= arg_129_1.time_ and arg_129_1.time_ < var_132_30 + var_132_40 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_30) / var_132_40

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_30 + var_132_40 and arg_129_1.time_ < var_132_30 + var_132_40 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319661033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319661033
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play319661034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1095ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1095ui_story == nil then
				arg_133_1.var_.characterEffect1095ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1095ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1095ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1095ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1095ui_story.fillRatio = var_136_5
			end

			local var_136_6 = 0
			local var_136_7 = 0.2

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				local var_136_8 = "play"
				local var_136_9 = "music"

				arg_133_1:AudioAction(var_136_8, var_136_9, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_136_10 = arg_133_1.actors_["10066ui_story"].transform
			local var_136_11 = 0

			if var_136_11 < arg_133_1.time_ and arg_133_1.time_ <= var_136_11 + arg_136_0 then
				arg_133_1.var_.moveOldPos10066ui_story = var_136_10.localPosition
			end

			local var_136_12 = 0.001

			if var_136_11 <= arg_133_1.time_ and arg_133_1.time_ < var_136_11 + var_136_12 then
				local var_136_13 = (arg_133_1.time_ - var_136_11) / var_136_12
				local var_136_14 = Vector3.New(0, 100, 0)

				var_136_10.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10066ui_story, var_136_14, var_136_13)

				local var_136_15 = manager.ui.mainCamera.transform.position - var_136_10.position

				var_136_10.forward = Vector3.New(var_136_15.x, var_136_15.y, var_136_15.z)

				local var_136_16 = var_136_10.localEulerAngles

				var_136_16.z = 0
				var_136_16.x = 0
				var_136_10.localEulerAngles = var_136_16
			end

			if arg_133_1.time_ >= var_136_11 + var_136_12 and arg_133_1.time_ < var_136_11 + var_136_12 + arg_136_0 then
				var_136_10.localPosition = Vector3.New(0, 100, 0)

				local var_136_17 = manager.ui.mainCamera.transform.position - var_136_10.position

				var_136_10.forward = Vector3.New(var_136_17.x, var_136_17.y, var_136_17.z)

				local var_136_18 = var_136_10.localEulerAngles

				var_136_18.z = 0
				var_136_18.x = 0
				var_136_10.localEulerAngles = var_136_18
			end

			local var_136_19 = arg_133_1.actors_["1095ui_story"].transform
			local var_136_20 = 0

			if var_136_20 < arg_133_1.time_ and arg_133_1.time_ <= var_136_20 + arg_136_0 then
				arg_133_1.var_.moveOldPos1095ui_story = var_136_19.localPosition
			end

			local var_136_21 = 0.001

			if var_136_20 <= arg_133_1.time_ and arg_133_1.time_ < var_136_20 + var_136_21 then
				local var_136_22 = (arg_133_1.time_ - var_136_20) / var_136_21
				local var_136_23 = Vector3.New(0, 100, 0)

				var_136_19.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1095ui_story, var_136_23, var_136_22)

				local var_136_24 = manager.ui.mainCamera.transform.position - var_136_19.position

				var_136_19.forward = Vector3.New(var_136_24.x, var_136_24.y, var_136_24.z)

				local var_136_25 = var_136_19.localEulerAngles

				var_136_25.z = 0
				var_136_25.x = 0
				var_136_19.localEulerAngles = var_136_25
			end

			if arg_133_1.time_ >= var_136_20 + var_136_21 and arg_133_1.time_ < var_136_20 + var_136_21 + arg_136_0 then
				var_136_19.localPosition = Vector3.New(0, 100, 0)

				local var_136_26 = manager.ui.mainCamera.transform.position - var_136_19.position

				var_136_19.forward = Vector3.New(var_136_26.x, var_136_26.y, var_136_26.z)

				local var_136_27 = var_136_19.localEulerAngles

				var_136_27.z = 0
				var_136_27.x = 0
				var_136_19.localEulerAngles = var_136_27
			end

			local var_136_28 = 0
			local var_136_29 = 1.1

			if var_136_28 < arg_133_1.time_ and arg_133_1.time_ <= var_136_28 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_30 = arg_133_1:GetWordFromCfg(319661033)
				local var_136_31 = arg_133_1:FormatText(var_136_30.content)

				arg_133_1.text_.text = var_136_31

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_32 = 44
				local var_136_33 = utf8.len(var_136_31)
				local var_136_34 = var_136_32 <= 0 and var_136_29 or var_136_29 * (var_136_33 / var_136_32)

				if var_136_34 > 0 and var_136_29 < var_136_34 then
					arg_133_1.talkMaxDuration = var_136_34

					if var_136_34 + var_136_28 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_34 + var_136_28
					end
				end

				arg_133_1.text_.text = var_136_31
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_35 = math.max(var_136_29, arg_133_1.talkMaxDuration)

			if var_136_28 <= arg_133_1.time_ and arg_133_1.time_ < var_136_28 + var_136_35 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_28) / var_136_35

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_28 + var_136_35 and arg_133_1.time_ < var_136_28 + var_136_35 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319661034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319661034
		arg_137_1.duration_ = 1.999999999999

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play319661035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1084ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1084ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(0, -0.97, -6)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1084ui_story, var_140_4, var_140_3)

				local var_140_5 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_5.x, var_140_5.y, var_140_5.z)

				local var_140_6 = var_140_0.localEulerAngles

				var_140_6.z = 0
				var_140_6.x = 0
				var_140_0.localEulerAngles = var_140_6
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_140_7 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_7.x, var_140_7.y, var_140_7.z)

				local var_140_8 = var_140_0.localEulerAngles

				var_140_8.z = 0
				var_140_8.x = 0
				var_140_0.localEulerAngles = var_140_8
			end

			local var_140_9 = arg_137_1.actors_["1084ui_story"]
			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story == nil then
				arg_137_1.var_.characterEffect1084ui_story = var_140_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_11 = 0.200000002980232

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11

				if arg_137_1.var_.characterEffect1084ui_story then
					arg_137_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story then
				arg_137_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_140_13 = 0

			if var_140_13 < arg_137_1.time_ and arg_137_1.time_ <= var_140_13 + arg_140_0 then
				arg_137_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_140_14 = 0

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 then
				arg_137_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_140_15 = arg_137_1.actors_["10066ui_story"].transform
			local var_140_16 = 0

			if var_140_16 < arg_137_1.time_ and arg_137_1.time_ <= var_140_16 + arg_140_0 then
				arg_137_1.var_.moveOldPos10066ui_story = var_140_15.localPosition
			end

			local var_140_17 = 0.001

			if var_140_16 <= arg_137_1.time_ and arg_137_1.time_ < var_140_16 + var_140_17 then
				local var_140_18 = (arg_137_1.time_ - var_140_16) / var_140_17
				local var_140_19 = Vector3.New(0, 100, 0)

				var_140_15.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10066ui_story, var_140_19, var_140_18)

				local var_140_20 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_20.x, var_140_20.y, var_140_20.z)

				local var_140_21 = var_140_15.localEulerAngles

				var_140_21.z = 0
				var_140_21.x = 0
				var_140_15.localEulerAngles = var_140_21
			end

			if arg_137_1.time_ >= var_140_16 + var_140_17 and arg_137_1.time_ < var_140_16 + var_140_17 + arg_140_0 then
				var_140_15.localPosition = Vector3.New(0, 100, 0)

				local var_140_22 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_22.x, var_140_22.y, var_140_22.z)

				local var_140_23 = var_140_15.localEulerAngles

				var_140_23.z = 0
				var_140_23.x = 0
				var_140_15.localEulerAngles = var_140_23
			end

			local var_140_24 = arg_137_1.actors_["10066ui_story"]
			local var_140_25 = 0

			if var_140_25 < arg_137_1.time_ and arg_137_1.time_ <= var_140_25 + arg_140_0 and arg_137_1.var_.characterEffect10066ui_story == nil then
				arg_137_1.var_.characterEffect10066ui_story = var_140_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_26 = 0.200000002980232

			if var_140_25 <= arg_137_1.time_ and arg_137_1.time_ < var_140_25 + var_140_26 then
				local var_140_27 = (arg_137_1.time_ - var_140_25) / var_140_26

				if arg_137_1.var_.characterEffect10066ui_story then
					local var_140_28 = Mathf.Lerp(0, 0.5, var_140_27)

					arg_137_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_137_1.var_.characterEffect10066ui_story.fillRatio = var_140_28
				end
			end

			if arg_137_1.time_ >= var_140_25 + var_140_26 and arg_137_1.time_ < var_140_25 + var_140_26 + arg_140_0 and arg_137_1.var_.characterEffect10066ui_story then
				local var_140_29 = 0.5

				arg_137_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_137_1.var_.characterEffect10066ui_story.fillRatio = var_140_29
			end

			local var_140_30 = arg_137_1.actors_["1095ui_story"].transform
			local var_140_31 = 0

			if var_140_31 < arg_137_1.time_ and arg_137_1.time_ <= var_140_31 + arg_140_0 then
				arg_137_1.var_.moveOldPos1095ui_story = var_140_30.localPosition
			end

			local var_140_32 = 0.001

			if var_140_31 <= arg_137_1.time_ and arg_137_1.time_ < var_140_31 + var_140_32 then
				local var_140_33 = (arg_137_1.time_ - var_140_31) / var_140_32
				local var_140_34 = Vector3.New(0, 100, 0)

				var_140_30.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1095ui_story, var_140_34, var_140_33)

				local var_140_35 = manager.ui.mainCamera.transform.position - var_140_30.position

				var_140_30.forward = Vector3.New(var_140_35.x, var_140_35.y, var_140_35.z)

				local var_140_36 = var_140_30.localEulerAngles

				var_140_36.z = 0
				var_140_36.x = 0
				var_140_30.localEulerAngles = var_140_36
			end

			if arg_137_1.time_ >= var_140_31 + var_140_32 and arg_137_1.time_ < var_140_31 + var_140_32 + arg_140_0 then
				var_140_30.localPosition = Vector3.New(0, 100, 0)

				local var_140_37 = manager.ui.mainCamera.transform.position - var_140_30.position

				var_140_30.forward = Vector3.New(var_140_37.x, var_140_37.y, var_140_37.z)

				local var_140_38 = var_140_30.localEulerAngles

				var_140_38.z = 0
				var_140_38.x = 0
				var_140_30.localEulerAngles = var_140_38
			end

			local var_140_39 = arg_137_1.actors_["1095ui_story"]
			local var_140_40 = 0

			if var_140_40 < arg_137_1.time_ and arg_137_1.time_ <= var_140_40 + arg_140_0 and arg_137_1.var_.characterEffect1095ui_story == nil then
				arg_137_1.var_.characterEffect1095ui_story = var_140_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_41 = 0.200000002980232

			if var_140_40 <= arg_137_1.time_ and arg_137_1.time_ < var_140_40 + var_140_41 then
				local var_140_42 = (arg_137_1.time_ - var_140_40) / var_140_41

				if arg_137_1.var_.characterEffect1095ui_story then
					local var_140_43 = Mathf.Lerp(0, 0.5, var_140_42)

					arg_137_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1095ui_story.fillRatio = var_140_43
				end
			end

			if arg_137_1.time_ >= var_140_40 + var_140_41 and arg_137_1.time_ < var_140_40 + var_140_41 + arg_140_0 and arg_137_1.var_.characterEffect1095ui_story then
				local var_140_44 = 0.5

				arg_137_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1095ui_story.fillRatio = var_140_44
			end

			local var_140_45 = 0
			local var_140_46 = 0.05

			if var_140_45 < arg_137_1.time_ and arg_137_1.time_ <= var_140_45 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_47 = arg_137_1:FormatText(StoryNameCfg[6].name)

				arg_137_1.leftNameTxt_.text = var_140_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_48 = arg_137_1:GetWordFromCfg(319661034)
				local var_140_49 = arg_137_1:FormatText(var_140_48.content)

				arg_137_1.text_.text = var_140_49

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_50 = 2
				local var_140_51 = utf8.len(var_140_49)
				local var_140_52 = var_140_50 <= 0 and var_140_46 or var_140_46 * (var_140_51 / var_140_50)

				if var_140_52 > 0 and var_140_46 < var_140_52 then
					arg_137_1.talkMaxDuration = var_140_52

					if var_140_52 + var_140_45 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_52 + var_140_45
					end
				end

				arg_137_1.text_.text = var_140_49
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661034", "story_v_out_319661.awb") ~= 0 then
					local var_140_53 = manager.audio:GetVoiceLength("story_v_out_319661", "319661034", "story_v_out_319661.awb") / 1000

					if var_140_53 + var_140_45 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_53 + var_140_45
					end

					if var_140_48.prefab_name ~= "" and arg_137_1.actors_[var_140_48.prefab_name] ~= nil then
						local var_140_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_48.prefab_name].transform, "story_v_out_319661", "319661034", "story_v_out_319661.awb")

						arg_137_1:RecordAudio("319661034", var_140_54)
						arg_137_1:RecordAudio("319661034", var_140_54)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319661", "319661034", "story_v_out_319661.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319661", "319661034", "story_v_out_319661.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_55 = math.max(var_140_46, arg_137_1.talkMaxDuration)

			if var_140_45 <= arg_137_1.time_ and arg_137_1.time_ < var_140_45 + var_140_55 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_45) / var_140_55

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_45 + var_140_55 and arg_137_1.time_ < var_140_45 + var_140_55 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319661035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319661035
		arg_141_1.duration_ = 5.466

		local var_141_0 = {
			zh = 4.5,
			ja = 5.466
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
			arg_141_1.auto_ = false
		end

		function arg_141_1.playNext_(arg_143_0)
			arg_141_1.onStoryFinished_()
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1095ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1095ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0.7, -0.98, -6.1)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1095ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["1095ui_story"]
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 and arg_141_1.var_.characterEffect1095ui_story == nil then
				arg_141_1.var_.characterEffect1095ui_story = var_144_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_11 = 0.200000002980232

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11

				if arg_141_1.var_.characterEffect1095ui_story then
					arg_141_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 and arg_141_1.var_.characterEffect1095ui_story then
				arg_141_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_144_15 = arg_141_1.actors_["1084ui_story"].transform
			local var_144_16 = 0

			if var_144_16 < arg_141_1.time_ and arg_141_1.time_ <= var_144_16 + arg_144_0 then
				arg_141_1.var_.moveOldPos1084ui_story = var_144_15.localPosition
			end

			local var_144_17 = 0.001

			if var_144_16 <= arg_141_1.time_ and arg_141_1.time_ < var_144_16 + var_144_17 then
				local var_144_18 = (arg_141_1.time_ - var_144_16) / var_144_17
				local var_144_19 = Vector3.New(-0.7, -0.97, -6)

				var_144_15.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1084ui_story, var_144_19, var_144_18)

				local var_144_20 = manager.ui.mainCamera.transform.position - var_144_15.position

				var_144_15.forward = Vector3.New(var_144_20.x, var_144_20.y, var_144_20.z)

				local var_144_21 = var_144_15.localEulerAngles

				var_144_21.z = 0
				var_144_21.x = 0
				var_144_15.localEulerAngles = var_144_21
			end

			if arg_141_1.time_ >= var_144_16 + var_144_17 and arg_141_1.time_ < var_144_16 + var_144_17 + arg_144_0 then
				var_144_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_144_22 = manager.ui.mainCamera.transform.position - var_144_15.position

				var_144_15.forward = Vector3.New(var_144_22.x, var_144_22.y, var_144_22.z)

				local var_144_23 = var_144_15.localEulerAngles

				var_144_23.z = 0
				var_144_23.x = 0
				var_144_15.localEulerAngles = var_144_23
			end

			local var_144_24 = arg_141_1.actors_["1084ui_story"]
			local var_144_25 = 0

			if var_144_25 < arg_141_1.time_ and arg_141_1.time_ <= var_144_25 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story == nil then
				arg_141_1.var_.characterEffect1084ui_story = var_144_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_26 = 0.200000002980232

			if var_144_25 <= arg_141_1.time_ and arg_141_1.time_ < var_144_25 + var_144_26 then
				local var_144_27 = (arg_141_1.time_ - var_144_25) / var_144_26

				if arg_141_1.var_.characterEffect1084ui_story then
					local var_144_28 = Mathf.Lerp(0, 0.5, var_144_27)

					arg_141_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1084ui_story.fillRatio = var_144_28
				end
			end

			if arg_141_1.time_ >= var_144_25 + var_144_26 and arg_141_1.time_ < var_144_25 + var_144_26 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story then
				local var_144_29 = 0.5

				arg_141_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1084ui_story.fillRatio = var_144_29
			end

			local var_144_30 = 0
			local var_144_31 = 0.45

			if var_144_30 < arg_141_1.time_ and arg_141_1.time_ <= var_144_30 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_32 = arg_141_1:FormatText(StoryNameCfg[471].name)

				arg_141_1.leftNameTxt_.text = var_144_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_33 = arg_141_1:GetWordFromCfg(319661035)
				local var_144_34 = arg_141_1:FormatText(var_144_33.content)

				arg_141_1.text_.text = var_144_34

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_35 = 18
				local var_144_36 = utf8.len(var_144_34)
				local var_144_37 = var_144_35 <= 0 and var_144_31 or var_144_31 * (var_144_36 / var_144_35)

				if var_144_37 > 0 and var_144_31 < var_144_37 then
					arg_141_1.talkMaxDuration = var_144_37

					if var_144_37 + var_144_30 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_37 + var_144_30
					end
				end

				arg_141_1.text_.text = var_144_34
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319661", "319661035", "story_v_out_319661.awb") ~= 0 then
					local var_144_38 = manager.audio:GetVoiceLength("story_v_out_319661", "319661035", "story_v_out_319661.awb") / 1000

					if var_144_38 + var_144_30 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_38 + var_144_30
					end

					if var_144_33.prefab_name ~= "" and arg_141_1.actors_[var_144_33.prefab_name] ~= nil then
						local var_144_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_33.prefab_name].transform, "story_v_out_319661", "319661035", "story_v_out_319661.awb")

						arg_141_1:RecordAudio("319661035", var_144_39)
						arg_141_1:RecordAudio("319661035", var_144_39)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319661", "319661035", "story_v_out_319661.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319661", "319661035", "story_v_out_319661.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_40 = math.max(var_144_31, arg_141_1.talkMaxDuration)

			if var_144_30 <= arg_141_1.time_ and arg_141_1.time_ < var_144_30 + var_144_40 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_30) / var_144_40

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_30 + var_144_40 and arg_141_1.time_ < var_144_30 + var_144_40 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74"
	},
	voices = {
		"story_v_out_319661.awb"
	}
}
