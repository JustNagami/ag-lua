return {
	Play319831001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319831001
		arg_1_1.duration_ = 3.899999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319831002(arg_1_1)
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

			local var_4_24 = "1084ui_story"

			if arg_1_1.actors_[var_4_24] == nil then
				local var_4_25 = Object.Instantiate(Asset.Load("Char/" .. var_4_24), arg_1_1.stage_.transform)

				var_4_25.name = var_4_24
				var_4_25.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_24] = var_4_25

				local var_4_26 = var_4_25:GetComponentInChildren(typeof(CharacterEffect))

				var_4_26.enabled = true

				local var_4_27 = GameObjectTools.GetOrAddComponent(var_4_25, typeof(DynamicBoneHelper))

				if var_4_27 then
					var_4_27:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_26.transform, false)

				arg_1_1.var_[var_4_24 .. "Animator"] = var_4_26.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_24 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_24 .. "LipSync"] = var_4_26.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_28 = arg_1_1.actors_["1084ui_story"].transform
			local var_4_29 = 1.9

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1.var_.moveOldPos1084ui_story = var_4_28.localPosition

				local var_4_30 = "1084ui_story"

				arg_1_1:ShowWeapon(arg_1_1.var_[var_4_30 .. "Animator"].transform, false)
			end

			local var_4_31 = 0.001

			if var_4_29 <= arg_1_1.time_ and arg_1_1.time_ < var_4_29 + var_4_31 then
				local var_4_32 = (arg_1_1.time_ - var_4_29) / var_4_31
				local var_4_33 = Vector3.New(0, -0.97, -6)

				var_4_28.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1084ui_story, var_4_33, var_4_32)

				local var_4_34 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_34.x, var_4_34.y, var_4_34.z)

				local var_4_35 = var_4_28.localEulerAngles

				var_4_35.z = 0
				var_4_35.x = 0
				var_4_28.localEulerAngles = var_4_35
			end

			if arg_1_1.time_ >= var_4_29 + var_4_31 and arg_1_1.time_ < var_4_29 + var_4_31 + arg_4_0 then
				var_4_28.localPosition = Vector3.New(0, -0.97, -6)

				local var_4_36 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_36.x, var_4_36.y, var_4_36.z)

				local var_4_37 = var_4_28.localEulerAngles

				var_4_37.z = 0
				var_4_37.x = 0
				var_4_28.localEulerAngles = var_4_37
			end

			local var_4_38 = arg_1_1.actors_["1084ui_story"]
			local var_4_39 = 1.9

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story == nil then
				arg_1_1.var_.characterEffect1084ui_story = var_4_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_40 = 0.200000002980232

			if var_4_39 <= arg_1_1.time_ and arg_1_1.time_ < var_4_39 + var_4_40 then
				local var_4_41 = (arg_1_1.time_ - var_4_39) / var_4_40

				if arg_1_1.var_.characterEffect1084ui_story then
					arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_39 + var_4_40 and arg_1_1.time_ < var_4_39 + var_4_40 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story then
				arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_4_42 = 1.9

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_4_43 = 1.9

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_44 = 0
			local var_4_45 = 0.2

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				local var_4_46 = "play"
				local var_4_47 = "music"

				arg_1_1:AudioAction(var_4_46, var_4_47, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_48 = 1.999999999999
			local var_4_49 = 0.175

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_50 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_50:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_51 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_52 = arg_1_1:GetWordFromCfg(319831001)
				local var_4_53 = arg_1_1:FormatText(var_4_52.content)

				arg_1_1.text_.text = var_4_53

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_54 = 7
				local var_4_55 = utf8.len(var_4_53)
				local var_4_56 = var_4_54 <= 0 and var_4_49 or var_4_49 * (var_4_55 / var_4_54)

				if var_4_56 > 0 and var_4_49 < var_4_56 then
					arg_1_1.talkMaxDuration = var_4_56
					var_4_48 = var_4_48 + 0.3

					if var_4_56 + var_4_48 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_56 + var_4_48
					end
				end

				arg_1_1.text_.text = var_4_53
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831001", "story_v_out_319831.awb") ~= 0 then
					local var_4_57 = manager.audio:GetVoiceLength("story_v_out_319831", "319831001", "story_v_out_319831.awb") / 1000

					if var_4_57 + var_4_48 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_48
					end

					if var_4_52.prefab_name ~= "" and arg_1_1.actors_[var_4_52.prefab_name] ~= nil then
						local var_4_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_52.prefab_name].transform, "story_v_out_319831", "319831001", "story_v_out_319831.awb")

						arg_1_1:RecordAudio("319831001", var_4_58)
						arg_1_1:RecordAudio("319831001", var_4_58)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319831", "319831001", "story_v_out_319831.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319831", "319831001", "story_v_out_319831.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_59 = var_4_48 + 0.3
			local var_4_60 = math.max(var_4_49, arg_1_1.talkMaxDuration)

			if var_4_59 <= arg_1_1.time_ and arg_1_1.time_ < var_4_59 + var_4_60 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_59) / var_4_60

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_59 + var_4_60 and arg_1_1.time_ < var_4_59 + var_4_60 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319831002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319831002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play319831003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1084ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.200000002980232

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1084ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 1

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_8 = arg_7_1:GetWordFromCfg(319831002)
				local var_10_9 = arg_7_1:FormatText(var_10_8.content)

				arg_7_1.text_.text = var_10_9

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_10 = 40
				local var_10_11 = utf8.len(var_10_9)
				local var_10_12 = var_10_10 <= 0 and var_10_7 or var_10_7 * (var_10_11 / var_10_10)

				if var_10_12 > 0 and var_10_7 < var_10_12 then
					arg_7_1.talkMaxDuration = var_10_12

					if var_10_12 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_12 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_9
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_13 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_13 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_13

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_13 and arg_7_1.time_ < var_10_6 + var_10_13 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319831003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319831003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play319831004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.125

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_2 = arg_11_1:GetWordFromCfg(319831003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 45
				local var_14_5 = utf8.len(var_14_3)
				local var_14_6 = var_14_4 <= 0 and var_14_1 or var_14_1 * (var_14_5 / var_14_4)

				if var_14_6 > 0 and var_14_1 < var_14_6 then
					arg_11_1.talkMaxDuration = var_14_6

					if var_14_6 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_6 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_3
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_7 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_7 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_7

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_7 and arg_11_1.time_ < var_14_0 + var_14_7 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319831004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319831004
		arg_15_1.duration_ = 3.5

		local var_15_0 = {
			zh = 3.5,
			ja = 3.366
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
				arg_15_0:Play319831005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, -0.97, -6)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_4, var_18_3)

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

			local var_18_9 = arg_15_1.actors_["1084ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1084ui_story then
					arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_18_15 = 0
			local var_18_16 = 0.4

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

				local var_18_18 = arg_15_1:GetWordFromCfg(319831004)
				local var_18_19 = arg_15_1:FormatText(var_18_18.content)

				arg_15_1.text_.text = var_18_19

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_20 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831004", "story_v_out_319831.awb") ~= 0 then
					local var_18_23 = manager.audio:GetVoiceLength("story_v_out_319831", "319831004", "story_v_out_319831.awb") / 1000

					if var_18_23 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_23 + var_18_15
					end

					if var_18_18.prefab_name ~= "" and arg_15_1.actors_[var_18_18.prefab_name] ~= nil then
						local var_18_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_18.prefab_name].transform, "story_v_out_319831", "319831004", "story_v_out_319831.awb")

						arg_15_1:RecordAudio("319831004", var_18_24)
						arg_15_1:RecordAudio("319831004", var_18_24)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319831", "319831004", "story_v_out_319831.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319831", "319831004", "story_v_out_319831.awb")
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
	Play319831005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319831005
		arg_19_1.duration_ = 3.8

		local var_19_0 = {
			zh = 3.4,
			ja = 3.8
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
				arg_19_0:Play319831006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.4

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(319831005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 16
				local var_22_6 = utf8.len(var_22_4)
				local var_22_7 = var_22_5 <= 0 and var_22_1 or var_22_1 * (var_22_6 / var_22_5)

				if var_22_7 > 0 and var_22_1 < var_22_7 then
					arg_19_1.talkMaxDuration = var_22_7

					if var_22_7 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_7 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_4
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831005", "story_v_out_319831.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_319831", "319831005", "story_v_out_319831.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_319831", "319831005", "story_v_out_319831.awb")

						arg_19_1:RecordAudio("319831005", var_22_9)
						arg_19_1:RecordAudio("319831005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319831", "319831005", "story_v_out_319831.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319831", "319831005", "story_v_out_319831.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_10 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_10 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_10

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_10 and arg_19_1.time_ < var_22_0 + var_22_10 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319831006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319831006
		arg_23_1.duration_ = 7.6

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play319831007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "D02a"

			if arg_23_1.bgs_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(arg_23_1.paintGo_)

				var_26_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_26_0)
				var_26_1.name = var_26_0
				var_26_1.transform.parent = arg_23_1.stage_.transform
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.bgs_[var_26_0] = var_26_1
			end

			local var_26_2 = 1.23333333333333

			if var_26_2 < arg_23_1.time_ and arg_23_1.time_ <= var_26_2 + arg_26_0 then
				local var_26_3 = manager.ui.mainCamera.transform.localPosition
				local var_26_4 = Vector3.New(0, 0, 10) + Vector3.New(var_26_3.x, var_26_3.y, 0)
				local var_26_5 = arg_23_1.bgs_.D02a

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
					if iter_26_0 ~= "D02a" then
						iter_26_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.allBtn_.enabled = false
			end

			local var_26_17 = 0.3

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				arg_23_1.allBtn_.enabled = true
			end

			local var_26_18 = 0

			if var_26_18 < arg_23_1.time_ and arg_23_1.time_ <= var_26_18 + arg_26_0 then
				arg_23_1.mask_.enabled = true
				arg_23_1.mask_.raycastTarget = true

				arg_23_1:SetGaussion(false)
			end

			local var_26_19 = 1.23333333333333

			if var_26_18 <= arg_23_1.time_ and arg_23_1.time_ < var_26_18 + var_26_19 then
				local var_26_20 = (arg_23_1.time_ - var_26_18) / var_26_19
				local var_26_21 = Color.New(0, 0, 0)

				var_26_21.a = Mathf.Lerp(0, 1, var_26_20)
				arg_23_1.mask_.color = var_26_21
			end

			if arg_23_1.time_ >= var_26_18 + var_26_19 and arg_23_1.time_ < var_26_18 + var_26_19 + arg_26_0 then
				local var_26_22 = Color.New(0, 0, 0)

				var_26_22.a = 1
				arg_23_1.mask_.color = var_26_22
			end

			local var_26_23 = 1.23333333333333

			if var_26_23 < arg_23_1.time_ and arg_23_1.time_ <= var_26_23 + arg_26_0 then
				arg_23_1.mask_.enabled = true
				arg_23_1.mask_.raycastTarget = true

				arg_23_1:SetGaussion(false)
			end

			local var_26_24 = 2

			if var_26_23 <= arg_23_1.time_ and arg_23_1.time_ < var_26_23 + var_26_24 then
				local var_26_25 = (arg_23_1.time_ - var_26_23) / var_26_24
				local var_26_26 = Color.New(0, 0, 0)

				var_26_26.a = Mathf.Lerp(1, 0, var_26_25)
				arg_23_1.mask_.color = var_26_26
			end

			if arg_23_1.time_ >= var_26_23 + var_26_24 and arg_23_1.time_ < var_26_23 + var_26_24 + arg_26_0 then
				local var_26_27 = Color.New(0, 0, 0)
				local var_26_28 = 0

				arg_23_1.mask_.enabled = false
				var_26_27.a = var_26_28
				arg_23_1.mask_.color = var_26_27
			end

			local var_26_29 = arg_23_1.actors_["1084ui_story"].transform
			local var_26_30 = 1.23333333333333

			if var_26_30 < arg_23_1.time_ and arg_23_1.time_ <= var_26_30 + arg_26_0 then
				arg_23_1.var_.moveOldPos1084ui_story = var_26_29.localPosition
			end

			local var_26_31 = 0.001

			if var_26_30 <= arg_23_1.time_ and arg_23_1.time_ < var_26_30 + var_26_31 then
				local var_26_32 = (arg_23_1.time_ - var_26_30) / var_26_31
				local var_26_33 = Vector3.New(0, 100, 0)

				var_26_29.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1084ui_story, var_26_33, var_26_32)

				local var_26_34 = manager.ui.mainCamera.transform.position - var_26_29.position

				var_26_29.forward = Vector3.New(var_26_34.x, var_26_34.y, var_26_34.z)

				local var_26_35 = var_26_29.localEulerAngles

				var_26_35.z = 0
				var_26_35.x = 0
				var_26_29.localEulerAngles = var_26_35
			end

			if arg_23_1.time_ >= var_26_30 + var_26_31 and arg_23_1.time_ < var_26_30 + var_26_31 + arg_26_0 then
				var_26_29.localPosition = Vector3.New(0, 100, 0)

				local var_26_36 = manager.ui.mainCamera.transform.position - var_26_29.position

				var_26_29.forward = Vector3.New(var_26_36.x, var_26_36.y, var_26_36.z)

				local var_26_37 = var_26_29.localEulerAngles

				var_26_37.z = 0
				var_26_37.x = 0
				var_26_29.localEulerAngles = var_26_37
			end

			local var_26_38 = 0
			local var_26_39 = 0.2

			if var_26_38 < arg_23_1.time_ and arg_23_1.time_ <= var_26_38 + arg_26_0 then
				local var_26_40 = "play"
				local var_26_41 = "music"

				arg_23_1:AudioAction(var_26_40, var_26_41, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_26_42 = 0.233333333333333
			local var_26_43 = 1

			if var_26_42 < arg_23_1.time_ and arg_23_1.time_ <= var_26_42 + arg_26_0 then
				local var_26_44 = "play"
				local var_26_45 = "music"

				arg_23_1:AudioAction(var_26_44, var_26_45, "bgm_activity_3_0_story_sad", "bgm_activity_3_0_story_sad", "bgm_activity_3_0_story_sad.awb")
			end

			if arg_23_1.frameCnt_ <= 1 then
				arg_23_1.dialog_:SetActive(false)
			end

			local var_26_46 = 2.6
			local var_26_47 = 0.85

			if var_26_46 < arg_23_1.time_ and arg_23_1.time_ <= var_26_46 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0

				arg_23_1.dialog_:SetActive(true)

				local var_26_48 = LeanTween.value(arg_23_1.dialog_, 0, 1, 0.3)

				var_26_48:setOnUpdate(LuaHelper.FloatAction(function(arg_27_0)
					arg_23_1.dialogCg_.alpha = arg_27_0
				end))
				var_26_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_23_1.dialog_)
					var_26_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_23_1.duration_ = arg_23_1.duration_ + 0.3

				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_49 = arg_23_1:GetWordFromCfg(319831006)
				local var_26_50 = arg_23_1:FormatText(var_26_49.content)

				arg_23_1.text_.text = var_26_50

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_51 = 34
				local var_26_52 = utf8.len(var_26_50)
				local var_26_53 = var_26_51 <= 0 and var_26_47 or var_26_47 * (var_26_52 / var_26_51)

				if var_26_53 > 0 and var_26_47 < var_26_53 then
					arg_23_1.talkMaxDuration = var_26_53
					var_26_46 = var_26_46 + 0.3

					if var_26_53 + var_26_46 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_53 + var_26_46
					end
				end

				arg_23_1.text_.text = var_26_50
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_54 = var_26_46 + 0.3
			local var_26_55 = math.max(var_26_47, arg_23_1.talkMaxDuration)

			if var_26_54 <= arg_23_1.time_ and arg_23_1.time_ < var_26_54 + var_26_55 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_54) / var_26_55

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_54 + var_26_55 and arg_23_1.time_ < var_26_54 + var_26_55 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319831007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 319831007
		arg_29_1.duration_ = 6.1

		local var_29_0 = {
			zh = 4.733,
			ja = 6.1
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
				arg_29_0:Play319831008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = "4040ui_story"

			if arg_29_1.actors_[var_32_0] == nil then
				local var_32_1 = Object.Instantiate(Asset.Load("Char/" .. var_32_0), arg_29_1.stage_.transform)

				var_32_1.name = var_32_0
				var_32_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.actors_[var_32_0] = var_32_1

				local var_32_2 = var_32_1:GetComponentInChildren(typeof(CharacterEffect))

				var_32_2.enabled = true

				local var_32_3 = GameObjectTools.GetOrAddComponent(var_32_1, typeof(DynamicBoneHelper))

				if var_32_3 then
					var_32_3:EnableDynamicBone(false)
				end

				arg_29_1:ShowWeapon(var_32_2.transform, false)

				arg_29_1.var_[var_32_0 .. "Animator"] = var_32_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_29_1.var_[var_32_0 .. "Animator"].applyRootMotion = true
				arg_29_1.var_[var_32_0 .. "LipSync"] = var_32_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_32_4 = arg_29_1.actors_["4040ui_story"].transform
			local var_32_5 = 0

			if var_32_5 < arg_29_1.time_ and arg_29_1.time_ <= var_32_5 + arg_32_0 then
				arg_29_1.var_.moveOldPos4040ui_story = var_32_4.localPosition
			end

			local var_32_6 = 0.001

			if var_32_5 <= arg_29_1.time_ and arg_29_1.time_ < var_32_5 + var_32_6 then
				local var_32_7 = (arg_29_1.time_ - var_32_5) / var_32_6
				local var_32_8 = Vector3.New(-0.7, -1.55, -5.5)

				var_32_4.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos4040ui_story, var_32_8, var_32_7)

				local var_32_9 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_9.x, var_32_9.y, var_32_9.z)

				local var_32_10 = var_32_4.localEulerAngles

				var_32_10.z = 0
				var_32_10.x = 0
				var_32_4.localEulerAngles = var_32_10
			end

			if arg_29_1.time_ >= var_32_5 + var_32_6 and arg_29_1.time_ < var_32_5 + var_32_6 + arg_32_0 then
				var_32_4.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_32_11 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_11.x, var_32_11.y, var_32_11.z)

				local var_32_12 = var_32_4.localEulerAngles

				var_32_12.z = 0
				var_32_12.x = 0
				var_32_4.localEulerAngles = var_32_12
			end

			local var_32_13 = arg_29_1.actors_["4040ui_story"]
			local var_32_14 = 0

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 and arg_29_1.var_.characterEffect4040ui_story == nil then
				arg_29_1.var_.characterEffect4040ui_story = var_32_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_15 = 0.200000002980232

			if var_32_14 <= arg_29_1.time_ and arg_29_1.time_ < var_32_14 + var_32_15 then
				local var_32_16 = (arg_29_1.time_ - var_32_14) / var_32_15

				if arg_29_1.var_.characterEffect4040ui_story then
					arg_29_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_14 + var_32_15 and arg_29_1.time_ < var_32_14 + var_32_15 + arg_32_0 and arg_29_1.var_.characterEffect4040ui_story then
				arg_29_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_32_17 = 0

			if var_32_17 < arg_29_1.time_ and arg_29_1.time_ <= var_32_17 + arg_32_0 then
				arg_29_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_32_18 = 0

			if var_32_18 < arg_29_1.time_ and arg_29_1.time_ <= var_32_18 + arg_32_0 then
				arg_29_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_32_19 = 0
			local var_32_20 = 0.575

			if var_32_19 < arg_29_1.time_ and arg_29_1.time_ <= var_32_19 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_21 = arg_29_1:FormatText(StoryNameCfg[668].name)

				arg_29_1.leftNameTxt_.text = var_32_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_22 = arg_29_1:GetWordFromCfg(319831007)
				local var_32_23 = arg_29_1:FormatText(var_32_22.content)

				arg_29_1.text_.text = var_32_23

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_24 = 23
				local var_32_25 = utf8.len(var_32_23)
				local var_32_26 = var_32_24 <= 0 and var_32_20 or var_32_20 * (var_32_25 / var_32_24)

				if var_32_26 > 0 and var_32_20 < var_32_26 then
					arg_29_1.talkMaxDuration = var_32_26

					if var_32_26 + var_32_19 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_26 + var_32_19
					end
				end

				arg_29_1.text_.text = var_32_23
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831007", "story_v_out_319831.awb") ~= 0 then
					local var_32_27 = manager.audio:GetVoiceLength("story_v_out_319831", "319831007", "story_v_out_319831.awb") / 1000

					if var_32_27 + var_32_19 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_27 + var_32_19
					end

					if var_32_22.prefab_name ~= "" and arg_29_1.actors_[var_32_22.prefab_name] ~= nil then
						local var_32_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_22.prefab_name].transform, "story_v_out_319831", "319831007", "story_v_out_319831.awb")

						arg_29_1:RecordAudio("319831007", var_32_28)
						arg_29_1:RecordAudio("319831007", var_32_28)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_319831", "319831007", "story_v_out_319831.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_319831", "319831007", "story_v_out_319831.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_29 = math.max(var_32_20, arg_29_1.talkMaxDuration)

			if var_32_19 <= arg_29_1.time_ and arg_29_1.time_ < var_32_19 + var_32_29 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_19) / var_32_29

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_19 + var_32_29 and arg_29_1.time_ < var_32_19 + var_32_29 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play319831008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 319831008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play319831009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["4040ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect4040ui_story == nil then
				arg_33_1.var_.characterEffect4040ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.200000002980232

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect4040ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_33_1.var_.characterEffect4040ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect4040ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_33_1.var_.characterEffect4040ui_story.fillRatio = var_36_5
			end

			local var_36_6 = 0
			local var_36_7 = 0.975

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_8 = arg_33_1:GetWordFromCfg(319831008)
				local var_36_9 = arg_33_1:FormatText(var_36_8.content)

				arg_33_1.text_.text = var_36_9

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_10 = 39
				local var_36_11 = utf8.len(var_36_9)
				local var_36_12 = var_36_10 <= 0 and var_36_7 or var_36_7 * (var_36_11 / var_36_10)

				if var_36_12 > 0 and var_36_7 < var_36_12 then
					arg_33_1.talkMaxDuration = var_36_12

					if var_36_12 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_12 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_9
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_13 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_13 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_13

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_13 and arg_33_1.time_ < var_36_6 + var_36_13 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play319831009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 319831009
		arg_37_1.duration_ = 3.033

		local var_37_0 = {
			zh = 3.033,
			ja = 2.866
		}
		local var_37_1 = manager.audio:GetLocalizationFlag()

		if var_37_0[var_37_1] ~= nil then
			arg_37_1.duration_ = var_37_0[var_37_1]
		end

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play319831010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["4040ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect4040ui_story == nil then
				arg_37_1.var_.characterEffect4040ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.200000002980232

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect4040ui_story then
					arg_37_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect4040ui_story then
				arg_37_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_40_4 = 0
			local var_40_5 = 0.35

			if var_40_4 < arg_37_1.time_ and arg_37_1.time_ <= var_40_4 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_6 = arg_37_1:FormatText(StoryNameCfg[668].name)

				arg_37_1.leftNameTxt_.text = var_40_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_7 = arg_37_1:GetWordFromCfg(319831009)
				local var_40_8 = arg_37_1:FormatText(var_40_7.content)

				arg_37_1.text_.text = var_40_8

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_9 = 14
				local var_40_10 = utf8.len(var_40_8)
				local var_40_11 = var_40_9 <= 0 and var_40_5 or var_40_5 * (var_40_10 / var_40_9)

				if var_40_11 > 0 and var_40_5 < var_40_11 then
					arg_37_1.talkMaxDuration = var_40_11

					if var_40_11 + var_40_4 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_11 + var_40_4
					end
				end

				arg_37_1.text_.text = var_40_8
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831009", "story_v_out_319831.awb") ~= 0 then
					local var_40_12 = manager.audio:GetVoiceLength("story_v_out_319831", "319831009", "story_v_out_319831.awb") / 1000

					if var_40_12 + var_40_4 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_12 + var_40_4
					end

					if var_40_7.prefab_name ~= "" and arg_37_1.actors_[var_40_7.prefab_name] ~= nil then
						local var_40_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_7.prefab_name].transform, "story_v_out_319831", "319831009", "story_v_out_319831.awb")

						arg_37_1:RecordAudio("319831009", var_40_13)
						arg_37_1:RecordAudio("319831009", var_40_13)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_319831", "319831009", "story_v_out_319831.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_319831", "319831009", "story_v_out_319831.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_14 = math.max(var_40_5, arg_37_1.talkMaxDuration)

			if var_40_4 <= arg_37_1.time_ and arg_37_1.time_ < var_40_4 + var_40_14 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_4) / var_40_14

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_4 + var_40_14 and arg_37_1.time_ < var_40_4 + var_40_14 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play319831010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 319831010
		arg_41_1.duration_ = 4.4

		local var_41_0 = {
			zh = 2.466,
			ja = 4.4
		}
		local var_41_1 = manager.audio:GetLocalizationFlag()

		if var_41_0[var_41_1] ~= nil then
			arg_41_1.duration_ = var_41_0[var_41_1]
		end

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play319831011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1084ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos1084ui_story = var_44_0.localPosition
			end

			local var_44_2 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2
				local var_44_4 = Vector3.New(0.7, -0.97, -6)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1084ui_story, var_44_4, var_44_3)

				local var_44_5 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_5.x, var_44_5.y, var_44_5.z)

				local var_44_6 = var_44_0.localEulerAngles

				var_44_6.z = 0
				var_44_6.x = 0
				var_44_0.localEulerAngles = var_44_6
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_44_7 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_7.x, var_44_7.y, var_44_7.z)

				local var_44_8 = var_44_0.localEulerAngles

				var_44_8.z = 0
				var_44_8.x = 0
				var_44_0.localEulerAngles = var_44_8
			end

			local var_44_9 = arg_41_1.actors_["1084ui_story"]
			local var_44_10 = 0

			if var_44_10 < arg_41_1.time_ and arg_41_1.time_ <= var_44_10 + arg_44_0 and arg_41_1.var_.characterEffect1084ui_story == nil then
				arg_41_1.var_.characterEffect1084ui_story = var_44_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_11 = 0.200000002980232

			if var_44_10 <= arg_41_1.time_ and arg_41_1.time_ < var_44_10 + var_44_11 then
				local var_44_12 = (arg_41_1.time_ - var_44_10) / var_44_11

				if arg_41_1.var_.characterEffect1084ui_story then
					arg_41_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_10 + var_44_11 and arg_41_1.time_ < var_44_10 + var_44_11 + arg_44_0 and arg_41_1.var_.characterEffect1084ui_story then
				arg_41_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_44_13 = 0

			if var_44_13 < arg_41_1.time_ and arg_41_1.time_ <= var_44_13 + arg_44_0 then
				arg_41_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_44_14 = arg_41_1.actors_["4040ui_story"].transform
			local var_44_15 = 0

			if var_44_15 < arg_41_1.time_ and arg_41_1.time_ <= var_44_15 + arg_44_0 then
				arg_41_1.var_.moveOldPos4040ui_story = var_44_14.localPosition
			end

			local var_44_16 = 0.001

			if var_44_15 <= arg_41_1.time_ and arg_41_1.time_ < var_44_15 + var_44_16 then
				local var_44_17 = (arg_41_1.time_ - var_44_15) / var_44_16
				local var_44_18 = Vector3.New(-0.7, -1.55, -5.5)

				var_44_14.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos4040ui_story, var_44_18, var_44_17)

				local var_44_19 = manager.ui.mainCamera.transform.position - var_44_14.position

				var_44_14.forward = Vector3.New(var_44_19.x, var_44_19.y, var_44_19.z)

				local var_44_20 = var_44_14.localEulerAngles

				var_44_20.z = 0
				var_44_20.x = 0
				var_44_14.localEulerAngles = var_44_20
			end

			if arg_41_1.time_ >= var_44_15 + var_44_16 and arg_41_1.time_ < var_44_15 + var_44_16 + arg_44_0 then
				var_44_14.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_44_21 = manager.ui.mainCamera.transform.position - var_44_14.position

				var_44_14.forward = Vector3.New(var_44_21.x, var_44_21.y, var_44_21.z)

				local var_44_22 = var_44_14.localEulerAngles

				var_44_22.z = 0
				var_44_22.x = 0
				var_44_14.localEulerAngles = var_44_22
			end

			local var_44_23 = arg_41_1.actors_["4040ui_story"]
			local var_44_24 = 0

			if var_44_24 < arg_41_1.time_ and arg_41_1.time_ <= var_44_24 + arg_44_0 and arg_41_1.var_.characterEffect4040ui_story == nil then
				arg_41_1.var_.characterEffect4040ui_story = var_44_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_25 = 0.200000002980232

			if var_44_24 <= arg_41_1.time_ and arg_41_1.time_ < var_44_24 + var_44_25 then
				local var_44_26 = (arg_41_1.time_ - var_44_24) / var_44_25

				if arg_41_1.var_.characterEffect4040ui_story then
					local var_44_27 = Mathf.Lerp(0, 0.5, var_44_26)

					arg_41_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_41_1.var_.characterEffect4040ui_story.fillRatio = var_44_27
				end
			end

			if arg_41_1.time_ >= var_44_24 + var_44_25 and arg_41_1.time_ < var_44_24 + var_44_25 + arg_44_0 and arg_41_1.var_.characterEffect4040ui_story then
				local var_44_28 = 0.5

				arg_41_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_41_1.var_.characterEffect4040ui_story.fillRatio = var_44_28
			end

			local var_44_29 = 0
			local var_44_30 = 0.325

			if var_44_29 < arg_41_1.time_ and arg_41_1.time_ <= var_44_29 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_31 = arg_41_1:FormatText(StoryNameCfg[6].name)

				arg_41_1.leftNameTxt_.text = var_44_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_32 = arg_41_1:GetWordFromCfg(319831010)
				local var_44_33 = arg_41_1:FormatText(var_44_32.content)

				arg_41_1.text_.text = var_44_33

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_34 = 13
				local var_44_35 = utf8.len(var_44_33)
				local var_44_36 = var_44_34 <= 0 and var_44_30 or var_44_30 * (var_44_35 / var_44_34)

				if var_44_36 > 0 and var_44_30 < var_44_36 then
					arg_41_1.talkMaxDuration = var_44_36

					if var_44_36 + var_44_29 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_36 + var_44_29
					end
				end

				arg_41_1.text_.text = var_44_33
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831010", "story_v_out_319831.awb") ~= 0 then
					local var_44_37 = manager.audio:GetVoiceLength("story_v_out_319831", "319831010", "story_v_out_319831.awb") / 1000

					if var_44_37 + var_44_29 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_37 + var_44_29
					end

					if var_44_32.prefab_name ~= "" and arg_41_1.actors_[var_44_32.prefab_name] ~= nil then
						local var_44_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_32.prefab_name].transform, "story_v_out_319831", "319831010", "story_v_out_319831.awb")

						arg_41_1:RecordAudio("319831010", var_44_38)
						arg_41_1:RecordAudio("319831010", var_44_38)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_319831", "319831010", "story_v_out_319831.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_319831", "319831010", "story_v_out_319831.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_39 = math.max(var_44_30, arg_41_1.talkMaxDuration)

			if var_44_29 <= arg_41_1.time_ and arg_41_1.time_ < var_44_29 + var_44_39 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_29) / var_44_39

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_29 + var_44_39 and arg_41_1.time_ < var_44_29 + var_44_39 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play319831011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 319831011
		arg_45_1.duration_ = 4.766

		local var_45_0 = {
			zh = 1.633,
			ja = 4.766
		}
		local var_45_1 = manager.audio:GetLocalizationFlag()

		if var_45_0[var_45_1] ~= nil then
			arg_45_1.duration_ = var_45_0[var_45_1]
		end

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play319831012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 0.15

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_2 = arg_45_1:FormatText(StoryNameCfg[6].name)

				arg_45_1.leftNameTxt_.text = var_48_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_3 = arg_45_1:GetWordFromCfg(319831011)
				local var_48_4 = arg_45_1:FormatText(var_48_3.content)

				arg_45_1.text_.text = var_48_4

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_5 = 6
				local var_48_6 = utf8.len(var_48_4)
				local var_48_7 = var_48_5 <= 0 and var_48_1 or var_48_1 * (var_48_6 / var_48_5)

				if var_48_7 > 0 and var_48_1 < var_48_7 then
					arg_45_1.talkMaxDuration = var_48_7

					if var_48_7 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_7 + var_48_0
					end
				end

				arg_45_1.text_.text = var_48_4
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831011", "story_v_out_319831.awb") ~= 0 then
					local var_48_8 = manager.audio:GetVoiceLength("story_v_out_319831", "319831011", "story_v_out_319831.awb") / 1000

					if var_48_8 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_8 + var_48_0
					end

					if var_48_3.prefab_name ~= "" and arg_45_1.actors_[var_48_3.prefab_name] ~= nil then
						local var_48_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_3.prefab_name].transform, "story_v_out_319831", "319831011", "story_v_out_319831.awb")

						arg_45_1:RecordAudio("319831011", var_48_9)
						arg_45_1:RecordAudio("319831011", var_48_9)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_319831", "319831011", "story_v_out_319831.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_319831", "319831011", "story_v_out_319831.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_10 = math.max(var_48_1, arg_45_1.talkMaxDuration)

			if var_48_0 <= arg_45_1.time_ and arg_45_1.time_ < var_48_0 + var_48_10 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_0) / var_48_10

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_0 + var_48_10 and arg_45_1.time_ < var_48_0 + var_48_10 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play319831012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 319831012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play319831013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1084ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story == nil then
				arg_49_1.var_.characterEffect1084ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.200000002980232

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect1084ui_story then
					local var_52_4 = Mathf.Lerp(0, 0.5, var_52_3)

					arg_49_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1084ui_story.fillRatio = var_52_4
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story then
				local var_52_5 = 0.5

				arg_49_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1084ui_story.fillRatio = var_52_5
			end

			local var_52_6 = 0
			local var_52_7 = 1.2

			if var_52_6 < arg_49_1.time_ and arg_49_1.time_ <= var_52_6 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_8 = arg_49_1:GetWordFromCfg(319831012)
				local var_52_9 = arg_49_1:FormatText(var_52_8.content)

				arg_49_1.text_.text = var_52_9

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_10 = 48
				local var_52_11 = utf8.len(var_52_9)
				local var_52_12 = var_52_10 <= 0 and var_52_7 or var_52_7 * (var_52_11 / var_52_10)

				if var_52_12 > 0 and var_52_7 < var_52_12 then
					arg_49_1.talkMaxDuration = var_52_12

					if var_52_12 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_12 + var_52_6
					end
				end

				arg_49_1.text_.text = var_52_9
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_13 = math.max(var_52_7, arg_49_1.talkMaxDuration)

			if var_52_6 <= arg_49_1.time_ and arg_49_1.time_ < var_52_6 + var_52_13 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_6) / var_52_13

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_6 + var_52_13 and arg_49_1.time_ < var_52_6 + var_52_13 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play319831013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319831013
		arg_53_1.duration_ = 3.6

		local var_53_0 = {
			zh = 2.4,
			ja = 3.6
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
				arg_53_0:Play319831014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["4040ui_story"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos4040ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos4040ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = arg_53_1.actors_["4040ui_story"]
			local var_56_10 = 0

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 and arg_53_1.var_.characterEffect4040ui_story == nil then
				arg_53_1.var_.characterEffect4040ui_story = var_56_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_11 = 0.200000002980232

			if var_56_10 <= arg_53_1.time_ and arg_53_1.time_ < var_56_10 + var_56_11 then
				local var_56_12 = (arg_53_1.time_ - var_56_10) / var_56_11

				if arg_53_1.var_.characterEffect4040ui_story then
					arg_53_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_10 + var_56_11 and arg_53_1.time_ < var_56_10 + var_56_11 + arg_56_0 and arg_53_1.var_.characterEffect4040ui_story then
				arg_53_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_56_13 = 0

			if var_56_13 < arg_53_1.time_ and arg_53_1.time_ <= var_56_13 + arg_56_0 then
				arg_53_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_2")
			end

			local var_56_14 = 0

			if var_56_14 < arg_53_1.time_ and arg_53_1.time_ <= var_56_14 + arg_56_0 then
				arg_53_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_56_15 = 0
			local var_56_16 = 0.175

			if var_56_15 < arg_53_1.time_ and arg_53_1.time_ <= var_56_15 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_17 = arg_53_1:FormatText(StoryNameCfg[668].name)

				arg_53_1.leftNameTxt_.text = var_56_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_18 = arg_53_1:GetWordFromCfg(319831013)
				local var_56_19 = arg_53_1:FormatText(var_56_18.content)

				arg_53_1.text_.text = var_56_19

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_20 = 7
				local var_56_21 = utf8.len(var_56_19)
				local var_56_22 = var_56_20 <= 0 and var_56_16 or var_56_16 * (var_56_21 / var_56_20)

				if var_56_22 > 0 and var_56_16 < var_56_22 then
					arg_53_1.talkMaxDuration = var_56_22

					if var_56_22 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_22 + var_56_15
					end
				end

				arg_53_1.text_.text = var_56_19
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831013", "story_v_out_319831.awb") ~= 0 then
					local var_56_23 = manager.audio:GetVoiceLength("story_v_out_319831", "319831013", "story_v_out_319831.awb") / 1000

					if var_56_23 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_23 + var_56_15
					end

					if var_56_18.prefab_name ~= "" and arg_53_1.actors_[var_56_18.prefab_name] ~= nil then
						local var_56_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_18.prefab_name].transform, "story_v_out_319831", "319831013", "story_v_out_319831.awb")

						arg_53_1:RecordAudio("319831013", var_56_24)
						arg_53_1:RecordAudio("319831013", var_56_24)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_319831", "319831013", "story_v_out_319831.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_319831", "319831013", "story_v_out_319831.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_25 = math.max(var_56_16, arg_53_1.talkMaxDuration)

			if var_56_15 <= arg_53_1.time_ and arg_53_1.time_ < var_56_15 + var_56_25 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_15) / var_56_25

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_15 + var_56_25 and arg_53_1.time_ < var_56_15 + var_56_25 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play319831014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319831014
		arg_57_1.duration_ = 10.233

		local var_57_0 = {
			zh = 9,
			ja = 10.233
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
				arg_57_0:Play319831015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["4040ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect4040ui_story == nil then
				arg_57_1.var_.characterEffect4040ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.200000002980232

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect4040ui_story then
					local var_60_4 = Mathf.Lerp(0, 0.5, var_60_3)

					arg_57_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_57_1.var_.characterEffect4040ui_story.fillRatio = var_60_4
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect4040ui_story then
				local var_60_5 = 0.5

				arg_57_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_57_1.var_.characterEffect4040ui_story.fillRatio = var_60_5
			end

			local var_60_6 = 0

			if var_60_6 < arg_57_1.time_ and arg_57_1.time_ <= var_60_6 + arg_60_0 then
				arg_57_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_60_7 = arg_57_1.actors_["1084ui_story"]
			local var_60_8 = 0

			if var_60_8 < arg_57_1.time_ and arg_57_1.time_ <= var_60_8 + arg_60_0 and arg_57_1.var_.characterEffect1084ui_story == nil then
				arg_57_1.var_.characterEffect1084ui_story = var_60_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_9 = 0.200000002980232

			if var_60_8 <= arg_57_1.time_ and arg_57_1.time_ < var_60_8 + var_60_9 then
				local var_60_10 = (arg_57_1.time_ - var_60_8) / var_60_9

				if arg_57_1.var_.characterEffect1084ui_story then
					arg_57_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_8 + var_60_9 and arg_57_1.time_ < var_60_8 + var_60_9 + arg_60_0 and arg_57_1.var_.characterEffect1084ui_story then
				arg_57_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_60_11 = 0
			local var_60_12 = 0.975

			if var_60_11 < arg_57_1.time_ and arg_57_1.time_ <= var_60_11 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_13 = arg_57_1:FormatText(StoryNameCfg[6].name)

				arg_57_1.leftNameTxt_.text = var_60_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_14 = arg_57_1:GetWordFromCfg(319831014)
				local var_60_15 = arg_57_1:FormatText(var_60_14.content)

				arg_57_1.text_.text = var_60_15

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_16 = 39
				local var_60_17 = utf8.len(var_60_15)
				local var_60_18 = var_60_16 <= 0 and var_60_12 or var_60_12 * (var_60_17 / var_60_16)

				if var_60_18 > 0 and var_60_12 < var_60_18 then
					arg_57_1.talkMaxDuration = var_60_18

					if var_60_18 + var_60_11 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_18 + var_60_11
					end
				end

				arg_57_1.text_.text = var_60_15
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831014", "story_v_out_319831.awb") ~= 0 then
					local var_60_19 = manager.audio:GetVoiceLength("story_v_out_319831", "319831014", "story_v_out_319831.awb") / 1000

					if var_60_19 + var_60_11 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_19 + var_60_11
					end

					if var_60_14.prefab_name ~= "" and arg_57_1.actors_[var_60_14.prefab_name] ~= nil then
						local var_60_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_14.prefab_name].transform, "story_v_out_319831", "319831014", "story_v_out_319831.awb")

						arg_57_1:RecordAudio("319831014", var_60_20)
						arg_57_1:RecordAudio("319831014", var_60_20)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_319831", "319831014", "story_v_out_319831.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_319831", "319831014", "story_v_out_319831.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_21 = math.max(var_60_12, arg_57_1.talkMaxDuration)

			if var_60_11 <= arg_57_1.time_ and arg_57_1.time_ < var_60_11 + var_60_21 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_11) / var_60_21

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_11 + var_60_21 and arg_57_1.time_ < var_60_11 + var_60_21 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play319831015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319831015
		arg_61_1.duration_ = 4.8

		local var_61_0 = {
			zh = 1.366,
			ja = 4.8
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
				arg_61_0:Play319831016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["4040ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect4040ui_story == nil then
				arg_61_1.var_.characterEffect4040ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.200000002980232

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect4040ui_story then
					arg_61_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect4040ui_story then
				arg_61_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["1084ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and arg_61_1.var_.characterEffect1084ui_story == nil then
				arg_61_1.var_.characterEffect1084ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.200000002980232

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect1084ui_story then
					local var_64_8 = Mathf.Lerp(0, 0.5, var_64_7)

					arg_61_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1084ui_story.fillRatio = var_64_8
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and arg_61_1.var_.characterEffect1084ui_story then
				local var_64_9 = 0.5

				arg_61_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1084ui_story.fillRatio = var_64_9
			end

			local var_64_10 = 0
			local var_64_11 = 0.15

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_12 = arg_61_1:FormatText(StoryNameCfg[668].name)

				arg_61_1.leftNameTxt_.text = var_64_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_13 = arg_61_1:GetWordFromCfg(319831015)
				local var_64_14 = arg_61_1:FormatText(var_64_13.content)

				arg_61_1.text_.text = var_64_14

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_15 = 6
				local var_64_16 = utf8.len(var_64_14)
				local var_64_17 = var_64_15 <= 0 and var_64_11 or var_64_11 * (var_64_16 / var_64_15)

				if var_64_17 > 0 and var_64_11 < var_64_17 then
					arg_61_1.talkMaxDuration = var_64_17

					if var_64_17 + var_64_10 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_17 + var_64_10
					end
				end

				arg_61_1.text_.text = var_64_14
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831015", "story_v_out_319831.awb") ~= 0 then
					local var_64_18 = manager.audio:GetVoiceLength("story_v_out_319831", "319831015", "story_v_out_319831.awb") / 1000

					if var_64_18 + var_64_10 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_18 + var_64_10
					end

					if var_64_13.prefab_name ~= "" and arg_61_1.actors_[var_64_13.prefab_name] ~= nil then
						local var_64_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_13.prefab_name].transform, "story_v_out_319831", "319831015", "story_v_out_319831.awb")

						arg_61_1:RecordAudio("319831015", var_64_19)
						arg_61_1:RecordAudio("319831015", var_64_19)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_319831", "319831015", "story_v_out_319831.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_319831", "319831015", "story_v_out_319831.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_20 = math.max(var_64_11, arg_61_1.talkMaxDuration)

			if var_64_10 <= arg_61_1.time_ and arg_61_1.time_ < var_64_10 + var_64_20 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_10) / var_64_20

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_10 + var_64_20 and arg_61_1.time_ < var_64_10 + var_64_20 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play319831016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319831016
		arg_65_1.duration_ = 1.266

		local var_65_0 = {
			zh = 1.266,
			ja = 1.133
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
				arg_65_0:Play319831017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["4040ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect4040ui_story == nil then
				arg_65_1.var_.characterEffect4040ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.200000002980232

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect4040ui_story then
					local var_68_4 = Mathf.Lerp(0, 0.5, var_68_3)

					arg_65_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_65_1.var_.characterEffect4040ui_story.fillRatio = var_68_4
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect4040ui_story then
				local var_68_5 = 0.5

				arg_65_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_65_1.var_.characterEffect4040ui_story.fillRatio = var_68_5
			end

			local var_68_6 = arg_65_1.actors_["1084ui_story"]
			local var_68_7 = 0

			if var_68_7 < arg_65_1.time_ and arg_65_1.time_ <= var_68_7 + arg_68_0 and arg_65_1.var_.characterEffect1084ui_story == nil then
				arg_65_1.var_.characterEffect1084ui_story = var_68_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_8 = 0.200000002980232

			if var_68_7 <= arg_65_1.time_ and arg_65_1.time_ < var_68_7 + var_68_8 then
				local var_68_9 = (arg_65_1.time_ - var_68_7) / var_68_8

				if arg_65_1.var_.characterEffect1084ui_story then
					arg_65_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_7 + var_68_8 and arg_65_1.time_ < var_68_7 + var_68_8 + arg_68_0 and arg_65_1.var_.characterEffect1084ui_story then
				arg_65_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_68_10 = 0
			local var_68_11 = 0.075

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_12 = arg_65_1:FormatText(StoryNameCfg[6].name)

				arg_65_1.leftNameTxt_.text = var_68_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_13 = arg_65_1:GetWordFromCfg(319831016)
				local var_68_14 = arg_65_1:FormatText(var_68_13.content)

				arg_65_1.text_.text = var_68_14

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_15 = 3
				local var_68_16 = utf8.len(var_68_14)
				local var_68_17 = var_68_15 <= 0 and var_68_11 or var_68_11 * (var_68_16 / var_68_15)

				if var_68_17 > 0 and var_68_11 < var_68_17 then
					arg_65_1.talkMaxDuration = var_68_17

					if var_68_17 + var_68_10 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_17 + var_68_10
					end
				end

				arg_65_1.text_.text = var_68_14
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831016", "story_v_out_319831.awb") ~= 0 then
					local var_68_18 = manager.audio:GetVoiceLength("story_v_out_319831", "319831016", "story_v_out_319831.awb") / 1000

					if var_68_18 + var_68_10 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_18 + var_68_10
					end

					if var_68_13.prefab_name ~= "" and arg_65_1.actors_[var_68_13.prefab_name] ~= nil then
						local var_68_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_13.prefab_name].transform, "story_v_out_319831", "319831016", "story_v_out_319831.awb")

						arg_65_1:RecordAudio("319831016", var_68_19)
						arg_65_1:RecordAudio("319831016", var_68_19)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_319831", "319831016", "story_v_out_319831.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_319831", "319831016", "story_v_out_319831.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_20 = math.max(var_68_11, arg_65_1.talkMaxDuration)

			if var_68_10 <= arg_65_1.time_ and arg_65_1.time_ < var_68_10 + var_68_20 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_10) / var_68_20

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_10 + var_68_20 and arg_65_1.time_ < var_68_10 + var_68_20 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play319831017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319831017
		arg_69_1.duration_ = 4.4

		local var_69_0 = {
			zh = 2.166,
			ja = 4.4
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
				arg_69_0:Play319831018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["4040ui_story"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos4040ui_story = var_72_0.localPosition
			end

			local var_72_2 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2
				local var_72_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos4040ui_story, var_72_4, var_72_3)

				local var_72_5 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_5.x, var_72_5.y, var_72_5.z)

				local var_72_6 = var_72_0.localEulerAngles

				var_72_6.z = 0
				var_72_6.x = 0
				var_72_0.localEulerAngles = var_72_6
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_72_7 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_7.x, var_72_7.y, var_72_7.z)

				local var_72_8 = var_72_0.localEulerAngles

				var_72_8.z = 0
				var_72_8.x = 0
				var_72_0.localEulerAngles = var_72_8
			end

			local var_72_9 = arg_69_1.actors_["4040ui_story"]
			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 and arg_69_1.var_.characterEffect4040ui_story == nil then
				arg_69_1.var_.characterEffect4040ui_story = var_72_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_11 = 0.200000002980232

			if var_72_10 <= arg_69_1.time_ and arg_69_1.time_ < var_72_10 + var_72_11 then
				local var_72_12 = (arg_69_1.time_ - var_72_10) / var_72_11

				if arg_69_1.var_.characterEffect4040ui_story then
					arg_69_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_10 + var_72_11 and arg_69_1.time_ < var_72_10 + var_72_11 + arg_72_0 and arg_69_1.var_.characterEffect4040ui_story then
				arg_69_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_72_13 = 0

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				arg_69_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_72_15 = arg_69_1.actors_["1084ui_story"]
			local var_72_16 = 0

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story == nil then
				arg_69_1.var_.characterEffect1084ui_story = var_72_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_17 = 0.200000002980232

			if var_72_16 <= arg_69_1.time_ and arg_69_1.time_ < var_72_16 + var_72_17 then
				local var_72_18 = (arg_69_1.time_ - var_72_16) / var_72_17

				if arg_69_1.var_.characterEffect1084ui_story then
					local var_72_19 = Mathf.Lerp(0, 0.5, var_72_18)

					arg_69_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1084ui_story.fillRatio = var_72_19
				end
			end

			if arg_69_1.time_ >= var_72_16 + var_72_17 and arg_69_1.time_ < var_72_16 + var_72_17 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story then
				local var_72_20 = 0.5

				arg_69_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1084ui_story.fillRatio = var_72_20
			end

			local var_72_21 = 0
			local var_72_22 = 0.175

			if var_72_21 < arg_69_1.time_ and arg_69_1.time_ <= var_72_21 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_23 = arg_69_1:FormatText(StoryNameCfg[668].name)

				arg_69_1.leftNameTxt_.text = var_72_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_24 = arg_69_1:GetWordFromCfg(319831017)
				local var_72_25 = arg_69_1:FormatText(var_72_24.content)

				arg_69_1.text_.text = var_72_25

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_26 = 7
				local var_72_27 = utf8.len(var_72_25)
				local var_72_28 = var_72_26 <= 0 and var_72_22 or var_72_22 * (var_72_27 / var_72_26)

				if var_72_28 > 0 and var_72_22 < var_72_28 then
					arg_69_1.talkMaxDuration = var_72_28

					if var_72_28 + var_72_21 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_28 + var_72_21
					end
				end

				arg_69_1.text_.text = var_72_25
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831017", "story_v_out_319831.awb") ~= 0 then
					local var_72_29 = manager.audio:GetVoiceLength("story_v_out_319831", "319831017", "story_v_out_319831.awb") / 1000

					if var_72_29 + var_72_21 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_29 + var_72_21
					end

					if var_72_24.prefab_name ~= "" and arg_69_1.actors_[var_72_24.prefab_name] ~= nil then
						local var_72_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_24.prefab_name].transform, "story_v_out_319831", "319831017", "story_v_out_319831.awb")

						arg_69_1:RecordAudio("319831017", var_72_30)
						arg_69_1:RecordAudio("319831017", var_72_30)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_319831", "319831017", "story_v_out_319831.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_319831", "319831017", "story_v_out_319831.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_31 = math.max(var_72_22, arg_69_1.talkMaxDuration)

			if var_72_21 <= arg_69_1.time_ and arg_69_1.time_ < var_72_21 + var_72_31 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_21) / var_72_31

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_21 + var_72_31 and arg_69_1.time_ < var_72_21 + var_72_31 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319831018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319831018
		arg_73_1.duration_ = 4.2

		local var_73_0 = {
			zh = 1.999999999999,
			ja = 4.2
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
				arg_73_0:Play319831019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["4040ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect4040ui_story == nil then
				arg_73_1.var_.characterEffect4040ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.200000002980232

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect4040ui_story then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_73_1.var_.characterEffect4040ui_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect4040ui_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_73_1.var_.characterEffect4040ui_story.fillRatio = var_76_5
			end

			local var_76_6 = arg_73_1.actors_["1084ui_story"]
			local var_76_7 = 0

			if var_76_7 < arg_73_1.time_ and arg_73_1.time_ <= var_76_7 + arg_76_0 and arg_73_1.var_.characterEffect1084ui_story == nil then
				arg_73_1.var_.characterEffect1084ui_story = var_76_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_8 = 0.200000002980232

			if var_76_7 <= arg_73_1.time_ and arg_73_1.time_ < var_76_7 + var_76_8 then
				local var_76_9 = (arg_73_1.time_ - var_76_7) / var_76_8

				if arg_73_1.var_.characterEffect1084ui_story then
					arg_73_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_7 + var_76_8 and arg_73_1.time_ < var_76_7 + var_76_8 + arg_76_0 and arg_73_1.var_.characterEffect1084ui_story then
				arg_73_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_76_11 = 0

			if var_76_11 < arg_73_1.time_ and arg_73_1.time_ <= var_76_11 + arg_76_0 then
				arg_73_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_76_12 = 0
			local var_76_13 = 0.25

			if var_76_12 < arg_73_1.time_ and arg_73_1.time_ <= var_76_12 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_14 = arg_73_1:FormatText(StoryNameCfg[6].name)

				arg_73_1.leftNameTxt_.text = var_76_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_15 = arg_73_1:GetWordFromCfg(319831018)
				local var_76_16 = arg_73_1:FormatText(var_76_15.content)

				arg_73_1.text_.text = var_76_16

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_17 = 10
				local var_76_18 = utf8.len(var_76_16)
				local var_76_19 = var_76_17 <= 0 and var_76_13 or var_76_13 * (var_76_18 / var_76_17)

				if var_76_19 > 0 and var_76_13 < var_76_19 then
					arg_73_1.talkMaxDuration = var_76_19

					if var_76_19 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_19 + var_76_12
					end
				end

				arg_73_1.text_.text = var_76_16
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831018", "story_v_out_319831.awb") ~= 0 then
					local var_76_20 = manager.audio:GetVoiceLength("story_v_out_319831", "319831018", "story_v_out_319831.awb") / 1000

					if var_76_20 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_12
					end

					if var_76_15.prefab_name ~= "" and arg_73_1.actors_[var_76_15.prefab_name] ~= nil then
						local var_76_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_15.prefab_name].transform, "story_v_out_319831", "319831018", "story_v_out_319831.awb")

						arg_73_1:RecordAudio("319831018", var_76_21)
						arg_73_1:RecordAudio("319831018", var_76_21)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_319831", "319831018", "story_v_out_319831.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_319831", "319831018", "story_v_out_319831.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_22 = math.max(var_76_13, arg_73_1.talkMaxDuration)

			if var_76_12 <= arg_73_1.time_ and arg_73_1.time_ < var_76_12 + var_76_22 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_12) / var_76_22

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_12 + var_76_22 and arg_73_1.time_ < var_76_12 + var_76_22 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play319831019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319831019
		arg_77_1.duration_ = 12.3

		local var_77_0 = {
			zh = 9.133,
			ja = 12.3
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
				arg_77_0:Play319831020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["4040ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect4040ui_story == nil then
				arg_77_1.var_.characterEffect4040ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.200000002980232

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect4040ui_story then
					arg_77_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect4040ui_story then
				arg_77_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_80_4 = arg_77_1.actors_["1084ui_story"]
			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 and arg_77_1.var_.characterEffect1084ui_story == nil then
				arg_77_1.var_.characterEffect1084ui_story = var_80_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_6 = 0.200000002980232

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_6 then
				local var_80_7 = (arg_77_1.time_ - var_80_5) / var_80_6

				if arg_77_1.var_.characterEffect1084ui_story then
					local var_80_8 = Mathf.Lerp(0, 0.5, var_80_7)

					arg_77_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1084ui_story.fillRatio = var_80_8
				end
			end

			if arg_77_1.time_ >= var_80_5 + var_80_6 and arg_77_1.time_ < var_80_5 + var_80_6 + arg_80_0 and arg_77_1.var_.characterEffect1084ui_story then
				local var_80_9 = 0.5

				arg_77_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1084ui_story.fillRatio = var_80_9
			end

			local var_80_10 = 0
			local var_80_11 = 1.025

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_12 = arg_77_1:FormatText(StoryNameCfg[668].name)

				arg_77_1.leftNameTxt_.text = var_80_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_13 = arg_77_1:GetWordFromCfg(319831019)
				local var_80_14 = arg_77_1:FormatText(var_80_13.content)

				arg_77_1.text_.text = var_80_14

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_15 = 41
				local var_80_16 = utf8.len(var_80_14)
				local var_80_17 = var_80_15 <= 0 and var_80_11 or var_80_11 * (var_80_16 / var_80_15)

				if var_80_17 > 0 and var_80_11 < var_80_17 then
					arg_77_1.talkMaxDuration = var_80_17

					if var_80_17 + var_80_10 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_17 + var_80_10
					end
				end

				arg_77_1.text_.text = var_80_14
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831019", "story_v_out_319831.awb") ~= 0 then
					local var_80_18 = manager.audio:GetVoiceLength("story_v_out_319831", "319831019", "story_v_out_319831.awb") / 1000

					if var_80_18 + var_80_10 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_18 + var_80_10
					end

					if var_80_13.prefab_name ~= "" and arg_77_1.actors_[var_80_13.prefab_name] ~= nil then
						local var_80_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_13.prefab_name].transform, "story_v_out_319831", "319831019", "story_v_out_319831.awb")

						arg_77_1:RecordAudio("319831019", var_80_19)
						arg_77_1:RecordAudio("319831019", var_80_19)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_319831", "319831019", "story_v_out_319831.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_319831", "319831019", "story_v_out_319831.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_20 = math.max(var_80_11, arg_77_1.talkMaxDuration)

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_20 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_10) / var_80_20

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_10 + var_80_20 and arg_77_1.time_ < var_80_10 + var_80_20 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319831020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319831020
		arg_81_1.duration_ = 3.4

		local var_81_0 = {
			zh = 2.3,
			ja = 3.4
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
				arg_81_0:Play319831021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1084ui_story"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos1084ui_story = var_84_0.localPosition
			end

			local var_84_2 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2
				local var_84_4 = Vector3.New(0.7, -0.97, -6)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1084ui_story, var_84_4, var_84_3)

				local var_84_5 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_5.x, var_84_5.y, var_84_5.z)

				local var_84_6 = var_84_0.localEulerAngles

				var_84_6.z = 0
				var_84_6.x = 0
				var_84_0.localEulerAngles = var_84_6
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_84_7 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_7.x, var_84_7.y, var_84_7.z)

				local var_84_8 = var_84_0.localEulerAngles

				var_84_8.z = 0
				var_84_8.x = 0
				var_84_0.localEulerAngles = var_84_8
			end

			local var_84_9 = 0

			if var_84_9 < arg_81_1.time_ and arg_81_1.time_ <= var_84_9 + arg_84_0 then
				arg_81_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_84_10 = arg_81_1.actors_["4040ui_story"]
			local var_84_11 = 0

			if var_84_11 < arg_81_1.time_ and arg_81_1.time_ <= var_84_11 + arg_84_0 and arg_81_1.var_.characterEffect4040ui_story == nil then
				arg_81_1.var_.characterEffect4040ui_story = var_84_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_12 = 0.200000002980232

			if var_84_11 <= arg_81_1.time_ and arg_81_1.time_ < var_84_11 + var_84_12 then
				local var_84_13 = (arg_81_1.time_ - var_84_11) / var_84_12

				if arg_81_1.var_.characterEffect4040ui_story then
					local var_84_14 = Mathf.Lerp(0, 0.5, var_84_13)

					arg_81_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_81_1.var_.characterEffect4040ui_story.fillRatio = var_84_14
				end
			end

			if arg_81_1.time_ >= var_84_11 + var_84_12 and arg_81_1.time_ < var_84_11 + var_84_12 + arg_84_0 and arg_81_1.var_.characterEffect4040ui_story then
				local var_84_15 = 0.5

				arg_81_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_81_1.var_.characterEffect4040ui_story.fillRatio = var_84_15
			end

			local var_84_16 = arg_81_1.actors_["1084ui_story"]
			local var_84_17 = 0

			if var_84_17 < arg_81_1.time_ and arg_81_1.time_ <= var_84_17 + arg_84_0 and arg_81_1.var_.characterEffect1084ui_story == nil then
				arg_81_1.var_.characterEffect1084ui_story = var_84_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_18 = 0.200000002980232

			if var_84_17 <= arg_81_1.time_ and arg_81_1.time_ < var_84_17 + var_84_18 then
				local var_84_19 = (arg_81_1.time_ - var_84_17) / var_84_18

				if arg_81_1.var_.characterEffect1084ui_story then
					arg_81_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_17 + var_84_18 and arg_81_1.time_ < var_84_17 + var_84_18 + arg_84_0 and arg_81_1.var_.characterEffect1084ui_story then
				arg_81_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_84_20 = 0
			local var_84_21 = 0.325

			if var_84_20 < arg_81_1.time_ and arg_81_1.time_ <= var_84_20 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_22 = arg_81_1:FormatText(StoryNameCfg[6].name)

				arg_81_1.leftNameTxt_.text = var_84_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_23 = arg_81_1:GetWordFromCfg(319831020)
				local var_84_24 = arg_81_1:FormatText(var_84_23.content)

				arg_81_1.text_.text = var_84_24

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_25 = 13
				local var_84_26 = utf8.len(var_84_24)
				local var_84_27 = var_84_25 <= 0 and var_84_21 or var_84_21 * (var_84_26 / var_84_25)

				if var_84_27 > 0 and var_84_21 < var_84_27 then
					arg_81_1.talkMaxDuration = var_84_27

					if var_84_27 + var_84_20 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_27 + var_84_20
					end
				end

				arg_81_1.text_.text = var_84_24
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831020", "story_v_out_319831.awb") ~= 0 then
					local var_84_28 = manager.audio:GetVoiceLength("story_v_out_319831", "319831020", "story_v_out_319831.awb") / 1000

					if var_84_28 + var_84_20 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_28 + var_84_20
					end

					if var_84_23.prefab_name ~= "" and arg_81_1.actors_[var_84_23.prefab_name] ~= nil then
						local var_84_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_23.prefab_name].transform, "story_v_out_319831", "319831020", "story_v_out_319831.awb")

						arg_81_1:RecordAudio("319831020", var_84_29)
						arg_81_1:RecordAudio("319831020", var_84_29)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_319831", "319831020", "story_v_out_319831.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_319831", "319831020", "story_v_out_319831.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_30 = math.max(var_84_21, arg_81_1.talkMaxDuration)

			if var_84_20 <= arg_81_1.time_ and arg_81_1.time_ < var_84_20 + var_84_30 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_20) / var_84_30

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_20 + var_84_30 and arg_81_1.time_ < var_84_20 + var_84_30 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play319831021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 319831021
		arg_85_1.duration_ = 11.133

		local var_85_0 = {
			zh = 8.233,
			ja = 11.133
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
				arg_85_0:Play319831022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["4040ui_story"].transform
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.var_.moveOldPos4040ui_story = var_88_0.localPosition
			end

			local var_88_2 = 0.001

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2
				local var_88_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_88_0.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos4040ui_story, var_88_4, var_88_3)

				local var_88_5 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_5.x, var_88_5.y, var_88_5.z)

				local var_88_6 = var_88_0.localEulerAngles

				var_88_6.z = 0
				var_88_6.x = 0
				var_88_0.localEulerAngles = var_88_6
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 then
				var_88_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_88_7 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_7.x, var_88_7.y, var_88_7.z)

				local var_88_8 = var_88_0.localEulerAngles

				var_88_8.z = 0
				var_88_8.x = 0
				var_88_0.localEulerAngles = var_88_8
			end

			local var_88_9 = arg_85_1.actors_["4040ui_story"]
			local var_88_10 = 0

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 and arg_85_1.var_.characterEffect4040ui_story == nil then
				arg_85_1.var_.characterEffect4040ui_story = var_88_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_11 = 0.200000002980232

			if var_88_10 <= arg_85_1.time_ and arg_85_1.time_ < var_88_10 + var_88_11 then
				local var_88_12 = (arg_85_1.time_ - var_88_10) / var_88_11

				if arg_85_1.var_.characterEffect4040ui_story then
					arg_85_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_10 + var_88_11 and arg_85_1.time_ < var_88_10 + var_88_11 + arg_88_0 and arg_85_1.var_.characterEffect4040ui_story then
				arg_85_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_88_13 = arg_85_1.actors_["1084ui_story"]
			local var_88_14 = 0

			if var_88_14 < arg_85_1.time_ and arg_85_1.time_ <= var_88_14 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story == nil then
				arg_85_1.var_.characterEffect1084ui_story = var_88_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_15 = 0.200000002980232

			if var_88_14 <= arg_85_1.time_ and arg_85_1.time_ < var_88_14 + var_88_15 then
				local var_88_16 = (arg_85_1.time_ - var_88_14) / var_88_15

				if arg_85_1.var_.characterEffect1084ui_story then
					local var_88_17 = Mathf.Lerp(0, 0.5, var_88_16)

					arg_85_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_85_1.var_.characterEffect1084ui_story.fillRatio = var_88_17
				end
			end

			if arg_85_1.time_ >= var_88_14 + var_88_15 and arg_85_1.time_ < var_88_14 + var_88_15 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story then
				local var_88_18 = 0.5

				arg_85_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_85_1.var_.characterEffect1084ui_story.fillRatio = var_88_18
			end

			local var_88_19 = 0
			local var_88_20 = 0.95

			if var_88_19 < arg_85_1.time_ and arg_85_1.time_ <= var_88_19 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_21 = arg_85_1:FormatText(StoryNameCfg[668].name)

				arg_85_1.leftNameTxt_.text = var_88_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_22 = arg_85_1:GetWordFromCfg(319831021)
				local var_88_23 = arg_85_1:FormatText(var_88_22.content)

				arg_85_1.text_.text = var_88_23

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_24 = 38
				local var_88_25 = utf8.len(var_88_23)
				local var_88_26 = var_88_24 <= 0 and var_88_20 or var_88_20 * (var_88_25 / var_88_24)

				if var_88_26 > 0 and var_88_20 < var_88_26 then
					arg_85_1.talkMaxDuration = var_88_26

					if var_88_26 + var_88_19 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_26 + var_88_19
					end
				end

				arg_85_1.text_.text = var_88_23
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831021", "story_v_out_319831.awb") ~= 0 then
					local var_88_27 = manager.audio:GetVoiceLength("story_v_out_319831", "319831021", "story_v_out_319831.awb") / 1000

					if var_88_27 + var_88_19 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_27 + var_88_19
					end

					if var_88_22.prefab_name ~= "" and arg_85_1.actors_[var_88_22.prefab_name] ~= nil then
						local var_88_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_22.prefab_name].transform, "story_v_out_319831", "319831021", "story_v_out_319831.awb")

						arg_85_1:RecordAudio("319831021", var_88_28)
						arg_85_1:RecordAudio("319831021", var_88_28)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_319831", "319831021", "story_v_out_319831.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_319831", "319831021", "story_v_out_319831.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_29 = math.max(var_88_20, arg_85_1.talkMaxDuration)

			if var_88_19 <= arg_85_1.time_ and arg_85_1.time_ < var_88_19 + var_88_29 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_19) / var_88_29

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_19 + var_88_29 and arg_85_1.time_ < var_88_19 + var_88_29 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play319831022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 319831022
		arg_89_1.duration_ = 12.333

		local var_89_0 = {
			zh = 9.7,
			ja = 12.333
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
				arg_89_0:Play319831023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_2")
			end

			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_92_2 = 0
			local var_92_3 = 1.15

			if var_92_2 < arg_89_1.time_ and arg_89_1.time_ <= var_92_2 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_4 = arg_89_1:FormatText(StoryNameCfg[668].name)

				arg_89_1.leftNameTxt_.text = var_92_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_5 = arg_89_1:GetWordFromCfg(319831022)
				local var_92_6 = arg_89_1:FormatText(var_92_5.content)

				arg_89_1.text_.text = var_92_6

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_7 = 46
				local var_92_8 = utf8.len(var_92_6)
				local var_92_9 = var_92_7 <= 0 and var_92_3 or var_92_3 * (var_92_8 / var_92_7)

				if var_92_9 > 0 and var_92_3 < var_92_9 then
					arg_89_1.talkMaxDuration = var_92_9

					if var_92_9 + var_92_2 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_9 + var_92_2
					end
				end

				arg_89_1.text_.text = var_92_6
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831022", "story_v_out_319831.awb") ~= 0 then
					local var_92_10 = manager.audio:GetVoiceLength("story_v_out_319831", "319831022", "story_v_out_319831.awb") / 1000

					if var_92_10 + var_92_2 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_10 + var_92_2
					end

					if var_92_5.prefab_name ~= "" and arg_89_1.actors_[var_92_5.prefab_name] ~= nil then
						local var_92_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_5.prefab_name].transform, "story_v_out_319831", "319831022", "story_v_out_319831.awb")

						arg_89_1:RecordAudio("319831022", var_92_11)
						arg_89_1:RecordAudio("319831022", var_92_11)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_319831", "319831022", "story_v_out_319831.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_319831", "319831022", "story_v_out_319831.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_12 = math.max(var_92_3, arg_89_1.talkMaxDuration)

			if var_92_2 <= arg_89_1.time_ and arg_89_1.time_ < var_92_2 + var_92_12 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_2) / var_92_12

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_2 + var_92_12 and arg_89_1.time_ < var_92_2 + var_92_12 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play319831023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 319831023
		arg_93_1.duration_ = 10.166

		local var_93_0 = {
			zh = 3.266,
			ja = 10.166
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
				arg_93_0:Play319831024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.35

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[668].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(319831023)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831023", "story_v_out_319831.awb") ~= 0 then
					local var_96_8 = manager.audio:GetVoiceLength("story_v_out_319831", "319831023", "story_v_out_319831.awb") / 1000

					if var_96_8 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_8 + var_96_0
					end

					if var_96_3.prefab_name ~= "" and arg_93_1.actors_[var_96_3.prefab_name] ~= nil then
						local var_96_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_3.prefab_name].transform, "story_v_out_319831", "319831023", "story_v_out_319831.awb")

						arg_93_1:RecordAudio("319831023", var_96_9)
						arg_93_1:RecordAudio("319831023", var_96_9)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_319831", "319831023", "story_v_out_319831.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_319831", "319831023", "story_v_out_319831.awb")
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
	Play319831024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 319831024
		arg_97_1.duration_ = 3.233

		local var_97_0 = {
			zh = 1.999999999999,
			ja = 3.233
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
				arg_97_0:Play319831025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["4040ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect4040ui_story == nil then
				arg_97_1.var_.characterEffect4040ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect4040ui_story then
					local var_100_4 = Mathf.Lerp(0, 0.5, var_100_3)

					arg_97_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_97_1.var_.characterEffect4040ui_story.fillRatio = var_100_4
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect4040ui_story then
				local var_100_5 = 0.5

				arg_97_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_97_1.var_.characterEffect4040ui_story.fillRatio = var_100_5
			end

			local var_100_6 = arg_97_1.actors_["1084ui_story"]
			local var_100_7 = 0

			if var_100_7 < arg_97_1.time_ and arg_97_1.time_ <= var_100_7 + arg_100_0 and arg_97_1.var_.characterEffect1084ui_story == nil then
				arg_97_1.var_.characterEffect1084ui_story = var_100_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_8 = 0.200000002980232

			if var_100_7 <= arg_97_1.time_ and arg_97_1.time_ < var_100_7 + var_100_8 then
				local var_100_9 = (arg_97_1.time_ - var_100_7) / var_100_8

				if arg_97_1.var_.characterEffect1084ui_story then
					arg_97_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_7 + var_100_8 and arg_97_1.time_ < var_100_7 + var_100_8 + arg_100_0 and arg_97_1.var_.characterEffect1084ui_story then
				arg_97_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 then
				arg_97_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_2")
			end

			local var_100_11 = 0
			local var_100_12 = 0.175

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_13 = arg_97_1:FormatText(StoryNameCfg[6].name)

				arg_97_1.leftNameTxt_.text = var_100_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_14 = arg_97_1:GetWordFromCfg(319831024)
				local var_100_15 = arg_97_1:FormatText(var_100_14.content)

				arg_97_1.text_.text = var_100_15

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_16 = 7
				local var_100_17 = utf8.len(var_100_15)
				local var_100_18 = var_100_16 <= 0 and var_100_12 or var_100_12 * (var_100_17 / var_100_16)

				if var_100_18 > 0 and var_100_12 < var_100_18 then
					arg_97_1.talkMaxDuration = var_100_18

					if var_100_18 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_11
					end
				end

				arg_97_1.text_.text = var_100_15
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831024", "story_v_out_319831.awb") ~= 0 then
					local var_100_19 = manager.audio:GetVoiceLength("story_v_out_319831", "319831024", "story_v_out_319831.awb") / 1000

					if var_100_19 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_19 + var_100_11
					end

					if var_100_14.prefab_name ~= "" and arg_97_1.actors_[var_100_14.prefab_name] ~= nil then
						local var_100_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_14.prefab_name].transform, "story_v_out_319831", "319831024", "story_v_out_319831.awb")

						arg_97_1:RecordAudio("319831024", var_100_20)
						arg_97_1:RecordAudio("319831024", var_100_20)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_319831", "319831024", "story_v_out_319831.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_319831", "319831024", "story_v_out_319831.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_21 = math.max(var_100_12, arg_97_1.talkMaxDuration)

			if var_100_11 <= arg_97_1.time_ and arg_97_1.time_ < var_100_11 + var_100_21 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_11) / var_100_21

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_11 + var_100_21 and arg_97_1.time_ < var_100_11 + var_100_21 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play319831025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 319831025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play319831026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1084ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1084ui_story == nil then
				arg_101_1.var_.characterEffect1084ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.200000002980232

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1084ui_story then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1084ui_story.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1084ui_story then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1084ui_story.fillRatio = var_104_5
			end

			local var_104_6 = 0
			local var_104_7 = 1.225

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_8 = arg_101_1:GetWordFromCfg(319831025)
				local var_104_9 = arg_101_1:FormatText(var_104_8.content)

				arg_101_1.text_.text = var_104_9

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_10 = 49
				local var_104_11 = utf8.len(var_104_9)
				local var_104_12 = var_104_10 <= 0 and var_104_7 or var_104_7 * (var_104_11 / var_104_10)

				if var_104_12 > 0 and var_104_7 < var_104_12 then
					arg_101_1.talkMaxDuration = var_104_12

					if var_104_12 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_12 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_9
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_13 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_13 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_13

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_13 and arg_101_1.time_ < var_104_6 + var_104_13 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play319831026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319831026
		arg_105_1.duration_ = 3.866

		local var_105_0 = {
			zh = 3.866,
			ja = 2.833
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
				arg_105_0:Play319831027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1084ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos1084ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0.7, -0.97, -6)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1084ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["1084ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story == nil then
				arg_105_1.var_.characterEffect1084ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.200000002980232

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect1084ui_story then
					arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story then
				arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_108_15 = 0
			local var_108_16 = 0.475

			if var_108_15 < arg_105_1.time_ and arg_105_1.time_ <= var_108_15 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_17 = arg_105_1:FormatText(StoryNameCfg[6].name)

				arg_105_1.leftNameTxt_.text = var_108_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_18 = arg_105_1:GetWordFromCfg(319831026)
				local var_108_19 = arg_105_1:FormatText(var_108_18.content)

				arg_105_1.text_.text = var_108_19

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_20 = 19
				local var_108_21 = utf8.len(var_108_19)
				local var_108_22 = var_108_20 <= 0 and var_108_16 or var_108_16 * (var_108_21 / var_108_20)

				if var_108_22 > 0 and var_108_16 < var_108_22 then
					arg_105_1.talkMaxDuration = var_108_22

					if var_108_22 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_22 + var_108_15
					end
				end

				arg_105_1.text_.text = var_108_19
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831026", "story_v_out_319831.awb") ~= 0 then
					local var_108_23 = manager.audio:GetVoiceLength("story_v_out_319831", "319831026", "story_v_out_319831.awb") / 1000

					if var_108_23 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_23 + var_108_15
					end

					if var_108_18.prefab_name ~= "" and arg_105_1.actors_[var_108_18.prefab_name] ~= nil then
						local var_108_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_18.prefab_name].transform, "story_v_out_319831", "319831026", "story_v_out_319831.awb")

						arg_105_1:RecordAudio("319831026", var_108_24)
						arg_105_1:RecordAudio("319831026", var_108_24)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_319831", "319831026", "story_v_out_319831.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_319831", "319831026", "story_v_out_319831.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_25 = math.max(var_108_16, arg_105_1.talkMaxDuration)

			if var_108_15 <= arg_105_1.time_ and arg_105_1.time_ < var_108_15 + var_108_25 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_15) / var_108_25

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_15 + var_108_25 and arg_105_1.time_ < var_108_15 + var_108_25 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play319831027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319831027
		arg_109_1.duration_ = 6.233

		local var_109_0 = {
			zh = 3.4,
			ja = 6.233
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
				arg_109_0:Play319831028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["4040ui_story"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos4040ui_story = var_112_0.localPosition
			end

			local var_112_2 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2
				local var_112_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos4040ui_story, var_112_4, var_112_3)

				local var_112_5 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_5.x, var_112_5.y, var_112_5.z)

				local var_112_6 = var_112_0.localEulerAngles

				var_112_6.z = 0
				var_112_6.x = 0
				var_112_0.localEulerAngles = var_112_6
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_112_7 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_7.x, var_112_7.y, var_112_7.z)

				local var_112_8 = var_112_0.localEulerAngles

				var_112_8.z = 0
				var_112_8.x = 0
				var_112_0.localEulerAngles = var_112_8
			end

			local var_112_9 = arg_109_1.actors_["1084ui_story"]
			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story == nil then
				arg_109_1.var_.characterEffect1084ui_story = var_112_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_11 = 0.200000002980232

			if var_112_10 <= arg_109_1.time_ and arg_109_1.time_ < var_112_10 + var_112_11 then
				local var_112_12 = (arg_109_1.time_ - var_112_10) / var_112_11

				if arg_109_1.var_.characterEffect1084ui_story then
					local var_112_13 = Mathf.Lerp(0, 0.5, var_112_12)

					arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_13
				end
			end

			if arg_109_1.time_ >= var_112_10 + var_112_11 and arg_109_1.time_ < var_112_10 + var_112_11 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story then
				local var_112_14 = 0.5

				arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_14
			end

			local var_112_15 = arg_109_1.actors_["4040ui_story"]
			local var_112_16 = 0

			if var_112_16 < arg_109_1.time_ and arg_109_1.time_ <= var_112_16 + arg_112_0 and arg_109_1.var_.characterEffect4040ui_story == nil then
				arg_109_1.var_.characterEffect4040ui_story = var_112_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_17 = 0.200000002980232

			if var_112_16 <= arg_109_1.time_ and arg_109_1.time_ < var_112_16 + var_112_17 then
				local var_112_18 = (arg_109_1.time_ - var_112_16) / var_112_17

				if arg_109_1.var_.characterEffect4040ui_story then
					arg_109_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_16 + var_112_17 and arg_109_1.time_ < var_112_16 + var_112_17 + arg_112_0 and arg_109_1.var_.characterEffect4040ui_story then
				arg_109_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_112_19 = 0
			local var_112_20 = 0.35

			if var_112_19 < arg_109_1.time_ and arg_109_1.time_ <= var_112_19 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_21 = arg_109_1:FormatText(StoryNameCfg[668].name)

				arg_109_1.leftNameTxt_.text = var_112_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_22 = arg_109_1:GetWordFromCfg(319831027)
				local var_112_23 = arg_109_1:FormatText(var_112_22.content)

				arg_109_1.text_.text = var_112_23

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_24 = 14
				local var_112_25 = utf8.len(var_112_23)
				local var_112_26 = var_112_24 <= 0 and var_112_20 or var_112_20 * (var_112_25 / var_112_24)

				if var_112_26 > 0 and var_112_20 < var_112_26 then
					arg_109_1.talkMaxDuration = var_112_26

					if var_112_26 + var_112_19 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_26 + var_112_19
					end
				end

				arg_109_1.text_.text = var_112_23
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831027", "story_v_out_319831.awb") ~= 0 then
					local var_112_27 = manager.audio:GetVoiceLength("story_v_out_319831", "319831027", "story_v_out_319831.awb") / 1000

					if var_112_27 + var_112_19 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_27 + var_112_19
					end

					if var_112_22.prefab_name ~= "" and arg_109_1.actors_[var_112_22.prefab_name] ~= nil then
						local var_112_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_22.prefab_name].transform, "story_v_out_319831", "319831027", "story_v_out_319831.awb")

						arg_109_1:RecordAudio("319831027", var_112_28)
						arg_109_1:RecordAudio("319831027", var_112_28)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_319831", "319831027", "story_v_out_319831.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_319831", "319831027", "story_v_out_319831.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_29 = math.max(var_112_20, arg_109_1.talkMaxDuration)

			if var_112_19 <= arg_109_1.time_ and arg_109_1.time_ < var_112_19 + var_112_29 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_19) / var_112_29

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_19 + var_112_29 and arg_109_1.time_ < var_112_19 + var_112_29 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play319831028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319831028
		arg_113_1.duration_ = 3.5

		local var_113_0 = {
			zh = 2.933,
			ja = 3.5
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
				arg_113_0:Play319831029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1084ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1084ui_story == nil then
				arg_113_1.var_.characterEffect1084ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1084ui_story then
					arg_113_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1084ui_story then
				arg_113_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_116_4 = arg_113_1.actors_["4040ui_story"]
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 and arg_113_1.var_.characterEffect4040ui_story == nil then
				arg_113_1.var_.characterEffect4040ui_story = var_116_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_6 = 0.200000002980232

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_6 then
				local var_116_7 = (arg_113_1.time_ - var_116_5) / var_116_6

				if arg_113_1.var_.characterEffect4040ui_story then
					local var_116_8 = Mathf.Lerp(0, 0.5, var_116_7)

					arg_113_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_113_1.var_.characterEffect4040ui_story.fillRatio = var_116_8
				end
			end

			if arg_113_1.time_ >= var_116_5 + var_116_6 and arg_113_1.time_ < var_116_5 + var_116_6 + arg_116_0 and arg_113_1.var_.characterEffect4040ui_story then
				local var_116_9 = 0.5

				arg_113_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_113_1.var_.characterEffect4040ui_story.fillRatio = var_116_9
			end

			local var_116_10 = 0

			if var_116_10 < arg_113_1.time_ and arg_113_1.time_ <= var_116_10 + arg_116_0 then
				arg_113_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_116_11 = 0

			if var_116_11 < arg_113_1.time_ and arg_113_1.time_ <= var_116_11 + arg_116_0 then
				arg_113_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_116_12 = 0
			local var_116_13 = 0.25

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_14 = arg_113_1:FormatText(StoryNameCfg[6].name)

				arg_113_1.leftNameTxt_.text = var_116_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_15 = arg_113_1:GetWordFromCfg(319831028)
				local var_116_16 = arg_113_1:FormatText(var_116_15.content)

				arg_113_1.text_.text = var_116_16

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_17 = 10
				local var_116_18 = utf8.len(var_116_16)
				local var_116_19 = var_116_17 <= 0 and var_116_13 or var_116_13 * (var_116_18 / var_116_17)

				if var_116_19 > 0 and var_116_13 < var_116_19 then
					arg_113_1.talkMaxDuration = var_116_19

					if var_116_19 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_19 + var_116_12
					end
				end

				arg_113_1.text_.text = var_116_16
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831028", "story_v_out_319831.awb") ~= 0 then
					local var_116_20 = manager.audio:GetVoiceLength("story_v_out_319831", "319831028", "story_v_out_319831.awb") / 1000

					if var_116_20 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_12
					end

					if var_116_15.prefab_name ~= "" and arg_113_1.actors_[var_116_15.prefab_name] ~= nil then
						local var_116_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_15.prefab_name].transform, "story_v_out_319831", "319831028", "story_v_out_319831.awb")

						arg_113_1:RecordAudio("319831028", var_116_21)
						arg_113_1:RecordAudio("319831028", var_116_21)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_319831", "319831028", "story_v_out_319831.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_319831", "319831028", "story_v_out_319831.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_22 = math.max(var_116_13, arg_113_1.talkMaxDuration)

			if var_116_12 <= arg_113_1.time_ and arg_113_1.time_ < var_116_12 + var_116_22 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_12) / var_116_22

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_12 + var_116_22 and arg_113_1.time_ < var_116_12 + var_116_22 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319831029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319831029
		arg_117_1.duration_ = 7.7

		local var_117_0 = {
			zh = 7.7,
			ja = 7.366
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
				arg_117_0:Play319831030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action6_1")
			end

			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_120_2 = arg_117_1.actors_["1084ui_story"]
			local var_120_3 = 0

			if var_120_3 < arg_117_1.time_ and arg_117_1.time_ <= var_120_3 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story == nil then
				arg_117_1.var_.characterEffect1084ui_story = var_120_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_4 = 0.200000002980232

			if var_120_3 <= arg_117_1.time_ and arg_117_1.time_ < var_120_3 + var_120_4 then
				local var_120_5 = (arg_117_1.time_ - var_120_3) / var_120_4

				if arg_117_1.var_.characterEffect1084ui_story then
					local var_120_6 = Mathf.Lerp(0, 0.5, var_120_5)

					arg_117_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1084ui_story.fillRatio = var_120_6
				end
			end

			if arg_117_1.time_ >= var_120_3 + var_120_4 and arg_117_1.time_ < var_120_3 + var_120_4 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story then
				local var_120_7 = 0.5

				arg_117_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1084ui_story.fillRatio = var_120_7
			end

			local var_120_8 = arg_117_1.actors_["4040ui_story"]
			local var_120_9 = 0

			if var_120_9 < arg_117_1.time_ and arg_117_1.time_ <= var_120_9 + arg_120_0 and arg_117_1.var_.characterEffect4040ui_story == nil then
				arg_117_1.var_.characterEffect4040ui_story = var_120_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_10 = 0.200000002980232

			if var_120_9 <= arg_117_1.time_ and arg_117_1.time_ < var_120_9 + var_120_10 then
				local var_120_11 = (arg_117_1.time_ - var_120_9) / var_120_10

				if arg_117_1.var_.characterEffect4040ui_story then
					arg_117_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_9 + var_120_10 and arg_117_1.time_ < var_120_9 + var_120_10 + arg_120_0 and arg_117_1.var_.characterEffect4040ui_story then
				arg_117_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_120_12 = 0
			local var_120_13 = 0.95

			if var_120_12 < arg_117_1.time_ and arg_117_1.time_ <= var_120_12 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_14 = arg_117_1:FormatText(StoryNameCfg[668].name)

				arg_117_1.leftNameTxt_.text = var_120_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_15 = arg_117_1:GetWordFromCfg(319831029)
				local var_120_16 = arg_117_1:FormatText(var_120_15.content)

				arg_117_1.text_.text = var_120_16

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_17 = 38
				local var_120_18 = utf8.len(var_120_16)
				local var_120_19 = var_120_17 <= 0 and var_120_13 or var_120_13 * (var_120_18 / var_120_17)

				if var_120_19 > 0 and var_120_13 < var_120_19 then
					arg_117_1.talkMaxDuration = var_120_19

					if var_120_19 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_19 + var_120_12
					end
				end

				arg_117_1.text_.text = var_120_16
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831029", "story_v_out_319831.awb") ~= 0 then
					local var_120_20 = manager.audio:GetVoiceLength("story_v_out_319831", "319831029", "story_v_out_319831.awb") / 1000

					if var_120_20 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_20 + var_120_12
					end

					if var_120_15.prefab_name ~= "" and arg_117_1.actors_[var_120_15.prefab_name] ~= nil then
						local var_120_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_15.prefab_name].transform, "story_v_out_319831", "319831029", "story_v_out_319831.awb")

						arg_117_1:RecordAudio("319831029", var_120_21)
						arg_117_1:RecordAudio("319831029", var_120_21)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_319831", "319831029", "story_v_out_319831.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_319831", "319831029", "story_v_out_319831.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_22 = math.max(var_120_13, arg_117_1.talkMaxDuration)

			if var_120_12 <= arg_117_1.time_ and arg_117_1.time_ < var_120_12 + var_120_22 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_12) / var_120_22

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_12 + var_120_22 and arg_117_1.time_ < var_120_12 + var_120_22 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319831030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319831030
		arg_121_1.duration_ = 6.4

		local var_121_0 = {
			zh = 6.2,
			ja = 6.4
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
				arg_121_0:Play319831031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.85

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[668].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(319831030)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831030", "story_v_out_319831.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_out_319831", "319831030", "story_v_out_319831.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_out_319831", "319831030", "story_v_out_319831.awb")

						arg_121_1:RecordAudio("319831030", var_124_9)
						arg_121_1:RecordAudio("319831030", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_319831", "319831030", "story_v_out_319831.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_319831", "319831030", "story_v_out_319831.awb")
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
	Play319831031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319831031
		arg_125_1.duration_ = 2.466

		local var_125_0 = {
			zh = 1.999999999999,
			ja = 2.466
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
				arg_125_0:Play319831032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1084ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story == nil then
				arg_125_1.var_.characterEffect1084ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1084ui_story then
					arg_125_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story then
				arg_125_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_128_4 = arg_125_1.actors_["4040ui_story"]
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 and arg_125_1.var_.characterEffect4040ui_story == nil then
				arg_125_1.var_.characterEffect4040ui_story = var_128_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_6 = 0.200000002980232

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_5) / var_128_6

				if arg_125_1.var_.characterEffect4040ui_story then
					local var_128_8 = Mathf.Lerp(0, 0.5, var_128_7)

					arg_125_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_125_1.var_.characterEffect4040ui_story.fillRatio = var_128_8
				end
			end

			if arg_125_1.time_ >= var_128_5 + var_128_6 and arg_125_1.time_ < var_128_5 + var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect4040ui_story then
				local var_128_9 = 0.5

				arg_125_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_125_1.var_.characterEffect4040ui_story.fillRatio = var_128_9
			end

			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 then
				arg_125_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_128_11 = 0
			local var_128_12 = 0.2

			if var_128_11 < arg_125_1.time_ and arg_125_1.time_ <= var_128_11 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_13 = arg_125_1:FormatText(StoryNameCfg[6].name)

				arg_125_1.leftNameTxt_.text = var_128_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_14 = arg_125_1:GetWordFromCfg(319831031)
				local var_128_15 = arg_125_1:FormatText(var_128_14.content)

				arg_125_1.text_.text = var_128_15

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_16 = 8
				local var_128_17 = utf8.len(var_128_15)
				local var_128_18 = var_128_16 <= 0 and var_128_12 or var_128_12 * (var_128_17 / var_128_16)

				if var_128_18 > 0 and var_128_12 < var_128_18 then
					arg_125_1.talkMaxDuration = var_128_18

					if var_128_18 + var_128_11 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_18 + var_128_11
					end
				end

				arg_125_1.text_.text = var_128_15
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831031", "story_v_out_319831.awb") ~= 0 then
					local var_128_19 = manager.audio:GetVoiceLength("story_v_out_319831", "319831031", "story_v_out_319831.awb") / 1000

					if var_128_19 + var_128_11 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_19 + var_128_11
					end

					if var_128_14.prefab_name ~= "" and arg_125_1.actors_[var_128_14.prefab_name] ~= nil then
						local var_128_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_14.prefab_name].transform, "story_v_out_319831", "319831031", "story_v_out_319831.awb")

						arg_125_1:RecordAudio("319831031", var_128_20)
						arg_125_1:RecordAudio("319831031", var_128_20)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319831", "319831031", "story_v_out_319831.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319831", "319831031", "story_v_out_319831.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_21 = math.max(var_128_12, arg_125_1.talkMaxDuration)

			if var_128_11 <= arg_125_1.time_ and arg_125_1.time_ < var_128_11 + var_128_21 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_11) / var_128_21

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_11 + var_128_21 and arg_125_1.time_ < var_128_11 + var_128_21 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319831032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319831032
		arg_129_1.duration_ = 8.233

		local var_129_0 = {
			zh = 5.133,
			ja = 8.233
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
				arg_129_0:Play319831033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1084ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1084ui_story == nil then
				arg_129_1.var_.characterEffect1084ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1084ui_story then
					local var_132_4 = Mathf.Lerp(0, 0.5, var_132_3)

					arg_129_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1084ui_story.fillRatio = var_132_4
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1084ui_story then
				local var_132_5 = 0.5

				arg_129_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1084ui_story.fillRatio = var_132_5
			end

			local var_132_6 = arg_129_1.actors_["4040ui_story"]
			local var_132_7 = 0

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 and arg_129_1.var_.characterEffect4040ui_story == nil then
				arg_129_1.var_.characterEffect4040ui_story = var_132_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_8 = 0.200000002980232

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_8 then
				local var_132_9 = (arg_129_1.time_ - var_132_7) / var_132_8

				if arg_129_1.var_.characterEffect4040ui_story then
					arg_129_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_7 + var_132_8 and arg_129_1.time_ < var_132_7 + var_132_8 + arg_132_0 and arg_129_1.var_.characterEffect4040ui_story then
				arg_129_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_132_10 = 0
			local var_132_11 = 0.65

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_12 = arg_129_1:FormatText(StoryNameCfg[668].name)

				arg_129_1.leftNameTxt_.text = var_132_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_13 = arg_129_1:GetWordFromCfg(319831032)
				local var_132_14 = arg_129_1:FormatText(var_132_13.content)

				arg_129_1.text_.text = var_132_14

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_15 = 26
				local var_132_16 = utf8.len(var_132_14)
				local var_132_17 = var_132_15 <= 0 and var_132_11 or var_132_11 * (var_132_16 / var_132_15)

				if var_132_17 > 0 and var_132_11 < var_132_17 then
					arg_129_1.talkMaxDuration = var_132_17

					if var_132_17 + var_132_10 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_17 + var_132_10
					end
				end

				arg_129_1.text_.text = var_132_14
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831032", "story_v_out_319831.awb") ~= 0 then
					local var_132_18 = manager.audio:GetVoiceLength("story_v_out_319831", "319831032", "story_v_out_319831.awb") / 1000

					if var_132_18 + var_132_10 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_18 + var_132_10
					end

					if var_132_13.prefab_name ~= "" and arg_129_1.actors_[var_132_13.prefab_name] ~= nil then
						local var_132_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_13.prefab_name].transform, "story_v_out_319831", "319831032", "story_v_out_319831.awb")

						arg_129_1:RecordAudio("319831032", var_132_19)
						arg_129_1:RecordAudio("319831032", var_132_19)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319831", "319831032", "story_v_out_319831.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319831", "319831032", "story_v_out_319831.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_20 = math.max(var_132_11, arg_129_1.talkMaxDuration)

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_20 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_10) / var_132_20

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_10 + var_132_20 and arg_129_1.time_ < var_132_10 + var_132_20 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319831033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319831033
		arg_133_1.duration_ = 1.999999999999

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play319831034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1084ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1084ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0.7, -0.97, -6)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1084ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["1084ui_story"]
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story == nil then
				arg_133_1.var_.characterEffect1084ui_story = var_136_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_11 = 0.200000002980232

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11

				if arg_133_1.var_.characterEffect1084ui_story then
					arg_133_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story then
				arg_133_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_136_13 = arg_133_1.actors_["4040ui_story"]
			local var_136_14 = 0

			if var_136_14 < arg_133_1.time_ and arg_133_1.time_ <= var_136_14 + arg_136_0 and arg_133_1.var_.characterEffect4040ui_story == nil then
				arg_133_1.var_.characterEffect4040ui_story = var_136_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_15 = 0.200000002980232

			if var_136_14 <= arg_133_1.time_ and arg_133_1.time_ < var_136_14 + var_136_15 then
				local var_136_16 = (arg_133_1.time_ - var_136_14) / var_136_15

				if arg_133_1.var_.characterEffect4040ui_story then
					local var_136_17 = Mathf.Lerp(0, 0.5, var_136_16)

					arg_133_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_133_1.var_.characterEffect4040ui_story.fillRatio = var_136_17
				end
			end

			if arg_133_1.time_ >= var_136_14 + var_136_15 and arg_133_1.time_ < var_136_14 + var_136_15 + arg_136_0 and arg_133_1.var_.characterEffect4040ui_story then
				local var_136_18 = 0.5

				arg_133_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_133_1.var_.characterEffect4040ui_story.fillRatio = var_136_18
			end

			local var_136_19 = 0

			if var_136_19 < arg_133_1.time_ and arg_133_1.time_ <= var_136_19 + arg_136_0 then
				arg_133_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4135")
			end

			local var_136_20 = 0

			if var_136_20 < arg_133_1.time_ and arg_133_1.time_ <= var_136_20 + arg_136_0 then
				arg_133_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_136_21 = 0
			local var_136_22 = 0.1

			if var_136_21 < arg_133_1.time_ and arg_133_1.time_ <= var_136_21 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_23 = arg_133_1:FormatText(StoryNameCfg[6].name)

				arg_133_1.leftNameTxt_.text = var_136_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_24 = arg_133_1:GetWordFromCfg(319831033)
				local var_136_25 = arg_133_1:FormatText(var_136_24.content)

				arg_133_1.text_.text = var_136_25

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_26 = 4
				local var_136_27 = utf8.len(var_136_25)
				local var_136_28 = var_136_26 <= 0 and var_136_22 or var_136_22 * (var_136_27 / var_136_26)

				if var_136_28 > 0 and var_136_22 < var_136_28 then
					arg_133_1.talkMaxDuration = var_136_28

					if var_136_28 + var_136_21 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_28 + var_136_21
					end
				end

				arg_133_1.text_.text = var_136_25
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831033", "story_v_out_319831.awb") ~= 0 then
					local var_136_29 = manager.audio:GetVoiceLength("story_v_out_319831", "319831033", "story_v_out_319831.awb") / 1000

					if var_136_29 + var_136_21 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_29 + var_136_21
					end

					if var_136_24.prefab_name ~= "" and arg_133_1.actors_[var_136_24.prefab_name] ~= nil then
						local var_136_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_24.prefab_name].transform, "story_v_out_319831", "319831033", "story_v_out_319831.awb")

						arg_133_1:RecordAudio("319831033", var_136_30)
						arg_133_1:RecordAudio("319831033", var_136_30)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319831", "319831033", "story_v_out_319831.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319831", "319831033", "story_v_out_319831.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_31 = math.max(var_136_22, arg_133_1.talkMaxDuration)

			if var_136_21 <= arg_133_1.time_ and arg_133_1.time_ < var_136_21 + var_136_31 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_21) / var_136_31

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_21 + var_136_31 and arg_133_1.time_ < var_136_21 + var_136_31 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319831034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319831034
		arg_137_1.duration_ = 6

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play319831035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = "STblack"

			if arg_137_1.bgs_[var_140_0] == nil then
				local var_140_1 = Object.Instantiate(arg_137_1.paintGo_)

				var_140_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_140_0)
				var_140_1.name = var_140_0
				var_140_1.transform.parent = arg_137_1.stage_.transform
				var_140_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_137_1.bgs_[var_140_0] = var_140_1
			end

			local var_140_2 = 0

			if var_140_2 < arg_137_1.time_ and arg_137_1.time_ <= var_140_2 + arg_140_0 then
				local var_140_3 = manager.ui.mainCamera.transform.localPosition
				local var_140_4 = Vector3.New(0, 0, 10) + Vector3.New(var_140_3.x, var_140_3.y, 0)
				local var_140_5 = arg_137_1.bgs_.STblack

				var_140_5.transform.localPosition = var_140_4
				var_140_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_140_6 = var_140_5:GetComponent("SpriteRenderer")

				if var_140_6 and var_140_6.sprite then
					local var_140_7 = (var_140_5.transform.localPosition - var_140_3).z
					local var_140_8 = manager.ui.mainCameraCom_
					local var_140_9 = 2 * var_140_7 * Mathf.Tan(var_140_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_140_10 = var_140_9 * var_140_8.aspect
					local var_140_11 = var_140_6.sprite.bounds.size.x
					local var_140_12 = var_140_6.sprite.bounds.size.y
					local var_140_13 = var_140_10 / var_140_11
					local var_140_14 = var_140_9 / var_140_12
					local var_140_15 = var_140_14 < var_140_13 and var_140_13 or var_140_14

					var_140_5.transform.localScale = Vector3.New(var_140_15, var_140_15, 0)
				end

				for iter_140_0, iter_140_1 in pairs(arg_137_1.bgs_) do
					if iter_140_0 ~= "STblack" then
						iter_140_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_140_16 = 0

			if var_140_16 < arg_137_1.time_ and arg_137_1.time_ <= var_140_16 + arg_140_0 then
				arg_137_1.allBtn_.enabled = false
			end

			local var_140_17 = 0.3

			if arg_137_1.time_ >= var_140_16 + var_140_17 and arg_137_1.time_ < var_140_16 + var_140_17 + arg_140_0 then
				arg_137_1.allBtn_.enabled = true
			end

			local var_140_18 = 0

			if var_140_18 < arg_137_1.time_ and arg_137_1.time_ <= var_140_18 + arg_140_0 then
				arg_137_1.mask_.enabled = true
				arg_137_1.mask_.raycastTarget = true

				arg_137_1:SetGaussion(false)
			end

			local var_140_19 = 2

			if var_140_18 <= arg_137_1.time_ and arg_137_1.time_ < var_140_18 + var_140_19 then
				local var_140_20 = (arg_137_1.time_ - var_140_18) / var_140_19
				local var_140_21 = Color.New(0, 0, 0)

				var_140_21.a = Mathf.Lerp(1, 0, var_140_20)
				arg_137_1.mask_.color = var_140_21
			end

			if arg_137_1.time_ >= var_140_18 + var_140_19 and arg_137_1.time_ < var_140_18 + var_140_19 + arg_140_0 then
				local var_140_22 = Color.New(0, 0, 0)
				local var_140_23 = 0

				arg_137_1.mask_.enabled = false
				var_140_22.a = var_140_23
				arg_137_1.mask_.color = var_140_22
			end

			local var_140_24 = arg_137_1.actors_["1084ui_story"].transform
			local var_140_25 = 0

			if var_140_25 < arg_137_1.time_ and arg_137_1.time_ <= var_140_25 + arg_140_0 then
				arg_137_1.var_.moveOldPos1084ui_story = var_140_24.localPosition
			end

			local var_140_26 = 0.001

			if var_140_25 <= arg_137_1.time_ and arg_137_1.time_ < var_140_25 + var_140_26 then
				local var_140_27 = (arg_137_1.time_ - var_140_25) / var_140_26
				local var_140_28 = Vector3.New(0, 100, 0)

				var_140_24.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1084ui_story, var_140_28, var_140_27)

				local var_140_29 = manager.ui.mainCamera.transform.position - var_140_24.position

				var_140_24.forward = Vector3.New(var_140_29.x, var_140_29.y, var_140_29.z)

				local var_140_30 = var_140_24.localEulerAngles

				var_140_30.z = 0
				var_140_30.x = 0
				var_140_24.localEulerAngles = var_140_30
			end

			if arg_137_1.time_ >= var_140_25 + var_140_26 and arg_137_1.time_ < var_140_25 + var_140_26 + arg_140_0 then
				var_140_24.localPosition = Vector3.New(0, 100, 0)

				local var_140_31 = manager.ui.mainCamera.transform.position - var_140_24.position

				var_140_24.forward = Vector3.New(var_140_31.x, var_140_31.y, var_140_31.z)

				local var_140_32 = var_140_24.localEulerAngles

				var_140_32.z = 0
				var_140_32.x = 0
				var_140_24.localEulerAngles = var_140_32
			end

			local var_140_33 = arg_137_1.actors_["1084ui_story"]
			local var_140_34 = 0

			if var_140_34 < arg_137_1.time_ and arg_137_1.time_ <= var_140_34 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story == nil then
				arg_137_1.var_.characterEffect1084ui_story = var_140_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_35 = 0.200000002980232

			if var_140_34 <= arg_137_1.time_ and arg_137_1.time_ < var_140_34 + var_140_35 then
				local var_140_36 = (arg_137_1.time_ - var_140_34) / var_140_35

				if arg_137_1.var_.characterEffect1084ui_story then
					local var_140_37 = Mathf.Lerp(0, 0.5, var_140_36)

					arg_137_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1084ui_story.fillRatio = var_140_37
				end
			end

			if arg_137_1.time_ >= var_140_34 + var_140_35 and arg_137_1.time_ < var_140_34 + var_140_35 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story then
				local var_140_38 = 0.5

				arg_137_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1084ui_story.fillRatio = var_140_38
			end

			local var_140_39 = arg_137_1.actors_["4040ui_story"].transform
			local var_140_40 = 0

			if var_140_40 < arg_137_1.time_ and arg_137_1.time_ <= var_140_40 + arg_140_0 then
				arg_137_1.var_.moveOldPos4040ui_story = var_140_39.localPosition
			end

			local var_140_41 = 0.001

			if var_140_40 <= arg_137_1.time_ and arg_137_1.time_ < var_140_40 + var_140_41 then
				local var_140_42 = (arg_137_1.time_ - var_140_40) / var_140_41
				local var_140_43 = Vector3.New(0, 100, 0)

				var_140_39.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos4040ui_story, var_140_43, var_140_42)

				local var_140_44 = manager.ui.mainCamera.transform.position - var_140_39.position

				var_140_39.forward = Vector3.New(var_140_44.x, var_140_44.y, var_140_44.z)

				local var_140_45 = var_140_39.localEulerAngles

				var_140_45.z = 0
				var_140_45.x = 0
				var_140_39.localEulerAngles = var_140_45
			end

			if arg_137_1.time_ >= var_140_40 + var_140_41 and arg_137_1.time_ < var_140_40 + var_140_41 + arg_140_0 then
				var_140_39.localPosition = Vector3.New(0, 100, 0)

				local var_140_46 = manager.ui.mainCamera.transform.position - var_140_39.position

				var_140_39.forward = Vector3.New(var_140_46.x, var_140_46.y, var_140_46.z)

				local var_140_47 = var_140_39.localEulerAngles

				var_140_47.z = 0
				var_140_47.x = 0
				var_140_39.localEulerAngles = var_140_47
			end

			local var_140_48 = arg_137_1.actors_["4040ui_story"]
			local var_140_49 = 0

			if var_140_49 < arg_137_1.time_ and arg_137_1.time_ <= var_140_49 + arg_140_0 and arg_137_1.var_.characterEffect4040ui_story == nil then
				arg_137_1.var_.characterEffect4040ui_story = var_140_48:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_50 = 0.200000002980232

			if var_140_49 <= arg_137_1.time_ and arg_137_1.time_ < var_140_49 + var_140_50 then
				local var_140_51 = (arg_137_1.time_ - var_140_49) / var_140_50

				if arg_137_1.var_.characterEffect4040ui_story then
					local var_140_52 = Mathf.Lerp(0, 0.5, var_140_51)

					arg_137_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_137_1.var_.characterEffect4040ui_story.fillRatio = var_140_52
				end
			end

			if arg_137_1.time_ >= var_140_49 + var_140_50 and arg_137_1.time_ < var_140_49 + var_140_50 + arg_140_0 and arg_137_1.var_.characterEffect4040ui_story then
				local var_140_53 = 0.5

				arg_137_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_137_1.var_.characterEffect4040ui_story.fillRatio = var_140_53
			end

			if arg_137_1.frameCnt_ <= 1 then
				arg_137_1.dialog_:SetActive(false)
			end

			local var_140_54 = 1
			local var_140_55 = 0.175

			if var_140_54 < arg_137_1.time_ and arg_137_1.time_ <= var_140_54 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0

				arg_137_1.dialog_:SetActive(true)

				local var_140_56 = LeanTween.value(arg_137_1.dialog_, 0, 1, 0.3)

				var_140_56:setOnUpdate(LuaHelper.FloatAction(function(arg_141_0)
					arg_137_1.dialogCg_.alpha = arg_141_0
				end))
				var_140_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_137_1.dialog_)
					var_140_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_137_1.duration_ = arg_137_1.duration_ + 0.3

				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_57 = arg_137_1:GetWordFromCfg(319831034)
				local var_140_58 = arg_137_1:FormatText(var_140_57.content)

				arg_137_1.text_.text = var_140_58

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_59 = 7
				local var_140_60 = utf8.len(var_140_58)
				local var_140_61 = var_140_59 <= 0 and var_140_55 or var_140_55 * (var_140_60 / var_140_59)

				if var_140_61 > 0 and var_140_55 < var_140_61 then
					arg_137_1.talkMaxDuration = var_140_61
					var_140_54 = var_140_54 + 0.3

					if var_140_61 + var_140_54 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_61 + var_140_54
					end
				end

				arg_137_1.text_.text = var_140_58
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_62 = var_140_54 + 0.3
			local var_140_63 = math.max(var_140_55, arg_137_1.talkMaxDuration)

			if var_140_62 <= arg_137_1.time_ and arg_137_1.time_ < var_140_62 + var_140_63 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_62) / var_140_63

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_62 + var_140_63 and arg_137_1.time_ < var_140_62 + var_140_63 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319831035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 319831035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play319831036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 1.05

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_2 = arg_143_1:GetWordFromCfg(319831035)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 42
				local var_146_5 = utf8.len(var_146_3)
				local var_146_6 = var_146_4 <= 0 and var_146_1 or var_146_1 * (var_146_5 / var_146_4)

				if var_146_6 > 0 and var_146_1 < var_146_6 then
					arg_143_1.talkMaxDuration = var_146_6

					if var_146_6 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_6 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_3
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_7 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_7 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_7

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_7 and arg_143_1.time_ < var_146_0 + var_146_7 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play319831036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 319831036
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play319831037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 1.225

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

				local var_150_2 = arg_147_1:GetWordFromCfg(319831036)
				local var_150_3 = arg_147_1:FormatText(var_150_2.content)

				arg_147_1.text_.text = var_150_3

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_4 = 49
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
	Play319831037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 319831037
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play319831038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 1.325

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_2 = arg_151_1:GetWordFromCfg(319831037)
				local var_154_3 = arg_151_1:FormatText(var_154_2.content)

				arg_151_1.text_.text = var_154_3

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_4 = 53
				local var_154_5 = utf8.len(var_154_3)
				local var_154_6 = var_154_4 <= 0 and var_154_1 or var_154_1 * (var_154_5 / var_154_4)

				if var_154_6 > 0 and var_154_1 < var_154_6 then
					arg_151_1.talkMaxDuration = var_154_6

					if var_154_6 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_6 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_3
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_7 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_7 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_7

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_7 and arg_151_1.time_ < var_154_0 + var_154_7 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play319831038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 319831038
		arg_155_1.duration_ = 6.2

		local var_155_0 = {
			zh = 4.866,
			ja = 6.2
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
				arg_155_0:Play319831039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				local var_158_1 = manager.ui.mainCamera.transform.localPosition
				local var_158_2 = Vector3.New(0, 0, 10) + Vector3.New(var_158_1.x, var_158_1.y, 0)
				local var_158_3 = arg_155_1.bgs_.D02a

				var_158_3.transform.localPosition = var_158_2
				var_158_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_158_4 = var_158_3:GetComponent("SpriteRenderer")

				if var_158_4 and var_158_4.sprite then
					local var_158_5 = (var_158_3.transform.localPosition - var_158_1).z
					local var_158_6 = manager.ui.mainCameraCom_
					local var_158_7 = 2 * var_158_5 * Mathf.Tan(var_158_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_158_8 = var_158_7 * var_158_6.aspect
					local var_158_9 = var_158_4.sprite.bounds.size.x
					local var_158_10 = var_158_4.sprite.bounds.size.y
					local var_158_11 = var_158_8 / var_158_9
					local var_158_12 = var_158_7 / var_158_10
					local var_158_13 = var_158_12 < var_158_11 and var_158_11 or var_158_12

					var_158_3.transform.localScale = Vector3.New(var_158_13, var_158_13, 0)
				end

				for iter_158_0, iter_158_1 in pairs(arg_155_1.bgs_) do
					if iter_158_0 ~= "D02a" then
						iter_158_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				arg_155_1.allBtn_.enabled = false
			end

			local var_158_15 = 0.3

			if arg_155_1.time_ >= var_158_14 + var_158_15 and arg_155_1.time_ < var_158_14 + var_158_15 + arg_158_0 then
				arg_155_1.allBtn_.enabled = true
			end

			local var_158_16 = 0

			if var_158_16 < arg_155_1.time_ and arg_155_1.time_ <= var_158_16 + arg_158_0 then
				arg_155_1.mask_.enabled = true
				arg_155_1.mask_.raycastTarget = true

				arg_155_1:SetGaussion(false)
			end

			local var_158_17 = 2

			if var_158_16 <= arg_155_1.time_ and arg_155_1.time_ < var_158_16 + var_158_17 then
				local var_158_18 = (arg_155_1.time_ - var_158_16) / var_158_17
				local var_158_19 = Color.New(0, 0, 0)

				var_158_19.a = Mathf.Lerp(1, 0, var_158_18)
				arg_155_1.mask_.color = var_158_19
			end

			if arg_155_1.time_ >= var_158_16 + var_158_17 and arg_155_1.time_ < var_158_16 + var_158_17 + arg_158_0 then
				local var_158_20 = Color.New(0, 0, 0)
				local var_158_21 = 0

				arg_155_1.mask_.enabled = false
				var_158_20.a = var_158_21
				arg_155_1.mask_.color = var_158_20
			end

			local var_158_22 = arg_155_1.actors_["1084ui_story"].transform
			local var_158_23 = 1.9

			if var_158_23 < arg_155_1.time_ and arg_155_1.time_ <= var_158_23 + arg_158_0 then
				arg_155_1.var_.moveOldPos1084ui_story = var_158_22.localPosition

				local var_158_24 = "1084ui_story"

				arg_155_1:ShowWeapon(arg_155_1.var_[var_158_24 .. "Animator"].transform, false)
			end

			local var_158_25 = 0.001

			if var_158_23 <= arg_155_1.time_ and arg_155_1.time_ < var_158_23 + var_158_25 then
				local var_158_26 = (arg_155_1.time_ - var_158_23) / var_158_25
				local var_158_27 = Vector3.New(0.7, -0.97, -6)

				var_158_22.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1084ui_story, var_158_27, var_158_26)

				local var_158_28 = manager.ui.mainCamera.transform.position - var_158_22.position

				var_158_22.forward = Vector3.New(var_158_28.x, var_158_28.y, var_158_28.z)

				local var_158_29 = var_158_22.localEulerAngles

				var_158_29.z = 0
				var_158_29.x = 0
				var_158_22.localEulerAngles = var_158_29
			end

			if arg_155_1.time_ >= var_158_23 + var_158_25 and arg_155_1.time_ < var_158_23 + var_158_25 + arg_158_0 then
				var_158_22.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_158_30 = manager.ui.mainCamera.transform.position - var_158_22.position

				var_158_22.forward = Vector3.New(var_158_30.x, var_158_30.y, var_158_30.z)

				local var_158_31 = var_158_22.localEulerAngles

				var_158_31.z = 0
				var_158_31.x = 0
				var_158_22.localEulerAngles = var_158_31
			end

			local var_158_32 = arg_155_1.actors_["1084ui_story"]
			local var_158_33 = 1.9

			if var_158_33 < arg_155_1.time_ and arg_155_1.time_ <= var_158_33 + arg_158_0 and arg_155_1.var_.characterEffect1084ui_story == nil then
				arg_155_1.var_.characterEffect1084ui_story = var_158_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_34 = 0.200000002980232

			if var_158_33 <= arg_155_1.time_ and arg_155_1.time_ < var_158_33 + var_158_34 then
				local var_158_35 = (arg_155_1.time_ - var_158_33) / var_158_34

				if arg_155_1.var_.characterEffect1084ui_story then
					arg_155_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_33 + var_158_34 and arg_155_1.time_ < var_158_33 + var_158_34 + arg_158_0 and arg_155_1.var_.characterEffect1084ui_story then
				arg_155_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_158_36 = 1.9

			if var_158_36 < arg_155_1.time_ and arg_155_1.time_ <= var_158_36 + arg_158_0 then
				arg_155_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			if arg_155_1.frameCnt_ <= 1 then
				arg_155_1.dialog_:SetActive(false)
			end

			local var_158_37 = 2
			local var_158_38 = 0.25

			if var_158_37 < arg_155_1.time_ and arg_155_1.time_ <= var_158_37 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0

				arg_155_1.dialog_:SetActive(true)

				local var_158_39 = LeanTween.value(arg_155_1.dialog_, 0, 1, 0.3)

				var_158_39:setOnUpdate(LuaHelper.FloatAction(function(arg_159_0)
					arg_155_1.dialogCg_.alpha = arg_159_0
				end))
				var_158_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_155_1.dialog_)
					var_158_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_155_1.duration_ = arg_155_1.duration_ + 0.3

				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_40 = arg_155_1:FormatText(StoryNameCfg[6].name)

				arg_155_1.leftNameTxt_.text = var_158_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_41 = arg_155_1:GetWordFromCfg(319831038)
				local var_158_42 = arg_155_1:FormatText(var_158_41.content)

				arg_155_1.text_.text = var_158_42

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_43 = 10
				local var_158_44 = utf8.len(var_158_42)
				local var_158_45 = var_158_43 <= 0 and var_158_38 or var_158_38 * (var_158_44 / var_158_43)

				if var_158_45 > 0 and var_158_38 < var_158_45 then
					arg_155_1.talkMaxDuration = var_158_45
					var_158_37 = var_158_37 + 0.3

					if var_158_45 + var_158_37 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_45 + var_158_37
					end
				end

				arg_155_1.text_.text = var_158_42
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831038", "story_v_out_319831.awb") ~= 0 then
					local var_158_46 = manager.audio:GetVoiceLength("story_v_out_319831", "319831038", "story_v_out_319831.awb") / 1000

					if var_158_46 + var_158_37 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_46 + var_158_37
					end

					if var_158_41.prefab_name ~= "" and arg_155_1.actors_[var_158_41.prefab_name] ~= nil then
						local var_158_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_41.prefab_name].transform, "story_v_out_319831", "319831038", "story_v_out_319831.awb")

						arg_155_1:RecordAudio("319831038", var_158_47)
						arg_155_1:RecordAudio("319831038", var_158_47)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_319831", "319831038", "story_v_out_319831.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_319831", "319831038", "story_v_out_319831.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_48 = var_158_37 + 0.3
			local var_158_49 = math.max(var_158_38, arg_155_1.talkMaxDuration)

			if var_158_48 <= arg_155_1.time_ and arg_155_1.time_ < var_158_48 + var_158_49 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_48) / var_158_49

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_48 + var_158_49 and arg_155_1.time_ < var_158_48 + var_158_49 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play319831039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319831039
		arg_161_1.duration_ = 3.133

		local var_161_0 = {
			zh = 3.133,
			ja = 1.999999999999
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
				arg_161_0:Play319831040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["4040ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos4040ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos4040ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["4040ui_story"]
			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 and arg_161_1.var_.characterEffect4040ui_story == nil then
				arg_161_1.var_.characterEffect4040ui_story = var_164_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_11 = 0.200000002980232

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11

				if arg_161_1.var_.characterEffect4040ui_story then
					arg_161_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 and arg_161_1.var_.characterEffect4040ui_story then
				arg_161_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_164_13 = 0

			if var_164_13 < arg_161_1.time_ and arg_161_1.time_ <= var_164_13 + arg_164_0 then
				arg_161_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				arg_161_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_164_15 = arg_161_1.actors_["1084ui_story"].transform
			local var_164_16 = 0

			if var_164_16 < arg_161_1.time_ and arg_161_1.time_ <= var_164_16 + arg_164_0 then
				arg_161_1.var_.moveOldPos1084ui_story = var_164_15.localPosition
			end

			local var_164_17 = 0.001

			if var_164_16 <= arg_161_1.time_ and arg_161_1.time_ < var_164_16 + var_164_17 then
				local var_164_18 = (arg_161_1.time_ - var_164_16) / var_164_17
				local var_164_19 = Vector3.New(0.7, -0.97, -6)

				var_164_15.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1084ui_story, var_164_19, var_164_18)

				local var_164_20 = manager.ui.mainCamera.transform.position - var_164_15.position

				var_164_15.forward = Vector3.New(var_164_20.x, var_164_20.y, var_164_20.z)

				local var_164_21 = var_164_15.localEulerAngles

				var_164_21.z = 0
				var_164_21.x = 0
				var_164_15.localEulerAngles = var_164_21
			end

			if arg_161_1.time_ >= var_164_16 + var_164_17 and arg_161_1.time_ < var_164_16 + var_164_17 + arg_164_0 then
				var_164_15.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_164_22 = manager.ui.mainCamera.transform.position - var_164_15.position

				var_164_15.forward = Vector3.New(var_164_22.x, var_164_22.y, var_164_22.z)

				local var_164_23 = var_164_15.localEulerAngles

				var_164_23.z = 0
				var_164_23.x = 0
				var_164_15.localEulerAngles = var_164_23
			end

			local var_164_24 = arg_161_1.actors_["1084ui_story"]
			local var_164_25 = 0

			if var_164_25 < arg_161_1.time_ and arg_161_1.time_ <= var_164_25 + arg_164_0 and arg_161_1.var_.characterEffect1084ui_story == nil then
				arg_161_1.var_.characterEffect1084ui_story = var_164_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_26 = 0.200000002980232

			if var_164_25 <= arg_161_1.time_ and arg_161_1.time_ < var_164_25 + var_164_26 then
				local var_164_27 = (arg_161_1.time_ - var_164_25) / var_164_26

				if arg_161_1.var_.characterEffect1084ui_story then
					local var_164_28 = Mathf.Lerp(0, 0.5, var_164_27)

					arg_161_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1084ui_story.fillRatio = var_164_28
				end
			end

			if arg_161_1.time_ >= var_164_25 + var_164_26 and arg_161_1.time_ < var_164_25 + var_164_26 + arg_164_0 and arg_161_1.var_.characterEffect1084ui_story then
				local var_164_29 = 0.5

				arg_161_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1084ui_story.fillRatio = var_164_29
			end

			local var_164_30 = 0
			local var_164_31 = 0.4

			if var_164_30 < arg_161_1.time_ and arg_161_1.time_ <= var_164_30 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_32 = arg_161_1:FormatText(StoryNameCfg[668].name)

				arg_161_1.leftNameTxt_.text = var_164_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_33 = arg_161_1:GetWordFromCfg(319831039)
				local var_164_34 = arg_161_1:FormatText(var_164_33.content)

				arg_161_1.text_.text = var_164_34

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_35 = 16
				local var_164_36 = utf8.len(var_164_34)
				local var_164_37 = var_164_35 <= 0 and var_164_31 or var_164_31 * (var_164_36 / var_164_35)

				if var_164_37 > 0 and var_164_31 < var_164_37 then
					arg_161_1.talkMaxDuration = var_164_37

					if var_164_37 + var_164_30 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_37 + var_164_30
					end
				end

				arg_161_1.text_.text = var_164_34
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831039", "story_v_out_319831.awb") ~= 0 then
					local var_164_38 = manager.audio:GetVoiceLength("story_v_out_319831", "319831039", "story_v_out_319831.awb") / 1000

					if var_164_38 + var_164_30 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_38 + var_164_30
					end

					if var_164_33.prefab_name ~= "" and arg_161_1.actors_[var_164_33.prefab_name] ~= nil then
						local var_164_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_33.prefab_name].transform, "story_v_out_319831", "319831039", "story_v_out_319831.awb")

						arg_161_1:RecordAudio("319831039", var_164_39)
						arg_161_1:RecordAudio("319831039", var_164_39)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_319831", "319831039", "story_v_out_319831.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_319831", "319831039", "story_v_out_319831.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_40 = math.max(var_164_31, arg_161_1.talkMaxDuration)

			if var_164_30 <= arg_161_1.time_ and arg_161_1.time_ < var_164_30 + var_164_40 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_30) / var_164_40

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_30 + var_164_40 and arg_161_1.time_ < var_164_30 + var_164_40 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319831040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 319831040
		arg_165_1.duration_ = 3

		local var_165_0 = {
			zh = 1.533,
			ja = 3
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
				arg_165_0:Play319831041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["4040ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect4040ui_story == nil then
				arg_165_1.var_.characterEffect4040ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.200000002980232

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect4040ui_story then
					local var_168_4 = Mathf.Lerp(0, 0.5, var_168_3)

					arg_165_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_165_1.var_.characterEffect4040ui_story.fillRatio = var_168_4
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect4040ui_story then
				local var_168_5 = 0.5

				arg_165_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_165_1.var_.characterEffect4040ui_story.fillRatio = var_168_5
			end

			local var_168_6 = arg_165_1.actors_["1084ui_story"]
			local var_168_7 = 0

			if var_168_7 < arg_165_1.time_ and arg_165_1.time_ <= var_168_7 + arg_168_0 and arg_165_1.var_.characterEffect1084ui_story == nil then
				arg_165_1.var_.characterEffect1084ui_story = var_168_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_8 = 0.200000002980232

			if var_168_7 <= arg_165_1.time_ and arg_165_1.time_ < var_168_7 + var_168_8 then
				local var_168_9 = (arg_165_1.time_ - var_168_7) / var_168_8

				if arg_165_1.var_.characterEffect1084ui_story then
					arg_165_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_7 + var_168_8 and arg_165_1.time_ < var_168_7 + var_168_8 + arg_168_0 and arg_165_1.var_.characterEffect1084ui_story then
				arg_165_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_168_10 = 0
			local var_168_11 = 0.15

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_12 = arg_165_1:FormatText(StoryNameCfg[6].name)

				arg_165_1.leftNameTxt_.text = var_168_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_13 = arg_165_1:GetWordFromCfg(319831040)
				local var_168_14 = arg_165_1:FormatText(var_168_13.content)

				arg_165_1.text_.text = var_168_14

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_15 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831040", "story_v_out_319831.awb") ~= 0 then
					local var_168_18 = manager.audio:GetVoiceLength("story_v_out_319831", "319831040", "story_v_out_319831.awb") / 1000

					if var_168_18 + var_168_10 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_18 + var_168_10
					end

					if var_168_13.prefab_name ~= "" and arg_165_1.actors_[var_168_13.prefab_name] ~= nil then
						local var_168_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_13.prefab_name].transform, "story_v_out_319831", "319831040", "story_v_out_319831.awb")

						arg_165_1:RecordAudio("319831040", var_168_19)
						arg_165_1:RecordAudio("319831040", var_168_19)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_319831", "319831040", "story_v_out_319831.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_319831", "319831040", "story_v_out_319831.awb")
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
	Play319831041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 319831041
		arg_169_1.duration_ = 6.133

		local var_169_0 = {
			zh = 6.133,
			ja = 5.733
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
				arg_169_0:Play319831042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action4_1")
			end

			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_172_2 = arg_169_1.actors_["4040ui_story"]
			local var_172_3 = 0

			if var_172_3 < arg_169_1.time_ and arg_169_1.time_ <= var_172_3 + arg_172_0 and arg_169_1.var_.characterEffect4040ui_story == nil then
				arg_169_1.var_.characterEffect4040ui_story = var_172_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_4 = 0.200000002980232

			if var_172_3 <= arg_169_1.time_ and arg_169_1.time_ < var_172_3 + var_172_4 then
				local var_172_5 = (arg_169_1.time_ - var_172_3) / var_172_4

				if arg_169_1.var_.characterEffect4040ui_story then
					arg_169_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_3 + var_172_4 and arg_169_1.time_ < var_172_3 + var_172_4 + arg_172_0 and arg_169_1.var_.characterEffect4040ui_story then
				arg_169_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_172_6 = arg_169_1.actors_["1084ui_story"]
			local var_172_7 = 0

			if var_172_7 < arg_169_1.time_ and arg_169_1.time_ <= var_172_7 + arg_172_0 and arg_169_1.var_.characterEffect1084ui_story == nil then
				arg_169_1.var_.characterEffect1084ui_story = var_172_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_8 = 0.200000002980232

			if var_172_7 <= arg_169_1.time_ and arg_169_1.time_ < var_172_7 + var_172_8 then
				local var_172_9 = (arg_169_1.time_ - var_172_7) / var_172_8

				if arg_169_1.var_.characterEffect1084ui_story then
					local var_172_10 = Mathf.Lerp(0, 0.5, var_172_9)

					arg_169_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1084ui_story.fillRatio = var_172_10
				end
			end

			if arg_169_1.time_ >= var_172_7 + var_172_8 and arg_169_1.time_ < var_172_7 + var_172_8 + arg_172_0 and arg_169_1.var_.characterEffect1084ui_story then
				local var_172_11 = 0.5

				arg_169_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1084ui_story.fillRatio = var_172_11
			end

			local var_172_12 = 0
			local var_172_13 = 0.6

			if var_172_12 < arg_169_1.time_ and arg_169_1.time_ <= var_172_12 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_14 = arg_169_1:FormatText(StoryNameCfg[668].name)

				arg_169_1.leftNameTxt_.text = var_172_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_15 = arg_169_1:GetWordFromCfg(319831041)
				local var_172_16 = arg_169_1:FormatText(var_172_15.content)

				arg_169_1.text_.text = var_172_16

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_17 = 24
				local var_172_18 = utf8.len(var_172_16)
				local var_172_19 = var_172_17 <= 0 and var_172_13 or var_172_13 * (var_172_18 / var_172_17)

				if var_172_19 > 0 and var_172_13 < var_172_19 then
					arg_169_1.talkMaxDuration = var_172_19

					if var_172_19 + var_172_12 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_19 + var_172_12
					end
				end

				arg_169_1.text_.text = var_172_16
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831041", "story_v_out_319831.awb") ~= 0 then
					local var_172_20 = manager.audio:GetVoiceLength("story_v_out_319831", "319831041", "story_v_out_319831.awb") / 1000

					if var_172_20 + var_172_12 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_20 + var_172_12
					end

					if var_172_15.prefab_name ~= "" and arg_169_1.actors_[var_172_15.prefab_name] ~= nil then
						local var_172_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_15.prefab_name].transform, "story_v_out_319831", "319831041", "story_v_out_319831.awb")

						arg_169_1:RecordAudio("319831041", var_172_21)
						arg_169_1:RecordAudio("319831041", var_172_21)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_319831", "319831041", "story_v_out_319831.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_319831", "319831041", "story_v_out_319831.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_22 = math.max(var_172_13, arg_169_1.talkMaxDuration)

			if var_172_12 <= arg_169_1.time_ and arg_169_1.time_ < var_172_12 + var_172_22 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_12) / var_172_22

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_12 + var_172_22 and arg_169_1.time_ < var_172_12 + var_172_22 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play319831042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319831042
		arg_173_1.duration_ = 3.4

		local var_173_0 = {
			zh = 2.333,
			ja = 3.4
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
				arg_173_0:Play319831043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4513")
			end

			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_176_2 = arg_173_1.actors_["4040ui_story"]
			local var_176_3 = 0

			if var_176_3 < arg_173_1.time_ and arg_173_1.time_ <= var_176_3 + arg_176_0 and arg_173_1.var_.characterEffect4040ui_story == nil then
				arg_173_1.var_.characterEffect4040ui_story = var_176_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_4 = 0.200000002980232

			if var_176_3 <= arg_173_1.time_ and arg_173_1.time_ < var_176_3 + var_176_4 then
				local var_176_5 = (arg_173_1.time_ - var_176_3) / var_176_4

				if arg_173_1.var_.characterEffect4040ui_story then
					local var_176_6 = Mathf.Lerp(0, 0.5, var_176_5)

					arg_173_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_173_1.var_.characterEffect4040ui_story.fillRatio = var_176_6
				end
			end

			if arg_173_1.time_ >= var_176_3 + var_176_4 and arg_173_1.time_ < var_176_3 + var_176_4 + arg_176_0 and arg_173_1.var_.characterEffect4040ui_story then
				local var_176_7 = 0.5

				arg_173_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_173_1.var_.characterEffect4040ui_story.fillRatio = var_176_7
			end

			local var_176_8 = arg_173_1.actors_["1084ui_story"]
			local var_176_9 = 0

			if var_176_9 < arg_173_1.time_ and arg_173_1.time_ <= var_176_9 + arg_176_0 and arg_173_1.var_.characterEffect1084ui_story == nil then
				arg_173_1.var_.characterEffect1084ui_story = var_176_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_10 = 0.200000002980232

			if var_176_9 <= arg_173_1.time_ and arg_173_1.time_ < var_176_9 + var_176_10 then
				local var_176_11 = (arg_173_1.time_ - var_176_9) / var_176_10

				if arg_173_1.var_.characterEffect1084ui_story then
					arg_173_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_9 + var_176_10 and arg_173_1.time_ < var_176_9 + var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1084ui_story then
				arg_173_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_176_12 = 0
			local var_176_13 = 0.35

			if var_176_12 < arg_173_1.time_ and arg_173_1.time_ <= var_176_12 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_14 = arg_173_1:FormatText(StoryNameCfg[6].name)

				arg_173_1.leftNameTxt_.text = var_176_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_15 = arg_173_1:GetWordFromCfg(319831042)
				local var_176_16 = arg_173_1:FormatText(var_176_15.content)

				arg_173_1.text_.text = var_176_16

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_17 = 14
				local var_176_18 = utf8.len(var_176_16)
				local var_176_19 = var_176_17 <= 0 and var_176_13 or var_176_13 * (var_176_18 / var_176_17)

				if var_176_19 > 0 and var_176_13 < var_176_19 then
					arg_173_1.talkMaxDuration = var_176_19

					if var_176_19 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_19 + var_176_12
					end
				end

				arg_173_1.text_.text = var_176_16
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831042", "story_v_out_319831.awb") ~= 0 then
					local var_176_20 = manager.audio:GetVoiceLength("story_v_out_319831", "319831042", "story_v_out_319831.awb") / 1000

					if var_176_20 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_20 + var_176_12
					end

					if var_176_15.prefab_name ~= "" and arg_173_1.actors_[var_176_15.prefab_name] ~= nil then
						local var_176_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_15.prefab_name].transform, "story_v_out_319831", "319831042", "story_v_out_319831.awb")

						arg_173_1:RecordAudio("319831042", var_176_21)
						arg_173_1:RecordAudio("319831042", var_176_21)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_319831", "319831042", "story_v_out_319831.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_319831", "319831042", "story_v_out_319831.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_22 = math.max(var_176_13, arg_173_1.talkMaxDuration)

			if var_176_12 <= arg_173_1.time_ and arg_173_1.time_ < var_176_12 + var_176_22 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_12) / var_176_22

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_12 + var_176_22 and arg_173_1.time_ < var_176_12 + var_176_22 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play319831043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 319831043
		arg_177_1.duration_ = 5.766

		local var_177_0 = {
			zh = 4.033,
			ja = 5.766
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
				arg_177_0:Play319831044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_180_2 = 0
			local var_180_3 = 0.5

			if var_180_2 < arg_177_1.time_ and arg_177_1.time_ <= var_180_2 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_4 = arg_177_1:FormatText(StoryNameCfg[6].name)

				arg_177_1.leftNameTxt_.text = var_180_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_5 = arg_177_1:GetWordFromCfg(319831043)
				local var_180_6 = arg_177_1:FormatText(var_180_5.content)

				arg_177_1.text_.text = var_180_6

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_7 = 20
				local var_180_8 = utf8.len(var_180_6)
				local var_180_9 = var_180_7 <= 0 and var_180_3 or var_180_3 * (var_180_8 / var_180_7)

				if var_180_9 > 0 and var_180_3 < var_180_9 then
					arg_177_1.talkMaxDuration = var_180_9

					if var_180_9 + var_180_2 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_9 + var_180_2
					end
				end

				arg_177_1.text_.text = var_180_6
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831043", "story_v_out_319831.awb") ~= 0 then
					local var_180_10 = manager.audio:GetVoiceLength("story_v_out_319831", "319831043", "story_v_out_319831.awb") / 1000

					if var_180_10 + var_180_2 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_10 + var_180_2
					end

					if var_180_5.prefab_name ~= "" and arg_177_1.actors_[var_180_5.prefab_name] ~= nil then
						local var_180_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_5.prefab_name].transform, "story_v_out_319831", "319831043", "story_v_out_319831.awb")

						arg_177_1:RecordAudio("319831043", var_180_11)
						arg_177_1:RecordAudio("319831043", var_180_11)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_319831", "319831043", "story_v_out_319831.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_319831", "319831043", "story_v_out_319831.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_12 = math.max(var_180_3, arg_177_1.talkMaxDuration)

			if var_180_2 <= arg_177_1.time_ and arg_177_1.time_ < var_180_2 + var_180_12 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_2) / var_180_12

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_2 + var_180_12 and arg_177_1.time_ < var_180_2 + var_180_12 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play319831044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 319831044
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play319831045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1084ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1084ui_story == nil then
				arg_181_1.var_.characterEffect1084ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1084ui_story then
					local var_184_4 = Mathf.Lerp(0, 0.5, var_184_3)

					arg_181_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1084ui_story.fillRatio = var_184_4
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1084ui_story then
				local var_184_5 = 0.5

				arg_181_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1084ui_story.fillRatio = var_184_5
			end

			local var_184_6 = arg_181_1.actors_["4040ui_story"].transform
			local var_184_7 = 0

			if var_184_7 < arg_181_1.time_ and arg_181_1.time_ <= var_184_7 + arg_184_0 then
				arg_181_1.var_.moveOldPos4040ui_story = var_184_6.localPosition
			end

			local var_184_8 = 0.001

			if var_184_7 <= arg_181_1.time_ and arg_181_1.time_ < var_184_7 + var_184_8 then
				local var_184_9 = (arg_181_1.time_ - var_184_7) / var_184_8
				local var_184_10 = Vector3.New(0, 100, 0)

				var_184_6.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos4040ui_story, var_184_10, var_184_9)

				local var_184_11 = manager.ui.mainCamera.transform.position - var_184_6.position

				var_184_6.forward = Vector3.New(var_184_11.x, var_184_11.y, var_184_11.z)

				local var_184_12 = var_184_6.localEulerAngles

				var_184_12.z = 0
				var_184_12.x = 0
				var_184_6.localEulerAngles = var_184_12
			end

			if arg_181_1.time_ >= var_184_7 + var_184_8 and arg_181_1.time_ < var_184_7 + var_184_8 + arg_184_0 then
				var_184_6.localPosition = Vector3.New(0, 100, 0)

				local var_184_13 = manager.ui.mainCamera.transform.position - var_184_6.position

				var_184_6.forward = Vector3.New(var_184_13.x, var_184_13.y, var_184_13.z)

				local var_184_14 = var_184_6.localEulerAngles

				var_184_14.z = 0
				var_184_14.x = 0
				var_184_6.localEulerAngles = var_184_14
			end

			local var_184_15 = arg_181_1.actors_["1084ui_story"].transform
			local var_184_16 = 0

			if var_184_16 < arg_181_1.time_ and arg_181_1.time_ <= var_184_16 + arg_184_0 then
				arg_181_1.var_.moveOldPos1084ui_story = var_184_15.localPosition
			end

			local var_184_17 = 0.001

			if var_184_16 <= arg_181_1.time_ and arg_181_1.time_ < var_184_16 + var_184_17 then
				local var_184_18 = (arg_181_1.time_ - var_184_16) / var_184_17
				local var_184_19 = Vector3.New(0, 100, 0)

				var_184_15.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1084ui_story, var_184_19, var_184_18)

				local var_184_20 = manager.ui.mainCamera.transform.position - var_184_15.position

				var_184_15.forward = Vector3.New(var_184_20.x, var_184_20.y, var_184_20.z)

				local var_184_21 = var_184_15.localEulerAngles

				var_184_21.z = 0
				var_184_21.x = 0
				var_184_15.localEulerAngles = var_184_21
			end

			if arg_181_1.time_ >= var_184_16 + var_184_17 and arg_181_1.time_ < var_184_16 + var_184_17 + arg_184_0 then
				var_184_15.localPosition = Vector3.New(0, 100, 0)

				local var_184_22 = manager.ui.mainCamera.transform.position - var_184_15.position

				var_184_15.forward = Vector3.New(var_184_22.x, var_184_22.y, var_184_22.z)

				local var_184_23 = var_184_15.localEulerAngles

				var_184_23.z = 0
				var_184_23.x = 0
				var_184_15.localEulerAngles = var_184_23
			end

			local var_184_24 = 0
			local var_184_25 = 0.9

			if var_184_24 < arg_181_1.time_ and arg_181_1.time_ <= var_184_24 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, false)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_26 = arg_181_1:GetWordFromCfg(319831044)
				local var_184_27 = arg_181_1:FormatText(var_184_26.content)

				arg_181_1.text_.text = var_184_27

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_28 = 36
				local var_184_29 = utf8.len(var_184_27)
				local var_184_30 = var_184_28 <= 0 and var_184_25 or var_184_25 * (var_184_29 / var_184_28)

				if var_184_30 > 0 and var_184_25 < var_184_30 then
					arg_181_1.talkMaxDuration = var_184_30

					if var_184_30 + var_184_24 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_30 + var_184_24
					end
				end

				arg_181_1.text_.text = var_184_27
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_31 = math.max(var_184_25, arg_181_1.talkMaxDuration)

			if var_184_24 <= arg_181_1.time_ and arg_181_1.time_ < var_184_24 + var_184_31 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_24) / var_184_31

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_24 + var_184_31 and arg_181_1.time_ < var_184_24 + var_184_31 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play319831045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319831045
		arg_185_1.duration_ = 3.066

		local var_185_0 = {
			zh = 3.066,
			ja = 2.433
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
				arg_185_0:Play319831046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["4040ui_story"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos4040ui_story = var_188_0.localPosition
			end

			local var_188_2 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2
				local var_188_4 = Vector3.New(0, -1.55, -5.5)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos4040ui_story, var_188_4, var_188_3)

				local var_188_5 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_5.x, var_188_5.y, var_188_5.z)

				local var_188_6 = var_188_0.localEulerAngles

				var_188_6.z = 0
				var_188_6.x = 0
				var_188_0.localEulerAngles = var_188_6
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_188_7 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_7.x, var_188_7.y, var_188_7.z)

				local var_188_8 = var_188_0.localEulerAngles

				var_188_8.z = 0
				var_188_8.x = 0
				var_188_0.localEulerAngles = var_188_8
			end

			local var_188_9 = 0

			if var_188_9 < arg_185_1.time_ and arg_185_1.time_ <= var_188_9 + arg_188_0 then
				arg_185_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action4_2")
			end

			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 then
				arg_185_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_188_11 = arg_185_1.actors_["4040ui_story"]
			local var_188_12 = 0

			if var_188_12 < arg_185_1.time_ and arg_185_1.time_ <= var_188_12 + arg_188_0 and arg_185_1.var_.characterEffect4040ui_story == nil then
				arg_185_1.var_.characterEffect4040ui_story = var_188_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_13 = 0.200000002980232

			if var_188_12 <= arg_185_1.time_ and arg_185_1.time_ < var_188_12 + var_188_13 then
				local var_188_14 = (arg_185_1.time_ - var_188_12) / var_188_13

				if arg_185_1.var_.characterEffect4040ui_story then
					arg_185_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_12 + var_188_13 and arg_185_1.time_ < var_188_12 + var_188_13 + arg_188_0 and arg_185_1.var_.characterEffect4040ui_story then
				arg_185_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_188_15 = 0
			local var_188_16 = 0.15

			if var_188_15 < arg_185_1.time_ and arg_185_1.time_ <= var_188_15 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_17 = arg_185_1:FormatText(StoryNameCfg[668].name)

				arg_185_1.leftNameTxt_.text = var_188_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_18 = arg_185_1:GetWordFromCfg(319831045)
				local var_188_19 = arg_185_1:FormatText(var_188_18.content)

				arg_185_1.text_.text = var_188_19

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_20 = 6
				local var_188_21 = utf8.len(var_188_19)
				local var_188_22 = var_188_20 <= 0 and var_188_16 or var_188_16 * (var_188_21 / var_188_20)

				if var_188_22 > 0 and var_188_16 < var_188_22 then
					arg_185_1.talkMaxDuration = var_188_22

					if var_188_22 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_22 + var_188_15
					end
				end

				arg_185_1.text_.text = var_188_19
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831045", "story_v_out_319831.awb") ~= 0 then
					local var_188_23 = manager.audio:GetVoiceLength("story_v_out_319831", "319831045", "story_v_out_319831.awb") / 1000

					if var_188_23 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_23 + var_188_15
					end

					if var_188_18.prefab_name ~= "" and arg_185_1.actors_[var_188_18.prefab_name] ~= nil then
						local var_188_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_18.prefab_name].transform, "story_v_out_319831", "319831045", "story_v_out_319831.awb")

						arg_185_1:RecordAudio("319831045", var_188_24)
						arg_185_1:RecordAudio("319831045", var_188_24)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319831", "319831045", "story_v_out_319831.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319831", "319831045", "story_v_out_319831.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_25 = math.max(var_188_16, arg_185_1.talkMaxDuration)

			if var_188_15 <= arg_185_1.time_ and arg_185_1.time_ < var_188_15 + var_188_25 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_15) / var_188_25

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_15 + var_188_25 and arg_185_1.time_ < var_188_15 + var_188_25 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319831046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319831046
		arg_189_1.duration_ = 6.3

		local var_189_0 = {
			zh = 4.3,
			ja = 6.3
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
				arg_189_0:Play319831047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.5

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[668].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(319831046)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_319831", "319831046", "story_v_out_319831.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_319831", "319831046", "story_v_out_319831.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_319831", "319831046", "story_v_out_319831.awb")

						arg_189_1:RecordAudio("319831046", var_192_9)
						arg_189_1:RecordAudio("319831046", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_319831", "319831046", "story_v_out_319831.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_319831", "319831046", "story_v_out_319831.awb")
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
	Play319831047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319831047
		arg_193_1.duration_ = 5.63333333333333

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play319831048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["4040ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect4040ui_story == nil then
				arg_193_1.var_.characterEffect4040ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.200000002980232

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect4040ui_story then
					local var_196_4 = Mathf.Lerp(0, 0.5, var_196_3)

					arg_193_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_193_1.var_.characterEffect4040ui_story.fillRatio = var_196_4
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect4040ui_story then
				local var_196_5 = 0.5

				arg_193_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_193_1.var_.characterEffect4040ui_story.fillRatio = var_196_5
			end

			local var_196_6 = 0
			local var_196_7 = 1

			if var_196_6 < arg_193_1.time_ and arg_193_1.time_ <= var_196_6 + arg_196_0 then
				local var_196_8 = "play"
				local var_196_9 = "effect"

				arg_193_1:AudioAction(var_196_8, var_196_9, "se_story_122_03", "se_story_122_03_swordlight", "")
			end

			local var_196_10 = arg_193_1.actors_["4040ui_story"].transform
			local var_196_11 = 0

			if var_196_11 < arg_193_1.time_ and arg_193_1.time_ <= var_196_11 + arg_196_0 then
				arg_193_1.var_.moveOldPos4040ui_story = var_196_10.localPosition
			end

			local var_196_12 = 0.001

			if var_196_11 <= arg_193_1.time_ and arg_193_1.time_ < var_196_11 + var_196_12 then
				local var_196_13 = (arg_193_1.time_ - var_196_11) / var_196_12
				local var_196_14 = Vector3.New(0, 100, 0)

				var_196_10.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos4040ui_story, var_196_14, var_196_13)

				local var_196_15 = manager.ui.mainCamera.transform.position - var_196_10.position

				var_196_10.forward = Vector3.New(var_196_15.x, var_196_15.y, var_196_15.z)

				local var_196_16 = var_196_10.localEulerAngles

				var_196_16.z = 0
				var_196_16.x = 0
				var_196_10.localEulerAngles = var_196_16
			end

			if arg_193_1.time_ >= var_196_11 + var_196_12 and arg_193_1.time_ < var_196_11 + var_196_12 + arg_196_0 then
				var_196_10.localPosition = Vector3.New(0, 100, 0)

				local var_196_17 = manager.ui.mainCamera.transform.position - var_196_10.position

				var_196_10.forward = Vector3.New(var_196_17.x, var_196_17.y, var_196_17.z)

				local var_196_18 = var_196_10.localEulerAngles

				var_196_18.z = 0
				var_196_18.x = 0
				var_196_10.localEulerAngles = var_196_18
			end

			local var_196_19 = manager.ui.mainCamera.transform
			local var_196_20 = 0

			if var_196_20 < arg_193_1.time_ and arg_193_1.time_ <= var_196_20 + arg_196_0 then
				local var_196_21 = arg_193_1.var_.effect123

				if not var_196_21 then
					var_196_21 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_196_21.name = "123"
					arg_193_1.var_.effect123 = var_196_21
				end

				local var_196_22 = var_196_19:Find("")

				if var_196_22 then
					var_196_21.transform.parent = var_196_22
				else
					var_196_21.transform.parent = var_196_19
				end

				var_196_21.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_196_21.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			if arg_193_1.frameCnt_ <= 1 then
				arg_193_1.dialog_:SetActive(false)
			end

			local var_196_23 = 0.633333333333333
			local var_196_24 = 0.825

			if var_196_23 < arg_193_1.time_ and arg_193_1.time_ <= var_196_23 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0

				arg_193_1.dialog_:SetActive(true)

				local var_196_25 = LeanTween.value(arg_193_1.dialog_, 0, 1, 0.3)

				var_196_25:setOnUpdate(LuaHelper.FloatAction(function(arg_197_0)
					arg_193_1.dialogCg_.alpha = arg_197_0
				end))
				var_196_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_193_1.dialog_)
					var_196_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_193_1.duration_ = arg_193_1.duration_ + 0.3

				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_26 = arg_193_1:GetWordFromCfg(319831047)
				local var_196_27 = arg_193_1:FormatText(var_196_26.content)

				arg_193_1.text_.text = var_196_27

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_28 = 33
				local var_196_29 = utf8.len(var_196_27)
				local var_196_30 = var_196_28 <= 0 and var_196_24 or var_196_24 * (var_196_29 / var_196_28)

				if var_196_30 > 0 and var_196_24 < var_196_30 then
					arg_193_1.talkMaxDuration = var_196_30
					var_196_23 = var_196_23 + 0.3

					if var_196_30 + var_196_23 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_30 + var_196_23
					end
				end

				arg_193_1.text_.text = var_196_27
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_31 = var_196_23 + 0.3
			local var_196_32 = math.max(var_196_24, arg_193_1.talkMaxDuration)

			if var_196_31 <= arg_193_1.time_ and arg_193_1.time_ < var_196_31 + var_196_32 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_31) / var_196_32

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_31 + var_196_32 and arg_193_1.time_ < var_196_31 + var_196_32 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play319831048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319831048
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play319831049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = manager.ui.mainCamera.transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				local var_202_2 = arg_199_1.var_.effect123

				if var_202_2 then
					Object.Destroy(var_202_2)

					arg_199_1.var_.effect123 = nil
				end
			end

			local var_202_3 = 0
			local var_202_4 = 1.325

			if var_202_3 < arg_199_1.time_ and arg_199_1.time_ <= var_202_3 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_5 = arg_199_1:GetWordFromCfg(319831048)
				local var_202_6 = arg_199_1:FormatText(var_202_5.content)

				arg_199_1.text_.text = var_202_6

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_7 = 53
				local var_202_8 = utf8.len(var_202_6)
				local var_202_9 = var_202_7 <= 0 and var_202_4 or var_202_4 * (var_202_8 / var_202_7)

				if var_202_9 > 0 and var_202_4 < var_202_9 then
					arg_199_1.talkMaxDuration = var_202_9

					if var_202_9 + var_202_3 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_9 + var_202_3
					end
				end

				arg_199_1.text_.text = var_202_6
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_10 = math.max(var_202_4, arg_199_1.talkMaxDuration)

			if var_202_3 <= arg_199_1.time_ and arg_199_1.time_ < var_202_3 + var_202_10 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_3) / var_202_10

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_3 + var_202_10 and arg_199_1.time_ < var_202_3 + var_202_10 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play319831049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319831049
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
			arg_203_1.auto_ = false
		end

		function arg_203_1.playNext_(arg_205_0)
			arg_203_1.onStoryFinished_()
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 1.025

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_2 = arg_203_1:GetWordFromCfg(319831049)
				local var_206_3 = arg_203_1:FormatText(var_206_2.content)

				arg_203_1.text_.text = var_206_3

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_4 = 41
				local var_206_5 = utf8.len(var_206_3)
				local var_206_6 = var_206_4 <= 0 and var_206_1 or var_206_1 * (var_206_5 / var_206_4)

				if var_206_6 > 0 and var_206_1 < var_206_6 then
					arg_203_1.talkMaxDuration = var_206_6

					if var_206_6 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_6 + var_206_0
					end
				end

				arg_203_1.text_.text = var_206_3
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_7 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_7 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_7

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_7 and arg_203_1.time_ < var_206_0 + var_206_7 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D02a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_319831.awb"
	}
}
