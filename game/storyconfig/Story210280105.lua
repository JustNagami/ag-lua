return {
	Play1102805001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1102805001
		arg_1_1.duration_ = 5.933

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play1102805002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J02a"

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
				local var_4_5 = arg_1_1.bgs_.J02a

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
					if iter_4_0 ~= "J02a" then
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

			local var_4_22 = "1028ui_story"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("Char/" .. var_4_22), arg_1_1.stage_.transform)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_22] = var_4_23

				local var_4_24 = var_4_23:GetComponentInChildren(typeof(CharacterEffect))

				var_4_24.enabled = true

				local var_4_25 = GameObjectTools.GetOrAddComponent(var_4_23, typeof(DynamicBoneHelper))

				if var_4_25 then
					var_4_25:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_24.transform, false)

				arg_1_1.var_[var_4_22 .. "Animator"] = var_4_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_22 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_22 .. "LipSync"] = var_4_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_26 = arg_1_1.actors_["1028ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1028ui_story = var_4_26.localPosition

				local var_4_28 = "1028ui_story"

				arg_1_1:ShowWeapon(arg_1_1.var_[var_4_28 .. "Animator"].transform, true)
			end

			local var_4_29 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_29 then
				local var_4_30 = (arg_1_1.time_ - var_4_27) / var_4_29
				local var_4_31 = Vector3.New(0, -0.9, -5.9)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1028ui_story, var_4_31, var_4_30)

				local var_4_32 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_32.x, var_4_32.y, var_4_32.z)

				local var_4_33 = var_4_26.localEulerAngles

				var_4_33.z = 0
				var_4_33.x = 0
				var_4_26.localEulerAngles = var_4_33
			end

			if arg_1_1.time_ >= var_4_27 + var_4_29 and arg_1_1.time_ < var_4_27 + var_4_29 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_4_34 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_34.x, var_4_34.y, var_4_34.z)

				local var_4_35 = var_4_26.localEulerAngles

				var_4_35.z = 0
				var_4_35.x = 0
				var_4_26.localEulerAngles = var_4_35
			end

			local var_4_36 = arg_1_1.actors_["1028ui_story"]
			local var_4_37 = 2

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1028ui_story == nil then
				arg_1_1.var_.characterEffect1028ui_story = var_4_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_38 = 0.200000002980232

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 then
				local var_4_39 = (arg_1_1.time_ - var_4_37) / var_4_38

				if arg_1_1.var_.characterEffect1028ui_story then
					arg_1_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1028ui_story then
				arg_1_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_4_40 = 1.5

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action2_1")
			end

			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_42 = 0
			local var_4_43 = 0.6

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				local var_4_44 = "play"
				local var_4_45 = "music"

				arg_1_1:AudioAction(var_4_44, var_4_45, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_46 = 0.8
			local var_4_47 = 1

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				local var_4_48 = "play"
				local var_4_49 = "music"

				arg_1_1:AudioAction(var_4_48, var_4_49, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_50 = 2
			local var_4_51 = 0.425

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_52 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_52:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_53 = arg_1_1:FormatText(StoryNameCfg[327].name)

				arg_1_1.leftNameTxt_.text = var_4_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_54 = arg_1_1:GetWordFromCfg(1102805001)
				local var_4_55 = arg_1_1:FormatText(var_4_54.content)

				arg_1_1.text_.text = var_4_55

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_56 = 17
				local var_4_57 = utf8.len(var_4_55)
				local var_4_58 = var_4_56 <= 0 and var_4_51 or var_4_51 * (var_4_57 / var_4_56)

				if var_4_58 > 0 and var_4_51 < var_4_58 then
					arg_1_1.talkMaxDuration = var_4_58
					var_4_50 = var_4_50 + 0.3

					if var_4_58 + var_4_50 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_50
					end
				end

				arg_1_1.text_.text = var_4_55
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805001", "story_v_side_new_1102805.awb") ~= 0 then
					local var_4_59 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805001", "story_v_side_new_1102805.awb") / 1000

					if var_4_59 + var_4_50 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_59 + var_4_50
					end

					if var_4_54.prefab_name ~= "" and arg_1_1.actors_[var_4_54.prefab_name] ~= nil then
						local var_4_60 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_54.prefab_name].transform, "story_v_side_new_1102805", "1102805001", "story_v_side_new_1102805.awb")

						arg_1_1:RecordAudio("1102805001", var_4_60)
						arg_1_1:RecordAudio("1102805001", var_4_60)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805001", "story_v_side_new_1102805.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805001", "story_v_side_new_1102805.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_61 = var_4_50 + 0.3
			local var_4_62 = math.max(var_4_51, arg_1_1.talkMaxDuration)

			if var_4_61 <= arg_1_1.time_ and arg_1_1.time_ < var_4_61 + var_4_62 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_61) / var_4_62

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_61 + var_4_62 and arg_1_1.time_ < var_4_61 + var_4_62 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 1102805002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play1102805003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1028ui_story"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos1028ui_story = var_10_0.localPosition

				local var_10_2 = "1028ui_story"

				arg_7_1:ShowWeapon(arg_7_1.var_[var_10_2 .. "Animator"].transform, false)
			end

			local var_10_3 = 0.001

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_3 then
				local var_10_4 = (arg_7_1.time_ - var_10_1) / var_10_3
				local var_10_5 = Vector3.New(0, 100, 0)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1028ui_story, var_10_5, var_10_4)

				local var_10_6 = manager.ui.mainCamera.transform.position - var_10_0.position

				var_10_0.forward = Vector3.New(var_10_6.x, var_10_6.y, var_10_6.z)

				local var_10_7 = var_10_0.localEulerAngles

				var_10_7.z = 0
				var_10_7.x = 0
				var_10_0.localEulerAngles = var_10_7
			end

			if arg_7_1.time_ >= var_10_1 + var_10_3 and arg_7_1.time_ < var_10_1 + var_10_3 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(0, 100, 0)

				local var_10_8 = manager.ui.mainCamera.transform.position - var_10_0.position

				var_10_0.forward = Vector3.New(var_10_8.x, var_10_8.y, var_10_8.z)

				local var_10_9 = var_10_0.localEulerAngles

				var_10_9.z = 0
				var_10_9.x = 0
				var_10_0.localEulerAngles = var_10_9
			end

			local var_10_10 = arg_7_1.actors_["1028ui_story"]
			local var_10_11 = 0

			if var_10_11 < arg_7_1.time_ and arg_7_1.time_ <= var_10_11 + arg_10_0 and arg_7_1.var_.characterEffect1028ui_story == nil then
				arg_7_1.var_.characterEffect1028ui_story = var_10_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_12 = 0.200000002980232

			if var_10_11 <= arg_7_1.time_ and arg_7_1.time_ < var_10_11 + var_10_12 then
				local var_10_13 = (arg_7_1.time_ - var_10_11) / var_10_12

				if arg_7_1.var_.characterEffect1028ui_story then
					local var_10_14 = Mathf.Lerp(0, 0.5, var_10_13)

					arg_7_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1028ui_story.fillRatio = var_10_14
				end
			end

			if arg_7_1.time_ >= var_10_11 + var_10_12 and arg_7_1.time_ < var_10_11 + var_10_12 + arg_10_0 and arg_7_1.var_.characterEffect1028ui_story then
				local var_10_15 = 0.5

				arg_7_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1028ui_story.fillRatio = var_10_15
			end

			local var_10_16 = 0
			local var_10_17 = 0.6

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_18 = arg_7_1:GetWordFromCfg(1102805002)
				local var_10_19 = arg_7_1:FormatText(var_10_18.content)

				arg_7_1.text_.text = var_10_19

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_20 = 24
				local var_10_21 = utf8.len(var_10_19)
				local var_10_22 = var_10_20 <= 0 and var_10_17 or var_10_17 * (var_10_21 / var_10_20)

				if var_10_22 > 0 and var_10_17 < var_10_22 then
					arg_7_1.talkMaxDuration = var_10_22

					if var_10_22 + var_10_16 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_22 + var_10_16
					end
				end

				arg_7_1.text_.text = var_10_19
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_23 = math.max(var_10_17, arg_7_1.talkMaxDuration)

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_23 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_16) / var_10_23

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_16 + var_10_23 and arg_7_1.time_ < var_10_16 + var_10_23 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 1102805003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play1102805004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.475

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[7].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(1102805003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 19
				local var_14_6 = utf8.len(var_14_4)
				local var_14_7 = var_14_5 <= 0 and var_14_1 or var_14_1 * (var_14_6 / var_14_5)

				if var_14_7 > 0 and var_14_1 < var_14_7 then
					arg_11_1.talkMaxDuration = var_14_7

					if var_14_7 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_7 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_4
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_8 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_8 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_8

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_8 and arg_11_1.time_ < var_14_0 + var_14_8 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 1102805004
		arg_15_1.duration_ = 3.8

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play1102805005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1028ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1028ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, -0.9, -5.9)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1028ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["1028ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1028ui_story == nil then
				arg_15_1.var_.characterEffect1028ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1028ui_story then
					arg_15_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1028ui_story then
				arg_15_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_1")
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_15 = 0
			local var_18_16 = 0.5

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_17 = arg_15_1:FormatText(StoryNameCfg[327].name)

				arg_15_1.leftNameTxt_.text = var_18_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_18 = arg_15_1:GetWordFromCfg(1102805004)
				local var_18_19 = arg_15_1:FormatText(var_18_18.content)

				arg_15_1.text_.text = var_18_19

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_20 = 20
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805004", "story_v_side_new_1102805.awb") ~= 0 then
					local var_18_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805004", "story_v_side_new_1102805.awb") / 1000

					if var_18_23 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_23 + var_18_15
					end

					if var_18_18.prefab_name ~= "" and arg_15_1.actors_[var_18_18.prefab_name] ~= nil then
						local var_18_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_18.prefab_name].transform, "story_v_side_new_1102805", "1102805004", "story_v_side_new_1102805.awb")

						arg_15_1:RecordAudio("1102805004", var_18_24)
						arg_15_1:RecordAudio("1102805004", var_18_24)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805004", "story_v_side_new_1102805.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805004", "story_v_side_new_1102805.awb")
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
	Play1102805005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 1102805005
		arg_19_1.duration_ = 0.999999999999

		SetActive(arg_19_1.tipsGo_, true)

		arg_19_1.tipsText_.text = StoryTipsCfg[102801].name

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"

			SetActive(arg_19_1.choicesGo_, true)

			for iter_20_0, iter_20_1 in ipairs(arg_19_1.choices_) do
				local var_20_0 = iter_20_0 <= 2

				SetActive(iter_20_1.go, var_20_0)
			end

			arg_19_1.choices_[1].txt.text = arg_19_1:FormatText(StoryChoiceCfg[647].name)
			arg_19_1.choices_[2].txt.text = arg_19_1:FormatText(StoryChoiceCfg[648].name)
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play1102805006(arg_19_1)
			end

			if arg_21_0 == 2 then
				PlayerAction.UseStoryTrigger(1028011, 210280105, 1102805005, 2)
				arg_19_0:Play1102805007(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1028ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1028ui_story == nil then
				arg_19_1.var_.characterEffect1028ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1028ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1028ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1028ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1028ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.allBtn_.enabled = false
			end

			local var_22_7 = 0.5

			if arg_19_1.time_ >= var_22_6 + var_22_7 and arg_19_1.time_ < var_22_6 + var_22_7 + arg_22_0 then
				arg_19_1.allBtn_.enabled = true
			end
		end
	end,
	Play1102805006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 1102805006
		arg_23_1.duration_ = 3.433

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play1102805008(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1028ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1028ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, -0.9, -5.9)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1028ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1028ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1028ui_story == nil then
				arg_23_1.var_.characterEffect1028ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1028ui_story then
					arg_23_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1028ui_story then
				arg_23_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action457")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_26_15 = 0
			local var_26_16 = 0.325

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_17 = arg_23_1:FormatText(StoryNameCfg[327].name)

				arg_23_1.leftNameTxt_.text = var_26_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_18 = arg_23_1:GetWordFromCfg(1102805006)
				local var_26_19 = arg_23_1:FormatText(var_26_18.content)

				arg_23_1.text_.text = var_26_19

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_20 = 13
				local var_26_21 = utf8.len(var_26_19)
				local var_26_22 = var_26_20 <= 0 and var_26_16 or var_26_16 * (var_26_21 / var_26_20)

				if var_26_22 > 0 and var_26_16 < var_26_22 then
					arg_23_1.talkMaxDuration = var_26_22

					if var_26_22 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_22 + var_26_15
					end
				end

				arg_23_1.text_.text = var_26_19
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805006", "story_v_side_new_1102805.awb") ~= 0 then
					local var_26_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805006", "story_v_side_new_1102805.awb") / 1000

					if var_26_23 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_23 + var_26_15
					end

					if var_26_18.prefab_name ~= "" and arg_23_1.actors_[var_26_18.prefab_name] ~= nil then
						local var_26_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_18.prefab_name].transform, "story_v_side_new_1102805", "1102805006", "story_v_side_new_1102805.awb")

						arg_23_1:RecordAudio("1102805006", var_26_24)
						arg_23_1:RecordAudio("1102805006", var_26_24)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805006", "story_v_side_new_1102805.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805006", "story_v_side_new_1102805.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_25 = math.max(var_26_16, arg_23_1.talkMaxDuration)

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_25 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_15) / var_26_25

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_15 + var_26_25 and arg_23_1.time_ < var_26_15 + var_26_25 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805008 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 1102805008
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play1102805009(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1028ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1028ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1028ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, 100, 0)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["1028ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1028ui_story == nil then
				arg_27_1.var_.characterEffect1028ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect1028ui_story then
					local var_30_13 = Mathf.Lerp(0, 0.5, var_30_12)

					arg_27_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1028ui_story.fillRatio = var_30_13
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect1028ui_story then
				local var_30_14 = 0.5

				arg_27_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1028ui_story.fillRatio = var_30_14
			end

			local var_30_15 = 0
			local var_30_16 = 0.475

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_17 = arg_27_1:GetWordFromCfg(1102805008)
				local var_30_18 = arg_27_1:FormatText(var_30_17.content)

				arg_27_1.text_.text = var_30_18

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_19 = 19
				local var_30_20 = utf8.len(var_30_18)
				local var_30_21 = var_30_19 <= 0 and var_30_16 or var_30_16 * (var_30_20 / var_30_19)

				if var_30_21 > 0 and var_30_16 < var_30_21 then
					arg_27_1.talkMaxDuration = var_30_21

					if var_30_21 + var_30_15 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_21 + var_30_15
					end
				end

				arg_27_1.text_.text = var_30_18
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_22 = math.max(var_30_16, arg_27_1.talkMaxDuration)

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_22 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_15) / var_30_22

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_15 + var_30_22 and arg_27_1.time_ < var_30_15 + var_30_22 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805009 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 1102805009
		arg_31_1.duration_ = 10.666

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play1102805010(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "ST10"

			if arg_31_1.bgs_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(arg_31_1.paintGo_)

				var_34_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_34_0)
				var_34_1.name = var_34_0
				var_34_1.transform.parent = arg_31_1.stage_.transform
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.bgs_[var_34_0] = var_34_1
			end

			local var_34_2 = 2

			if var_34_2 < arg_31_1.time_ and arg_31_1.time_ <= var_34_2 + arg_34_0 then
				local var_34_3 = manager.ui.mainCamera.transform.localPosition
				local var_34_4 = Vector3.New(0, 0, 10) + Vector3.New(var_34_3.x, var_34_3.y, 0)
				local var_34_5 = arg_31_1.bgs_.ST10

				var_34_5.transform.localPosition = var_34_4
				var_34_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_6 = var_34_5:GetComponent("SpriteRenderer")

				if var_34_6 and var_34_6.sprite then
					local var_34_7 = (var_34_5.transform.localPosition - var_34_3).z
					local var_34_8 = manager.ui.mainCameraCom_
					local var_34_9 = 2 * var_34_7 * Mathf.Tan(var_34_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_10 = var_34_9 * var_34_8.aspect
					local var_34_11 = var_34_6.sprite.bounds.size.x
					local var_34_12 = var_34_6.sprite.bounds.size.y
					local var_34_13 = var_34_10 / var_34_11
					local var_34_14 = var_34_9 / var_34_12
					local var_34_15 = var_34_14 < var_34_13 and var_34_13 or var_34_14

					var_34_5.transform.localScale = Vector3.New(var_34_15, var_34_15, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "ST10" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_17 = 2

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17
				local var_34_19 = Color.New(0, 0, 0)

				var_34_19.a = Mathf.Lerp(0, 1, var_34_18)
				arg_31_1.mask_.color = var_34_19
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 then
				local var_34_20 = Color.New(0, 0, 0)

				var_34_20.a = 1
				arg_31_1.mask_.color = var_34_20
			end

			local var_34_21 = 2

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_22 = 2

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_22 then
				local var_34_23 = (arg_31_1.time_ - var_34_21) / var_34_22
				local var_34_24 = Color.New(0, 0, 0)

				var_34_24.a = Mathf.Lerp(1, 0, var_34_23)
				arg_31_1.mask_.color = var_34_24
			end

			if arg_31_1.time_ >= var_34_21 + var_34_22 and arg_31_1.time_ < var_34_21 + var_34_22 + arg_34_0 then
				local var_34_25 = Color.New(0, 0, 0)
				local var_34_26 = 0

				arg_31_1.mask_.enabled = false
				var_34_25.a = var_34_26
				arg_31_1.mask_.color = var_34_25
			end

			local var_34_27 = arg_31_1.actors_["1028ui_story"].transform
			local var_34_28 = 4

			if var_34_28 < arg_31_1.time_ and arg_31_1.time_ <= var_34_28 + arg_34_0 then
				arg_31_1.var_.moveOldPos1028ui_story = var_34_27.localPosition
			end

			local var_34_29 = 0.001

			if var_34_28 <= arg_31_1.time_ and arg_31_1.time_ < var_34_28 + var_34_29 then
				local var_34_30 = (arg_31_1.time_ - var_34_28) / var_34_29
				local var_34_31 = Vector3.New(0, -0.9, -5.9)

				var_34_27.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1028ui_story, var_34_31, var_34_30)

				local var_34_32 = manager.ui.mainCamera.transform.position - var_34_27.position

				var_34_27.forward = Vector3.New(var_34_32.x, var_34_32.y, var_34_32.z)

				local var_34_33 = var_34_27.localEulerAngles

				var_34_33.z = 0
				var_34_33.x = 0
				var_34_27.localEulerAngles = var_34_33
			end

			if arg_31_1.time_ >= var_34_28 + var_34_29 and arg_31_1.time_ < var_34_28 + var_34_29 + arg_34_0 then
				var_34_27.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_34_34 = manager.ui.mainCamera.transform.position - var_34_27.position

				var_34_27.forward = Vector3.New(var_34_34.x, var_34_34.y, var_34_34.z)

				local var_34_35 = var_34_27.localEulerAngles

				var_34_35.z = 0
				var_34_35.x = 0
				var_34_27.localEulerAngles = var_34_35
			end

			local var_34_36 = arg_31_1.actors_["1028ui_story"]
			local var_34_37 = 4

			if var_34_37 < arg_31_1.time_ and arg_31_1.time_ <= var_34_37 + arg_34_0 and arg_31_1.var_.characterEffect1028ui_story == nil then
				arg_31_1.var_.characterEffect1028ui_story = var_34_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_38 = 0.200000002980232

			if var_34_37 <= arg_31_1.time_ and arg_31_1.time_ < var_34_37 + var_34_38 then
				local var_34_39 = (arg_31_1.time_ - var_34_37) / var_34_38

				if arg_31_1.var_.characterEffect1028ui_story then
					arg_31_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_37 + var_34_38 and arg_31_1.time_ < var_34_37 + var_34_38 + arg_34_0 and arg_31_1.var_.characterEffect1028ui_story then
				arg_31_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_34_40 = 4

			if var_34_40 < arg_31_1.time_ and arg_31_1.time_ <= var_34_40 + arg_34_0 then
				arg_31_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_34_41 = 4

			if var_34_41 < arg_31_1.time_ and arg_31_1.time_ <= var_34_41 + arg_34_0 then
				arg_31_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_42 = 2

			if var_34_42 < arg_31_1.time_ and arg_31_1.time_ <= var_34_42 + arg_34_0 then
				arg_31_1.screenFilterGo_:SetActive(true)

				arg_31_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_34_43 = 0.0166666666666667

			if var_34_42 <= arg_31_1.time_ and arg_31_1.time_ < var_34_42 + var_34_43 then
				local var_34_44 = (arg_31_1.time_ - var_34_42) / var_34_43

				arg_31_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_34_44)
			end

			if arg_31_1.time_ >= var_34_42 + var_34_43 and arg_31_1.time_ < var_34_42 + var_34_43 + arg_34_0 then
				arg_31_1.screenFilterEffect_.weight = 1
			end

			if arg_31_1.frameCnt_ <= 1 then
				arg_31_1.dialog_:SetActive(false)
			end

			local var_34_45 = 4
			local var_34_46 = 0.775

			if var_34_45 < arg_31_1.time_ and arg_31_1.time_ <= var_34_45 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_47 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_47:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_48 = arg_31_1:FormatText(StoryNameCfg[327].name)

				arg_31_1.leftNameTxt_.text = var_34_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_49 = arg_31_1:GetWordFromCfg(1102805009)
				local var_34_50 = arg_31_1:FormatText(var_34_49.content)

				arg_31_1.text_.text = var_34_50

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_51 = 31
				local var_34_52 = utf8.len(var_34_50)
				local var_34_53 = var_34_51 <= 0 and var_34_46 or var_34_46 * (var_34_52 / var_34_51)

				if var_34_53 > 0 and var_34_46 < var_34_53 then
					arg_31_1.talkMaxDuration = var_34_53
					var_34_45 = var_34_45 + 0.3

					if var_34_53 + var_34_45 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_53 + var_34_45
					end
				end

				arg_31_1.text_.text = var_34_50
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805009", "story_v_side_new_1102805.awb") ~= 0 then
					local var_34_54 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805009", "story_v_side_new_1102805.awb") / 1000

					if var_34_54 + var_34_45 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_54 + var_34_45
					end

					if var_34_49.prefab_name ~= "" and arg_31_1.actors_[var_34_49.prefab_name] ~= nil then
						local var_34_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_49.prefab_name].transform, "story_v_side_new_1102805", "1102805009", "story_v_side_new_1102805.awb")

						arg_31_1:RecordAudio("1102805009", var_34_55)
						arg_31_1:RecordAudio("1102805009", var_34_55)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805009", "story_v_side_new_1102805.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805009", "story_v_side_new_1102805.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_56 = var_34_45 + 0.3
			local var_34_57 = math.max(var_34_46, arg_31_1.talkMaxDuration)

			if var_34_56 <= arg_31_1.time_ and arg_31_1.time_ < var_34_56 + var_34_57 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_56) / var_34_57

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_56 + var_34_57 and arg_31_1.time_ < var_34_56 + var_34_57 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 1102805010
		arg_37_1.duration_ = 8.4

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play1102805011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = "1066ui_story"

			if arg_37_1.actors_[var_40_0] == nil then
				local var_40_1 = Object.Instantiate(Asset.Load("Char/" .. var_40_0), arg_37_1.stage_.transform)

				var_40_1.name = var_40_0
				var_40_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.actors_[var_40_0] = var_40_1

				local var_40_2 = var_40_1:GetComponentInChildren(typeof(CharacterEffect))

				var_40_2.enabled = true

				local var_40_3 = GameObjectTools.GetOrAddComponent(var_40_1, typeof(DynamicBoneHelper))

				if var_40_3 then
					var_40_3:EnableDynamicBone(false)
				end

				arg_37_1:ShowWeapon(var_40_2.transform, false)

				arg_37_1.var_[var_40_0 .. "Animator"] = var_40_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_37_1.var_[var_40_0 .. "Animator"].applyRootMotion = true
				arg_37_1.var_[var_40_0 .. "LipSync"] = var_40_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_40_4 = arg_37_1.actors_["1066ui_story"].transform
			local var_40_5 = 0

			if var_40_5 < arg_37_1.time_ and arg_37_1.time_ <= var_40_5 + arg_40_0 then
				arg_37_1.var_.moveOldPos1066ui_story = var_40_4.localPosition
			end

			local var_40_6 = 0.001

			if var_40_5 <= arg_37_1.time_ and arg_37_1.time_ < var_40_5 + var_40_6 then
				local var_40_7 = (arg_37_1.time_ - var_40_5) / var_40_6
				local var_40_8 = Vector3.New(0, -0.77, -6.1)

				var_40_4.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1066ui_story, var_40_8, var_40_7)

				local var_40_9 = manager.ui.mainCamera.transform.position - var_40_4.position

				var_40_4.forward = Vector3.New(var_40_9.x, var_40_9.y, var_40_9.z)

				local var_40_10 = var_40_4.localEulerAngles

				var_40_10.z = 0
				var_40_10.x = 0
				var_40_4.localEulerAngles = var_40_10
			end

			if arg_37_1.time_ >= var_40_5 + var_40_6 and arg_37_1.time_ < var_40_5 + var_40_6 + arg_40_0 then
				var_40_4.localPosition = Vector3.New(0, -0.77, -6.1)

				local var_40_11 = manager.ui.mainCamera.transform.position - var_40_4.position

				var_40_4.forward = Vector3.New(var_40_11.x, var_40_11.y, var_40_11.z)

				local var_40_12 = var_40_4.localEulerAngles

				var_40_12.z = 0
				var_40_12.x = 0
				var_40_4.localEulerAngles = var_40_12
			end

			local var_40_13 = arg_37_1.actors_["1066ui_story"]
			local var_40_14 = 0

			if var_40_14 < arg_37_1.time_ and arg_37_1.time_ <= var_40_14 + arg_40_0 and arg_37_1.var_.characterEffect1066ui_story == nil then
				arg_37_1.var_.characterEffect1066ui_story = var_40_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_15 = 0.200000002980232

			if var_40_14 <= arg_37_1.time_ and arg_37_1.time_ < var_40_14 + var_40_15 then
				local var_40_16 = (arg_37_1.time_ - var_40_14) / var_40_15

				if arg_37_1.var_.characterEffect1066ui_story then
					arg_37_1.var_.characterEffect1066ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_14 + var_40_15 and arg_37_1.time_ < var_40_14 + var_40_15 + arg_40_0 and arg_37_1.var_.characterEffect1066ui_story then
				arg_37_1.var_.characterEffect1066ui_story.fillFlat = false
			end

			local var_40_17 = 0

			if var_40_17 < arg_37_1.time_ and arg_37_1.time_ <= var_40_17 + arg_40_0 then
				arg_37_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/1066/1066action/1066action3_1")
			end

			local var_40_18 = 0

			if var_40_18 < arg_37_1.time_ and arg_37_1.time_ <= var_40_18 + arg_40_0 then
				arg_37_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_40_19 = arg_37_1.actors_["1028ui_story"].transform
			local var_40_20 = 0

			if var_40_20 < arg_37_1.time_ and arg_37_1.time_ <= var_40_20 + arg_40_0 then
				arg_37_1.var_.moveOldPos1028ui_story = var_40_19.localPosition
			end

			local var_40_21 = 0.001

			if var_40_20 <= arg_37_1.time_ and arg_37_1.time_ < var_40_20 + var_40_21 then
				local var_40_22 = (arg_37_1.time_ - var_40_20) / var_40_21
				local var_40_23 = Vector3.New(0, 100, 0)

				var_40_19.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1028ui_story, var_40_23, var_40_22)

				local var_40_24 = manager.ui.mainCamera.transform.position - var_40_19.position

				var_40_19.forward = Vector3.New(var_40_24.x, var_40_24.y, var_40_24.z)

				local var_40_25 = var_40_19.localEulerAngles

				var_40_25.z = 0
				var_40_25.x = 0
				var_40_19.localEulerAngles = var_40_25
			end

			if arg_37_1.time_ >= var_40_20 + var_40_21 and arg_37_1.time_ < var_40_20 + var_40_21 + arg_40_0 then
				var_40_19.localPosition = Vector3.New(0, 100, 0)

				local var_40_26 = manager.ui.mainCamera.transform.position - var_40_19.position

				var_40_19.forward = Vector3.New(var_40_26.x, var_40_26.y, var_40_26.z)

				local var_40_27 = var_40_19.localEulerAngles

				var_40_27.z = 0
				var_40_27.x = 0
				var_40_19.localEulerAngles = var_40_27
			end

			local var_40_28 = arg_37_1.actors_["1028ui_story"]
			local var_40_29 = 0

			if var_40_29 < arg_37_1.time_ and arg_37_1.time_ <= var_40_29 + arg_40_0 and arg_37_1.var_.characterEffect1028ui_story == nil then
				arg_37_1.var_.characterEffect1028ui_story = var_40_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_30 = 0.200000002980232

			if var_40_29 <= arg_37_1.time_ and arg_37_1.time_ < var_40_29 + var_40_30 then
				local var_40_31 = (arg_37_1.time_ - var_40_29) / var_40_30

				if arg_37_1.var_.characterEffect1028ui_story then
					local var_40_32 = Mathf.Lerp(0, 0.5, var_40_31)

					arg_37_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1028ui_story.fillRatio = var_40_32
				end
			end

			if arg_37_1.time_ >= var_40_29 + var_40_30 and arg_37_1.time_ < var_40_29 + var_40_30 + arg_40_0 and arg_37_1.var_.characterEffect1028ui_story then
				local var_40_33 = 0.5

				arg_37_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1028ui_story.fillRatio = var_40_33
			end

			local var_40_34 = 0
			local var_40_35 = 1.025

			if var_40_34 < arg_37_1.time_ and arg_37_1.time_ <= var_40_34 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_36 = arg_37_1:FormatText(StoryNameCfg[32].name)

				arg_37_1.leftNameTxt_.text = var_40_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_37 = arg_37_1:GetWordFromCfg(1102805010)
				local var_40_38 = arg_37_1:FormatText(var_40_37.content)

				arg_37_1.text_.text = var_40_38

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_39 = 41
				local var_40_40 = utf8.len(var_40_38)
				local var_40_41 = var_40_39 <= 0 and var_40_35 or var_40_35 * (var_40_40 / var_40_39)

				if var_40_41 > 0 and var_40_35 < var_40_41 then
					arg_37_1.talkMaxDuration = var_40_41

					if var_40_41 + var_40_34 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_41 + var_40_34
					end
				end

				arg_37_1.text_.text = var_40_38
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805010", "story_v_side_new_1102805.awb") ~= 0 then
					local var_40_42 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805010", "story_v_side_new_1102805.awb") / 1000

					if var_40_42 + var_40_34 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_42 + var_40_34
					end

					if var_40_37.prefab_name ~= "" and arg_37_1.actors_[var_40_37.prefab_name] ~= nil then
						local var_40_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_37.prefab_name].transform, "story_v_side_new_1102805", "1102805010", "story_v_side_new_1102805.awb")

						arg_37_1:RecordAudio("1102805010", var_40_43)
						arg_37_1:RecordAudio("1102805010", var_40_43)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805010", "story_v_side_new_1102805.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805010", "story_v_side_new_1102805.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_44 = math.max(var_40_35, arg_37_1.talkMaxDuration)

			if var_40_34 <= arg_37_1.time_ and arg_37_1.time_ < var_40_34 + var_40_44 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_34) / var_40_44

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_34 + var_40_44 and arg_37_1.time_ < var_40_34 + var_40_44 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 1102805011
		arg_41_1.duration_ = 2.766

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play1102805012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1028ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos1028ui_story = var_44_0.localPosition
			end

			local var_44_2 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2
				local var_44_4 = Vector3.New(0, -0.9, -5.9)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1028ui_story, var_44_4, var_44_3)

				local var_44_5 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_5.x, var_44_5.y, var_44_5.z)

				local var_44_6 = var_44_0.localEulerAngles

				var_44_6.z = 0
				var_44_6.x = 0
				var_44_0.localEulerAngles = var_44_6
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_44_7 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_7.x, var_44_7.y, var_44_7.z)

				local var_44_8 = var_44_0.localEulerAngles

				var_44_8.z = 0
				var_44_8.x = 0
				var_44_0.localEulerAngles = var_44_8
			end

			local var_44_9 = arg_41_1.actors_["1028ui_story"]
			local var_44_10 = 0

			if var_44_10 < arg_41_1.time_ and arg_41_1.time_ <= var_44_10 + arg_44_0 and arg_41_1.var_.characterEffect1028ui_story == nil then
				arg_41_1.var_.characterEffect1028ui_story = var_44_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_11 = 0.200000002980232

			if var_44_10 <= arg_41_1.time_ and arg_41_1.time_ < var_44_10 + var_44_11 then
				local var_44_12 = (arg_41_1.time_ - var_44_10) / var_44_11

				if arg_41_1.var_.characterEffect1028ui_story then
					arg_41_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_10 + var_44_11 and arg_41_1.time_ < var_44_10 + var_44_11 + arg_44_0 and arg_41_1.var_.characterEffect1028ui_story then
				arg_41_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_44_13 = 0

			if var_44_13 < arg_41_1.time_ and arg_41_1.time_ <= var_44_13 + arg_44_0 then
				arg_41_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action475")
			end

			local var_44_14 = 0

			if var_44_14 < arg_41_1.time_ and arg_41_1.time_ <= var_44_14 + arg_44_0 then
				arg_41_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_44_15 = arg_41_1.actors_["1066ui_story"].transform
			local var_44_16 = 0

			if var_44_16 < arg_41_1.time_ and arg_41_1.time_ <= var_44_16 + arg_44_0 then
				arg_41_1.var_.moveOldPos1066ui_story = var_44_15.localPosition
			end

			local var_44_17 = 0.001

			if var_44_16 <= arg_41_1.time_ and arg_41_1.time_ < var_44_16 + var_44_17 then
				local var_44_18 = (arg_41_1.time_ - var_44_16) / var_44_17
				local var_44_19 = Vector3.New(0, 100, 0)

				var_44_15.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1066ui_story, var_44_19, var_44_18)

				local var_44_20 = manager.ui.mainCamera.transform.position - var_44_15.position

				var_44_15.forward = Vector3.New(var_44_20.x, var_44_20.y, var_44_20.z)

				local var_44_21 = var_44_15.localEulerAngles

				var_44_21.z = 0
				var_44_21.x = 0
				var_44_15.localEulerAngles = var_44_21
			end

			if arg_41_1.time_ >= var_44_16 + var_44_17 and arg_41_1.time_ < var_44_16 + var_44_17 + arg_44_0 then
				var_44_15.localPosition = Vector3.New(0, 100, 0)

				local var_44_22 = manager.ui.mainCamera.transform.position - var_44_15.position

				var_44_15.forward = Vector3.New(var_44_22.x, var_44_22.y, var_44_22.z)

				local var_44_23 = var_44_15.localEulerAngles

				var_44_23.z = 0
				var_44_23.x = 0
				var_44_15.localEulerAngles = var_44_23
			end

			local var_44_24 = arg_41_1.actors_["1066ui_story"]
			local var_44_25 = 0

			if var_44_25 < arg_41_1.time_ and arg_41_1.time_ <= var_44_25 + arg_44_0 and arg_41_1.var_.characterEffect1066ui_story == nil then
				arg_41_1.var_.characterEffect1066ui_story = var_44_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_26 = 0.200000002980232

			if var_44_25 <= arg_41_1.time_ and arg_41_1.time_ < var_44_25 + var_44_26 then
				local var_44_27 = (arg_41_1.time_ - var_44_25) / var_44_26

				if arg_41_1.var_.characterEffect1066ui_story then
					local var_44_28 = Mathf.Lerp(0, 0.5, var_44_27)

					arg_41_1.var_.characterEffect1066ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1066ui_story.fillRatio = var_44_28
				end
			end

			if arg_41_1.time_ >= var_44_25 + var_44_26 and arg_41_1.time_ < var_44_25 + var_44_26 + arg_44_0 and arg_41_1.var_.characterEffect1066ui_story then
				local var_44_29 = 0.5

				arg_41_1.var_.characterEffect1066ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1066ui_story.fillRatio = var_44_29
			end

			local var_44_30 = 0
			local var_44_31 = 0.125

			if var_44_30 < arg_41_1.time_ and arg_41_1.time_ <= var_44_30 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_32 = arg_41_1:FormatText(StoryNameCfg[327].name)

				arg_41_1.leftNameTxt_.text = var_44_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_33 = arg_41_1:GetWordFromCfg(1102805011)
				local var_44_34 = arg_41_1:FormatText(var_44_33.content)

				arg_41_1.text_.text = var_44_34

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_35 = 5
				local var_44_36 = utf8.len(var_44_34)
				local var_44_37 = var_44_35 <= 0 and var_44_31 or var_44_31 * (var_44_36 / var_44_35)

				if var_44_37 > 0 and var_44_31 < var_44_37 then
					arg_41_1.talkMaxDuration = var_44_37

					if var_44_37 + var_44_30 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_37 + var_44_30
					end
				end

				arg_41_1.text_.text = var_44_34
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805011", "story_v_side_new_1102805.awb") ~= 0 then
					local var_44_38 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805011", "story_v_side_new_1102805.awb") / 1000

					if var_44_38 + var_44_30 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_38 + var_44_30
					end

					if var_44_33.prefab_name ~= "" and arg_41_1.actors_[var_44_33.prefab_name] ~= nil then
						local var_44_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_33.prefab_name].transform, "story_v_side_new_1102805", "1102805011", "story_v_side_new_1102805.awb")

						arg_41_1:RecordAudio("1102805011", var_44_39)
						arg_41_1:RecordAudio("1102805011", var_44_39)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805011", "story_v_side_new_1102805.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805011", "story_v_side_new_1102805.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_40 = math.max(var_44_31, arg_41_1.talkMaxDuration)

			if var_44_30 <= arg_41_1.time_ and arg_41_1.time_ < var_44_30 + var_44_40 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_30) / var_44_40

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_30 + var_44_40 and arg_41_1.time_ < var_44_30 + var_44_40 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 1102805012
		arg_45_1.duration_ = 3.066

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play1102805013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1066ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos1066ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(0, -0.77, -6.1)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1066ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, -0.77, -6.1)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = arg_45_1.actors_["1066ui_story"]
			local var_48_10 = 0

			if var_48_10 < arg_45_1.time_ and arg_45_1.time_ <= var_48_10 + arg_48_0 and arg_45_1.var_.characterEffect1066ui_story == nil then
				arg_45_1.var_.characterEffect1066ui_story = var_48_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_11 = 0.200000002980232

			if var_48_10 <= arg_45_1.time_ and arg_45_1.time_ < var_48_10 + var_48_11 then
				local var_48_12 = (arg_45_1.time_ - var_48_10) / var_48_11

				if arg_45_1.var_.characterEffect1066ui_story then
					arg_45_1.var_.characterEffect1066ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_10 + var_48_11 and arg_45_1.time_ < var_48_10 + var_48_11 + arg_48_0 and arg_45_1.var_.characterEffect1066ui_story then
				arg_45_1.var_.characterEffect1066ui_story.fillFlat = false
			end

			local var_48_13 = 0

			if var_48_13 < arg_45_1.time_ and arg_45_1.time_ <= var_48_13 + arg_48_0 then
				arg_45_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/1066/1066action/1066action4_1")
			end

			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 then
				arg_45_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_48_15 = arg_45_1.actors_["1028ui_story"].transform
			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 then
				arg_45_1.var_.moveOldPos1028ui_story = var_48_15.localPosition
			end

			local var_48_17 = 0.001

			if var_48_16 <= arg_45_1.time_ and arg_45_1.time_ < var_48_16 + var_48_17 then
				local var_48_18 = (arg_45_1.time_ - var_48_16) / var_48_17
				local var_48_19 = Vector3.New(0, 100, 0)

				var_48_15.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1028ui_story, var_48_19, var_48_18)

				local var_48_20 = manager.ui.mainCamera.transform.position - var_48_15.position

				var_48_15.forward = Vector3.New(var_48_20.x, var_48_20.y, var_48_20.z)

				local var_48_21 = var_48_15.localEulerAngles

				var_48_21.z = 0
				var_48_21.x = 0
				var_48_15.localEulerAngles = var_48_21
			end

			if arg_45_1.time_ >= var_48_16 + var_48_17 and arg_45_1.time_ < var_48_16 + var_48_17 + arg_48_0 then
				var_48_15.localPosition = Vector3.New(0, 100, 0)

				local var_48_22 = manager.ui.mainCamera.transform.position - var_48_15.position

				var_48_15.forward = Vector3.New(var_48_22.x, var_48_22.y, var_48_22.z)

				local var_48_23 = var_48_15.localEulerAngles

				var_48_23.z = 0
				var_48_23.x = 0
				var_48_15.localEulerAngles = var_48_23
			end

			local var_48_24 = arg_45_1.actors_["1028ui_story"]
			local var_48_25 = 0

			if var_48_25 < arg_45_1.time_ and arg_45_1.time_ <= var_48_25 + arg_48_0 and arg_45_1.var_.characterEffect1028ui_story == nil then
				arg_45_1.var_.characterEffect1028ui_story = var_48_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_26 = 0.200000002980232

			if var_48_25 <= arg_45_1.time_ and arg_45_1.time_ < var_48_25 + var_48_26 then
				local var_48_27 = (arg_45_1.time_ - var_48_25) / var_48_26

				if arg_45_1.var_.characterEffect1028ui_story then
					local var_48_28 = Mathf.Lerp(0, 0.5, var_48_27)

					arg_45_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1028ui_story.fillRatio = var_48_28
				end
			end

			if arg_45_1.time_ >= var_48_25 + var_48_26 and arg_45_1.time_ < var_48_25 + var_48_26 + arg_48_0 and arg_45_1.var_.characterEffect1028ui_story then
				local var_48_29 = 0.5

				arg_45_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1028ui_story.fillRatio = var_48_29
			end

			local var_48_30 = 0
			local var_48_31 = 0.325

			if var_48_30 < arg_45_1.time_ and arg_45_1.time_ <= var_48_30 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_32 = arg_45_1:FormatText(StoryNameCfg[32].name)

				arg_45_1.leftNameTxt_.text = var_48_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_33 = arg_45_1:GetWordFromCfg(1102805012)
				local var_48_34 = arg_45_1:FormatText(var_48_33.content)

				arg_45_1.text_.text = var_48_34

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_35 = 13
				local var_48_36 = utf8.len(var_48_34)
				local var_48_37 = var_48_35 <= 0 and var_48_31 or var_48_31 * (var_48_36 / var_48_35)

				if var_48_37 > 0 and var_48_31 < var_48_37 then
					arg_45_1.talkMaxDuration = var_48_37

					if var_48_37 + var_48_30 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_37 + var_48_30
					end
				end

				arg_45_1.text_.text = var_48_34
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805012", "story_v_side_new_1102805.awb") ~= 0 then
					local var_48_38 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805012", "story_v_side_new_1102805.awb") / 1000

					if var_48_38 + var_48_30 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_38 + var_48_30
					end

					if var_48_33.prefab_name ~= "" and arg_45_1.actors_[var_48_33.prefab_name] ~= nil then
						local var_48_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_33.prefab_name].transform, "story_v_side_new_1102805", "1102805012", "story_v_side_new_1102805.awb")

						arg_45_1:RecordAudio("1102805012", var_48_39)
						arg_45_1:RecordAudio("1102805012", var_48_39)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805012", "story_v_side_new_1102805.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805012", "story_v_side_new_1102805.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_40 = math.max(var_48_31, arg_45_1.talkMaxDuration)

			if var_48_30 <= arg_45_1.time_ and arg_45_1.time_ < var_48_30 + var_48_40 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_30) / var_48_40

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_30 + var_48_40 and arg_45_1.time_ < var_48_30 + var_48_40 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805013 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 1102805013
		arg_49_1.duration_ = 5.1

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play1102805014(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1028ui_story"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1028ui_story = var_52_0.localPosition
			end

			local var_52_2 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2
				local var_52_4 = Vector3.New(0, -0.9, -5.9)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1028ui_story, var_52_4, var_52_3)

				local var_52_5 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_5.x, var_52_5.y, var_52_5.z)

				local var_52_6 = var_52_0.localEulerAngles

				var_52_6.z = 0
				var_52_6.x = 0
				var_52_0.localEulerAngles = var_52_6
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_52_7 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_7.x, var_52_7.y, var_52_7.z)

				local var_52_8 = var_52_0.localEulerAngles

				var_52_8.z = 0
				var_52_8.x = 0
				var_52_0.localEulerAngles = var_52_8
			end

			local var_52_9 = arg_49_1.actors_["1028ui_story"]
			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 and arg_49_1.var_.characterEffect1028ui_story == nil then
				arg_49_1.var_.characterEffect1028ui_story = var_52_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_11 = 0.200000002980232

			if var_52_10 <= arg_49_1.time_ and arg_49_1.time_ < var_52_10 + var_52_11 then
				local var_52_12 = (arg_49_1.time_ - var_52_10) / var_52_11

				if arg_49_1.var_.characterEffect1028ui_story then
					arg_49_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_10 + var_52_11 and arg_49_1.time_ < var_52_10 + var_52_11 + arg_52_0 and arg_49_1.var_.characterEffect1028ui_story then
				arg_49_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_52_13 = 0

			if var_52_13 < arg_49_1.time_ and arg_49_1.time_ <= var_52_13 + arg_52_0 then
				arg_49_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action456")
			end

			local var_52_14 = 0

			if var_52_14 < arg_49_1.time_ and arg_49_1.time_ <= var_52_14 + arg_52_0 then
				arg_49_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_52_15 = arg_49_1.actors_["1066ui_story"].transform
			local var_52_16 = 0

			if var_52_16 < arg_49_1.time_ and arg_49_1.time_ <= var_52_16 + arg_52_0 then
				arg_49_1.var_.moveOldPos1066ui_story = var_52_15.localPosition
			end

			local var_52_17 = 0.001

			if var_52_16 <= arg_49_1.time_ and arg_49_1.time_ < var_52_16 + var_52_17 then
				local var_52_18 = (arg_49_1.time_ - var_52_16) / var_52_17
				local var_52_19 = Vector3.New(0, 100, 0)

				var_52_15.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1066ui_story, var_52_19, var_52_18)

				local var_52_20 = manager.ui.mainCamera.transform.position - var_52_15.position

				var_52_15.forward = Vector3.New(var_52_20.x, var_52_20.y, var_52_20.z)

				local var_52_21 = var_52_15.localEulerAngles

				var_52_21.z = 0
				var_52_21.x = 0
				var_52_15.localEulerAngles = var_52_21
			end

			if arg_49_1.time_ >= var_52_16 + var_52_17 and arg_49_1.time_ < var_52_16 + var_52_17 + arg_52_0 then
				var_52_15.localPosition = Vector3.New(0, 100, 0)

				local var_52_22 = manager.ui.mainCamera.transform.position - var_52_15.position

				var_52_15.forward = Vector3.New(var_52_22.x, var_52_22.y, var_52_22.z)

				local var_52_23 = var_52_15.localEulerAngles

				var_52_23.z = 0
				var_52_23.x = 0
				var_52_15.localEulerAngles = var_52_23
			end

			local var_52_24 = arg_49_1.actors_["1066ui_story"]
			local var_52_25 = 0

			if var_52_25 < arg_49_1.time_ and arg_49_1.time_ <= var_52_25 + arg_52_0 and arg_49_1.var_.characterEffect1066ui_story == nil then
				arg_49_1.var_.characterEffect1066ui_story = var_52_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_26 = 0.200000002980232

			if var_52_25 <= arg_49_1.time_ and arg_49_1.time_ < var_52_25 + var_52_26 then
				local var_52_27 = (arg_49_1.time_ - var_52_25) / var_52_26

				if arg_49_1.var_.characterEffect1066ui_story then
					local var_52_28 = Mathf.Lerp(0, 0.5, var_52_27)

					arg_49_1.var_.characterEffect1066ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1066ui_story.fillRatio = var_52_28
				end
			end

			if arg_49_1.time_ >= var_52_25 + var_52_26 and arg_49_1.time_ < var_52_25 + var_52_26 + arg_52_0 and arg_49_1.var_.characterEffect1066ui_story then
				local var_52_29 = 0.5

				arg_49_1.var_.characterEffect1066ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1066ui_story.fillRatio = var_52_29
			end

			local var_52_30 = 0
			local var_52_31 = 0.6

			if var_52_30 < arg_49_1.time_ and arg_49_1.time_ <= var_52_30 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_32 = arg_49_1:FormatText(StoryNameCfg[327].name)

				arg_49_1.leftNameTxt_.text = var_52_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_33 = arg_49_1:GetWordFromCfg(1102805013)
				local var_52_34 = arg_49_1:FormatText(var_52_33.content)

				arg_49_1.text_.text = var_52_34

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_35 = 24
				local var_52_36 = utf8.len(var_52_34)
				local var_52_37 = var_52_35 <= 0 and var_52_31 or var_52_31 * (var_52_36 / var_52_35)

				if var_52_37 > 0 and var_52_31 < var_52_37 then
					arg_49_1.talkMaxDuration = var_52_37

					if var_52_37 + var_52_30 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_37 + var_52_30
					end
				end

				arg_49_1.text_.text = var_52_34
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805013", "story_v_side_new_1102805.awb") ~= 0 then
					local var_52_38 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805013", "story_v_side_new_1102805.awb") / 1000

					if var_52_38 + var_52_30 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_38 + var_52_30
					end

					if var_52_33.prefab_name ~= "" and arg_49_1.actors_[var_52_33.prefab_name] ~= nil then
						local var_52_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_33.prefab_name].transform, "story_v_side_new_1102805", "1102805013", "story_v_side_new_1102805.awb")

						arg_49_1:RecordAudio("1102805013", var_52_39)
						arg_49_1:RecordAudio("1102805013", var_52_39)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805013", "story_v_side_new_1102805.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805013", "story_v_side_new_1102805.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_40 = math.max(var_52_31, arg_49_1.talkMaxDuration)

			if var_52_30 <= arg_49_1.time_ and arg_49_1.time_ < var_52_30 + var_52_40 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_30) / var_52_40

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_30 + var_52_40 and arg_49_1.time_ < var_52_30 + var_52_40 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805014 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 1102805014
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play1102805015(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1028ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect1028ui_story == nil then
				arg_53_1.var_.characterEffect1028ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.200000002980232

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect1028ui_story then
					local var_56_4 = Mathf.Lerp(0, 0.5, var_56_3)

					arg_53_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1028ui_story.fillRatio = var_56_4
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect1028ui_story then
				local var_56_5 = 0.5

				arg_53_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1028ui_story.fillRatio = var_56_5
			end

			local var_56_6 = 0
			local var_56_7 = 1.675

			if var_56_6 < arg_53_1.time_ and arg_53_1.time_ <= var_56_6 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_8 = arg_53_1:GetWordFromCfg(1102805014)
				local var_56_9 = arg_53_1:FormatText(var_56_8.content)

				arg_53_1.text_.text = var_56_9

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_10 = 67
				local var_56_11 = utf8.len(var_56_9)
				local var_56_12 = var_56_10 <= 0 and var_56_7 or var_56_7 * (var_56_11 / var_56_10)

				if var_56_12 > 0 and var_56_7 < var_56_12 then
					arg_53_1.talkMaxDuration = var_56_12

					if var_56_12 + var_56_6 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_12 + var_56_6
					end
				end

				arg_53_1.text_.text = var_56_9
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_13 = math.max(var_56_7, arg_53_1.talkMaxDuration)

			if var_56_6 <= arg_53_1.time_ and arg_53_1.time_ < var_56_6 + var_56_13 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_6) / var_56_13

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_6 + var_56_13 and arg_53_1.time_ < var_56_6 + var_56_13 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805015 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 1102805015
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play1102805016(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 1.1

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_2 = arg_57_1:GetWordFromCfg(1102805015)
				local var_60_3 = arg_57_1:FormatText(var_60_2.content)

				arg_57_1.text_.text = var_60_3

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_4 = 44
				local var_60_5 = utf8.len(var_60_3)
				local var_60_6 = var_60_4 <= 0 and var_60_1 or var_60_1 * (var_60_5 / var_60_4)

				if var_60_6 > 0 and var_60_1 < var_60_6 then
					arg_57_1.talkMaxDuration = var_60_6

					if var_60_6 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_6 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_3
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_7 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_7 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_7

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_7 and arg_57_1.time_ < var_60_0 + var_60_7 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805016 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 1102805016
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play1102805017(arg_61_1)
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

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[7].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(1102805016)
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
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_8 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_8 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_8

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_8 and arg_61_1.time_ < var_64_0 + var_64_8 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805017 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 1102805017
		arg_65_1.duration_ = 4.9

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play1102805018(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1028ui_story"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos1028ui_story = var_68_0.localPosition
			end

			local var_68_2 = 0.001

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2
				local var_68_4 = Vector3.New(0, -0.9, -5.9)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1028ui_story, var_68_4, var_68_3)

				local var_68_5 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_5.x, var_68_5.y, var_68_5.z)

				local var_68_6 = var_68_0.localEulerAngles

				var_68_6.z = 0
				var_68_6.x = 0
				var_68_0.localEulerAngles = var_68_6
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_68_7 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_7.x, var_68_7.y, var_68_7.z)

				local var_68_8 = var_68_0.localEulerAngles

				var_68_8.z = 0
				var_68_8.x = 0
				var_68_0.localEulerAngles = var_68_8
			end

			local var_68_9 = arg_65_1.actors_["1028ui_story"]
			local var_68_10 = 0

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 and arg_65_1.var_.characterEffect1028ui_story == nil then
				arg_65_1.var_.characterEffect1028ui_story = var_68_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_11 = 0.200000002980232

			if var_68_10 <= arg_65_1.time_ and arg_65_1.time_ < var_68_10 + var_68_11 then
				local var_68_12 = (arg_65_1.time_ - var_68_10) / var_68_11

				if arg_65_1.var_.characterEffect1028ui_story then
					arg_65_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_10 + var_68_11 and arg_65_1.time_ < var_68_10 + var_68_11 + arg_68_0 and arg_65_1.var_.characterEffect1028ui_story then
				arg_65_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_68_13 = 0

			if var_68_13 < arg_65_1.time_ and arg_65_1.time_ <= var_68_13 + arg_68_0 then
				arg_65_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action467")
			end

			local var_68_14 = 0

			if var_68_14 < arg_65_1.time_ and arg_65_1.time_ <= var_68_14 + arg_68_0 then
				arg_65_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_68_15 = 0
			local var_68_16 = 0.725

			if var_68_15 < arg_65_1.time_ and arg_65_1.time_ <= var_68_15 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_17 = arg_65_1:FormatText(StoryNameCfg[327].name)

				arg_65_1.leftNameTxt_.text = var_68_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_18 = arg_65_1:GetWordFromCfg(1102805017)
				local var_68_19 = arg_65_1:FormatText(var_68_18.content)

				arg_65_1.text_.text = var_68_19

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_20 = 29
				local var_68_21 = utf8.len(var_68_19)
				local var_68_22 = var_68_20 <= 0 and var_68_16 or var_68_16 * (var_68_21 / var_68_20)

				if var_68_22 > 0 and var_68_16 < var_68_22 then
					arg_65_1.talkMaxDuration = var_68_22

					if var_68_22 + var_68_15 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_22 + var_68_15
					end
				end

				arg_65_1.text_.text = var_68_19
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805017", "story_v_side_new_1102805.awb") ~= 0 then
					local var_68_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805017", "story_v_side_new_1102805.awb") / 1000

					if var_68_23 + var_68_15 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_23 + var_68_15
					end

					if var_68_18.prefab_name ~= "" and arg_65_1.actors_[var_68_18.prefab_name] ~= nil then
						local var_68_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_18.prefab_name].transform, "story_v_side_new_1102805", "1102805017", "story_v_side_new_1102805.awb")

						arg_65_1:RecordAudio("1102805017", var_68_24)
						arg_65_1:RecordAudio("1102805017", var_68_24)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805017", "story_v_side_new_1102805.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805017", "story_v_side_new_1102805.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_25 = math.max(var_68_16, arg_65_1.talkMaxDuration)

			if var_68_15 <= arg_65_1.time_ and arg_65_1.time_ < var_68_15 + var_68_25 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_15) / var_68_25

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_15 + var_68_25 and arg_65_1.time_ < var_68_15 + var_68_25 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805018 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 1102805018
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play1102805019(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1028ui_story"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1028ui_story = var_72_0.localPosition
			end

			local var_72_2 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2
				local var_72_4 = Vector3.New(0, 100, 0)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1028ui_story, var_72_4, var_72_3)

				local var_72_5 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_5.x, var_72_5.y, var_72_5.z)

				local var_72_6 = var_72_0.localEulerAngles

				var_72_6.z = 0
				var_72_6.x = 0
				var_72_0.localEulerAngles = var_72_6
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(0, 100, 0)

				local var_72_7 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_7.x, var_72_7.y, var_72_7.z)

				local var_72_8 = var_72_0.localEulerAngles

				var_72_8.z = 0
				var_72_8.x = 0
				var_72_0.localEulerAngles = var_72_8
			end

			local var_72_9 = arg_69_1.actors_["1028ui_story"]
			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 and arg_69_1.var_.characterEffect1028ui_story == nil then
				arg_69_1.var_.characterEffect1028ui_story = var_72_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_11 = 0.200000002980232

			if var_72_10 <= arg_69_1.time_ and arg_69_1.time_ < var_72_10 + var_72_11 then
				local var_72_12 = (arg_69_1.time_ - var_72_10) / var_72_11

				if arg_69_1.var_.characterEffect1028ui_story then
					local var_72_13 = Mathf.Lerp(0, 0.5, var_72_12)

					arg_69_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1028ui_story.fillRatio = var_72_13
				end
			end

			if arg_69_1.time_ >= var_72_10 + var_72_11 and arg_69_1.time_ < var_72_10 + var_72_11 + arg_72_0 and arg_69_1.var_.characterEffect1028ui_story then
				local var_72_14 = 0.5

				arg_69_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1028ui_story.fillRatio = var_72_14
			end

			local var_72_15 = 0
			local var_72_16 = 1.025

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_17 = arg_69_1:GetWordFromCfg(1102805018)
				local var_72_18 = arg_69_1:FormatText(var_72_17.content)

				arg_69_1.text_.text = var_72_18

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_19 = 41
				local var_72_20 = utf8.len(var_72_18)
				local var_72_21 = var_72_19 <= 0 and var_72_16 or var_72_16 * (var_72_20 / var_72_19)

				if var_72_21 > 0 and var_72_16 < var_72_21 then
					arg_69_1.talkMaxDuration = var_72_21

					if var_72_21 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_21 + var_72_15
					end
				end

				arg_69_1.text_.text = var_72_18
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_22 = math.max(var_72_16, arg_69_1.talkMaxDuration)

			if var_72_15 <= arg_69_1.time_ and arg_69_1.time_ < var_72_15 + var_72_22 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_15) / var_72_22

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_15 + var_72_22 and arg_69_1.time_ < var_72_15 + var_72_22 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805019 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 1102805019
		arg_73_1.duration_ = 6.3

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play1102805020(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1066ui_story"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos1066ui_story = var_76_0.localPosition
			end

			local var_76_2 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2
				local var_76_4 = Vector3.New(0, -0.77, -6.1)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1066ui_story, var_76_4, var_76_3)

				local var_76_5 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_5.x, var_76_5.y, var_76_5.z)

				local var_76_6 = var_76_0.localEulerAngles

				var_76_6.z = 0
				var_76_6.x = 0
				var_76_0.localEulerAngles = var_76_6
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0, -0.77, -6.1)

				local var_76_7 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_7.x, var_76_7.y, var_76_7.z)

				local var_76_8 = var_76_0.localEulerAngles

				var_76_8.z = 0
				var_76_8.x = 0
				var_76_0.localEulerAngles = var_76_8
			end

			local var_76_9 = arg_73_1.actors_["1066ui_story"]
			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 and arg_73_1.var_.characterEffect1066ui_story == nil then
				arg_73_1.var_.characterEffect1066ui_story = var_76_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_11 = 0.200000002980232

			if var_76_10 <= arg_73_1.time_ and arg_73_1.time_ < var_76_10 + var_76_11 then
				local var_76_12 = (arg_73_1.time_ - var_76_10) / var_76_11

				if arg_73_1.var_.characterEffect1066ui_story then
					arg_73_1.var_.characterEffect1066ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_10 + var_76_11 and arg_73_1.time_ < var_76_10 + var_76_11 + arg_76_0 and arg_73_1.var_.characterEffect1066ui_story then
				arg_73_1.var_.characterEffect1066ui_story.fillFlat = false
			end

			local var_76_13 = 0

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/1066/1066action/1066action3_1")
			end

			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 then
				arg_73_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_76_15 = 0
			local var_76_16 = 0.9

			if var_76_15 < arg_73_1.time_ and arg_73_1.time_ <= var_76_15 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_17 = arg_73_1:FormatText(StoryNameCfg[32].name)

				arg_73_1.leftNameTxt_.text = var_76_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_18 = arg_73_1:GetWordFromCfg(1102805019)
				local var_76_19 = arg_73_1:FormatText(var_76_18.content)

				arg_73_1.text_.text = var_76_19

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_20 = 36
				local var_76_21 = utf8.len(var_76_19)
				local var_76_22 = var_76_20 <= 0 and var_76_16 or var_76_16 * (var_76_21 / var_76_20)

				if var_76_22 > 0 and var_76_16 < var_76_22 then
					arg_73_1.talkMaxDuration = var_76_22

					if var_76_22 + var_76_15 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_22 + var_76_15
					end
				end

				arg_73_1.text_.text = var_76_19
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805019", "story_v_side_new_1102805.awb") ~= 0 then
					local var_76_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805019", "story_v_side_new_1102805.awb") / 1000

					if var_76_23 + var_76_15 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_23 + var_76_15
					end

					if var_76_18.prefab_name ~= "" and arg_73_1.actors_[var_76_18.prefab_name] ~= nil then
						local var_76_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_18.prefab_name].transform, "story_v_side_new_1102805", "1102805019", "story_v_side_new_1102805.awb")

						arg_73_1:RecordAudio("1102805019", var_76_24)
						arg_73_1:RecordAudio("1102805019", var_76_24)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805019", "story_v_side_new_1102805.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805019", "story_v_side_new_1102805.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_25 = math.max(var_76_16, arg_73_1.talkMaxDuration)

			if var_76_15 <= arg_73_1.time_ and arg_73_1.time_ < var_76_15 + var_76_25 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_15) / var_76_25

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_15 + var_76_25 and arg_73_1.time_ < var_76_15 + var_76_25 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805020 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 1102805020
		arg_77_1.duration_ = 6

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play1102805021(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1066ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos1066ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(0, -0.77, -6.1)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1066ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, -0.77, -6.1)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = 0

			if var_80_9 < arg_77_1.time_ and arg_77_1.time_ <= var_80_9 + arg_80_0 then
				arg_77_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_80_10 = 0
			local var_80_11 = 0.8

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_12 = arg_77_1:FormatText(StoryNameCfg[32].name)

				arg_77_1.leftNameTxt_.text = var_80_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_13 = arg_77_1:GetWordFromCfg(1102805020)
				local var_80_14 = arg_77_1:FormatText(var_80_13.content)

				arg_77_1.text_.text = var_80_14

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_15 = 32
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805020", "story_v_side_new_1102805.awb") ~= 0 then
					local var_80_18 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805020", "story_v_side_new_1102805.awb") / 1000

					if var_80_18 + var_80_10 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_18 + var_80_10
					end

					if var_80_13.prefab_name ~= "" and arg_77_1.actors_[var_80_13.prefab_name] ~= nil then
						local var_80_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_13.prefab_name].transform, "story_v_side_new_1102805", "1102805020", "story_v_side_new_1102805.awb")

						arg_77_1:RecordAudio("1102805020", var_80_19)
						arg_77_1:RecordAudio("1102805020", var_80_19)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805020", "story_v_side_new_1102805.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805020", "story_v_side_new_1102805.awb")
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
	Play1102805021 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 1102805021
		arg_81_1.duration_ = 11.666

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play1102805022(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_84_1 = 0
			local var_84_2 = 1.45

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_3 = arg_81_1:FormatText(StoryNameCfg[32].name)

				arg_81_1.leftNameTxt_.text = var_84_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_4 = arg_81_1:GetWordFromCfg(1102805021)
				local var_84_5 = arg_81_1:FormatText(var_84_4.content)

				arg_81_1.text_.text = var_84_5

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_6 = 58
				local var_84_7 = utf8.len(var_84_5)
				local var_84_8 = var_84_6 <= 0 and var_84_2 or var_84_2 * (var_84_7 / var_84_6)

				if var_84_8 > 0 and var_84_2 < var_84_8 then
					arg_81_1.talkMaxDuration = var_84_8

					if var_84_8 + var_84_1 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_1
					end
				end

				arg_81_1.text_.text = var_84_5
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805021", "story_v_side_new_1102805.awb") ~= 0 then
					local var_84_9 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805021", "story_v_side_new_1102805.awb") / 1000

					if var_84_9 + var_84_1 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_9 + var_84_1
					end

					if var_84_4.prefab_name ~= "" and arg_81_1.actors_[var_84_4.prefab_name] ~= nil then
						local var_84_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_4.prefab_name].transform, "story_v_side_new_1102805", "1102805021", "story_v_side_new_1102805.awb")

						arg_81_1:RecordAudio("1102805021", var_84_10)
						arg_81_1:RecordAudio("1102805021", var_84_10)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805021", "story_v_side_new_1102805.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805021", "story_v_side_new_1102805.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_11 = math.max(var_84_2, arg_81_1.talkMaxDuration)

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_11 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_1) / var_84_11

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_1 + var_84_11 and arg_81_1.time_ < var_84_1 + var_84_11 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805022 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 1102805022
		arg_85_1.duration_ = 3.9

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play1102805023(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/1066/1066action/1066action3_2")
			end

			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1:PlayTimeline("1066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_88_2 = 0
			local var_88_3 = 0.55

			if var_88_2 < arg_85_1.time_ and arg_85_1.time_ <= var_88_2 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_4 = arg_85_1:FormatText(StoryNameCfg[32].name)

				arg_85_1.leftNameTxt_.text = var_88_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_5 = arg_85_1:GetWordFromCfg(1102805022)
				local var_88_6 = arg_85_1:FormatText(var_88_5.content)

				arg_85_1.text_.text = var_88_6

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_7 = 22
				local var_88_8 = utf8.len(var_88_6)
				local var_88_9 = var_88_7 <= 0 and var_88_3 or var_88_3 * (var_88_8 / var_88_7)

				if var_88_9 > 0 and var_88_3 < var_88_9 then
					arg_85_1.talkMaxDuration = var_88_9

					if var_88_9 + var_88_2 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_9 + var_88_2
					end
				end

				arg_85_1.text_.text = var_88_6
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805022", "story_v_side_new_1102805.awb") ~= 0 then
					local var_88_10 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805022", "story_v_side_new_1102805.awb") / 1000

					if var_88_10 + var_88_2 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_10 + var_88_2
					end

					if var_88_5.prefab_name ~= "" and arg_85_1.actors_[var_88_5.prefab_name] ~= nil then
						local var_88_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_5.prefab_name].transform, "story_v_side_new_1102805", "1102805022", "story_v_side_new_1102805.awb")

						arg_85_1:RecordAudio("1102805022", var_88_11)
						arg_85_1:RecordAudio("1102805022", var_88_11)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805022", "story_v_side_new_1102805.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805022", "story_v_side_new_1102805.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_12 = math.max(var_88_3, arg_85_1.talkMaxDuration)

			if var_88_2 <= arg_85_1.time_ and arg_85_1.time_ < var_88_2 + var_88_12 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_2) / var_88_12

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_2 + var_88_12 and arg_85_1.time_ < var_88_2 + var_88_12 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805023 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 1102805023
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play1102805024(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1066ui_story"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos1066ui_story = var_92_0.localPosition
			end

			local var_92_2 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2
				local var_92_4 = Vector3.New(0, 100, 0)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1066ui_story, var_92_4, var_92_3)

				local var_92_5 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_5.x, var_92_5.y, var_92_5.z)

				local var_92_6 = var_92_0.localEulerAngles

				var_92_6.z = 0
				var_92_6.x = 0
				var_92_0.localEulerAngles = var_92_6
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(0, 100, 0)

				local var_92_7 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_7.x, var_92_7.y, var_92_7.z)

				local var_92_8 = var_92_0.localEulerAngles

				var_92_8.z = 0
				var_92_8.x = 0
				var_92_0.localEulerAngles = var_92_8
			end

			local var_92_9 = 0
			local var_92_10 = 0.55

			if var_92_9 < arg_89_1.time_ and arg_89_1.time_ <= var_92_9 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_11 = arg_89_1:GetWordFromCfg(1102805023)
				local var_92_12 = arg_89_1:FormatText(var_92_11.content)

				arg_89_1.text_.text = var_92_12

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_13 = 22
				local var_92_14 = utf8.len(var_92_12)
				local var_92_15 = var_92_13 <= 0 and var_92_10 or var_92_10 * (var_92_14 / var_92_13)

				if var_92_15 > 0 and var_92_10 < var_92_15 then
					arg_89_1.talkMaxDuration = var_92_15

					if var_92_15 + var_92_9 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_15 + var_92_9
					end
				end

				arg_89_1.text_.text = var_92_12
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_16 = math.max(var_92_10, arg_89_1.talkMaxDuration)

			if var_92_9 <= arg_89_1.time_ and arg_89_1.time_ < var_92_9 + var_92_16 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_9) / var_92_16

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_9 + var_92_16 and arg_89_1.time_ < var_92_9 + var_92_16 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805024 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 1102805024
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play1102805025(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.325

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[7].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(1102805024)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 13
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
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_8 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_8 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_8

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_8 and arg_93_1.time_ < var_96_0 + var_96_8 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805025 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 1102805025
		arg_97_1.duration_ = 8.333

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play1102805026(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1028ui_story"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos1028ui_story = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(0, -0.9, -5.9)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1028ui_story, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = arg_97_1.actors_["1028ui_story"]
			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 and arg_97_1.var_.characterEffect1028ui_story == nil then
				arg_97_1.var_.characterEffect1028ui_story = var_100_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_11 = 0.200000002980232

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_11 then
				local var_100_12 = (arg_97_1.time_ - var_100_10) / var_100_11

				if arg_97_1.var_.characterEffect1028ui_story then
					arg_97_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_10 + var_100_11 and arg_97_1.time_ < var_100_10 + var_100_11 + arg_100_0 and arg_97_1.var_.characterEffect1028ui_story then
				arg_97_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_100_13 = 0

			if var_100_13 < arg_97_1.time_ and arg_97_1.time_ <= var_100_13 + arg_100_0 then
				arg_97_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_100_15 = 0
			local var_100_16 = 0.95

			if var_100_15 < arg_97_1.time_ and arg_97_1.time_ <= var_100_15 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_17 = arg_97_1:FormatText(StoryNameCfg[327].name)

				arg_97_1.leftNameTxt_.text = var_100_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_18 = arg_97_1:GetWordFromCfg(1102805025)
				local var_100_19 = arg_97_1:FormatText(var_100_18.content)

				arg_97_1.text_.text = var_100_19

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_20 = 38
				local var_100_21 = utf8.len(var_100_19)
				local var_100_22 = var_100_20 <= 0 and var_100_16 or var_100_16 * (var_100_21 / var_100_20)

				if var_100_22 > 0 and var_100_16 < var_100_22 then
					arg_97_1.talkMaxDuration = var_100_22

					if var_100_22 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_22 + var_100_15
					end
				end

				arg_97_1.text_.text = var_100_19
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805025", "story_v_side_new_1102805.awb") ~= 0 then
					local var_100_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805025", "story_v_side_new_1102805.awb") / 1000

					if var_100_23 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_23 + var_100_15
					end

					if var_100_18.prefab_name ~= "" and arg_97_1.actors_[var_100_18.prefab_name] ~= nil then
						local var_100_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_18.prefab_name].transform, "story_v_side_new_1102805", "1102805025", "story_v_side_new_1102805.awb")

						arg_97_1:RecordAudio("1102805025", var_100_24)
						arg_97_1:RecordAudio("1102805025", var_100_24)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805025", "story_v_side_new_1102805.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805025", "story_v_side_new_1102805.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_25 = math.max(var_100_16, arg_97_1.talkMaxDuration)

			if var_100_15 <= arg_97_1.time_ and arg_97_1.time_ < var_100_15 + var_100_25 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_15) / var_100_25

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_15 + var_100_25 and arg_97_1.time_ < var_100_15 + var_100_25 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805026 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 1102805026
		arg_101_1.duration_ = 2.266

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play1102805027(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.3

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[327].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(1102805026)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805026", "story_v_side_new_1102805.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805026", "story_v_side_new_1102805.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_side_new_1102805", "1102805026", "story_v_side_new_1102805.awb")

						arg_101_1:RecordAudio("1102805026", var_104_9)
						arg_101_1:RecordAudio("1102805026", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805026", "story_v_side_new_1102805.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805026", "story_v_side_new_1102805.awb")
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
	Play1102805027 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 1102805027
		arg_105_1.duration_ = 2.833

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play1102805028(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1028ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1028ui_story == nil then
				arg_105_1.var_.characterEffect1028ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1028ui_story then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1028ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1028ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1028ui_story.fillRatio = var_108_5
			end

			local var_108_6 = 0
			local var_108_7 = 0.275

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_8 = arg_105_1:FormatText(StoryNameCfg[10].name)

				arg_105_1.leftNameTxt_.text = var_108_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, true)
				arg_105_1.iconController_:SetSelectedState("hero")

				arg_105_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_9 = arg_105_1:GetWordFromCfg(1102805027)
				local var_108_10 = arg_105_1:FormatText(var_108_9.content)

				arg_105_1.text_.text = var_108_10

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_11 = 11
				local var_108_12 = utf8.len(var_108_10)
				local var_108_13 = var_108_11 <= 0 and var_108_7 or var_108_7 * (var_108_12 / var_108_11)

				if var_108_13 > 0 and var_108_7 < var_108_13 then
					arg_105_1.talkMaxDuration = var_108_13

					if var_108_13 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_13 + var_108_6
					end
				end

				arg_105_1.text_.text = var_108_10
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805027", "story_v_side_new_1102805.awb") ~= 0 then
					local var_108_14 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805027", "story_v_side_new_1102805.awb") / 1000

					if var_108_14 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_14 + var_108_6
					end

					if var_108_9.prefab_name ~= "" and arg_105_1.actors_[var_108_9.prefab_name] ~= nil then
						local var_108_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_9.prefab_name].transform, "story_v_side_new_1102805", "1102805027", "story_v_side_new_1102805.awb")

						arg_105_1:RecordAudio("1102805027", var_108_15)
						arg_105_1:RecordAudio("1102805027", var_108_15)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805027", "story_v_side_new_1102805.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805027", "story_v_side_new_1102805.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_16 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_16 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_16

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_16 and arg_105_1.time_ < var_108_6 + var_108_16 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805028 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 1102805028
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play1102805029(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.3

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[7].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(1102805028)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 12
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
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_8 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_8 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_8

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_8 and arg_109_1.time_ < var_112_0 + var_112_8 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805029 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 1102805029
		arg_113_1.duration_ = 7.466

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play1102805030(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.75

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[10].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, true)
				arg_113_1.iconController_:SetSelectedState("hero")

				arg_113_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(1102805029)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805029", "story_v_side_new_1102805.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805029", "story_v_side_new_1102805.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_side_new_1102805", "1102805029", "story_v_side_new_1102805.awb")

						arg_113_1:RecordAudio("1102805029", var_116_9)
						arg_113_1:RecordAudio("1102805029", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805029", "story_v_side_new_1102805.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805029", "story_v_side_new_1102805.awb")
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
	Play1102805030 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 1102805030
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play1102805031(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 0.525

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[7].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(1102805030)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 21
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
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_8 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_8 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_8

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_8 and arg_117_1.time_ < var_120_0 + var_120_8 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805031 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 1102805031
		arg_121_1.duration_ = 4.933

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play1102805032(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.35

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[10].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(1102805031)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805031", "story_v_side_new_1102805.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805031", "story_v_side_new_1102805.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_side_new_1102805", "1102805031", "story_v_side_new_1102805.awb")

						arg_121_1:RecordAudio("1102805031", var_124_9)
						arg_121_1:RecordAudio("1102805031", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805031", "story_v_side_new_1102805.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805031", "story_v_side_new_1102805.awb")
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
	Play1102805032 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 1102805032
		arg_125_1.duration_ = 3.3

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play1102805033(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1028ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1028ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(0, -0.9, -5.9)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1028ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = arg_125_1.actors_["1028ui_story"]
			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 and arg_125_1.var_.characterEffect1028ui_story == nil then
				arg_125_1.var_.characterEffect1028ui_story = var_128_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_11 = 0.200000002980232

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_11 then
				local var_128_12 = (arg_125_1.time_ - var_128_10) / var_128_11

				if arg_125_1.var_.characterEffect1028ui_story then
					arg_125_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_10 + var_128_11 and arg_125_1.time_ < var_128_10 + var_128_11 + arg_128_0 and arg_125_1.var_.characterEffect1028ui_story then
				arg_125_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_128_13 = 0

			if var_128_13 < arg_125_1.time_ and arg_125_1.time_ <= var_128_13 + arg_128_0 then
				arg_125_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action467")
			end

			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 then
				arg_125_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_128_15 = 0
			local var_128_16 = 0.375

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_17 = arg_125_1:FormatText(StoryNameCfg[327].name)

				arg_125_1.leftNameTxt_.text = var_128_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_18 = arg_125_1:GetWordFromCfg(1102805032)
				local var_128_19 = arg_125_1:FormatText(var_128_18.content)

				arg_125_1.text_.text = var_128_19

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_20 = 15
				local var_128_21 = utf8.len(var_128_19)
				local var_128_22 = var_128_20 <= 0 and var_128_16 or var_128_16 * (var_128_21 / var_128_20)

				if var_128_22 > 0 and var_128_16 < var_128_22 then
					arg_125_1.talkMaxDuration = var_128_22

					if var_128_22 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_22 + var_128_15
					end
				end

				arg_125_1.text_.text = var_128_19
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805032", "story_v_side_new_1102805.awb") ~= 0 then
					local var_128_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805032", "story_v_side_new_1102805.awb") / 1000

					if var_128_23 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_23 + var_128_15
					end

					if var_128_18.prefab_name ~= "" and arg_125_1.actors_[var_128_18.prefab_name] ~= nil then
						local var_128_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_18.prefab_name].transform, "story_v_side_new_1102805", "1102805032", "story_v_side_new_1102805.awb")

						arg_125_1:RecordAudio("1102805032", var_128_24)
						arg_125_1:RecordAudio("1102805032", var_128_24)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805032", "story_v_side_new_1102805.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805032", "story_v_side_new_1102805.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_25 = math.max(var_128_16, arg_125_1.talkMaxDuration)

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_25 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_15) / var_128_25

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_15 + var_128_25 and arg_125_1.time_ < var_128_15 + var_128_25 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805033 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 1102805033
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play1102805034(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1028ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1028ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, 100, 0)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1028ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, 100, 0)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1028ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1028ui_story == nil then
				arg_129_1.var_.characterEffect1028ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1028ui_story then
					local var_132_13 = Mathf.Lerp(0, 0.5, var_132_12)

					arg_129_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1028ui_story.fillRatio = var_132_13
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect1028ui_story then
				local var_132_14 = 0.5

				arg_129_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1028ui_story.fillRatio = var_132_14
			end

			local var_132_15 = 0
			local var_132_16 = 0.775

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_17 = arg_129_1:GetWordFromCfg(1102805033)
				local var_132_18 = arg_129_1:FormatText(var_132_17.content)

				arg_129_1.text_.text = var_132_18

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_19 = 31
				local var_132_20 = utf8.len(var_132_18)
				local var_132_21 = var_132_19 <= 0 and var_132_16 or var_132_16 * (var_132_20 / var_132_19)

				if var_132_21 > 0 and var_132_16 < var_132_21 then
					arg_129_1.talkMaxDuration = var_132_21

					if var_132_21 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_21 + var_132_15
					end
				end

				arg_129_1.text_.text = var_132_18
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_22 = math.max(var_132_16, arg_129_1.talkMaxDuration)

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_22 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_15) / var_132_22

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_15 + var_132_22 and arg_129_1.time_ < var_132_15 + var_132_22 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805034 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 1102805034
		arg_133_1.duration_ = 7.366

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play1102805035(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1028ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1028ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, -0.9, -5.9)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1028ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["1028ui_story"]
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect1028ui_story == nil then
				arg_133_1.var_.characterEffect1028ui_story = var_136_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_11 = 0.200000002980232

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11

				if arg_133_1.var_.characterEffect1028ui_story then
					arg_133_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 and arg_133_1.var_.characterEffect1028ui_story then
				arg_133_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_136_13 = 0

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_136_14 = 0
			local var_136_15 = 0.875

			if var_136_14 < arg_133_1.time_ and arg_133_1.time_ <= var_136_14 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_16 = arg_133_1:FormatText(StoryNameCfg[327].name)

				arg_133_1.leftNameTxt_.text = var_136_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_17 = arg_133_1:GetWordFromCfg(1102805034)
				local var_136_18 = arg_133_1:FormatText(var_136_17.content)

				arg_133_1.text_.text = var_136_18

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_19 = 35
				local var_136_20 = utf8.len(var_136_18)
				local var_136_21 = var_136_19 <= 0 and var_136_15 or var_136_15 * (var_136_20 / var_136_19)

				if var_136_21 > 0 and var_136_15 < var_136_21 then
					arg_133_1.talkMaxDuration = var_136_21

					if var_136_21 + var_136_14 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_21 + var_136_14
					end
				end

				arg_133_1.text_.text = var_136_18
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805034", "story_v_side_new_1102805.awb") ~= 0 then
					local var_136_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805034", "story_v_side_new_1102805.awb") / 1000

					if var_136_22 + var_136_14 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_22 + var_136_14
					end

					if var_136_17.prefab_name ~= "" and arg_133_1.actors_[var_136_17.prefab_name] ~= nil then
						local var_136_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_17.prefab_name].transform, "story_v_side_new_1102805", "1102805034", "story_v_side_new_1102805.awb")

						arg_133_1:RecordAudio("1102805034", var_136_23)
						arg_133_1:RecordAudio("1102805034", var_136_23)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805034", "story_v_side_new_1102805.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805034", "story_v_side_new_1102805.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_24 = math.max(var_136_15, arg_133_1.talkMaxDuration)

			if var_136_14 <= arg_133_1.time_ and arg_133_1.time_ < var_136_14 + var_136_24 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_14) / var_136_24

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_14 + var_136_24 and arg_133_1.time_ < var_136_14 + var_136_24 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805035 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 1102805035
		arg_137_1.duration_ = 6.8

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play1102805036(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1028ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1028ui_story == nil then
				arg_137_1.var_.characterEffect1028ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1028ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1028ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1028ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1028ui_story.fillRatio = var_140_5
			end

			local var_140_6 = 0
			local var_140_7 = 0.65

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_8 = arg_137_1:FormatText(StoryNameCfg[10].name)

				arg_137_1.leftNameTxt_.text = var_140_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_9 = arg_137_1:GetWordFromCfg(1102805035)
				local var_140_10 = arg_137_1:FormatText(var_140_9.content)

				arg_137_1.text_.text = var_140_10

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_11 = 26
				local var_140_12 = utf8.len(var_140_10)
				local var_140_13 = var_140_11 <= 0 and var_140_7 or var_140_7 * (var_140_12 / var_140_11)

				if var_140_13 > 0 and var_140_7 < var_140_13 then
					arg_137_1.talkMaxDuration = var_140_13

					if var_140_13 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_13 + var_140_6
					end
				end

				arg_137_1.text_.text = var_140_10
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805035", "story_v_side_new_1102805.awb") ~= 0 then
					local var_140_14 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805035", "story_v_side_new_1102805.awb") / 1000

					if var_140_14 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_14 + var_140_6
					end

					if var_140_9.prefab_name ~= "" and arg_137_1.actors_[var_140_9.prefab_name] ~= nil then
						local var_140_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_9.prefab_name].transform, "story_v_side_new_1102805", "1102805035", "story_v_side_new_1102805.awb")

						arg_137_1:RecordAudio("1102805035", var_140_15)
						arg_137_1:RecordAudio("1102805035", var_140_15)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805035", "story_v_side_new_1102805.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805035", "story_v_side_new_1102805.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_16 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_16 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_16

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_16 and arg_137_1.time_ < var_140_6 + var_140_16 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805036 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 1102805036
		arg_141_1.duration_ = 2.466

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play1102805037(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1028ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1028ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0, -0.9, -5.9)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1028ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["1028ui_story"]
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 and arg_141_1.var_.characterEffect1028ui_story == nil then
				arg_141_1.var_.characterEffect1028ui_story = var_144_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_11 = 0.200000002980232

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11

				if arg_141_1.var_.characterEffect1028ui_story then
					arg_141_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 and arg_141_1.var_.characterEffect1028ui_story then
				arg_141_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_2")
			end

			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_144_15 = 0
			local var_144_16 = 0.2

			if var_144_15 < arg_141_1.time_ and arg_141_1.time_ <= var_144_15 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_17 = arg_141_1:FormatText(StoryNameCfg[327].name)

				arg_141_1.leftNameTxt_.text = var_144_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_18 = arg_141_1:GetWordFromCfg(1102805036)
				local var_144_19 = arg_141_1:FormatText(var_144_18.content)

				arg_141_1.text_.text = var_144_19

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_20 = 8
				local var_144_21 = utf8.len(var_144_19)
				local var_144_22 = var_144_20 <= 0 and var_144_16 or var_144_16 * (var_144_21 / var_144_20)

				if var_144_22 > 0 and var_144_16 < var_144_22 then
					arg_141_1.talkMaxDuration = var_144_22

					if var_144_22 + var_144_15 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_22 + var_144_15
					end
				end

				arg_141_1.text_.text = var_144_19
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805036", "story_v_side_new_1102805.awb") ~= 0 then
					local var_144_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805036", "story_v_side_new_1102805.awb") / 1000

					if var_144_23 + var_144_15 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_23 + var_144_15
					end

					if var_144_18.prefab_name ~= "" and arg_141_1.actors_[var_144_18.prefab_name] ~= nil then
						local var_144_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_18.prefab_name].transform, "story_v_side_new_1102805", "1102805036", "story_v_side_new_1102805.awb")

						arg_141_1:RecordAudio("1102805036", var_144_24)
						arg_141_1:RecordAudio("1102805036", var_144_24)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805036", "story_v_side_new_1102805.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805036", "story_v_side_new_1102805.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_25 = math.max(var_144_16, arg_141_1.talkMaxDuration)

			if var_144_15 <= arg_141_1.time_ and arg_141_1.time_ < var_144_15 + var_144_25 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_15) / var_144_25

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_15 + var_144_25 and arg_141_1.time_ < var_144_15 + var_144_25 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805037 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 1102805037
		arg_145_1.duration_ = 15.066

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play1102805038(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1028ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1028ui_story == nil then
				arg_145_1.var_.characterEffect1028ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1028ui_story then
					local var_148_4 = Mathf.Lerp(0, 0.5, var_148_3)

					arg_145_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1028ui_story.fillRatio = var_148_4
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1028ui_story then
				local var_148_5 = 0.5

				arg_145_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1028ui_story.fillRatio = var_148_5
			end

			local var_148_6 = 0
			local var_148_7 = 1.475

			if var_148_6 < arg_145_1.time_ and arg_145_1.time_ <= var_148_6 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_8 = arg_145_1:FormatText(StoryNameCfg[10].name)

				arg_145_1.leftNameTxt_.text = var_148_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, true)
				arg_145_1.iconController_:SetSelectedState("hero")

				arg_145_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_9 = arg_145_1:GetWordFromCfg(1102805037)
				local var_148_10 = arg_145_1:FormatText(var_148_9.content)

				arg_145_1.text_.text = var_148_10

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_11 = 70
				local var_148_12 = utf8.len(var_148_10)
				local var_148_13 = var_148_11 <= 0 and var_148_7 or var_148_7 * (var_148_12 / var_148_11)

				if var_148_13 > 0 and var_148_7 < var_148_13 then
					arg_145_1.talkMaxDuration = var_148_13

					if var_148_13 + var_148_6 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_13 + var_148_6
					end
				end

				arg_145_1.text_.text = var_148_10
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805037", "story_v_side_new_1102805.awb") ~= 0 then
					local var_148_14 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805037", "story_v_side_new_1102805.awb") / 1000

					if var_148_14 + var_148_6 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_14 + var_148_6
					end

					if var_148_9.prefab_name ~= "" and arg_145_1.actors_[var_148_9.prefab_name] ~= nil then
						local var_148_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_9.prefab_name].transform, "story_v_side_new_1102805", "1102805037", "story_v_side_new_1102805.awb")

						arg_145_1:RecordAudio("1102805037", var_148_15)
						arg_145_1:RecordAudio("1102805037", var_148_15)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805037", "story_v_side_new_1102805.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805037", "story_v_side_new_1102805.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_16 = math.max(var_148_7, arg_145_1.talkMaxDuration)

			if var_148_6 <= arg_145_1.time_ and arg_145_1.time_ < var_148_6 + var_148_16 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_6) / var_148_16

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_6 + var_148_16 and arg_145_1.time_ < var_148_6 + var_148_16 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805038 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 1102805038
		arg_149_1.duration_ = 6

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play1102805039(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1028ui_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos1028ui_story = var_152_0.localPosition
			end

			local var_152_2 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2
				local var_152_4 = Vector3.New(0, -0.9, -5.9)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1028ui_story, var_152_4, var_152_3)

				local var_152_5 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_5.x, var_152_5.y, var_152_5.z)

				local var_152_6 = var_152_0.localEulerAngles

				var_152_6.z = 0
				var_152_6.x = 0
				var_152_0.localEulerAngles = var_152_6
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_152_7 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_7.x, var_152_7.y, var_152_7.z)

				local var_152_8 = var_152_0.localEulerAngles

				var_152_8.z = 0
				var_152_8.x = 0
				var_152_0.localEulerAngles = var_152_8
			end

			local var_152_9 = arg_149_1.actors_["1028ui_story"]
			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 and arg_149_1.var_.characterEffect1028ui_story == nil then
				arg_149_1.var_.characterEffect1028ui_story = var_152_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_11 = 0.200000002980232

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_10) / var_152_11

				if arg_149_1.var_.characterEffect1028ui_story then
					arg_149_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_10 + var_152_11 and arg_149_1.time_ < var_152_10 + var_152_11 + arg_152_0 and arg_149_1.var_.characterEffect1028ui_story then
				arg_149_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_152_13 = 0

			if var_152_13 < arg_149_1.time_ and arg_149_1.time_ <= var_152_13 + arg_152_0 then
				arg_149_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_152_14 = 0
			local var_152_15 = 0.725

			if var_152_14 < arg_149_1.time_ and arg_149_1.time_ <= var_152_14 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_16 = arg_149_1:FormatText(StoryNameCfg[327].name)

				arg_149_1.leftNameTxt_.text = var_152_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_17 = arg_149_1:GetWordFromCfg(1102805038)
				local var_152_18 = arg_149_1:FormatText(var_152_17.content)

				arg_149_1.text_.text = var_152_18

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_19 = 29
				local var_152_20 = utf8.len(var_152_18)
				local var_152_21 = var_152_19 <= 0 and var_152_15 or var_152_15 * (var_152_20 / var_152_19)

				if var_152_21 > 0 and var_152_15 < var_152_21 then
					arg_149_1.talkMaxDuration = var_152_21

					if var_152_21 + var_152_14 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_21 + var_152_14
					end
				end

				arg_149_1.text_.text = var_152_18
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805038", "story_v_side_new_1102805.awb") ~= 0 then
					local var_152_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805038", "story_v_side_new_1102805.awb") / 1000

					if var_152_22 + var_152_14 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_22 + var_152_14
					end

					if var_152_17.prefab_name ~= "" and arg_149_1.actors_[var_152_17.prefab_name] ~= nil then
						local var_152_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_17.prefab_name].transform, "story_v_side_new_1102805", "1102805038", "story_v_side_new_1102805.awb")

						arg_149_1:RecordAudio("1102805038", var_152_23)
						arg_149_1:RecordAudio("1102805038", var_152_23)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805038", "story_v_side_new_1102805.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805038", "story_v_side_new_1102805.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_24 = math.max(var_152_15, arg_149_1.talkMaxDuration)

			if var_152_14 <= arg_149_1.time_ and arg_149_1.time_ < var_152_14 + var_152_24 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_14) / var_152_24

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_14 + var_152_24 and arg_149_1.time_ < var_152_14 + var_152_24 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805039 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 1102805039
		arg_153_1.duration_ = 5.433

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play1102805040(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1028ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1028ui_story == nil then
				arg_153_1.var_.characterEffect1028ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1028ui_story then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1028ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1028ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1028ui_story.fillRatio = var_156_5
			end

			local var_156_6 = 0
			local var_156_7 = 0.425

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_8 = arg_153_1:FormatText(StoryNameCfg[10].name)

				arg_153_1.leftNameTxt_.text = var_156_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, true)
				arg_153_1.iconController_:SetSelectedState("hero")

				arg_153_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_9 = arg_153_1:GetWordFromCfg(1102805039)
				local var_156_10 = arg_153_1:FormatText(var_156_9.content)

				arg_153_1.text_.text = var_156_10

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_11 = 17
				local var_156_12 = utf8.len(var_156_10)
				local var_156_13 = var_156_11 <= 0 and var_156_7 or var_156_7 * (var_156_12 / var_156_11)

				if var_156_13 > 0 and var_156_7 < var_156_13 then
					arg_153_1.talkMaxDuration = var_156_13

					if var_156_13 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_13 + var_156_6
					end
				end

				arg_153_1.text_.text = var_156_10
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805039", "story_v_side_new_1102805.awb") ~= 0 then
					local var_156_14 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805039", "story_v_side_new_1102805.awb") / 1000

					if var_156_14 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_14 + var_156_6
					end

					if var_156_9.prefab_name ~= "" and arg_153_1.actors_[var_156_9.prefab_name] ~= nil then
						local var_156_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_9.prefab_name].transform, "story_v_side_new_1102805", "1102805039", "story_v_side_new_1102805.awb")

						arg_153_1:RecordAudio("1102805039", var_156_15)
						arg_153_1:RecordAudio("1102805039", var_156_15)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805039", "story_v_side_new_1102805.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805039", "story_v_side_new_1102805.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_16 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_16 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_16

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_16 and arg_153_1.time_ < var_156_6 + var_156_16 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805040 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 1102805040
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play1102805041(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.5

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[7].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(1102805040)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 20
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
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_8 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_8 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_8

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_8 and arg_157_1.time_ < var_160_0 + var_160_8 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805041 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 1102805041
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

			arg_161_1.choices_[1].txt.text = arg_161_1:FormatText(StoryChoiceCfg[649].name)
			arg_161_1.choices_[2].txt.text = arg_161_1:FormatText(StoryChoiceCfg[650].name)
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play1102805042(arg_161_1)
			end

			if arg_163_0 == 2 then
				arg_161_0:Play1102805042(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.allBtn_.enabled = false
			end

			local var_164_1 = 0.5

			if arg_161_1.time_ >= var_164_0 + var_164_1 and arg_161_1.time_ < var_164_0 + var_164_1 + arg_164_0 then
				arg_161_1.allBtn_.enabled = true
			end
		end
	end,
	Play1102805042 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 1102805042
		arg_165_1.duration_ = 2.266

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play1102805043(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.2

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[10].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, true)
				arg_165_1.iconController_:SetSelectedState("hero")

				arg_165_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(1102805042)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805042", "story_v_side_new_1102805.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805042", "story_v_side_new_1102805.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_side_new_1102805", "1102805042", "story_v_side_new_1102805.awb")

						arg_165_1:RecordAudio("1102805042", var_168_9)
						arg_165_1:RecordAudio("1102805042", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805042", "story_v_side_new_1102805.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805042", "story_v_side_new_1102805.awb")
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
	Play1102805043 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 1102805043
		arg_169_1.duration_ = 9.133

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play1102805044(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1028ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1028ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, -0.9, -5.9)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1028ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["1028ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and arg_169_1.var_.characterEffect1028ui_story == nil then
				arg_169_1.var_.characterEffect1028ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect1028ui_story then
					arg_169_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect1028ui_story then
				arg_169_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_172_13 = 0

			if var_172_13 < arg_169_1.time_ and arg_169_1.time_ <= var_172_13 + arg_172_0 then
				arg_169_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_1")
			end

			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_172_15 = 0
			local var_172_16 = 0.925

			if var_172_15 < arg_169_1.time_ and arg_169_1.time_ <= var_172_15 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_17 = arg_169_1:FormatText(StoryNameCfg[327].name)

				arg_169_1.leftNameTxt_.text = var_172_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_18 = arg_169_1:GetWordFromCfg(1102805043)
				local var_172_19 = arg_169_1:FormatText(var_172_18.content)

				arg_169_1.text_.text = var_172_19

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_20 = 37
				local var_172_21 = utf8.len(var_172_19)
				local var_172_22 = var_172_20 <= 0 and var_172_16 or var_172_16 * (var_172_21 / var_172_20)

				if var_172_22 > 0 and var_172_16 < var_172_22 then
					arg_169_1.talkMaxDuration = var_172_22

					if var_172_22 + var_172_15 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_22 + var_172_15
					end
				end

				arg_169_1.text_.text = var_172_19
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805043", "story_v_side_new_1102805.awb") ~= 0 then
					local var_172_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805043", "story_v_side_new_1102805.awb") / 1000

					if var_172_23 + var_172_15 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_23 + var_172_15
					end

					if var_172_18.prefab_name ~= "" and arg_169_1.actors_[var_172_18.prefab_name] ~= nil then
						local var_172_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_18.prefab_name].transform, "story_v_side_new_1102805", "1102805043", "story_v_side_new_1102805.awb")

						arg_169_1:RecordAudio("1102805043", var_172_24)
						arg_169_1:RecordAudio("1102805043", var_172_24)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805043", "story_v_side_new_1102805.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805043", "story_v_side_new_1102805.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_25 = math.max(var_172_16, arg_169_1.talkMaxDuration)

			if var_172_15 <= arg_169_1.time_ and arg_169_1.time_ < var_172_15 + var_172_25 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_15) / var_172_25

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_15 + var_172_25 and arg_169_1.time_ < var_172_15 + var_172_25 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805044 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 1102805044
		arg_173_1.duration_ = 5.266

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play1102805045(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1028ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1028ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(0, 100, 0)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1028ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0, 100, 0)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = arg_173_1.actors_["1028ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1028ui_story == nil then
				arg_173_1.var_.characterEffect1028ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.200000002980232

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1028ui_story then
					local var_176_13 = Mathf.Lerp(0, 0.5, var_176_12)

					arg_173_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1028ui_story.fillRatio = var_176_13
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1028ui_story then
				local var_176_14 = 0.5

				arg_173_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1028ui_story.fillRatio = var_176_14
			end

			local var_176_15 = 0
			local var_176_16 = 0.45

			if var_176_15 < arg_173_1.time_ and arg_173_1.time_ <= var_176_15 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_17 = arg_173_1:FormatText(StoryNameCfg[649].name)

				arg_173_1.leftNameTxt_.text = var_176_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_18 = arg_173_1:GetWordFromCfg(1102805044)
				local var_176_19 = arg_173_1:FormatText(var_176_18.content)

				arg_173_1.text_.text = var_176_19

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_20 = 18
				local var_176_21 = utf8.len(var_176_19)
				local var_176_22 = var_176_20 <= 0 and var_176_16 or var_176_16 * (var_176_21 / var_176_20)

				if var_176_22 > 0 and var_176_16 < var_176_22 then
					arg_173_1.talkMaxDuration = var_176_22

					if var_176_22 + var_176_15 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_22 + var_176_15
					end
				end

				arg_173_1.text_.text = var_176_19
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805044", "story_v_side_new_1102805.awb") ~= 0 then
					local var_176_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805044", "story_v_side_new_1102805.awb") / 1000

					if var_176_23 + var_176_15 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_23 + var_176_15
					end

					if var_176_18.prefab_name ~= "" and arg_173_1.actors_[var_176_18.prefab_name] ~= nil then
						local var_176_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_18.prefab_name].transform, "story_v_side_new_1102805", "1102805044", "story_v_side_new_1102805.awb")

						arg_173_1:RecordAudio("1102805044", var_176_24)
						arg_173_1:RecordAudio("1102805044", var_176_24)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805044", "story_v_side_new_1102805.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805044", "story_v_side_new_1102805.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_25 = math.max(var_176_16, arg_173_1.talkMaxDuration)

			if var_176_15 <= arg_173_1.time_ and arg_173_1.time_ < var_176_15 + var_176_25 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_15) / var_176_25

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_15 + var_176_25 and arg_173_1.time_ < var_176_15 + var_176_25 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805045 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 1102805045
		arg_177_1.duration_ = 0.999999999999

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"

			SetActive(arg_177_1.choicesGo_, true)

			for iter_178_0, iter_178_1 in ipairs(arg_177_1.choices_) do
				local var_178_0 = iter_178_0 <= 1

				SetActive(iter_178_1.go, var_178_0)
			end

			arg_177_1.choices_[1].txt.text = arg_177_1:FormatText(StoryChoiceCfg[651].name)
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play1102805046(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.allBtn_.enabled = false
			end

			local var_180_1 = 0.5

			if arg_177_1.time_ >= var_180_0 + var_180_1 and arg_177_1.time_ < var_180_0 + var_180_1 + arg_180_0 then
				arg_177_1.allBtn_.enabled = true
			end
		end
	end,
	Play1102805046 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 1102805046
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play1102805047(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.7

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, false)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_2 = arg_181_1:GetWordFromCfg(1102805046)
				local var_184_3 = arg_181_1:FormatText(var_184_2.content)

				arg_181_1.text_.text = var_184_3

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_4 = 28
				local var_184_5 = utf8.len(var_184_3)
				local var_184_6 = var_184_4 <= 0 and var_184_1 or var_184_1 * (var_184_5 / var_184_4)

				if var_184_6 > 0 and var_184_1 < var_184_6 then
					arg_181_1.talkMaxDuration = var_184_6

					if var_184_6 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_6 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_3
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_7 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_7 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_7

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_7 and arg_181_1.time_ < var_184_0 + var_184_7 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805047 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 1102805047
		arg_185_1.duration_ = 7.9

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play1102805048(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 2

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				local var_188_1 = manager.ui.mainCamera.transform.localPosition
				local var_188_2 = Vector3.New(0, 0, 10) + Vector3.New(var_188_1.x, var_188_1.y, 0)
				local var_188_3 = arg_185_1.bgs_.J02a

				var_188_3.transform.localPosition = var_188_2
				var_188_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_188_4 = var_188_3:GetComponent("SpriteRenderer")

				if var_188_4 and var_188_4.sprite then
					local var_188_5 = (var_188_3.transform.localPosition - var_188_1).z
					local var_188_6 = manager.ui.mainCameraCom_
					local var_188_7 = 2 * var_188_5 * Mathf.Tan(var_188_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_188_8 = var_188_7 * var_188_6.aspect
					local var_188_9 = var_188_4.sprite.bounds.size.x
					local var_188_10 = var_188_4.sprite.bounds.size.y
					local var_188_11 = var_188_8 / var_188_9
					local var_188_12 = var_188_7 / var_188_10
					local var_188_13 = var_188_12 < var_188_11 and var_188_11 or var_188_12

					var_188_3.transform.localScale = Vector3.New(var_188_13, var_188_13, 0)
				end

				for iter_188_0, iter_188_1 in pairs(arg_185_1.bgs_) do
					if iter_188_0 ~= "J02a" then
						iter_188_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_188_14 = 0

			if var_188_14 < arg_185_1.time_ and arg_185_1.time_ <= var_188_14 + arg_188_0 then
				arg_185_1.mask_.enabled = true
				arg_185_1.mask_.raycastTarget = true

				arg_185_1:SetGaussion(false)
			end

			local var_188_15 = 2

			if var_188_14 <= arg_185_1.time_ and arg_185_1.time_ < var_188_14 + var_188_15 then
				local var_188_16 = (arg_185_1.time_ - var_188_14) / var_188_15
				local var_188_17 = Color.New(0, 0, 0)

				var_188_17.a = Mathf.Lerp(0, 1, var_188_16)
				arg_185_1.mask_.color = var_188_17
			end

			if arg_185_1.time_ >= var_188_14 + var_188_15 and arg_185_1.time_ < var_188_14 + var_188_15 + arg_188_0 then
				local var_188_18 = Color.New(0, 0, 0)

				var_188_18.a = 1
				arg_185_1.mask_.color = var_188_18
			end

			local var_188_19 = 2

			if var_188_19 < arg_185_1.time_ and arg_185_1.time_ <= var_188_19 + arg_188_0 then
				arg_185_1.mask_.enabled = true
				arg_185_1.mask_.raycastTarget = true

				arg_185_1:SetGaussion(false)
			end

			local var_188_20 = 2

			if var_188_19 <= arg_185_1.time_ and arg_185_1.time_ < var_188_19 + var_188_20 then
				local var_188_21 = (arg_185_1.time_ - var_188_19) / var_188_20
				local var_188_22 = Color.New(0, 0, 0)

				var_188_22.a = Mathf.Lerp(1, 0, var_188_21)
				arg_185_1.mask_.color = var_188_22
			end

			if arg_185_1.time_ >= var_188_19 + var_188_20 and arg_185_1.time_ < var_188_19 + var_188_20 + arg_188_0 then
				local var_188_23 = Color.New(0, 0, 0)
				local var_188_24 = 0

				arg_185_1.mask_.enabled = false
				var_188_23.a = var_188_24
				arg_185_1.mask_.color = var_188_23
			end

			local var_188_25 = arg_185_1.actors_["1028ui_story"].transform
			local var_188_26 = 4

			if var_188_26 < arg_185_1.time_ and arg_185_1.time_ <= var_188_26 + arg_188_0 then
				arg_185_1.var_.moveOldPos1028ui_story = var_188_25.localPosition
			end

			local var_188_27 = 0.001

			if var_188_26 <= arg_185_1.time_ and arg_185_1.time_ < var_188_26 + var_188_27 then
				local var_188_28 = (arg_185_1.time_ - var_188_26) / var_188_27
				local var_188_29 = Vector3.New(0, -0.9, -5.9)

				var_188_25.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1028ui_story, var_188_29, var_188_28)

				local var_188_30 = manager.ui.mainCamera.transform.position - var_188_25.position

				var_188_25.forward = Vector3.New(var_188_30.x, var_188_30.y, var_188_30.z)

				local var_188_31 = var_188_25.localEulerAngles

				var_188_31.z = 0
				var_188_31.x = 0
				var_188_25.localEulerAngles = var_188_31
			end

			if arg_185_1.time_ >= var_188_26 + var_188_27 and arg_185_1.time_ < var_188_26 + var_188_27 + arg_188_0 then
				var_188_25.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_188_32 = manager.ui.mainCamera.transform.position - var_188_25.position

				var_188_25.forward = Vector3.New(var_188_32.x, var_188_32.y, var_188_32.z)

				local var_188_33 = var_188_25.localEulerAngles

				var_188_33.z = 0
				var_188_33.x = 0
				var_188_25.localEulerAngles = var_188_33
			end

			local var_188_34 = arg_185_1.actors_["1028ui_story"]
			local var_188_35 = 4

			if var_188_35 < arg_185_1.time_ and arg_185_1.time_ <= var_188_35 + arg_188_0 and arg_185_1.var_.characterEffect1028ui_story == nil then
				arg_185_1.var_.characterEffect1028ui_story = var_188_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_36 = 0.200000002980232

			if var_188_35 <= arg_185_1.time_ and arg_185_1.time_ < var_188_35 + var_188_36 then
				local var_188_37 = (arg_185_1.time_ - var_188_35) / var_188_36

				if arg_185_1.var_.characterEffect1028ui_story then
					arg_185_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_35 + var_188_36 and arg_185_1.time_ < var_188_35 + var_188_36 + arg_188_0 and arg_185_1.var_.characterEffect1028ui_story then
				arg_185_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_188_38 = 4

			if var_188_38 < arg_185_1.time_ and arg_185_1.time_ <= var_188_38 + arg_188_0 then
				arg_185_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_188_39 = 4

			if var_188_39 < arg_185_1.time_ and arg_185_1.time_ <= var_188_39 + arg_188_0 then
				arg_185_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_188_40 = 2

			if var_188_40 < arg_185_1.time_ and arg_185_1.time_ <= var_188_40 + arg_188_0 then
				arg_185_1.screenFilterGo_:SetActive(false)
			end

			local var_188_41 = 0.0166666666666667

			if var_188_40 <= arg_185_1.time_ and arg_185_1.time_ < var_188_40 + var_188_41 then
				local var_188_42 = (arg_185_1.time_ - var_188_40) / var_188_41

				arg_185_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_188_42)
			end

			if arg_185_1.time_ >= var_188_40 + var_188_41 and arg_185_1.time_ < var_188_40 + var_188_41 + arg_188_0 then
				arg_185_1.screenFilterEffect_.weight = 0
			end

			if arg_185_1.frameCnt_ <= 1 then
				arg_185_1.dialog_:SetActive(false)
			end

			local var_188_43 = 4
			local var_188_44 = 0.225

			if var_188_43 < arg_185_1.time_ and arg_185_1.time_ <= var_188_43 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0

				arg_185_1.dialog_:SetActive(true)

				local var_188_45 = LeanTween.value(arg_185_1.dialog_, 0, 1, 0.3)

				var_188_45:setOnUpdate(LuaHelper.FloatAction(function(arg_189_0)
					arg_185_1.dialogCg_.alpha = arg_189_0
				end))
				var_188_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_185_1.dialog_)
					var_188_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_185_1.duration_ = arg_185_1.duration_ + 0.3

				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_46 = arg_185_1:FormatText(StoryNameCfg[327].name)

				arg_185_1.leftNameTxt_.text = var_188_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_47 = arg_185_1:GetWordFromCfg(1102805047)
				local var_188_48 = arg_185_1:FormatText(var_188_47.content)

				arg_185_1.text_.text = var_188_48

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_49 = 9
				local var_188_50 = utf8.len(var_188_48)
				local var_188_51 = var_188_49 <= 0 and var_188_44 or var_188_44 * (var_188_50 / var_188_49)

				if var_188_51 > 0 and var_188_44 < var_188_51 then
					arg_185_1.talkMaxDuration = var_188_51
					var_188_43 = var_188_43 + 0.3

					if var_188_51 + var_188_43 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_51 + var_188_43
					end
				end

				arg_185_1.text_.text = var_188_48
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805047", "story_v_side_new_1102805.awb") ~= 0 then
					local var_188_52 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805047", "story_v_side_new_1102805.awb") / 1000

					if var_188_52 + var_188_43 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_52 + var_188_43
					end

					if var_188_47.prefab_name ~= "" and arg_185_1.actors_[var_188_47.prefab_name] ~= nil then
						local var_188_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_47.prefab_name].transform, "story_v_side_new_1102805", "1102805047", "story_v_side_new_1102805.awb")

						arg_185_1:RecordAudio("1102805047", var_188_53)
						arg_185_1:RecordAudio("1102805047", var_188_53)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805047", "story_v_side_new_1102805.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805047", "story_v_side_new_1102805.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_54 = var_188_43 + 0.3
			local var_188_55 = math.max(var_188_44, arg_185_1.talkMaxDuration)

			if var_188_54 <= arg_185_1.time_ and arg_185_1.time_ < var_188_54 + var_188_55 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_54) / var_188_55

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_54 + var_188_55 and arg_185_1.time_ < var_188_54 + var_188_55 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 1102805048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play1102805049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1028ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1028ui_story == nil then
				arg_191_1.var_.characterEffect1028ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1028ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1028ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1028ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1028ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.275

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_8 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_9 = arg_191_1:GetWordFromCfg(1102805048)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 11
				local var_194_12 = utf8.len(var_194_10)
				local var_194_13 = var_194_11 <= 0 and var_194_7 or var_194_7 * (var_194_12 / var_194_11)

				if var_194_13 > 0 and var_194_7 < var_194_13 then
					arg_191_1.talkMaxDuration = var_194_13

					if var_194_13 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_13 + var_194_6
					end
				end

				arg_191_1.text_.text = var_194_10
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_14 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_14 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_14

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_14 and arg_191_1.time_ < var_194_6 + var_194_14 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 1102805049
		arg_195_1.duration_ = 3.766

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play1102805050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1028ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1028ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(0, -0.9, -5.9)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1028ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = arg_195_1.actors_["1028ui_story"]
			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 and arg_195_1.var_.characterEffect1028ui_story == nil then
				arg_195_1.var_.characterEffect1028ui_story = var_198_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_11 = 0.200000002980232

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_10) / var_198_11

				if arg_195_1.var_.characterEffect1028ui_story then
					arg_195_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 and arg_195_1.var_.characterEffect1028ui_story then
				arg_195_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_198_13 = 0

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_198_14 = 0
			local var_198_15 = 0.35

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_16 = arg_195_1:FormatText(StoryNameCfg[327].name)

				arg_195_1.leftNameTxt_.text = var_198_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_17 = arg_195_1:GetWordFromCfg(1102805049)
				local var_198_18 = arg_195_1:FormatText(var_198_17.content)

				arg_195_1.text_.text = var_198_18

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_19 = 14
				local var_198_20 = utf8.len(var_198_18)
				local var_198_21 = var_198_19 <= 0 and var_198_15 or var_198_15 * (var_198_20 / var_198_19)

				if var_198_21 > 0 and var_198_15 < var_198_21 then
					arg_195_1.talkMaxDuration = var_198_21

					if var_198_21 + var_198_14 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_21 + var_198_14
					end
				end

				arg_195_1.text_.text = var_198_18
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805049", "story_v_side_new_1102805.awb") ~= 0 then
					local var_198_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805049", "story_v_side_new_1102805.awb") / 1000

					if var_198_22 + var_198_14 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_22 + var_198_14
					end

					if var_198_17.prefab_name ~= "" and arg_195_1.actors_[var_198_17.prefab_name] ~= nil then
						local var_198_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_17.prefab_name].transform, "story_v_side_new_1102805", "1102805049", "story_v_side_new_1102805.awb")

						arg_195_1:RecordAudio("1102805049", var_198_23)
						arg_195_1:RecordAudio("1102805049", var_198_23)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805049", "story_v_side_new_1102805.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805049", "story_v_side_new_1102805.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_24 = math.max(var_198_15, arg_195_1.talkMaxDuration)

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_24 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_14) / var_198_24

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_14 + var_198_24 and arg_195_1.time_ < var_198_14 + var_198_24 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 1102805050
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play1102805051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1028ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect1028ui_story == nil then
				arg_199_1.var_.characterEffect1028ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.200000002980232

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect1028ui_story then
					local var_202_4 = Mathf.Lerp(0, 0.5, var_202_3)

					arg_199_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1028ui_story.fillRatio = var_202_4
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect1028ui_story then
				local var_202_5 = 0.5

				arg_199_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1028ui_story.fillRatio = var_202_5
			end

			local var_202_6 = 0
			local var_202_7 = 0.525

			if var_202_6 < arg_199_1.time_ and arg_199_1.time_ <= var_202_6 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_8 = arg_199_1:FormatText(StoryNameCfg[7].name)

				arg_199_1.leftNameTxt_.text = var_202_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_9 = arg_199_1:GetWordFromCfg(1102805050)
				local var_202_10 = arg_199_1:FormatText(var_202_9.content)

				arg_199_1.text_.text = var_202_10

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_11 = 21
				local var_202_12 = utf8.len(var_202_10)
				local var_202_13 = var_202_11 <= 0 and var_202_7 or var_202_7 * (var_202_12 / var_202_11)

				if var_202_13 > 0 and var_202_7 < var_202_13 then
					arg_199_1.talkMaxDuration = var_202_13

					if var_202_13 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_13 + var_202_6
					end
				end

				arg_199_1.text_.text = var_202_10
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_14 = math.max(var_202_7, arg_199_1.talkMaxDuration)

			if var_202_6 <= arg_199_1.time_ and arg_199_1.time_ < var_202_6 + var_202_14 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_6) / var_202_14

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_6 + var_202_14 and arg_199_1.time_ < var_202_6 + var_202_14 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 1102805051
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play1102805052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1028ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1028ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0, 100, 0)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1028ui_story, var_206_4, var_206_3)

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

			local var_206_9 = 0
			local var_206_10 = 1.175

			if var_206_9 < arg_203_1.time_ and arg_203_1.time_ <= var_206_9 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_11 = arg_203_1:GetWordFromCfg(1102805051)
				local var_206_12 = arg_203_1:FormatText(var_206_11.content)

				arg_203_1.text_.text = var_206_12

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_13 = 47
				local var_206_14 = utf8.len(var_206_12)
				local var_206_15 = var_206_13 <= 0 and var_206_10 or var_206_10 * (var_206_14 / var_206_13)

				if var_206_15 > 0 and var_206_10 < var_206_15 then
					arg_203_1.talkMaxDuration = var_206_15

					if var_206_15 + var_206_9 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_15 + var_206_9
					end
				end

				arg_203_1.text_.text = var_206_12
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_16 = math.max(var_206_10, arg_203_1.talkMaxDuration)

			if var_206_9 <= arg_203_1.time_ and arg_203_1.time_ < var_206_9 + var_206_16 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_9) / var_206_16

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_9 + var_206_16 and arg_203_1.time_ < var_206_9 + var_206_16 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 1102805052
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play1102805053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.95

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_2 = arg_207_1:GetWordFromCfg(1102805052)
				local var_210_3 = arg_207_1:FormatText(var_210_2.content)

				arg_207_1.text_.text = var_210_3

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_4 = 38
				local var_210_5 = utf8.len(var_210_3)
				local var_210_6 = var_210_4 <= 0 and var_210_1 or var_210_1 * (var_210_5 / var_210_4)

				if var_210_6 > 0 and var_210_1 < var_210_6 then
					arg_207_1.talkMaxDuration = var_210_6

					if var_210_6 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_6 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_3
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_7 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_7 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_7

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_7 and arg_207_1.time_ < var_210_0 + var_210_7 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 1102805053
		arg_211_1.duration_ = 3.866

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play1102805054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1028ui_story"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos1028ui_story = var_214_0.localPosition
			end

			local var_214_2 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2
				local var_214_4 = Vector3.New(0, -0.9, -5.9)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1028ui_story, var_214_4, var_214_3)

				local var_214_5 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_5.x, var_214_5.y, var_214_5.z)

				local var_214_6 = var_214_0.localEulerAngles

				var_214_6.z = 0
				var_214_6.x = 0
				var_214_0.localEulerAngles = var_214_6
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_214_7 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_7.x, var_214_7.y, var_214_7.z)

				local var_214_8 = var_214_0.localEulerAngles

				var_214_8.z = 0
				var_214_8.x = 0
				var_214_0.localEulerAngles = var_214_8
			end

			local var_214_9 = arg_211_1.actors_["1028ui_story"]
			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 and arg_211_1.var_.characterEffect1028ui_story == nil then
				arg_211_1.var_.characterEffect1028ui_story = var_214_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_11 = 0.200000002980232

			if var_214_10 <= arg_211_1.time_ and arg_211_1.time_ < var_214_10 + var_214_11 then
				local var_214_12 = (arg_211_1.time_ - var_214_10) / var_214_11

				if arg_211_1.var_.characterEffect1028ui_story then
					arg_211_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_10 + var_214_11 and arg_211_1.time_ < var_214_10 + var_214_11 + arg_214_0 and arg_211_1.var_.characterEffect1028ui_story then
				arg_211_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_214_13 = 0

			if var_214_13 < arg_211_1.time_ and arg_211_1.time_ <= var_214_13 + arg_214_0 then
				arg_211_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_1")
			end

			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 then
				arg_211_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_214_15 = 0
			local var_214_16 = 0.525

			if var_214_15 < arg_211_1.time_ and arg_211_1.time_ <= var_214_15 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_17 = arg_211_1:FormatText(StoryNameCfg[327].name)

				arg_211_1.leftNameTxt_.text = var_214_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_18 = arg_211_1:GetWordFromCfg(1102805053)
				local var_214_19 = arg_211_1:FormatText(var_214_18.content)

				arg_211_1.text_.text = var_214_19

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_20 = 21
				local var_214_21 = utf8.len(var_214_19)
				local var_214_22 = var_214_20 <= 0 and var_214_16 or var_214_16 * (var_214_21 / var_214_20)

				if var_214_22 > 0 and var_214_16 < var_214_22 then
					arg_211_1.talkMaxDuration = var_214_22

					if var_214_22 + var_214_15 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_22 + var_214_15
					end
				end

				arg_211_1.text_.text = var_214_19
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805053", "story_v_side_new_1102805.awb") ~= 0 then
					local var_214_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805053", "story_v_side_new_1102805.awb") / 1000

					if var_214_23 + var_214_15 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_23 + var_214_15
					end

					if var_214_18.prefab_name ~= "" and arg_211_1.actors_[var_214_18.prefab_name] ~= nil then
						local var_214_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_18.prefab_name].transform, "story_v_side_new_1102805", "1102805053", "story_v_side_new_1102805.awb")

						arg_211_1:RecordAudio("1102805053", var_214_24)
						arg_211_1:RecordAudio("1102805053", var_214_24)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805053", "story_v_side_new_1102805.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805053", "story_v_side_new_1102805.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_25 = math.max(var_214_16, arg_211_1.talkMaxDuration)

			if var_214_15 <= arg_211_1.time_ and arg_211_1.time_ < var_214_15 + var_214_25 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_15) / var_214_25

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_15 + var_214_25 and arg_211_1.time_ < var_214_15 + var_214_25 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 1102805054
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play1102805055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1028ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1028ui_story == nil then
				arg_215_1.var_.characterEffect1028ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.200000002980232

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1028ui_story then
					local var_218_4 = Mathf.Lerp(0, 0.5, var_218_3)

					arg_215_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1028ui_story.fillRatio = var_218_4
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1028ui_story then
				local var_218_5 = 0.5

				arg_215_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1028ui_story.fillRatio = var_218_5
			end

			local var_218_6 = 0

			if var_218_6 < arg_215_1.time_ and arg_215_1.time_ <= var_218_6 + arg_218_0 then
				arg_215_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_2")
			end

			local var_218_7 = 0
			local var_218_8 = 0.75

			if var_218_7 < arg_215_1.time_ and arg_215_1.time_ <= var_218_7 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_9 = arg_215_1:FormatText(StoryNameCfg[7].name)

				arg_215_1.leftNameTxt_.text = var_218_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_10 = arg_215_1:GetWordFromCfg(1102805054)
				local var_218_11 = arg_215_1:FormatText(var_218_10.content)

				arg_215_1.text_.text = var_218_11

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_12 = 30
				local var_218_13 = utf8.len(var_218_11)
				local var_218_14 = var_218_12 <= 0 and var_218_8 or var_218_8 * (var_218_13 / var_218_12)

				if var_218_14 > 0 and var_218_8 < var_218_14 then
					arg_215_1.talkMaxDuration = var_218_14

					if var_218_14 + var_218_7 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_14 + var_218_7
					end
				end

				arg_215_1.text_.text = var_218_11
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_15 = math.max(var_218_8, arg_215_1.talkMaxDuration)

			if var_218_7 <= arg_215_1.time_ and arg_215_1.time_ < var_218_7 + var_218_15 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_7) / var_218_15

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_7 + var_218_15 and arg_215_1.time_ < var_218_7 + var_218_15 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 1102805055
		arg_219_1.duration_ = 8.266

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play1102805056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1028ui_story"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1028ui_story = var_222_0.localPosition
			end

			local var_222_2 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2
				local var_222_4 = Vector3.New(0, -0.9, -5.9)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1028ui_story, var_222_4, var_222_3)

				local var_222_5 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_5.x, var_222_5.y, var_222_5.z)

				local var_222_6 = var_222_0.localEulerAngles

				var_222_6.z = 0
				var_222_6.x = 0
				var_222_0.localEulerAngles = var_222_6
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_222_7 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_7.x, var_222_7.y, var_222_7.z)

				local var_222_8 = var_222_0.localEulerAngles

				var_222_8.z = 0
				var_222_8.x = 0
				var_222_0.localEulerAngles = var_222_8
			end

			local var_222_9 = arg_219_1.actors_["1028ui_story"]
			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 and arg_219_1.var_.characterEffect1028ui_story == nil then
				arg_219_1.var_.characterEffect1028ui_story = var_222_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_11 = 0.200000002980232

			if var_222_10 <= arg_219_1.time_ and arg_219_1.time_ < var_222_10 + var_222_11 then
				local var_222_12 = (arg_219_1.time_ - var_222_10) / var_222_11

				if arg_219_1.var_.characterEffect1028ui_story then
					arg_219_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_10 + var_222_11 and arg_219_1.time_ < var_222_10 + var_222_11 + arg_222_0 and arg_219_1.var_.characterEffect1028ui_story then
				arg_219_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_222_13 = 0

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_222_15 = 0
			local var_222_16 = 1

			if var_222_15 < arg_219_1.time_ and arg_219_1.time_ <= var_222_15 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_17 = arg_219_1:FormatText(StoryNameCfg[327].name)

				arg_219_1.leftNameTxt_.text = var_222_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_18 = arg_219_1:GetWordFromCfg(1102805055)
				local var_222_19 = arg_219_1:FormatText(var_222_18.content)

				arg_219_1.text_.text = var_222_19

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_20 = 40
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805055", "story_v_side_new_1102805.awb") ~= 0 then
					local var_222_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805055", "story_v_side_new_1102805.awb") / 1000

					if var_222_23 + var_222_15 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_23 + var_222_15
					end

					if var_222_18.prefab_name ~= "" and arg_219_1.actors_[var_222_18.prefab_name] ~= nil then
						local var_222_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_18.prefab_name].transform, "story_v_side_new_1102805", "1102805055", "story_v_side_new_1102805.awb")

						arg_219_1:RecordAudio("1102805055", var_222_24)
						arg_219_1:RecordAudio("1102805055", var_222_24)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805055", "story_v_side_new_1102805.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805055", "story_v_side_new_1102805.awb")
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
	Play1102805056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 1102805056
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play1102805057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1028ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1028ui_story == nil then
				arg_223_1.var_.characterEffect1028ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1028ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1028ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1028ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1028ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0
			local var_226_7 = 0.9

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_8 = arg_223_1:GetWordFromCfg(1102805056)
				local var_226_9 = arg_223_1:FormatText(var_226_8.content)

				arg_223_1.text_.text = var_226_9

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_10 = 36
				local var_226_11 = utf8.len(var_226_9)
				local var_226_12 = var_226_10 <= 0 and var_226_7 or var_226_7 * (var_226_11 / var_226_10)

				if var_226_12 > 0 and var_226_7 < var_226_12 then
					arg_223_1.talkMaxDuration = var_226_12

					if var_226_12 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_12 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_9
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_13 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_13 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_13

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_13 and arg_223_1.time_ < var_226_6 + var_226_13 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 1102805057
		arg_227_1.duration_ = 2.666

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play1102805058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1028ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1028ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(0, -0.9, -5.9)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1028ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = arg_227_1.actors_["1028ui_story"]
			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 and arg_227_1.var_.characterEffect1028ui_story == nil then
				arg_227_1.var_.characterEffect1028ui_story = var_230_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_11 = 0.200000002980232

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_11 then
				local var_230_12 = (arg_227_1.time_ - var_230_10) / var_230_11

				if arg_227_1.var_.characterEffect1028ui_story then
					arg_227_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_10 + var_230_11 and arg_227_1.time_ < var_230_10 + var_230_11 + arg_230_0 and arg_227_1.var_.characterEffect1028ui_story then
				arg_227_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_230_13 = 0

			if var_230_13 < arg_227_1.time_ and arg_227_1.time_ <= var_230_13 + arg_230_0 then
				arg_227_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_2")
			end

			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 then
				arg_227_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_230_15 = 0
			local var_230_16 = 0.35

			if var_230_15 < arg_227_1.time_ and arg_227_1.time_ <= var_230_15 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_17 = arg_227_1:FormatText(StoryNameCfg[327].name)

				arg_227_1.leftNameTxt_.text = var_230_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_18 = arg_227_1:GetWordFromCfg(1102805057)
				local var_230_19 = arg_227_1:FormatText(var_230_18.content)

				arg_227_1.text_.text = var_230_19

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_20 = 14
				local var_230_21 = utf8.len(var_230_19)
				local var_230_22 = var_230_20 <= 0 and var_230_16 or var_230_16 * (var_230_21 / var_230_20)

				if var_230_22 > 0 and var_230_16 < var_230_22 then
					arg_227_1.talkMaxDuration = var_230_22

					if var_230_22 + var_230_15 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_22 + var_230_15
					end
				end

				arg_227_1.text_.text = var_230_19
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805057", "story_v_side_new_1102805.awb") ~= 0 then
					local var_230_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805057", "story_v_side_new_1102805.awb") / 1000

					if var_230_23 + var_230_15 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_23 + var_230_15
					end

					if var_230_18.prefab_name ~= "" and arg_227_1.actors_[var_230_18.prefab_name] ~= nil then
						local var_230_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_18.prefab_name].transform, "story_v_side_new_1102805", "1102805057", "story_v_side_new_1102805.awb")

						arg_227_1:RecordAudio("1102805057", var_230_24)
						arg_227_1:RecordAudio("1102805057", var_230_24)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805057", "story_v_side_new_1102805.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805057", "story_v_side_new_1102805.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_25 = math.max(var_230_16, arg_227_1.talkMaxDuration)

			if var_230_15 <= arg_227_1.time_ and arg_227_1.time_ < var_230_15 + var_230_25 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_15) / var_230_25

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_15 + var_230_25 and arg_227_1.time_ < var_230_15 + var_230_25 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 1102805058
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play1102805059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1028ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1028ui_story == nil then
				arg_231_1.var_.characterEffect1028ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1028ui_story then
					local var_234_4 = Mathf.Lerp(0, 0.5, var_234_3)

					arg_231_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1028ui_story.fillRatio = var_234_4
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1028ui_story then
				local var_234_5 = 0.5

				arg_231_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1028ui_story.fillRatio = var_234_5
			end

			local var_234_6 = 0
			local var_234_7 = 0.225

			if var_234_6 < arg_231_1.time_ and arg_231_1.time_ <= var_234_6 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_8 = arg_231_1:FormatText(StoryNameCfg[7].name)

				arg_231_1.leftNameTxt_.text = var_234_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_9 = arg_231_1:GetWordFromCfg(1102805058)
				local var_234_10 = arg_231_1:FormatText(var_234_9.content)

				arg_231_1.text_.text = var_234_10

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_11 = 9
				local var_234_12 = utf8.len(var_234_10)
				local var_234_13 = var_234_11 <= 0 and var_234_7 or var_234_7 * (var_234_12 / var_234_11)

				if var_234_13 > 0 and var_234_7 < var_234_13 then
					arg_231_1.talkMaxDuration = var_234_13

					if var_234_13 + var_234_6 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_13 + var_234_6
					end
				end

				arg_231_1.text_.text = var_234_10
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_14 = math.max(var_234_7, arg_231_1.talkMaxDuration)

			if var_234_6 <= arg_231_1.time_ and arg_231_1.time_ < var_234_6 + var_234_14 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_6) / var_234_14

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_6 + var_234_14 and arg_231_1.time_ < var_234_6 + var_234_14 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 1102805059
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play1102805060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.6

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				local var_238_2 = "play"
				local var_238_3 = "effect"

				arg_235_1:AudioAction(var_238_2, var_238_3, "se_story_123_01", "se_story_123_01_map", "")
			end

			local var_238_4 = 0
			local var_238_5 = 1.35

			if var_238_4 < arg_235_1.time_ and arg_235_1.time_ <= var_238_4 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_6 = arg_235_1:GetWordFromCfg(1102805059)
				local var_238_7 = arg_235_1:FormatText(var_238_6.content)

				arg_235_1.text_.text = var_238_7

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_8 = 54
				local var_238_9 = utf8.len(var_238_7)
				local var_238_10 = var_238_8 <= 0 and var_238_5 or var_238_5 * (var_238_9 / var_238_8)

				if var_238_10 > 0 and var_238_5 < var_238_10 then
					arg_235_1.talkMaxDuration = var_238_10

					if var_238_10 + var_238_4 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_10 + var_238_4
					end
				end

				arg_235_1.text_.text = var_238_7
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_11 = math.max(var_238_5, arg_235_1.talkMaxDuration)

			if var_238_4 <= arg_235_1.time_ and arg_235_1.time_ < var_238_4 + var_238_11 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_4) / var_238_11

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_4 + var_238_11 and arg_235_1.time_ < var_238_4 + var_238_11 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 1102805060
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play1102805061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.125

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[7].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(1102805060)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 5
				local var_242_6 = utf8.len(var_242_4)
				local var_242_7 = var_242_5 <= 0 and var_242_1 or var_242_1 * (var_242_6 / var_242_5)

				if var_242_7 > 0 and var_242_1 < var_242_7 then
					arg_239_1.talkMaxDuration = var_242_7

					if var_242_7 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_7 + var_242_0
					end
				end

				arg_239_1.text_.text = var_242_4
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_8 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_8 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_8

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_8 and arg_239_1.time_ < var_242_0 + var_242_8 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 1102805061
		arg_243_1.duration_ = 7

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play1102805062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1028ui_story"].transform
			local var_246_1 = 0.965999998152256

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1028ui_story = var_246_0.localPosition
			end

			local var_246_2 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2
				local var_246_4 = Vector3.New(0, 100, 0)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1028ui_story, var_246_4, var_246_3)

				local var_246_5 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_5.x, var_246_5.y, var_246_5.z)

				local var_246_6 = var_246_0.localEulerAngles

				var_246_6.z = 0
				var_246_6.x = 0
				var_246_0.localEulerAngles = var_246_6
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(0, 100, 0)

				local var_246_7 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_7.x, var_246_7.y, var_246_7.z)

				local var_246_8 = var_246_0.localEulerAngles

				var_246_8.z = 0
				var_246_8.x = 0
				var_246_0.localEulerAngles = var_246_8
			end

			local var_246_9 = 0

			if var_246_9 < arg_243_1.time_ and arg_243_1.time_ <= var_246_9 + arg_246_0 then
				arg_243_1.mask_.enabled = true
				arg_243_1.mask_.raycastTarget = true

				arg_243_1:SetGaussion(false)
			end

			local var_246_10 = 1

			if var_246_9 <= arg_243_1.time_ and arg_243_1.time_ < var_246_9 + var_246_10 then
				local var_246_11 = (arg_243_1.time_ - var_246_9) / var_246_10
				local var_246_12 = Color.New(0, 0, 0)

				var_246_12.a = Mathf.Lerp(0, 1, var_246_11)
				arg_243_1.mask_.color = var_246_12
			end

			if arg_243_1.time_ >= var_246_9 + var_246_10 and arg_243_1.time_ < var_246_9 + var_246_10 + arg_246_0 then
				local var_246_13 = Color.New(0, 0, 0)

				var_246_13.a = 1
				arg_243_1.mask_.color = var_246_13
			end

			local var_246_14 = 1

			if var_246_14 < arg_243_1.time_ and arg_243_1.time_ <= var_246_14 + arg_246_0 then
				arg_243_1.mask_.enabled = true
				arg_243_1.mask_.raycastTarget = true

				arg_243_1:SetGaussion(false)
			end

			local var_246_15 = 1

			if var_246_14 <= arg_243_1.time_ and arg_243_1.time_ < var_246_14 + var_246_15 then
				local var_246_16 = (arg_243_1.time_ - var_246_14) / var_246_15
				local var_246_17 = Color.New(0, 0, 0)

				var_246_17.a = Mathf.Lerp(1, 0, var_246_16)
				arg_243_1.mask_.color = var_246_17
			end

			if arg_243_1.time_ >= var_246_14 + var_246_15 and arg_243_1.time_ < var_246_14 + var_246_15 + arg_246_0 then
				local var_246_18 = Color.New(0, 0, 0)
				local var_246_19 = 0

				arg_243_1.mask_.enabled = false
				var_246_18.a = var_246_19
				arg_243_1.mask_.color = var_246_18
			end

			if arg_243_1.frameCnt_ <= 1 then
				arg_243_1.dialog_:SetActive(false)
			end

			local var_246_20 = 2
			local var_246_21 = 0.925

			if var_246_20 < arg_243_1.time_ and arg_243_1.time_ <= var_246_20 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0

				arg_243_1.dialog_:SetActive(true)

				local var_246_22 = LeanTween.value(arg_243_1.dialog_, 0, 1, 0.3)

				var_246_22:setOnUpdate(LuaHelper.FloatAction(function(arg_247_0)
					arg_243_1.dialogCg_.alpha = arg_247_0
				end))
				var_246_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_243_1.dialog_)
					var_246_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_243_1.duration_ = arg_243_1.duration_ + 0.3

				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_23 = arg_243_1:GetWordFromCfg(1102805061)
				local var_246_24 = arg_243_1:FormatText(var_246_23.content)

				arg_243_1.text_.text = var_246_24

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_25 = 37
				local var_246_26 = utf8.len(var_246_24)
				local var_246_27 = var_246_25 <= 0 and var_246_21 or var_246_21 * (var_246_26 / var_246_25)

				if var_246_27 > 0 and var_246_21 < var_246_27 then
					arg_243_1.talkMaxDuration = var_246_27
					var_246_20 = var_246_20 + 0.3

					if var_246_27 + var_246_20 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_27 + var_246_20
					end
				end

				arg_243_1.text_.text = var_246_24
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_28 = var_246_20 + 0.3
			local var_246_29 = math.max(var_246_21, arg_243_1.talkMaxDuration)

			if var_246_28 <= arg_243_1.time_ and arg_243_1.time_ < var_246_28 + var_246_29 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_28) / var_246_29

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_28 + var_246_29 and arg_243_1.time_ < var_246_28 + var_246_29 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 1102805062
		arg_249_1.duration_ = 6.4

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play1102805063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1028ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1028ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0, -0.9, -5.9)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1028ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = arg_249_1.actors_["1028ui_story"]
			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 and arg_249_1.var_.characterEffect1028ui_story == nil then
				arg_249_1.var_.characterEffect1028ui_story = var_252_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_11 = 0.200000002980232

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_11 then
				local var_252_12 = (arg_249_1.time_ - var_252_10) / var_252_11

				if arg_249_1.var_.characterEffect1028ui_story then
					arg_249_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_10 + var_252_11 and arg_249_1.time_ < var_252_10 + var_252_11 + arg_252_0 and arg_249_1.var_.characterEffect1028ui_story then
				arg_249_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_252_13 = 0

			if var_252_13 < arg_249_1.time_ and arg_249_1.time_ <= var_252_13 + arg_252_0 then
				arg_249_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 then
				arg_249_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_252_15 = 0
			local var_252_16 = 0.45

			if var_252_15 < arg_249_1.time_ and arg_249_1.time_ <= var_252_15 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_17 = arg_249_1:FormatText(StoryNameCfg[327].name)

				arg_249_1.leftNameTxt_.text = var_252_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_18 = arg_249_1:GetWordFromCfg(1102805062)
				local var_252_19 = arg_249_1:FormatText(var_252_18.content)

				arg_249_1.text_.text = var_252_19

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_20 = 18
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805062", "story_v_side_new_1102805.awb") ~= 0 then
					local var_252_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805062", "story_v_side_new_1102805.awb") / 1000

					if var_252_23 + var_252_15 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_23 + var_252_15
					end

					if var_252_18.prefab_name ~= "" and arg_249_1.actors_[var_252_18.prefab_name] ~= nil then
						local var_252_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_18.prefab_name].transform, "story_v_side_new_1102805", "1102805062", "story_v_side_new_1102805.awb")

						arg_249_1:RecordAudio("1102805062", var_252_24)
						arg_249_1:RecordAudio("1102805062", var_252_24)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805062", "story_v_side_new_1102805.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805062", "story_v_side_new_1102805.awb")
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
	Play1102805063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 1102805063
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play1102805064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1028ui_story"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1028ui_story = var_256_0.localPosition
			end

			local var_256_2 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2
				local var_256_4 = Vector3.New(0, 100, 0)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1028ui_story, var_256_4, var_256_3)

				local var_256_5 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_5.x, var_256_5.y, var_256_5.z)

				local var_256_6 = var_256_0.localEulerAngles

				var_256_6.z = 0
				var_256_6.x = 0
				var_256_0.localEulerAngles = var_256_6
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(0, 100, 0)

				local var_256_7 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_7.x, var_256_7.y, var_256_7.z)

				local var_256_8 = var_256_0.localEulerAngles

				var_256_8.z = 0
				var_256_8.x = 0
				var_256_0.localEulerAngles = var_256_8
			end

			local var_256_9 = arg_253_1.actors_["1028ui_story"]
			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 and arg_253_1.var_.characterEffect1028ui_story == nil then
				arg_253_1.var_.characterEffect1028ui_story = var_256_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_11 = 0.200000002980232

			if var_256_10 <= arg_253_1.time_ and arg_253_1.time_ < var_256_10 + var_256_11 then
				local var_256_12 = (arg_253_1.time_ - var_256_10) / var_256_11

				if arg_253_1.var_.characterEffect1028ui_story then
					local var_256_13 = Mathf.Lerp(0, 0.5, var_256_12)

					arg_253_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1028ui_story.fillRatio = var_256_13
				end
			end

			if arg_253_1.time_ >= var_256_10 + var_256_11 and arg_253_1.time_ < var_256_10 + var_256_11 + arg_256_0 and arg_253_1.var_.characterEffect1028ui_story then
				local var_256_14 = 0.5

				arg_253_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1028ui_story.fillRatio = var_256_14
			end

			local var_256_15 = 0
			local var_256_16 = 0.2

			if var_256_15 < arg_253_1.time_ and arg_253_1.time_ <= var_256_15 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_17 = arg_253_1:FormatText(StoryNameCfg[7].name)

				arg_253_1.leftNameTxt_.text = var_256_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_18 = arg_253_1:GetWordFromCfg(1102805063)
				local var_256_19 = arg_253_1:FormatText(var_256_18.content)

				arg_253_1.text_.text = var_256_19

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_20 = 8
				local var_256_21 = utf8.len(var_256_19)
				local var_256_22 = var_256_20 <= 0 and var_256_16 or var_256_16 * (var_256_21 / var_256_20)

				if var_256_22 > 0 and var_256_16 < var_256_22 then
					arg_253_1.talkMaxDuration = var_256_22

					if var_256_22 + var_256_15 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_22 + var_256_15
					end
				end

				arg_253_1.text_.text = var_256_19
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_23 = math.max(var_256_16, arg_253_1.talkMaxDuration)

			if var_256_15 <= arg_253_1.time_ and arg_253_1.time_ < var_256_15 + var_256_23 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_15) / var_256_23

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_15 + var_256_23 and arg_253_1.time_ < var_256_15 + var_256_23 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 1102805064
		arg_257_1.duration_ = 7

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play1102805065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = "STblack"

			if arg_257_1.bgs_[var_260_0] == nil then
				local var_260_1 = Object.Instantiate(arg_257_1.paintGo_)

				var_260_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_260_0)
				var_260_1.name = var_260_0
				var_260_1.transform.parent = arg_257_1.stage_.transform
				var_260_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_257_1.bgs_[var_260_0] = var_260_1
			end

			local var_260_2 = 1

			if var_260_2 < arg_257_1.time_ and arg_257_1.time_ <= var_260_2 + arg_260_0 then
				local var_260_3 = manager.ui.mainCamera.transform.localPosition
				local var_260_4 = Vector3.New(0, 0, 10) + Vector3.New(var_260_3.x, var_260_3.y, 0)
				local var_260_5 = arg_257_1.bgs_.STblack

				var_260_5.transform.localPosition = var_260_4
				var_260_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_260_6 = var_260_5:GetComponent("SpriteRenderer")

				if var_260_6 and var_260_6.sprite then
					local var_260_7 = (var_260_5.transform.localPosition - var_260_3).z
					local var_260_8 = manager.ui.mainCameraCom_
					local var_260_9 = 2 * var_260_7 * Mathf.Tan(var_260_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_260_10 = var_260_9 * var_260_8.aspect
					local var_260_11 = var_260_6.sprite.bounds.size.x
					local var_260_12 = var_260_6.sprite.bounds.size.y
					local var_260_13 = var_260_10 / var_260_11
					local var_260_14 = var_260_9 / var_260_12
					local var_260_15 = var_260_14 < var_260_13 and var_260_13 or var_260_14

					var_260_5.transform.localScale = Vector3.New(var_260_15, var_260_15, 0)
				end

				for iter_260_0, iter_260_1 in pairs(arg_257_1.bgs_) do
					if iter_260_0 ~= "STblack" then
						iter_260_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_260_16 = 0

			if var_260_16 < arg_257_1.time_ and arg_257_1.time_ <= var_260_16 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_17 = 1

			if var_260_16 <= arg_257_1.time_ and arg_257_1.time_ < var_260_16 + var_260_17 then
				local var_260_18 = (arg_257_1.time_ - var_260_16) / var_260_17
				local var_260_19 = Color.New(1, 1, 1)

				var_260_19.a = Mathf.Lerp(0, 1, var_260_18)
				arg_257_1.mask_.color = var_260_19
			end

			if arg_257_1.time_ >= var_260_16 + var_260_17 and arg_257_1.time_ < var_260_16 + var_260_17 + arg_260_0 then
				local var_260_20 = Color.New(1, 1, 1)

				var_260_20.a = 1
				arg_257_1.mask_.color = var_260_20
			end

			local var_260_21 = 1

			if var_260_21 < arg_257_1.time_ and arg_257_1.time_ <= var_260_21 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_22 = 1

			if var_260_21 <= arg_257_1.time_ and arg_257_1.time_ < var_260_21 + var_260_22 then
				local var_260_23 = (arg_257_1.time_ - var_260_21) / var_260_22
				local var_260_24 = Color.New(1, 1, 1)

				var_260_24.a = Mathf.Lerp(1, 0, var_260_23)
				arg_257_1.mask_.color = var_260_24
			end

			if arg_257_1.time_ >= var_260_21 + var_260_22 and arg_257_1.time_ < var_260_21 + var_260_22 + arg_260_0 then
				local var_260_25 = Color.New(1, 1, 1)
				local var_260_26 = 0

				arg_257_1.mask_.enabled = false
				var_260_25.a = var_260_26
				arg_257_1.mask_.color = var_260_25
			end

			local var_260_27 = 0
			local var_260_28 = 0.6

			if var_260_27 < arg_257_1.time_ and arg_257_1.time_ <= var_260_27 + arg_260_0 then
				local var_260_29 = "play"
				local var_260_30 = "effect"

				arg_257_1:AudioAction(var_260_29, var_260_30, "se_story_side_1028", "se_story_side_1028_ui", "")
			end

			local var_260_31 = 0
			local var_260_32 = 0.6

			if var_260_31 < arg_257_1.time_ and arg_257_1.time_ <= var_260_31 + arg_260_0 then
				local var_260_33 = "play"
				local var_260_34 = "music"

				arg_257_1:AudioAction(var_260_33, var_260_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_257_1.frameCnt_ <= 1 then
				arg_257_1.dialog_:SetActive(false)
			end

			local var_260_35 = 2
			local var_260_36 = 0.925

			if var_260_35 < arg_257_1.time_ and arg_257_1.time_ <= var_260_35 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0

				arg_257_1.dialog_:SetActive(true)

				local var_260_37 = LeanTween.value(arg_257_1.dialog_, 0, 1, 0.3)

				var_260_37:setOnUpdate(LuaHelper.FloatAction(function(arg_261_0)
					arg_257_1.dialogCg_.alpha = arg_261_0
				end))
				var_260_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_257_1.dialog_)
					var_260_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_257_1.duration_ = arg_257_1.duration_ + 0.3

				SetActive(arg_257_1.leftNameGo_, false)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_38 = arg_257_1:GetWordFromCfg(1102805064)
				local var_260_39 = arg_257_1:FormatText(var_260_38.content)

				arg_257_1.text_.text = var_260_39

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_40 = 37
				local var_260_41 = utf8.len(var_260_39)
				local var_260_42 = var_260_40 <= 0 and var_260_36 or var_260_36 * (var_260_41 / var_260_40)

				if var_260_42 > 0 and var_260_36 < var_260_42 then
					arg_257_1.talkMaxDuration = var_260_42
					var_260_35 = var_260_35 + 0.3

					if var_260_42 + var_260_35 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_42 + var_260_35
					end
				end

				arg_257_1.text_.text = var_260_39
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_43 = var_260_35 + 0.3
			local var_260_44 = math.max(var_260_36, arg_257_1.talkMaxDuration)

			if var_260_43 <= arg_257_1.time_ and arg_257_1.time_ < var_260_43 + var_260_44 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_43) / var_260_44

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_43 + var_260_44 and arg_257_1.time_ < var_260_43 + var_260_44 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 1102805065
		arg_263_1.duration_ = 1.999999999999

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play1102805066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1028ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1028ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(0, -0.9, -5.9)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1028ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["1028ui_story"]
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 and arg_263_1.var_.characterEffect1028ui_story == nil then
				arg_263_1.var_.characterEffect1028ui_story = var_266_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_11 = 0.200000002980232

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_10) / var_266_11

				if arg_263_1.var_.characterEffect1028ui_story then
					arg_263_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_10 + var_266_11 and arg_263_1.time_ < var_266_10 + var_266_11 + arg_266_0 and arg_263_1.var_.characterEffect1028ui_story then
				arg_263_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_266_13 = 0

			if var_266_13 < arg_263_1.time_ and arg_263_1.time_ <= var_266_13 + arg_266_0 then
				arg_263_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_266_15 = 0
			local var_266_16 = 0.6

			if var_266_15 < arg_263_1.time_ and arg_263_1.time_ <= var_266_15 + arg_266_0 then
				local var_266_17 = "play"
				local var_266_18 = "music"

				arg_263_1:AudioAction(var_266_17, var_266_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_266_19 = 0.8
			local var_266_20 = 1

			if var_266_19 < arg_263_1.time_ and arg_263_1.time_ <= var_266_19 + arg_266_0 then
				local var_266_21 = "play"
				local var_266_22 = "music"

				arg_263_1:AudioAction(var_266_21, var_266_22, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			local var_266_23 = 0
			local var_266_24 = 0.15

			if var_266_23 < arg_263_1.time_ and arg_263_1.time_ <= var_266_23 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_25 = arg_263_1:FormatText(StoryNameCfg[327].name)

				arg_263_1.leftNameTxt_.text = var_266_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_26 = arg_263_1:GetWordFromCfg(1102805065)
				local var_266_27 = arg_263_1:FormatText(var_266_26.content)

				arg_263_1.text_.text = var_266_27

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_28 = 6
				local var_266_29 = utf8.len(var_266_27)
				local var_266_30 = var_266_28 <= 0 and var_266_24 or var_266_24 * (var_266_29 / var_266_28)

				if var_266_30 > 0 and var_266_24 < var_266_30 then
					arg_263_1.talkMaxDuration = var_266_30

					if var_266_30 + var_266_23 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_30 + var_266_23
					end
				end

				arg_263_1.text_.text = var_266_27
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805065", "story_v_side_new_1102805.awb") ~= 0 then
					local var_266_31 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805065", "story_v_side_new_1102805.awb") / 1000

					if var_266_31 + var_266_23 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_31 + var_266_23
					end

					if var_266_26.prefab_name ~= "" and arg_263_1.actors_[var_266_26.prefab_name] ~= nil then
						local var_266_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_26.prefab_name].transform, "story_v_side_new_1102805", "1102805065", "story_v_side_new_1102805.awb")

						arg_263_1:RecordAudio("1102805065", var_266_32)
						arg_263_1:RecordAudio("1102805065", var_266_32)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805065", "story_v_side_new_1102805.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805065", "story_v_side_new_1102805.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_33 = math.max(var_266_24, arg_263_1.talkMaxDuration)

			if var_266_23 <= arg_263_1.time_ and arg_263_1.time_ < var_266_23 + var_266_33 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_23) / var_266_33

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_23 + var_266_33 and arg_263_1.time_ < var_266_23 + var_266_33 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 1102805066
		arg_267_1.duration_ = 8

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play1102805067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = "B04e"

			if arg_267_1.bgs_[var_270_0] == nil then
				local var_270_1 = Object.Instantiate(arg_267_1.paintGo_)

				var_270_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_270_0)
				var_270_1.name = var_270_0
				var_270_1.transform.parent = arg_267_1.stage_.transform
				var_270_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_267_1.bgs_[var_270_0] = var_270_1
			end

			local var_270_2 = 0

			if var_270_2 < arg_267_1.time_ and arg_267_1.time_ <= var_270_2 + arg_270_0 then
				local var_270_3 = manager.ui.mainCamera.transform.localPosition
				local var_270_4 = Vector3.New(0, 0, 10) + Vector3.New(var_270_3.x, var_270_3.y, 0)
				local var_270_5 = arg_267_1.bgs_.B04e

				var_270_5.transform.localPosition = var_270_4
				var_270_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_270_6 = var_270_5:GetComponent("SpriteRenderer")

				if var_270_6 and var_270_6.sprite then
					local var_270_7 = (var_270_5.transform.localPosition - var_270_3).z
					local var_270_8 = manager.ui.mainCameraCom_
					local var_270_9 = 2 * var_270_7 * Mathf.Tan(var_270_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_270_10 = var_270_9 * var_270_8.aspect
					local var_270_11 = var_270_6.sprite.bounds.size.x
					local var_270_12 = var_270_6.sprite.bounds.size.y
					local var_270_13 = var_270_10 / var_270_11
					local var_270_14 = var_270_9 / var_270_12
					local var_270_15 = var_270_14 < var_270_13 and var_270_13 or var_270_14

					var_270_5.transform.localScale = Vector3.New(var_270_15, var_270_15, 0)
				end

				for iter_270_0, iter_270_1 in pairs(arg_267_1.bgs_) do
					if iter_270_0 ~= "B04e" then
						iter_270_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_270_16 = 0

			if var_270_16 < arg_267_1.time_ and arg_267_1.time_ <= var_270_16 + arg_270_0 then
				arg_267_1.mask_.enabled = true
				arg_267_1.mask_.raycastTarget = true

				arg_267_1:SetGaussion(false)
			end

			local var_270_17 = 3

			if var_270_16 <= arg_267_1.time_ and arg_267_1.time_ < var_270_16 + var_270_17 then
				local var_270_18 = (arg_267_1.time_ - var_270_16) / var_270_17
				local var_270_19 = Color.New(1, 1, 1)

				var_270_19.a = Mathf.Lerp(1, 0, var_270_18)
				arg_267_1.mask_.color = var_270_19
			end

			if arg_267_1.time_ >= var_270_16 + var_270_17 and arg_267_1.time_ < var_270_16 + var_270_17 + arg_270_0 then
				local var_270_20 = Color.New(1, 1, 1)
				local var_270_21 = 0

				arg_267_1.mask_.enabled = false
				var_270_20.a = var_270_21
				arg_267_1.mask_.color = var_270_20
			end

			local var_270_22 = arg_267_1.actors_["1028ui_story"].transform
			local var_270_23 = 0

			if var_270_23 < arg_267_1.time_ and arg_267_1.time_ <= var_270_23 + arg_270_0 then
				arg_267_1.var_.moveOldPos1028ui_story = var_270_22.localPosition
			end

			local var_270_24 = 0.001

			if var_270_23 <= arg_267_1.time_ and arg_267_1.time_ < var_270_23 + var_270_24 then
				local var_270_25 = (arg_267_1.time_ - var_270_23) / var_270_24
				local var_270_26 = Vector3.New(0, 100, 0)

				var_270_22.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1028ui_story, var_270_26, var_270_25)

				local var_270_27 = manager.ui.mainCamera.transform.position - var_270_22.position

				var_270_22.forward = Vector3.New(var_270_27.x, var_270_27.y, var_270_27.z)

				local var_270_28 = var_270_22.localEulerAngles

				var_270_28.z = 0
				var_270_28.x = 0
				var_270_22.localEulerAngles = var_270_28
			end

			if arg_267_1.time_ >= var_270_23 + var_270_24 and arg_267_1.time_ < var_270_23 + var_270_24 + arg_270_0 then
				var_270_22.localPosition = Vector3.New(0, 100, 0)

				local var_270_29 = manager.ui.mainCamera.transform.position - var_270_22.position

				var_270_22.forward = Vector3.New(var_270_29.x, var_270_29.y, var_270_29.z)

				local var_270_30 = var_270_22.localEulerAngles

				var_270_30.z = 0
				var_270_30.x = 0
				var_270_22.localEulerAngles = var_270_30
			end

			if arg_267_1.frameCnt_ <= 1 then
				arg_267_1.dialog_:SetActive(false)
			end

			local var_270_31 = 3
			local var_270_32 = 0.25

			if var_270_31 < arg_267_1.time_ and arg_267_1.time_ <= var_270_31 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0

				arg_267_1.dialog_:SetActive(true)

				local var_270_33 = LeanTween.value(arg_267_1.dialog_, 0, 1, 0.3)

				var_270_33:setOnUpdate(LuaHelper.FloatAction(function(arg_271_0)
					arg_267_1.dialogCg_.alpha = arg_271_0
				end))
				var_270_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_267_1.dialog_)
					var_270_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_267_1.duration_ = arg_267_1.duration_ + 0.3

				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_34 = arg_267_1:FormatText(StoryNameCfg[7].name)

				arg_267_1.leftNameTxt_.text = var_270_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_35 = arg_267_1:GetWordFromCfg(1102805066)
				local var_270_36 = arg_267_1:FormatText(var_270_35.content)

				arg_267_1.text_.text = var_270_36

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_37 = 10
				local var_270_38 = utf8.len(var_270_36)
				local var_270_39 = var_270_37 <= 0 and var_270_32 or var_270_32 * (var_270_38 / var_270_37)

				if var_270_39 > 0 and var_270_32 < var_270_39 then
					arg_267_1.talkMaxDuration = var_270_39
					var_270_31 = var_270_31 + 0.3

					if var_270_39 + var_270_31 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_39 + var_270_31
					end
				end

				arg_267_1.text_.text = var_270_36
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_40 = var_270_31 + 0.3
			local var_270_41 = math.max(var_270_32, arg_267_1.talkMaxDuration)

			if var_270_40 <= arg_267_1.time_ and arg_267_1.time_ < var_270_40 + var_270_41 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_40) / var_270_41

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_40 + var_270_41 and arg_267_1.time_ < var_270_40 + var_270_41 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 1102805067
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play1102805068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.55

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_2 = arg_273_1:GetWordFromCfg(1102805067)
				local var_276_3 = arg_273_1:FormatText(var_276_2.content)

				arg_273_1.text_.text = var_276_3

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_4 = 22
				local var_276_5 = utf8.len(var_276_3)
				local var_276_6 = var_276_4 <= 0 and var_276_1 or var_276_1 * (var_276_5 / var_276_4)

				if var_276_6 > 0 and var_276_1 < var_276_6 then
					arg_273_1.talkMaxDuration = var_276_6

					if var_276_6 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_6 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_3
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_7 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_7 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_7

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_7 and arg_273_1.time_ < var_276_0 + var_276_7 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 1102805068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play1102805069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.25

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[7].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(1102805068)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 10
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
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_8 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_8 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_8

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_8 and arg_277_1.time_ < var_280_0 + var_280_8 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 1102805069
		arg_281_1.duration_ = 1.999999999999

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play1102805070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1028ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos1028ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(0, -0.9, -5.9)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1028ui_story, var_284_4, var_284_3)

				local var_284_5 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_5.x, var_284_5.y, var_284_5.z)

				local var_284_6 = var_284_0.localEulerAngles

				var_284_6.z = 0
				var_284_6.x = 0
				var_284_0.localEulerAngles = var_284_6
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_284_7 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_7.x, var_284_7.y, var_284_7.z)

				local var_284_8 = var_284_0.localEulerAngles

				var_284_8.z = 0
				var_284_8.x = 0
				var_284_0.localEulerAngles = var_284_8
			end

			local var_284_9 = arg_281_1.actors_["1028ui_story"]
			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 and arg_281_1.var_.characterEffect1028ui_story == nil then
				arg_281_1.var_.characterEffect1028ui_story = var_284_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_11 = 0.200000002980232

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_11 then
				local var_284_12 = (arg_281_1.time_ - var_284_10) / var_284_11

				if arg_281_1.var_.characterEffect1028ui_story then
					arg_281_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_10 + var_284_11 and arg_281_1.time_ < var_284_10 + var_284_11 + arg_284_0 and arg_281_1.var_.characterEffect1028ui_story then
				arg_281_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_284_13 = 0

			if var_284_13 < arg_281_1.time_ and arg_281_1.time_ <= var_284_13 + arg_284_0 then
				arg_281_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_284_14 = 0

			if var_284_14 < arg_281_1.time_ and arg_281_1.time_ <= var_284_14 + arg_284_0 then
				arg_281_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_284_15 = 0
			local var_284_16 = 0.25

			if var_284_15 < arg_281_1.time_ and arg_281_1.time_ <= var_284_15 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_17 = arg_281_1:FormatText(StoryNameCfg[327].name)

				arg_281_1.leftNameTxt_.text = var_284_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_18 = arg_281_1:GetWordFromCfg(1102805069)
				local var_284_19 = arg_281_1:FormatText(var_284_18.content)

				arg_281_1.text_.text = var_284_19

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_20 = 10
				local var_284_21 = utf8.len(var_284_19)
				local var_284_22 = var_284_20 <= 0 and var_284_16 or var_284_16 * (var_284_21 / var_284_20)

				if var_284_22 > 0 and var_284_16 < var_284_22 then
					arg_281_1.talkMaxDuration = var_284_22

					if var_284_22 + var_284_15 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_22 + var_284_15
					end
				end

				arg_281_1.text_.text = var_284_19
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805069", "story_v_side_new_1102805.awb") ~= 0 then
					local var_284_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805069", "story_v_side_new_1102805.awb") / 1000

					if var_284_23 + var_284_15 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_23 + var_284_15
					end

					if var_284_18.prefab_name ~= "" and arg_281_1.actors_[var_284_18.prefab_name] ~= nil then
						local var_284_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_18.prefab_name].transform, "story_v_side_new_1102805", "1102805069", "story_v_side_new_1102805.awb")

						arg_281_1:RecordAudio("1102805069", var_284_24)
						arg_281_1:RecordAudio("1102805069", var_284_24)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805069", "story_v_side_new_1102805.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805069", "story_v_side_new_1102805.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_25 = math.max(var_284_16, arg_281_1.talkMaxDuration)

			if var_284_15 <= arg_281_1.time_ and arg_281_1.time_ < var_284_15 + var_284_25 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_15) / var_284_25

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_15 + var_284_25 and arg_281_1.time_ < var_284_15 + var_284_25 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 1102805070
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play1102805071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1028ui_story"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and arg_285_1.var_.characterEffect1028ui_story == nil then
				arg_285_1.var_.characterEffect1028ui_story = var_288_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_2 = 0.200000002980232

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.characterEffect1028ui_story then
					local var_288_4 = Mathf.Lerp(0, 0.5, var_288_3)

					arg_285_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_285_1.var_.characterEffect1028ui_story.fillRatio = var_288_4
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and arg_285_1.var_.characterEffect1028ui_story then
				local var_288_5 = 0.5

				arg_285_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_285_1.var_.characterEffect1028ui_story.fillRatio = var_288_5
			end

			local var_288_6 = arg_285_1.actors_["1028ui_story"].transform
			local var_288_7 = 0

			if var_288_7 < arg_285_1.time_ and arg_285_1.time_ <= var_288_7 + arg_288_0 then
				arg_285_1.var_.moveOldPos1028ui_story = var_288_6.localPosition
			end

			local var_288_8 = 0.001

			if var_288_7 <= arg_285_1.time_ and arg_285_1.time_ < var_288_7 + var_288_8 then
				local var_288_9 = (arg_285_1.time_ - var_288_7) / var_288_8
				local var_288_10 = Vector3.New(0, 100, 0)

				var_288_6.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1028ui_story, var_288_10, var_288_9)

				local var_288_11 = manager.ui.mainCamera.transform.position - var_288_6.position

				var_288_6.forward = Vector3.New(var_288_11.x, var_288_11.y, var_288_11.z)

				local var_288_12 = var_288_6.localEulerAngles

				var_288_12.z = 0
				var_288_12.x = 0
				var_288_6.localEulerAngles = var_288_12
			end

			if arg_285_1.time_ >= var_288_7 + var_288_8 and arg_285_1.time_ < var_288_7 + var_288_8 + arg_288_0 then
				var_288_6.localPosition = Vector3.New(0, 100, 0)

				local var_288_13 = manager.ui.mainCamera.transform.position - var_288_6.position

				var_288_6.forward = Vector3.New(var_288_13.x, var_288_13.y, var_288_13.z)

				local var_288_14 = var_288_6.localEulerAngles

				var_288_14.z = 0
				var_288_14.x = 0
				var_288_6.localEulerAngles = var_288_14
			end

			local var_288_15 = 0
			local var_288_16 = 0.225

			if var_288_15 < arg_285_1.time_ and arg_285_1.time_ <= var_288_15 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_17 = arg_285_1:FormatText(StoryNameCfg[7].name)

				arg_285_1.leftNameTxt_.text = var_288_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_18 = arg_285_1:GetWordFromCfg(1102805070)
				local var_288_19 = arg_285_1:FormatText(var_288_18.content)

				arg_285_1.text_.text = var_288_19

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_20 = 9
				local var_288_21 = utf8.len(var_288_19)
				local var_288_22 = var_288_20 <= 0 and var_288_16 or var_288_16 * (var_288_21 / var_288_20)

				if var_288_22 > 0 and var_288_16 < var_288_22 then
					arg_285_1.talkMaxDuration = var_288_22

					if var_288_22 + var_288_15 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_22 + var_288_15
					end
				end

				arg_285_1.text_.text = var_288_19
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_23 = math.max(var_288_16, arg_285_1.talkMaxDuration)

			if var_288_15 <= arg_285_1.time_ and arg_285_1.time_ < var_288_15 + var_288_23 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_15) / var_288_23

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_15 + var_288_23 and arg_285_1.time_ < var_288_15 + var_288_23 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 1102805071
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play1102805072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 1.3

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_2 = arg_289_1:GetWordFromCfg(1102805071)
				local var_292_3 = arg_289_1:FormatText(var_292_2.content)

				arg_289_1.text_.text = var_292_3

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_4 = 52
				local var_292_5 = utf8.len(var_292_3)
				local var_292_6 = var_292_4 <= 0 and var_292_1 or var_292_1 * (var_292_5 / var_292_4)

				if var_292_6 > 0 and var_292_1 < var_292_6 then
					arg_289_1.talkMaxDuration = var_292_6

					if var_292_6 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_6 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_3
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_7 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_7 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_7

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_7 and arg_289_1.time_ < var_292_0 + var_292_7 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 1102805072
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play1102805073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 1.25

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[7].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(1102805072)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 50
				local var_296_6 = utf8.len(var_296_4)
				local var_296_7 = var_296_5 <= 0 and var_296_1 or var_296_1 * (var_296_6 / var_296_5)

				if var_296_7 > 0 and var_296_1 < var_296_7 then
					arg_293_1.talkMaxDuration = var_296_7

					if var_296_7 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_7 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_4
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_8 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_8 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_8

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_8 and arg_293_1.time_ < var_296_0 + var_296_8 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 1102805073
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play1102805074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.3

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[7].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(1102805073)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 12
				local var_300_6 = utf8.len(var_300_4)
				local var_300_7 = var_300_5 <= 0 and var_300_1 or var_300_1 * (var_300_6 / var_300_5)

				if var_300_7 > 0 and var_300_1 < var_300_7 then
					arg_297_1.talkMaxDuration = var_300_7

					if var_300_7 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_7 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_4
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_8 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_8 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_8

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_8 and arg_297_1.time_ < var_300_0 + var_300_8 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 1102805074
		arg_301_1.duration_ = 4.166

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play1102805075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1028ui_story"].transform
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1.var_.moveOldPos1028ui_story = var_304_0.localPosition
			end

			local var_304_2 = 0.001

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2
				local var_304_4 = Vector3.New(0, -0.9, -5.9)

				var_304_0.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1028ui_story, var_304_4, var_304_3)

				local var_304_5 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_5.x, var_304_5.y, var_304_5.z)

				local var_304_6 = var_304_0.localEulerAngles

				var_304_6.z = 0
				var_304_6.x = 0
				var_304_0.localEulerAngles = var_304_6
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 then
				var_304_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_304_7 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_7.x, var_304_7.y, var_304_7.z)

				local var_304_8 = var_304_0.localEulerAngles

				var_304_8.z = 0
				var_304_8.x = 0
				var_304_0.localEulerAngles = var_304_8
			end

			local var_304_9 = arg_301_1.actors_["1028ui_story"]
			local var_304_10 = 0

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 and arg_301_1.var_.characterEffect1028ui_story == nil then
				arg_301_1.var_.characterEffect1028ui_story = var_304_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_11 = 0.200000002980232

			if var_304_10 <= arg_301_1.time_ and arg_301_1.time_ < var_304_10 + var_304_11 then
				local var_304_12 = (arg_301_1.time_ - var_304_10) / var_304_11

				if arg_301_1.var_.characterEffect1028ui_story then
					arg_301_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_10 + var_304_11 and arg_301_1.time_ < var_304_10 + var_304_11 + arg_304_0 and arg_301_1.var_.characterEffect1028ui_story then
				arg_301_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_304_13 = 0

			if var_304_13 < arg_301_1.time_ and arg_301_1.time_ <= var_304_13 + arg_304_0 then
				arg_301_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_304_14 = 0

			if var_304_14 < arg_301_1.time_ and arg_301_1.time_ <= var_304_14 + arg_304_0 then
				arg_301_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_304_15 = 0
			local var_304_16 = 0.525

			if var_304_15 < arg_301_1.time_ and arg_301_1.time_ <= var_304_15 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_17 = arg_301_1:FormatText(StoryNameCfg[327].name)

				arg_301_1.leftNameTxt_.text = var_304_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_18 = arg_301_1:GetWordFromCfg(1102805074)
				local var_304_19 = arg_301_1:FormatText(var_304_18.content)

				arg_301_1.text_.text = var_304_19

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_20 = 21
				local var_304_21 = utf8.len(var_304_19)
				local var_304_22 = var_304_20 <= 0 and var_304_16 or var_304_16 * (var_304_21 / var_304_20)

				if var_304_22 > 0 and var_304_16 < var_304_22 then
					arg_301_1.talkMaxDuration = var_304_22

					if var_304_22 + var_304_15 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_22 + var_304_15
					end
				end

				arg_301_1.text_.text = var_304_19
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805074", "story_v_side_new_1102805.awb") ~= 0 then
					local var_304_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805074", "story_v_side_new_1102805.awb") / 1000

					if var_304_23 + var_304_15 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_23 + var_304_15
					end

					if var_304_18.prefab_name ~= "" and arg_301_1.actors_[var_304_18.prefab_name] ~= nil then
						local var_304_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_18.prefab_name].transform, "story_v_side_new_1102805", "1102805074", "story_v_side_new_1102805.awb")

						arg_301_1:RecordAudio("1102805074", var_304_24)
						arg_301_1:RecordAudio("1102805074", var_304_24)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805074", "story_v_side_new_1102805.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805074", "story_v_side_new_1102805.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_25 = math.max(var_304_16, arg_301_1.talkMaxDuration)

			if var_304_15 <= arg_301_1.time_ and arg_301_1.time_ < var_304_15 + var_304_25 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_15) / var_304_25

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_15 + var_304_25 and arg_301_1.time_ < var_304_15 + var_304_25 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 1102805075
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play1102805076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1028ui_story"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos1028ui_story = var_308_0.localPosition
			end

			local var_308_2 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2
				local var_308_4 = Vector3.New(0, 100, 0)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1028ui_story, var_308_4, var_308_3)

				local var_308_5 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_5.x, var_308_5.y, var_308_5.z)

				local var_308_6 = var_308_0.localEulerAngles

				var_308_6.z = 0
				var_308_6.x = 0
				var_308_0.localEulerAngles = var_308_6
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(0, 100, 0)

				local var_308_7 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_7.x, var_308_7.y, var_308_7.z)

				local var_308_8 = var_308_0.localEulerAngles

				var_308_8.z = 0
				var_308_8.x = 0
				var_308_0.localEulerAngles = var_308_8
			end

			local var_308_9 = arg_305_1.actors_["1028ui_story"]
			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 and arg_305_1.var_.characterEffect1028ui_story == nil then
				arg_305_1.var_.characterEffect1028ui_story = var_308_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_11 = 0.200000002980232

			if var_308_10 <= arg_305_1.time_ and arg_305_1.time_ < var_308_10 + var_308_11 then
				local var_308_12 = (arg_305_1.time_ - var_308_10) / var_308_11

				if arg_305_1.var_.characterEffect1028ui_story then
					local var_308_13 = Mathf.Lerp(0, 0.5, var_308_12)

					arg_305_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_305_1.var_.characterEffect1028ui_story.fillRatio = var_308_13
				end
			end

			if arg_305_1.time_ >= var_308_10 + var_308_11 and arg_305_1.time_ < var_308_10 + var_308_11 + arg_308_0 and arg_305_1.var_.characterEffect1028ui_story then
				local var_308_14 = 0.5

				arg_305_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_305_1.var_.characterEffect1028ui_story.fillRatio = var_308_14
			end

			local var_308_15 = 0
			local var_308_16 = 1.075

			if var_308_15 < arg_305_1.time_ and arg_305_1.time_ <= var_308_15 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, false)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_17 = arg_305_1:GetWordFromCfg(1102805075)
				local var_308_18 = arg_305_1:FormatText(var_308_17.content)

				arg_305_1.text_.text = var_308_18

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_19 = 43
				local var_308_20 = utf8.len(var_308_18)
				local var_308_21 = var_308_19 <= 0 and var_308_16 or var_308_16 * (var_308_20 / var_308_19)

				if var_308_21 > 0 and var_308_16 < var_308_21 then
					arg_305_1.talkMaxDuration = var_308_21

					if var_308_21 + var_308_15 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_21 + var_308_15
					end
				end

				arg_305_1.text_.text = var_308_18
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_22 = math.max(var_308_16, arg_305_1.talkMaxDuration)

			if var_308_15 <= arg_305_1.time_ and arg_305_1.time_ < var_308_15 + var_308_22 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_15) / var_308_22

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_15 + var_308_22 and arg_305_1.time_ < var_308_15 + var_308_22 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 1102805076
		arg_309_1.duration_ = 5

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play1102805077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0
			local var_312_1 = 0.45

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_2 = arg_309_1:FormatText(StoryNameCfg[7].name)

				arg_309_1.leftNameTxt_.text = var_312_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_3 = arg_309_1:GetWordFromCfg(1102805076)
				local var_312_4 = arg_309_1:FormatText(var_312_3.content)

				arg_309_1.text_.text = var_312_4

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_5 = 18
				local var_312_6 = utf8.len(var_312_4)
				local var_312_7 = var_312_5 <= 0 and var_312_1 or var_312_1 * (var_312_6 / var_312_5)

				if var_312_7 > 0 and var_312_1 < var_312_7 then
					arg_309_1.talkMaxDuration = var_312_7

					if var_312_7 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_7 + var_312_0
					end
				end

				arg_309_1.text_.text = var_312_4
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_8 = math.max(var_312_1, arg_309_1.talkMaxDuration)

			if var_312_0 <= arg_309_1.time_ and arg_309_1.time_ < var_312_0 + var_312_8 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_0) / var_312_8

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_0 + var_312_8 and arg_309_1.time_ < var_312_0 + var_312_8 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 1102805077
		arg_313_1.duration_ = 1.966

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play1102805078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1028ui_story"].transform
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 then
				arg_313_1.var_.moveOldPos1028ui_story = var_316_0.localPosition
			end

			local var_316_2 = 0.001

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2
				local var_316_4 = Vector3.New(0, -0.9, -5.9)

				var_316_0.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos1028ui_story, var_316_4, var_316_3)

				local var_316_5 = manager.ui.mainCamera.transform.position - var_316_0.position

				var_316_0.forward = Vector3.New(var_316_5.x, var_316_5.y, var_316_5.z)

				local var_316_6 = var_316_0.localEulerAngles

				var_316_6.z = 0
				var_316_6.x = 0
				var_316_0.localEulerAngles = var_316_6
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 then
				var_316_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_316_7 = manager.ui.mainCamera.transform.position - var_316_0.position

				var_316_0.forward = Vector3.New(var_316_7.x, var_316_7.y, var_316_7.z)

				local var_316_8 = var_316_0.localEulerAngles

				var_316_8.z = 0
				var_316_8.x = 0
				var_316_0.localEulerAngles = var_316_8
			end

			local var_316_9 = arg_313_1.actors_["1028ui_story"]
			local var_316_10 = 0

			if var_316_10 < arg_313_1.time_ and arg_313_1.time_ <= var_316_10 + arg_316_0 and arg_313_1.var_.characterEffect1028ui_story == nil then
				arg_313_1.var_.characterEffect1028ui_story = var_316_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_11 = 0.200000002980232

			if var_316_10 <= arg_313_1.time_ and arg_313_1.time_ < var_316_10 + var_316_11 then
				local var_316_12 = (arg_313_1.time_ - var_316_10) / var_316_11

				if arg_313_1.var_.characterEffect1028ui_story then
					arg_313_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_313_1.time_ >= var_316_10 + var_316_11 and arg_313_1.time_ < var_316_10 + var_316_11 + arg_316_0 and arg_313_1.var_.characterEffect1028ui_story then
				arg_313_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_316_13 = 0

			if var_316_13 < arg_313_1.time_ and arg_313_1.time_ <= var_316_13 + arg_316_0 then
				arg_313_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_316_14 = 0

			if var_316_14 < arg_313_1.time_ and arg_313_1.time_ <= var_316_14 + arg_316_0 then
				arg_313_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_316_15 = 0
			local var_316_16 = 0.425

			if var_316_15 < arg_313_1.time_ and arg_313_1.time_ <= var_316_15 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_17 = arg_313_1:FormatText(StoryNameCfg[327].name)

				arg_313_1.leftNameTxt_.text = var_316_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_18 = arg_313_1:GetWordFromCfg(1102805077)
				local var_316_19 = arg_313_1:FormatText(var_316_18.content)

				arg_313_1.text_.text = var_316_19

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_20 = 17
				local var_316_21 = utf8.len(var_316_19)
				local var_316_22 = var_316_20 <= 0 and var_316_16 or var_316_16 * (var_316_21 / var_316_20)

				if var_316_22 > 0 and var_316_16 < var_316_22 then
					arg_313_1.talkMaxDuration = var_316_22

					if var_316_22 + var_316_15 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_22 + var_316_15
					end
				end

				arg_313_1.text_.text = var_316_19
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805077", "story_v_side_new_1102805.awb") ~= 0 then
					local var_316_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805077", "story_v_side_new_1102805.awb") / 1000

					if var_316_23 + var_316_15 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_23 + var_316_15
					end

					if var_316_18.prefab_name ~= "" and arg_313_1.actors_[var_316_18.prefab_name] ~= nil then
						local var_316_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_18.prefab_name].transform, "story_v_side_new_1102805", "1102805077", "story_v_side_new_1102805.awb")

						arg_313_1:RecordAudio("1102805077", var_316_24)
						arg_313_1:RecordAudio("1102805077", var_316_24)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805077", "story_v_side_new_1102805.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805077", "story_v_side_new_1102805.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_25 = math.max(var_316_16, arg_313_1.talkMaxDuration)

			if var_316_15 <= arg_313_1.time_ and arg_313_1.time_ < var_316_15 + var_316_25 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_15) / var_316_25

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_15 + var_316_25 and arg_313_1.time_ < var_316_15 + var_316_25 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 1102805078
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play1102805079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1028ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect1028ui_story == nil then
				arg_317_1.var_.characterEffect1028ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.200000002980232

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect1028ui_story then
					local var_320_4 = Mathf.Lerp(0, 0.5, var_320_3)

					arg_317_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_317_1.var_.characterEffect1028ui_story.fillRatio = var_320_4
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect1028ui_story then
				local var_320_5 = 0.5

				arg_317_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_317_1.var_.characterEffect1028ui_story.fillRatio = var_320_5
			end

			local var_320_6 = 0
			local var_320_7 = 0.725

			if var_320_6 < arg_317_1.time_ and arg_317_1.time_ <= var_320_6 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_8 = arg_317_1:FormatText(StoryNameCfg[7].name)

				arg_317_1.leftNameTxt_.text = var_320_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_9 = arg_317_1:GetWordFromCfg(1102805078)
				local var_320_10 = arg_317_1:FormatText(var_320_9.content)

				arg_317_1.text_.text = var_320_10

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_11 = 29
				local var_320_12 = utf8.len(var_320_10)
				local var_320_13 = var_320_11 <= 0 and var_320_7 or var_320_7 * (var_320_12 / var_320_11)

				if var_320_13 > 0 and var_320_7 < var_320_13 then
					arg_317_1.talkMaxDuration = var_320_13

					if var_320_13 + var_320_6 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_13 + var_320_6
					end
				end

				arg_317_1.text_.text = var_320_10
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_14 = math.max(var_320_7, arg_317_1.talkMaxDuration)

			if var_320_6 <= arg_317_1.time_ and arg_317_1.time_ < var_320_6 + var_320_14 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_6) / var_320_14

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_6 + var_320_14 and arg_317_1.time_ < var_320_6 + var_320_14 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 1102805079
		arg_321_1.duration_ = 2.333

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play1102805080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1028ui_story"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos1028ui_story = var_324_0.localPosition
			end

			local var_324_2 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2
				local var_324_4 = Vector3.New(0, -0.9, -5.9)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1028ui_story, var_324_4, var_324_3)

				local var_324_5 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_5.x, var_324_5.y, var_324_5.z)

				local var_324_6 = var_324_0.localEulerAngles

				var_324_6.z = 0
				var_324_6.x = 0
				var_324_0.localEulerAngles = var_324_6
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_324_7 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_7.x, var_324_7.y, var_324_7.z)

				local var_324_8 = var_324_0.localEulerAngles

				var_324_8.z = 0
				var_324_8.x = 0
				var_324_0.localEulerAngles = var_324_8
			end

			local var_324_9 = arg_321_1.actors_["1028ui_story"]
			local var_324_10 = 0

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 and arg_321_1.var_.characterEffect1028ui_story == nil then
				arg_321_1.var_.characterEffect1028ui_story = var_324_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_11 = 0.200000002980232

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_11 then
				local var_324_12 = (arg_321_1.time_ - var_324_10) / var_324_11

				if arg_321_1.var_.characterEffect1028ui_story then
					arg_321_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_10 + var_324_11 and arg_321_1.time_ < var_324_10 + var_324_11 + arg_324_0 and arg_321_1.var_.characterEffect1028ui_story then
				arg_321_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_324_13 = 0

			if var_324_13 < arg_321_1.time_ and arg_321_1.time_ <= var_324_13 + arg_324_0 then
				arg_321_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_324_14 = 0

			if var_324_14 < arg_321_1.time_ and arg_321_1.time_ <= var_324_14 + arg_324_0 then
				arg_321_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_324_15 = 0
			local var_324_16 = 0.25

			if var_324_15 < arg_321_1.time_ and arg_321_1.time_ <= var_324_15 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_17 = arg_321_1:FormatText(StoryNameCfg[327].name)

				arg_321_1.leftNameTxt_.text = var_324_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_18 = arg_321_1:GetWordFromCfg(1102805079)
				local var_324_19 = arg_321_1:FormatText(var_324_18.content)

				arg_321_1.text_.text = var_324_19

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_20 = 10
				local var_324_21 = utf8.len(var_324_19)
				local var_324_22 = var_324_20 <= 0 and var_324_16 or var_324_16 * (var_324_21 / var_324_20)

				if var_324_22 > 0 and var_324_16 < var_324_22 then
					arg_321_1.talkMaxDuration = var_324_22

					if var_324_22 + var_324_15 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_22 + var_324_15
					end
				end

				arg_321_1.text_.text = var_324_19
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805079", "story_v_side_new_1102805.awb") ~= 0 then
					local var_324_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805079", "story_v_side_new_1102805.awb") / 1000

					if var_324_23 + var_324_15 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_23 + var_324_15
					end

					if var_324_18.prefab_name ~= "" and arg_321_1.actors_[var_324_18.prefab_name] ~= nil then
						local var_324_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_18.prefab_name].transform, "story_v_side_new_1102805", "1102805079", "story_v_side_new_1102805.awb")

						arg_321_1:RecordAudio("1102805079", var_324_24)
						arg_321_1:RecordAudio("1102805079", var_324_24)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805079", "story_v_side_new_1102805.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805079", "story_v_side_new_1102805.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_25 = math.max(var_324_16, arg_321_1.talkMaxDuration)

			if var_324_15 <= arg_321_1.time_ and arg_321_1.time_ < var_324_15 + var_324_25 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_15) / var_324_25

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_15 + var_324_25 and arg_321_1.time_ < var_324_15 + var_324_25 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 1102805080
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play1102805081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1028ui_story"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.characterEffect1028ui_story == nil then
				arg_325_1.var_.characterEffect1028ui_story = var_328_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_2 = 0.200000002980232

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.characterEffect1028ui_story then
					local var_328_4 = Mathf.Lerp(0, 0.5, var_328_3)

					arg_325_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_325_1.var_.characterEffect1028ui_story.fillRatio = var_328_4
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.characterEffect1028ui_story then
				local var_328_5 = 0.5

				arg_325_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_325_1.var_.characterEffect1028ui_story.fillRatio = var_328_5
			end

			local var_328_6 = 0
			local var_328_7 = 0.775

			if var_328_6 < arg_325_1.time_ and arg_325_1.time_ <= var_328_6 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_8 = arg_325_1:GetWordFromCfg(1102805080)
				local var_328_9 = arg_325_1:FormatText(var_328_8.content)

				arg_325_1.text_.text = var_328_9

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_10 = 31
				local var_328_11 = utf8.len(var_328_9)
				local var_328_12 = var_328_10 <= 0 and var_328_7 or var_328_7 * (var_328_11 / var_328_10)

				if var_328_12 > 0 and var_328_7 < var_328_12 then
					arg_325_1.talkMaxDuration = var_328_12

					if var_328_12 + var_328_6 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_12 + var_328_6
					end
				end

				arg_325_1.text_.text = var_328_9
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_13 = math.max(var_328_7, arg_325_1.talkMaxDuration)

			if var_328_6 <= arg_325_1.time_ and arg_325_1.time_ < var_328_6 + var_328_13 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_6) / var_328_13

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_6 + var_328_13 and arg_325_1.time_ < var_328_6 + var_328_13 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 1102805081
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play1102805082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1028ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1028ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(0, -0.9, -5.9)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1028ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["1028ui_story"]
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 and arg_329_1.var_.characterEffect1028ui_story == nil then
				arg_329_1.var_.characterEffect1028ui_story = var_332_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_11 = 0.200000002980232

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11

				if arg_329_1.var_.characterEffect1028ui_story then
					arg_329_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 and arg_329_1.var_.characterEffect1028ui_story then
				arg_329_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_332_13 = 0

			if var_332_13 < arg_329_1.time_ and arg_329_1.time_ <= var_332_13 + arg_332_0 then
				arg_329_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_332_14 = 0

			if var_332_14 < arg_329_1.time_ and arg_329_1.time_ <= var_332_14 + arg_332_0 then
				arg_329_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_332_15 = 0
			local var_332_16 = 0.625

			if var_332_15 < arg_329_1.time_ and arg_329_1.time_ <= var_332_15 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_17 = arg_329_1:FormatText(StoryNameCfg[327].name)

				arg_329_1.leftNameTxt_.text = var_332_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_18 = arg_329_1:GetWordFromCfg(1102805081)
				local var_332_19 = arg_329_1:FormatText(var_332_18.content)

				arg_329_1.text_.text = var_332_19

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_20 = 25
				local var_332_21 = utf8.len(var_332_19)
				local var_332_22 = var_332_20 <= 0 and var_332_16 or var_332_16 * (var_332_21 / var_332_20)

				if var_332_22 > 0 and var_332_16 < var_332_22 then
					arg_329_1.talkMaxDuration = var_332_22

					if var_332_22 + var_332_15 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_22 + var_332_15
					end
				end

				arg_329_1.text_.text = var_332_19
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805081", "story_v_side_new_1102805.awb") ~= 0 then
					local var_332_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805081", "story_v_side_new_1102805.awb") / 1000

					if var_332_23 + var_332_15 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_23 + var_332_15
					end

					if var_332_18.prefab_name ~= "" and arg_329_1.actors_[var_332_18.prefab_name] ~= nil then
						local var_332_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_18.prefab_name].transform, "story_v_side_new_1102805", "1102805081", "story_v_side_new_1102805.awb")

						arg_329_1:RecordAudio("1102805081", var_332_24)
						arg_329_1:RecordAudio("1102805081", var_332_24)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805081", "story_v_side_new_1102805.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805081", "story_v_side_new_1102805.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_25 = math.max(var_332_16, arg_329_1.talkMaxDuration)

			if var_332_15 <= arg_329_1.time_ and arg_329_1.time_ < var_332_15 + var_332_25 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_15) / var_332_25

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_15 + var_332_25 and arg_329_1.time_ < var_332_15 + var_332_25 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 1102805082
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play1102805083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1028ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.characterEffect1028ui_story == nil then
				arg_333_1.var_.characterEffect1028ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.200000002980232

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect1028ui_story then
					local var_336_4 = Mathf.Lerp(0, 0.5, var_336_3)

					arg_333_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1028ui_story.fillRatio = var_336_4
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.characterEffect1028ui_story then
				local var_336_5 = 0.5

				arg_333_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1028ui_story.fillRatio = var_336_5
			end

			local var_336_6 = 0
			local var_336_7 = 0.6

			if var_336_6 < arg_333_1.time_ and arg_333_1.time_ <= var_336_6 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_8 = arg_333_1:FormatText(StoryNameCfg[7].name)

				arg_333_1.leftNameTxt_.text = var_336_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_9 = arg_333_1:GetWordFromCfg(1102805082)
				local var_336_10 = arg_333_1:FormatText(var_336_9.content)

				arg_333_1.text_.text = var_336_10

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_11 = 24
				local var_336_12 = utf8.len(var_336_10)
				local var_336_13 = var_336_11 <= 0 and var_336_7 or var_336_7 * (var_336_12 / var_336_11)

				if var_336_13 > 0 and var_336_7 < var_336_13 then
					arg_333_1.talkMaxDuration = var_336_13

					if var_336_13 + var_336_6 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_13 + var_336_6
					end
				end

				arg_333_1.text_.text = var_336_10
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_14 = math.max(var_336_7, arg_333_1.talkMaxDuration)

			if var_336_6 <= arg_333_1.time_ and arg_333_1.time_ < var_336_6 + var_336_14 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_6) / var_336_14

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_6 + var_336_14 and arg_333_1.time_ < var_336_6 + var_336_14 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 1102805083
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play1102805084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.6

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_2 = arg_337_1:GetWordFromCfg(1102805083)
				local var_340_3 = arg_337_1:FormatText(var_340_2.content)

				arg_337_1.text_.text = var_340_3

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_4 = 24
				local var_340_5 = utf8.len(var_340_3)
				local var_340_6 = var_340_4 <= 0 and var_340_1 or var_340_1 * (var_340_5 / var_340_4)

				if var_340_6 > 0 and var_340_1 < var_340_6 then
					arg_337_1.talkMaxDuration = var_340_6

					if var_340_6 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_6 + var_340_0
					end
				end

				arg_337_1.text_.text = var_340_3
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_7 = math.max(var_340_1, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_7 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_0) / var_340_7

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_7 and arg_337_1.time_ < var_340_0 + var_340_7 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 1102805084
		arg_341_1.duration_ = 1.966

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play1102805085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1028ui_story"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos1028ui_story = var_344_0.localPosition
			end

			local var_344_2 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2
				local var_344_4 = Vector3.New(0, 100, 0)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1028ui_story, var_344_4, var_344_3)

				local var_344_5 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_5.x, var_344_5.y, var_344_5.z)

				local var_344_6 = var_344_0.localEulerAngles

				var_344_6.z = 0
				var_344_6.x = 0
				var_344_0.localEulerAngles = var_344_6
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(0, 100, 0)

				local var_344_7 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_7.x, var_344_7.y, var_344_7.z)

				local var_344_8 = var_344_0.localEulerAngles

				var_344_8.z = 0
				var_344_8.x = 0
				var_344_0.localEulerAngles = var_344_8
			end

			local var_344_9 = 0
			local var_344_10 = 0.6

			if var_344_9 < arg_341_1.time_ and arg_341_1.time_ <= var_344_9 + arg_344_0 then
				local var_344_11 = "play"
				local var_344_12 = "effect"

				arg_341_1:AudioAction(var_344_11, var_344_12, "se_story_122_03", "se_story_122_03_hit", "")
			end

			local var_344_13 = manager.ui.mainCamera.transform
			local var_344_14 = 0

			if var_344_14 < arg_341_1.time_ and arg_341_1.time_ <= var_344_14 + arg_344_0 then
				arg_341_1.var_.shakeOldPos = var_344_13.localPosition
			end

			local var_344_15 = 1

			if var_344_14 <= arg_341_1.time_ and arg_341_1.time_ < var_344_14 + var_344_15 then
				local var_344_16 = (arg_341_1.time_ - var_344_14) / 0.066
				local var_344_17, var_344_18 = math.modf(var_344_16)

				var_344_13.localPosition = Vector3.New(var_344_18 * 0.13, var_344_18 * 0.13, var_344_18 * 0.13) + arg_341_1.var_.shakeOldPos
			end

			if arg_341_1.time_ >= var_344_14 + var_344_15 and arg_341_1.time_ < var_344_14 + var_344_15 + arg_344_0 then
				var_344_13.localPosition = arg_341_1.var_.shakeOldPos
			end

			local var_344_19 = 0
			local var_344_20 = 0.175

			if var_344_19 < arg_341_1.time_ and arg_341_1.time_ <= var_344_19 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_21 = arg_341_1:FormatText(StoryNameCfg[327].name)

				arg_341_1.leftNameTxt_.text = var_344_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, true)
				arg_341_1.iconController_:SetSelectedState("hero")

				arg_341_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1028")

				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_22 = arg_341_1:GetWordFromCfg(1102805084)
				local var_344_23 = arg_341_1:FormatText(var_344_22.content)

				arg_341_1.text_.text = var_344_23

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_24 = 7
				local var_344_25 = utf8.len(var_344_23)
				local var_344_26 = var_344_24 <= 0 and var_344_20 or var_344_20 * (var_344_25 / var_344_24)

				if var_344_26 > 0 and var_344_20 < var_344_26 then
					arg_341_1.talkMaxDuration = var_344_26

					if var_344_26 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_26 + var_344_19
					end
				end

				arg_341_1.text_.text = var_344_23
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805084", "story_v_side_new_1102805.awb") ~= 0 then
					local var_344_27 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805084", "story_v_side_new_1102805.awb") / 1000

					if var_344_27 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_27 + var_344_19
					end

					if var_344_22.prefab_name ~= "" and arg_341_1.actors_[var_344_22.prefab_name] ~= nil then
						local var_344_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_22.prefab_name].transform, "story_v_side_new_1102805", "1102805084", "story_v_side_new_1102805.awb")

						arg_341_1:RecordAudio("1102805084", var_344_28)
						arg_341_1:RecordAudio("1102805084", var_344_28)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805084", "story_v_side_new_1102805.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805084", "story_v_side_new_1102805.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_29 = math.max(var_344_20, arg_341_1.talkMaxDuration)

			if var_344_19 <= arg_341_1.time_ and arg_341_1.time_ < var_344_19 + var_344_29 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_19) / var_344_29

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_19 + var_344_29 and arg_341_1.time_ < var_344_19 + var_344_29 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 1102805085
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play1102805086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.mask_.enabled = true
				arg_345_1.mask_.raycastTarget = true

				arg_345_1:SetGaussion(false)
			end

			local var_348_1 = 1

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_1 then
				local var_348_2 = (arg_345_1.time_ - var_348_0) / var_348_1
				local var_348_3 = Color.New(1, 1, 1)

				var_348_3.a = Mathf.Lerp(1, 0, var_348_2)
				arg_345_1.mask_.color = var_348_3
			end

			if arg_345_1.time_ >= var_348_0 + var_348_1 and arg_345_1.time_ < var_348_0 + var_348_1 + arg_348_0 then
				local var_348_4 = Color.New(1, 1, 1)
				local var_348_5 = 0

				arg_345_1.mask_.enabled = false
				var_348_4.a = var_348_5
				arg_345_1.mask_.color = var_348_4
			end

			local var_348_6 = manager.ui.mainCamera.transform
			local var_348_7 = 0

			if var_348_7 < arg_345_1.time_ and arg_345_1.time_ <= var_348_7 + arg_348_0 then
				arg_345_1.var_.shakeOldPos = var_348_6.localPosition
			end

			local var_348_8 = 0.5

			if var_348_7 <= arg_345_1.time_ and arg_345_1.time_ < var_348_7 + var_348_8 then
				local var_348_9 = (arg_345_1.time_ - var_348_7) / 0.066
				local var_348_10, var_348_11 = math.modf(var_348_9)

				var_348_6.localPosition = Vector3.New(var_348_11 * 0.13, var_348_11 * 0.13, var_348_11 * 0.13) + arg_345_1.var_.shakeOldPos
			end

			if arg_345_1.time_ >= var_348_7 + var_348_8 and arg_345_1.time_ < var_348_7 + var_348_8 + arg_348_0 then
				var_348_6.localPosition = arg_345_1.var_.shakeOldPos
			end

			local var_348_12 = 0
			local var_348_13 = 0.9

			if var_348_12 < arg_345_1.time_ and arg_345_1.time_ <= var_348_12 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0

				arg_345_1.dialog_:SetActive(true)

				local var_348_14 = LeanTween.value(arg_345_1.dialog_, 0, 1, 0.3)

				var_348_14:setOnUpdate(LuaHelper.FloatAction(function(arg_349_0)
					arg_345_1.dialogCg_.alpha = arg_349_0
				end))
				var_348_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_345_1.dialog_)
					var_348_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_345_1.duration_ = arg_345_1.duration_ + 0.3

				SetActive(arg_345_1.leftNameGo_, false)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_15 = arg_345_1:GetWordFromCfg(1102805085)
				local var_348_16 = arg_345_1:FormatText(var_348_15.content)

				arg_345_1.text_.text = var_348_16

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_17 = 36
				local var_348_18 = utf8.len(var_348_16)
				local var_348_19 = var_348_17 <= 0 and var_348_13 or var_348_13 * (var_348_18 / var_348_17)

				if var_348_19 > 0 and var_348_13 < var_348_19 then
					arg_345_1.talkMaxDuration = var_348_19
					var_348_12 = var_348_12 + 0.3

					if var_348_19 + var_348_12 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_19 + var_348_12
					end
				end

				arg_345_1.text_.text = var_348_16
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_20 = var_348_12 + 0.3
			local var_348_21 = math.max(var_348_13, arg_345_1.talkMaxDuration)

			if var_348_20 <= arg_345_1.time_ and arg_345_1.time_ < var_348_20 + var_348_21 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_20) / var_348_21

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_20 + var_348_21 and arg_345_1.time_ < var_348_20 + var_348_21 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805086 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 1102805086
		arg_351_1.duration_ = 5

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play1102805087(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0
			local var_354_1 = 0.125

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_2 = arg_351_1:FormatText(StoryNameCfg[7].name)

				arg_351_1.leftNameTxt_.text = var_354_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_3 = arg_351_1:GetWordFromCfg(1102805086)
				local var_354_4 = arg_351_1:FormatText(var_354_3.content)

				arg_351_1.text_.text = var_354_4

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_5 = 5
				local var_354_6 = utf8.len(var_354_4)
				local var_354_7 = var_354_5 <= 0 and var_354_1 or var_354_1 * (var_354_6 / var_354_5)

				if var_354_7 > 0 and var_354_1 < var_354_7 then
					arg_351_1.talkMaxDuration = var_354_7

					if var_354_7 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_7 + var_354_0
					end
				end

				arg_351_1.text_.text = var_354_4
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_8 = math.max(var_354_1, arg_351_1.talkMaxDuration)

			if var_354_0 <= arg_351_1.time_ and arg_351_1.time_ < var_354_0 + var_354_8 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_0) / var_354_8

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_0 + var_354_8 and arg_351_1.time_ < var_354_0 + var_354_8 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805087 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 1102805087
		arg_355_1.duration_ = 1.999999999999

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play1102805088(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1028ui_story"].transform
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 then
				arg_355_1.var_.moveOldPos1028ui_story = var_358_0.localPosition
			end

			local var_358_2 = 0.001

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2
				local var_358_4 = Vector3.New(0, -0.9, -5.9)

				var_358_0.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos1028ui_story, var_358_4, var_358_3)

				local var_358_5 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_5.x, var_358_5.y, var_358_5.z)

				local var_358_6 = var_358_0.localEulerAngles

				var_358_6.z = 0
				var_358_6.x = 0
				var_358_0.localEulerAngles = var_358_6
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 then
				var_358_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_358_7 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_7.x, var_358_7.y, var_358_7.z)

				local var_358_8 = var_358_0.localEulerAngles

				var_358_8.z = 0
				var_358_8.x = 0
				var_358_0.localEulerAngles = var_358_8
			end

			local var_358_9 = arg_355_1.actors_["1028ui_story"]
			local var_358_10 = 0

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 and arg_355_1.var_.characterEffect1028ui_story == nil then
				arg_355_1.var_.characterEffect1028ui_story = var_358_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_11 = 0.200000002980232

			if var_358_10 <= arg_355_1.time_ and arg_355_1.time_ < var_358_10 + var_358_11 then
				local var_358_12 = (arg_355_1.time_ - var_358_10) / var_358_11

				if arg_355_1.var_.characterEffect1028ui_story then
					arg_355_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_10 + var_358_11 and arg_355_1.time_ < var_358_10 + var_358_11 + arg_358_0 and arg_355_1.var_.characterEffect1028ui_story then
				arg_355_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_358_13 = 0

			if var_358_13 < arg_355_1.time_ and arg_355_1.time_ <= var_358_13 + arg_358_0 then
				arg_355_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_358_14 = 0

			if var_358_14 < arg_355_1.time_ and arg_355_1.time_ <= var_358_14 + arg_358_0 then
				arg_355_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_358_15 = 0
			local var_358_16 = 0.2

			if var_358_15 < arg_355_1.time_ and arg_355_1.time_ <= var_358_15 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_17 = arg_355_1:FormatText(StoryNameCfg[327].name)

				arg_355_1.leftNameTxt_.text = var_358_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_18 = arg_355_1:GetWordFromCfg(1102805087)
				local var_358_19 = arg_355_1:FormatText(var_358_18.content)

				arg_355_1.text_.text = var_358_19

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_20 = 8
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805087", "story_v_side_new_1102805.awb") ~= 0 then
					local var_358_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805087", "story_v_side_new_1102805.awb") / 1000

					if var_358_23 + var_358_15 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_23 + var_358_15
					end

					if var_358_18.prefab_name ~= "" and arg_355_1.actors_[var_358_18.prefab_name] ~= nil then
						local var_358_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_18.prefab_name].transform, "story_v_side_new_1102805", "1102805087", "story_v_side_new_1102805.awb")

						arg_355_1:RecordAudio("1102805087", var_358_24)
						arg_355_1:RecordAudio("1102805087", var_358_24)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805087", "story_v_side_new_1102805.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805087", "story_v_side_new_1102805.awb")
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
	Play1102805088 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 1102805088
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play1102805089(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1028ui_story"].transform
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 then
				arg_359_1.var_.moveOldPos1028ui_story = var_362_0.localPosition
			end

			local var_362_2 = 0.001

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2
				local var_362_4 = Vector3.New(0, 100, 0)

				var_362_0.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1028ui_story, var_362_4, var_362_3)

				local var_362_5 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_5.x, var_362_5.y, var_362_5.z)

				local var_362_6 = var_362_0.localEulerAngles

				var_362_6.z = 0
				var_362_6.x = 0
				var_362_0.localEulerAngles = var_362_6
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 then
				var_362_0.localPosition = Vector3.New(0, 100, 0)

				local var_362_7 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_7.x, var_362_7.y, var_362_7.z)

				local var_362_8 = var_362_0.localEulerAngles

				var_362_8.z = 0
				var_362_8.x = 0
				var_362_0.localEulerAngles = var_362_8
			end

			local var_362_9 = arg_359_1.actors_["1028ui_story"]
			local var_362_10 = 0

			if var_362_10 < arg_359_1.time_ and arg_359_1.time_ <= var_362_10 + arg_362_0 and arg_359_1.var_.characterEffect1028ui_story == nil then
				arg_359_1.var_.characterEffect1028ui_story = var_362_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_11 = 0.200000002980232

			if var_362_10 <= arg_359_1.time_ and arg_359_1.time_ < var_362_10 + var_362_11 then
				local var_362_12 = (arg_359_1.time_ - var_362_10) / var_362_11

				if arg_359_1.var_.characterEffect1028ui_story then
					local var_362_13 = Mathf.Lerp(0, 0.5, var_362_12)

					arg_359_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_359_1.var_.characterEffect1028ui_story.fillRatio = var_362_13
				end
			end

			if arg_359_1.time_ >= var_362_10 + var_362_11 and arg_359_1.time_ < var_362_10 + var_362_11 + arg_362_0 and arg_359_1.var_.characterEffect1028ui_story then
				local var_362_14 = 0.5

				arg_359_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_359_1.var_.characterEffect1028ui_story.fillRatio = var_362_14
			end

			local var_362_15 = 0
			local var_362_16 = 0.6

			if var_362_15 < arg_359_1.time_ and arg_359_1.time_ <= var_362_15 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, false)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_17 = arg_359_1:GetWordFromCfg(1102805088)
				local var_362_18 = arg_359_1:FormatText(var_362_17.content)

				arg_359_1.text_.text = var_362_18

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_19 = 24
				local var_362_20 = utf8.len(var_362_18)
				local var_362_21 = var_362_19 <= 0 and var_362_16 or var_362_16 * (var_362_20 / var_362_19)

				if var_362_21 > 0 and var_362_16 < var_362_21 then
					arg_359_1.talkMaxDuration = var_362_21

					if var_362_21 + var_362_15 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_21 + var_362_15
					end
				end

				arg_359_1.text_.text = var_362_18
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_22 = math.max(var_362_16, arg_359_1.talkMaxDuration)

			if var_362_15 <= arg_359_1.time_ and arg_359_1.time_ < var_362_15 + var_362_22 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_15) / var_362_22

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_15 + var_362_22 and arg_359_1.time_ < var_362_15 + var_362_22 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805089 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 1102805089
		arg_363_1.duration_ = 9

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play1102805090(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 2

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				local var_366_1 = manager.ui.mainCamera.transform.localPosition
				local var_366_2 = Vector3.New(0, 0, 10) + Vector3.New(var_366_1.x, var_366_1.y, 0)
				local var_366_3 = arg_363_1.bgs_.STblack

				var_366_3.transform.localPosition = var_366_2
				var_366_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_366_4 = var_366_3:GetComponent("SpriteRenderer")

				if var_366_4 and var_366_4.sprite then
					local var_366_5 = (var_366_3.transform.localPosition - var_366_1).z
					local var_366_6 = manager.ui.mainCameraCom_
					local var_366_7 = 2 * var_366_5 * Mathf.Tan(var_366_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_366_8 = var_366_7 * var_366_6.aspect
					local var_366_9 = var_366_4.sprite.bounds.size.x
					local var_366_10 = var_366_4.sprite.bounds.size.y
					local var_366_11 = var_366_8 / var_366_9
					local var_366_12 = var_366_7 / var_366_10
					local var_366_13 = var_366_12 < var_366_11 and var_366_11 or var_366_12

					var_366_3.transform.localScale = Vector3.New(var_366_13, var_366_13, 0)
				end

				for iter_366_0, iter_366_1 in pairs(arg_363_1.bgs_) do
					if iter_366_0 ~= "STblack" then
						iter_366_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_366_14 = 0

			if var_366_14 < arg_363_1.time_ and arg_363_1.time_ <= var_366_14 + arg_366_0 then
				arg_363_1.mask_.enabled = true
				arg_363_1.mask_.raycastTarget = true

				arg_363_1:SetGaussion(false)
			end

			local var_366_15 = 2

			if var_366_14 <= arg_363_1.time_ and arg_363_1.time_ < var_366_14 + var_366_15 then
				local var_366_16 = (arg_363_1.time_ - var_366_14) / var_366_15
				local var_366_17 = Color.New(0, 0, 0)

				var_366_17.a = Mathf.Lerp(0, 1, var_366_16)
				arg_363_1.mask_.color = var_366_17
			end

			if arg_363_1.time_ >= var_366_14 + var_366_15 and arg_363_1.time_ < var_366_14 + var_366_15 + arg_366_0 then
				local var_366_18 = Color.New(0, 0, 0)

				var_366_18.a = 1
				arg_363_1.mask_.color = var_366_18
			end

			local var_366_19 = 2

			if var_366_19 < arg_363_1.time_ and arg_363_1.time_ <= var_366_19 + arg_366_0 then
				arg_363_1.mask_.enabled = true
				arg_363_1.mask_.raycastTarget = true

				arg_363_1:SetGaussion(false)
			end

			local var_366_20 = 2

			if var_366_19 <= arg_363_1.time_ and arg_363_1.time_ < var_366_19 + var_366_20 then
				local var_366_21 = (arg_363_1.time_ - var_366_19) / var_366_20
				local var_366_22 = Color.New(0, 0, 0)

				var_366_22.a = Mathf.Lerp(1, 0, var_366_21)
				arg_363_1.mask_.color = var_366_22
			end

			if arg_363_1.time_ >= var_366_19 + var_366_20 and arg_363_1.time_ < var_366_19 + var_366_20 + arg_366_0 then
				local var_366_23 = Color.New(0, 0, 0)
				local var_366_24 = 0

				arg_363_1.mask_.enabled = false
				var_366_23.a = var_366_24
				arg_363_1.mask_.color = var_366_23
			end

			if arg_363_1.frameCnt_ <= 1 then
				arg_363_1.dialog_:SetActive(false)
			end

			local var_366_25 = 4
			local var_366_26 = 0.975

			if var_366_25 < arg_363_1.time_ and arg_363_1.time_ <= var_366_25 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0

				arg_363_1.dialog_:SetActive(true)

				local var_366_27 = LeanTween.value(arg_363_1.dialog_, 0, 1, 0.3)

				var_366_27:setOnUpdate(LuaHelper.FloatAction(function(arg_367_0)
					arg_363_1.dialogCg_.alpha = arg_367_0
				end))
				var_366_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_363_1.dialog_)
					var_366_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_363_1.duration_ = arg_363_1.duration_ + 0.3

				SetActive(arg_363_1.leftNameGo_, false)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_28 = arg_363_1:GetWordFromCfg(1102805089)
				local var_366_29 = arg_363_1:FormatText(var_366_28.content)

				arg_363_1.text_.text = var_366_29

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_30 = 39
				local var_366_31 = utf8.len(var_366_29)
				local var_366_32 = var_366_30 <= 0 and var_366_26 or var_366_26 * (var_366_31 / var_366_30)

				if var_366_32 > 0 and var_366_26 < var_366_32 then
					arg_363_1.talkMaxDuration = var_366_32
					var_366_25 = var_366_25 + 0.3

					if var_366_32 + var_366_25 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_32 + var_366_25
					end
				end

				arg_363_1.text_.text = var_366_29
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)
				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_33 = var_366_25 + 0.3
			local var_366_34 = math.max(var_366_26, arg_363_1.talkMaxDuration)

			if var_366_33 <= arg_363_1.time_ and arg_363_1.time_ < var_366_33 + var_366_34 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_33) / var_366_34

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_33 + var_366_34 and arg_363_1.time_ < var_366_33 + var_366_34 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805090 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 1102805090
		arg_369_1.duration_ = 4.8

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play1102805091(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				local var_372_1 = manager.ui.mainCamera.transform.localPosition
				local var_372_2 = Vector3.New(0, 0, 10) + Vector3.New(var_372_1.x, var_372_1.y, 0)
				local var_372_3 = arg_369_1.bgs_.B04e

				var_372_3.transform.localPosition = var_372_2
				var_372_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_372_4 = var_372_3:GetComponent("SpriteRenderer")

				if var_372_4 and var_372_4.sprite then
					local var_372_5 = (var_372_3.transform.localPosition - var_372_1).z
					local var_372_6 = manager.ui.mainCameraCom_
					local var_372_7 = 2 * var_372_5 * Mathf.Tan(var_372_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_372_8 = var_372_7 * var_372_6.aspect
					local var_372_9 = var_372_4.sprite.bounds.size.x
					local var_372_10 = var_372_4.sprite.bounds.size.y
					local var_372_11 = var_372_8 / var_372_9
					local var_372_12 = var_372_7 / var_372_10
					local var_372_13 = var_372_12 < var_372_11 and var_372_11 or var_372_12

					var_372_3.transform.localScale = Vector3.New(var_372_13, var_372_13, 0)
				end

				for iter_372_0, iter_372_1 in pairs(arg_369_1.bgs_) do
					if iter_372_0 ~= "B04e" then
						iter_372_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_372_14 = 0

			if var_372_14 < arg_369_1.time_ and arg_369_1.time_ <= var_372_14 + arg_372_0 then
				arg_369_1.mask_.enabled = true
				arg_369_1.mask_.raycastTarget = true

				arg_369_1:SetGaussion(false)
			end

			local var_372_15 = 2

			if var_372_14 <= arg_369_1.time_ and arg_369_1.time_ < var_372_14 + var_372_15 then
				local var_372_16 = (arg_369_1.time_ - var_372_14) / var_372_15
				local var_372_17 = Color.New(0, 0, 0)

				var_372_17.a = Mathf.Lerp(1, 0, var_372_16)
				arg_369_1.mask_.color = var_372_17
			end

			if arg_369_1.time_ >= var_372_14 + var_372_15 and arg_369_1.time_ < var_372_14 + var_372_15 + arg_372_0 then
				local var_372_18 = Color.New(0, 0, 0)
				local var_372_19 = 0

				arg_369_1.mask_.enabled = false
				var_372_18.a = var_372_19
				arg_369_1.mask_.color = var_372_18
			end

			local var_372_20 = arg_369_1.actors_["1028ui_story"].transform
			local var_372_21 = 2

			if var_372_21 < arg_369_1.time_ and arg_369_1.time_ <= var_372_21 + arg_372_0 then
				arg_369_1.var_.moveOldPos1028ui_story = var_372_20.localPosition
			end

			local var_372_22 = 0.001

			if var_372_21 <= arg_369_1.time_ and arg_369_1.time_ < var_372_21 + var_372_22 then
				local var_372_23 = (arg_369_1.time_ - var_372_21) / var_372_22
				local var_372_24 = Vector3.New(0, -0.9, -5.9)

				var_372_20.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos1028ui_story, var_372_24, var_372_23)

				local var_372_25 = manager.ui.mainCamera.transform.position - var_372_20.position

				var_372_20.forward = Vector3.New(var_372_25.x, var_372_25.y, var_372_25.z)

				local var_372_26 = var_372_20.localEulerAngles

				var_372_26.z = 0
				var_372_26.x = 0
				var_372_20.localEulerAngles = var_372_26
			end

			if arg_369_1.time_ >= var_372_21 + var_372_22 and arg_369_1.time_ < var_372_21 + var_372_22 + arg_372_0 then
				var_372_20.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_372_27 = manager.ui.mainCamera.transform.position - var_372_20.position

				var_372_20.forward = Vector3.New(var_372_27.x, var_372_27.y, var_372_27.z)

				local var_372_28 = var_372_20.localEulerAngles

				var_372_28.z = 0
				var_372_28.x = 0
				var_372_20.localEulerAngles = var_372_28
			end

			local var_372_29 = arg_369_1.actors_["1028ui_story"]
			local var_372_30 = 2

			if var_372_30 < arg_369_1.time_ and arg_369_1.time_ <= var_372_30 + arg_372_0 and arg_369_1.var_.characterEffect1028ui_story == nil then
				arg_369_1.var_.characterEffect1028ui_story = var_372_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_31 = 0.200000002980232

			if var_372_30 <= arg_369_1.time_ and arg_369_1.time_ < var_372_30 + var_372_31 then
				local var_372_32 = (arg_369_1.time_ - var_372_30) / var_372_31

				if arg_369_1.var_.characterEffect1028ui_story then
					arg_369_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_369_1.time_ >= var_372_30 + var_372_31 and arg_369_1.time_ < var_372_30 + var_372_31 + arg_372_0 and arg_369_1.var_.characterEffect1028ui_story then
				arg_369_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_372_33 = 2

			if var_372_33 < arg_369_1.time_ and arg_369_1.time_ <= var_372_33 + arg_372_0 then
				arg_369_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_372_34 = 2

			if var_372_34 < arg_369_1.time_ and arg_369_1.time_ <= var_372_34 + arg_372_0 then
				arg_369_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			if arg_369_1.frameCnt_ <= 1 then
				arg_369_1.dialog_:SetActive(false)
			end

			local var_372_35 = 2
			local var_372_36 = 0.075

			if var_372_35 < arg_369_1.time_ and arg_369_1.time_ <= var_372_35 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0

				arg_369_1.dialog_:SetActive(true)

				local var_372_37 = LeanTween.value(arg_369_1.dialog_, 0, 1, 0.3)

				var_372_37:setOnUpdate(LuaHelper.FloatAction(function(arg_373_0)
					arg_369_1.dialogCg_.alpha = arg_373_0
				end))
				var_372_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_369_1.dialog_)
					var_372_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_369_1.duration_ = arg_369_1.duration_ + 0.3

				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_38 = arg_369_1:FormatText(StoryNameCfg[327].name)

				arg_369_1.leftNameTxt_.text = var_372_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_39 = arg_369_1:GetWordFromCfg(1102805090)
				local var_372_40 = arg_369_1:FormatText(var_372_39.content)

				arg_369_1.text_.text = var_372_40

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_41 = 3
				local var_372_42 = utf8.len(var_372_40)
				local var_372_43 = var_372_41 <= 0 and var_372_36 or var_372_36 * (var_372_42 / var_372_41)

				if var_372_43 > 0 and var_372_36 < var_372_43 then
					arg_369_1.talkMaxDuration = var_372_43
					var_372_35 = var_372_35 + 0.3

					if var_372_43 + var_372_35 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_43 + var_372_35
					end
				end

				arg_369_1.text_.text = var_372_40
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805090", "story_v_side_new_1102805.awb") ~= 0 then
					local var_372_44 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805090", "story_v_side_new_1102805.awb") / 1000

					if var_372_44 + var_372_35 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_44 + var_372_35
					end

					if var_372_39.prefab_name ~= "" and arg_369_1.actors_[var_372_39.prefab_name] ~= nil then
						local var_372_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_39.prefab_name].transform, "story_v_side_new_1102805", "1102805090", "story_v_side_new_1102805.awb")

						arg_369_1:RecordAudio("1102805090", var_372_45)
						arg_369_1:RecordAudio("1102805090", var_372_45)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805090", "story_v_side_new_1102805.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805090", "story_v_side_new_1102805.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_46 = var_372_35 + 0.3
			local var_372_47 = math.max(var_372_36, arg_369_1.talkMaxDuration)

			if var_372_46 <= arg_369_1.time_ and arg_369_1.time_ < var_372_46 + var_372_47 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_46) / var_372_47

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_46 + var_372_47 and arg_369_1.time_ < var_372_46 + var_372_47 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805091 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 1102805091
		arg_375_1.duration_ = 5

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play1102805092(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1028ui_story"]
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 and arg_375_1.var_.characterEffect1028ui_story == nil then
				arg_375_1.var_.characterEffect1028ui_story = var_378_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_2 = 0.200000002980232

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2

				if arg_375_1.var_.characterEffect1028ui_story then
					local var_378_4 = Mathf.Lerp(0, 0.5, var_378_3)

					arg_375_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_375_1.var_.characterEffect1028ui_story.fillRatio = var_378_4
				end
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 and arg_375_1.var_.characterEffect1028ui_story then
				local var_378_5 = 0.5

				arg_375_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_375_1.var_.characterEffect1028ui_story.fillRatio = var_378_5
			end

			local var_378_6 = 0
			local var_378_7 = 0.2

			if var_378_6 < arg_375_1.time_ and arg_375_1.time_ <= var_378_6 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_8 = arg_375_1:FormatText(StoryNameCfg[7].name)

				arg_375_1.leftNameTxt_.text = var_378_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_9 = arg_375_1:GetWordFromCfg(1102805091)
				local var_378_10 = arg_375_1:FormatText(var_378_9.content)

				arg_375_1.text_.text = var_378_10

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_11 = 8
				local var_378_12 = utf8.len(var_378_10)
				local var_378_13 = var_378_11 <= 0 and var_378_7 or var_378_7 * (var_378_12 / var_378_11)

				if var_378_13 > 0 and var_378_7 < var_378_13 then
					arg_375_1.talkMaxDuration = var_378_13

					if var_378_13 + var_378_6 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_13 + var_378_6
					end
				end

				arg_375_1.text_.text = var_378_10
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)
				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_14 = math.max(var_378_7, arg_375_1.talkMaxDuration)

			if var_378_6 <= arg_375_1.time_ and arg_375_1.time_ < var_378_6 + var_378_14 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_6) / var_378_14

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_6 + var_378_14 and arg_375_1.time_ < var_378_6 + var_378_14 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805092 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 1102805092
		arg_379_1.duration_ = 1.999999999999

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play1102805093(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1028ui_story"].transform
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 then
				arg_379_1.var_.moveOldPos1028ui_story = var_382_0.localPosition
			end

			local var_382_2 = 0.001

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2
				local var_382_4 = Vector3.New(0, -0.9, -5.9)

				var_382_0.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos1028ui_story, var_382_4, var_382_3)

				local var_382_5 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_5.x, var_382_5.y, var_382_5.z)

				local var_382_6 = var_382_0.localEulerAngles

				var_382_6.z = 0
				var_382_6.x = 0
				var_382_0.localEulerAngles = var_382_6
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 then
				var_382_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_382_7 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_7.x, var_382_7.y, var_382_7.z)

				local var_382_8 = var_382_0.localEulerAngles

				var_382_8.z = 0
				var_382_8.x = 0
				var_382_0.localEulerAngles = var_382_8
			end

			local var_382_9 = arg_379_1.actors_["1028ui_story"]
			local var_382_10 = 0

			if var_382_10 < arg_379_1.time_ and arg_379_1.time_ <= var_382_10 + arg_382_0 and arg_379_1.var_.characterEffect1028ui_story == nil then
				arg_379_1.var_.characterEffect1028ui_story = var_382_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_11 = 0.200000002980232

			if var_382_10 <= arg_379_1.time_ and arg_379_1.time_ < var_382_10 + var_382_11 then
				local var_382_12 = (arg_379_1.time_ - var_382_10) / var_382_11

				if arg_379_1.var_.characterEffect1028ui_story then
					arg_379_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_379_1.time_ >= var_382_10 + var_382_11 and arg_379_1.time_ < var_382_10 + var_382_11 + arg_382_0 and arg_379_1.var_.characterEffect1028ui_story then
				arg_379_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_382_13 = 0

			if var_382_13 < arg_379_1.time_ and arg_379_1.time_ <= var_382_13 + arg_382_0 then
				arg_379_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_382_14 = 0

			if var_382_14 < arg_379_1.time_ and arg_379_1.time_ <= var_382_14 + arg_382_0 then
				arg_379_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_382_15 = 0
			local var_382_16 = 0.125

			if var_382_15 < arg_379_1.time_ and arg_379_1.time_ <= var_382_15 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_17 = arg_379_1:FormatText(StoryNameCfg[327].name)

				arg_379_1.leftNameTxt_.text = var_382_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_18 = arg_379_1:GetWordFromCfg(1102805092)
				local var_382_19 = arg_379_1:FormatText(var_382_18.content)

				arg_379_1.text_.text = var_382_19

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_20 = 5
				local var_382_21 = utf8.len(var_382_19)
				local var_382_22 = var_382_20 <= 0 and var_382_16 or var_382_16 * (var_382_21 / var_382_20)

				if var_382_22 > 0 and var_382_16 < var_382_22 then
					arg_379_1.talkMaxDuration = var_382_22

					if var_382_22 + var_382_15 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_22 + var_382_15
					end
				end

				arg_379_1.text_.text = var_382_19
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805092", "story_v_side_new_1102805.awb") ~= 0 then
					local var_382_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805092", "story_v_side_new_1102805.awb") / 1000

					if var_382_23 + var_382_15 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_23 + var_382_15
					end

					if var_382_18.prefab_name ~= "" and arg_379_1.actors_[var_382_18.prefab_name] ~= nil then
						local var_382_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_18.prefab_name].transform, "story_v_side_new_1102805", "1102805092", "story_v_side_new_1102805.awb")

						arg_379_1:RecordAudio("1102805092", var_382_24)
						arg_379_1:RecordAudio("1102805092", var_382_24)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805092", "story_v_side_new_1102805.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805092", "story_v_side_new_1102805.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_25 = math.max(var_382_16, arg_379_1.talkMaxDuration)

			if var_382_15 <= arg_379_1.time_ and arg_379_1.time_ < var_382_15 + var_382_25 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_15) / var_382_25

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_15 + var_382_25 and arg_379_1.time_ < var_382_15 + var_382_25 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805093 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 1102805093
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play1102805094(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1028ui_story"]
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 and arg_383_1.var_.characterEffect1028ui_story == nil then
				arg_383_1.var_.characterEffect1028ui_story = var_386_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_2 = 0.200000002980232

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2

				if arg_383_1.var_.characterEffect1028ui_story then
					local var_386_4 = Mathf.Lerp(0, 0.5, var_386_3)

					arg_383_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_383_1.var_.characterEffect1028ui_story.fillRatio = var_386_4
				end
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 and arg_383_1.var_.characterEffect1028ui_story then
				local var_386_5 = 0.5

				arg_383_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_383_1.var_.characterEffect1028ui_story.fillRatio = var_386_5
			end

			local var_386_6 = 0
			local var_386_7 = 0.45

			if var_386_6 < arg_383_1.time_ and arg_383_1.time_ <= var_386_6 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_8 = arg_383_1:FormatText(StoryNameCfg[7].name)

				arg_383_1.leftNameTxt_.text = var_386_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_9 = arg_383_1:GetWordFromCfg(1102805093)
				local var_386_10 = arg_383_1:FormatText(var_386_9.content)

				arg_383_1.text_.text = var_386_10

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_11 = 18
				local var_386_12 = utf8.len(var_386_10)
				local var_386_13 = var_386_11 <= 0 and var_386_7 or var_386_7 * (var_386_12 / var_386_11)

				if var_386_13 > 0 and var_386_7 < var_386_13 then
					arg_383_1.talkMaxDuration = var_386_13

					if var_386_13 + var_386_6 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_13 + var_386_6
					end
				end

				arg_383_1.text_.text = var_386_10
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_14 = math.max(var_386_7, arg_383_1.talkMaxDuration)

			if var_386_6 <= arg_383_1.time_ and arg_383_1.time_ < var_386_6 + var_386_14 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_6) / var_386_14

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_6 + var_386_14 and arg_383_1.time_ < var_386_6 + var_386_14 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805094 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 1102805094
		arg_387_1.duration_ = 5.3

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play1102805095(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["1028ui_story"].transform
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 then
				arg_387_1.var_.moveOldPos1028ui_story = var_390_0.localPosition
			end

			local var_390_2 = 0.001

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_2 then
				local var_390_3 = (arg_387_1.time_ - var_390_1) / var_390_2
				local var_390_4 = Vector3.New(0, -0.9, -5.9)

				var_390_0.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos1028ui_story, var_390_4, var_390_3)

				local var_390_5 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_5.x, var_390_5.y, var_390_5.z)

				local var_390_6 = var_390_0.localEulerAngles

				var_390_6.z = 0
				var_390_6.x = 0
				var_390_0.localEulerAngles = var_390_6
			end

			if arg_387_1.time_ >= var_390_1 + var_390_2 and arg_387_1.time_ < var_390_1 + var_390_2 + arg_390_0 then
				var_390_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_390_7 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_7.x, var_390_7.y, var_390_7.z)

				local var_390_8 = var_390_0.localEulerAngles

				var_390_8.z = 0
				var_390_8.x = 0
				var_390_0.localEulerAngles = var_390_8
			end

			local var_390_9 = arg_387_1.actors_["1028ui_story"]
			local var_390_10 = 0

			if var_390_10 < arg_387_1.time_ and arg_387_1.time_ <= var_390_10 + arg_390_0 and arg_387_1.var_.characterEffect1028ui_story == nil then
				arg_387_1.var_.characterEffect1028ui_story = var_390_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_11 = 0.200000002980232

			if var_390_10 <= arg_387_1.time_ and arg_387_1.time_ < var_390_10 + var_390_11 then
				local var_390_12 = (arg_387_1.time_ - var_390_10) / var_390_11

				if arg_387_1.var_.characterEffect1028ui_story then
					arg_387_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_387_1.time_ >= var_390_10 + var_390_11 and arg_387_1.time_ < var_390_10 + var_390_11 + arg_390_0 and arg_387_1.var_.characterEffect1028ui_story then
				arg_387_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_390_13 = 0

			if var_390_13 < arg_387_1.time_ and arg_387_1.time_ <= var_390_13 + arg_390_0 then
				arg_387_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_2")
			end

			local var_390_14 = 0

			if var_390_14 < arg_387_1.time_ and arg_387_1.time_ <= var_390_14 + arg_390_0 then
				arg_387_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_390_15 = 0
			local var_390_16 = 0.675

			if var_390_15 < arg_387_1.time_ and arg_387_1.time_ <= var_390_15 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_17 = arg_387_1:FormatText(StoryNameCfg[327].name)

				arg_387_1.leftNameTxt_.text = var_390_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_18 = arg_387_1:GetWordFromCfg(1102805094)
				local var_390_19 = arg_387_1:FormatText(var_390_18.content)

				arg_387_1.text_.text = var_390_19

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_20 = 27
				local var_390_21 = utf8.len(var_390_19)
				local var_390_22 = var_390_20 <= 0 and var_390_16 or var_390_16 * (var_390_21 / var_390_20)

				if var_390_22 > 0 and var_390_16 < var_390_22 then
					arg_387_1.talkMaxDuration = var_390_22

					if var_390_22 + var_390_15 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_22 + var_390_15
					end
				end

				arg_387_1.text_.text = var_390_19
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805094", "story_v_side_new_1102805.awb") ~= 0 then
					local var_390_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805094", "story_v_side_new_1102805.awb") / 1000

					if var_390_23 + var_390_15 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_23 + var_390_15
					end

					if var_390_18.prefab_name ~= "" and arg_387_1.actors_[var_390_18.prefab_name] ~= nil then
						local var_390_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_18.prefab_name].transform, "story_v_side_new_1102805", "1102805094", "story_v_side_new_1102805.awb")

						arg_387_1:RecordAudio("1102805094", var_390_24)
						arg_387_1:RecordAudio("1102805094", var_390_24)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805094", "story_v_side_new_1102805.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805094", "story_v_side_new_1102805.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_25 = math.max(var_390_16, arg_387_1.talkMaxDuration)

			if var_390_15 <= arg_387_1.time_ and arg_387_1.time_ < var_390_15 + var_390_25 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_15) / var_390_25

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_15 + var_390_25 and arg_387_1.time_ < var_390_15 + var_390_25 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805095 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 1102805095
		arg_391_1.duration_ = 2.966

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play1102805096(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = 0

			if var_394_0 < arg_391_1.time_ and arg_391_1.time_ <= var_394_0 + arg_394_0 then
				arg_391_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_394_1 = 0
			local var_394_2 = 0.3

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_3 = arg_391_1:FormatText(StoryNameCfg[327].name)

				arg_391_1.leftNameTxt_.text = var_394_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_4 = arg_391_1:GetWordFromCfg(1102805095)
				local var_394_5 = arg_391_1:FormatText(var_394_4.content)

				arg_391_1.text_.text = var_394_5

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_6 = 12
				local var_394_7 = utf8.len(var_394_5)
				local var_394_8 = var_394_6 <= 0 and var_394_2 or var_394_2 * (var_394_7 / var_394_6)

				if var_394_8 > 0 and var_394_2 < var_394_8 then
					arg_391_1.talkMaxDuration = var_394_8

					if var_394_8 + var_394_1 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_8 + var_394_1
					end
				end

				arg_391_1.text_.text = var_394_5
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805095", "story_v_side_new_1102805.awb") ~= 0 then
					local var_394_9 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805095", "story_v_side_new_1102805.awb") / 1000

					if var_394_9 + var_394_1 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_9 + var_394_1
					end

					if var_394_4.prefab_name ~= "" and arg_391_1.actors_[var_394_4.prefab_name] ~= nil then
						local var_394_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_4.prefab_name].transform, "story_v_side_new_1102805", "1102805095", "story_v_side_new_1102805.awb")

						arg_391_1:RecordAudio("1102805095", var_394_10)
						arg_391_1:RecordAudio("1102805095", var_394_10)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805095", "story_v_side_new_1102805.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805095", "story_v_side_new_1102805.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_11 = math.max(var_394_2, arg_391_1.talkMaxDuration)

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_11 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_1) / var_394_11

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_1 + var_394_11 and arg_391_1.time_ < var_394_1 + var_394_11 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805096 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 1102805096
		arg_395_1.duration_ = 5

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play1102805097(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1028ui_story"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos1028ui_story = var_398_0.localPosition
			end

			local var_398_2 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2
				local var_398_4 = Vector3.New(0, 100, 0)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1028ui_story, var_398_4, var_398_3)

				local var_398_5 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_5.x, var_398_5.y, var_398_5.z)

				local var_398_6 = var_398_0.localEulerAngles

				var_398_6.z = 0
				var_398_6.x = 0
				var_398_0.localEulerAngles = var_398_6
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(0, 100, 0)

				local var_398_7 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_7.x, var_398_7.y, var_398_7.z)

				local var_398_8 = var_398_0.localEulerAngles

				var_398_8.z = 0
				var_398_8.x = 0
				var_398_0.localEulerAngles = var_398_8
			end

			local var_398_9 = arg_395_1.actors_["1028ui_story"]
			local var_398_10 = 0

			if var_398_10 < arg_395_1.time_ and arg_395_1.time_ <= var_398_10 + arg_398_0 and arg_395_1.var_.characterEffect1028ui_story == nil then
				arg_395_1.var_.characterEffect1028ui_story = var_398_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_11 = 0.200000002980232

			if var_398_10 <= arg_395_1.time_ and arg_395_1.time_ < var_398_10 + var_398_11 then
				local var_398_12 = (arg_395_1.time_ - var_398_10) / var_398_11

				if arg_395_1.var_.characterEffect1028ui_story then
					local var_398_13 = Mathf.Lerp(0, 0.5, var_398_12)

					arg_395_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1028ui_story.fillRatio = var_398_13
				end
			end

			if arg_395_1.time_ >= var_398_10 + var_398_11 and arg_395_1.time_ < var_398_10 + var_398_11 + arg_398_0 and arg_395_1.var_.characterEffect1028ui_story then
				local var_398_14 = 0.5

				arg_395_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1028ui_story.fillRatio = var_398_14
			end

			local var_398_15 = 0
			local var_398_16 = 0.7

			if var_398_15 < arg_395_1.time_ and arg_395_1.time_ <= var_398_15 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, false)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_17 = arg_395_1:GetWordFromCfg(1102805096)
				local var_398_18 = arg_395_1:FormatText(var_398_17.content)

				arg_395_1.text_.text = var_398_18

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_19 = 28
				local var_398_20 = utf8.len(var_398_18)
				local var_398_21 = var_398_19 <= 0 and var_398_16 or var_398_16 * (var_398_20 / var_398_19)

				if var_398_21 > 0 and var_398_16 < var_398_21 then
					arg_395_1.talkMaxDuration = var_398_21

					if var_398_21 + var_398_15 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_21 + var_398_15
					end
				end

				arg_395_1.text_.text = var_398_18
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_22 = math.max(var_398_16, arg_395_1.talkMaxDuration)

			if var_398_15 <= arg_395_1.time_ and arg_395_1.time_ < var_398_15 + var_398_22 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_15) / var_398_22

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_15 + var_398_22 and arg_395_1.time_ < var_398_15 + var_398_22 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805097 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 1102805097
		arg_399_1.duration_ = 4.066

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play1102805098(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1028ui_story"].transform
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 then
				arg_399_1.var_.moveOldPos1028ui_story = var_402_0.localPosition
			end

			local var_402_2 = 0.001

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2
				local var_402_4 = Vector3.New(0, -0.9, -5.9)

				var_402_0.localPosition = Vector3.Lerp(arg_399_1.var_.moveOldPos1028ui_story, var_402_4, var_402_3)

				local var_402_5 = manager.ui.mainCamera.transform.position - var_402_0.position

				var_402_0.forward = Vector3.New(var_402_5.x, var_402_5.y, var_402_5.z)

				local var_402_6 = var_402_0.localEulerAngles

				var_402_6.z = 0
				var_402_6.x = 0
				var_402_0.localEulerAngles = var_402_6
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 then
				var_402_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_402_7 = manager.ui.mainCamera.transform.position - var_402_0.position

				var_402_0.forward = Vector3.New(var_402_7.x, var_402_7.y, var_402_7.z)

				local var_402_8 = var_402_0.localEulerAngles

				var_402_8.z = 0
				var_402_8.x = 0
				var_402_0.localEulerAngles = var_402_8
			end

			local var_402_9 = arg_399_1.actors_["1028ui_story"]
			local var_402_10 = 0

			if var_402_10 < arg_399_1.time_ and arg_399_1.time_ <= var_402_10 + arg_402_0 and arg_399_1.var_.characterEffect1028ui_story == nil then
				arg_399_1.var_.characterEffect1028ui_story = var_402_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_11 = 0.200000002980232

			if var_402_10 <= arg_399_1.time_ and arg_399_1.time_ < var_402_10 + var_402_11 then
				local var_402_12 = (arg_399_1.time_ - var_402_10) / var_402_11

				if arg_399_1.var_.characterEffect1028ui_story then
					arg_399_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_399_1.time_ >= var_402_10 + var_402_11 and arg_399_1.time_ < var_402_10 + var_402_11 + arg_402_0 and arg_399_1.var_.characterEffect1028ui_story then
				arg_399_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_402_13 = 0

			if var_402_13 < arg_399_1.time_ and arg_399_1.time_ <= var_402_13 + arg_402_0 then
				arg_399_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_1")
			end

			local var_402_14 = 0

			if var_402_14 < arg_399_1.time_ and arg_399_1.time_ <= var_402_14 + arg_402_0 then
				arg_399_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_402_15 = 0
			local var_402_16 = 0.275

			if var_402_15 < arg_399_1.time_ and arg_399_1.time_ <= var_402_15 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_17 = arg_399_1:FormatText(StoryNameCfg[327].name)

				arg_399_1.leftNameTxt_.text = var_402_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_18 = arg_399_1:GetWordFromCfg(1102805097)
				local var_402_19 = arg_399_1:FormatText(var_402_18.content)

				arg_399_1.text_.text = var_402_19

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_20 = 11
				local var_402_21 = utf8.len(var_402_19)
				local var_402_22 = var_402_20 <= 0 and var_402_16 or var_402_16 * (var_402_21 / var_402_20)

				if var_402_22 > 0 and var_402_16 < var_402_22 then
					arg_399_1.talkMaxDuration = var_402_22

					if var_402_22 + var_402_15 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_22 + var_402_15
					end
				end

				arg_399_1.text_.text = var_402_19
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805097", "story_v_side_new_1102805.awb") ~= 0 then
					local var_402_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805097", "story_v_side_new_1102805.awb") / 1000

					if var_402_23 + var_402_15 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_23 + var_402_15
					end

					if var_402_18.prefab_name ~= "" and arg_399_1.actors_[var_402_18.prefab_name] ~= nil then
						local var_402_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_18.prefab_name].transform, "story_v_side_new_1102805", "1102805097", "story_v_side_new_1102805.awb")

						arg_399_1:RecordAudio("1102805097", var_402_24)
						arg_399_1:RecordAudio("1102805097", var_402_24)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805097", "story_v_side_new_1102805.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805097", "story_v_side_new_1102805.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_25 = math.max(var_402_16, arg_399_1.talkMaxDuration)

			if var_402_15 <= arg_399_1.time_ and arg_399_1.time_ < var_402_15 + var_402_25 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_15) / var_402_25

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_15 + var_402_25 and arg_399_1.time_ < var_402_15 + var_402_25 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805098 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 1102805098
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play1102805099(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1028ui_story"]
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 and arg_403_1.var_.characterEffect1028ui_story == nil then
				arg_403_1.var_.characterEffect1028ui_story = var_406_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_2 = 0.200000002980232

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2

				if arg_403_1.var_.characterEffect1028ui_story then
					local var_406_4 = Mathf.Lerp(0, 0.5, var_406_3)

					arg_403_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1028ui_story.fillRatio = var_406_4
				end
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 and arg_403_1.var_.characterEffect1028ui_story then
				local var_406_5 = 0.5

				arg_403_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1028ui_story.fillRatio = var_406_5
			end

			local var_406_6 = 0
			local var_406_7 = 0.05

			if var_406_6 < arg_403_1.time_ and arg_403_1.time_ <= var_406_6 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_8 = arg_403_1:FormatText(StoryNameCfg[7].name)

				arg_403_1.leftNameTxt_.text = var_406_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_9 = arg_403_1:GetWordFromCfg(1102805098)
				local var_406_10 = arg_403_1:FormatText(var_406_9.content)

				arg_403_1.text_.text = var_406_10

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_11 = 2
				local var_406_12 = utf8.len(var_406_10)
				local var_406_13 = var_406_11 <= 0 and var_406_7 or var_406_7 * (var_406_12 / var_406_11)

				if var_406_13 > 0 and var_406_7 < var_406_13 then
					arg_403_1.talkMaxDuration = var_406_13

					if var_406_13 + var_406_6 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_13 + var_406_6
					end
				end

				arg_403_1.text_.text = var_406_10
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_14 = math.max(var_406_7, arg_403_1.talkMaxDuration)

			if var_406_6 <= arg_403_1.time_ and arg_403_1.time_ < var_406_6 + var_406_14 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_6) / var_406_14

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_6 + var_406_14 and arg_403_1.time_ < var_406_6 + var_406_14 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805099 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 1102805099
		arg_407_1.duration_ = 2.433

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play1102805100(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1028ui_story"].transform
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 then
				arg_407_1.var_.moveOldPos1028ui_story = var_410_0.localPosition
			end

			local var_410_2 = 0.001

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2
				local var_410_4 = Vector3.New(0, -0.9, -5.9)

				var_410_0.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos1028ui_story, var_410_4, var_410_3)

				local var_410_5 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_5.x, var_410_5.y, var_410_5.z)

				local var_410_6 = var_410_0.localEulerAngles

				var_410_6.z = 0
				var_410_6.x = 0
				var_410_0.localEulerAngles = var_410_6
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 then
				var_410_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_410_7 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_7.x, var_410_7.y, var_410_7.z)

				local var_410_8 = var_410_0.localEulerAngles

				var_410_8.z = 0
				var_410_8.x = 0
				var_410_0.localEulerAngles = var_410_8
			end

			local var_410_9 = arg_407_1.actors_["1028ui_story"]
			local var_410_10 = 0

			if var_410_10 < arg_407_1.time_ and arg_407_1.time_ <= var_410_10 + arg_410_0 and arg_407_1.var_.characterEffect1028ui_story == nil then
				arg_407_1.var_.characterEffect1028ui_story = var_410_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_11 = 0.200000002980232

			if var_410_10 <= arg_407_1.time_ and arg_407_1.time_ < var_410_10 + var_410_11 then
				local var_410_12 = (arg_407_1.time_ - var_410_10) / var_410_11

				if arg_407_1.var_.characterEffect1028ui_story then
					arg_407_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_407_1.time_ >= var_410_10 + var_410_11 and arg_407_1.time_ < var_410_10 + var_410_11 + arg_410_0 and arg_407_1.var_.characterEffect1028ui_story then
				arg_407_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_410_13 = 0

			if var_410_13 < arg_407_1.time_ and arg_407_1.time_ <= var_410_13 + arg_410_0 then
				arg_407_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_2")
			end

			local var_410_14 = 0

			if var_410_14 < arg_407_1.time_ and arg_407_1.time_ <= var_410_14 + arg_410_0 then
				arg_407_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_410_15 = 0
			local var_410_16 = 0.3

			if var_410_15 < arg_407_1.time_ and arg_407_1.time_ <= var_410_15 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_17 = arg_407_1:FormatText(StoryNameCfg[327].name)

				arg_407_1.leftNameTxt_.text = var_410_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_18 = arg_407_1:GetWordFromCfg(1102805099)
				local var_410_19 = arg_407_1:FormatText(var_410_18.content)

				arg_407_1.text_.text = var_410_19

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_20 = 12
				local var_410_21 = utf8.len(var_410_19)
				local var_410_22 = var_410_20 <= 0 and var_410_16 or var_410_16 * (var_410_21 / var_410_20)

				if var_410_22 > 0 and var_410_16 < var_410_22 then
					arg_407_1.talkMaxDuration = var_410_22

					if var_410_22 + var_410_15 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_22 + var_410_15
					end
				end

				arg_407_1.text_.text = var_410_19
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805099", "story_v_side_new_1102805.awb") ~= 0 then
					local var_410_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805099", "story_v_side_new_1102805.awb") / 1000

					if var_410_23 + var_410_15 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_23 + var_410_15
					end

					if var_410_18.prefab_name ~= "" and arg_407_1.actors_[var_410_18.prefab_name] ~= nil then
						local var_410_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_18.prefab_name].transform, "story_v_side_new_1102805", "1102805099", "story_v_side_new_1102805.awb")

						arg_407_1:RecordAudio("1102805099", var_410_24)
						arg_407_1:RecordAudio("1102805099", var_410_24)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805099", "story_v_side_new_1102805.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805099", "story_v_side_new_1102805.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_25 = math.max(var_410_16, arg_407_1.talkMaxDuration)

			if var_410_15 <= arg_407_1.time_ and arg_407_1.time_ < var_410_15 + var_410_25 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_15) / var_410_25

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_15 + var_410_25 and arg_407_1.time_ < var_410_15 + var_410_25 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805100 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 1102805100
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play1102805101(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["1028ui_story"]
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 and arg_411_1.var_.characterEffect1028ui_story == nil then
				arg_411_1.var_.characterEffect1028ui_story = var_414_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_2 = 0.200000002980232

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2

				if arg_411_1.var_.characterEffect1028ui_story then
					local var_414_4 = Mathf.Lerp(0, 0.5, var_414_3)

					arg_411_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_411_1.var_.characterEffect1028ui_story.fillRatio = var_414_4
				end
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 and arg_411_1.var_.characterEffect1028ui_story then
				local var_414_5 = 0.5

				arg_411_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_411_1.var_.characterEffect1028ui_story.fillRatio = var_414_5
			end

			local var_414_6 = 0
			local var_414_7 = 0.525

			if var_414_6 < arg_411_1.time_ and arg_411_1.time_ <= var_414_6 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_8 = arg_411_1:FormatText(StoryNameCfg[7].name)

				arg_411_1.leftNameTxt_.text = var_414_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_9 = arg_411_1:GetWordFromCfg(1102805100)
				local var_414_10 = arg_411_1:FormatText(var_414_9.content)

				arg_411_1.text_.text = var_414_10

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_11 = 21
				local var_414_12 = utf8.len(var_414_10)
				local var_414_13 = var_414_11 <= 0 and var_414_7 or var_414_7 * (var_414_12 / var_414_11)

				if var_414_13 > 0 and var_414_7 < var_414_13 then
					arg_411_1.talkMaxDuration = var_414_13

					if var_414_13 + var_414_6 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_13 + var_414_6
					end
				end

				arg_411_1.text_.text = var_414_10
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)
				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_14 = math.max(var_414_7, arg_411_1.talkMaxDuration)

			if var_414_6 <= arg_411_1.time_ and arg_411_1.time_ < var_414_6 + var_414_14 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_6) / var_414_14

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_6 + var_414_14 and arg_411_1.time_ < var_414_6 + var_414_14 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805101 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 1102805101
		arg_415_1.duration_ = 6.6

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play1102805102(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["1028ui_story"].transform
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 then
				arg_415_1.var_.moveOldPos1028ui_story = var_418_0.localPosition
			end

			local var_418_2 = 0.001

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2
				local var_418_4 = Vector3.New(0, -0.9, -5.9)

				var_418_0.localPosition = Vector3.Lerp(arg_415_1.var_.moveOldPos1028ui_story, var_418_4, var_418_3)

				local var_418_5 = manager.ui.mainCamera.transform.position - var_418_0.position

				var_418_0.forward = Vector3.New(var_418_5.x, var_418_5.y, var_418_5.z)

				local var_418_6 = var_418_0.localEulerAngles

				var_418_6.z = 0
				var_418_6.x = 0
				var_418_0.localEulerAngles = var_418_6
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 then
				var_418_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_418_7 = manager.ui.mainCamera.transform.position - var_418_0.position

				var_418_0.forward = Vector3.New(var_418_7.x, var_418_7.y, var_418_7.z)

				local var_418_8 = var_418_0.localEulerAngles

				var_418_8.z = 0
				var_418_8.x = 0
				var_418_0.localEulerAngles = var_418_8
			end

			local var_418_9 = arg_415_1.actors_["1028ui_story"]
			local var_418_10 = 0

			if var_418_10 < arg_415_1.time_ and arg_415_1.time_ <= var_418_10 + arg_418_0 and arg_415_1.var_.characterEffect1028ui_story == nil then
				arg_415_1.var_.characterEffect1028ui_story = var_418_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_11 = 0.200000002980232

			if var_418_10 <= arg_415_1.time_ and arg_415_1.time_ < var_418_10 + var_418_11 then
				local var_418_12 = (arg_415_1.time_ - var_418_10) / var_418_11

				if arg_415_1.var_.characterEffect1028ui_story then
					arg_415_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_415_1.time_ >= var_418_10 + var_418_11 and arg_415_1.time_ < var_418_10 + var_418_11 + arg_418_0 and arg_415_1.var_.characterEffect1028ui_story then
				arg_415_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_418_13 = 0

			if var_418_13 < arg_415_1.time_ and arg_415_1.time_ <= var_418_13 + arg_418_0 then
				arg_415_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_418_14 = 0
			local var_418_15 = 0.725

			if var_418_14 < arg_415_1.time_ and arg_415_1.time_ <= var_418_14 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_16 = arg_415_1:FormatText(StoryNameCfg[327].name)

				arg_415_1.leftNameTxt_.text = var_418_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_17 = arg_415_1:GetWordFromCfg(1102805101)
				local var_418_18 = arg_415_1:FormatText(var_418_17.content)

				arg_415_1.text_.text = var_418_18

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_19 = 29
				local var_418_20 = utf8.len(var_418_18)
				local var_418_21 = var_418_19 <= 0 and var_418_15 or var_418_15 * (var_418_20 / var_418_19)

				if var_418_21 > 0 and var_418_15 < var_418_21 then
					arg_415_1.talkMaxDuration = var_418_21

					if var_418_21 + var_418_14 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_21 + var_418_14
					end
				end

				arg_415_1.text_.text = var_418_18
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805101", "story_v_side_new_1102805.awb") ~= 0 then
					local var_418_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805101", "story_v_side_new_1102805.awb") / 1000

					if var_418_22 + var_418_14 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_22 + var_418_14
					end

					if var_418_17.prefab_name ~= "" and arg_415_1.actors_[var_418_17.prefab_name] ~= nil then
						local var_418_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_415_1.actors_[var_418_17.prefab_name].transform, "story_v_side_new_1102805", "1102805101", "story_v_side_new_1102805.awb")

						arg_415_1:RecordAudio("1102805101", var_418_23)
						arg_415_1:RecordAudio("1102805101", var_418_23)
					else
						arg_415_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805101", "story_v_side_new_1102805.awb")
					end

					arg_415_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805101", "story_v_side_new_1102805.awb")
				end

				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_24 = math.max(var_418_15, arg_415_1.talkMaxDuration)

			if var_418_14 <= arg_415_1.time_ and arg_415_1.time_ < var_418_14 + var_418_24 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_14) / var_418_24

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_14 + var_418_24 and arg_415_1.time_ < var_418_14 + var_418_24 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805102 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 1102805102
		arg_419_1.duration_ = 5

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play1102805103(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1028ui_story"].transform
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 then
				arg_419_1.var_.moveOldPos1028ui_story = var_422_0.localPosition
			end

			local var_422_2 = 0.001

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2
				local var_422_4 = Vector3.New(0, 100, 0)

				var_422_0.localPosition = Vector3.Lerp(arg_419_1.var_.moveOldPos1028ui_story, var_422_4, var_422_3)

				local var_422_5 = manager.ui.mainCamera.transform.position - var_422_0.position

				var_422_0.forward = Vector3.New(var_422_5.x, var_422_5.y, var_422_5.z)

				local var_422_6 = var_422_0.localEulerAngles

				var_422_6.z = 0
				var_422_6.x = 0
				var_422_0.localEulerAngles = var_422_6
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 then
				var_422_0.localPosition = Vector3.New(0, 100, 0)

				local var_422_7 = manager.ui.mainCamera.transform.position - var_422_0.position

				var_422_0.forward = Vector3.New(var_422_7.x, var_422_7.y, var_422_7.z)

				local var_422_8 = var_422_0.localEulerAngles

				var_422_8.z = 0
				var_422_8.x = 0
				var_422_0.localEulerAngles = var_422_8
			end

			local var_422_9 = arg_419_1.actors_["1028ui_story"]
			local var_422_10 = 0

			if var_422_10 < arg_419_1.time_ and arg_419_1.time_ <= var_422_10 + arg_422_0 and arg_419_1.var_.characterEffect1028ui_story == nil then
				arg_419_1.var_.characterEffect1028ui_story = var_422_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_11 = 0.200000002980232

			if var_422_10 <= arg_419_1.time_ and arg_419_1.time_ < var_422_10 + var_422_11 then
				local var_422_12 = (arg_419_1.time_ - var_422_10) / var_422_11

				if arg_419_1.var_.characterEffect1028ui_story then
					local var_422_13 = Mathf.Lerp(0, 0.5, var_422_12)

					arg_419_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_419_1.var_.characterEffect1028ui_story.fillRatio = var_422_13
				end
			end

			if arg_419_1.time_ >= var_422_10 + var_422_11 and arg_419_1.time_ < var_422_10 + var_422_11 + arg_422_0 and arg_419_1.var_.characterEffect1028ui_story then
				local var_422_14 = 0.5

				arg_419_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_419_1.var_.characterEffect1028ui_story.fillRatio = var_422_14
			end

			local var_422_15 = 0
			local var_422_16 = 0.6

			if var_422_15 < arg_419_1.time_ and arg_419_1.time_ <= var_422_15 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, false)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_17 = arg_419_1:GetWordFromCfg(1102805102)
				local var_422_18 = arg_419_1:FormatText(var_422_17.content)

				arg_419_1.text_.text = var_422_18

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_19 = 24
				local var_422_20 = utf8.len(var_422_18)
				local var_422_21 = var_422_19 <= 0 and var_422_16 or var_422_16 * (var_422_20 / var_422_19)

				if var_422_21 > 0 and var_422_16 < var_422_21 then
					arg_419_1.talkMaxDuration = var_422_21

					if var_422_21 + var_422_15 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_21 + var_422_15
					end
				end

				arg_419_1.text_.text = var_422_18
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)
				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_22 = math.max(var_422_16, arg_419_1.talkMaxDuration)

			if var_422_15 <= arg_419_1.time_ and arg_419_1.time_ < var_422_15 + var_422_22 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_15) / var_422_22

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_15 + var_422_22 and arg_419_1.time_ < var_422_15 + var_422_22 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805103 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 1102805103
		arg_423_1.duration_ = 4.7

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play1102805104(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["1028ui_story"].transform
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 then
				arg_423_1.var_.moveOldPos1028ui_story = var_426_0.localPosition
			end

			local var_426_2 = 0.001

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_2 then
				local var_426_3 = (arg_423_1.time_ - var_426_1) / var_426_2
				local var_426_4 = Vector3.New(0, -0.9, -5.9)

				var_426_0.localPosition = Vector3.Lerp(arg_423_1.var_.moveOldPos1028ui_story, var_426_4, var_426_3)

				local var_426_5 = manager.ui.mainCamera.transform.position - var_426_0.position

				var_426_0.forward = Vector3.New(var_426_5.x, var_426_5.y, var_426_5.z)

				local var_426_6 = var_426_0.localEulerAngles

				var_426_6.z = 0
				var_426_6.x = 0
				var_426_0.localEulerAngles = var_426_6
			end

			if arg_423_1.time_ >= var_426_1 + var_426_2 and arg_423_1.time_ < var_426_1 + var_426_2 + arg_426_0 then
				var_426_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_426_7 = manager.ui.mainCamera.transform.position - var_426_0.position

				var_426_0.forward = Vector3.New(var_426_7.x, var_426_7.y, var_426_7.z)

				local var_426_8 = var_426_0.localEulerAngles

				var_426_8.z = 0
				var_426_8.x = 0
				var_426_0.localEulerAngles = var_426_8
			end

			local var_426_9 = arg_423_1.actors_["1028ui_story"]
			local var_426_10 = 0

			if var_426_10 < arg_423_1.time_ and arg_423_1.time_ <= var_426_10 + arg_426_0 and arg_423_1.var_.characterEffect1028ui_story == nil then
				arg_423_1.var_.characterEffect1028ui_story = var_426_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_11 = 0.200000002980232

			if var_426_10 <= arg_423_1.time_ and arg_423_1.time_ < var_426_10 + var_426_11 then
				local var_426_12 = (arg_423_1.time_ - var_426_10) / var_426_11

				if arg_423_1.var_.characterEffect1028ui_story then
					arg_423_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_423_1.time_ >= var_426_10 + var_426_11 and arg_423_1.time_ < var_426_10 + var_426_11 + arg_426_0 and arg_423_1.var_.characterEffect1028ui_story then
				arg_423_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_426_13 = 0

			if var_426_13 < arg_423_1.time_ and arg_423_1.time_ <= var_426_13 + arg_426_0 then
				arg_423_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_426_14 = 0

			if var_426_14 < arg_423_1.time_ and arg_423_1.time_ <= var_426_14 + arg_426_0 then
				arg_423_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_426_15 = 0
			local var_426_16 = 0.55

			if var_426_15 < arg_423_1.time_ and arg_423_1.time_ <= var_426_15 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_17 = arg_423_1:FormatText(StoryNameCfg[327].name)

				arg_423_1.leftNameTxt_.text = var_426_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_18 = arg_423_1:GetWordFromCfg(1102805103)
				local var_426_19 = arg_423_1:FormatText(var_426_18.content)

				arg_423_1.text_.text = var_426_19

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_20 = 22
				local var_426_21 = utf8.len(var_426_19)
				local var_426_22 = var_426_20 <= 0 and var_426_16 or var_426_16 * (var_426_21 / var_426_20)

				if var_426_22 > 0 and var_426_16 < var_426_22 then
					arg_423_1.talkMaxDuration = var_426_22

					if var_426_22 + var_426_15 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_22 + var_426_15
					end
				end

				arg_423_1.text_.text = var_426_19
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805103", "story_v_side_new_1102805.awb") ~= 0 then
					local var_426_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805103", "story_v_side_new_1102805.awb") / 1000

					if var_426_23 + var_426_15 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_23 + var_426_15
					end

					if var_426_18.prefab_name ~= "" and arg_423_1.actors_[var_426_18.prefab_name] ~= nil then
						local var_426_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_18.prefab_name].transform, "story_v_side_new_1102805", "1102805103", "story_v_side_new_1102805.awb")

						arg_423_1:RecordAudio("1102805103", var_426_24)
						arg_423_1:RecordAudio("1102805103", var_426_24)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805103", "story_v_side_new_1102805.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805103", "story_v_side_new_1102805.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_25 = math.max(var_426_16, arg_423_1.talkMaxDuration)

			if var_426_15 <= arg_423_1.time_ and arg_423_1.time_ < var_426_15 + var_426_25 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_15) / var_426_25

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_15 + var_426_25 and arg_423_1.time_ < var_426_15 + var_426_25 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805104 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 1102805104
		arg_427_1.duration_ = 5

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play1102805105(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["1028ui_story"]
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 and arg_427_1.var_.characterEffect1028ui_story == nil then
				arg_427_1.var_.characterEffect1028ui_story = var_430_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_2 = 0.200000002980232

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2

				if arg_427_1.var_.characterEffect1028ui_story then
					local var_430_4 = Mathf.Lerp(0, 0.5, var_430_3)

					arg_427_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_427_1.var_.characterEffect1028ui_story.fillRatio = var_430_4
				end
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 and arg_427_1.var_.characterEffect1028ui_story then
				local var_430_5 = 0.5

				arg_427_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_427_1.var_.characterEffect1028ui_story.fillRatio = var_430_5
			end

			local var_430_6 = 0
			local var_430_7 = 0.225

			if var_430_6 < arg_427_1.time_ and arg_427_1.time_ <= var_430_6 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_8 = arg_427_1:FormatText(StoryNameCfg[7].name)

				arg_427_1.leftNameTxt_.text = var_430_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_9 = arg_427_1:GetWordFromCfg(1102805104)
				local var_430_10 = arg_427_1:FormatText(var_430_9.content)

				arg_427_1.text_.text = var_430_10

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_11 = 9
				local var_430_12 = utf8.len(var_430_10)
				local var_430_13 = var_430_11 <= 0 and var_430_7 or var_430_7 * (var_430_12 / var_430_11)

				if var_430_13 > 0 and var_430_7 < var_430_13 then
					arg_427_1.talkMaxDuration = var_430_13

					if var_430_13 + var_430_6 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_13 + var_430_6
					end
				end

				arg_427_1.text_.text = var_430_10
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)
				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_14 = math.max(var_430_7, arg_427_1.talkMaxDuration)

			if var_430_6 <= arg_427_1.time_ and arg_427_1.time_ < var_430_6 + var_430_14 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_6) / var_430_14

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_6 + var_430_14 and arg_427_1.time_ < var_430_6 + var_430_14 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805105 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 1102805105
		arg_431_1.duration_ = 5

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play1102805106(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1028ui_story"].transform
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 then
				arg_431_1.var_.moveOldPos1028ui_story = var_434_0.localPosition
			end

			local var_434_2 = 0.001

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2
				local var_434_4 = Vector3.New(0, 100, 0)

				var_434_0.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos1028ui_story, var_434_4, var_434_3)

				local var_434_5 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_5.x, var_434_5.y, var_434_5.z)

				local var_434_6 = var_434_0.localEulerAngles

				var_434_6.z = 0
				var_434_6.x = 0
				var_434_0.localEulerAngles = var_434_6
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 then
				var_434_0.localPosition = Vector3.New(0, 100, 0)

				local var_434_7 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_7.x, var_434_7.y, var_434_7.z)

				local var_434_8 = var_434_0.localEulerAngles

				var_434_8.z = 0
				var_434_8.x = 0
				var_434_0.localEulerAngles = var_434_8
			end

			local var_434_9 = 0
			local var_434_10 = 0.8

			if var_434_9 < arg_431_1.time_ and arg_431_1.time_ <= var_434_9 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, false)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_11 = arg_431_1:GetWordFromCfg(1102805105)
				local var_434_12 = arg_431_1:FormatText(var_434_11.content)

				arg_431_1.text_.text = var_434_12

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_13 = 32
				local var_434_14 = utf8.len(var_434_12)
				local var_434_15 = var_434_13 <= 0 and var_434_10 or var_434_10 * (var_434_14 / var_434_13)

				if var_434_15 > 0 and var_434_10 < var_434_15 then
					arg_431_1.talkMaxDuration = var_434_15

					if var_434_15 + var_434_9 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_15 + var_434_9
					end
				end

				arg_431_1.text_.text = var_434_12
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_16 = math.max(var_434_10, arg_431_1.talkMaxDuration)

			if var_434_9 <= arg_431_1.time_ and arg_431_1.time_ < var_434_9 + var_434_16 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_9) / var_434_16

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_9 + var_434_16 and arg_431_1.time_ < var_434_9 + var_434_16 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805106 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 1102805106
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play1102805107(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.825

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_2 = arg_435_1:FormatText(StoryNameCfg[7].name)

				arg_435_1.leftNameTxt_.text = var_438_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_3 = arg_435_1:GetWordFromCfg(1102805106)
				local var_438_4 = arg_435_1:FormatText(var_438_3.content)

				arg_435_1.text_.text = var_438_4

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_5 = 33
				local var_438_6 = utf8.len(var_438_4)
				local var_438_7 = var_438_5 <= 0 and var_438_1 or var_438_1 * (var_438_6 / var_438_5)

				if var_438_7 > 0 and var_438_1 < var_438_7 then
					arg_435_1.talkMaxDuration = var_438_7

					if var_438_7 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_7 + var_438_0
					end
				end

				arg_435_1.text_.text = var_438_4
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_8 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_8 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_8

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_8 and arg_435_1.time_ < var_438_0 + var_438_8 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805107 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 1102805107
		arg_439_1.duration_ = 5

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play1102805108(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 0.575

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_2 = arg_439_1:FormatText(StoryNameCfg[7].name)

				arg_439_1.leftNameTxt_.text = var_442_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_3 = arg_439_1:GetWordFromCfg(1102805107)
				local var_442_4 = arg_439_1:FormatText(var_442_3.content)

				arg_439_1.text_.text = var_442_4

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_5 = 23
				local var_442_6 = utf8.len(var_442_4)
				local var_442_7 = var_442_5 <= 0 and var_442_1 or var_442_1 * (var_442_6 / var_442_5)

				if var_442_7 > 0 and var_442_1 < var_442_7 then
					arg_439_1.talkMaxDuration = var_442_7

					if var_442_7 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_7 + var_442_0
					end
				end

				arg_439_1.text_.text = var_442_4
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)
				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_8 = math.max(var_442_1, arg_439_1.talkMaxDuration)

			if var_442_0 <= arg_439_1.time_ and arg_439_1.time_ < var_442_0 + var_442_8 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_0) / var_442_8

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_0 + var_442_8 and arg_439_1.time_ < var_442_0 + var_442_8 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805108 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 1102805108
		arg_443_1.duration_ = 3.3

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play1102805109(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1028ui_story"].transform
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				arg_443_1.var_.moveOldPos1028ui_story = var_446_0.localPosition
			end

			local var_446_2 = 0.001

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2
				local var_446_4 = Vector3.New(0, -0.9, -5.9)

				var_446_0.localPosition = Vector3.Lerp(arg_443_1.var_.moveOldPos1028ui_story, var_446_4, var_446_3)

				local var_446_5 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_5.x, var_446_5.y, var_446_5.z)

				local var_446_6 = var_446_0.localEulerAngles

				var_446_6.z = 0
				var_446_6.x = 0
				var_446_0.localEulerAngles = var_446_6
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 then
				var_446_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_446_7 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_7.x, var_446_7.y, var_446_7.z)

				local var_446_8 = var_446_0.localEulerAngles

				var_446_8.z = 0
				var_446_8.x = 0
				var_446_0.localEulerAngles = var_446_8
			end

			local var_446_9 = arg_443_1.actors_["1028ui_story"]
			local var_446_10 = 0

			if var_446_10 < arg_443_1.time_ and arg_443_1.time_ <= var_446_10 + arg_446_0 and arg_443_1.var_.characterEffect1028ui_story == nil then
				arg_443_1.var_.characterEffect1028ui_story = var_446_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_11 = 0.200000002980232

			if var_446_10 <= arg_443_1.time_ and arg_443_1.time_ < var_446_10 + var_446_11 then
				local var_446_12 = (arg_443_1.time_ - var_446_10) / var_446_11

				if arg_443_1.var_.characterEffect1028ui_story then
					arg_443_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_443_1.time_ >= var_446_10 + var_446_11 and arg_443_1.time_ < var_446_10 + var_446_11 + arg_446_0 and arg_443_1.var_.characterEffect1028ui_story then
				arg_443_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_446_13 = 0

			if var_446_13 < arg_443_1.time_ and arg_443_1.time_ <= var_446_13 + arg_446_0 then
				arg_443_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_446_14 = 0

			if var_446_14 < arg_443_1.time_ and arg_443_1.time_ <= var_446_14 + arg_446_0 then
				arg_443_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_446_15 = 0
			local var_446_16 = 0.4

			if var_446_15 < arg_443_1.time_ and arg_443_1.time_ <= var_446_15 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_17 = arg_443_1:FormatText(StoryNameCfg[327].name)

				arg_443_1.leftNameTxt_.text = var_446_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_18 = arg_443_1:GetWordFromCfg(1102805108)
				local var_446_19 = arg_443_1:FormatText(var_446_18.content)

				arg_443_1.text_.text = var_446_19

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_20 = 16
				local var_446_21 = utf8.len(var_446_19)
				local var_446_22 = var_446_20 <= 0 and var_446_16 or var_446_16 * (var_446_21 / var_446_20)

				if var_446_22 > 0 and var_446_16 < var_446_22 then
					arg_443_1.talkMaxDuration = var_446_22

					if var_446_22 + var_446_15 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_22 + var_446_15
					end
				end

				arg_443_1.text_.text = var_446_19
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805108", "story_v_side_new_1102805.awb") ~= 0 then
					local var_446_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805108", "story_v_side_new_1102805.awb") / 1000

					if var_446_23 + var_446_15 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_23 + var_446_15
					end

					if var_446_18.prefab_name ~= "" and arg_443_1.actors_[var_446_18.prefab_name] ~= nil then
						local var_446_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_18.prefab_name].transform, "story_v_side_new_1102805", "1102805108", "story_v_side_new_1102805.awb")

						arg_443_1:RecordAudio("1102805108", var_446_24)
						arg_443_1:RecordAudio("1102805108", var_446_24)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805108", "story_v_side_new_1102805.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805108", "story_v_side_new_1102805.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_25 = math.max(var_446_16, arg_443_1.talkMaxDuration)

			if var_446_15 <= arg_443_1.time_ and arg_443_1.time_ < var_446_15 + var_446_25 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_15) / var_446_25

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_15 + var_446_25 and arg_443_1.time_ < var_446_15 + var_446_25 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805109 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 1102805109
		arg_447_1.duration_ = 4.6

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play1102805110(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 0.55

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_2 = arg_447_1:FormatText(StoryNameCfg[327].name)

				arg_447_1.leftNameTxt_.text = var_450_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_3 = arg_447_1:GetWordFromCfg(1102805109)
				local var_450_4 = arg_447_1:FormatText(var_450_3.content)

				arg_447_1.text_.text = var_450_4

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_5 = 22
				local var_450_6 = utf8.len(var_450_4)
				local var_450_7 = var_450_5 <= 0 and var_450_1 or var_450_1 * (var_450_6 / var_450_5)

				if var_450_7 > 0 and var_450_1 < var_450_7 then
					arg_447_1.talkMaxDuration = var_450_7

					if var_450_7 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_7 + var_450_0
					end
				end

				arg_447_1.text_.text = var_450_4
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805109", "story_v_side_new_1102805.awb") ~= 0 then
					local var_450_8 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805109", "story_v_side_new_1102805.awb") / 1000

					if var_450_8 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_8 + var_450_0
					end

					if var_450_3.prefab_name ~= "" and arg_447_1.actors_[var_450_3.prefab_name] ~= nil then
						local var_450_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_3.prefab_name].transform, "story_v_side_new_1102805", "1102805109", "story_v_side_new_1102805.awb")

						arg_447_1:RecordAudio("1102805109", var_450_9)
						arg_447_1:RecordAudio("1102805109", var_450_9)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805109", "story_v_side_new_1102805.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805109", "story_v_side_new_1102805.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_10 = math.max(var_450_1, arg_447_1.talkMaxDuration)

			if var_450_0 <= arg_447_1.time_ and arg_447_1.time_ < var_450_0 + var_450_10 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_0) / var_450_10

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_0 + var_450_10 and arg_447_1.time_ < var_450_0 + var_450_10 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805110 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 1102805110
		arg_451_1.duration_ = 5

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play1102805111(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["1028ui_story"]
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 and arg_451_1.var_.characterEffect1028ui_story == nil then
				arg_451_1.var_.characterEffect1028ui_story = var_454_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_2 = 0.200000002980232

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2

				if arg_451_1.var_.characterEffect1028ui_story then
					local var_454_4 = Mathf.Lerp(0, 0.5, var_454_3)

					arg_451_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_451_1.var_.characterEffect1028ui_story.fillRatio = var_454_4
				end
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 and arg_451_1.var_.characterEffect1028ui_story then
				local var_454_5 = 0.5

				arg_451_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_451_1.var_.characterEffect1028ui_story.fillRatio = var_454_5
			end

			local var_454_6 = 0
			local var_454_7 = 0.675

			if var_454_6 < arg_451_1.time_ and arg_451_1.time_ <= var_454_6 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_8 = arg_451_1:FormatText(StoryNameCfg[7].name)

				arg_451_1.leftNameTxt_.text = var_454_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_9 = arg_451_1:GetWordFromCfg(1102805110)
				local var_454_10 = arg_451_1:FormatText(var_454_9.content)

				arg_451_1.text_.text = var_454_10

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_11 = 27
				local var_454_12 = utf8.len(var_454_10)
				local var_454_13 = var_454_11 <= 0 and var_454_7 or var_454_7 * (var_454_12 / var_454_11)

				if var_454_13 > 0 and var_454_7 < var_454_13 then
					arg_451_1.talkMaxDuration = var_454_13

					if var_454_13 + var_454_6 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_13 + var_454_6
					end
				end

				arg_451_1.text_.text = var_454_10
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_14 = math.max(var_454_7, arg_451_1.talkMaxDuration)

			if var_454_6 <= arg_451_1.time_ and arg_451_1.time_ < var_454_6 + var_454_14 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_6) / var_454_14

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_6 + var_454_14 and arg_451_1.time_ < var_454_6 + var_454_14 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805111 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 1102805111
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play1102805112(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 0.575

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_2 = arg_455_1:FormatText(StoryNameCfg[7].name)

				arg_455_1.leftNameTxt_.text = var_458_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_3 = arg_455_1:GetWordFromCfg(1102805111)
				local var_458_4 = arg_455_1:FormatText(var_458_3.content)

				arg_455_1.text_.text = var_458_4

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_5 = 23
				local var_458_6 = utf8.len(var_458_4)
				local var_458_7 = var_458_5 <= 0 and var_458_1 or var_458_1 * (var_458_6 / var_458_5)

				if var_458_7 > 0 and var_458_1 < var_458_7 then
					arg_455_1.talkMaxDuration = var_458_7

					if var_458_7 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_7 + var_458_0
					end
				end

				arg_455_1.text_.text = var_458_4
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_8 = math.max(var_458_1, arg_455_1.talkMaxDuration)

			if var_458_0 <= arg_455_1.time_ and arg_455_1.time_ < var_458_0 + var_458_8 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_0) / var_458_8

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_0 + var_458_8 and arg_455_1.time_ < var_458_0 + var_458_8 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805112 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 1102805112
		arg_459_1.duration_ = 5

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play1102805113(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["1028ui_story"].transform
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 then
				arg_459_1.var_.moveOldPos1028ui_story = var_462_0.localPosition
			end

			local var_462_2 = 0.001

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2
				local var_462_4 = Vector3.New(0, 100, 0)

				var_462_0.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPos1028ui_story, var_462_4, var_462_3)

				local var_462_5 = manager.ui.mainCamera.transform.position - var_462_0.position

				var_462_0.forward = Vector3.New(var_462_5.x, var_462_5.y, var_462_5.z)

				local var_462_6 = var_462_0.localEulerAngles

				var_462_6.z = 0
				var_462_6.x = 0
				var_462_0.localEulerAngles = var_462_6
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 then
				var_462_0.localPosition = Vector3.New(0, 100, 0)

				local var_462_7 = manager.ui.mainCamera.transform.position - var_462_0.position

				var_462_0.forward = Vector3.New(var_462_7.x, var_462_7.y, var_462_7.z)

				local var_462_8 = var_462_0.localEulerAngles

				var_462_8.z = 0
				var_462_8.x = 0
				var_462_0.localEulerAngles = var_462_8
			end

			local var_462_9 = 0
			local var_462_10 = 0.9

			if var_462_9 < arg_459_1.time_ and arg_459_1.time_ <= var_462_9 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, false)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_11 = arg_459_1:GetWordFromCfg(1102805112)
				local var_462_12 = arg_459_1:FormatText(var_462_11.content)

				arg_459_1.text_.text = var_462_12

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_13 = 36
				local var_462_14 = utf8.len(var_462_12)
				local var_462_15 = var_462_13 <= 0 and var_462_10 or var_462_10 * (var_462_14 / var_462_13)

				if var_462_15 > 0 and var_462_10 < var_462_15 then
					arg_459_1.talkMaxDuration = var_462_15

					if var_462_15 + var_462_9 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_15 + var_462_9
					end
				end

				arg_459_1.text_.text = var_462_12
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)
				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_16 = math.max(var_462_10, arg_459_1.talkMaxDuration)

			if var_462_9 <= arg_459_1.time_ and arg_459_1.time_ < var_462_9 + var_462_16 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_9) / var_462_16

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_9 + var_462_16 and arg_459_1.time_ < var_462_9 + var_462_16 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805113 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 1102805113
		arg_463_1.duration_ = 1.999999999999

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play1102805114(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["1028ui_story"].transform
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				arg_463_1.var_.moveOldPos1028ui_story = var_466_0.localPosition
			end

			local var_466_2 = 0.001

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_2 then
				local var_466_3 = (arg_463_1.time_ - var_466_1) / var_466_2
				local var_466_4 = Vector3.New(0, -0.9, -5.9)

				var_466_0.localPosition = Vector3.Lerp(arg_463_1.var_.moveOldPos1028ui_story, var_466_4, var_466_3)

				local var_466_5 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_5.x, var_466_5.y, var_466_5.z)

				local var_466_6 = var_466_0.localEulerAngles

				var_466_6.z = 0
				var_466_6.x = 0
				var_466_0.localEulerAngles = var_466_6
			end

			if arg_463_1.time_ >= var_466_1 + var_466_2 and arg_463_1.time_ < var_466_1 + var_466_2 + arg_466_0 then
				var_466_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_466_7 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_7.x, var_466_7.y, var_466_7.z)

				local var_466_8 = var_466_0.localEulerAngles

				var_466_8.z = 0
				var_466_8.x = 0
				var_466_0.localEulerAngles = var_466_8
			end

			local var_466_9 = arg_463_1.actors_["1028ui_story"]
			local var_466_10 = 0

			if var_466_10 < arg_463_1.time_ and arg_463_1.time_ <= var_466_10 + arg_466_0 and arg_463_1.var_.characterEffect1028ui_story == nil then
				arg_463_1.var_.characterEffect1028ui_story = var_466_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_466_11 = 0.200000002980232

			if var_466_10 <= arg_463_1.time_ and arg_463_1.time_ < var_466_10 + var_466_11 then
				local var_466_12 = (arg_463_1.time_ - var_466_10) / var_466_11

				if arg_463_1.var_.characterEffect1028ui_story then
					arg_463_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_463_1.time_ >= var_466_10 + var_466_11 and arg_463_1.time_ < var_466_10 + var_466_11 + arg_466_0 and arg_463_1.var_.characterEffect1028ui_story then
				arg_463_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_466_13 = 0

			if var_466_13 < arg_463_1.time_ and arg_463_1.time_ <= var_466_13 + arg_466_0 then
				arg_463_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_466_14 = 0

			if var_466_14 < arg_463_1.time_ and arg_463_1.time_ <= var_466_14 + arg_466_0 then
				arg_463_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_466_15 = 0
			local var_466_16 = 0.225

			if var_466_15 < arg_463_1.time_ and arg_463_1.time_ <= var_466_15 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_17 = arg_463_1:FormatText(StoryNameCfg[327].name)

				arg_463_1.leftNameTxt_.text = var_466_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_18 = arg_463_1:GetWordFromCfg(1102805113)
				local var_466_19 = arg_463_1:FormatText(var_466_18.content)

				arg_463_1.text_.text = var_466_19

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_20 = 9
				local var_466_21 = utf8.len(var_466_19)
				local var_466_22 = var_466_20 <= 0 and var_466_16 or var_466_16 * (var_466_21 / var_466_20)

				if var_466_22 > 0 and var_466_16 < var_466_22 then
					arg_463_1.talkMaxDuration = var_466_22

					if var_466_22 + var_466_15 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_22 + var_466_15
					end
				end

				arg_463_1.text_.text = var_466_19
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805113", "story_v_side_new_1102805.awb") ~= 0 then
					local var_466_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805113", "story_v_side_new_1102805.awb") / 1000

					if var_466_23 + var_466_15 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_23 + var_466_15
					end

					if var_466_18.prefab_name ~= "" and arg_463_1.actors_[var_466_18.prefab_name] ~= nil then
						local var_466_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_18.prefab_name].transform, "story_v_side_new_1102805", "1102805113", "story_v_side_new_1102805.awb")

						arg_463_1:RecordAudio("1102805113", var_466_24)
						arg_463_1:RecordAudio("1102805113", var_466_24)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805113", "story_v_side_new_1102805.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805113", "story_v_side_new_1102805.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_25 = math.max(var_466_16, arg_463_1.talkMaxDuration)

			if var_466_15 <= arg_463_1.time_ and arg_463_1.time_ < var_466_15 + var_466_25 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_15) / var_466_25

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_15 + var_466_25 and arg_463_1.time_ < var_466_15 + var_466_25 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805114 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 1102805114
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play1102805115(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["1028ui_story"]
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 and arg_467_1.var_.characterEffect1028ui_story == nil then
				arg_467_1.var_.characterEffect1028ui_story = var_470_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_470_2 = 0.200000002980232

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_2 then
				local var_470_3 = (arg_467_1.time_ - var_470_1) / var_470_2

				if arg_467_1.var_.characterEffect1028ui_story then
					local var_470_4 = Mathf.Lerp(0, 0.5, var_470_3)

					arg_467_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_467_1.var_.characterEffect1028ui_story.fillRatio = var_470_4
				end
			end

			if arg_467_1.time_ >= var_470_1 + var_470_2 and arg_467_1.time_ < var_470_1 + var_470_2 + arg_470_0 and arg_467_1.var_.characterEffect1028ui_story then
				local var_470_5 = 0.5

				arg_467_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_467_1.var_.characterEffect1028ui_story.fillRatio = var_470_5
			end

			local var_470_6 = 0
			local var_470_7 = 0.65

			if var_470_6 < arg_467_1.time_ and arg_467_1.time_ <= var_470_6 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_8 = arg_467_1:FormatText(StoryNameCfg[7].name)

				arg_467_1.leftNameTxt_.text = var_470_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_9 = arg_467_1:GetWordFromCfg(1102805114)
				local var_470_10 = arg_467_1:FormatText(var_470_9.content)

				arg_467_1.text_.text = var_470_10

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_11 = 26
				local var_470_12 = utf8.len(var_470_10)
				local var_470_13 = var_470_11 <= 0 and var_470_7 or var_470_7 * (var_470_12 / var_470_11)

				if var_470_13 > 0 and var_470_7 < var_470_13 then
					arg_467_1.talkMaxDuration = var_470_13

					if var_470_13 + var_470_6 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_13 + var_470_6
					end
				end

				arg_467_1.text_.text = var_470_10
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_14 = math.max(var_470_7, arg_467_1.talkMaxDuration)

			if var_470_6 <= arg_467_1.time_ and arg_467_1.time_ < var_470_6 + var_470_14 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_6) / var_470_14

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_6 + var_470_14 and arg_467_1.time_ < var_470_6 + var_470_14 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805115 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 1102805115
		arg_471_1.duration_ = 2.8

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play1102805116(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["1028ui_story"].transform
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1.var_.moveOldPos1028ui_story = var_474_0.localPosition
			end

			local var_474_2 = 0.001

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2
				local var_474_4 = Vector3.New(0, -0.9, -5.9)

				var_474_0.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos1028ui_story, var_474_4, var_474_3)

				local var_474_5 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_5.x, var_474_5.y, var_474_5.z)

				local var_474_6 = var_474_0.localEulerAngles

				var_474_6.z = 0
				var_474_6.x = 0
				var_474_0.localEulerAngles = var_474_6
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 then
				var_474_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_474_7 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_7.x, var_474_7.y, var_474_7.z)

				local var_474_8 = var_474_0.localEulerAngles

				var_474_8.z = 0
				var_474_8.x = 0
				var_474_0.localEulerAngles = var_474_8
			end

			local var_474_9 = arg_471_1.actors_["1028ui_story"]
			local var_474_10 = 0

			if var_474_10 < arg_471_1.time_ and arg_471_1.time_ <= var_474_10 + arg_474_0 and arg_471_1.var_.characterEffect1028ui_story == nil then
				arg_471_1.var_.characterEffect1028ui_story = var_474_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_11 = 0.200000002980232

			if var_474_10 <= arg_471_1.time_ and arg_471_1.time_ < var_474_10 + var_474_11 then
				local var_474_12 = (arg_471_1.time_ - var_474_10) / var_474_11

				if arg_471_1.var_.characterEffect1028ui_story then
					arg_471_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_471_1.time_ >= var_474_10 + var_474_11 and arg_471_1.time_ < var_474_10 + var_474_11 + arg_474_0 and arg_471_1.var_.characterEffect1028ui_story then
				arg_471_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_474_13 = 0

			if var_474_13 < arg_471_1.time_ and arg_471_1.time_ <= var_474_13 + arg_474_0 then
				arg_471_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_474_14 = 0
			local var_474_15 = 0.15

			if var_474_14 < arg_471_1.time_ and arg_471_1.time_ <= var_474_14 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_16 = arg_471_1:FormatText(StoryNameCfg[327].name)

				arg_471_1.leftNameTxt_.text = var_474_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_17 = arg_471_1:GetWordFromCfg(1102805115)
				local var_474_18 = arg_471_1:FormatText(var_474_17.content)

				arg_471_1.text_.text = var_474_18

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_19 = 6
				local var_474_20 = utf8.len(var_474_18)
				local var_474_21 = var_474_19 <= 0 and var_474_15 or var_474_15 * (var_474_20 / var_474_19)

				if var_474_21 > 0 and var_474_15 < var_474_21 then
					arg_471_1.talkMaxDuration = var_474_21

					if var_474_21 + var_474_14 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_21 + var_474_14
					end
				end

				arg_471_1.text_.text = var_474_18
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805115", "story_v_side_new_1102805.awb") ~= 0 then
					local var_474_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805115", "story_v_side_new_1102805.awb") / 1000

					if var_474_22 + var_474_14 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_22 + var_474_14
					end

					if var_474_17.prefab_name ~= "" and arg_471_1.actors_[var_474_17.prefab_name] ~= nil then
						local var_474_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_17.prefab_name].transform, "story_v_side_new_1102805", "1102805115", "story_v_side_new_1102805.awb")

						arg_471_1:RecordAudio("1102805115", var_474_23)
						arg_471_1:RecordAudio("1102805115", var_474_23)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805115", "story_v_side_new_1102805.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805115", "story_v_side_new_1102805.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_24 = math.max(var_474_15, arg_471_1.talkMaxDuration)

			if var_474_14 <= arg_471_1.time_ and arg_471_1.time_ < var_474_14 + var_474_24 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_14) / var_474_24

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_14 + var_474_24 and arg_471_1.time_ < var_474_14 + var_474_24 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805116 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 1102805116
		arg_475_1.duration_ = 5

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play1102805117(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["1028ui_story"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos1028ui_story = var_478_0.localPosition
			end

			local var_478_2 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2
				local var_478_4 = Vector3.New(0, 100, 0)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos1028ui_story, var_478_4, var_478_3)

				local var_478_5 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_5.x, var_478_5.y, var_478_5.z)

				local var_478_6 = var_478_0.localEulerAngles

				var_478_6.z = 0
				var_478_6.x = 0
				var_478_0.localEulerAngles = var_478_6
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(0, 100, 0)

				local var_478_7 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_7.x, var_478_7.y, var_478_7.z)

				local var_478_8 = var_478_0.localEulerAngles

				var_478_8.z = 0
				var_478_8.x = 0
				var_478_0.localEulerAngles = var_478_8
			end

			local var_478_9 = 0
			local var_478_10 = 0.675

			if var_478_9 < arg_475_1.time_ and arg_475_1.time_ <= var_478_9 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, false)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_11 = arg_475_1:GetWordFromCfg(1102805116)
				local var_478_12 = arg_475_1:FormatText(var_478_11.content)

				arg_475_1.text_.text = var_478_12

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_13 = 27
				local var_478_14 = utf8.len(var_478_12)
				local var_478_15 = var_478_13 <= 0 and var_478_10 or var_478_10 * (var_478_14 / var_478_13)

				if var_478_15 > 0 and var_478_10 < var_478_15 then
					arg_475_1.talkMaxDuration = var_478_15

					if var_478_15 + var_478_9 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_15 + var_478_9
					end
				end

				arg_475_1.text_.text = var_478_12
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)
				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_16 = math.max(var_478_10, arg_475_1.talkMaxDuration)

			if var_478_9 <= arg_475_1.time_ and arg_475_1.time_ < var_478_9 + var_478_16 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_9) / var_478_16

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_9 + var_478_16 and arg_475_1.time_ < var_478_9 + var_478_16 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805117 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 1102805117
		arg_479_1.duration_ = 5

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play1102805118(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = "3013_tpose"

			if arg_479_1.actors_[var_482_0] == nil then
				local var_482_1 = Object.Instantiate(Asset.Load("Char/" .. var_482_0), arg_479_1.stage_.transform)

				var_482_1.name = var_482_0
				var_482_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_479_1.actors_[var_482_0] = var_482_1

				local var_482_2 = var_482_1:GetComponentInChildren(typeof(CharacterEffect))

				var_482_2.enabled = true

				local var_482_3 = GameObjectTools.GetOrAddComponent(var_482_1, typeof(DynamicBoneHelper))

				if var_482_3 then
					var_482_3:EnableDynamicBone(false)
				end

				arg_479_1:ShowWeapon(var_482_2.transform, false)

				arg_479_1.var_[var_482_0 .. "Animator"] = var_482_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_479_1.var_[var_482_0 .. "Animator"].applyRootMotion = true
				arg_479_1.var_[var_482_0 .. "LipSync"] = var_482_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_482_4 = arg_479_1.actors_["3013_tpose"].transform
			local var_482_5 = 0

			if var_482_5 < arg_479_1.time_ and arg_479_1.time_ <= var_482_5 + arg_482_0 then
				arg_479_1.var_.moveOldPos3013_tpose = var_482_4.localPosition
			end

			local var_482_6 = 0.001

			if var_482_5 <= arg_479_1.time_ and arg_479_1.time_ < var_482_5 + var_482_6 then
				local var_482_7 = (arg_479_1.time_ - var_482_5) / var_482_6
				local var_482_8 = Vector3.New(0, 100, 0)

				var_482_4.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos3013_tpose, var_482_8, var_482_7)

				local var_482_9 = manager.ui.mainCamera.transform.position - var_482_4.position

				var_482_4.forward = Vector3.New(var_482_9.x, var_482_9.y, var_482_9.z)

				local var_482_10 = var_482_4.localEulerAngles

				var_482_10.z = 0
				var_482_10.x = 0
				var_482_4.localEulerAngles = var_482_10
			end

			if arg_479_1.time_ >= var_482_5 + var_482_6 and arg_479_1.time_ < var_482_5 + var_482_6 + arg_482_0 then
				var_482_4.localPosition = Vector3.New(0, 100, 0)

				local var_482_11 = manager.ui.mainCamera.transform.position - var_482_4.position

				var_482_4.forward = Vector3.New(var_482_11.x, var_482_11.y, var_482_11.z)

				local var_482_12 = var_482_4.localEulerAngles

				var_482_12.z = 0
				var_482_12.x = 0
				var_482_4.localEulerAngles = var_482_12
			end

			local var_482_13 = 0
			local var_482_14 = 0.175

			if var_482_13 < arg_479_1.time_ and arg_479_1.time_ <= var_482_13 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_15 = arg_479_1:FormatText(StoryNameCfg[7].name)

				arg_479_1.leftNameTxt_.text = var_482_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_16 = arg_479_1:GetWordFromCfg(1102805117)
				local var_482_17 = arg_479_1:FormatText(var_482_16.content)

				arg_479_1.text_.text = var_482_17

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_18 = 7
				local var_482_19 = utf8.len(var_482_17)
				local var_482_20 = var_482_18 <= 0 and var_482_14 or var_482_14 * (var_482_19 / var_482_18)

				if var_482_20 > 0 and var_482_14 < var_482_20 then
					arg_479_1.talkMaxDuration = var_482_20

					if var_482_20 + var_482_13 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_20 + var_482_13
					end
				end

				arg_479_1.text_.text = var_482_17
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)
				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_21 = math.max(var_482_14, arg_479_1.talkMaxDuration)

			if var_482_13 <= arg_479_1.time_ and arg_479_1.time_ < var_482_13 + var_482_21 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_13) / var_482_21

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_13 + var_482_21 and arg_479_1.time_ < var_482_13 + var_482_21 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805118 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 1102805118
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play1102805119(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = 0
			local var_486_1 = 0.975

			if var_486_0 < arg_483_1.time_ and arg_483_1.time_ <= var_486_0 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, false)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_2 = arg_483_1:GetWordFromCfg(1102805118)
				local var_486_3 = arg_483_1:FormatText(var_486_2.content)

				arg_483_1.text_.text = var_486_3

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_4 = 39
				local var_486_5 = utf8.len(var_486_3)
				local var_486_6 = var_486_4 <= 0 and var_486_1 or var_486_1 * (var_486_5 / var_486_4)

				if var_486_6 > 0 and var_486_1 < var_486_6 then
					arg_483_1.talkMaxDuration = var_486_6

					if var_486_6 + var_486_0 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_6 + var_486_0
					end
				end

				arg_483_1.text_.text = var_486_3
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_7 = math.max(var_486_1, arg_483_1.talkMaxDuration)

			if var_486_0 <= arg_483_1.time_ and arg_483_1.time_ < var_486_0 + var_486_7 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_0) / var_486_7

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_0 + var_486_7 and arg_483_1.time_ < var_486_0 + var_486_7 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805119 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 1102805119
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play1102805120(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 0
			local var_490_1 = 0.525

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_2 = arg_487_1:FormatText(StoryNameCfg[7].name)

				arg_487_1.leftNameTxt_.text = var_490_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_3 = arg_487_1:GetWordFromCfg(1102805119)
				local var_490_4 = arg_487_1:FormatText(var_490_3.content)

				arg_487_1.text_.text = var_490_4

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_5 = 21
				local var_490_6 = utf8.len(var_490_4)
				local var_490_7 = var_490_5 <= 0 and var_490_1 or var_490_1 * (var_490_6 / var_490_5)

				if var_490_7 > 0 and var_490_1 < var_490_7 then
					arg_487_1.talkMaxDuration = var_490_7

					if var_490_7 + var_490_0 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_7 + var_490_0
					end
				end

				arg_487_1.text_.text = var_490_4
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_8 = math.max(var_490_1, arg_487_1.talkMaxDuration)

			if var_490_0 <= arg_487_1.time_ and arg_487_1.time_ < var_490_0 + var_490_8 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_0) / var_490_8

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_0 + var_490_8 and arg_487_1.time_ < var_490_0 + var_490_8 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805120 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 1102805120
		arg_491_1.duration_ = 5.533

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play1102805121(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1028ui_story"].transform
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 then
				arg_491_1.var_.moveOldPos1028ui_story = var_494_0.localPosition
			end

			local var_494_2 = 0.001

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2
				local var_494_4 = Vector3.New(0, -0.9, -5.9)

				var_494_0.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPos1028ui_story, var_494_4, var_494_3)

				local var_494_5 = manager.ui.mainCamera.transform.position - var_494_0.position

				var_494_0.forward = Vector3.New(var_494_5.x, var_494_5.y, var_494_5.z)

				local var_494_6 = var_494_0.localEulerAngles

				var_494_6.z = 0
				var_494_6.x = 0
				var_494_0.localEulerAngles = var_494_6
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 then
				var_494_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_494_7 = manager.ui.mainCamera.transform.position - var_494_0.position

				var_494_0.forward = Vector3.New(var_494_7.x, var_494_7.y, var_494_7.z)

				local var_494_8 = var_494_0.localEulerAngles

				var_494_8.z = 0
				var_494_8.x = 0
				var_494_0.localEulerAngles = var_494_8
			end

			local var_494_9 = arg_491_1.actors_["1028ui_story"]
			local var_494_10 = 0

			if var_494_10 < arg_491_1.time_ and arg_491_1.time_ <= var_494_10 + arg_494_0 and arg_491_1.var_.characterEffect1028ui_story == nil then
				arg_491_1.var_.characterEffect1028ui_story = var_494_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_11 = 0.200000002980232

			if var_494_10 <= arg_491_1.time_ and arg_491_1.time_ < var_494_10 + var_494_11 then
				local var_494_12 = (arg_491_1.time_ - var_494_10) / var_494_11

				if arg_491_1.var_.characterEffect1028ui_story then
					arg_491_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_491_1.time_ >= var_494_10 + var_494_11 and arg_491_1.time_ < var_494_10 + var_494_11 + arg_494_0 and arg_491_1.var_.characterEffect1028ui_story then
				arg_491_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_494_13 = 0

			if var_494_13 < arg_491_1.time_ and arg_491_1.time_ <= var_494_13 + arg_494_0 then
				arg_491_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_494_14 = 0

			if var_494_14 < arg_491_1.time_ and arg_491_1.time_ <= var_494_14 + arg_494_0 then
				arg_491_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_494_15 = 0
			local var_494_16 = 0.675

			if var_494_15 < arg_491_1.time_ and arg_491_1.time_ <= var_494_15 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_17 = arg_491_1:FormatText(StoryNameCfg[327].name)

				arg_491_1.leftNameTxt_.text = var_494_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_18 = arg_491_1:GetWordFromCfg(1102805120)
				local var_494_19 = arg_491_1:FormatText(var_494_18.content)

				arg_491_1.text_.text = var_494_19

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_20 = 27
				local var_494_21 = utf8.len(var_494_19)
				local var_494_22 = var_494_20 <= 0 and var_494_16 or var_494_16 * (var_494_21 / var_494_20)

				if var_494_22 > 0 and var_494_16 < var_494_22 then
					arg_491_1.talkMaxDuration = var_494_22

					if var_494_22 + var_494_15 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_22 + var_494_15
					end
				end

				arg_491_1.text_.text = var_494_19
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805120", "story_v_side_new_1102805.awb") ~= 0 then
					local var_494_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805120", "story_v_side_new_1102805.awb") / 1000

					if var_494_23 + var_494_15 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_23 + var_494_15
					end

					if var_494_18.prefab_name ~= "" and arg_491_1.actors_[var_494_18.prefab_name] ~= nil then
						local var_494_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_18.prefab_name].transform, "story_v_side_new_1102805", "1102805120", "story_v_side_new_1102805.awb")

						arg_491_1:RecordAudio("1102805120", var_494_24)
						arg_491_1:RecordAudio("1102805120", var_494_24)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805120", "story_v_side_new_1102805.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805120", "story_v_side_new_1102805.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_25 = math.max(var_494_16, arg_491_1.talkMaxDuration)

			if var_494_15 <= arg_491_1.time_ and arg_491_1.time_ < var_494_15 + var_494_25 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_15) / var_494_25

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_15 + var_494_25 and arg_491_1.time_ < var_494_15 + var_494_25 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805121 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 1102805121
		arg_495_1.duration_ = 3.833

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play1102805122(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = 0

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_498_1 = 0
			local var_498_2 = 0.55

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_3 = arg_495_1:FormatText(StoryNameCfg[327].name)

				arg_495_1.leftNameTxt_.text = var_498_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_4 = arg_495_1:GetWordFromCfg(1102805121)
				local var_498_5 = arg_495_1:FormatText(var_498_4.content)

				arg_495_1.text_.text = var_498_5

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_6 = 22
				local var_498_7 = utf8.len(var_498_5)
				local var_498_8 = var_498_6 <= 0 and var_498_2 or var_498_2 * (var_498_7 / var_498_6)

				if var_498_8 > 0 and var_498_2 < var_498_8 then
					arg_495_1.talkMaxDuration = var_498_8

					if var_498_8 + var_498_1 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_8 + var_498_1
					end
				end

				arg_495_1.text_.text = var_498_5
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805121", "story_v_side_new_1102805.awb") ~= 0 then
					local var_498_9 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805121", "story_v_side_new_1102805.awb") / 1000

					if var_498_9 + var_498_1 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_9 + var_498_1
					end

					if var_498_4.prefab_name ~= "" and arg_495_1.actors_[var_498_4.prefab_name] ~= nil then
						local var_498_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_4.prefab_name].transform, "story_v_side_new_1102805", "1102805121", "story_v_side_new_1102805.awb")

						arg_495_1:RecordAudio("1102805121", var_498_10)
						arg_495_1:RecordAudio("1102805121", var_498_10)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805121", "story_v_side_new_1102805.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805121", "story_v_side_new_1102805.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_11 = math.max(var_498_2, arg_495_1.talkMaxDuration)

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_11 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_1) / var_498_11

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_1 + var_498_11 and arg_495_1.time_ < var_498_1 + var_498_11 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805122 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 1102805122
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play1102805123(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1028ui_story"].transform
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 then
				arg_499_1.var_.moveOldPos1028ui_story = var_502_0.localPosition
			end

			local var_502_2 = 0.001

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2
				local var_502_4 = Vector3.New(0, 100, 0)

				var_502_0.localPosition = Vector3.Lerp(arg_499_1.var_.moveOldPos1028ui_story, var_502_4, var_502_3)

				local var_502_5 = manager.ui.mainCamera.transform.position - var_502_0.position

				var_502_0.forward = Vector3.New(var_502_5.x, var_502_5.y, var_502_5.z)

				local var_502_6 = var_502_0.localEulerAngles

				var_502_6.z = 0
				var_502_6.x = 0
				var_502_0.localEulerAngles = var_502_6
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 then
				var_502_0.localPosition = Vector3.New(0, 100, 0)

				local var_502_7 = manager.ui.mainCamera.transform.position - var_502_0.position

				var_502_0.forward = Vector3.New(var_502_7.x, var_502_7.y, var_502_7.z)

				local var_502_8 = var_502_0.localEulerAngles

				var_502_8.z = 0
				var_502_8.x = 0
				var_502_0.localEulerAngles = var_502_8
			end

			local var_502_9 = arg_499_1.actors_["1028ui_story"]
			local var_502_10 = 0

			if var_502_10 < arg_499_1.time_ and arg_499_1.time_ <= var_502_10 + arg_502_0 and arg_499_1.var_.characterEffect1028ui_story == nil then
				arg_499_1.var_.characterEffect1028ui_story = var_502_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_11 = 0.200000002980232

			if var_502_10 <= arg_499_1.time_ and arg_499_1.time_ < var_502_10 + var_502_11 then
				local var_502_12 = (arg_499_1.time_ - var_502_10) / var_502_11

				if arg_499_1.var_.characterEffect1028ui_story then
					local var_502_13 = Mathf.Lerp(0, 0.5, var_502_12)

					arg_499_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_499_1.var_.characterEffect1028ui_story.fillRatio = var_502_13
				end
			end

			if arg_499_1.time_ >= var_502_10 + var_502_11 and arg_499_1.time_ < var_502_10 + var_502_11 + arg_502_0 and arg_499_1.var_.characterEffect1028ui_story then
				local var_502_14 = 0.5

				arg_499_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_499_1.var_.characterEffect1028ui_story.fillRatio = var_502_14
			end

			local var_502_15 = 0
			local var_502_16 = 0.65

			if var_502_15 < arg_499_1.time_ and arg_499_1.time_ <= var_502_15 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, false)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_17 = arg_499_1:GetWordFromCfg(1102805122)
				local var_502_18 = arg_499_1:FormatText(var_502_17.content)

				arg_499_1.text_.text = var_502_18

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_19 = 26
				local var_502_20 = utf8.len(var_502_18)
				local var_502_21 = var_502_19 <= 0 and var_502_16 or var_502_16 * (var_502_20 / var_502_19)

				if var_502_21 > 0 and var_502_16 < var_502_21 then
					arg_499_1.talkMaxDuration = var_502_21

					if var_502_21 + var_502_15 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_21 + var_502_15
					end
				end

				arg_499_1.text_.text = var_502_18
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_22 = math.max(var_502_16, arg_499_1.talkMaxDuration)

			if var_502_15 <= arg_499_1.time_ and arg_499_1.time_ < var_502_15 + var_502_22 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_15) / var_502_22

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_15 + var_502_22 and arg_499_1.time_ < var_502_15 + var_502_22 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805123 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 1102805123
		arg_503_1.duration_ = 7.8

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play1102805124(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0.999999999999

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				local var_506_1 = manager.ui.mainCamera.transform.localPosition
				local var_506_2 = Vector3.New(0, 0, 10) + Vector3.New(var_506_1.x, var_506_1.y, 0)
				local var_506_3 = arg_503_1.bgs_.STblack

				var_506_3.transform.localPosition = var_506_2
				var_506_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_506_4 = var_506_3:GetComponent("SpriteRenderer")

				if var_506_4 and var_506_4.sprite then
					local var_506_5 = (var_506_3.transform.localPosition - var_506_1).z
					local var_506_6 = manager.ui.mainCameraCom_
					local var_506_7 = 2 * var_506_5 * Mathf.Tan(var_506_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_506_8 = var_506_7 * var_506_6.aspect
					local var_506_9 = var_506_4.sprite.bounds.size.x
					local var_506_10 = var_506_4.sprite.bounds.size.y
					local var_506_11 = var_506_8 / var_506_9
					local var_506_12 = var_506_7 / var_506_10
					local var_506_13 = var_506_12 < var_506_11 and var_506_11 or var_506_12

					var_506_3.transform.localScale = Vector3.New(var_506_13, var_506_13, 0)
				end

				for iter_506_0, iter_506_1 in pairs(arg_503_1.bgs_) do
					if iter_506_0 ~= "STblack" then
						iter_506_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_506_14 = 0

			if var_506_14 < arg_503_1.time_ and arg_503_1.time_ <= var_506_14 + arg_506_0 then
				arg_503_1.mask_.enabled = true
				arg_503_1.mask_.raycastTarget = true

				arg_503_1:SetGaussion(false)
			end

			local var_506_15 = 1

			if var_506_14 <= arg_503_1.time_ and arg_503_1.time_ < var_506_14 + var_506_15 then
				local var_506_16 = (arg_503_1.time_ - var_506_14) / var_506_15
				local var_506_17 = Color.New(0, 0, 0)

				var_506_17.a = Mathf.Lerp(0, 1, var_506_16)
				arg_503_1.mask_.color = var_506_17
			end

			if arg_503_1.time_ >= var_506_14 + var_506_15 and arg_503_1.time_ < var_506_14 + var_506_15 + arg_506_0 then
				local var_506_18 = Color.New(0, 0, 0)

				var_506_18.a = 1
				arg_503_1.mask_.color = var_506_18
			end

			local var_506_19 = 1

			if var_506_19 < arg_503_1.time_ and arg_503_1.time_ <= var_506_19 + arg_506_0 then
				arg_503_1.mask_.enabled = true
				arg_503_1.mask_.raycastTarget = true

				arg_503_1:SetGaussion(false)
			end

			local var_506_20 = 2

			if var_506_19 <= arg_503_1.time_ and arg_503_1.time_ < var_506_19 + var_506_20 then
				local var_506_21 = (arg_503_1.time_ - var_506_19) / var_506_20
				local var_506_22 = Color.New(0, 0, 0)

				var_506_22.a = Mathf.Lerp(1, 0, var_506_21)
				arg_503_1.mask_.color = var_506_22
			end

			if arg_503_1.time_ >= var_506_19 + var_506_20 and arg_503_1.time_ < var_506_19 + var_506_20 + arg_506_0 then
				local var_506_23 = Color.New(0, 0, 0)
				local var_506_24 = 0

				arg_503_1.mask_.enabled = false
				var_506_23.a = var_506_24
				arg_503_1.mask_.color = var_506_23
			end

			if arg_503_1.frameCnt_ <= 1 then
				arg_503_1.dialog_:SetActive(false)
			end

			local var_506_25 = 2.8
			local var_506_26 = 1

			if var_506_25 < arg_503_1.time_ and arg_503_1.time_ <= var_506_25 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0

				arg_503_1.dialog_:SetActive(true)

				local var_506_27 = LeanTween.value(arg_503_1.dialog_, 0, 1, 0.3)

				var_506_27:setOnUpdate(LuaHelper.FloatAction(function(arg_507_0)
					arg_503_1.dialogCg_.alpha = arg_507_0
				end))
				var_506_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_503_1.dialog_)
					var_506_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_503_1.duration_ = arg_503_1.duration_ + 0.3

				SetActive(arg_503_1.leftNameGo_, false)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_28 = arg_503_1:GetWordFromCfg(1102805123)
				local var_506_29 = arg_503_1:FormatText(var_506_28.content)

				arg_503_1.text_.text = var_506_29

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_30 = 40
				local var_506_31 = utf8.len(var_506_29)
				local var_506_32 = var_506_30 <= 0 and var_506_26 or var_506_26 * (var_506_31 / var_506_30)

				if var_506_32 > 0 and var_506_26 < var_506_32 then
					arg_503_1.talkMaxDuration = var_506_32
					var_506_25 = var_506_25 + 0.3

					if var_506_32 + var_506_25 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_32 + var_506_25
					end
				end

				arg_503_1.text_.text = var_506_29
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)
				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_33 = var_506_25 + 0.3
			local var_506_34 = math.max(var_506_26, arg_503_1.talkMaxDuration)

			if var_506_33 <= arg_503_1.time_ and arg_503_1.time_ < var_506_33 + var_506_34 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_33) / var_506_34

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_33 + var_506_34 and arg_503_1.time_ < var_506_33 + var_506_34 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805124 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 1102805124
		arg_509_1.duration_ = 7

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play1102805125(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = 0

			if var_512_0 < arg_509_1.time_ and arg_509_1.time_ <= var_512_0 + arg_512_0 then
				local var_512_1 = manager.ui.mainCamera.transform.localPosition
				local var_512_2 = Vector3.New(0, 0, 10) + Vector3.New(var_512_1.x, var_512_1.y, 0)
				local var_512_3 = arg_509_1.bgs_.B04e

				var_512_3.transform.localPosition = var_512_2
				var_512_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_512_4 = var_512_3:GetComponent("SpriteRenderer")

				if var_512_4 and var_512_4.sprite then
					local var_512_5 = (var_512_3.transform.localPosition - var_512_1).z
					local var_512_6 = manager.ui.mainCameraCom_
					local var_512_7 = 2 * var_512_5 * Mathf.Tan(var_512_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_512_8 = var_512_7 * var_512_6.aspect
					local var_512_9 = var_512_4.sprite.bounds.size.x
					local var_512_10 = var_512_4.sprite.bounds.size.y
					local var_512_11 = var_512_8 / var_512_9
					local var_512_12 = var_512_7 / var_512_10
					local var_512_13 = var_512_12 < var_512_11 and var_512_11 or var_512_12

					var_512_3.transform.localScale = Vector3.New(var_512_13, var_512_13, 0)
				end

				for iter_512_0, iter_512_1 in pairs(arg_509_1.bgs_) do
					if iter_512_0 ~= "B04e" then
						iter_512_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_512_14 = 0

			if var_512_14 < arg_509_1.time_ and arg_509_1.time_ <= var_512_14 + arg_512_0 then
				arg_509_1.mask_.enabled = true
				arg_509_1.mask_.raycastTarget = true

				arg_509_1:SetGaussion(false)
			end

			local var_512_15 = 2

			if var_512_14 <= arg_509_1.time_ and arg_509_1.time_ < var_512_14 + var_512_15 then
				local var_512_16 = (arg_509_1.time_ - var_512_14) / var_512_15
				local var_512_17 = Color.New(0, 0, 0)

				var_512_17.a = Mathf.Lerp(1, 0, var_512_16)
				arg_509_1.mask_.color = var_512_17
			end

			if arg_509_1.time_ >= var_512_14 + var_512_15 and arg_509_1.time_ < var_512_14 + var_512_15 + arg_512_0 then
				local var_512_18 = Color.New(0, 0, 0)
				local var_512_19 = 0

				arg_509_1.mask_.enabled = false
				var_512_18.a = var_512_19
				arg_509_1.mask_.color = var_512_18
			end

			local var_512_20 = 0
			local var_512_21 = 0.6

			if var_512_20 < arg_509_1.time_ and arg_509_1.time_ <= var_512_20 + arg_512_0 then
				local var_512_22 = "play"
				local var_512_23 = "music"

				arg_509_1:AudioAction(var_512_22, var_512_23, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_512_24 = 0.8
			local var_512_25 = 1

			if var_512_24 < arg_509_1.time_ and arg_509_1.time_ <= var_512_24 + arg_512_0 then
				local var_512_26 = "play"
				local var_512_27 = "music"

				arg_509_1:AudioAction(var_512_26, var_512_27, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			if arg_509_1.frameCnt_ <= 1 then
				arg_509_1.dialog_:SetActive(false)
			end

			local var_512_28 = 2
			local var_512_29 = 1

			if var_512_28 < arg_509_1.time_ and arg_509_1.time_ <= var_512_28 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0

				arg_509_1.dialog_:SetActive(true)

				local var_512_30 = LeanTween.value(arg_509_1.dialog_, 0, 1, 0.3)

				var_512_30:setOnUpdate(LuaHelper.FloatAction(function(arg_513_0)
					arg_509_1.dialogCg_.alpha = arg_513_0
				end))
				var_512_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_509_1.dialog_)
					var_512_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_509_1.duration_ = arg_509_1.duration_ + 0.3

				SetActive(arg_509_1.leftNameGo_, false)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_31 = arg_509_1:GetWordFromCfg(1102805124)
				local var_512_32 = arg_509_1:FormatText(var_512_31.content)

				arg_509_1.text_.text = var_512_32

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_33 = 40
				local var_512_34 = utf8.len(var_512_32)
				local var_512_35 = var_512_33 <= 0 and var_512_29 or var_512_29 * (var_512_34 / var_512_33)

				if var_512_35 > 0 and var_512_29 < var_512_35 then
					arg_509_1.talkMaxDuration = var_512_35
					var_512_28 = var_512_28 + 0.3

					if var_512_35 + var_512_28 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_35 + var_512_28
					end
				end

				arg_509_1.text_.text = var_512_32
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)
				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_36 = var_512_28 + 0.3
			local var_512_37 = math.max(var_512_29, arg_509_1.talkMaxDuration)

			if var_512_36 <= arg_509_1.time_ and arg_509_1.time_ < var_512_36 + var_512_37 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_36) / var_512_37

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_36 + var_512_37 and arg_509_1.time_ < var_512_36 + var_512_37 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805125 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 1102805125
		arg_515_1.duration_ = 5

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play1102805126(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = 0
			local var_518_1 = 0.525

			if var_518_0 < arg_515_1.time_ and arg_515_1.time_ <= var_518_0 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_2 = arg_515_1:FormatText(StoryNameCfg[7].name)

				arg_515_1.leftNameTxt_.text = var_518_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_3 = arg_515_1:GetWordFromCfg(1102805125)
				local var_518_4 = arg_515_1:FormatText(var_518_3.content)

				arg_515_1.text_.text = var_518_4

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_5 = 21
				local var_518_6 = utf8.len(var_518_4)
				local var_518_7 = var_518_5 <= 0 and var_518_1 or var_518_1 * (var_518_6 / var_518_5)

				if var_518_7 > 0 and var_518_1 < var_518_7 then
					arg_515_1.talkMaxDuration = var_518_7

					if var_518_7 + var_518_0 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_7 + var_518_0
					end
				end

				arg_515_1.text_.text = var_518_4
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)
				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_8 = math.max(var_518_1, arg_515_1.talkMaxDuration)

			if var_518_0 <= arg_515_1.time_ and arg_515_1.time_ < var_518_0 + var_518_8 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_0) / var_518_8

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_0 + var_518_8 and arg_515_1.time_ < var_518_0 + var_518_8 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805126 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 1102805126
		arg_519_1.duration_ = 5

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play1102805127(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = 0
			local var_522_1 = 0.675

			if var_522_0 < arg_519_1.time_ and arg_519_1.time_ <= var_522_0 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, false)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_2 = arg_519_1:GetWordFromCfg(1102805126)
				local var_522_3 = arg_519_1:FormatText(var_522_2.content)

				arg_519_1.text_.text = var_522_3

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_4 = 27
				local var_522_5 = utf8.len(var_522_3)
				local var_522_6 = var_522_4 <= 0 and var_522_1 or var_522_1 * (var_522_5 / var_522_4)

				if var_522_6 > 0 and var_522_1 < var_522_6 then
					arg_519_1.talkMaxDuration = var_522_6

					if var_522_6 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_6 + var_522_0
					end
				end

				arg_519_1.text_.text = var_522_3
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)
				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_7 = math.max(var_522_1, arg_519_1.talkMaxDuration)

			if var_522_0 <= arg_519_1.time_ and arg_519_1.time_ < var_522_0 + var_522_7 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_0) / var_522_7

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_0 + var_522_7 and arg_519_1.time_ < var_522_0 + var_522_7 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805127 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 1102805127
		arg_523_1.duration_ = 1.999999999999

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play1102805128(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["1028ui_story"].transform
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 then
				arg_523_1.var_.moveOldPos1028ui_story = var_526_0.localPosition
			end

			local var_526_2 = 0.001

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2
				local var_526_4 = Vector3.New(0, -0.9, -5.9)

				var_526_0.localPosition = Vector3.Lerp(arg_523_1.var_.moveOldPos1028ui_story, var_526_4, var_526_3)

				local var_526_5 = manager.ui.mainCamera.transform.position - var_526_0.position

				var_526_0.forward = Vector3.New(var_526_5.x, var_526_5.y, var_526_5.z)

				local var_526_6 = var_526_0.localEulerAngles

				var_526_6.z = 0
				var_526_6.x = 0
				var_526_0.localEulerAngles = var_526_6
			end

			if arg_523_1.time_ >= var_526_1 + var_526_2 and arg_523_1.time_ < var_526_1 + var_526_2 + arg_526_0 then
				var_526_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_526_7 = manager.ui.mainCamera.transform.position - var_526_0.position

				var_526_0.forward = Vector3.New(var_526_7.x, var_526_7.y, var_526_7.z)

				local var_526_8 = var_526_0.localEulerAngles

				var_526_8.z = 0
				var_526_8.x = 0
				var_526_0.localEulerAngles = var_526_8
			end

			local var_526_9 = arg_523_1.actors_["1028ui_story"]
			local var_526_10 = 0

			if var_526_10 < arg_523_1.time_ and arg_523_1.time_ <= var_526_10 + arg_526_0 and arg_523_1.var_.characterEffect1028ui_story == nil then
				arg_523_1.var_.characterEffect1028ui_story = var_526_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_526_11 = 0.200000002980232

			if var_526_10 <= arg_523_1.time_ and arg_523_1.time_ < var_526_10 + var_526_11 then
				local var_526_12 = (arg_523_1.time_ - var_526_10) / var_526_11

				if arg_523_1.var_.characterEffect1028ui_story then
					arg_523_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_523_1.time_ >= var_526_10 + var_526_11 and arg_523_1.time_ < var_526_10 + var_526_11 + arg_526_0 and arg_523_1.var_.characterEffect1028ui_story then
				arg_523_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_526_13 = 0

			if var_526_13 < arg_523_1.time_ and arg_523_1.time_ <= var_526_13 + arg_526_0 then
				arg_523_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_526_14 = 0

			if var_526_14 < arg_523_1.time_ and arg_523_1.time_ <= var_526_14 + arg_526_0 then
				arg_523_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_526_15 = 0
			local var_526_16 = 0.175

			if var_526_15 < arg_523_1.time_ and arg_523_1.time_ <= var_526_15 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_17 = arg_523_1:FormatText(StoryNameCfg[327].name)

				arg_523_1.leftNameTxt_.text = var_526_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_18 = arg_523_1:GetWordFromCfg(1102805127)
				local var_526_19 = arg_523_1:FormatText(var_526_18.content)

				arg_523_1.text_.text = var_526_19

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_20 = 7
				local var_526_21 = utf8.len(var_526_19)
				local var_526_22 = var_526_20 <= 0 and var_526_16 or var_526_16 * (var_526_21 / var_526_20)

				if var_526_22 > 0 and var_526_16 < var_526_22 then
					arg_523_1.talkMaxDuration = var_526_22

					if var_526_22 + var_526_15 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_22 + var_526_15
					end
				end

				arg_523_1.text_.text = var_526_19
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805127", "story_v_side_new_1102805.awb") ~= 0 then
					local var_526_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805127", "story_v_side_new_1102805.awb") / 1000

					if var_526_23 + var_526_15 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_23 + var_526_15
					end

					if var_526_18.prefab_name ~= "" and arg_523_1.actors_[var_526_18.prefab_name] ~= nil then
						local var_526_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_523_1.actors_[var_526_18.prefab_name].transform, "story_v_side_new_1102805", "1102805127", "story_v_side_new_1102805.awb")

						arg_523_1:RecordAudio("1102805127", var_526_24)
						arg_523_1:RecordAudio("1102805127", var_526_24)
					else
						arg_523_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805127", "story_v_side_new_1102805.awb")
					end

					arg_523_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805127", "story_v_side_new_1102805.awb")
				end

				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_25 = math.max(var_526_16, arg_523_1.talkMaxDuration)

			if var_526_15 <= arg_523_1.time_ and arg_523_1.time_ < var_526_15 + var_526_25 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_15) / var_526_25

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_15 + var_526_25 and arg_523_1.time_ < var_526_15 + var_526_25 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805128 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 1102805128
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play1102805129(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = "B04e_blur"

			if arg_527_1.bgs_[var_530_0] == nil then
				local var_530_1 = Object.Instantiate(arg_527_1.paintGo_)

				var_530_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_530_0)
				var_530_1.name = var_530_0
				var_530_1.transform.parent = arg_527_1.stage_.transform
				var_530_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_527_1.bgs_[var_530_0] = var_530_1
			end

			local var_530_2 = 0

			if var_530_2 < arg_527_1.time_ and arg_527_1.time_ <= var_530_2 + arg_530_0 then
				local var_530_3 = manager.ui.mainCamera.transform.localPosition
				local var_530_4 = Vector3.New(0, 0, 10) + Vector3.New(var_530_3.x, var_530_3.y, 0)
				local var_530_5 = arg_527_1.bgs_.B04e_blur

				var_530_5.transform.localPosition = var_530_4
				var_530_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_530_6 = var_530_5:GetComponent("SpriteRenderer")

				if var_530_6 and var_530_6.sprite then
					local var_530_7 = (var_530_5.transform.localPosition - var_530_3).z
					local var_530_8 = manager.ui.mainCameraCom_
					local var_530_9 = 2 * var_530_7 * Mathf.Tan(var_530_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_530_10 = var_530_9 * var_530_8.aspect
					local var_530_11 = var_530_6.sprite.bounds.size.x
					local var_530_12 = var_530_6.sprite.bounds.size.y
					local var_530_13 = var_530_10 / var_530_11
					local var_530_14 = var_530_9 / var_530_12
					local var_530_15 = var_530_14 < var_530_13 and var_530_13 or var_530_14

					var_530_5.transform.localScale = Vector3.New(var_530_15, var_530_15, 0)
				end

				for iter_530_0, iter_530_1 in pairs(arg_527_1.bgs_) do
					if iter_530_0 ~= "B04e_blur" then
						iter_530_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_530_16 = arg_527_1.actors_["1028ui_story"].transform
			local var_530_17 = 0

			if var_530_17 < arg_527_1.time_ and arg_527_1.time_ <= var_530_17 + arg_530_0 then
				arg_527_1.var_.moveOldPos1028ui_story = var_530_16.localPosition
			end

			local var_530_18 = 0.001

			if var_530_17 <= arg_527_1.time_ and arg_527_1.time_ < var_530_17 + var_530_18 then
				local var_530_19 = (arg_527_1.time_ - var_530_17) / var_530_18
				local var_530_20 = Vector3.New(0, 100, 0)

				var_530_16.localPosition = Vector3.Lerp(arg_527_1.var_.moveOldPos1028ui_story, var_530_20, var_530_19)

				local var_530_21 = manager.ui.mainCamera.transform.position - var_530_16.position

				var_530_16.forward = Vector3.New(var_530_21.x, var_530_21.y, var_530_21.z)

				local var_530_22 = var_530_16.localEulerAngles

				var_530_22.z = 0
				var_530_22.x = 0
				var_530_16.localEulerAngles = var_530_22
			end

			if arg_527_1.time_ >= var_530_17 + var_530_18 and arg_527_1.time_ < var_530_17 + var_530_18 + arg_530_0 then
				var_530_16.localPosition = Vector3.New(0, 100, 0)

				local var_530_23 = manager.ui.mainCamera.transform.position - var_530_16.position

				var_530_16.forward = Vector3.New(var_530_23.x, var_530_23.y, var_530_23.z)

				local var_530_24 = var_530_16.localEulerAngles

				var_530_24.z = 0
				var_530_24.x = 0
				var_530_16.localEulerAngles = var_530_24
			end

			local var_530_25 = arg_527_1.actors_["1028ui_story"]
			local var_530_26 = 0

			if var_530_26 < arg_527_1.time_ and arg_527_1.time_ <= var_530_26 + arg_530_0 and arg_527_1.var_.characterEffect1028ui_story == nil then
				arg_527_1.var_.characterEffect1028ui_story = var_530_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_530_27 = 0.200000002980232

			if var_530_26 <= arg_527_1.time_ and arg_527_1.time_ < var_530_26 + var_530_27 then
				local var_530_28 = (arg_527_1.time_ - var_530_26) / var_530_27

				if arg_527_1.var_.characterEffect1028ui_story then
					local var_530_29 = Mathf.Lerp(0, 0.5, var_530_28)

					arg_527_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_527_1.var_.characterEffect1028ui_story.fillRatio = var_530_29
				end
			end

			if arg_527_1.time_ >= var_530_26 + var_530_27 and arg_527_1.time_ < var_530_26 + var_530_27 + arg_530_0 and arg_527_1.var_.characterEffect1028ui_story then
				local var_530_30 = 0.5

				arg_527_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_527_1.var_.characterEffect1028ui_story.fillRatio = var_530_30
			end

			local var_530_31 = manager.ui.mainCamera.transform
			local var_530_32 = 0

			if var_530_32 < arg_527_1.time_ and arg_527_1.time_ <= var_530_32 + arg_530_0 then
				arg_527_1.var_.shakeOldPos = var_530_31.localPosition
			end

			local var_530_33 = 1

			if var_530_32 <= arg_527_1.time_ and arg_527_1.time_ < var_530_32 + var_530_33 then
				local var_530_34 = (arg_527_1.time_ - var_530_32) / 0.066
				local var_530_35, var_530_36 = math.modf(var_530_34)

				var_530_31.localPosition = Vector3.New(var_530_36 * 0.13, var_530_36 * 0.13, var_530_36 * 0.13) + arg_527_1.var_.shakeOldPos
			end

			if arg_527_1.time_ >= var_530_32 + var_530_33 and arg_527_1.time_ < var_530_32 + var_530_33 + arg_530_0 then
				var_530_31.localPosition = arg_527_1.var_.shakeOldPos
			end

			local var_530_37 = 0
			local var_530_38 = 0.6

			if var_530_37 < arg_527_1.time_ and arg_527_1.time_ <= var_530_37 + arg_530_0 then
				local var_530_39 = "play"
				local var_530_40 = "effect"

				arg_527_1:AudioAction(var_530_39, var_530_40, "se_story_side_1028", "se_story_side_1028_stone", "")
			end

			local var_530_41 = 0
			local var_530_42 = 1.275

			if var_530_41 < arg_527_1.time_ and arg_527_1.time_ <= var_530_41 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, false)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_43 = arg_527_1:GetWordFromCfg(1102805128)
				local var_530_44 = arg_527_1:FormatText(var_530_43.content)

				arg_527_1.text_.text = var_530_44

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_45 = 51
				local var_530_46 = utf8.len(var_530_44)
				local var_530_47 = var_530_45 <= 0 and var_530_42 or var_530_42 * (var_530_46 / var_530_45)

				if var_530_47 > 0 and var_530_42 < var_530_47 then
					arg_527_1.talkMaxDuration = var_530_47

					if var_530_47 + var_530_41 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_47 + var_530_41
					end
				end

				arg_527_1.text_.text = var_530_44
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)
				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_48 = math.max(var_530_42, arg_527_1.talkMaxDuration)

			if var_530_41 <= arg_527_1.time_ and arg_527_1.time_ < var_530_41 + var_530_48 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_41) / var_530_48

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_41 + var_530_48 and arg_527_1.time_ < var_530_41 + var_530_48 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805129 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 1102805129
		arg_531_1.duration_ = 3.466

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play1102805130(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = 0

			if var_534_0 < arg_531_1.time_ and arg_531_1.time_ <= var_534_0 + arg_534_0 then
				local var_534_1 = manager.ui.mainCamera.transform.localPosition
				local var_534_2 = Vector3.New(0, 0, 10) + Vector3.New(var_534_1.x, var_534_1.y, 0)
				local var_534_3 = arg_531_1.bgs_.B04e

				var_534_3.transform.localPosition = var_534_2
				var_534_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_534_4 = var_534_3:GetComponent("SpriteRenderer")

				if var_534_4 and var_534_4.sprite then
					local var_534_5 = (var_534_3.transform.localPosition - var_534_1).z
					local var_534_6 = manager.ui.mainCameraCom_
					local var_534_7 = 2 * var_534_5 * Mathf.Tan(var_534_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_534_8 = var_534_7 * var_534_6.aspect
					local var_534_9 = var_534_4.sprite.bounds.size.x
					local var_534_10 = var_534_4.sprite.bounds.size.y
					local var_534_11 = var_534_8 / var_534_9
					local var_534_12 = var_534_7 / var_534_10
					local var_534_13 = var_534_12 < var_534_11 and var_534_11 or var_534_12

					var_534_3.transform.localScale = Vector3.New(var_534_13, var_534_13, 0)
				end

				for iter_534_0, iter_534_1 in pairs(arg_531_1.bgs_) do
					if iter_534_0 ~= "B04e" then
						iter_534_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_534_14 = arg_531_1.actors_["1028ui_story"].transform
			local var_534_15 = 0

			if var_534_15 < arg_531_1.time_ and arg_531_1.time_ <= var_534_15 + arg_534_0 then
				arg_531_1.var_.moveOldPos1028ui_story = var_534_14.localPosition
			end

			local var_534_16 = 0.001

			if var_534_15 <= arg_531_1.time_ and arg_531_1.time_ < var_534_15 + var_534_16 then
				local var_534_17 = (arg_531_1.time_ - var_534_15) / var_534_16
				local var_534_18 = Vector3.New(0, -0.9, -5.9)

				var_534_14.localPosition = Vector3.Lerp(arg_531_1.var_.moveOldPos1028ui_story, var_534_18, var_534_17)

				local var_534_19 = manager.ui.mainCamera.transform.position - var_534_14.position

				var_534_14.forward = Vector3.New(var_534_19.x, var_534_19.y, var_534_19.z)

				local var_534_20 = var_534_14.localEulerAngles

				var_534_20.z = 0
				var_534_20.x = 0
				var_534_14.localEulerAngles = var_534_20
			end

			if arg_531_1.time_ >= var_534_15 + var_534_16 and arg_531_1.time_ < var_534_15 + var_534_16 + arg_534_0 then
				var_534_14.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_534_21 = manager.ui.mainCamera.transform.position - var_534_14.position

				var_534_14.forward = Vector3.New(var_534_21.x, var_534_21.y, var_534_21.z)

				local var_534_22 = var_534_14.localEulerAngles

				var_534_22.z = 0
				var_534_22.x = 0
				var_534_14.localEulerAngles = var_534_22
			end

			local var_534_23 = arg_531_1.actors_["1028ui_story"]
			local var_534_24 = 0

			if var_534_24 < arg_531_1.time_ and arg_531_1.time_ <= var_534_24 + arg_534_0 and arg_531_1.var_.characterEffect1028ui_story == nil then
				arg_531_1.var_.characterEffect1028ui_story = var_534_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_534_25 = 0.200000002980232

			if var_534_24 <= arg_531_1.time_ and arg_531_1.time_ < var_534_24 + var_534_25 then
				local var_534_26 = (arg_531_1.time_ - var_534_24) / var_534_25

				if arg_531_1.var_.characterEffect1028ui_story then
					arg_531_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_531_1.time_ >= var_534_24 + var_534_25 and arg_531_1.time_ < var_534_24 + var_534_25 + arg_534_0 and arg_531_1.var_.characterEffect1028ui_story then
				arg_531_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_534_27 = 0

			if var_534_27 < arg_531_1.time_ and arg_531_1.time_ <= var_534_27 + arg_534_0 then
				arg_531_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_534_28 = 0

			if var_534_28 < arg_531_1.time_ and arg_531_1.time_ <= var_534_28 + arg_534_0 then
				arg_531_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_534_29 = 0
			local var_534_30 = 0.25

			if var_534_29 < arg_531_1.time_ and arg_531_1.time_ <= var_534_29 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_31 = arg_531_1:FormatText(StoryNameCfg[327].name)

				arg_531_1.leftNameTxt_.text = var_534_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_32 = arg_531_1:GetWordFromCfg(1102805129)
				local var_534_33 = arg_531_1:FormatText(var_534_32.content)

				arg_531_1.text_.text = var_534_33

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_34 = 10
				local var_534_35 = utf8.len(var_534_33)
				local var_534_36 = var_534_34 <= 0 and var_534_30 or var_534_30 * (var_534_35 / var_534_34)

				if var_534_36 > 0 and var_534_30 < var_534_36 then
					arg_531_1.talkMaxDuration = var_534_36

					if var_534_36 + var_534_29 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_36 + var_534_29
					end
				end

				arg_531_1.text_.text = var_534_33
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805129", "story_v_side_new_1102805.awb") ~= 0 then
					local var_534_37 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805129", "story_v_side_new_1102805.awb") / 1000

					if var_534_37 + var_534_29 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_37 + var_534_29
					end

					if var_534_32.prefab_name ~= "" and arg_531_1.actors_[var_534_32.prefab_name] ~= nil then
						local var_534_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_32.prefab_name].transform, "story_v_side_new_1102805", "1102805129", "story_v_side_new_1102805.awb")

						arg_531_1:RecordAudio("1102805129", var_534_38)
						arg_531_1:RecordAudio("1102805129", var_534_38)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805129", "story_v_side_new_1102805.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805129", "story_v_side_new_1102805.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_39 = math.max(var_534_30, arg_531_1.talkMaxDuration)

			if var_534_29 <= arg_531_1.time_ and arg_531_1.time_ < var_534_29 + var_534_39 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_29) / var_534_39

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_29 + var_534_39 and arg_531_1.time_ < var_534_29 + var_534_39 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805130 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 1102805130
		arg_535_1.duration_ = 5

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play1102805131(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1028ui_story"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 and arg_535_1.var_.characterEffect1028ui_story == nil then
				arg_535_1.var_.characterEffect1028ui_story = var_538_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_2 = 0.200000002980232

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2

				if arg_535_1.var_.characterEffect1028ui_story then
					local var_538_4 = Mathf.Lerp(0, 0.5, var_538_3)

					arg_535_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_535_1.var_.characterEffect1028ui_story.fillRatio = var_538_4
				end
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 and arg_535_1.var_.characterEffect1028ui_story then
				local var_538_5 = 0.5

				arg_535_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_535_1.var_.characterEffect1028ui_story.fillRatio = var_538_5
			end

			local var_538_6 = 0
			local var_538_7 = 0.575

			if var_538_6 < arg_535_1.time_ and arg_535_1.time_ <= var_538_6 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, false)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_8 = arg_535_1:GetWordFromCfg(1102805130)
				local var_538_9 = arg_535_1:FormatText(var_538_8.content)

				arg_535_1.text_.text = var_538_9

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_10 = 23
				local var_538_11 = utf8.len(var_538_9)
				local var_538_12 = var_538_10 <= 0 and var_538_7 or var_538_7 * (var_538_11 / var_538_10)

				if var_538_12 > 0 and var_538_7 < var_538_12 then
					arg_535_1.talkMaxDuration = var_538_12

					if var_538_12 + var_538_6 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_12 + var_538_6
					end
				end

				arg_535_1.text_.text = var_538_9
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)
				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_13 = math.max(var_538_7, arg_535_1.talkMaxDuration)

			if var_538_6 <= arg_535_1.time_ and arg_535_1.time_ < var_538_6 + var_538_13 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_6) / var_538_13

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_6 + var_538_13 and arg_535_1.time_ < var_538_6 + var_538_13 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805131 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 1102805131
		arg_539_1.duration_ = 5

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play1102805132(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0
			local var_542_1 = 0.45

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_2 = arg_539_1:FormatText(StoryNameCfg[7].name)

				arg_539_1.leftNameTxt_.text = var_542_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_3 = arg_539_1:GetWordFromCfg(1102805131)
				local var_542_4 = arg_539_1:FormatText(var_542_3.content)

				arg_539_1.text_.text = var_542_4

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_5 = 18
				local var_542_6 = utf8.len(var_542_4)
				local var_542_7 = var_542_5 <= 0 and var_542_1 or var_542_1 * (var_542_6 / var_542_5)

				if var_542_7 > 0 and var_542_1 < var_542_7 then
					arg_539_1.talkMaxDuration = var_542_7

					if var_542_7 + var_542_0 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_7 + var_542_0
					end
				end

				arg_539_1.text_.text = var_542_4
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)
				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_8 = math.max(var_542_1, arg_539_1.talkMaxDuration)

			if var_542_0 <= arg_539_1.time_ and arg_539_1.time_ < var_542_0 + var_542_8 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_0) / var_542_8

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_0 + var_542_8 and arg_539_1.time_ < var_542_0 + var_542_8 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805132 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 1102805132
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play1102805133(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["1028ui_story"].transform
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 then
				arg_543_1.var_.moveOldPos1028ui_story = var_546_0.localPosition
			end

			local var_546_2 = 0.001

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_2 then
				local var_546_3 = (arg_543_1.time_ - var_546_1) / var_546_2
				local var_546_4 = Vector3.New(0, 100, 0)

				var_546_0.localPosition = Vector3.Lerp(arg_543_1.var_.moveOldPos1028ui_story, var_546_4, var_546_3)

				local var_546_5 = manager.ui.mainCamera.transform.position - var_546_0.position

				var_546_0.forward = Vector3.New(var_546_5.x, var_546_5.y, var_546_5.z)

				local var_546_6 = var_546_0.localEulerAngles

				var_546_6.z = 0
				var_546_6.x = 0
				var_546_0.localEulerAngles = var_546_6
			end

			if arg_543_1.time_ >= var_546_1 + var_546_2 and arg_543_1.time_ < var_546_1 + var_546_2 + arg_546_0 then
				var_546_0.localPosition = Vector3.New(0, 100, 0)

				local var_546_7 = manager.ui.mainCamera.transform.position - var_546_0.position

				var_546_0.forward = Vector3.New(var_546_7.x, var_546_7.y, var_546_7.z)

				local var_546_8 = var_546_0.localEulerAngles

				var_546_8.z = 0
				var_546_8.x = 0
				var_546_0.localEulerAngles = var_546_8
			end

			local var_546_9 = 0
			local var_546_10 = 0.6

			if var_546_9 < arg_543_1.time_ and arg_543_1.time_ <= var_546_9 + arg_546_0 then
				local var_546_11 = "play"
				local var_546_12 = "effect"

				arg_543_1:AudioAction(var_546_11, var_546_12, "se_story_126_01", "se_story_126_01_monster", "")
			end

			local var_546_13 = manager.ui.mainCamera.transform
			local var_546_14 = 0

			if var_546_14 < arg_543_1.time_ and arg_543_1.time_ <= var_546_14 + arg_546_0 then
				arg_543_1.var_.shakeOldPos = var_546_13.localPosition
			end

			local var_546_15 = 0.6

			if var_546_14 <= arg_543_1.time_ and arg_543_1.time_ < var_546_14 + var_546_15 then
				local var_546_16 = (arg_543_1.time_ - var_546_14) / 0.066
				local var_546_17, var_546_18 = math.modf(var_546_16)

				var_546_13.localPosition = Vector3.New(var_546_18 * 0.13, var_546_18 * 0.13, var_546_18 * 0.13) + arg_543_1.var_.shakeOldPos
			end

			if arg_543_1.time_ >= var_546_14 + var_546_15 and arg_543_1.time_ < var_546_14 + var_546_15 + arg_546_0 then
				var_546_13.localPosition = arg_543_1.var_.shakeOldPos
			end

			local var_546_19 = 0
			local var_546_20 = 1

			if var_546_19 < arg_543_1.time_ and arg_543_1.time_ <= var_546_19 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, false)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_21 = arg_543_1:GetWordFromCfg(1102805132)
				local var_546_22 = arg_543_1:FormatText(var_546_21.content)

				arg_543_1.text_.text = var_546_22

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_23 = 40
				local var_546_24 = utf8.len(var_546_22)
				local var_546_25 = var_546_23 <= 0 and var_546_20 or var_546_20 * (var_546_24 / var_546_23)

				if var_546_25 > 0 and var_546_20 < var_546_25 then
					arg_543_1.talkMaxDuration = var_546_25

					if var_546_25 + var_546_19 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_25 + var_546_19
					end
				end

				arg_543_1.text_.text = var_546_22
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_26 = math.max(var_546_20, arg_543_1.talkMaxDuration)

			if var_546_19 <= arg_543_1.time_ and arg_543_1.time_ < var_546_19 + var_546_26 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_19) / var_546_26

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_19 + var_546_26 and arg_543_1.time_ < var_546_19 + var_546_26 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805133 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 1102805133
		arg_547_1.duration_ = 2.066

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play1102805134(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = manager.ui.mainCamera.transform
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 then
				arg_547_1.var_.shakeOldPos = var_550_0.localPosition
			end

			local var_550_2 = 0.6

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_2 then
				local var_550_3 = (arg_547_1.time_ - var_550_1) / 0.066
				local var_550_4, var_550_5 = math.modf(var_550_3)

				var_550_0.localPosition = Vector3.New(var_550_5 * 0.13, var_550_5 * 0.13, var_550_5 * 0.13) + arg_547_1.var_.shakeOldPos
			end

			if arg_547_1.time_ >= var_550_1 + var_550_2 and arg_547_1.time_ < var_550_1 + var_550_2 + arg_550_0 then
				var_550_0.localPosition = arg_547_1.var_.shakeOldPos
			end

			local var_550_6 = 0
			local var_550_7 = 0.1

			if var_550_6 < arg_547_1.time_ and arg_547_1.time_ <= var_550_6 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_8 = arg_547_1:FormatText(StoryNameCfg[327].name)

				arg_547_1.leftNameTxt_.text = var_550_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, true)
				arg_547_1.iconController_:SetSelectedState("hero")

				arg_547_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1028")

				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_9 = arg_547_1:GetWordFromCfg(1102805133)
				local var_550_10 = arg_547_1:FormatText(var_550_9.content)

				arg_547_1.text_.text = var_550_10

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_11 = 4
				local var_550_12 = utf8.len(var_550_10)
				local var_550_13 = var_550_11 <= 0 and var_550_7 or var_550_7 * (var_550_12 / var_550_11)

				if var_550_13 > 0 and var_550_7 < var_550_13 then
					arg_547_1.talkMaxDuration = var_550_13

					if var_550_13 + var_550_6 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_13 + var_550_6
					end
				end

				arg_547_1.text_.text = var_550_10
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805133", "story_v_side_new_1102805.awb") ~= 0 then
					local var_550_14 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805133", "story_v_side_new_1102805.awb") / 1000

					if var_550_14 + var_550_6 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_14 + var_550_6
					end

					if var_550_9.prefab_name ~= "" and arg_547_1.actors_[var_550_9.prefab_name] ~= nil then
						local var_550_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_9.prefab_name].transform, "story_v_side_new_1102805", "1102805133", "story_v_side_new_1102805.awb")

						arg_547_1:RecordAudio("1102805133", var_550_15)
						arg_547_1:RecordAudio("1102805133", var_550_15)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805133", "story_v_side_new_1102805.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805133", "story_v_side_new_1102805.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_16 = math.max(var_550_7, arg_547_1.talkMaxDuration)

			if var_550_6 <= arg_547_1.time_ and arg_547_1.time_ < var_550_6 + var_550_16 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_6) / var_550_16

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_6 + var_550_16 and arg_547_1.time_ < var_550_6 + var_550_16 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805134 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 1102805134
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play1102805135(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0
			local var_554_1 = 0.55

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, false)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_2 = arg_551_1:GetWordFromCfg(1102805134)
				local var_554_3 = arg_551_1:FormatText(var_554_2.content)

				arg_551_1.text_.text = var_554_3

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_4 = 22
				local var_554_5 = utf8.len(var_554_3)
				local var_554_6 = var_554_4 <= 0 and var_554_1 or var_554_1 * (var_554_5 / var_554_4)

				if var_554_6 > 0 and var_554_1 < var_554_6 then
					arg_551_1.talkMaxDuration = var_554_6

					if var_554_6 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_6 + var_554_0
					end
				end

				arg_551_1.text_.text = var_554_3
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_7 = math.max(var_554_1, arg_551_1.talkMaxDuration)

			if var_554_0 <= arg_551_1.time_ and arg_551_1.time_ < var_554_0 + var_554_7 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_0) / var_554_7

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_0 + var_554_7 and arg_551_1.time_ < var_554_0 + var_554_7 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805135 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 1102805135
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play1102805136(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0
			local var_558_1 = 0.8

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, false)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_2 = arg_555_1:GetWordFromCfg(1102805135)
				local var_558_3 = arg_555_1:FormatText(var_558_2.content)

				arg_555_1.text_.text = var_558_3

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_4 = 32
				local var_558_5 = utf8.len(var_558_3)
				local var_558_6 = var_558_4 <= 0 and var_558_1 or var_558_1 * (var_558_5 / var_558_4)

				if var_558_6 > 0 and var_558_1 < var_558_6 then
					arg_555_1.talkMaxDuration = var_558_6

					if var_558_6 + var_558_0 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_6 + var_558_0
					end
				end

				arg_555_1.text_.text = var_558_3
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_7 = math.max(var_558_1, arg_555_1.talkMaxDuration)

			if var_558_0 <= arg_555_1.time_ and arg_555_1.time_ < var_558_0 + var_558_7 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_0) / var_558_7

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_0 + var_558_7 and arg_555_1.time_ < var_558_0 + var_558_7 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805136 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 1102805136
		arg_559_1.duration_ = 4.033

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play1102805137(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = arg_559_1.actors_["1028ui_story"].transform
			local var_562_1 = 0

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 then
				arg_559_1.var_.moveOldPos1028ui_story = var_562_0.localPosition
			end

			local var_562_2 = 0.001

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_2 then
				local var_562_3 = (arg_559_1.time_ - var_562_1) / var_562_2
				local var_562_4 = Vector3.New(0, -0.9, -5.9)

				var_562_0.localPosition = Vector3.Lerp(arg_559_1.var_.moveOldPos1028ui_story, var_562_4, var_562_3)

				local var_562_5 = manager.ui.mainCamera.transform.position - var_562_0.position

				var_562_0.forward = Vector3.New(var_562_5.x, var_562_5.y, var_562_5.z)

				local var_562_6 = var_562_0.localEulerAngles

				var_562_6.z = 0
				var_562_6.x = 0
				var_562_0.localEulerAngles = var_562_6
			end

			if arg_559_1.time_ >= var_562_1 + var_562_2 and arg_559_1.time_ < var_562_1 + var_562_2 + arg_562_0 then
				var_562_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_562_7 = manager.ui.mainCamera.transform.position - var_562_0.position

				var_562_0.forward = Vector3.New(var_562_7.x, var_562_7.y, var_562_7.z)

				local var_562_8 = var_562_0.localEulerAngles

				var_562_8.z = 0
				var_562_8.x = 0
				var_562_0.localEulerAngles = var_562_8
			end

			local var_562_9 = arg_559_1.actors_["1028ui_story"]
			local var_562_10 = 0

			if var_562_10 < arg_559_1.time_ and arg_559_1.time_ <= var_562_10 + arg_562_0 and arg_559_1.var_.characterEffect1028ui_story == nil then
				arg_559_1.var_.characterEffect1028ui_story = var_562_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_562_11 = 0.200000002980232

			if var_562_10 <= arg_559_1.time_ and arg_559_1.time_ < var_562_10 + var_562_11 then
				local var_562_12 = (arg_559_1.time_ - var_562_10) / var_562_11

				if arg_559_1.var_.characterEffect1028ui_story then
					arg_559_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_559_1.time_ >= var_562_10 + var_562_11 and arg_559_1.time_ < var_562_10 + var_562_11 + arg_562_0 and arg_559_1.var_.characterEffect1028ui_story then
				arg_559_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_562_13 = 0

			if var_562_13 < arg_559_1.time_ and arg_559_1.time_ <= var_562_13 + arg_562_0 then
				arg_559_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_562_14 = 0
			local var_562_15 = 0.45

			if var_562_14 < arg_559_1.time_ and arg_559_1.time_ <= var_562_14 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_16 = arg_559_1:FormatText(StoryNameCfg[327].name)

				arg_559_1.leftNameTxt_.text = var_562_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_17 = arg_559_1:GetWordFromCfg(1102805136)
				local var_562_18 = arg_559_1:FormatText(var_562_17.content)

				arg_559_1.text_.text = var_562_18

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_19 = 18
				local var_562_20 = utf8.len(var_562_18)
				local var_562_21 = var_562_19 <= 0 and var_562_15 or var_562_15 * (var_562_20 / var_562_19)

				if var_562_21 > 0 and var_562_15 < var_562_21 then
					arg_559_1.talkMaxDuration = var_562_21

					if var_562_21 + var_562_14 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_21 + var_562_14
					end
				end

				arg_559_1.text_.text = var_562_18
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805136", "story_v_side_new_1102805.awb") ~= 0 then
					local var_562_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805136", "story_v_side_new_1102805.awb") / 1000

					if var_562_22 + var_562_14 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_22 + var_562_14
					end

					if var_562_17.prefab_name ~= "" and arg_559_1.actors_[var_562_17.prefab_name] ~= nil then
						local var_562_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_17.prefab_name].transform, "story_v_side_new_1102805", "1102805136", "story_v_side_new_1102805.awb")

						arg_559_1:RecordAudio("1102805136", var_562_23)
						arg_559_1:RecordAudio("1102805136", var_562_23)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805136", "story_v_side_new_1102805.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805136", "story_v_side_new_1102805.awb")
				end

				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_24 = math.max(var_562_15, arg_559_1.talkMaxDuration)

			if var_562_14 <= arg_559_1.time_ and arg_559_1.time_ < var_562_14 + var_562_24 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_14) / var_562_24

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_14 + var_562_24 and arg_559_1.time_ < var_562_14 + var_562_24 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805137 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 1102805137
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play1102805138(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = arg_563_1.actors_["1028ui_story"].transform
			local var_566_1 = 0

			if var_566_1 < arg_563_1.time_ and arg_563_1.time_ <= var_566_1 + arg_566_0 then
				arg_563_1.var_.moveOldPos1028ui_story = var_566_0.localPosition
			end

			local var_566_2 = 0.001

			if var_566_1 <= arg_563_1.time_ and arg_563_1.time_ < var_566_1 + var_566_2 then
				local var_566_3 = (arg_563_1.time_ - var_566_1) / var_566_2
				local var_566_4 = Vector3.New(0, 100, 0)

				var_566_0.localPosition = Vector3.Lerp(arg_563_1.var_.moveOldPos1028ui_story, var_566_4, var_566_3)

				local var_566_5 = manager.ui.mainCamera.transform.position - var_566_0.position

				var_566_0.forward = Vector3.New(var_566_5.x, var_566_5.y, var_566_5.z)

				local var_566_6 = var_566_0.localEulerAngles

				var_566_6.z = 0
				var_566_6.x = 0
				var_566_0.localEulerAngles = var_566_6
			end

			if arg_563_1.time_ >= var_566_1 + var_566_2 and arg_563_1.time_ < var_566_1 + var_566_2 + arg_566_0 then
				var_566_0.localPosition = Vector3.New(0, 100, 0)

				local var_566_7 = manager.ui.mainCamera.transform.position - var_566_0.position

				var_566_0.forward = Vector3.New(var_566_7.x, var_566_7.y, var_566_7.z)

				local var_566_8 = var_566_0.localEulerAngles

				var_566_8.z = 0
				var_566_8.x = 0
				var_566_0.localEulerAngles = var_566_8
			end

			local var_566_9 = arg_563_1.actors_["1028ui_story"]
			local var_566_10 = 0

			if var_566_10 < arg_563_1.time_ and arg_563_1.time_ <= var_566_10 + arg_566_0 and arg_563_1.var_.characterEffect1028ui_story == nil then
				arg_563_1.var_.characterEffect1028ui_story = var_566_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_566_11 = 0.200000002980232

			if var_566_10 <= arg_563_1.time_ and arg_563_1.time_ < var_566_10 + var_566_11 then
				local var_566_12 = (arg_563_1.time_ - var_566_10) / var_566_11

				if arg_563_1.var_.characterEffect1028ui_story then
					local var_566_13 = Mathf.Lerp(0, 0.5, var_566_12)

					arg_563_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_563_1.var_.characterEffect1028ui_story.fillRatio = var_566_13
				end
			end

			if arg_563_1.time_ >= var_566_10 + var_566_11 and arg_563_1.time_ < var_566_10 + var_566_11 + arg_566_0 and arg_563_1.var_.characterEffect1028ui_story then
				local var_566_14 = 0.5

				arg_563_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_563_1.var_.characterEffect1028ui_story.fillRatio = var_566_14
			end

			local var_566_15 = 0
			local var_566_16 = 0.75

			if var_566_15 < arg_563_1.time_ and arg_563_1.time_ <= var_566_15 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, false)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_17 = arg_563_1:GetWordFromCfg(1102805137)
				local var_566_18 = arg_563_1:FormatText(var_566_17.content)

				arg_563_1.text_.text = var_566_18

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_19 = 30
				local var_566_20 = utf8.len(var_566_18)
				local var_566_21 = var_566_19 <= 0 and var_566_16 or var_566_16 * (var_566_20 / var_566_19)

				if var_566_21 > 0 and var_566_16 < var_566_21 then
					arg_563_1.talkMaxDuration = var_566_21

					if var_566_21 + var_566_15 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_21 + var_566_15
					end
				end

				arg_563_1.text_.text = var_566_18
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_22 = math.max(var_566_16, arg_563_1.talkMaxDuration)

			if var_566_15 <= arg_563_1.time_ and arg_563_1.time_ < var_566_15 + var_566_22 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_15) / var_566_22

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_15 + var_566_22 and arg_563_1.time_ < var_566_15 + var_566_22 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805138 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 1102805138
		arg_567_1.duration_ = 5

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play1102805139(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0
			local var_570_1 = 0.2

			if var_570_0 < arg_567_1.time_ and arg_567_1.time_ <= var_570_0 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_2 = arg_567_1:FormatText(StoryNameCfg[7].name)

				arg_567_1.leftNameTxt_.text = var_570_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_3 = arg_567_1:GetWordFromCfg(1102805138)
				local var_570_4 = arg_567_1:FormatText(var_570_3.content)

				arg_567_1.text_.text = var_570_4

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_5 = 8
				local var_570_6 = utf8.len(var_570_4)
				local var_570_7 = var_570_5 <= 0 and var_570_1 or var_570_1 * (var_570_6 / var_570_5)

				if var_570_7 > 0 and var_570_1 < var_570_7 then
					arg_567_1.talkMaxDuration = var_570_7

					if var_570_7 + var_570_0 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_7 + var_570_0
					end
				end

				arg_567_1.text_.text = var_570_4
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)
				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_8 = math.max(var_570_1, arg_567_1.talkMaxDuration)

			if var_570_0 <= arg_567_1.time_ and arg_567_1.time_ < var_570_0 + var_570_8 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_0) / var_570_8

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_0 + var_570_8 and arg_567_1.time_ < var_570_0 + var_570_8 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805139 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 1102805139
		arg_571_1.duration_ = 5.433

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play1102805140(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["1028ui_story"].transform
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 then
				arg_571_1.var_.moveOldPos1028ui_story = var_574_0.localPosition
			end

			local var_574_2 = 0.001

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2
				local var_574_4 = Vector3.New(0, -0.9, -5.9)

				var_574_0.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1028ui_story, var_574_4, var_574_3)

				local var_574_5 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_5.x, var_574_5.y, var_574_5.z)

				local var_574_6 = var_574_0.localEulerAngles

				var_574_6.z = 0
				var_574_6.x = 0
				var_574_0.localEulerAngles = var_574_6
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 then
				var_574_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_574_7 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_7.x, var_574_7.y, var_574_7.z)

				local var_574_8 = var_574_0.localEulerAngles

				var_574_8.z = 0
				var_574_8.x = 0
				var_574_0.localEulerAngles = var_574_8
			end

			local var_574_9 = arg_571_1.actors_["1028ui_story"]
			local var_574_10 = 0

			if var_574_10 < arg_571_1.time_ and arg_571_1.time_ <= var_574_10 + arg_574_0 and arg_571_1.var_.characterEffect1028ui_story == nil then
				arg_571_1.var_.characterEffect1028ui_story = var_574_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_11 = 0.200000002980232

			if var_574_10 <= arg_571_1.time_ and arg_571_1.time_ < var_574_10 + var_574_11 then
				local var_574_12 = (arg_571_1.time_ - var_574_10) / var_574_11

				if arg_571_1.var_.characterEffect1028ui_story then
					arg_571_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_571_1.time_ >= var_574_10 + var_574_11 and arg_571_1.time_ < var_574_10 + var_574_11 + arg_574_0 and arg_571_1.var_.characterEffect1028ui_story then
				arg_571_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_574_13 = 0

			if var_574_13 < arg_571_1.time_ and arg_571_1.time_ <= var_574_13 + arg_574_0 then
				arg_571_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_574_14 = 0
			local var_574_15 = 0.575

			if var_574_14 < arg_571_1.time_ and arg_571_1.time_ <= var_574_14 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_16 = arg_571_1:FormatText(StoryNameCfg[327].name)

				arg_571_1.leftNameTxt_.text = var_574_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_17 = arg_571_1:GetWordFromCfg(1102805139)
				local var_574_18 = arg_571_1:FormatText(var_574_17.content)

				arg_571_1.text_.text = var_574_18

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_19 = 23
				local var_574_20 = utf8.len(var_574_18)
				local var_574_21 = var_574_19 <= 0 and var_574_15 or var_574_15 * (var_574_20 / var_574_19)

				if var_574_21 > 0 and var_574_15 < var_574_21 then
					arg_571_1.talkMaxDuration = var_574_21

					if var_574_21 + var_574_14 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_21 + var_574_14
					end
				end

				arg_571_1.text_.text = var_574_18
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805139", "story_v_side_new_1102805.awb") ~= 0 then
					local var_574_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805139", "story_v_side_new_1102805.awb") / 1000

					if var_574_22 + var_574_14 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_22 + var_574_14
					end

					if var_574_17.prefab_name ~= "" and arg_571_1.actors_[var_574_17.prefab_name] ~= nil then
						local var_574_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_571_1.actors_[var_574_17.prefab_name].transform, "story_v_side_new_1102805", "1102805139", "story_v_side_new_1102805.awb")

						arg_571_1:RecordAudio("1102805139", var_574_23)
						arg_571_1:RecordAudio("1102805139", var_574_23)
					else
						arg_571_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805139", "story_v_side_new_1102805.awb")
					end

					arg_571_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805139", "story_v_side_new_1102805.awb")
				end

				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_24 = math.max(var_574_15, arg_571_1.talkMaxDuration)

			if var_574_14 <= arg_571_1.time_ and arg_571_1.time_ < var_574_14 + var_574_24 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_14) / var_574_24

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_14 + var_574_24 and arg_571_1.time_ < var_574_14 + var_574_24 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805140 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 1102805140
		arg_575_1.duration_ = 5

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play1102805141(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = arg_575_1.actors_["1028ui_story"].transform
			local var_578_1 = 0

			if var_578_1 < arg_575_1.time_ and arg_575_1.time_ <= var_578_1 + arg_578_0 then
				arg_575_1.var_.moveOldPos1028ui_story = var_578_0.localPosition
			end

			local var_578_2 = 0.001

			if var_578_1 <= arg_575_1.time_ and arg_575_1.time_ < var_578_1 + var_578_2 then
				local var_578_3 = (arg_575_1.time_ - var_578_1) / var_578_2
				local var_578_4 = Vector3.New(0, 100, 0)

				var_578_0.localPosition = Vector3.Lerp(arg_575_1.var_.moveOldPos1028ui_story, var_578_4, var_578_3)

				local var_578_5 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_5.x, var_578_5.y, var_578_5.z)

				local var_578_6 = var_578_0.localEulerAngles

				var_578_6.z = 0
				var_578_6.x = 0
				var_578_0.localEulerAngles = var_578_6
			end

			if arg_575_1.time_ >= var_578_1 + var_578_2 and arg_575_1.time_ < var_578_1 + var_578_2 + arg_578_0 then
				var_578_0.localPosition = Vector3.New(0, 100, 0)

				local var_578_7 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_7.x, var_578_7.y, var_578_7.z)

				local var_578_8 = var_578_0.localEulerAngles

				var_578_8.z = 0
				var_578_8.x = 0
				var_578_0.localEulerAngles = var_578_8
			end

			local var_578_9 = arg_575_1.actors_["1028ui_story"]
			local var_578_10 = 0

			if var_578_10 < arg_575_1.time_ and arg_575_1.time_ <= var_578_10 + arg_578_0 and arg_575_1.var_.characterEffect1028ui_story == nil then
				arg_575_1.var_.characterEffect1028ui_story = var_578_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_578_11 = 0.200000002980232

			if var_578_10 <= arg_575_1.time_ and arg_575_1.time_ < var_578_10 + var_578_11 then
				local var_578_12 = (arg_575_1.time_ - var_578_10) / var_578_11

				if arg_575_1.var_.characterEffect1028ui_story then
					local var_578_13 = Mathf.Lerp(0, 0.5, var_578_12)

					arg_575_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_575_1.var_.characterEffect1028ui_story.fillRatio = var_578_13
				end
			end

			if arg_575_1.time_ >= var_578_10 + var_578_11 and arg_575_1.time_ < var_578_10 + var_578_11 + arg_578_0 and arg_575_1.var_.characterEffect1028ui_story then
				local var_578_14 = 0.5

				arg_575_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_575_1.var_.characterEffect1028ui_story.fillRatio = var_578_14
			end

			local var_578_15 = 0
			local var_578_16 = 0.775

			if var_578_15 < arg_575_1.time_ and arg_575_1.time_ <= var_578_15 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, false)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_17 = arg_575_1:GetWordFromCfg(1102805140)
				local var_578_18 = arg_575_1:FormatText(var_578_17.content)

				arg_575_1.text_.text = var_578_18

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_19 = 31
				local var_578_20 = utf8.len(var_578_18)
				local var_578_21 = var_578_19 <= 0 and var_578_16 or var_578_16 * (var_578_20 / var_578_19)

				if var_578_21 > 0 and var_578_16 < var_578_21 then
					arg_575_1.talkMaxDuration = var_578_21

					if var_578_21 + var_578_15 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_21 + var_578_15
					end
				end

				arg_575_1.text_.text = var_578_18
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)
				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_22 = math.max(var_578_16, arg_575_1.talkMaxDuration)

			if var_578_15 <= arg_575_1.time_ and arg_575_1.time_ < var_578_15 + var_578_22 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_15) / var_578_22

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_15 + var_578_22 and arg_575_1.time_ < var_578_15 + var_578_22 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805141 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 1102805141
		arg_579_1.duration_ = 5

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play1102805142(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = 0
			local var_582_1 = 0.625

			if var_582_0 < arg_579_1.time_ and arg_579_1.time_ <= var_582_0 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_2 = arg_579_1:FormatText(StoryNameCfg[7].name)

				arg_579_1.leftNameTxt_.text = var_582_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_3 = arg_579_1:GetWordFromCfg(1102805141)
				local var_582_4 = arg_579_1:FormatText(var_582_3.content)

				arg_579_1.text_.text = var_582_4

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_5 = 25
				local var_582_6 = utf8.len(var_582_4)
				local var_582_7 = var_582_5 <= 0 and var_582_1 or var_582_1 * (var_582_6 / var_582_5)

				if var_582_7 > 0 and var_582_1 < var_582_7 then
					arg_579_1.talkMaxDuration = var_582_7

					if var_582_7 + var_582_0 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_7 + var_582_0
					end
				end

				arg_579_1.text_.text = var_582_4
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)
				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_8 = math.max(var_582_1, arg_579_1.talkMaxDuration)

			if var_582_0 <= arg_579_1.time_ and arg_579_1.time_ < var_582_0 + var_582_8 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_0) / var_582_8

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_0 + var_582_8 and arg_579_1.time_ < var_582_0 + var_582_8 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805142 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 1102805142
		arg_583_1.duration_ = 1.6

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play1102805143(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1028ui_story"].transform
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 then
				arg_583_1.var_.moveOldPos1028ui_story = var_586_0.localPosition
			end

			local var_586_2 = 0.001

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2
				local var_586_4 = Vector3.New(0, -0.9, -5.9)

				var_586_0.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos1028ui_story, var_586_4, var_586_3)

				local var_586_5 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_5.x, var_586_5.y, var_586_5.z)

				local var_586_6 = var_586_0.localEulerAngles

				var_586_6.z = 0
				var_586_6.x = 0
				var_586_0.localEulerAngles = var_586_6
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 then
				var_586_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_586_7 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_7.x, var_586_7.y, var_586_7.z)

				local var_586_8 = var_586_0.localEulerAngles

				var_586_8.z = 0
				var_586_8.x = 0
				var_586_0.localEulerAngles = var_586_8
			end

			local var_586_9 = arg_583_1.actors_["1028ui_story"]
			local var_586_10 = 0

			if var_586_10 < arg_583_1.time_ and arg_583_1.time_ <= var_586_10 + arg_586_0 and arg_583_1.var_.characterEffect1028ui_story == nil then
				arg_583_1.var_.characterEffect1028ui_story = var_586_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_11 = 0.200000002980232

			if var_586_10 <= arg_583_1.time_ and arg_583_1.time_ < var_586_10 + var_586_11 then
				local var_586_12 = (arg_583_1.time_ - var_586_10) / var_586_11

				if arg_583_1.var_.characterEffect1028ui_story then
					arg_583_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_583_1.time_ >= var_586_10 + var_586_11 and arg_583_1.time_ < var_586_10 + var_586_11 + arg_586_0 and arg_583_1.var_.characterEffect1028ui_story then
				arg_583_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_586_13 = 0

			if var_586_13 < arg_583_1.time_ and arg_583_1.time_ <= var_586_13 + arg_586_0 then
				arg_583_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_586_14 = 0

			if var_586_14 < arg_583_1.time_ and arg_583_1.time_ <= var_586_14 + arg_586_0 then
				arg_583_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_586_15 = 0
			local var_586_16 = 0.15

			if var_586_15 < arg_583_1.time_ and arg_583_1.time_ <= var_586_15 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, true)

				local var_586_17 = arg_583_1:FormatText(StoryNameCfg[327].name)

				arg_583_1.leftNameTxt_.text = var_586_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_583_1.leftNameTxt_.transform)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1.leftNameTxt_.text)
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_18 = arg_583_1:GetWordFromCfg(1102805142)
				local var_586_19 = arg_583_1:FormatText(var_586_18.content)

				arg_583_1.text_.text = var_586_19

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_20 = 6
				local var_586_21 = utf8.len(var_586_19)
				local var_586_22 = var_586_20 <= 0 and var_586_16 or var_586_16 * (var_586_21 / var_586_20)

				if var_586_22 > 0 and var_586_16 < var_586_22 then
					arg_583_1.talkMaxDuration = var_586_22

					if var_586_22 + var_586_15 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_22 + var_586_15
					end
				end

				arg_583_1.text_.text = var_586_19
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805142", "story_v_side_new_1102805.awb") ~= 0 then
					local var_586_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805142", "story_v_side_new_1102805.awb") / 1000

					if var_586_23 + var_586_15 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_23 + var_586_15
					end

					if var_586_18.prefab_name ~= "" and arg_583_1.actors_[var_586_18.prefab_name] ~= nil then
						local var_586_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_583_1.actors_[var_586_18.prefab_name].transform, "story_v_side_new_1102805", "1102805142", "story_v_side_new_1102805.awb")

						arg_583_1:RecordAudio("1102805142", var_586_24)
						arg_583_1:RecordAudio("1102805142", var_586_24)
					else
						arg_583_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805142", "story_v_side_new_1102805.awb")
					end

					arg_583_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805142", "story_v_side_new_1102805.awb")
				end

				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_25 = math.max(var_586_16, arg_583_1.talkMaxDuration)

			if var_586_15 <= arg_583_1.time_ and arg_583_1.time_ < var_586_15 + var_586_25 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_15) / var_586_25

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_15 + var_586_25 and arg_583_1.time_ < var_586_15 + var_586_25 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805143 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 1102805143
		arg_587_1.duration_ = 9

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play1102805144(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = 2

			if var_590_0 < arg_587_1.time_ and arg_587_1.time_ <= var_590_0 + arg_590_0 then
				local var_590_1 = manager.ui.mainCamera.transform.localPosition
				local var_590_2 = Vector3.New(0, 0, 10) + Vector3.New(var_590_1.x, var_590_1.y, 0)
				local var_590_3 = arg_587_1.bgs_.STblack

				var_590_3.transform.localPosition = var_590_2
				var_590_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_590_4 = var_590_3:GetComponent("SpriteRenderer")

				if var_590_4 and var_590_4.sprite then
					local var_590_5 = (var_590_3.transform.localPosition - var_590_1).z
					local var_590_6 = manager.ui.mainCameraCom_
					local var_590_7 = 2 * var_590_5 * Mathf.Tan(var_590_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_590_8 = var_590_7 * var_590_6.aspect
					local var_590_9 = var_590_4.sprite.bounds.size.x
					local var_590_10 = var_590_4.sprite.bounds.size.y
					local var_590_11 = var_590_8 / var_590_9
					local var_590_12 = var_590_7 / var_590_10
					local var_590_13 = var_590_12 < var_590_11 and var_590_11 or var_590_12

					var_590_3.transform.localScale = Vector3.New(var_590_13, var_590_13, 0)
				end

				for iter_590_0, iter_590_1 in pairs(arg_587_1.bgs_) do
					if iter_590_0 ~= "STblack" then
						iter_590_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_590_14 = arg_587_1.actors_["1028ui_story"].transform
			local var_590_15 = 2

			if var_590_15 < arg_587_1.time_ and arg_587_1.time_ <= var_590_15 + arg_590_0 then
				arg_587_1.var_.moveOldPos1028ui_story = var_590_14.localPosition
			end

			local var_590_16 = 0.001

			if var_590_15 <= arg_587_1.time_ and arg_587_1.time_ < var_590_15 + var_590_16 then
				local var_590_17 = (arg_587_1.time_ - var_590_15) / var_590_16
				local var_590_18 = Vector3.New(0, 100, 0)

				var_590_14.localPosition = Vector3.Lerp(arg_587_1.var_.moveOldPos1028ui_story, var_590_18, var_590_17)

				local var_590_19 = manager.ui.mainCamera.transform.position - var_590_14.position

				var_590_14.forward = Vector3.New(var_590_19.x, var_590_19.y, var_590_19.z)

				local var_590_20 = var_590_14.localEulerAngles

				var_590_20.z = 0
				var_590_20.x = 0
				var_590_14.localEulerAngles = var_590_20
			end

			if arg_587_1.time_ >= var_590_15 + var_590_16 and arg_587_1.time_ < var_590_15 + var_590_16 + arg_590_0 then
				var_590_14.localPosition = Vector3.New(0, 100, 0)

				local var_590_21 = manager.ui.mainCamera.transform.position - var_590_14.position

				var_590_14.forward = Vector3.New(var_590_21.x, var_590_21.y, var_590_21.z)

				local var_590_22 = var_590_14.localEulerAngles

				var_590_22.z = 0
				var_590_22.x = 0
				var_590_14.localEulerAngles = var_590_22
			end

			local var_590_23 = 0

			if var_590_23 < arg_587_1.time_ and arg_587_1.time_ <= var_590_23 + arg_590_0 then
				arg_587_1.mask_.enabled = true
				arg_587_1.mask_.raycastTarget = true

				arg_587_1:SetGaussion(false)
			end

			local var_590_24 = 2

			if var_590_23 <= arg_587_1.time_ and arg_587_1.time_ < var_590_23 + var_590_24 then
				local var_590_25 = (arg_587_1.time_ - var_590_23) / var_590_24
				local var_590_26 = Color.New(0, 0, 0)

				var_590_26.a = Mathf.Lerp(0, 1, var_590_25)
				arg_587_1.mask_.color = var_590_26
			end

			if arg_587_1.time_ >= var_590_23 + var_590_24 and arg_587_1.time_ < var_590_23 + var_590_24 + arg_590_0 then
				local var_590_27 = Color.New(0, 0, 0)

				var_590_27.a = 1
				arg_587_1.mask_.color = var_590_27
			end

			local var_590_28 = 2

			if var_590_28 < arg_587_1.time_ and arg_587_1.time_ <= var_590_28 + arg_590_0 then
				arg_587_1.mask_.enabled = true
				arg_587_1.mask_.raycastTarget = true

				arg_587_1:SetGaussion(false)
			end

			local var_590_29 = 2

			if var_590_28 <= arg_587_1.time_ and arg_587_1.time_ < var_590_28 + var_590_29 then
				local var_590_30 = (arg_587_1.time_ - var_590_28) / var_590_29
				local var_590_31 = Color.New(0, 0, 0)

				var_590_31.a = Mathf.Lerp(1, 0, var_590_30)
				arg_587_1.mask_.color = var_590_31
			end

			if arg_587_1.time_ >= var_590_28 + var_590_29 and arg_587_1.time_ < var_590_28 + var_590_29 + arg_590_0 then
				local var_590_32 = Color.New(0, 0, 0)
				local var_590_33 = 0

				arg_587_1.mask_.enabled = false
				var_590_32.a = var_590_33
				arg_587_1.mask_.color = var_590_32
			end

			if arg_587_1.frameCnt_ <= 1 then
				arg_587_1.dialog_:SetActive(false)
			end

			local var_590_34 = 4
			local var_590_35 = 0.675

			if var_590_34 < arg_587_1.time_ and arg_587_1.time_ <= var_590_34 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0

				arg_587_1.dialog_:SetActive(true)

				local var_590_36 = LeanTween.value(arg_587_1.dialog_, 0, 1, 0.3)

				var_590_36:setOnUpdate(LuaHelper.FloatAction(function(arg_591_0)
					arg_587_1.dialogCg_.alpha = arg_591_0
				end))
				var_590_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_587_1.dialog_)
					var_590_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_587_1.duration_ = arg_587_1.duration_ + 0.3

				SetActive(arg_587_1.leftNameGo_, false)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_37 = arg_587_1:GetWordFromCfg(1102805143)
				local var_590_38 = arg_587_1:FormatText(var_590_37.content)

				arg_587_1.text_.text = var_590_38

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_39 = 27
				local var_590_40 = utf8.len(var_590_38)
				local var_590_41 = var_590_39 <= 0 and var_590_35 or var_590_35 * (var_590_40 / var_590_39)

				if var_590_41 > 0 and var_590_35 < var_590_41 then
					arg_587_1.talkMaxDuration = var_590_41
					var_590_34 = var_590_34 + 0.3

					if var_590_41 + var_590_34 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_41 + var_590_34
					end
				end

				arg_587_1.text_.text = var_590_38
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)
				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_42 = var_590_34 + 0.3
			local var_590_43 = math.max(var_590_35, arg_587_1.talkMaxDuration)

			if var_590_42 <= arg_587_1.time_ and arg_587_1.time_ < var_590_42 + var_590_43 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_42) / var_590_43

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_42 + var_590_43 and arg_587_1.time_ < var_590_42 + var_590_43 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805144 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 1102805144
		arg_593_1.duration_ = 7

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play1102805145(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = 0

			if var_596_0 < arg_593_1.time_ and arg_593_1.time_ <= var_596_0 + arg_596_0 then
				local var_596_1 = manager.ui.mainCamera.transform.localPosition
				local var_596_2 = Vector3.New(0, 0, 10) + Vector3.New(var_596_1.x, var_596_1.y, 0)
				local var_596_3 = arg_593_1.bgs_.B04e

				var_596_3.transform.localPosition = var_596_2
				var_596_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_596_4 = var_596_3:GetComponent("SpriteRenderer")

				if var_596_4 and var_596_4.sprite then
					local var_596_5 = (var_596_3.transform.localPosition - var_596_1).z
					local var_596_6 = manager.ui.mainCameraCom_
					local var_596_7 = 2 * var_596_5 * Mathf.Tan(var_596_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_596_8 = var_596_7 * var_596_6.aspect
					local var_596_9 = var_596_4.sprite.bounds.size.x
					local var_596_10 = var_596_4.sprite.bounds.size.y
					local var_596_11 = var_596_8 / var_596_9
					local var_596_12 = var_596_7 / var_596_10
					local var_596_13 = var_596_12 < var_596_11 and var_596_11 or var_596_12

					var_596_3.transform.localScale = Vector3.New(var_596_13, var_596_13, 0)
				end

				for iter_596_0, iter_596_1 in pairs(arg_593_1.bgs_) do
					if iter_596_0 ~= "B04e" then
						iter_596_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_596_14 = 0

			if var_596_14 < arg_593_1.time_ and arg_593_1.time_ <= var_596_14 + arg_596_0 then
				arg_593_1.mask_.enabled = true
				arg_593_1.mask_.raycastTarget = true

				arg_593_1:SetGaussion(false)
			end

			local var_596_15 = 2

			if var_596_14 <= arg_593_1.time_ and arg_593_1.time_ < var_596_14 + var_596_15 then
				local var_596_16 = (arg_593_1.time_ - var_596_14) / var_596_15
				local var_596_17 = Color.New(0, 0, 0)

				var_596_17.a = Mathf.Lerp(1, 0, var_596_16)
				arg_593_1.mask_.color = var_596_17
			end

			if arg_593_1.time_ >= var_596_14 + var_596_15 and arg_593_1.time_ < var_596_14 + var_596_15 + arg_596_0 then
				local var_596_18 = Color.New(0, 0, 0)
				local var_596_19 = 0

				arg_593_1.mask_.enabled = false
				var_596_18.a = var_596_19
				arg_593_1.mask_.color = var_596_18
			end

			if arg_593_1.frameCnt_ <= 1 then
				arg_593_1.dialog_:SetActive(false)
			end

			local var_596_20 = 2
			local var_596_21 = 0.875

			if var_596_20 < arg_593_1.time_ and arg_593_1.time_ <= var_596_20 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0

				arg_593_1.dialog_:SetActive(true)

				local var_596_22 = LeanTween.value(arg_593_1.dialog_, 0, 1, 0.3)

				var_596_22:setOnUpdate(LuaHelper.FloatAction(function(arg_597_0)
					arg_593_1.dialogCg_.alpha = arg_597_0
				end))
				var_596_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_593_1.dialog_)
					var_596_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_593_1.duration_ = arg_593_1.duration_ + 0.3

				SetActive(arg_593_1.leftNameGo_, false)

				arg_593_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_593_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_593_1:RecordName(arg_593_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_593_1.iconTrs_.gameObject, false)
				arg_593_1.callingController_:SetSelectedState("normal")

				local var_596_23 = arg_593_1:GetWordFromCfg(1102805144)
				local var_596_24 = arg_593_1:FormatText(var_596_23.content)

				arg_593_1.text_.text = var_596_24

				LuaForUtil.ClearLinePrefixSymbol(arg_593_1.text_)

				local var_596_25 = 35
				local var_596_26 = utf8.len(var_596_24)
				local var_596_27 = var_596_25 <= 0 and var_596_21 or var_596_21 * (var_596_26 / var_596_25)

				if var_596_27 > 0 and var_596_21 < var_596_27 then
					arg_593_1.talkMaxDuration = var_596_27
					var_596_20 = var_596_20 + 0.3

					if var_596_27 + var_596_20 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_27 + var_596_20
					end
				end

				arg_593_1.text_.text = var_596_24
				arg_593_1.typewritter.percent = 0

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(false)
				arg_593_1:RecordContent(arg_593_1.text_.text)
			end

			local var_596_28 = var_596_20 + 0.3
			local var_596_29 = math.max(var_596_21, arg_593_1.talkMaxDuration)

			if var_596_28 <= arg_593_1.time_ and arg_593_1.time_ < var_596_28 + var_596_29 then
				arg_593_1.typewritter.percent = (arg_593_1.time_ - var_596_28) / var_596_29

				arg_593_1.typewritter:SetDirty()
			end

			if arg_593_1.time_ >= var_596_28 + var_596_29 and arg_593_1.time_ < var_596_28 + var_596_29 + arg_596_0 then
				arg_593_1.typewritter.percent = 1

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805145 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 1102805145
		arg_599_1.duration_ = 2.4

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play1102805146(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["1028ui_story"].transform
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 then
				arg_599_1.var_.moveOldPos1028ui_story = var_602_0.localPosition
			end

			local var_602_2 = 0.001

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_2 then
				local var_602_3 = (arg_599_1.time_ - var_602_1) / var_602_2
				local var_602_4 = Vector3.New(0, -0.9, -5.9)

				var_602_0.localPosition = Vector3.Lerp(arg_599_1.var_.moveOldPos1028ui_story, var_602_4, var_602_3)

				local var_602_5 = manager.ui.mainCamera.transform.position - var_602_0.position

				var_602_0.forward = Vector3.New(var_602_5.x, var_602_5.y, var_602_5.z)

				local var_602_6 = var_602_0.localEulerAngles

				var_602_6.z = 0
				var_602_6.x = 0
				var_602_0.localEulerAngles = var_602_6
			end

			if arg_599_1.time_ >= var_602_1 + var_602_2 and arg_599_1.time_ < var_602_1 + var_602_2 + arg_602_0 then
				var_602_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_602_7 = manager.ui.mainCamera.transform.position - var_602_0.position

				var_602_0.forward = Vector3.New(var_602_7.x, var_602_7.y, var_602_7.z)

				local var_602_8 = var_602_0.localEulerAngles

				var_602_8.z = 0
				var_602_8.x = 0
				var_602_0.localEulerAngles = var_602_8
			end

			local var_602_9 = arg_599_1.actors_["1028ui_story"]
			local var_602_10 = 0

			if var_602_10 < arg_599_1.time_ and arg_599_1.time_ <= var_602_10 + arg_602_0 and arg_599_1.var_.characterEffect1028ui_story == nil then
				arg_599_1.var_.characterEffect1028ui_story = var_602_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_11 = 0.200000002980232

			if var_602_10 <= arg_599_1.time_ and arg_599_1.time_ < var_602_10 + var_602_11 then
				local var_602_12 = (arg_599_1.time_ - var_602_10) / var_602_11

				if arg_599_1.var_.characterEffect1028ui_story then
					arg_599_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_599_1.time_ >= var_602_10 + var_602_11 and arg_599_1.time_ < var_602_10 + var_602_11 + arg_602_0 and arg_599_1.var_.characterEffect1028ui_story then
				arg_599_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_602_13 = 0

			if var_602_13 < arg_599_1.time_ and arg_599_1.time_ <= var_602_13 + arg_602_0 then
				arg_599_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_602_14 = 0

			if var_602_14 < arg_599_1.time_ and arg_599_1.time_ <= var_602_14 + arg_602_0 then
				arg_599_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_602_15 = 0
			local var_602_16 = 0.25

			if var_602_15 < arg_599_1.time_ and arg_599_1.time_ <= var_602_15 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_17 = arg_599_1:FormatText(StoryNameCfg[327].name)

				arg_599_1.leftNameTxt_.text = var_602_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_18 = arg_599_1:GetWordFromCfg(1102805145)
				local var_602_19 = arg_599_1:FormatText(var_602_18.content)

				arg_599_1.text_.text = var_602_19

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_20 = 10
				local var_602_21 = utf8.len(var_602_19)
				local var_602_22 = var_602_20 <= 0 and var_602_16 or var_602_16 * (var_602_21 / var_602_20)

				if var_602_22 > 0 and var_602_16 < var_602_22 then
					arg_599_1.talkMaxDuration = var_602_22

					if var_602_22 + var_602_15 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_22 + var_602_15
					end
				end

				arg_599_1.text_.text = var_602_19
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805145", "story_v_side_new_1102805.awb") ~= 0 then
					local var_602_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805145", "story_v_side_new_1102805.awb") / 1000

					if var_602_23 + var_602_15 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_23 + var_602_15
					end

					if var_602_18.prefab_name ~= "" and arg_599_1.actors_[var_602_18.prefab_name] ~= nil then
						local var_602_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_18.prefab_name].transform, "story_v_side_new_1102805", "1102805145", "story_v_side_new_1102805.awb")

						arg_599_1:RecordAudio("1102805145", var_602_24)
						arg_599_1:RecordAudio("1102805145", var_602_24)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805145", "story_v_side_new_1102805.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805145", "story_v_side_new_1102805.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_25 = math.max(var_602_16, arg_599_1.talkMaxDuration)

			if var_602_15 <= arg_599_1.time_ and arg_599_1.time_ < var_602_15 + var_602_25 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_15) / var_602_25

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_15 + var_602_25 and arg_599_1.time_ < var_602_15 + var_602_25 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805146 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 1102805146
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play1102805147(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = arg_603_1.actors_["1028ui_story"].transform
			local var_606_1 = 0

			if var_606_1 < arg_603_1.time_ and arg_603_1.time_ <= var_606_1 + arg_606_0 then
				arg_603_1.var_.moveOldPos1028ui_story = var_606_0.localPosition
			end

			local var_606_2 = 0.001

			if var_606_1 <= arg_603_1.time_ and arg_603_1.time_ < var_606_1 + var_606_2 then
				local var_606_3 = (arg_603_1.time_ - var_606_1) / var_606_2
				local var_606_4 = Vector3.New(0, 100, 0)

				var_606_0.localPosition = Vector3.Lerp(arg_603_1.var_.moveOldPos1028ui_story, var_606_4, var_606_3)

				local var_606_5 = manager.ui.mainCamera.transform.position - var_606_0.position

				var_606_0.forward = Vector3.New(var_606_5.x, var_606_5.y, var_606_5.z)

				local var_606_6 = var_606_0.localEulerAngles

				var_606_6.z = 0
				var_606_6.x = 0
				var_606_0.localEulerAngles = var_606_6
			end

			if arg_603_1.time_ >= var_606_1 + var_606_2 and arg_603_1.time_ < var_606_1 + var_606_2 + arg_606_0 then
				var_606_0.localPosition = Vector3.New(0, 100, 0)

				local var_606_7 = manager.ui.mainCamera.transform.position - var_606_0.position

				var_606_0.forward = Vector3.New(var_606_7.x, var_606_7.y, var_606_7.z)

				local var_606_8 = var_606_0.localEulerAngles

				var_606_8.z = 0
				var_606_8.x = 0
				var_606_0.localEulerAngles = var_606_8
			end

			local var_606_9 = arg_603_1.actors_["1028ui_story"]
			local var_606_10 = 0

			if var_606_10 < arg_603_1.time_ and arg_603_1.time_ <= var_606_10 + arg_606_0 and arg_603_1.var_.characterEffect1028ui_story == nil then
				arg_603_1.var_.characterEffect1028ui_story = var_606_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_606_11 = 0.200000002980232

			if var_606_10 <= arg_603_1.time_ and arg_603_1.time_ < var_606_10 + var_606_11 then
				local var_606_12 = (arg_603_1.time_ - var_606_10) / var_606_11

				if arg_603_1.var_.characterEffect1028ui_story then
					local var_606_13 = Mathf.Lerp(0, 0.5, var_606_12)

					arg_603_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_603_1.var_.characterEffect1028ui_story.fillRatio = var_606_13
				end
			end

			if arg_603_1.time_ >= var_606_10 + var_606_11 and arg_603_1.time_ < var_606_10 + var_606_11 + arg_606_0 and arg_603_1.var_.characterEffect1028ui_story then
				local var_606_14 = 0.5

				arg_603_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_603_1.var_.characterEffect1028ui_story.fillRatio = var_606_14
			end

			local var_606_15 = 0
			local var_606_16 = 0.375

			if var_606_15 < arg_603_1.time_ and arg_603_1.time_ <= var_606_15 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_17 = arg_603_1:FormatText(StoryNameCfg[7].name)

				arg_603_1.leftNameTxt_.text = var_606_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_18 = arg_603_1:GetWordFromCfg(1102805146)
				local var_606_19 = arg_603_1:FormatText(var_606_18.content)

				arg_603_1.text_.text = var_606_19

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_20 = 15
				local var_606_21 = utf8.len(var_606_19)
				local var_606_22 = var_606_20 <= 0 and var_606_16 or var_606_16 * (var_606_21 / var_606_20)

				if var_606_22 > 0 and var_606_16 < var_606_22 then
					arg_603_1.talkMaxDuration = var_606_22

					if var_606_22 + var_606_15 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_22 + var_606_15
					end
				end

				arg_603_1.text_.text = var_606_19
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_23 = math.max(var_606_16, arg_603_1.talkMaxDuration)

			if var_606_15 <= arg_603_1.time_ and arg_603_1.time_ < var_606_15 + var_606_23 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_15) / var_606_23

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_15 + var_606_23 and arg_603_1.time_ < var_606_15 + var_606_23 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805147 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 1102805147
		arg_607_1.duration_ = 5

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play1102805148(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = 0
			local var_610_1 = 0.625

			if var_610_0 < arg_607_1.time_ and arg_607_1.time_ <= var_610_0 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_2 = arg_607_1:FormatText(StoryNameCfg[7].name)

				arg_607_1.leftNameTxt_.text = var_610_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_3 = arg_607_1:GetWordFromCfg(1102805147)
				local var_610_4 = arg_607_1:FormatText(var_610_3.content)

				arg_607_1.text_.text = var_610_4

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_5 = 25
				local var_610_6 = utf8.len(var_610_4)
				local var_610_7 = var_610_5 <= 0 and var_610_1 or var_610_1 * (var_610_6 / var_610_5)

				if var_610_7 > 0 and var_610_1 < var_610_7 then
					arg_607_1.talkMaxDuration = var_610_7

					if var_610_7 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_7 + var_610_0
					end
				end

				arg_607_1.text_.text = var_610_4
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)
				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_8 = math.max(var_610_1, arg_607_1.talkMaxDuration)

			if var_610_0 <= arg_607_1.time_ and arg_607_1.time_ < var_610_0 + var_610_8 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_0) / var_610_8

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_0 + var_610_8 and arg_607_1.time_ < var_610_0 + var_610_8 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805148 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 1102805148
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play1102805149(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = 0
			local var_614_1 = 0.6

			if var_614_0 < arg_611_1.time_ and arg_611_1.time_ <= var_614_0 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_2 = arg_611_1:FormatText(StoryNameCfg[7].name)

				arg_611_1.leftNameTxt_.text = var_614_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_3 = arg_611_1:GetWordFromCfg(1102805148)
				local var_614_4 = arg_611_1:FormatText(var_614_3.content)

				arg_611_1.text_.text = var_614_4

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_5 = 24
				local var_614_6 = utf8.len(var_614_4)
				local var_614_7 = var_614_5 <= 0 and var_614_1 or var_614_1 * (var_614_6 / var_614_5)

				if var_614_7 > 0 and var_614_1 < var_614_7 then
					arg_611_1.talkMaxDuration = var_614_7

					if var_614_7 + var_614_0 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_7 + var_614_0
					end
				end

				arg_611_1.text_.text = var_614_4
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_8 = math.max(var_614_1, arg_611_1.talkMaxDuration)

			if var_614_0 <= arg_611_1.time_ and arg_611_1.time_ < var_614_0 + var_614_8 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_0) / var_614_8

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_0 + var_614_8 and arg_611_1.time_ < var_614_0 + var_614_8 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805149 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 1102805149
		arg_615_1.duration_ = 1.999999999999

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play1102805150(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = arg_615_1.actors_["1028ui_story"].transform
			local var_618_1 = 0

			if var_618_1 < arg_615_1.time_ and arg_615_1.time_ <= var_618_1 + arg_618_0 then
				arg_615_1.var_.moveOldPos1028ui_story = var_618_0.localPosition
			end

			local var_618_2 = 0.001

			if var_618_1 <= arg_615_1.time_ and arg_615_1.time_ < var_618_1 + var_618_2 then
				local var_618_3 = (arg_615_1.time_ - var_618_1) / var_618_2
				local var_618_4 = Vector3.New(0, -0.9, -5.9)

				var_618_0.localPosition = Vector3.Lerp(arg_615_1.var_.moveOldPos1028ui_story, var_618_4, var_618_3)

				local var_618_5 = manager.ui.mainCamera.transform.position - var_618_0.position

				var_618_0.forward = Vector3.New(var_618_5.x, var_618_5.y, var_618_5.z)

				local var_618_6 = var_618_0.localEulerAngles

				var_618_6.z = 0
				var_618_6.x = 0
				var_618_0.localEulerAngles = var_618_6
			end

			if arg_615_1.time_ >= var_618_1 + var_618_2 and arg_615_1.time_ < var_618_1 + var_618_2 + arg_618_0 then
				var_618_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_618_7 = manager.ui.mainCamera.transform.position - var_618_0.position

				var_618_0.forward = Vector3.New(var_618_7.x, var_618_7.y, var_618_7.z)

				local var_618_8 = var_618_0.localEulerAngles

				var_618_8.z = 0
				var_618_8.x = 0
				var_618_0.localEulerAngles = var_618_8
			end

			local var_618_9 = arg_615_1.actors_["1028ui_story"]
			local var_618_10 = 0

			if var_618_10 < arg_615_1.time_ and arg_615_1.time_ <= var_618_10 + arg_618_0 and arg_615_1.var_.characterEffect1028ui_story == nil then
				arg_615_1.var_.characterEffect1028ui_story = var_618_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_618_11 = 0.200000002980232

			if var_618_10 <= arg_615_1.time_ and arg_615_1.time_ < var_618_10 + var_618_11 then
				local var_618_12 = (arg_615_1.time_ - var_618_10) / var_618_11

				if arg_615_1.var_.characterEffect1028ui_story then
					arg_615_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_615_1.time_ >= var_618_10 + var_618_11 and arg_615_1.time_ < var_618_10 + var_618_11 + arg_618_0 and arg_615_1.var_.characterEffect1028ui_story then
				arg_615_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_618_13 = 0

			if var_618_13 < arg_615_1.time_ and arg_615_1.time_ <= var_618_13 + arg_618_0 then
				arg_615_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_618_14 = 0
			local var_618_15 = 0.125

			if var_618_14 < arg_615_1.time_ and arg_615_1.time_ <= var_618_14 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_16 = arg_615_1:FormatText(StoryNameCfg[327].name)

				arg_615_1.leftNameTxt_.text = var_618_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_17 = arg_615_1:GetWordFromCfg(1102805149)
				local var_618_18 = arg_615_1:FormatText(var_618_17.content)

				arg_615_1.text_.text = var_618_18

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_19 = 5
				local var_618_20 = utf8.len(var_618_18)
				local var_618_21 = var_618_19 <= 0 and var_618_15 or var_618_15 * (var_618_20 / var_618_19)

				if var_618_21 > 0 and var_618_15 < var_618_21 then
					arg_615_1.talkMaxDuration = var_618_21

					if var_618_21 + var_618_14 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_21 + var_618_14
					end
				end

				arg_615_1.text_.text = var_618_18
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805149", "story_v_side_new_1102805.awb") ~= 0 then
					local var_618_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805149", "story_v_side_new_1102805.awb") / 1000

					if var_618_22 + var_618_14 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_22 + var_618_14
					end

					if var_618_17.prefab_name ~= "" and arg_615_1.actors_[var_618_17.prefab_name] ~= nil then
						local var_618_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_17.prefab_name].transform, "story_v_side_new_1102805", "1102805149", "story_v_side_new_1102805.awb")

						arg_615_1:RecordAudio("1102805149", var_618_23)
						arg_615_1:RecordAudio("1102805149", var_618_23)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805149", "story_v_side_new_1102805.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805149", "story_v_side_new_1102805.awb")
				end

				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_24 = math.max(var_618_15, arg_615_1.talkMaxDuration)

			if var_618_14 <= arg_615_1.time_ and arg_615_1.time_ < var_618_14 + var_618_24 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_14) / var_618_24

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_14 + var_618_24 and arg_615_1.time_ < var_618_14 + var_618_24 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805150 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 1102805150
		arg_619_1.duration_ = 5

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play1102805151(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = arg_619_1.actors_["1028ui_story"]
			local var_622_1 = 0

			if var_622_1 < arg_619_1.time_ and arg_619_1.time_ <= var_622_1 + arg_622_0 and arg_619_1.var_.characterEffect1028ui_story == nil then
				arg_619_1.var_.characterEffect1028ui_story = var_622_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_622_2 = 0.200000002980232

			if var_622_1 <= arg_619_1.time_ and arg_619_1.time_ < var_622_1 + var_622_2 then
				local var_622_3 = (arg_619_1.time_ - var_622_1) / var_622_2

				if arg_619_1.var_.characterEffect1028ui_story then
					local var_622_4 = Mathf.Lerp(0, 0.5, var_622_3)

					arg_619_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_619_1.var_.characterEffect1028ui_story.fillRatio = var_622_4
				end
			end

			if arg_619_1.time_ >= var_622_1 + var_622_2 and arg_619_1.time_ < var_622_1 + var_622_2 + arg_622_0 and arg_619_1.var_.characterEffect1028ui_story then
				local var_622_5 = 0.5

				arg_619_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_619_1.var_.characterEffect1028ui_story.fillRatio = var_622_5
			end

			local var_622_6 = 0
			local var_622_7 = 0.35

			if var_622_6 < arg_619_1.time_ and arg_619_1.time_ <= var_622_6 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_8 = arg_619_1:FormatText(StoryNameCfg[7].name)

				arg_619_1.leftNameTxt_.text = var_622_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_9 = arg_619_1:GetWordFromCfg(1102805150)
				local var_622_10 = arg_619_1:FormatText(var_622_9.content)

				arg_619_1.text_.text = var_622_10

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_11 = 14
				local var_622_12 = utf8.len(var_622_10)
				local var_622_13 = var_622_11 <= 0 and var_622_7 or var_622_7 * (var_622_12 / var_622_11)

				if var_622_13 > 0 and var_622_7 < var_622_13 then
					arg_619_1.talkMaxDuration = var_622_13

					if var_622_13 + var_622_6 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_13 + var_622_6
					end
				end

				arg_619_1.text_.text = var_622_10
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)
				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_14 = math.max(var_622_7, arg_619_1.talkMaxDuration)

			if var_622_6 <= arg_619_1.time_ and arg_619_1.time_ < var_622_6 + var_622_14 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_6) / var_622_14

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_6 + var_622_14 and arg_619_1.time_ < var_622_6 + var_622_14 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805151 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 1102805151
		arg_623_1.duration_ = 5.333

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play1102805152(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = arg_623_1.actors_["1028ui_story"].transform
			local var_626_1 = 0

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 then
				arg_623_1.var_.moveOldPos1028ui_story = var_626_0.localPosition
			end

			local var_626_2 = 0.001

			if var_626_1 <= arg_623_1.time_ and arg_623_1.time_ < var_626_1 + var_626_2 then
				local var_626_3 = (arg_623_1.time_ - var_626_1) / var_626_2
				local var_626_4 = Vector3.New(0, -0.9, -5.9)

				var_626_0.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1028ui_story, var_626_4, var_626_3)

				local var_626_5 = manager.ui.mainCamera.transform.position - var_626_0.position

				var_626_0.forward = Vector3.New(var_626_5.x, var_626_5.y, var_626_5.z)

				local var_626_6 = var_626_0.localEulerAngles

				var_626_6.z = 0
				var_626_6.x = 0
				var_626_0.localEulerAngles = var_626_6
			end

			if arg_623_1.time_ >= var_626_1 + var_626_2 and arg_623_1.time_ < var_626_1 + var_626_2 + arg_626_0 then
				var_626_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_626_7 = manager.ui.mainCamera.transform.position - var_626_0.position

				var_626_0.forward = Vector3.New(var_626_7.x, var_626_7.y, var_626_7.z)

				local var_626_8 = var_626_0.localEulerAngles

				var_626_8.z = 0
				var_626_8.x = 0
				var_626_0.localEulerAngles = var_626_8
			end

			local var_626_9 = arg_623_1.actors_["1028ui_story"]
			local var_626_10 = 0

			if var_626_10 < arg_623_1.time_ and arg_623_1.time_ <= var_626_10 + arg_626_0 and arg_623_1.var_.characterEffect1028ui_story == nil then
				arg_623_1.var_.characterEffect1028ui_story = var_626_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_11 = 0.200000002980232

			if var_626_10 <= arg_623_1.time_ and arg_623_1.time_ < var_626_10 + var_626_11 then
				local var_626_12 = (arg_623_1.time_ - var_626_10) / var_626_11

				if arg_623_1.var_.characterEffect1028ui_story then
					arg_623_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_10 + var_626_11 and arg_623_1.time_ < var_626_10 + var_626_11 + arg_626_0 and arg_623_1.var_.characterEffect1028ui_story then
				arg_623_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_626_13 = 0

			if var_626_13 < arg_623_1.time_ and arg_623_1.time_ <= var_626_13 + arg_626_0 then
				arg_623_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_626_14 = 0
			local var_626_15 = 0.425

			if var_626_14 < arg_623_1.time_ and arg_623_1.time_ <= var_626_14 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_16 = arg_623_1:FormatText(StoryNameCfg[327].name)

				arg_623_1.leftNameTxt_.text = var_626_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_17 = arg_623_1:GetWordFromCfg(1102805151)
				local var_626_18 = arg_623_1:FormatText(var_626_17.content)

				arg_623_1.text_.text = var_626_18

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_19 = 17
				local var_626_20 = utf8.len(var_626_18)
				local var_626_21 = var_626_19 <= 0 and var_626_15 or var_626_15 * (var_626_20 / var_626_19)

				if var_626_21 > 0 and var_626_15 < var_626_21 then
					arg_623_1.talkMaxDuration = var_626_21

					if var_626_21 + var_626_14 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_21 + var_626_14
					end
				end

				arg_623_1.text_.text = var_626_18
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805151", "story_v_side_new_1102805.awb") ~= 0 then
					local var_626_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805151", "story_v_side_new_1102805.awb") / 1000

					if var_626_22 + var_626_14 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_22 + var_626_14
					end

					if var_626_17.prefab_name ~= "" and arg_623_1.actors_[var_626_17.prefab_name] ~= nil then
						local var_626_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_17.prefab_name].transform, "story_v_side_new_1102805", "1102805151", "story_v_side_new_1102805.awb")

						arg_623_1:RecordAudio("1102805151", var_626_23)
						arg_623_1:RecordAudio("1102805151", var_626_23)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805151", "story_v_side_new_1102805.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805151", "story_v_side_new_1102805.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_24 = math.max(var_626_15, arg_623_1.talkMaxDuration)

			if var_626_14 <= arg_623_1.time_ and arg_623_1.time_ < var_626_14 + var_626_24 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_14) / var_626_24

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_14 + var_626_24 and arg_623_1.time_ < var_626_14 + var_626_24 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805152 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 1102805152
		arg_627_1.duration_ = 5

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play1102805153(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["1028ui_story"]
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 and arg_627_1.var_.characterEffect1028ui_story == nil then
				arg_627_1.var_.characterEffect1028ui_story = var_630_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_2 = 0.200000002980232

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2

				if arg_627_1.var_.characterEffect1028ui_story then
					local var_630_4 = Mathf.Lerp(0, 0.5, var_630_3)

					arg_627_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_627_1.var_.characterEffect1028ui_story.fillRatio = var_630_4
				end
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 and arg_627_1.var_.characterEffect1028ui_story then
				local var_630_5 = 0.5

				arg_627_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_627_1.var_.characterEffect1028ui_story.fillRatio = var_630_5
			end

			local var_630_6 = 0
			local var_630_7 = 0.325

			if var_630_6 < arg_627_1.time_ and arg_627_1.time_ <= var_630_6 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_8 = arg_627_1:FormatText(StoryNameCfg[7].name)

				arg_627_1.leftNameTxt_.text = var_630_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_9 = arg_627_1:GetWordFromCfg(1102805152)
				local var_630_10 = arg_627_1:FormatText(var_630_9.content)

				arg_627_1.text_.text = var_630_10

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_11 = 13
				local var_630_12 = utf8.len(var_630_10)
				local var_630_13 = var_630_11 <= 0 and var_630_7 or var_630_7 * (var_630_12 / var_630_11)

				if var_630_13 > 0 and var_630_7 < var_630_13 then
					arg_627_1.talkMaxDuration = var_630_13

					if var_630_13 + var_630_6 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_13 + var_630_6
					end
				end

				arg_627_1.text_.text = var_630_10
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)
				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_14 = math.max(var_630_7, arg_627_1.talkMaxDuration)

			if var_630_6 <= arg_627_1.time_ and arg_627_1.time_ < var_630_6 + var_630_14 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_6) / var_630_14

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_6 + var_630_14 and arg_627_1.time_ < var_630_6 + var_630_14 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805153 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 1102805153
		arg_631_1.duration_ = 6.566

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play1102805154(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1028ui_story"].transform
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 then
				arg_631_1.var_.moveOldPos1028ui_story = var_634_0.localPosition
			end

			local var_634_2 = 0.001

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2
				local var_634_4 = Vector3.New(0, -0.9, -5.9)

				var_634_0.localPosition = Vector3.Lerp(arg_631_1.var_.moveOldPos1028ui_story, var_634_4, var_634_3)

				local var_634_5 = manager.ui.mainCamera.transform.position - var_634_0.position

				var_634_0.forward = Vector3.New(var_634_5.x, var_634_5.y, var_634_5.z)

				local var_634_6 = var_634_0.localEulerAngles

				var_634_6.z = 0
				var_634_6.x = 0
				var_634_0.localEulerAngles = var_634_6
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 then
				var_634_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_634_7 = manager.ui.mainCamera.transform.position - var_634_0.position

				var_634_0.forward = Vector3.New(var_634_7.x, var_634_7.y, var_634_7.z)

				local var_634_8 = var_634_0.localEulerAngles

				var_634_8.z = 0
				var_634_8.x = 0
				var_634_0.localEulerAngles = var_634_8
			end

			local var_634_9 = arg_631_1.actors_["1028ui_story"]
			local var_634_10 = 0

			if var_634_10 < arg_631_1.time_ and arg_631_1.time_ <= var_634_10 + arg_634_0 and arg_631_1.var_.characterEffect1028ui_story == nil then
				arg_631_1.var_.characterEffect1028ui_story = var_634_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_11 = 0.200000002980232

			if var_634_10 <= arg_631_1.time_ and arg_631_1.time_ < var_634_10 + var_634_11 then
				local var_634_12 = (arg_631_1.time_ - var_634_10) / var_634_11

				if arg_631_1.var_.characterEffect1028ui_story then
					arg_631_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_631_1.time_ >= var_634_10 + var_634_11 and arg_631_1.time_ < var_634_10 + var_634_11 + arg_634_0 and arg_631_1.var_.characterEffect1028ui_story then
				arg_631_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_634_13 = 0

			if var_634_13 < arg_631_1.time_ and arg_631_1.time_ <= var_634_13 + arg_634_0 then
				arg_631_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_634_14 = 0
			local var_634_15 = 0.7

			if var_634_14 < arg_631_1.time_ and arg_631_1.time_ <= var_634_14 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_16 = arg_631_1:FormatText(StoryNameCfg[327].name)

				arg_631_1.leftNameTxt_.text = var_634_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_17 = arg_631_1:GetWordFromCfg(1102805153)
				local var_634_18 = arg_631_1:FormatText(var_634_17.content)

				arg_631_1.text_.text = var_634_18

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_19 = 28
				local var_634_20 = utf8.len(var_634_18)
				local var_634_21 = var_634_19 <= 0 and var_634_15 or var_634_15 * (var_634_20 / var_634_19)

				if var_634_21 > 0 and var_634_15 < var_634_21 then
					arg_631_1.talkMaxDuration = var_634_21

					if var_634_21 + var_634_14 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_21 + var_634_14
					end
				end

				arg_631_1.text_.text = var_634_18
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805153", "story_v_side_new_1102805.awb") ~= 0 then
					local var_634_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805153", "story_v_side_new_1102805.awb") / 1000

					if var_634_22 + var_634_14 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_22 + var_634_14
					end

					if var_634_17.prefab_name ~= "" and arg_631_1.actors_[var_634_17.prefab_name] ~= nil then
						local var_634_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_17.prefab_name].transform, "story_v_side_new_1102805", "1102805153", "story_v_side_new_1102805.awb")

						arg_631_1:RecordAudio("1102805153", var_634_23)
						arg_631_1:RecordAudio("1102805153", var_634_23)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805153", "story_v_side_new_1102805.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805153", "story_v_side_new_1102805.awb")
				end

				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_24 = math.max(var_634_15, arg_631_1.talkMaxDuration)

			if var_634_14 <= arg_631_1.time_ and arg_631_1.time_ < var_634_14 + var_634_24 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_14) / var_634_24

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_14 + var_634_24 and arg_631_1.time_ < var_634_14 + var_634_24 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805154 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 1102805154
		arg_635_1.duration_ = 5

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play1102805155(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1028ui_story"].transform
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 then
				arg_635_1.var_.moveOldPos1028ui_story = var_638_0.localPosition
			end

			local var_638_2 = 0.001

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2
				local var_638_4 = Vector3.New(0, 100, 0)

				var_638_0.localPosition = Vector3.Lerp(arg_635_1.var_.moveOldPos1028ui_story, var_638_4, var_638_3)

				local var_638_5 = manager.ui.mainCamera.transform.position - var_638_0.position

				var_638_0.forward = Vector3.New(var_638_5.x, var_638_5.y, var_638_5.z)

				local var_638_6 = var_638_0.localEulerAngles

				var_638_6.z = 0
				var_638_6.x = 0
				var_638_0.localEulerAngles = var_638_6
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 then
				var_638_0.localPosition = Vector3.New(0, 100, 0)

				local var_638_7 = manager.ui.mainCamera.transform.position - var_638_0.position

				var_638_0.forward = Vector3.New(var_638_7.x, var_638_7.y, var_638_7.z)

				local var_638_8 = var_638_0.localEulerAngles

				var_638_8.z = 0
				var_638_8.x = 0
				var_638_0.localEulerAngles = var_638_8
			end

			local var_638_9 = arg_635_1.actors_["1028ui_story"]
			local var_638_10 = 0

			if var_638_10 < arg_635_1.time_ and arg_635_1.time_ <= var_638_10 + arg_638_0 and arg_635_1.var_.characterEffect1028ui_story == nil then
				arg_635_1.var_.characterEffect1028ui_story = var_638_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_11 = 0.200000002980232

			if var_638_10 <= arg_635_1.time_ and arg_635_1.time_ < var_638_10 + var_638_11 then
				local var_638_12 = (arg_635_1.time_ - var_638_10) / var_638_11

				if arg_635_1.var_.characterEffect1028ui_story then
					local var_638_13 = Mathf.Lerp(0, 0.5, var_638_12)

					arg_635_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_635_1.var_.characterEffect1028ui_story.fillRatio = var_638_13
				end
			end

			if arg_635_1.time_ >= var_638_10 + var_638_11 and arg_635_1.time_ < var_638_10 + var_638_11 + arg_638_0 and arg_635_1.var_.characterEffect1028ui_story then
				local var_638_14 = 0.5

				arg_635_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_635_1.var_.characterEffect1028ui_story.fillRatio = var_638_14
			end

			local var_638_15 = 0
			local var_638_16 = 0.65

			if var_638_15 < arg_635_1.time_ and arg_635_1.time_ <= var_638_15 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, false)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_17 = arg_635_1:GetWordFromCfg(1102805154)
				local var_638_18 = arg_635_1:FormatText(var_638_17.content)

				arg_635_1.text_.text = var_638_18

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_19 = 26
				local var_638_20 = utf8.len(var_638_18)
				local var_638_21 = var_638_19 <= 0 and var_638_16 or var_638_16 * (var_638_20 / var_638_19)

				if var_638_21 > 0 and var_638_16 < var_638_21 then
					arg_635_1.talkMaxDuration = var_638_21

					if var_638_21 + var_638_15 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_21 + var_638_15
					end
				end

				arg_635_1.text_.text = var_638_18
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)
				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_22 = math.max(var_638_16, arg_635_1.talkMaxDuration)

			if var_638_15 <= arg_635_1.time_ and arg_635_1.time_ < var_638_15 + var_638_22 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_15) / var_638_22

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_15 + var_638_22 and arg_635_1.time_ < var_638_15 + var_638_22 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805155 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 1102805155
		arg_639_1.duration_ = 2.166

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play1102805156(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = arg_639_1.actors_["1028ui_story"].transform
			local var_642_1 = 0

			if var_642_1 < arg_639_1.time_ and arg_639_1.time_ <= var_642_1 + arg_642_0 then
				arg_639_1.var_.moveOldPos1028ui_story = var_642_0.localPosition
			end

			local var_642_2 = 0.001

			if var_642_1 <= arg_639_1.time_ and arg_639_1.time_ < var_642_1 + var_642_2 then
				local var_642_3 = (arg_639_1.time_ - var_642_1) / var_642_2
				local var_642_4 = Vector3.New(0, -0.9, -5.9)

				var_642_0.localPosition = Vector3.Lerp(arg_639_1.var_.moveOldPos1028ui_story, var_642_4, var_642_3)

				local var_642_5 = manager.ui.mainCamera.transform.position - var_642_0.position

				var_642_0.forward = Vector3.New(var_642_5.x, var_642_5.y, var_642_5.z)

				local var_642_6 = var_642_0.localEulerAngles

				var_642_6.z = 0
				var_642_6.x = 0
				var_642_0.localEulerAngles = var_642_6
			end

			if arg_639_1.time_ >= var_642_1 + var_642_2 and arg_639_1.time_ < var_642_1 + var_642_2 + arg_642_0 then
				var_642_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_642_7 = manager.ui.mainCamera.transform.position - var_642_0.position

				var_642_0.forward = Vector3.New(var_642_7.x, var_642_7.y, var_642_7.z)

				local var_642_8 = var_642_0.localEulerAngles

				var_642_8.z = 0
				var_642_8.x = 0
				var_642_0.localEulerAngles = var_642_8
			end

			local var_642_9 = arg_639_1.actors_["1028ui_story"]
			local var_642_10 = 0

			if var_642_10 < arg_639_1.time_ and arg_639_1.time_ <= var_642_10 + arg_642_0 and arg_639_1.var_.characterEffect1028ui_story == nil then
				arg_639_1.var_.characterEffect1028ui_story = var_642_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_11 = 0.200000002980232

			if var_642_10 <= arg_639_1.time_ and arg_639_1.time_ < var_642_10 + var_642_11 then
				local var_642_12 = (arg_639_1.time_ - var_642_10) / var_642_11

				if arg_639_1.var_.characterEffect1028ui_story then
					arg_639_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_639_1.time_ >= var_642_10 + var_642_11 and arg_639_1.time_ < var_642_10 + var_642_11 + arg_642_0 and arg_639_1.var_.characterEffect1028ui_story then
				arg_639_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_642_13 = 0

			if var_642_13 < arg_639_1.time_ and arg_639_1.time_ <= var_642_13 + arg_642_0 then
				arg_639_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_642_14 = 0
			local var_642_15 = 0.325

			if var_642_14 < arg_639_1.time_ and arg_639_1.time_ <= var_642_14 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_16 = arg_639_1:FormatText(StoryNameCfg[327].name)

				arg_639_1.leftNameTxt_.text = var_642_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_17 = arg_639_1:GetWordFromCfg(1102805155)
				local var_642_18 = arg_639_1:FormatText(var_642_17.content)

				arg_639_1.text_.text = var_642_18

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_19 = 13
				local var_642_20 = utf8.len(var_642_18)
				local var_642_21 = var_642_19 <= 0 and var_642_15 or var_642_15 * (var_642_20 / var_642_19)

				if var_642_21 > 0 and var_642_15 < var_642_21 then
					arg_639_1.talkMaxDuration = var_642_21

					if var_642_21 + var_642_14 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_21 + var_642_14
					end
				end

				arg_639_1.text_.text = var_642_18
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805155", "story_v_side_new_1102805.awb") ~= 0 then
					local var_642_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805155", "story_v_side_new_1102805.awb") / 1000

					if var_642_22 + var_642_14 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_22 + var_642_14
					end

					if var_642_17.prefab_name ~= "" and arg_639_1.actors_[var_642_17.prefab_name] ~= nil then
						local var_642_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_639_1.actors_[var_642_17.prefab_name].transform, "story_v_side_new_1102805", "1102805155", "story_v_side_new_1102805.awb")

						arg_639_1:RecordAudio("1102805155", var_642_23)
						arg_639_1:RecordAudio("1102805155", var_642_23)
					else
						arg_639_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805155", "story_v_side_new_1102805.awb")
					end

					arg_639_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805155", "story_v_side_new_1102805.awb")
				end

				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_24 = math.max(var_642_15, arg_639_1.talkMaxDuration)

			if var_642_14 <= arg_639_1.time_ and arg_639_1.time_ < var_642_14 + var_642_24 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_14) / var_642_24

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_14 + var_642_24 and arg_639_1.time_ < var_642_14 + var_642_24 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805156 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 1102805156
		arg_643_1.duration_ = 5

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play1102805157(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["1028ui_story"]
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 and arg_643_1.var_.characterEffect1028ui_story == nil then
				arg_643_1.var_.characterEffect1028ui_story = var_646_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_2 = 0.200000002980232

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2

				if arg_643_1.var_.characterEffect1028ui_story then
					local var_646_4 = Mathf.Lerp(0, 0.5, var_646_3)

					arg_643_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_643_1.var_.characterEffect1028ui_story.fillRatio = var_646_4
				end
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 and arg_643_1.var_.characterEffect1028ui_story then
				local var_646_5 = 0.5

				arg_643_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_643_1.var_.characterEffect1028ui_story.fillRatio = var_646_5
			end

			local var_646_6 = 0
			local var_646_7 = 0.675

			if var_646_6 < arg_643_1.time_ and arg_643_1.time_ <= var_646_6 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_8 = arg_643_1:FormatText(StoryNameCfg[7].name)

				arg_643_1.leftNameTxt_.text = var_646_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_9 = arg_643_1:GetWordFromCfg(1102805156)
				local var_646_10 = arg_643_1:FormatText(var_646_9.content)

				arg_643_1.text_.text = var_646_10

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_11 = 27
				local var_646_12 = utf8.len(var_646_10)
				local var_646_13 = var_646_11 <= 0 and var_646_7 or var_646_7 * (var_646_12 / var_646_11)

				if var_646_13 > 0 and var_646_7 < var_646_13 then
					arg_643_1.talkMaxDuration = var_646_13

					if var_646_13 + var_646_6 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_13 + var_646_6
					end
				end

				arg_643_1.text_.text = var_646_10
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)
				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_14 = math.max(var_646_7, arg_643_1.talkMaxDuration)

			if var_646_6 <= arg_643_1.time_ and arg_643_1.time_ < var_646_6 + var_646_14 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_6) / var_646_14

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_6 + var_646_14 and arg_643_1.time_ < var_646_6 + var_646_14 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805157 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 1102805157
		arg_647_1.duration_ = 4.866

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play1102805158(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = arg_647_1.actors_["1028ui_story"].transform
			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 then
				arg_647_1.var_.moveOldPos1028ui_story = var_650_0.localPosition
			end

			local var_650_2 = 0.001

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_2 then
				local var_650_3 = (arg_647_1.time_ - var_650_1) / var_650_2
				local var_650_4 = Vector3.New(0, -0.9, -5.9)

				var_650_0.localPosition = Vector3.Lerp(arg_647_1.var_.moveOldPos1028ui_story, var_650_4, var_650_3)

				local var_650_5 = manager.ui.mainCamera.transform.position - var_650_0.position

				var_650_0.forward = Vector3.New(var_650_5.x, var_650_5.y, var_650_5.z)

				local var_650_6 = var_650_0.localEulerAngles

				var_650_6.z = 0
				var_650_6.x = 0
				var_650_0.localEulerAngles = var_650_6
			end

			if arg_647_1.time_ >= var_650_1 + var_650_2 and arg_647_1.time_ < var_650_1 + var_650_2 + arg_650_0 then
				var_650_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_650_7 = manager.ui.mainCamera.transform.position - var_650_0.position

				var_650_0.forward = Vector3.New(var_650_7.x, var_650_7.y, var_650_7.z)

				local var_650_8 = var_650_0.localEulerAngles

				var_650_8.z = 0
				var_650_8.x = 0
				var_650_0.localEulerAngles = var_650_8
			end

			local var_650_9 = arg_647_1.actors_["1028ui_story"]
			local var_650_10 = 0

			if var_650_10 < arg_647_1.time_ and arg_647_1.time_ <= var_650_10 + arg_650_0 and arg_647_1.var_.characterEffect1028ui_story == nil then
				arg_647_1.var_.characterEffect1028ui_story = var_650_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_11 = 0.200000002980232

			if var_650_10 <= arg_647_1.time_ and arg_647_1.time_ < var_650_10 + var_650_11 then
				local var_650_12 = (arg_647_1.time_ - var_650_10) / var_650_11

				if arg_647_1.var_.characterEffect1028ui_story then
					arg_647_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_647_1.time_ >= var_650_10 + var_650_11 and arg_647_1.time_ < var_650_10 + var_650_11 + arg_650_0 and arg_647_1.var_.characterEffect1028ui_story then
				arg_647_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_650_13 = 0

			if var_650_13 < arg_647_1.time_ and arg_647_1.time_ <= var_650_13 + arg_650_0 then
				arg_647_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_650_14 = 0

			if var_650_14 < arg_647_1.time_ and arg_647_1.time_ <= var_650_14 + arg_650_0 then
				arg_647_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_650_15 = 0
			local var_650_16 = 0.325

			if var_650_15 < arg_647_1.time_ and arg_647_1.time_ <= var_650_15 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_17 = arg_647_1:FormatText(StoryNameCfg[327].name)

				arg_647_1.leftNameTxt_.text = var_650_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_18 = arg_647_1:GetWordFromCfg(1102805157)
				local var_650_19 = arg_647_1:FormatText(var_650_18.content)

				arg_647_1.text_.text = var_650_19

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_20 = 13
				local var_650_21 = utf8.len(var_650_19)
				local var_650_22 = var_650_20 <= 0 and var_650_16 or var_650_16 * (var_650_21 / var_650_20)

				if var_650_22 > 0 and var_650_16 < var_650_22 then
					arg_647_1.talkMaxDuration = var_650_22

					if var_650_22 + var_650_15 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_22 + var_650_15
					end
				end

				arg_647_1.text_.text = var_650_19
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805157", "story_v_side_new_1102805.awb") ~= 0 then
					local var_650_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805157", "story_v_side_new_1102805.awb") / 1000

					if var_650_23 + var_650_15 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_23 + var_650_15
					end

					if var_650_18.prefab_name ~= "" and arg_647_1.actors_[var_650_18.prefab_name] ~= nil then
						local var_650_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_18.prefab_name].transform, "story_v_side_new_1102805", "1102805157", "story_v_side_new_1102805.awb")

						arg_647_1:RecordAudio("1102805157", var_650_24)
						arg_647_1:RecordAudio("1102805157", var_650_24)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805157", "story_v_side_new_1102805.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805157", "story_v_side_new_1102805.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_25 = math.max(var_650_16, arg_647_1.talkMaxDuration)

			if var_650_15 <= arg_647_1.time_ and arg_647_1.time_ < var_650_15 + var_650_25 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_15) / var_650_25

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_15 + var_650_25 and arg_647_1.time_ < var_650_15 + var_650_25 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805158 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 1102805158
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play1102805159(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = arg_651_1.actors_["1028ui_story"].transform
			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 then
				arg_651_1.var_.moveOldPos1028ui_story = var_654_0.localPosition
			end

			local var_654_2 = 0.001

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_2 then
				local var_654_3 = (arg_651_1.time_ - var_654_1) / var_654_2
				local var_654_4 = Vector3.New(0, 100, 0)

				var_654_0.localPosition = Vector3.Lerp(arg_651_1.var_.moveOldPos1028ui_story, var_654_4, var_654_3)

				local var_654_5 = manager.ui.mainCamera.transform.position - var_654_0.position

				var_654_0.forward = Vector3.New(var_654_5.x, var_654_5.y, var_654_5.z)

				local var_654_6 = var_654_0.localEulerAngles

				var_654_6.z = 0
				var_654_6.x = 0
				var_654_0.localEulerAngles = var_654_6
			end

			if arg_651_1.time_ >= var_654_1 + var_654_2 and arg_651_1.time_ < var_654_1 + var_654_2 + arg_654_0 then
				var_654_0.localPosition = Vector3.New(0, 100, 0)

				local var_654_7 = manager.ui.mainCamera.transform.position - var_654_0.position

				var_654_0.forward = Vector3.New(var_654_7.x, var_654_7.y, var_654_7.z)

				local var_654_8 = var_654_0.localEulerAngles

				var_654_8.z = 0
				var_654_8.x = 0
				var_654_0.localEulerAngles = var_654_8
			end

			local var_654_9 = arg_651_1.actors_["1028ui_story"]
			local var_654_10 = 0

			if var_654_10 < arg_651_1.time_ and arg_651_1.time_ <= var_654_10 + arg_654_0 and arg_651_1.var_.characterEffect1028ui_story == nil then
				arg_651_1.var_.characterEffect1028ui_story = var_654_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_654_11 = 0.200000002980232

			if var_654_10 <= arg_651_1.time_ and arg_651_1.time_ < var_654_10 + var_654_11 then
				local var_654_12 = (arg_651_1.time_ - var_654_10) / var_654_11

				if arg_651_1.var_.characterEffect1028ui_story then
					local var_654_13 = Mathf.Lerp(0, 0.5, var_654_12)

					arg_651_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_651_1.var_.characterEffect1028ui_story.fillRatio = var_654_13
				end
			end

			if arg_651_1.time_ >= var_654_10 + var_654_11 and arg_651_1.time_ < var_654_10 + var_654_11 + arg_654_0 and arg_651_1.var_.characterEffect1028ui_story then
				local var_654_14 = 0.5

				arg_651_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_651_1.var_.characterEffect1028ui_story.fillRatio = var_654_14
			end

			local var_654_15 = 0
			local var_654_16 = 0.375

			if var_654_15 < arg_651_1.time_ and arg_651_1.time_ <= var_654_15 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, false)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_17 = arg_651_1:GetWordFromCfg(1102805158)
				local var_654_18 = arg_651_1:FormatText(var_654_17.content)

				arg_651_1.text_.text = var_654_18

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_19 = 15
				local var_654_20 = utf8.len(var_654_18)
				local var_654_21 = var_654_19 <= 0 and var_654_16 or var_654_16 * (var_654_20 / var_654_19)

				if var_654_21 > 0 and var_654_16 < var_654_21 then
					arg_651_1.talkMaxDuration = var_654_21

					if var_654_21 + var_654_15 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_21 + var_654_15
					end
				end

				arg_651_1.text_.text = var_654_18
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_22 = math.max(var_654_16, arg_651_1.talkMaxDuration)

			if var_654_15 <= arg_651_1.time_ and arg_651_1.time_ < var_654_15 + var_654_22 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_15) / var_654_22

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_15 + var_654_22 and arg_651_1.time_ < var_654_15 + var_654_22 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805159 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 1102805159
		arg_655_1.duration_ = 9

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play1102805160(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = "A05"

			if arg_655_1.bgs_[var_658_0] == nil then
				local var_658_1 = Object.Instantiate(arg_655_1.paintGo_)

				var_658_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_658_0)
				var_658_1.name = var_658_0
				var_658_1.transform.parent = arg_655_1.stage_.transform
				var_658_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_655_1.bgs_[var_658_0] = var_658_1
			end

			local var_658_2 = 2

			if var_658_2 < arg_655_1.time_ and arg_655_1.time_ <= var_658_2 + arg_658_0 then
				local var_658_3 = manager.ui.mainCamera.transform.localPosition
				local var_658_4 = Vector3.New(0, 0, 10) + Vector3.New(var_658_3.x, var_658_3.y, 0)
				local var_658_5 = arg_655_1.bgs_.A05

				var_658_5.transform.localPosition = var_658_4
				var_658_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_658_6 = var_658_5:GetComponent("SpriteRenderer")

				if var_658_6 and var_658_6.sprite then
					local var_658_7 = (var_658_5.transform.localPosition - var_658_3).z
					local var_658_8 = manager.ui.mainCameraCom_
					local var_658_9 = 2 * var_658_7 * Mathf.Tan(var_658_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_658_10 = var_658_9 * var_658_8.aspect
					local var_658_11 = var_658_6.sprite.bounds.size.x
					local var_658_12 = var_658_6.sprite.bounds.size.y
					local var_658_13 = var_658_10 / var_658_11
					local var_658_14 = var_658_9 / var_658_12
					local var_658_15 = var_658_14 < var_658_13 and var_658_13 or var_658_14

					var_658_5.transform.localScale = Vector3.New(var_658_15, var_658_15, 0)
				end

				for iter_658_0, iter_658_1 in pairs(arg_655_1.bgs_) do
					if iter_658_0 ~= "A05" then
						iter_658_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_658_16 = 0

			if var_658_16 < arg_655_1.time_ and arg_655_1.time_ <= var_658_16 + arg_658_0 then
				arg_655_1.mask_.enabled = true
				arg_655_1.mask_.raycastTarget = true

				arg_655_1:SetGaussion(false)
			end

			local var_658_17 = 2

			if var_658_16 <= arg_655_1.time_ and arg_655_1.time_ < var_658_16 + var_658_17 then
				local var_658_18 = (arg_655_1.time_ - var_658_16) / var_658_17
				local var_658_19 = Color.New(0, 0, 0)

				var_658_19.a = Mathf.Lerp(0, 1, var_658_18)
				arg_655_1.mask_.color = var_658_19
			end

			if arg_655_1.time_ >= var_658_16 + var_658_17 and arg_655_1.time_ < var_658_16 + var_658_17 + arg_658_0 then
				local var_658_20 = Color.New(0, 0, 0)

				var_658_20.a = 1
				arg_655_1.mask_.color = var_658_20
			end

			local var_658_21 = 2

			if var_658_21 < arg_655_1.time_ and arg_655_1.time_ <= var_658_21 + arg_658_0 then
				arg_655_1.mask_.enabled = true
				arg_655_1.mask_.raycastTarget = true

				arg_655_1:SetGaussion(false)
			end

			local var_658_22 = 2

			if var_658_21 <= arg_655_1.time_ and arg_655_1.time_ < var_658_21 + var_658_22 then
				local var_658_23 = (arg_655_1.time_ - var_658_21) / var_658_22
				local var_658_24 = Color.New(0, 0, 0)

				var_658_24.a = Mathf.Lerp(1, 0, var_658_23)
				arg_655_1.mask_.color = var_658_24
			end

			if arg_655_1.time_ >= var_658_21 + var_658_22 and arg_655_1.time_ < var_658_21 + var_658_22 + arg_658_0 then
				local var_658_25 = Color.New(0, 0, 0)
				local var_658_26 = 0

				arg_655_1.mask_.enabled = false
				var_658_25.a = var_658_26
				arg_655_1.mask_.color = var_658_25
			end

			if arg_655_1.frameCnt_ <= 1 then
				arg_655_1.dialog_:SetActive(false)
			end

			local var_658_27 = 4
			local var_658_28 = 1.725

			if var_658_27 < arg_655_1.time_ and arg_655_1.time_ <= var_658_27 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0

				arg_655_1.dialog_:SetActive(true)

				local var_658_29 = LeanTween.value(arg_655_1.dialog_, 0, 1, 0.3)

				var_658_29:setOnUpdate(LuaHelper.FloatAction(function(arg_659_0)
					arg_655_1.dialogCg_.alpha = arg_659_0
				end))
				var_658_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_655_1.dialog_)
					var_658_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_655_1.duration_ = arg_655_1.duration_ + 0.3

				SetActive(arg_655_1.leftNameGo_, false)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_30 = arg_655_1:GetWordFromCfg(1102805159)
				local var_658_31 = arg_655_1:FormatText(var_658_30.content)

				arg_655_1.text_.text = var_658_31

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_32 = 69
				local var_658_33 = utf8.len(var_658_31)
				local var_658_34 = var_658_32 <= 0 and var_658_28 or var_658_28 * (var_658_33 / var_658_32)

				if var_658_34 > 0 and var_658_28 < var_658_34 then
					arg_655_1.talkMaxDuration = var_658_34
					var_658_27 = var_658_27 + 0.3

					if var_658_34 + var_658_27 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_34 + var_658_27
					end
				end

				arg_655_1.text_.text = var_658_31
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)
				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_35 = var_658_27 + 0.3
			local var_658_36 = math.max(var_658_28, arg_655_1.talkMaxDuration)

			if var_658_35 <= arg_655_1.time_ and arg_655_1.time_ < var_658_35 + var_658_36 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_35) / var_658_36

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_35 + var_658_36 and arg_655_1.time_ < var_658_35 + var_658_36 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805160 = function(arg_661_0, arg_661_1)
		arg_661_1.time_ = 0
		arg_661_1.frameCnt_ = 0
		arg_661_1.state_ = "playing"
		arg_661_1.curTalkId_ = 1102805160
		arg_661_1.duration_ = 5

		SetActive(arg_661_1.tipsGo_, false)

		function arg_661_1.onSingleLineFinish_()
			arg_661_1.onSingleLineUpdate_ = nil
			arg_661_1.onSingleLineFinish_ = nil
			arg_661_1.state_ = "waiting"
		end

		function arg_661_1.playNext_(arg_663_0)
			if arg_663_0 == 1 then
				arg_661_0:Play1102805161(arg_661_1)
			end
		end

		function arg_661_1.onSingleLineUpdate_(arg_664_0)
			local var_664_0 = 0
			local var_664_1 = 1.175

			if var_664_0 < arg_661_1.time_ and arg_661_1.time_ <= var_664_0 + arg_664_0 then
				arg_661_1.talkMaxDuration = 0
				arg_661_1.dialogCg_.alpha = 1

				arg_661_1.dialog_:SetActive(true)
				SetActive(arg_661_1.leftNameGo_, false)

				arg_661_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_661_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_661_1:RecordName(arg_661_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_661_1.iconTrs_.gameObject, false)
				arg_661_1.callingController_:SetSelectedState("normal")

				local var_664_2 = arg_661_1:GetWordFromCfg(1102805160)
				local var_664_3 = arg_661_1:FormatText(var_664_2.content)

				arg_661_1.text_.text = var_664_3

				LuaForUtil.ClearLinePrefixSymbol(arg_661_1.text_)

				local var_664_4 = 47
				local var_664_5 = utf8.len(var_664_3)
				local var_664_6 = var_664_4 <= 0 and var_664_1 or var_664_1 * (var_664_5 / var_664_4)

				if var_664_6 > 0 and var_664_1 < var_664_6 then
					arg_661_1.talkMaxDuration = var_664_6

					if var_664_6 + var_664_0 > arg_661_1.duration_ then
						arg_661_1.duration_ = var_664_6 + var_664_0
					end
				end

				arg_661_1.text_.text = var_664_3
				arg_661_1.typewritter.percent = 0

				arg_661_1.typewritter:SetDirty()
				arg_661_1:ShowNextGo(false)
				arg_661_1:RecordContent(arg_661_1.text_.text)
			end

			local var_664_7 = math.max(var_664_1, arg_661_1.talkMaxDuration)

			if var_664_0 <= arg_661_1.time_ and arg_661_1.time_ < var_664_0 + var_664_7 then
				arg_661_1.typewritter.percent = (arg_661_1.time_ - var_664_0) / var_664_7

				arg_661_1.typewritter:SetDirty()
			end

			if arg_661_1.time_ >= var_664_0 + var_664_7 and arg_661_1.time_ < var_664_0 + var_664_7 + arg_664_0 then
				arg_661_1.typewritter.percent = 1

				arg_661_1.typewritter:SetDirty()
				arg_661_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805161 = function(arg_665_0, arg_665_1)
		arg_665_1.time_ = 0
		arg_665_1.frameCnt_ = 0
		arg_665_1.state_ = "playing"
		arg_665_1.curTalkId_ = 1102805161
		arg_665_1.duration_ = 1.999999999999

		SetActive(arg_665_1.tipsGo_, false)

		function arg_665_1.onSingleLineFinish_()
			arg_665_1.onSingleLineUpdate_ = nil
			arg_665_1.onSingleLineFinish_ = nil
			arg_665_1.state_ = "waiting"
		end

		function arg_665_1.playNext_(arg_667_0)
			if arg_667_0 == 1 then
				arg_665_0:Play1102805162(arg_665_1)
			end
		end

		function arg_665_1.onSingleLineUpdate_(arg_668_0)
			local var_668_0 = arg_665_1.actors_["1028ui_story"].transform
			local var_668_1 = 0

			if var_668_1 < arg_665_1.time_ and arg_665_1.time_ <= var_668_1 + arg_668_0 then
				arg_665_1.var_.moveOldPos1028ui_story = var_668_0.localPosition
			end

			local var_668_2 = 0.001

			if var_668_1 <= arg_665_1.time_ and arg_665_1.time_ < var_668_1 + var_668_2 then
				local var_668_3 = (arg_665_1.time_ - var_668_1) / var_668_2
				local var_668_4 = Vector3.New(0, -0.9, -5.9)

				var_668_0.localPosition = Vector3.Lerp(arg_665_1.var_.moveOldPos1028ui_story, var_668_4, var_668_3)

				local var_668_5 = manager.ui.mainCamera.transform.position - var_668_0.position

				var_668_0.forward = Vector3.New(var_668_5.x, var_668_5.y, var_668_5.z)

				local var_668_6 = var_668_0.localEulerAngles

				var_668_6.z = 0
				var_668_6.x = 0
				var_668_0.localEulerAngles = var_668_6
			end

			if arg_665_1.time_ >= var_668_1 + var_668_2 and arg_665_1.time_ < var_668_1 + var_668_2 + arg_668_0 then
				var_668_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_668_7 = manager.ui.mainCamera.transform.position - var_668_0.position

				var_668_0.forward = Vector3.New(var_668_7.x, var_668_7.y, var_668_7.z)

				local var_668_8 = var_668_0.localEulerAngles

				var_668_8.z = 0
				var_668_8.x = 0
				var_668_0.localEulerAngles = var_668_8
			end

			local var_668_9 = arg_665_1.actors_["1028ui_story"]
			local var_668_10 = 0

			if var_668_10 < arg_665_1.time_ and arg_665_1.time_ <= var_668_10 + arg_668_0 and arg_665_1.var_.characterEffect1028ui_story == nil then
				arg_665_1.var_.characterEffect1028ui_story = var_668_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_668_11 = 0.200000002980232

			if var_668_10 <= arg_665_1.time_ and arg_665_1.time_ < var_668_10 + var_668_11 then
				local var_668_12 = (arg_665_1.time_ - var_668_10) / var_668_11

				if arg_665_1.var_.characterEffect1028ui_story then
					arg_665_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_665_1.time_ >= var_668_10 + var_668_11 and arg_665_1.time_ < var_668_10 + var_668_11 + arg_668_0 and arg_665_1.var_.characterEffect1028ui_story then
				arg_665_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_668_13 = 0

			if var_668_13 < arg_665_1.time_ and arg_665_1.time_ <= var_668_13 + arg_668_0 then
				arg_665_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_668_14 = 0

			if var_668_14 < arg_665_1.time_ and arg_665_1.time_ <= var_668_14 + arg_668_0 then
				arg_665_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_668_15 = 0
			local var_668_16 = 0.175

			if var_668_15 < arg_665_1.time_ and arg_665_1.time_ <= var_668_15 + arg_668_0 then
				arg_665_1.talkMaxDuration = 0
				arg_665_1.dialogCg_.alpha = 1

				arg_665_1.dialog_:SetActive(true)
				SetActive(arg_665_1.leftNameGo_, true)

				local var_668_17 = arg_665_1:FormatText(StoryNameCfg[327].name)

				arg_665_1.leftNameTxt_.text = var_668_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_665_1.leftNameTxt_.transform)

				arg_665_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_665_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_665_1:RecordName(arg_665_1.leftNameTxt_.text)
				SetActive(arg_665_1.iconTrs_.gameObject, false)
				arg_665_1.callingController_:SetSelectedState("normal")

				local var_668_18 = arg_665_1:GetWordFromCfg(1102805161)
				local var_668_19 = arg_665_1:FormatText(var_668_18.content)

				arg_665_1.text_.text = var_668_19

				LuaForUtil.ClearLinePrefixSymbol(arg_665_1.text_)

				local var_668_20 = 7
				local var_668_21 = utf8.len(var_668_19)
				local var_668_22 = var_668_20 <= 0 and var_668_16 or var_668_16 * (var_668_21 / var_668_20)

				if var_668_22 > 0 and var_668_16 < var_668_22 then
					arg_665_1.talkMaxDuration = var_668_22

					if var_668_22 + var_668_15 > arg_665_1.duration_ then
						arg_665_1.duration_ = var_668_22 + var_668_15
					end
				end

				arg_665_1.text_.text = var_668_19
				arg_665_1.typewritter.percent = 0

				arg_665_1.typewritter:SetDirty()
				arg_665_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805161", "story_v_side_new_1102805.awb") ~= 0 then
					local var_668_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805161", "story_v_side_new_1102805.awb") / 1000

					if var_668_23 + var_668_15 > arg_665_1.duration_ then
						arg_665_1.duration_ = var_668_23 + var_668_15
					end

					if var_668_18.prefab_name ~= "" and arg_665_1.actors_[var_668_18.prefab_name] ~= nil then
						local var_668_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_665_1.actors_[var_668_18.prefab_name].transform, "story_v_side_new_1102805", "1102805161", "story_v_side_new_1102805.awb")

						arg_665_1:RecordAudio("1102805161", var_668_24)
						arg_665_1:RecordAudio("1102805161", var_668_24)
					else
						arg_665_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805161", "story_v_side_new_1102805.awb")
					end

					arg_665_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805161", "story_v_side_new_1102805.awb")
				end

				arg_665_1:RecordContent(arg_665_1.text_.text)
			end

			local var_668_25 = math.max(var_668_16, arg_665_1.talkMaxDuration)

			if var_668_15 <= arg_665_1.time_ and arg_665_1.time_ < var_668_15 + var_668_25 then
				arg_665_1.typewritter.percent = (arg_665_1.time_ - var_668_15) / var_668_25

				arg_665_1.typewritter:SetDirty()
			end

			if arg_665_1.time_ >= var_668_15 + var_668_25 and arg_665_1.time_ < var_668_15 + var_668_25 + arg_668_0 then
				arg_665_1.typewritter.percent = 1

				arg_665_1.typewritter:SetDirty()
				arg_665_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805162 = function(arg_669_0, arg_669_1)
		arg_669_1.time_ = 0
		arg_669_1.frameCnt_ = 0
		arg_669_1.state_ = "playing"
		arg_669_1.curTalkId_ = 1102805162
		arg_669_1.duration_ = 5

		SetActive(arg_669_1.tipsGo_, false)

		function arg_669_1.onSingleLineFinish_()
			arg_669_1.onSingleLineUpdate_ = nil
			arg_669_1.onSingleLineFinish_ = nil
			arg_669_1.state_ = "waiting"
		end

		function arg_669_1.playNext_(arg_671_0)
			if arg_671_0 == 1 then
				arg_669_0:Play1102805163(arg_669_1)
			end
		end

		function arg_669_1.onSingleLineUpdate_(arg_672_0)
			local var_672_0 = arg_669_1.actors_["1028ui_story"]
			local var_672_1 = 0

			if var_672_1 < arg_669_1.time_ and arg_669_1.time_ <= var_672_1 + arg_672_0 and arg_669_1.var_.characterEffect1028ui_story == nil then
				arg_669_1.var_.characterEffect1028ui_story = var_672_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_672_2 = 0.200000002980232

			if var_672_1 <= arg_669_1.time_ and arg_669_1.time_ < var_672_1 + var_672_2 then
				local var_672_3 = (arg_669_1.time_ - var_672_1) / var_672_2

				if arg_669_1.var_.characterEffect1028ui_story then
					local var_672_4 = Mathf.Lerp(0, 0.5, var_672_3)

					arg_669_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_669_1.var_.characterEffect1028ui_story.fillRatio = var_672_4
				end
			end

			if arg_669_1.time_ >= var_672_1 + var_672_2 and arg_669_1.time_ < var_672_1 + var_672_2 + arg_672_0 and arg_669_1.var_.characterEffect1028ui_story then
				local var_672_5 = 0.5

				arg_669_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_669_1.var_.characterEffect1028ui_story.fillRatio = var_672_5
			end

			local var_672_6 = 0
			local var_672_7 = 0.675

			if var_672_6 < arg_669_1.time_ and arg_669_1.time_ <= var_672_6 + arg_672_0 then
				arg_669_1.talkMaxDuration = 0
				arg_669_1.dialogCg_.alpha = 1

				arg_669_1.dialog_:SetActive(true)
				SetActive(arg_669_1.leftNameGo_, true)

				local var_672_8 = arg_669_1:FormatText(StoryNameCfg[7].name)

				arg_669_1.leftNameTxt_.text = var_672_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_669_1.leftNameTxt_.transform)

				arg_669_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_669_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_669_1:RecordName(arg_669_1.leftNameTxt_.text)
				SetActive(arg_669_1.iconTrs_.gameObject, false)
				arg_669_1.callingController_:SetSelectedState("normal")

				local var_672_9 = arg_669_1:GetWordFromCfg(1102805162)
				local var_672_10 = arg_669_1:FormatText(var_672_9.content)

				arg_669_1.text_.text = var_672_10

				LuaForUtil.ClearLinePrefixSymbol(arg_669_1.text_)

				local var_672_11 = 27
				local var_672_12 = utf8.len(var_672_10)
				local var_672_13 = var_672_11 <= 0 and var_672_7 or var_672_7 * (var_672_12 / var_672_11)

				if var_672_13 > 0 and var_672_7 < var_672_13 then
					arg_669_1.talkMaxDuration = var_672_13

					if var_672_13 + var_672_6 > arg_669_1.duration_ then
						arg_669_1.duration_ = var_672_13 + var_672_6
					end
				end

				arg_669_1.text_.text = var_672_10
				arg_669_1.typewritter.percent = 0

				arg_669_1.typewritter:SetDirty()
				arg_669_1:ShowNextGo(false)
				arg_669_1:RecordContent(arg_669_1.text_.text)
			end

			local var_672_14 = math.max(var_672_7, arg_669_1.talkMaxDuration)

			if var_672_6 <= arg_669_1.time_ and arg_669_1.time_ < var_672_6 + var_672_14 then
				arg_669_1.typewritter.percent = (arg_669_1.time_ - var_672_6) / var_672_14

				arg_669_1.typewritter:SetDirty()
			end

			if arg_669_1.time_ >= var_672_6 + var_672_14 and arg_669_1.time_ < var_672_6 + var_672_14 + arg_672_0 then
				arg_669_1.typewritter.percent = 1

				arg_669_1.typewritter:SetDirty()
				arg_669_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805163 = function(arg_673_0, arg_673_1)
		arg_673_1.time_ = 0
		arg_673_1.frameCnt_ = 0
		arg_673_1.state_ = "playing"
		arg_673_1.curTalkId_ = 1102805163
		arg_673_1.duration_ = 2.466

		SetActive(arg_673_1.tipsGo_, false)

		function arg_673_1.onSingleLineFinish_()
			arg_673_1.onSingleLineUpdate_ = nil
			arg_673_1.onSingleLineFinish_ = nil
			arg_673_1.state_ = "waiting"
		end

		function arg_673_1.playNext_(arg_675_0)
			if arg_675_0 == 1 then
				arg_673_0:Play1102805164(arg_673_1)
			end
		end

		function arg_673_1.onSingleLineUpdate_(arg_676_0)
			local var_676_0 = arg_673_1.actors_["1028ui_story"].transform
			local var_676_1 = 0

			if var_676_1 < arg_673_1.time_ and arg_673_1.time_ <= var_676_1 + arg_676_0 then
				arg_673_1.var_.moveOldPos1028ui_story = var_676_0.localPosition
			end

			local var_676_2 = 0.001

			if var_676_1 <= arg_673_1.time_ and arg_673_1.time_ < var_676_1 + var_676_2 then
				local var_676_3 = (arg_673_1.time_ - var_676_1) / var_676_2
				local var_676_4 = Vector3.New(0, -0.9, -5.9)

				var_676_0.localPosition = Vector3.Lerp(arg_673_1.var_.moveOldPos1028ui_story, var_676_4, var_676_3)

				local var_676_5 = manager.ui.mainCamera.transform.position - var_676_0.position

				var_676_0.forward = Vector3.New(var_676_5.x, var_676_5.y, var_676_5.z)

				local var_676_6 = var_676_0.localEulerAngles

				var_676_6.z = 0
				var_676_6.x = 0
				var_676_0.localEulerAngles = var_676_6
			end

			if arg_673_1.time_ >= var_676_1 + var_676_2 and arg_673_1.time_ < var_676_1 + var_676_2 + arg_676_0 then
				var_676_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_676_7 = manager.ui.mainCamera.transform.position - var_676_0.position

				var_676_0.forward = Vector3.New(var_676_7.x, var_676_7.y, var_676_7.z)

				local var_676_8 = var_676_0.localEulerAngles

				var_676_8.z = 0
				var_676_8.x = 0
				var_676_0.localEulerAngles = var_676_8
			end

			local var_676_9 = arg_673_1.actors_["1028ui_story"]
			local var_676_10 = 0

			if var_676_10 < arg_673_1.time_ and arg_673_1.time_ <= var_676_10 + arg_676_0 and arg_673_1.var_.characterEffect1028ui_story == nil then
				arg_673_1.var_.characterEffect1028ui_story = var_676_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_676_11 = 0.200000002980232

			if var_676_10 <= arg_673_1.time_ and arg_673_1.time_ < var_676_10 + var_676_11 then
				local var_676_12 = (arg_673_1.time_ - var_676_10) / var_676_11

				if arg_673_1.var_.characterEffect1028ui_story then
					arg_673_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_673_1.time_ >= var_676_10 + var_676_11 and arg_673_1.time_ < var_676_10 + var_676_11 + arg_676_0 and arg_673_1.var_.characterEffect1028ui_story then
				arg_673_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_676_13 = 0

			if var_676_13 < arg_673_1.time_ and arg_673_1.time_ <= var_676_13 + arg_676_0 then
				arg_673_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_676_14 = 0
			local var_676_15 = 0.275

			if var_676_14 < arg_673_1.time_ and arg_673_1.time_ <= var_676_14 + arg_676_0 then
				arg_673_1.talkMaxDuration = 0
				arg_673_1.dialogCg_.alpha = 1

				arg_673_1.dialog_:SetActive(true)
				SetActive(arg_673_1.leftNameGo_, true)

				local var_676_16 = arg_673_1:FormatText(StoryNameCfg[327].name)

				arg_673_1.leftNameTxt_.text = var_676_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_673_1.leftNameTxt_.transform)

				arg_673_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_673_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_673_1:RecordName(arg_673_1.leftNameTxt_.text)
				SetActive(arg_673_1.iconTrs_.gameObject, false)
				arg_673_1.callingController_:SetSelectedState("normal")

				local var_676_17 = arg_673_1:GetWordFromCfg(1102805163)
				local var_676_18 = arg_673_1:FormatText(var_676_17.content)

				arg_673_1.text_.text = var_676_18

				LuaForUtil.ClearLinePrefixSymbol(arg_673_1.text_)

				local var_676_19 = 11
				local var_676_20 = utf8.len(var_676_18)
				local var_676_21 = var_676_19 <= 0 and var_676_15 or var_676_15 * (var_676_20 / var_676_19)

				if var_676_21 > 0 and var_676_15 < var_676_21 then
					arg_673_1.talkMaxDuration = var_676_21

					if var_676_21 + var_676_14 > arg_673_1.duration_ then
						arg_673_1.duration_ = var_676_21 + var_676_14
					end
				end

				arg_673_1.text_.text = var_676_18
				arg_673_1.typewritter.percent = 0

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805163", "story_v_side_new_1102805.awb") ~= 0 then
					local var_676_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805163", "story_v_side_new_1102805.awb") / 1000

					if var_676_22 + var_676_14 > arg_673_1.duration_ then
						arg_673_1.duration_ = var_676_22 + var_676_14
					end

					if var_676_17.prefab_name ~= "" and arg_673_1.actors_[var_676_17.prefab_name] ~= nil then
						local var_676_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_673_1.actors_[var_676_17.prefab_name].transform, "story_v_side_new_1102805", "1102805163", "story_v_side_new_1102805.awb")

						arg_673_1:RecordAudio("1102805163", var_676_23)
						arg_673_1:RecordAudio("1102805163", var_676_23)
					else
						arg_673_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805163", "story_v_side_new_1102805.awb")
					end

					arg_673_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805163", "story_v_side_new_1102805.awb")
				end

				arg_673_1:RecordContent(arg_673_1.text_.text)
			end

			local var_676_24 = math.max(var_676_15, arg_673_1.talkMaxDuration)

			if var_676_14 <= arg_673_1.time_ and arg_673_1.time_ < var_676_14 + var_676_24 then
				arg_673_1.typewritter.percent = (arg_673_1.time_ - var_676_14) / var_676_24

				arg_673_1.typewritter:SetDirty()
			end

			if arg_673_1.time_ >= var_676_14 + var_676_24 and arg_673_1.time_ < var_676_14 + var_676_24 + arg_676_0 then
				arg_673_1.typewritter.percent = 1

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805164 = function(arg_677_0, arg_677_1)
		arg_677_1.time_ = 0
		arg_677_1.frameCnt_ = 0
		arg_677_1.state_ = "playing"
		arg_677_1.curTalkId_ = 1102805164
		arg_677_1.duration_ = 5

		SetActive(arg_677_1.tipsGo_, false)

		function arg_677_1.onSingleLineFinish_()
			arg_677_1.onSingleLineUpdate_ = nil
			arg_677_1.onSingleLineFinish_ = nil
			arg_677_1.state_ = "waiting"
		end

		function arg_677_1.playNext_(arg_679_0)
			if arg_679_0 == 1 then
				arg_677_0:Play1102805165(arg_677_1)
			end
		end

		function arg_677_1.onSingleLineUpdate_(arg_680_0)
			local var_680_0 = arg_677_1.actors_["1028ui_story"]
			local var_680_1 = 0

			if var_680_1 < arg_677_1.time_ and arg_677_1.time_ <= var_680_1 + arg_680_0 and arg_677_1.var_.characterEffect1028ui_story == nil then
				arg_677_1.var_.characterEffect1028ui_story = var_680_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_680_2 = 0.200000002980232

			if var_680_1 <= arg_677_1.time_ and arg_677_1.time_ < var_680_1 + var_680_2 then
				local var_680_3 = (arg_677_1.time_ - var_680_1) / var_680_2

				if arg_677_1.var_.characterEffect1028ui_story then
					local var_680_4 = Mathf.Lerp(0, 0.5, var_680_3)

					arg_677_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_677_1.var_.characterEffect1028ui_story.fillRatio = var_680_4
				end
			end

			if arg_677_1.time_ >= var_680_1 + var_680_2 and arg_677_1.time_ < var_680_1 + var_680_2 + arg_680_0 and arg_677_1.var_.characterEffect1028ui_story then
				local var_680_5 = 0.5

				arg_677_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_677_1.var_.characterEffect1028ui_story.fillRatio = var_680_5
			end

			local var_680_6 = 0
			local var_680_7 = 0.6

			if var_680_6 < arg_677_1.time_ and arg_677_1.time_ <= var_680_6 + arg_680_0 then
				arg_677_1.talkMaxDuration = 0
				arg_677_1.dialogCg_.alpha = 1

				arg_677_1.dialog_:SetActive(true)
				SetActive(arg_677_1.leftNameGo_, true)

				local var_680_8 = arg_677_1:FormatText(StoryNameCfg[7].name)

				arg_677_1.leftNameTxt_.text = var_680_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_677_1.leftNameTxt_.transform)

				arg_677_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_677_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_677_1:RecordName(arg_677_1.leftNameTxt_.text)
				SetActive(arg_677_1.iconTrs_.gameObject, false)
				arg_677_1.callingController_:SetSelectedState("normal")

				local var_680_9 = arg_677_1:GetWordFromCfg(1102805164)
				local var_680_10 = arg_677_1:FormatText(var_680_9.content)

				arg_677_1.text_.text = var_680_10

				LuaForUtil.ClearLinePrefixSymbol(arg_677_1.text_)

				local var_680_11 = 24
				local var_680_12 = utf8.len(var_680_10)
				local var_680_13 = var_680_11 <= 0 and var_680_7 or var_680_7 * (var_680_12 / var_680_11)

				if var_680_13 > 0 and var_680_7 < var_680_13 then
					arg_677_1.talkMaxDuration = var_680_13

					if var_680_13 + var_680_6 > arg_677_1.duration_ then
						arg_677_1.duration_ = var_680_13 + var_680_6
					end
				end

				arg_677_1.text_.text = var_680_10
				arg_677_1.typewritter.percent = 0

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(false)
				arg_677_1:RecordContent(arg_677_1.text_.text)
			end

			local var_680_14 = math.max(var_680_7, arg_677_1.talkMaxDuration)

			if var_680_6 <= arg_677_1.time_ and arg_677_1.time_ < var_680_6 + var_680_14 then
				arg_677_1.typewritter.percent = (arg_677_1.time_ - var_680_6) / var_680_14

				arg_677_1.typewritter:SetDirty()
			end

			if arg_677_1.time_ >= var_680_6 + var_680_14 and arg_677_1.time_ < var_680_6 + var_680_14 + arg_680_0 then
				arg_677_1.typewritter.percent = 1

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805165 = function(arg_681_0, arg_681_1)
		arg_681_1.time_ = 0
		arg_681_1.frameCnt_ = 0
		arg_681_1.state_ = "playing"
		arg_681_1.curTalkId_ = 1102805165
		arg_681_1.duration_ = 4.533

		SetActive(arg_681_1.tipsGo_, false)

		function arg_681_1.onSingleLineFinish_()
			arg_681_1.onSingleLineUpdate_ = nil
			arg_681_1.onSingleLineFinish_ = nil
			arg_681_1.state_ = "waiting"
		end

		function arg_681_1.playNext_(arg_683_0)
			if arg_683_0 == 1 then
				arg_681_0:Play1102805166(arg_681_1)
			end
		end

		function arg_681_1.onSingleLineUpdate_(arg_684_0)
			local var_684_0 = arg_681_1.actors_["1028ui_story"].transform
			local var_684_1 = 0

			if var_684_1 < arg_681_1.time_ and arg_681_1.time_ <= var_684_1 + arg_684_0 then
				arg_681_1.var_.moveOldPos1028ui_story = var_684_0.localPosition
			end

			local var_684_2 = 0.001

			if var_684_1 <= arg_681_1.time_ and arg_681_1.time_ < var_684_1 + var_684_2 then
				local var_684_3 = (arg_681_1.time_ - var_684_1) / var_684_2
				local var_684_4 = Vector3.New(0, -0.9, -5.9)

				var_684_0.localPosition = Vector3.Lerp(arg_681_1.var_.moveOldPos1028ui_story, var_684_4, var_684_3)

				local var_684_5 = manager.ui.mainCamera.transform.position - var_684_0.position

				var_684_0.forward = Vector3.New(var_684_5.x, var_684_5.y, var_684_5.z)

				local var_684_6 = var_684_0.localEulerAngles

				var_684_6.z = 0
				var_684_6.x = 0
				var_684_0.localEulerAngles = var_684_6
			end

			if arg_681_1.time_ >= var_684_1 + var_684_2 and arg_681_1.time_ < var_684_1 + var_684_2 + arg_684_0 then
				var_684_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_684_7 = manager.ui.mainCamera.transform.position - var_684_0.position

				var_684_0.forward = Vector3.New(var_684_7.x, var_684_7.y, var_684_7.z)

				local var_684_8 = var_684_0.localEulerAngles

				var_684_8.z = 0
				var_684_8.x = 0
				var_684_0.localEulerAngles = var_684_8
			end

			local var_684_9 = arg_681_1.actors_["1028ui_story"]
			local var_684_10 = 0

			if var_684_10 < arg_681_1.time_ and arg_681_1.time_ <= var_684_10 + arg_684_0 and arg_681_1.var_.characterEffect1028ui_story == nil then
				arg_681_1.var_.characterEffect1028ui_story = var_684_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_684_11 = 0.200000002980232

			if var_684_10 <= arg_681_1.time_ and arg_681_1.time_ < var_684_10 + var_684_11 then
				local var_684_12 = (arg_681_1.time_ - var_684_10) / var_684_11

				if arg_681_1.var_.characterEffect1028ui_story then
					arg_681_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_681_1.time_ >= var_684_10 + var_684_11 and arg_681_1.time_ < var_684_10 + var_684_11 + arg_684_0 and arg_681_1.var_.characterEffect1028ui_story then
				arg_681_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_684_13 = 0

			if var_684_13 < arg_681_1.time_ and arg_681_1.time_ <= var_684_13 + arg_684_0 then
				arg_681_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_684_14 = 0
			local var_684_15 = 0.525

			if var_684_14 < arg_681_1.time_ and arg_681_1.time_ <= var_684_14 + arg_684_0 then
				arg_681_1.talkMaxDuration = 0
				arg_681_1.dialogCg_.alpha = 1

				arg_681_1.dialog_:SetActive(true)
				SetActive(arg_681_1.leftNameGo_, true)

				local var_684_16 = arg_681_1:FormatText(StoryNameCfg[327].name)

				arg_681_1.leftNameTxt_.text = var_684_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_681_1.leftNameTxt_.transform)

				arg_681_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_681_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_681_1:RecordName(arg_681_1.leftNameTxt_.text)
				SetActive(arg_681_1.iconTrs_.gameObject, false)
				arg_681_1.callingController_:SetSelectedState("normal")

				local var_684_17 = arg_681_1:GetWordFromCfg(1102805165)
				local var_684_18 = arg_681_1:FormatText(var_684_17.content)

				arg_681_1.text_.text = var_684_18

				LuaForUtil.ClearLinePrefixSymbol(arg_681_1.text_)

				local var_684_19 = 21
				local var_684_20 = utf8.len(var_684_18)
				local var_684_21 = var_684_19 <= 0 and var_684_15 or var_684_15 * (var_684_20 / var_684_19)

				if var_684_21 > 0 and var_684_15 < var_684_21 then
					arg_681_1.talkMaxDuration = var_684_21

					if var_684_21 + var_684_14 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_21 + var_684_14
					end
				end

				arg_681_1.text_.text = var_684_18
				arg_681_1.typewritter.percent = 0

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805165", "story_v_side_new_1102805.awb") ~= 0 then
					local var_684_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805165", "story_v_side_new_1102805.awb") / 1000

					if var_684_22 + var_684_14 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_22 + var_684_14
					end

					if var_684_17.prefab_name ~= "" and arg_681_1.actors_[var_684_17.prefab_name] ~= nil then
						local var_684_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_681_1.actors_[var_684_17.prefab_name].transform, "story_v_side_new_1102805", "1102805165", "story_v_side_new_1102805.awb")

						arg_681_1:RecordAudio("1102805165", var_684_23)
						arg_681_1:RecordAudio("1102805165", var_684_23)
					else
						arg_681_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805165", "story_v_side_new_1102805.awb")
					end

					arg_681_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805165", "story_v_side_new_1102805.awb")
				end

				arg_681_1:RecordContent(arg_681_1.text_.text)
			end

			local var_684_24 = math.max(var_684_15, arg_681_1.talkMaxDuration)

			if var_684_14 <= arg_681_1.time_ and arg_681_1.time_ < var_684_14 + var_684_24 then
				arg_681_1.typewritter.percent = (arg_681_1.time_ - var_684_14) / var_684_24

				arg_681_1.typewritter:SetDirty()
			end

			if arg_681_1.time_ >= var_684_14 + var_684_24 and arg_681_1.time_ < var_684_14 + var_684_24 + arg_684_0 then
				arg_681_1.typewritter.percent = 1

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805166 = function(arg_685_0, arg_685_1)
		arg_685_1.time_ = 0
		arg_685_1.frameCnt_ = 0
		arg_685_1.state_ = "playing"
		arg_685_1.curTalkId_ = 1102805166
		arg_685_1.duration_ = 5

		SetActive(arg_685_1.tipsGo_, false)

		function arg_685_1.onSingleLineFinish_()
			arg_685_1.onSingleLineUpdate_ = nil
			arg_685_1.onSingleLineFinish_ = nil
			arg_685_1.state_ = "waiting"
		end

		function arg_685_1.playNext_(arg_687_0)
			if arg_687_0 == 1 then
				arg_685_0:Play1102805167(arg_685_1)
			end
		end

		function arg_685_1.onSingleLineUpdate_(arg_688_0)
			local var_688_0 = arg_685_1.actors_["1028ui_story"]
			local var_688_1 = 0

			if var_688_1 < arg_685_1.time_ and arg_685_1.time_ <= var_688_1 + arg_688_0 and arg_685_1.var_.characterEffect1028ui_story == nil then
				arg_685_1.var_.characterEffect1028ui_story = var_688_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_688_2 = 0.200000002980232

			if var_688_1 <= arg_685_1.time_ and arg_685_1.time_ < var_688_1 + var_688_2 then
				local var_688_3 = (arg_685_1.time_ - var_688_1) / var_688_2

				if arg_685_1.var_.characterEffect1028ui_story then
					local var_688_4 = Mathf.Lerp(0, 0.5, var_688_3)

					arg_685_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_685_1.var_.characterEffect1028ui_story.fillRatio = var_688_4
				end
			end

			if arg_685_1.time_ >= var_688_1 + var_688_2 and arg_685_1.time_ < var_688_1 + var_688_2 + arg_688_0 and arg_685_1.var_.characterEffect1028ui_story then
				local var_688_5 = 0.5

				arg_685_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_685_1.var_.characterEffect1028ui_story.fillRatio = var_688_5
			end

			local var_688_6 = 0
			local var_688_7 = 0.775

			if var_688_6 < arg_685_1.time_ and arg_685_1.time_ <= var_688_6 + arg_688_0 then
				arg_685_1.talkMaxDuration = 0
				arg_685_1.dialogCg_.alpha = 1

				arg_685_1.dialog_:SetActive(true)
				SetActive(arg_685_1.leftNameGo_, true)

				local var_688_8 = arg_685_1:FormatText(StoryNameCfg[7].name)

				arg_685_1.leftNameTxt_.text = var_688_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_685_1.leftNameTxt_.transform)

				arg_685_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_685_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_685_1:RecordName(arg_685_1.leftNameTxt_.text)
				SetActive(arg_685_1.iconTrs_.gameObject, false)
				arg_685_1.callingController_:SetSelectedState("normal")

				local var_688_9 = arg_685_1:GetWordFromCfg(1102805166)
				local var_688_10 = arg_685_1:FormatText(var_688_9.content)

				arg_685_1.text_.text = var_688_10

				LuaForUtil.ClearLinePrefixSymbol(arg_685_1.text_)

				local var_688_11 = 31
				local var_688_12 = utf8.len(var_688_10)
				local var_688_13 = var_688_11 <= 0 and var_688_7 or var_688_7 * (var_688_12 / var_688_11)

				if var_688_13 > 0 and var_688_7 < var_688_13 then
					arg_685_1.talkMaxDuration = var_688_13

					if var_688_13 + var_688_6 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_13 + var_688_6
					end
				end

				arg_685_1.text_.text = var_688_10
				arg_685_1.typewritter.percent = 0

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(false)
				arg_685_1:RecordContent(arg_685_1.text_.text)
			end

			local var_688_14 = math.max(var_688_7, arg_685_1.talkMaxDuration)

			if var_688_6 <= arg_685_1.time_ and arg_685_1.time_ < var_688_6 + var_688_14 then
				arg_685_1.typewritter.percent = (arg_685_1.time_ - var_688_6) / var_688_14

				arg_685_1.typewritter:SetDirty()
			end

			if arg_685_1.time_ >= var_688_6 + var_688_14 and arg_685_1.time_ < var_688_6 + var_688_14 + arg_688_0 then
				arg_685_1.typewritter.percent = 1

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805167 = function(arg_689_0, arg_689_1)
		arg_689_1.time_ = 0
		arg_689_1.frameCnt_ = 0
		arg_689_1.state_ = "playing"
		arg_689_1.curTalkId_ = 1102805167
		arg_689_1.duration_ = 3.2

		SetActive(arg_689_1.tipsGo_, false)

		function arg_689_1.onSingleLineFinish_()
			arg_689_1.onSingleLineUpdate_ = nil
			arg_689_1.onSingleLineFinish_ = nil
			arg_689_1.state_ = "waiting"
		end

		function arg_689_1.playNext_(arg_691_0)
			if arg_691_0 == 1 then
				arg_689_0:Play1102805168(arg_689_1)
			end
		end

		function arg_689_1.onSingleLineUpdate_(arg_692_0)
			local var_692_0 = arg_689_1.actors_["1028ui_story"].transform
			local var_692_1 = 0

			if var_692_1 < arg_689_1.time_ and arg_689_1.time_ <= var_692_1 + arg_692_0 then
				arg_689_1.var_.moveOldPos1028ui_story = var_692_0.localPosition
			end

			local var_692_2 = 0.001

			if var_692_1 <= arg_689_1.time_ and arg_689_1.time_ < var_692_1 + var_692_2 then
				local var_692_3 = (arg_689_1.time_ - var_692_1) / var_692_2
				local var_692_4 = Vector3.New(0, -0.9, -5.9)

				var_692_0.localPosition = Vector3.Lerp(arg_689_1.var_.moveOldPos1028ui_story, var_692_4, var_692_3)

				local var_692_5 = manager.ui.mainCamera.transform.position - var_692_0.position

				var_692_0.forward = Vector3.New(var_692_5.x, var_692_5.y, var_692_5.z)

				local var_692_6 = var_692_0.localEulerAngles

				var_692_6.z = 0
				var_692_6.x = 0
				var_692_0.localEulerAngles = var_692_6
			end

			if arg_689_1.time_ >= var_692_1 + var_692_2 and arg_689_1.time_ < var_692_1 + var_692_2 + arg_692_0 then
				var_692_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_692_7 = manager.ui.mainCamera.transform.position - var_692_0.position

				var_692_0.forward = Vector3.New(var_692_7.x, var_692_7.y, var_692_7.z)

				local var_692_8 = var_692_0.localEulerAngles

				var_692_8.z = 0
				var_692_8.x = 0
				var_692_0.localEulerAngles = var_692_8
			end

			local var_692_9 = arg_689_1.actors_["1028ui_story"]
			local var_692_10 = 0

			if var_692_10 < arg_689_1.time_ and arg_689_1.time_ <= var_692_10 + arg_692_0 and arg_689_1.var_.characterEffect1028ui_story == nil then
				arg_689_1.var_.characterEffect1028ui_story = var_692_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_692_11 = 0.200000002980232

			if var_692_10 <= arg_689_1.time_ and arg_689_1.time_ < var_692_10 + var_692_11 then
				local var_692_12 = (arg_689_1.time_ - var_692_10) / var_692_11

				if arg_689_1.var_.characterEffect1028ui_story then
					arg_689_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_689_1.time_ >= var_692_10 + var_692_11 and arg_689_1.time_ < var_692_10 + var_692_11 + arg_692_0 and arg_689_1.var_.characterEffect1028ui_story then
				arg_689_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_692_13 = 0

			if var_692_13 < arg_689_1.time_ and arg_689_1.time_ <= var_692_13 + arg_692_0 then
				arg_689_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_692_14 = 0
			local var_692_15 = 0.325

			if var_692_14 < arg_689_1.time_ and arg_689_1.time_ <= var_692_14 + arg_692_0 then
				arg_689_1.talkMaxDuration = 0
				arg_689_1.dialogCg_.alpha = 1

				arg_689_1.dialog_:SetActive(true)
				SetActive(arg_689_1.leftNameGo_, true)

				local var_692_16 = arg_689_1:FormatText(StoryNameCfg[327].name)

				arg_689_1.leftNameTxt_.text = var_692_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_689_1.leftNameTxt_.transform)

				arg_689_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_689_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_689_1:RecordName(arg_689_1.leftNameTxt_.text)
				SetActive(arg_689_1.iconTrs_.gameObject, false)
				arg_689_1.callingController_:SetSelectedState("normal")

				local var_692_17 = arg_689_1:GetWordFromCfg(1102805167)
				local var_692_18 = arg_689_1:FormatText(var_692_17.content)

				arg_689_1.text_.text = var_692_18

				LuaForUtil.ClearLinePrefixSymbol(arg_689_1.text_)

				local var_692_19 = 13
				local var_692_20 = utf8.len(var_692_18)
				local var_692_21 = var_692_19 <= 0 and var_692_15 or var_692_15 * (var_692_20 / var_692_19)

				if var_692_21 > 0 and var_692_15 < var_692_21 then
					arg_689_1.talkMaxDuration = var_692_21

					if var_692_21 + var_692_14 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_21 + var_692_14
					end
				end

				arg_689_1.text_.text = var_692_18
				arg_689_1.typewritter.percent = 0

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805167", "story_v_side_new_1102805.awb") ~= 0 then
					local var_692_22 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805167", "story_v_side_new_1102805.awb") / 1000

					if var_692_22 + var_692_14 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_22 + var_692_14
					end

					if var_692_17.prefab_name ~= "" and arg_689_1.actors_[var_692_17.prefab_name] ~= nil then
						local var_692_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_689_1.actors_[var_692_17.prefab_name].transform, "story_v_side_new_1102805", "1102805167", "story_v_side_new_1102805.awb")

						arg_689_1:RecordAudio("1102805167", var_692_23)
						arg_689_1:RecordAudio("1102805167", var_692_23)
					else
						arg_689_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805167", "story_v_side_new_1102805.awb")
					end

					arg_689_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805167", "story_v_side_new_1102805.awb")
				end

				arg_689_1:RecordContent(arg_689_1.text_.text)
			end

			local var_692_24 = math.max(var_692_15, arg_689_1.talkMaxDuration)

			if var_692_14 <= arg_689_1.time_ and arg_689_1.time_ < var_692_14 + var_692_24 then
				arg_689_1.typewritter.percent = (arg_689_1.time_ - var_692_14) / var_692_24

				arg_689_1.typewritter:SetDirty()
			end

			if arg_689_1.time_ >= var_692_14 + var_692_24 and arg_689_1.time_ < var_692_14 + var_692_24 + arg_692_0 then
				arg_689_1.typewritter.percent = 1

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805168 = function(arg_693_0, arg_693_1)
		arg_693_1.time_ = 0
		arg_693_1.frameCnt_ = 0
		arg_693_1.state_ = "playing"
		arg_693_1.curTalkId_ = 1102805168
		arg_693_1.duration_ = 6.8

		SetActive(arg_693_1.tipsGo_, false)

		function arg_693_1.onSingleLineFinish_()
			arg_693_1.onSingleLineUpdate_ = nil
			arg_693_1.onSingleLineFinish_ = nil
			arg_693_1.state_ = "waiting"
		end

		function arg_693_1.playNext_(arg_695_0)
			if arg_695_0 == 1 then
				arg_693_0:Play1102805169(arg_693_1)
			end
		end

		function arg_693_1.onSingleLineUpdate_(arg_696_0)
			local var_696_0 = arg_693_1.actors_["1028ui_story"].transform
			local var_696_1 = 0.965999998152256

			if var_696_1 < arg_693_1.time_ and arg_693_1.time_ <= var_696_1 + arg_696_0 then
				arg_693_1.var_.moveOldPos1028ui_story = var_696_0.localPosition
			end

			local var_696_2 = 0.001

			if var_696_1 <= arg_693_1.time_ and arg_693_1.time_ < var_696_1 + var_696_2 then
				local var_696_3 = (arg_693_1.time_ - var_696_1) / var_696_2
				local var_696_4 = Vector3.New(0, 100, 0)

				var_696_0.localPosition = Vector3.Lerp(arg_693_1.var_.moveOldPos1028ui_story, var_696_4, var_696_3)

				local var_696_5 = manager.ui.mainCamera.transform.position - var_696_0.position

				var_696_0.forward = Vector3.New(var_696_5.x, var_696_5.y, var_696_5.z)

				local var_696_6 = var_696_0.localEulerAngles

				var_696_6.z = 0
				var_696_6.x = 0
				var_696_0.localEulerAngles = var_696_6
			end

			if arg_693_1.time_ >= var_696_1 + var_696_2 and arg_693_1.time_ < var_696_1 + var_696_2 + arg_696_0 then
				var_696_0.localPosition = Vector3.New(0, 100, 0)

				local var_696_7 = manager.ui.mainCamera.transform.position - var_696_0.position

				var_696_0.forward = Vector3.New(var_696_7.x, var_696_7.y, var_696_7.z)

				local var_696_8 = var_696_0.localEulerAngles

				var_696_8.z = 0
				var_696_8.x = 0
				var_696_0.localEulerAngles = var_696_8
			end

			local var_696_9 = arg_693_1.actors_["1028ui_story"]
			local var_696_10 = 0.965999998152256

			if var_696_10 < arg_693_1.time_ and arg_693_1.time_ <= var_696_10 + arg_696_0 and arg_693_1.var_.characterEffect1028ui_story == nil then
				arg_693_1.var_.characterEffect1028ui_story = var_696_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_696_11 = 0.034000001847744

			if var_696_10 <= arg_693_1.time_ and arg_693_1.time_ < var_696_10 + var_696_11 then
				local var_696_12 = (arg_693_1.time_ - var_696_10) / var_696_11

				if arg_693_1.var_.characterEffect1028ui_story then
					local var_696_13 = Mathf.Lerp(0, 0.5, var_696_12)

					arg_693_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_693_1.var_.characterEffect1028ui_story.fillRatio = var_696_13
				end
			end

			if arg_693_1.time_ >= var_696_10 + var_696_11 and arg_693_1.time_ < var_696_10 + var_696_11 + arg_696_0 and arg_693_1.var_.characterEffect1028ui_story then
				local var_696_14 = 0.5

				arg_693_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_693_1.var_.characterEffect1028ui_story.fillRatio = var_696_14
			end

			local var_696_15 = 0

			if var_696_15 < arg_693_1.time_ and arg_693_1.time_ <= var_696_15 + arg_696_0 then
				arg_693_1.mask_.enabled = true
				arg_693_1.mask_.raycastTarget = true

				arg_693_1:SetGaussion(false)
			end

			local var_696_16 = 1

			if var_696_15 <= arg_693_1.time_ and arg_693_1.time_ < var_696_15 + var_696_16 then
				local var_696_17 = (arg_693_1.time_ - var_696_15) / var_696_16
				local var_696_18 = Color.New(0, 0, 0)

				var_696_18.a = Mathf.Lerp(0, 1, var_696_17)
				arg_693_1.mask_.color = var_696_18
			end

			if arg_693_1.time_ >= var_696_15 + var_696_16 and arg_693_1.time_ < var_696_15 + var_696_16 + arg_696_0 then
				local var_696_19 = Color.New(0, 0, 0)

				var_696_19.a = 1
				arg_693_1.mask_.color = var_696_19
			end

			local var_696_20 = 1

			if var_696_20 < arg_693_1.time_ and arg_693_1.time_ <= var_696_20 + arg_696_0 then
				arg_693_1.mask_.enabled = true
				arg_693_1.mask_.raycastTarget = true

				arg_693_1:SetGaussion(false)
			end

			local var_696_21 = 1

			if var_696_20 <= arg_693_1.time_ and arg_693_1.time_ < var_696_20 + var_696_21 then
				local var_696_22 = (arg_693_1.time_ - var_696_20) / var_696_21
				local var_696_23 = Color.New(0, 0, 0)

				var_696_23.a = Mathf.Lerp(1, 0, var_696_22)
				arg_693_1.mask_.color = var_696_23
			end

			if arg_693_1.time_ >= var_696_20 + var_696_21 and arg_693_1.time_ < var_696_20 + var_696_21 + arg_696_0 then
				local var_696_24 = Color.New(0, 0, 0)
				local var_696_25 = 0

				arg_693_1.mask_.enabled = false
				var_696_24.a = var_696_25
				arg_693_1.mask_.color = var_696_24
			end

			local var_696_26 = manager.ui.mainCamera.transform
			local var_696_27 = 1

			if var_696_27 < arg_693_1.time_ and arg_693_1.time_ <= var_696_27 + arg_696_0 then
				local var_696_28 = arg_693_1.var_.effectshujufengbao1

				if not var_696_28 then
					var_696_28 = Object.Instantiate(Asset.Load("Effect/Scene/fx_scence_pingmu_niuqu"))
					var_696_28.name = "shujufengbao1"
					arg_693_1.var_.effectshujufengbao1 = var_696_28
				end

				local var_696_29 = var_696_26:Find("")

				if var_696_29 then
					var_696_28.transform.parent = var_696_29
				else
					var_696_28.transform.parent = var_696_26
				end

				var_696_28.transform.localPosition = Vector3.New(0, 0, 0)
				var_696_28.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			if arg_693_1.frameCnt_ <= 1 then
				arg_693_1.dialog_:SetActive(false)
			end

			local var_696_30 = 1.8
			local var_696_31 = 0.925

			if var_696_30 < arg_693_1.time_ and arg_693_1.time_ <= var_696_30 + arg_696_0 then
				arg_693_1.talkMaxDuration = 0

				arg_693_1.dialog_:SetActive(true)

				local var_696_32 = LeanTween.value(arg_693_1.dialog_, 0, 1, 0.3)

				var_696_32:setOnUpdate(LuaHelper.FloatAction(function(arg_697_0)
					arg_693_1.dialogCg_.alpha = arg_697_0
				end))
				var_696_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_693_1.dialog_)
					var_696_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_693_1.duration_ = arg_693_1.duration_ + 0.3

				SetActive(arg_693_1.leftNameGo_, false)

				arg_693_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_693_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_693_1:RecordName(arg_693_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_693_1.iconTrs_.gameObject, false)
				arg_693_1.callingController_:SetSelectedState("normal")

				local var_696_33 = arg_693_1:GetWordFromCfg(1102805168)
				local var_696_34 = arg_693_1:FormatText(var_696_33.content)

				arg_693_1.text_.text = var_696_34

				LuaForUtil.ClearLinePrefixSymbol(arg_693_1.text_)

				local var_696_35 = 37
				local var_696_36 = utf8.len(var_696_34)
				local var_696_37 = var_696_35 <= 0 and var_696_31 or var_696_31 * (var_696_36 / var_696_35)

				if var_696_37 > 0 and var_696_31 < var_696_37 then
					arg_693_1.talkMaxDuration = var_696_37
					var_696_30 = var_696_30 + 0.3

					if var_696_37 + var_696_30 > arg_693_1.duration_ then
						arg_693_1.duration_ = var_696_37 + var_696_30
					end
				end

				arg_693_1.text_.text = var_696_34
				arg_693_1.typewritter.percent = 0

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(false)
				arg_693_1:RecordContent(arg_693_1.text_.text)
			end

			local var_696_38 = var_696_30 + 0.3
			local var_696_39 = math.max(var_696_31, arg_693_1.talkMaxDuration)

			if var_696_38 <= arg_693_1.time_ and arg_693_1.time_ < var_696_38 + var_696_39 then
				arg_693_1.typewritter.percent = (arg_693_1.time_ - var_696_38) / var_696_39

				arg_693_1.typewritter:SetDirty()
			end

			if arg_693_1.time_ >= var_696_38 + var_696_39 and arg_693_1.time_ < var_696_38 + var_696_39 + arg_696_0 then
				arg_693_1.typewritter.percent = 1

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805169 = function(arg_699_0, arg_699_1)
		arg_699_1.time_ = 0
		arg_699_1.frameCnt_ = 0
		arg_699_1.state_ = "playing"
		arg_699_1.curTalkId_ = 1102805169
		arg_699_1.duration_ = 5

		SetActive(arg_699_1.tipsGo_, false)

		function arg_699_1.onSingleLineFinish_()
			arg_699_1.onSingleLineUpdate_ = nil
			arg_699_1.onSingleLineFinish_ = nil
			arg_699_1.state_ = "waiting"
		end

		function arg_699_1.playNext_(arg_701_0)
			if arg_701_0 == 1 then
				arg_699_0:Play1102805170(arg_699_1)
			end
		end

		function arg_699_1.onSingleLineUpdate_(arg_702_0)
			local var_702_0 = 0
			local var_702_1 = 0.175

			if var_702_0 < arg_699_1.time_ and arg_699_1.time_ <= var_702_0 + arg_702_0 then
				arg_699_1.talkMaxDuration = 0
				arg_699_1.dialogCg_.alpha = 1

				arg_699_1.dialog_:SetActive(true)
				SetActive(arg_699_1.leftNameGo_, true)

				local var_702_2 = arg_699_1:FormatText(StoryNameCfg[7].name)

				arg_699_1.leftNameTxt_.text = var_702_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_699_1.leftNameTxt_.transform)

				arg_699_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_699_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_699_1:RecordName(arg_699_1.leftNameTxt_.text)
				SetActive(arg_699_1.iconTrs_.gameObject, false)
				arg_699_1.callingController_:SetSelectedState("normal")

				local var_702_3 = arg_699_1:GetWordFromCfg(1102805169)
				local var_702_4 = arg_699_1:FormatText(var_702_3.content)

				arg_699_1.text_.text = var_702_4

				LuaForUtil.ClearLinePrefixSymbol(arg_699_1.text_)

				local var_702_5 = 7
				local var_702_6 = utf8.len(var_702_4)
				local var_702_7 = var_702_5 <= 0 and var_702_1 or var_702_1 * (var_702_6 / var_702_5)

				if var_702_7 > 0 and var_702_1 < var_702_7 then
					arg_699_1.talkMaxDuration = var_702_7

					if var_702_7 + var_702_0 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_7 + var_702_0
					end
				end

				arg_699_1.text_.text = var_702_4
				arg_699_1.typewritter.percent = 0

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(false)
				arg_699_1:RecordContent(arg_699_1.text_.text)
			end

			local var_702_8 = math.max(var_702_1, arg_699_1.talkMaxDuration)

			if var_702_0 <= arg_699_1.time_ and arg_699_1.time_ < var_702_0 + var_702_8 then
				arg_699_1.typewritter.percent = (arg_699_1.time_ - var_702_0) / var_702_8

				arg_699_1.typewritter:SetDirty()
			end

			if arg_699_1.time_ >= var_702_0 + var_702_8 and arg_699_1.time_ < var_702_0 + var_702_8 + arg_702_0 then
				arg_699_1.typewritter.percent = 1

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805170 = function(arg_703_0, arg_703_1)
		arg_703_1.time_ = 0
		arg_703_1.frameCnt_ = 0
		arg_703_1.state_ = "playing"
		arg_703_1.curTalkId_ = 1102805170
		arg_703_1.duration_ = 5

		SetActive(arg_703_1.tipsGo_, false)

		function arg_703_1.onSingleLineFinish_()
			arg_703_1.onSingleLineUpdate_ = nil
			arg_703_1.onSingleLineFinish_ = nil
			arg_703_1.state_ = "waiting"
		end

		function arg_703_1.playNext_(arg_705_0)
			if arg_705_0 == 1 then
				arg_703_0:Play1102805171(arg_703_1)
			end
		end

		function arg_703_1.onSingleLineUpdate_(arg_706_0)
			local var_706_0 = 0
			local var_706_1 = 0.6

			if var_706_0 < arg_703_1.time_ and arg_703_1.time_ <= var_706_0 + arg_706_0 then
				local var_706_2 = "play"
				local var_706_3 = "music"

				arg_703_1:AudioAction(var_706_2, var_706_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_706_4 = 0.8
			local var_706_5 = 1

			if var_706_4 < arg_703_1.time_ and arg_703_1.time_ <= var_706_4 + arg_706_0 then
				local var_706_6 = "play"
				local var_706_7 = "music"

				arg_703_1:AudioAction(var_706_6, var_706_7, "bgm_story_v0_battleground", "bgm_story_v0_battleground", "bgm_story_v0_battleground.awb")
			end

			local var_706_8 = 0
			local var_706_9 = 0.6

			if var_706_8 < arg_703_1.time_ and arg_703_1.time_ <= var_706_8 + arg_706_0 then
				local var_706_10 = "play"
				local var_706_11 = "effect"

				arg_703_1:AudioAction(var_706_10, var_706_11, "se_story_side_1028", "se_story_side_1028_storm_loop", "")
			end

			local var_706_12 = 0
			local var_706_13 = 1.25

			if var_706_12 < arg_703_1.time_ and arg_703_1.time_ <= var_706_12 + arg_706_0 then
				arg_703_1.talkMaxDuration = 0
				arg_703_1.dialogCg_.alpha = 1

				arg_703_1.dialog_:SetActive(true)
				SetActive(arg_703_1.leftNameGo_, false)

				arg_703_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_703_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_703_1:RecordName(arg_703_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_703_1.iconTrs_.gameObject, false)
				arg_703_1.callingController_:SetSelectedState("normal")

				local var_706_14 = arg_703_1:GetWordFromCfg(1102805170)
				local var_706_15 = arg_703_1:FormatText(var_706_14.content)

				arg_703_1.text_.text = var_706_15

				LuaForUtil.ClearLinePrefixSymbol(arg_703_1.text_)

				local var_706_16 = 50
				local var_706_17 = utf8.len(var_706_15)
				local var_706_18 = var_706_16 <= 0 and var_706_13 or var_706_13 * (var_706_17 / var_706_16)

				if var_706_18 > 0 and var_706_13 < var_706_18 then
					arg_703_1.talkMaxDuration = var_706_18

					if var_706_18 + var_706_12 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_18 + var_706_12
					end
				end

				arg_703_1.text_.text = var_706_15
				arg_703_1.typewritter.percent = 0

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(false)
				arg_703_1:RecordContent(arg_703_1.text_.text)
			end

			local var_706_19 = math.max(var_706_13, arg_703_1.talkMaxDuration)

			if var_706_12 <= arg_703_1.time_ and arg_703_1.time_ < var_706_12 + var_706_19 then
				arg_703_1.typewritter.percent = (arg_703_1.time_ - var_706_12) / var_706_19

				arg_703_1.typewritter:SetDirty()
			end

			if arg_703_1.time_ >= var_706_12 + var_706_19 and arg_703_1.time_ < var_706_12 + var_706_19 + arg_706_0 then
				arg_703_1.typewritter.percent = 1

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805171 = function(arg_707_0, arg_707_1)
		arg_707_1.time_ = 0
		arg_707_1.frameCnt_ = 0
		arg_707_1.state_ = "playing"
		arg_707_1.curTalkId_ = 1102805171
		arg_707_1.duration_ = 5

		SetActive(arg_707_1.tipsGo_, false)

		function arg_707_1.onSingleLineFinish_()
			arg_707_1.onSingleLineUpdate_ = nil
			arg_707_1.onSingleLineFinish_ = nil
			arg_707_1.state_ = "waiting"
		end

		function arg_707_1.playNext_(arg_709_0)
			if arg_709_0 == 1 then
				arg_707_0:Play1102805172(arg_707_1)
			end
		end

		function arg_707_1.onSingleLineUpdate_(arg_710_0)
			local var_710_0 = 0
			local var_710_1 = 1.05

			if var_710_0 < arg_707_1.time_ and arg_707_1.time_ <= var_710_0 + arg_710_0 then
				arg_707_1.talkMaxDuration = 0
				arg_707_1.dialogCg_.alpha = 1

				arg_707_1.dialog_:SetActive(true)
				SetActive(arg_707_1.leftNameGo_, false)

				arg_707_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_707_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_707_1:RecordName(arg_707_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_707_1.iconTrs_.gameObject, false)
				arg_707_1.callingController_:SetSelectedState("normal")

				local var_710_2 = arg_707_1:GetWordFromCfg(1102805171)
				local var_710_3 = arg_707_1:FormatText(var_710_2.content)

				arg_707_1.text_.text = var_710_3

				LuaForUtil.ClearLinePrefixSymbol(arg_707_1.text_)

				local var_710_4 = 42
				local var_710_5 = utf8.len(var_710_3)
				local var_710_6 = var_710_4 <= 0 and var_710_1 or var_710_1 * (var_710_5 / var_710_4)

				if var_710_6 > 0 and var_710_1 < var_710_6 then
					arg_707_1.talkMaxDuration = var_710_6

					if var_710_6 + var_710_0 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_6 + var_710_0
					end
				end

				arg_707_1.text_.text = var_710_3
				arg_707_1.typewritter.percent = 0

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(false)
				arg_707_1:RecordContent(arg_707_1.text_.text)
			end

			local var_710_7 = math.max(var_710_1, arg_707_1.talkMaxDuration)

			if var_710_0 <= arg_707_1.time_ and arg_707_1.time_ < var_710_0 + var_710_7 then
				arg_707_1.typewritter.percent = (arg_707_1.time_ - var_710_0) / var_710_7

				arg_707_1.typewritter:SetDirty()
			end

			if arg_707_1.time_ >= var_710_0 + var_710_7 and arg_707_1.time_ < var_710_0 + var_710_7 + arg_710_0 then
				arg_707_1.typewritter.percent = 1

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805172 = function(arg_711_0, arg_711_1)
		arg_711_1.time_ = 0
		arg_711_1.frameCnt_ = 0
		arg_711_1.state_ = "playing"
		arg_711_1.curTalkId_ = 1102805172
		arg_711_1.duration_ = 2.999999999999

		SetActive(arg_711_1.tipsGo_, false)

		function arg_711_1.onSingleLineFinish_()
			arg_711_1.onSingleLineUpdate_ = nil
			arg_711_1.onSingleLineFinish_ = nil
			arg_711_1.state_ = "waiting"
		end

		function arg_711_1.playNext_(arg_713_0)
			if arg_713_0 == 1 then
				arg_711_0:Play1102805173(arg_711_1)
			end
		end

		function arg_711_1.onSingleLineUpdate_(arg_714_0)
			local var_714_0 = arg_711_1.actors_["1028ui_story"].transform
			local var_714_1 = 1

			if var_714_1 < arg_711_1.time_ and arg_711_1.time_ <= var_714_1 + arg_714_0 then
				arg_711_1.var_.moveOldPos1028ui_story = var_714_0.localPosition
			end

			local var_714_2 = 0.001

			if var_714_1 <= arg_711_1.time_ and arg_711_1.time_ < var_714_1 + var_714_2 then
				local var_714_3 = (arg_711_1.time_ - var_714_1) / var_714_2
				local var_714_4 = Vector3.New(0, -0.9, -5.9)

				var_714_0.localPosition = Vector3.Lerp(arg_711_1.var_.moveOldPos1028ui_story, var_714_4, var_714_3)

				local var_714_5 = manager.ui.mainCamera.transform.position - var_714_0.position

				var_714_0.forward = Vector3.New(var_714_5.x, var_714_5.y, var_714_5.z)

				local var_714_6 = var_714_0.localEulerAngles

				var_714_6.z = 0
				var_714_6.x = 0
				var_714_0.localEulerAngles = var_714_6
			end

			if arg_711_1.time_ >= var_714_1 + var_714_2 and arg_711_1.time_ < var_714_1 + var_714_2 + arg_714_0 then
				var_714_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_714_7 = manager.ui.mainCamera.transform.position - var_714_0.position

				var_714_0.forward = Vector3.New(var_714_7.x, var_714_7.y, var_714_7.z)

				local var_714_8 = var_714_0.localEulerAngles

				var_714_8.z = 0
				var_714_8.x = 0
				var_714_0.localEulerAngles = var_714_8
			end

			local var_714_9 = arg_711_1.actors_["1028ui_story"]
			local var_714_10 = 1

			if var_714_10 < arg_711_1.time_ and arg_711_1.time_ <= var_714_10 + arg_714_0 and arg_711_1.var_.characterEffect1028ui_story == nil then
				arg_711_1.var_.characterEffect1028ui_story = var_714_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_714_11 = 0.200000002980232

			if var_714_10 <= arg_711_1.time_ and arg_711_1.time_ < var_714_10 + var_714_11 then
				local var_714_12 = (arg_711_1.time_ - var_714_10) / var_714_11

				if arg_711_1.var_.characterEffect1028ui_story then
					arg_711_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_711_1.time_ >= var_714_10 + var_714_11 and arg_711_1.time_ < var_714_10 + var_714_11 + arg_714_0 and arg_711_1.var_.characterEffect1028ui_story then
				arg_711_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_714_13 = 1

			if var_714_13 < arg_711_1.time_ and arg_711_1.time_ <= var_714_13 + arg_714_0 then
				arg_711_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_714_14 = 1

			if var_714_14 < arg_711_1.time_ and arg_711_1.time_ <= var_714_14 + arg_714_0 then
				arg_711_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_714_15 = manager.ui.mainCamera.transform
			local var_714_16 = 0

			if var_714_16 < arg_711_1.time_ and arg_711_1.time_ <= var_714_16 + arg_714_0 then
				local var_714_17 = arg_711_1.var_.effectshujufengbao1

				if var_714_17 then
					Object.Destroy(var_714_17)

					arg_711_1.var_.effectshujufengbao1 = nil
				end
			end

			local var_714_18 = 0

			if var_714_18 < arg_711_1.time_ and arg_711_1.time_ <= var_714_18 + arg_714_0 then
				arg_711_1.mask_.enabled = true
				arg_711_1.mask_.raycastTarget = true

				arg_711_1:SetGaussion(false)
			end

			local var_714_19 = 1

			if var_714_18 <= arg_711_1.time_ and arg_711_1.time_ < var_714_18 + var_714_19 then
				local var_714_20 = (arg_711_1.time_ - var_714_18) / var_714_19
				local var_714_21 = Color.New(1, 1, 1)

				var_714_21.a = Mathf.Lerp(1, 0, var_714_20)
				arg_711_1.mask_.color = var_714_21
			end

			if arg_711_1.time_ >= var_714_18 + var_714_19 and arg_711_1.time_ < var_714_18 + var_714_19 + arg_714_0 then
				local var_714_22 = Color.New(1, 1, 1)
				local var_714_23 = 0

				arg_711_1.mask_.enabled = false
				var_714_22.a = var_714_23
				arg_711_1.mask_.color = var_714_22
			end

			if arg_711_1.frameCnt_ <= 1 then
				arg_711_1.dialog_:SetActive(false)
			end

			local var_714_24 = 1
			local var_714_25 = 0.15

			if var_714_24 < arg_711_1.time_ and arg_711_1.time_ <= var_714_24 + arg_714_0 then
				arg_711_1.talkMaxDuration = 0

				arg_711_1.dialog_:SetActive(true)

				local var_714_26 = LeanTween.value(arg_711_1.dialog_, 0, 1, 0.3)

				var_714_26:setOnUpdate(LuaHelper.FloatAction(function(arg_715_0)
					arg_711_1.dialogCg_.alpha = arg_715_0
				end))
				var_714_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_711_1.dialog_)
					var_714_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_711_1.duration_ = arg_711_1.duration_ + 0.3

				SetActive(arg_711_1.leftNameGo_, true)

				local var_714_27 = arg_711_1:FormatText(StoryNameCfg[327].name)

				arg_711_1.leftNameTxt_.text = var_714_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_711_1.leftNameTxt_.transform)

				arg_711_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_711_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_711_1:RecordName(arg_711_1.leftNameTxt_.text)
				SetActive(arg_711_1.iconTrs_.gameObject, false)
				arg_711_1.callingController_:SetSelectedState("normal")

				local var_714_28 = arg_711_1:GetWordFromCfg(1102805172)
				local var_714_29 = arg_711_1:FormatText(var_714_28.content)

				arg_711_1.text_.text = var_714_29

				LuaForUtil.ClearLinePrefixSymbol(arg_711_1.text_)

				local var_714_30 = 6
				local var_714_31 = utf8.len(var_714_29)
				local var_714_32 = var_714_30 <= 0 and var_714_25 or var_714_25 * (var_714_31 / var_714_30)

				if var_714_32 > 0 and var_714_25 < var_714_32 then
					arg_711_1.talkMaxDuration = var_714_32
					var_714_24 = var_714_24 + 0.3

					if var_714_32 + var_714_24 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_32 + var_714_24
					end
				end

				arg_711_1.text_.text = var_714_29
				arg_711_1.typewritter.percent = 0

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805172", "story_v_side_new_1102805.awb") ~= 0 then
					local var_714_33 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805172", "story_v_side_new_1102805.awb") / 1000

					if var_714_33 + var_714_24 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_33 + var_714_24
					end

					if var_714_28.prefab_name ~= "" and arg_711_1.actors_[var_714_28.prefab_name] ~= nil then
						local var_714_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_711_1.actors_[var_714_28.prefab_name].transform, "story_v_side_new_1102805", "1102805172", "story_v_side_new_1102805.awb")

						arg_711_1:RecordAudio("1102805172", var_714_34)
						arg_711_1:RecordAudio("1102805172", var_714_34)
					else
						arg_711_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805172", "story_v_side_new_1102805.awb")
					end

					arg_711_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805172", "story_v_side_new_1102805.awb")
				end

				arg_711_1:RecordContent(arg_711_1.text_.text)
			end

			local var_714_35 = var_714_24 + 0.3
			local var_714_36 = math.max(var_714_25, arg_711_1.talkMaxDuration)

			if var_714_35 <= arg_711_1.time_ and arg_711_1.time_ < var_714_35 + var_714_36 then
				arg_711_1.typewritter.percent = (arg_711_1.time_ - var_714_35) / var_714_36

				arg_711_1.typewritter:SetDirty()
			end

			if arg_711_1.time_ >= var_714_35 + var_714_36 and arg_711_1.time_ < var_714_35 + var_714_36 + arg_714_0 then
				arg_711_1.typewritter.percent = 1

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805173 = function(arg_717_0, arg_717_1)
		arg_717_1.time_ = 0
		arg_717_1.frameCnt_ = 0
		arg_717_1.state_ = "playing"
		arg_717_1.curTalkId_ = 1102805173
		arg_717_1.duration_ = 5

		SetActive(arg_717_1.tipsGo_, false)

		function arg_717_1.onSingleLineFinish_()
			arg_717_1.onSingleLineUpdate_ = nil
			arg_717_1.onSingleLineFinish_ = nil
			arg_717_1.state_ = "waiting"
		end

		function arg_717_1.playNext_(arg_719_0)
			if arg_719_0 == 1 then
				arg_717_0:Play1102805174(arg_717_1)
			end
		end

		function arg_717_1.onSingleLineUpdate_(arg_720_0)
			local var_720_0 = arg_717_1.actors_["1028ui_story"]
			local var_720_1 = 0

			if var_720_1 < arg_717_1.time_ and arg_717_1.time_ <= var_720_1 + arg_720_0 and arg_717_1.var_.characterEffect1028ui_story == nil then
				arg_717_1.var_.characterEffect1028ui_story = var_720_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_720_2 = 0.200000002980232

			if var_720_1 <= arg_717_1.time_ and arg_717_1.time_ < var_720_1 + var_720_2 then
				local var_720_3 = (arg_717_1.time_ - var_720_1) / var_720_2

				if arg_717_1.var_.characterEffect1028ui_story then
					local var_720_4 = Mathf.Lerp(0, 0.5, var_720_3)

					arg_717_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_717_1.var_.characterEffect1028ui_story.fillRatio = var_720_4
				end
			end

			if arg_717_1.time_ >= var_720_1 + var_720_2 and arg_717_1.time_ < var_720_1 + var_720_2 + arg_720_0 and arg_717_1.var_.characterEffect1028ui_story then
				local var_720_5 = 0.5

				arg_717_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_717_1.var_.characterEffect1028ui_story.fillRatio = var_720_5
			end

			local var_720_6 = 0
			local var_720_7 = 1.6

			if var_720_6 < arg_717_1.time_ and arg_717_1.time_ <= var_720_6 + arg_720_0 then
				arg_717_1.talkMaxDuration = 0
				arg_717_1.dialogCg_.alpha = 1

				arg_717_1.dialog_:SetActive(true)
				SetActive(arg_717_1.leftNameGo_, false)

				arg_717_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_717_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_717_1:RecordName(arg_717_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_717_1.iconTrs_.gameObject, false)
				arg_717_1.callingController_:SetSelectedState("normal")

				local var_720_8 = arg_717_1:GetWordFromCfg(1102805173)
				local var_720_9 = arg_717_1:FormatText(var_720_8.content)

				arg_717_1.text_.text = var_720_9

				LuaForUtil.ClearLinePrefixSymbol(arg_717_1.text_)

				local var_720_10 = 64
				local var_720_11 = utf8.len(var_720_9)
				local var_720_12 = var_720_10 <= 0 and var_720_7 or var_720_7 * (var_720_11 / var_720_10)

				if var_720_12 > 0 and var_720_7 < var_720_12 then
					arg_717_1.talkMaxDuration = var_720_12

					if var_720_12 + var_720_6 > arg_717_1.duration_ then
						arg_717_1.duration_ = var_720_12 + var_720_6
					end
				end

				arg_717_1.text_.text = var_720_9
				arg_717_1.typewritter.percent = 0

				arg_717_1.typewritter:SetDirty()
				arg_717_1:ShowNextGo(false)
				arg_717_1:RecordContent(arg_717_1.text_.text)
			end

			local var_720_13 = math.max(var_720_7, arg_717_1.talkMaxDuration)

			if var_720_6 <= arg_717_1.time_ and arg_717_1.time_ < var_720_6 + var_720_13 then
				arg_717_1.typewritter.percent = (arg_717_1.time_ - var_720_6) / var_720_13

				arg_717_1.typewritter:SetDirty()
			end

			if arg_717_1.time_ >= var_720_6 + var_720_13 and arg_717_1.time_ < var_720_6 + var_720_13 + arg_720_0 then
				arg_717_1.typewritter.percent = 1

				arg_717_1.typewritter:SetDirty()
				arg_717_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805174 = function(arg_721_0, arg_721_1)
		arg_721_1.time_ = 0
		arg_721_1.frameCnt_ = 0
		arg_721_1.state_ = "playing"
		arg_721_1.curTalkId_ = 1102805174
		arg_721_1.duration_ = 5

		SetActive(arg_721_1.tipsGo_, false)

		function arg_721_1.onSingleLineFinish_()
			arg_721_1.onSingleLineUpdate_ = nil
			arg_721_1.onSingleLineFinish_ = nil
			arg_721_1.state_ = "waiting"
		end

		function arg_721_1.playNext_(arg_723_0)
			if arg_723_0 == 1 then
				arg_721_0:Play1102805175(arg_721_1)
			end
		end

		function arg_721_1.onSingleLineUpdate_(arg_724_0)
			local var_724_0 = 0
			local var_724_1 = 0.375

			if var_724_0 < arg_721_1.time_ and arg_721_1.time_ <= var_724_0 + arg_724_0 then
				arg_721_1.talkMaxDuration = 0
				arg_721_1.dialogCg_.alpha = 1

				arg_721_1.dialog_:SetActive(true)
				SetActive(arg_721_1.leftNameGo_, true)

				local var_724_2 = arg_721_1:FormatText(StoryNameCfg[7].name)

				arg_721_1.leftNameTxt_.text = var_724_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_721_1.leftNameTxt_.transform)

				arg_721_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_721_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_721_1:RecordName(arg_721_1.leftNameTxt_.text)
				SetActive(arg_721_1.iconTrs_.gameObject, false)
				arg_721_1.callingController_:SetSelectedState("normal")

				local var_724_3 = arg_721_1:GetWordFromCfg(1102805174)
				local var_724_4 = arg_721_1:FormatText(var_724_3.content)

				arg_721_1.text_.text = var_724_4

				LuaForUtil.ClearLinePrefixSymbol(arg_721_1.text_)

				local var_724_5 = 15
				local var_724_6 = utf8.len(var_724_4)
				local var_724_7 = var_724_5 <= 0 and var_724_1 or var_724_1 * (var_724_6 / var_724_5)

				if var_724_7 > 0 and var_724_1 < var_724_7 then
					arg_721_1.talkMaxDuration = var_724_7

					if var_724_7 + var_724_0 > arg_721_1.duration_ then
						arg_721_1.duration_ = var_724_7 + var_724_0
					end
				end

				arg_721_1.text_.text = var_724_4
				arg_721_1.typewritter.percent = 0

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(false)
				arg_721_1:RecordContent(arg_721_1.text_.text)
			end

			local var_724_8 = math.max(var_724_1, arg_721_1.talkMaxDuration)

			if var_724_0 <= arg_721_1.time_ and arg_721_1.time_ < var_724_0 + var_724_8 then
				arg_721_1.typewritter.percent = (arg_721_1.time_ - var_724_0) / var_724_8

				arg_721_1.typewritter:SetDirty()
			end

			if arg_721_1.time_ >= var_724_0 + var_724_8 and arg_721_1.time_ < var_724_0 + var_724_8 + arg_724_0 then
				arg_721_1.typewritter.percent = 1

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805175 = function(arg_725_0, arg_725_1)
		arg_725_1.time_ = 0
		arg_725_1.frameCnt_ = 0
		arg_725_1.state_ = "playing"
		arg_725_1.curTalkId_ = 1102805175
		arg_725_1.duration_ = 1.999999999999

		SetActive(arg_725_1.tipsGo_, false)

		function arg_725_1.onSingleLineFinish_()
			arg_725_1.onSingleLineUpdate_ = nil
			arg_725_1.onSingleLineFinish_ = nil
			arg_725_1.state_ = "waiting"
		end

		function arg_725_1.playNext_(arg_727_0)
			if arg_727_0 == 1 then
				arg_725_0:Play1102805176(arg_725_1)
			end
		end

		function arg_725_1.onSingleLineUpdate_(arg_728_0)
			local var_728_0 = arg_725_1.actors_["1028ui_story"].transform
			local var_728_1 = 0

			if var_728_1 < arg_725_1.time_ and arg_725_1.time_ <= var_728_1 + arg_728_0 then
				arg_725_1.var_.moveOldPos1028ui_story = var_728_0.localPosition
			end

			local var_728_2 = 0.001

			if var_728_1 <= arg_725_1.time_ and arg_725_1.time_ < var_728_1 + var_728_2 then
				local var_728_3 = (arg_725_1.time_ - var_728_1) / var_728_2
				local var_728_4 = Vector3.New(0, -0.9, -5.9)

				var_728_0.localPosition = Vector3.Lerp(arg_725_1.var_.moveOldPos1028ui_story, var_728_4, var_728_3)

				local var_728_5 = manager.ui.mainCamera.transform.position - var_728_0.position

				var_728_0.forward = Vector3.New(var_728_5.x, var_728_5.y, var_728_5.z)

				local var_728_6 = var_728_0.localEulerAngles

				var_728_6.z = 0
				var_728_6.x = 0
				var_728_0.localEulerAngles = var_728_6
			end

			if arg_725_1.time_ >= var_728_1 + var_728_2 and arg_725_1.time_ < var_728_1 + var_728_2 + arg_728_0 then
				var_728_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_728_7 = manager.ui.mainCamera.transform.position - var_728_0.position

				var_728_0.forward = Vector3.New(var_728_7.x, var_728_7.y, var_728_7.z)

				local var_728_8 = var_728_0.localEulerAngles

				var_728_8.z = 0
				var_728_8.x = 0
				var_728_0.localEulerAngles = var_728_8
			end

			local var_728_9 = arg_725_1.actors_["1028ui_story"]
			local var_728_10 = 0

			if var_728_10 < arg_725_1.time_ and arg_725_1.time_ <= var_728_10 + arg_728_0 and arg_725_1.var_.characterEffect1028ui_story == nil then
				arg_725_1.var_.characterEffect1028ui_story = var_728_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_728_11 = 0.200000002980232

			if var_728_10 <= arg_725_1.time_ and arg_725_1.time_ < var_728_10 + var_728_11 then
				local var_728_12 = (arg_725_1.time_ - var_728_10) / var_728_11

				if arg_725_1.var_.characterEffect1028ui_story then
					arg_725_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_725_1.time_ >= var_728_10 + var_728_11 and arg_725_1.time_ < var_728_10 + var_728_11 + arg_728_0 and arg_725_1.var_.characterEffect1028ui_story then
				arg_725_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_728_13 = 0

			if var_728_13 < arg_725_1.time_ and arg_725_1.time_ <= var_728_13 + arg_728_0 then
				arg_725_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_728_14 = 0

			if var_728_14 < arg_725_1.time_ and arg_725_1.time_ <= var_728_14 + arg_728_0 then
				arg_725_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_1")
			end

			local var_728_15 = 0
			local var_728_16 = 0.175

			if var_728_15 < arg_725_1.time_ and arg_725_1.time_ <= var_728_15 + arg_728_0 then
				arg_725_1.talkMaxDuration = 0
				arg_725_1.dialogCg_.alpha = 1

				arg_725_1.dialog_:SetActive(true)
				SetActive(arg_725_1.leftNameGo_, true)

				local var_728_17 = arg_725_1:FormatText(StoryNameCfg[327].name)

				arg_725_1.leftNameTxt_.text = var_728_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_725_1.leftNameTxt_.transform)

				arg_725_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_725_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_725_1:RecordName(arg_725_1.leftNameTxt_.text)
				SetActive(arg_725_1.iconTrs_.gameObject, false)
				arg_725_1.callingController_:SetSelectedState("normal")

				local var_728_18 = arg_725_1:GetWordFromCfg(1102805175)
				local var_728_19 = arg_725_1:FormatText(var_728_18.content)

				arg_725_1.text_.text = var_728_19

				LuaForUtil.ClearLinePrefixSymbol(arg_725_1.text_)

				local var_728_20 = 7
				local var_728_21 = utf8.len(var_728_19)
				local var_728_22 = var_728_20 <= 0 and var_728_16 or var_728_16 * (var_728_21 / var_728_20)

				if var_728_22 > 0 and var_728_16 < var_728_22 then
					arg_725_1.talkMaxDuration = var_728_22

					if var_728_22 + var_728_15 > arg_725_1.duration_ then
						arg_725_1.duration_ = var_728_22 + var_728_15
					end
				end

				arg_725_1.text_.text = var_728_19
				arg_725_1.typewritter.percent = 0

				arg_725_1.typewritter:SetDirty()
				arg_725_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805175", "story_v_side_new_1102805.awb") ~= 0 then
					local var_728_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805175", "story_v_side_new_1102805.awb") / 1000

					if var_728_23 + var_728_15 > arg_725_1.duration_ then
						arg_725_1.duration_ = var_728_23 + var_728_15
					end

					if var_728_18.prefab_name ~= "" and arg_725_1.actors_[var_728_18.prefab_name] ~= nil then
						local var_728_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_725_1.actors_[var_728_18.prefab_name].transform, "story_v_side_new_1102805", "1102805175", "story_v_side_new_1102805.awb")

						arg_725_1:RecordAudio("1102805175", var_728_24)
						arg_725_1:RecordAudio("1102805175", var_728_24)
					else
						arg_725_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805175", "story_v_side_new_1102805.awb")
					end

					arg_725_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805175", "story_v_side_new_1102805.awb")
				end

				arg_725_1:RecordContent(arg_725_1.text_.text)
			end

			local var_728_25 = math.max(var_728_16, arg_725_1.talkMaxDuration)

			if var_728_15 <= arg_725_1.time_ and arg_725_1.time_ < var_728_15 + var_728_25 then
				arg_725_1.typewritter.percent = (arg_725_1.time_ - var_728_15) / var_728_25

				arg_725_1.typewritter:SetDirty()
			end

			if arg_725_1.time_ >= var_728_15 + var_728_25 and arg_725_1.time_ < var_728_15 + var_728_25 + arg_728_0 then
				arg_725_1.typewritter.percent = 1

				arg_725_1.typewritter:SetDirty()
				arg_725_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805176 = function(arg_729_0, arg_729_1)
		arg_729_1.time_ = 0
		arg_729_1.frameCnt_ = 0
		arg_729_1.state_ = "playing"
		arg_729_1.curTalkId_ = 1102805176
		arg_729_1.duration_ = 5.466

		SetActive(arg_729_1.tipsGo_, false)

		function arg_729_1.onSingleLineFinish_()
			arg_729_1.onSingleLineUpdate_ = nil
			arg_729_1.onSingleLineFinish_ = nil
			arg_729_1.state_ = "waiting"
		end

		function arg_729_1.playNext_(arg_731_0)
			if arg_731_0 == 1 then
				arg_729_0:Play1102805177(arg_729_1)
			end
		end

		function arg_729_1.onSingleLineUpdate_(arg_732_0)
			local var_732_0 = 0

			if var_732_0 < arg_729_1.time_ and arg_729_1.time_ <= var_732_0 + arg_732_0 then
				arg_729_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_2")
			end

			local var_732_1 = 0

			if var_732_1 < arg_729_1.time_ and arg_729_1.time_ <= var_732_1 + arg_732_0 then
				arg_729_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_732_2 = 0
			local var_732_3 = 0.65

			if var_732_2 < arg_729_1.time_ and arg_729_1.time_ <= var_732_2 + arg_732_0 then
				arg_729_1.talkMaxDuration = 0
				arg_729_1.dialogCg_.alpha = 1

				arg_729_1.dialog_:SetActive(true)
				SetActive(arg_729_1.leftNameGo_, true)

				local var_732_4 = arg_729_1:FormatText(StoryNameCfg[327].name)

				arg_729_1.leftNameTxt_.text = var_732_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_729_1.leftNameTxt_.transform)

				arg_729_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_729_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_729_1:RecordName(arg_729_1.leftNameTxt_.text)
				SetActive(arg_729_1.iconTrs_.gameObject, false)
				arg_729_1.callingController_:SetSelectedState("normal")

				local var_732_5 = arg_729_1:GetWordFromCfg(1102805176)
				local var_732_6 = arg_729_1:FormatText(var_732_5.content)

				arg_729_1.text_.text = var_732_6

				LuaForUtil.ClearLinePrefixSymbol(arg_729_1.text_)

				local var_732_7 = 26
				local var_732_8 = utf8.len(var_732_6)
				local var_732_9 = var_732_7 <= 0 and var_732_3 or var_732_3 * (var_732_8 / var_732_7)

				if var_732_9 > 0 and var_732_3 < var_732_9 then
					arg_729_1.talkMaxDuration = var_732_9

					if var_732_9 + var_732_2 > arg_729_1.duration_ then
						arg_729_1.duration_ = var_732_9 + var_732_2
					end
				end

				arg_729_1.text_.text = var_732_6
				arg_729_1.typewritter.percent = 0

				arg_729_1.typewritter:SetDirty()
				arg_729_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805176", "story_v_side_new_1102805.awb") ~= 0 then
					local var_732_10 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805176", "story_v_side_new_1102805.awb") / 1000

					if var_732_10 + var_732_2 > arg_729_1.duration_ then
						arg_729_1.duration_ = var_732_10 + var_732_2
					end

					if var_732_5.prefab_name ~= "" and arg_729_1.actors_[var_732_5.prefab_name] ~= nil then
						local var_732_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_729_1.actors_[var_732_5.prefab_name].transform, "story_v_side_new_1102805", "1102805176", "story_v_side_new_1102805.awb")

						arg_729_1:RecordAudio("1102805176", var_732_11)
						arg_729_1:RecordAudio("1102805176", var_732_11)
					else
						arg_729_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805176", "story_v_side_new_1102805.awb")
					end

					arg_729_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805176", "story_v_side_new_1102805.awb")
				end

				arg_729_1:RecordContent(arg_729_1.text_.text)
			end

			local var_732_12 = math.max(var_732_3, arg_729_1.talkMaxDuration)

			if var_732_2 <= arg_729_1.time_ and arg_729_1.time_ < var_732_2 + var_732_12 then
				arg_729_1.typewritter.percent = (arg_729_1.time_ - var_732_2) / var_732_12

				arg_729_1.typewritter:SetDirty()
			end

			if arg_729_1.time_ >= var_732_2 + var_732_12 and arg_729_1.time_ < var_732_2 + var_732_12 + arg_732_0 then
				arg_729_1.typewritter.percent = 1

				arg_729_1.typewritter:SetDirty()
				arg_729_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805177 = function(arg_733_0, arg_733_1)
		arg_733_1.time_ = 0
		arg_733_1.frameCnt_ = 0
		arg_733_1.state_ = "playing"
		arg_733_1.curTalkId_ = 1102805177
		arg_733_1.duration_ = 0.999999999999

		SetActive(arg_733_1.tipsGo_, false)

		function arg_733_1.onSingleLineFinish_()
			arg_733_1.onSingleLineUpdate_ = nil
			arg_733_1.onSingleLineFinish_ = nil
			arg_733_1.state_ = "waiting"

			SetActive(arg_733_1.choicesGo_, true)

			for iter_734_0, iter_734_1 in ipairs(arg_733_1.choices_) do
				local var_734_0 = iter_734_0 <= 1

				SetActive(iter_734_1.go, var_734_0)
			end

			arg_733_1.choices_[1].txt.text = arg_733_1:FormatText(StoryChoiceCfg[652].name)
		end

		function arg_733_1.playNext_(arg_735_0)
			if arg_735_0 == 1 then
				arg_733_0:Play1102805178(arg_733_1)
			end
		end

		function arg_733_1.onSingleLineUpdate_(arg_736_0)
			local var_736_0 = arg_733_1.actors_["1028ui_story"]
			local var_736_1 = 0

			if var_736_1 < arg_733_1.time_ and arg_733_1.time_ <= var_736_1 + arg_736_0 and arg_733_1.var_.characterEffect1028ui_story == nil then
				arg_733_1.var_.characterEffect1028ui_story = var_736_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_736_2 = 0.200000002980232

			if var_736_1 <= arg_733_1.time_ and arg_733_1.time_ < var_736_1 + var_736_2 then
				local var_736_3 = (arg_733_1.time_ - var_736_1) / var_736_2

				if arg_733_1.var_.characterEffect1028ui_story then
					local var_736_4 = Mathf.Lerp(0, 0.5, var_736_3)

					arg_733_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_733_1.var_.characterEffect1028ui_story.fillRatio = var_736_4
				end
			end

			if arg_733_1.time_ >= var_736_1 + var_736_2 and arg_733_1.time_ < var_736_1 + var_736_2 + arg_736_0 and arg_733_1.var_.characterEffect1028ui_story then
				local var_736_5 = 0.5

				arg_733_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_733_1.var_.characterEffect1028ui_story.fillRatio = var_736_5
			end

			local var_736_6 = 0

			if var_736_6 < arg_733_1.time_ and arg_733_1.time_ <= var_736_6 + arg_736_0 then
				arg_733_1.allBtn_.enabled = false
			end

			local var_736_7 = 0.5

			if arg_733_1.time_ >= var_736_6 + var_736_7 and arg_733_1.time_ < var_736_6 + var_736_7 + arg_736_0 then
				arg_733_1.allBtn_.enabled = true
			end
		end
	end,
	Play1102805178 = function(arg_737_0, arg_737_1)
		arg_737_1.time_ = 0
		arg_737_1.frameCnt_ = 0
		arg_737_1.state_ = "playing"
		arg_737_1.curTalkId_ = 1102805178
		arg_737_1.duration_ = 5

		SetActive(arg_737_1.tipsGo_, false)

		function arg_737_1.onSingleLineFinish_()
			arg_737_1.onSingleLineUpdate_ = nil
			arg_737_1.onSingleLineFinish_ = nil
			arg_737_1.state_ = "waiting"
		end

		function arg_737_1.playNext_(arg_739_0)
			if arg_739_0 == 1 then
				arg_737_0:Play1102805179(arg_737_1)
			end
		end

		function arg_737_1.onSingleLineUpdate_(arg_740_0)
			local var_740_0 = "A05_blur"

			if arg_737_1.bgs_[var_740_0] == nil then
				local var_740_1 = Object.Instantiate(arg_737_1.paintGo_)

				var_740_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_740_0)
				var_740_1.name = var_740_0
				var_740_1.transform.parent = arg_737_1.stage_.transform
				var_740_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_737_1.bgs_[var_740_0] = var_740_1
			end

			local var_740_2 = 0

			if var_740_2 < arg_737_1.time_ and arg_737_1.time_ <= var_740_2 + arg_740_0 then
				local var_740_3 = manager.ui.mainCamera.transform.localPosition
				local var_740_4 = Vector3.New(0, 0, 10) + Vector3.New(var_740_3.x, var_740_3.y, 0)
				local var_740_5 = arg_737_1.bgs_.A05_blur

				var_740_5.transform.localPosition = var_740_4
				var_740_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_740_6 = var_740_5:GetComponent("SpriteRenderer")

				if var_740_6 and var_740_6.sprite then
					local var_740_7 = (var_740_5.transform.localPosition - var_740_3).z
					local var_740_8 = manager.ui.mainCameraCom_
					local var_740_9 = 2 * var_740_7 * Mathf.Tan(var_740_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_740_10 = var_740_9 * var_740_8.aspect
					local var_740_11 = var_740_6.sprite.bounds.size.x
					local var_740_12 = var_740_6.sprite.bounds.size.y
					local var_740_13 = var_740_10 / var_740_11
					local var_740_14 = var_740_9 / var_740_12
					local var_740_15 = var_740_14 < var_740_13 and var_740_13 or var_740_14

					var_740_5.transform.localScale = Vector3.New(var_740_15, var_740_15, 0)
				end

				for iter_740_0, iter_740_1 in pairs(arg_737_1.bgs_) do
					if iter_740_0 ~= "A05_blur" then
						iter_740_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_740_16 = arg_737_1.actors_["1028ui_story"].transform
			local var_740_17 = 0

			if var_740_17 < arg_737_1.time_ and arg_737_1.time_ <= var_740_17 + arg_740_0 then
				arg_737_1.var_.moveOldPos1028ui_story = var_740_16.localPosition
			end

			local var_740_18 = 0.001

			if var_740_17 <= arg_737_1.time_ and arg_737_1.time_ < var_740_17 + var_740_18 then
				local var_740_19 = (arg_737_1.time_ - var_740_17) / var_740_18
				local var_740_20 = Vector3.New(0, 100, 0)

				var_740_16.localPosition = Vector3.Lerp(arg_737_1.var_.moveOldPos1028ui_story, var_740_20, var_740_19)

				local var_740_21 = manager.ui.mainCamera.transform.position - var_740_16.position

				var_740_16.forward = Vector3.New(var_740_21.x, var_740_21.y, var_740_21.z)

				local var_740_22 = var_740_16.localEulerAngles

				var_740_22.z = 0
				var_740_22.x = 0
				var_740_16.localEulerAngles = var_740_22
			end

			if arg_737_1.time_ >= var_740_17 + var_740_18 and arg_737_1.time_ < var_740_17 + var_740_18 + arg_740_0 then
				var_740_16.localPosition = Vector3.New(0, 100, 0)

				local var_740_23 = manager.ui.mainCamera.transform.position - var_740_16.position

				var_740_16.forward = Vector3.New(var_740_23.x, var_740_23.y, var_740_23.z)

				local var_740_24 = var_740_16.localEulerAngles

				var_740_24.z = 0
				var_740_24.x = 0
				var_740_16.localEulerAngles = var_740_24
			end

			local var_740_25 = 0
			local var_740_26 = 0.9

			if var_740_25 < arg_737_1.time_ and arg_737_1.time_ <= var_740_25 + arg_740_0 then
				arg_737_1.talkMaxDuration = 0
				arg_737_1.dialogCg_.alpha = 1

				arg_737_1.dialog_:SetActive(true)
				SetActive(arg_737_1.leftNameGo_, false)

				arg_737_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_737_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_737_1:RecordName(arg_737_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_737_1.iconTrs_.gameObject, false)
				arg_737_1.callingController_:SetSelectedState("normal")

				local var_740_27 = arg_737_1:GetWordFromCfg(1102805178)
				local var_740_28 = arg_737_1:FormatText(var_740_27.content)

				arg_737_1.text_.text = var_740_28

				LuaForUtil.ClearLinePrefixSymbol(arg_737_1.text_)

				local var_740_29 = 36
				local var_740_30 = utf8.len(var_740_28)
				local var_740_31 = var_740_29 <= 0 and var_740_26 or var_740_26 * (var_740_30 / var_740_29)

				if var_740_31 > 0 and var_740_26 < var_740_31 then
					arg_737_1.talkMaxDuration = var_740_31

					if var_740_31 + var_740_25 > arg_737_1.duration_ then
						arg_737_1.duration_ = var_740_31 + var_740_25
					end
				end

				arg_737_1.text_.text = var_740_28
				arg_737_1.typewritter.percent = 0

				arg_737_1.typewritter:SetDirty()
				arg_737_1:ShowNextGo(false)
				arg_737_1:RecordContent(arg_737_1.text_.text)
			end

			local var_740_32 = math.max(var_740_26, arg_737_1.talkMaxDuration)

			if var_740_25 <= arg_737_1.time_ and arg_737_1.time_ < var_740_25 + var_740_32 then
				arg_737_1.typewritter.percent = (arg_737_1.time_ - var_740_25) / var_740_32

				arg_737_1.typewritter:SetDirty()
			end

			if arg_737_1.time_ >= var_740_25 + var_740_32 and arg_737_1.time_ < var_740_25 + var_740_32 + arg_740_0 then
				arg_737_1.typewritter.percent = 1

				arg_737_1.typewritter:SetDirty()
				arg_737_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805179 = function(arg_741_0, arg_741_1)
		arg_741_1.time_ = 0
		arg_741_1.frameCnt_ = 0
		arg_741_1.state_ = "playing"
		arg_741_1.curTalkId_ = 1102805179
		arg_741_1.duration_ = 5

		SetActive(arg_741_1.tipsGo_, false)

		function arg_741_1.onSingleLineFinish_()
			arg_741_1.onSingleLineUpdate_ = nil
			arg_741_1.onSingleLineFinish_ = nil
			arg_741_1.state_ = "waiting"
		end

		function arg_741_1.playNext_(arg_743_0)
			if arg_743_0 == 1 then
				arg_741_0:Play1102805180(arg_741_1)
			end
		end

		function arg_741_1.onSingleLineUpdate_(arg_744_0)
			local var_744_0 = arg_741_1.actors_["1028ui_story"].transform
			local var_744_1 = 0

			if var_744_1 < arg_741_1.time_ and arg_741_1.time_ <= var_744_1 + arg_744_0 then
				arg_741_1.var_.moveOldPos1028ui_story = var_744_0.localPosition
			end

			local var_744_2 = 0.001

			if var_744_1 <= arg_741_1.time_ and arg_741_1.time_ < var_744_1 + var_744_2 then
				local var_744_3 = (arg_741_1.time_ - var_744_1) / var_744_2
				local var_744_4 = Vector3.New(0, -0.9, -5.9)

				var_744_0.localPosition = Vector3.Lerp(arg_741_1.var_.moveOldPos1028ui_story, var_744_4, var_744_3)

				local var_744_5 = manager.ui.mainCamera.transform.position - var_744_0.position

				var_744_0.forward = Vector3.New(var_744_5.x, var_744_5.y, var_744_5.z)

				local var_744_6 = var_744_0.localEulerAngles

				var_744_6.z = 0
				var_744_6.x = 0
				var_744_0.localEulerAngles = var_744_6
			end

			if arg_741_1.time_ >= var_744_1 + var_744_2 and arg_741_1.time_ < var_744_1 + var_744_2 + arg_744_0 then
				var_744_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_744_7 = manager.ui.mainCamera.transform.position - var_744_0.position

				var_744_0.forward = Vector3.New(var_744_7.x, var_744_7.y, var_744_7.z)

				local var_744_8 = var_744_0.localEulerAngles

				var_744_8.z = 0
				var_744_8.x = 0
				var_744_0.localEulerAngles = var_744_8
			end

			local var_744_9 = arg_741_1.actors_["1028ui_story"]
			local var_744_10 = 0

			if var_744_10 < arg_741_1.time_ and arg_741_1.time_ <= var_744_10 + arg_744_0 and arg_741_1.var_.characterEffect1028ui_story == nil then
				arg_741_1.var_.characterEffect1028ui_story = var_744_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_744_11 = 0.200000002980232

			if var_744_10 <= arg_741_1.time_ and arg_741_1.time_ < var_744_10 + var_744_11 then
				local var_744_12 = (arg_741_1.time_ - var_744_10) / var_744_11

				if arg_741_1.var_.characterEffect1028ui_story then
					local var_744_13 = Mathf.Lerp(0, 0.5, var_744_12)

					arg_741_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_741_1.var_.characterEffect1028ui_story.fillRatio = var_744_13
				end
			end

			if arg_741_1.time_ >= var_744_10 + var_744_11 and arg_741_1.time_ < var_744_10 + var_744_11 + arg_744_0 and arg_741_1.var_.characterEffect1028ui_story then
				local var_744_14 = 0.5

				arg_741_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_741_1.var_.characterEffect1028ui_story.fillRatio = var_744_14
			end

			local var_744_15 = 0

			if var_744_15 < arg_741_1.time_ and arg_741_1.time_ <= var_744_15 + arg_744_0 then
				arg_741_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_744_16 = 0

			if var_744_16 < arg_741_1.time_ and arg_741_1.time_ <= var_744_16 + arg_744_0 then
				arg_741_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_744_17 = 0
			local var_744_18 = 0.275

			if var_744_17 < arg_741_1.time_ and arg_741_1.time_ <= var_744_17 + arg_744_0 then
				arg_741_1.talkMaxDuration = 0
				arg_741_1.dialogCg_.alpha = 1

				arg_741_1.dialog_:SetActive(true)
				SetActive(arg_741_1.leftNameGo_, true)

				local var_744_19 = arg_741_1:FormatText(StoryNameCfg[7].name)

				arg_741_1.leftNameTxt_.text = var_744_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_741_1.leftNameTxt_.transform)

				arg_741_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_741_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_741_1:RecordName(arg_741_1.leftNameTxt_.text)
				SetActive(arg_741_1.iconTrs_.gameObject, false)
				arg_741_1.callingController_:SetSelectedState("normal")

				local var_744_20 = arg_741_1:GetWordFromCfg(1102805179)
				local var_744_21 = arg_741_1:FormatText(var_744_20.content)

				arg_741_1.text_.text = var_744_21

				LuaForUtil.ClearLinePrefixSymbol(arg_741_1.text_)

				local var_744_22 = 11
				local var_744_23 = utf8.len(var_744_21)
				local var_744_24 = var_744_22 <= 0 and var_744_18 or var_744_18 * (var_744_23 / var_744_22)

				if var_744_24 > 0 and var_744_18 < var_744_24 then
					arg_741_1.talkMaxDuration = var_744_24

					if var_744_24 + var_744_17 > arg_741_1.duration_ then
						arg_741_1.duration_ = var_744_24 + var_744_17
					end
				end

				arg_741_1.text_.text = var_744_21
				arg_741_1.typewritter.percent = 0

				arg_741_1.typewritter:SetDirty()
				arg_741_1:ShowNextGo(false)
				arg_741_1:RecordContent(arg_741_1.text_.text)
			end

			local var_744_25 = math.max(var_744_18, arg_741_1.talkMaxDuration)

			if var_744_17 <= arg_741_1.time_ and arg_741_1.time_ < var_744_17 + var_744_25 then
				arg_741_1.typewritter.percent = (arg_741_1.time_ - var_744_17) / var_744_25

				arg_741_1.typewritter:SetDirty()
			end

			if arg_741_1.time_ >= var_744_17 + var_744_25 and arg_741_1.time_ < var_744_17 + var_744_25 + arg_744_0 then
				arg_741_1.typewritter.percent = 1

				arg_741_1.typewritter:SetDirty()
				arg_741_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805180 = function(arg_745_0, arg_745_1)
		arg_745_1.time_ = 0
		arg_745_1.frameCnt_ = 0
		arg_745_1.state_ = "playing"
		arg_745_1.curTalkId_ = 1102805180
		arg_745_1.duration_ = 5

		SetActive(arg_745_1.tipsGo_, false)

		function arg_745_1.onSingleLineFinish_()
			arg_745_1.onSingleLineUpdate_ = nil
			arg_745_1.onSingleLineFinish_ = nil
			arg_745_1.state_ = "waiting"
		end

		function arg_745_1.playNext_(arg_747_0)
			if arg_747_0 == 1 then
				arg_745_0:Play1102805181(arg_745_1)
			end
		end

		function arg_745_1.onSingleLineUpdate_(arg_748_0)
			local var_748_0 = arg_745_1.actors_["1028ui_story"].transform
			local var_748_1 = 0

			if var_748_1 < arg_745_1.time_ and arg_745_1.time_ <= var_748_1 + arg_748_0 then
				arg_745_1.var_.moveOldPos1028ui_story = var_748_0.localPosition
			end

			local var_748_2 = 0.001

			if var_748_1 <= arg_745_1.time_ and arg_745_1.time_ < var_748_1 + var_748_2 then
				local var_748_3 = (arg_745_1.time_ - var_748_1) / var_748_2
				local var_748_4 = Vector3.New(0, -0.9, -5.9)

				var_748_0.localPosition = Vector3.Lerp(arg_745_1.var_.moveOldPos1028ui_story, var_748_4, var_748_3)

				local var_748_5 = manager.ui.mainCamera.transform.position - var_748_0.position

				var_748_0.forward = Vector3.New(var_748_5.x, var_748_5.y, var_748_5.z)

				local var_748_6 = var_748_0.localEulerAngles

				var_748_6.z = 0
				var_748_6.x = 0
				var_748_0.localEulerAngles = var_748_6
			end

			if arg_745_1.time_ >= var_748_1 + var_748_2 and arg_745_1.time_ < var_748_1 + var_748_2 + arg_748_0 then
				var_748_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_748_7 = manager.ui.mainCamera.transform.position - var_748_0.position

				var_748_0.forward = Vector3.New(var_748_7.x, var_748_7.y, var_748_7.z)

				local var_748_8 = var_748_0.localEulerAngles

				var_748_8.z = 0
				var_748_8.x = 0
				var_748_0.localEulerAngles = var_748_8
			end

			local var_748_9 = arg_745_1.actors_["1028ui_story"]
			local var_748_10 = 0

			if var_748_10 < arg_745_1.time_ and arg_745_1.time_ <= var_748_10 + arg_748_0 and arg_745_1.var_.characterEffect1028ui_story == nil then
				arg_745_1.var_.characterEffect1028ui_story = var_748_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_748_11 = 0.200000002980232

			if var_748_10 <= arg_745_1.time_ and arg_745_1.time_ < var_748_10 + var_748_11 then
				local var_748_12 = (arg_745_1.time_ - var_748_10) / var_748_11

				if arg_745_1.var_.characterEffect1028ui_story then
					arg_745_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_745_1.time_ >= var_748_10 + var_748_11 and arg_745_1.time_ < var_748_10 + var_748_11 + arg_748_0 and arg_745_1.var_.characterEffect1028ui_story then
				arg_745_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_748_13 = 0

			if var_748_13 < arg_745_1.time_ and arg_745_1.time_ <= var_748_13 + arg_748_0 then
				arg_745_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_1")
			end

			local var_748_14 = 0

			if var_748_14 < arg_745_1.time_ and arg_745_1.time_ <= var_748_14 + arg_748_0 then
				arg_745_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_748_15 = 0
			local var_748_16 = 0.5

			if var_748_15 < arg_745_1.time_ and arg_745_1.time_ <= var_748_15 + arg_748_0 then
				arg_745_1.talkMaxDuration = 0
				arg_745_1.dialogCg_.alpha = 1

				arg_745_1.dialog_:SetActive(true)
				SetActive(arg_745_1.leftNameGo_, true)

				local var_748_17 = arg_745_1:FormatText(StoryNameCfg[327].name)

				arg_745_1.leftNameTxt_.text = var_748_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_745_1.leftNameTxt_.transform)

				arg_745_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_745_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_745_1:RecordName(arg_745_1.leftNameTxt_.text)
				SetActive(arg_745_1.iconTrs_.gameObject, false)
				arg_745_1.callingController_:SetSelectedState("normal")

				local var_748_18 = arg_745_1:GetWordFromCfg(1102805180)
				local var_748_19 = arg_745_1:FormatText(var_748_18.content)

				arg_745_1.text_.text = var_748_19

				LuaForUtil.ClearLinePrefixSymbol(arg_745_1.text_)

				local var_748_20 = 20
				local var_748_21 = utf8.len(var_748_19)
				local var_748_22 = var_748_20 <= 0 and var_748_16 or var_748_16 * (var_748_21 / var_748_20)

				if var_748_22 > 0 and var_748_16 < var_748_22 then
					arg_745_1.talkMaxDuration = var_748_22

					if var_748_22 + var_748_15 > arg_745_1.duration_ then
						arg_745_1.duration_ = var_748_22 + var_748_15
					end
				end

				arg_745_1.text_.text = var_748_19
				arg_745_1.typewritter.percent = 0

				arg_745_1.typewritter:SetDirty()
				arg_745_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805180", "story_v_side_new_1102805.awb") ~= 0 then
					local var_748_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805180", "story_v_side_new_1102805.awb") / 1000

					if var_748_23 + var_748_15 > arg_745_1.duration_ then
						arg_745_1.duration_ = var_748_23 + var_748_15
					end

					if var_748_18.prefab_name ~= "" and arg_745_1.actors_[var_748_18.prefab_name] ~= nil then
						local var_748_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_745_1.actors_[var_748_18.prefab_name].transform, "story_v_side_new_1102805", "1102805180", "story_v_side_new_1102805.awb")

						arg_745_1:RecordAudio("1102805180", var_748_24)
						arg_745_1:RecordAudio("1102805180", var_748_24)
					else
						arg_745_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805180", "story_v_side_new_1102805.awb")
					end

					arg_745_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805180", "story_v_side_new_1102805.awb")
				end

				arg_745_1:RecordContent(arg_745_1.text_.text)
			end

			local var_748_25 = math.max(var_748_16, arg_745_1.talkMaxDuration)

			if var_748_15 <= arg_745_1.time_ and arg_745_1.time_ < var_748_15 + var_748_25 then
				arg_745_1.typewritter.percent = (arg_745_1.time_ - var_748_15) / var_748_25

				arg_745_1.typewritter:SetDirty()
			end

			if arg_745_1.time_ >= var_748_15 + var_748_25 and arg_745_1.time_ < var_748_15 + var_748_25 + arg_748_0 then
				arg_745_1.typewritter.percent = 1

				arg_745_1.typewritter:SetDirty()
				arg_745_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805181 = function(arg_749_0, arg_749_1)
		arg_749_1.time_ = 0
		arg_749_1.frameCnt_ = 0
		arg_749_1.state_ = "playing"
		arg_749_1.curTalkId_ = 1102805181
		arg_749_1.duration_ = 5

		SetActive(arg_749_1.tipsGo_, false)

		function arg_749_1.onSingleLineFinish_()
			arg_749_1.onSingleLineUpdate_ = nil
			arg_749_1.onSingleLineFinish_ = nil
			arg_749_1.state_ = "waiting"
		end

		function arg_749_1.playNext_(arg_751_0)
			if arg_751_0 == 1 then
				arg_749_0:Play1102805182(arg_749_1)
			end
		end

		function arg_749_1.onSingleLineUpdate_(arg_752_0)
			local var_752_0 = arg_749_1.actors_["1028ui_story"].transform
			local var_752_1 = 0

			if var_752_1 < arg_749_1.time_ and arg_749_1.time_ <= var_752_1 + arg_752_0 then
				arg_749_1.var_.moveOldPos1028ui_story = var_752_0.localPosition
			end

			local var_752_2 = 0.001

			if var_752_1 <= arg_749_1.time_ and arg_749_1.time_ < var_752_1 + var_752_2 then
				local var_752_3 = (arg_749_1.time_ - var_752_1) / var_752_2
				local var_752_4 = Vector3.New(0, 100, 0)

				var_752_0.localPosition = Vector3.Lerp(arg_749_1.var_.moveOldPos1028ui_story, var_752_4, var_752_3)

				local var_752_5 = manager.ui.mainCamera.transform.position - var_752_0.position

				var_752_0.forward = Vector3.New(var_752_5.x, var_752_5.y, var_752_5.z)

				local var_752_6 = var_752_0.localEulerAngles

				var_752_6.z = 0
				var_752_6.x = 0
				var_752_0.localEulerAngles = var_752_6
			end

			if arg_749_1.time_ >= var_752_1 + var_752_2 and arg_749_1.time_ < var_752_1 + var_752_2 + arg_752_0 then
				var_752_0.localPosition = Vector3.New(0, 100, 0)

				local var_752_7 = manager.ui.mainCamera.transform.position - var_752_0.position

				var_752_0.forward = Vector3.New(var_752_7.x, var_752_7.y, var_752_7.z)

				local var_752_8 = var_752_0.localEulerAngles

				var_752_8.z = 0
				var_752_8.x = 0
				var_752_0.localEulerAngles = var_752_8
			end

			local var_752_9 = arg_749_1.actors_["1028ui_story"]
			local var_752_10 = 0

			if var_752_10 < arg_749_1.time_ and arg_749_1.time_ <= var_752_10 + arg_752_0 and arg_749_1.var_.characterEffect1028ui_story == nil then
				arg_749_1.var_.characterEffect1028ui_story = var_752_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_752_11 = 0.200000002980232

			if var_752_10 <= arg_749_1.time_ and arg_749_1.time_ < var_752_10 + var_752_11 then
				local var_752_12 = (arg_749_1.time_ - var_752_10) / var_752_11

				if arg_749_1.var_.characterEffect1028ui_story then
					local var_752_13 = Mathf.Lerp(0, 0.5, var_752_12)

					arg_749_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_749_1.var_.characterEffect1028ui_story.fillRatio = var_752_13
				end
			end

			if arg_749_1.time_ >= var_752_10 + var_752_11 and arg_749_1.time_ < var_752_10 + var_752_11 + arg_752_0 and arg_749_1.var_.characterEffect1028ui_story then
				local var_752_14 = 0.5

				arg_749_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_749_1.var_.characterEffect1028ui_story.fillRatio = var_752_14
			end

			local var_752_15 = 0
			local var_752_16 = 0.9

			if var_752_15 < arg_749_1.time_ and arg_749_1.time_ <= var_752_15 + arg_752_0 then
				arg_749_1.talkMaxDuration = 0
				arg_749_1.dialogCg_.alpha = 1

				arg_749_1.dialog_:SetActive(true)
				SetActive(arg_749_1.leftNameGo_, false)

				arg_749_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_749_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_749_1:RecordName(arg_749_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_749_1.iconTrs_.gameObject, false)
				arg_749_1.callingController_:SetSelectedState("normal")

				local var_752_17 = arg_749_1:GetWordFromCfg(1102805181)
				local var_752_18 = arg_749_1:FormatText(var_752_17.content)

				arg_749_1.text_.text = var_752_18

				LuaForUtil.ClearLinePrefixSymbol(arg_749_1.text_)

				local var_752_19 = 36
				local var_752_20 = utf8.len(var_752_18)
				local var_752_21 = var_752_19 <= 0 and var_752_16 or var_752_16 * (var_752_20 / var_752_19)

				if var_752_21 > 0 and var_752_16 < var_752_21 then
					arg_749_1.talkMaxDuration = var_752_21

					if var_752_21 + var_752_15 > arg_749_1.duration_ then
						arg_749_1.duration_ = var_752_21 + var_752_15
					end
				end

				arg_749_1.text_.text = var_752_18
				arg_749_1.typewritter.percent = 0

				arg_749_1.typewritter:SetDirty()
				arg_749_1:ShowNextGo(false)
				arg_749_1:RecordContent(arg_749_1.text_.text)
			end

			local var_752_22 = math.max(var_752_16, arg_749_1.talkMaxDuration)

			if var_752_15 <= arg_749_1.time_ and arg_749_1.time_ < var_752_15 + var_752_22 then
				arg_749_1.typewritter.percent = (arg_749_1.time_ - var_752_15) / var_752_22

				arg_749_1.typewritter:SetDirty()
			end

			if arg_749_1.time_ >= var_752_15 + var_752_22 and arg_749_1.time_ < var_752_15 + var_752_22 + arg_752_0 then
				arg_749_1.typewritter.percent = 1

				arg_749_1.typewritter:SetDirty()
				arg_749_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805182 = function(arg_753_0, arg_753_1)
		arg_753_1.time_ = 0
		arg_753_1.frameCnt_ = 0
		arg_753_1.state_ = "playing"
		arg_753_1.curTalkId_ = 1102805182
		arg_753_1.duration_ = 5

		SetActive(arg_753_1.tipsGo_, false)

		function arg_753_1.onSingleLineFinish_()
			arg_753_1.onSingleLineUpdate_ = nil
			arg_753_1.onSingleLineFinish_ = nil
			arg_753_1.state_ = "waiting"
		end

		function arg_753_1.playNext_(arg_755_0)
			if arg_755_0 == 1 then
				arg_753_0:Play1102805183(arg_753_1)
			end
		end

		function arg_753_1.onSingleLineUpdate_(arg_756_0)
			local var_756_0 = 0
			local var_756_1 = 0.675

			if var_756_0 < arg_753_1.time_ and arg_753_1.time_ <= var_756_0 + arg_756_0 then
				arg_753_1.talkMaxDuration = 0
				arg_753_1.dialogCg_.alpha = 1

				arg_753_1.dialog_:SetActive(true)
				SetActive(arg_753_1.leftNameGo_, false)

				arg_753_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_753_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_753_1:RecordName(arg_753_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_753_1.iconTrs_.gameObject, false)
				arg_753_1.callingController_:SetSelectedState("normal")

				local var_756_2 = arg_753_1:GetWordFromCfg(1102805182)
				local var_756_3 = arg_753_1:FormatText(var_756_2.content)

				arg_753_1.text_.text = var_756_3

				LuaForUtil.ClearLinePrefixSymbol(arg_753_1.text_)

				local var_756_4 = 27
				local var_756_5 = utf8.len(var_756_3)
				local var_756_6 = var_756_4 <= 0 and var_756_1 or var_756_1 * (var_756_5 / var_756_4)

				if var_756_6 > 0 and var_756_1 < var_756_6 then
					arg_753_1.talkMaxDuration = var_756_6

					if var_756_6 + var_756_0 > arg_753_1.duration_ then
						arg_753_1.duration_ = var_756_6 + var_756_0
					end
				end

				arg_753_1.text_.text = var_756_3
				arg_753_1.typewritter.percent = 0

				arg_753_1.typewritter:SetDirty()
				arg_753_1:ShowNextGo(false)
				arg_753_1:RecordContent(arg_753_1.text_.text)
			end

			local var_756_7 = math.max(var_756_1, arg_753_1.talkMaxDuration)

			if var_756_0 <= arg_753_1.time_ and arg_753_1.time_ < var_756_0 + var_756_7 then
				arg_753_1.typewritter.percent = (arg_753_1.time_ - var_756_0) / var_756_7

				arg_753_1.typewritter:SetDirty()
			end

			if arg_753_1.time_ >= var_756_0 + var_756_7 and arg_753_1.time_ < var_756_0 + var_756_7 + arg_756_0 then
				arg_753_1.typewritter.percent = 1

				arg_753_1.typewritter:SetDirty()
				arg_753_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805183 = function(arg_757_0, arg_757_1)
		arg_757_1.time_ = 0
		arg_757_1.frameCnt_ = 0
		arg_757_1.state_ = "playing"
		arg_757_1.curTalkId_ = 1102805183
		arg_757_1.duration_ = 2.3

		SetActive(arg_757_1.tipsGo_, false)

		function arg_757_1.onSingleLineFinish_()
			arg_757_1.onSingleLineUpdate_ = nil
			arg_757_1.onSingleLineFinish_ = nil
			arg_757_1.state_ = "waiting"
		end

		function arg_757_1.playNext_(arg_759_0)
			if arg_759_0 == 1 then
				arg_757_0:Play1102805184(arg_757_1)
			end
		end

		function arg_757_1.onSingleLineUpdate_(arg_760_0)
			local var_760_0 = arg_757_1.actors_["1028ui_story"].transform
			local var_760_1 = 0

			if var_760_1 < arg_757_1.time_ and arg_757_1.time_ <= var_760_1 + arg_760_0 then
				arg_757_1.var_.moveOldPos1028ui_story = var_760_0.localPosition
			end

			local var_760_2 = 0.001

			if var_760_1 <= arg_757_1.time_ and arg_757_1.time_ < var_760_1 + var_760_2 then
				local var_760_3 = (arg_757_1.time_ - var_760_1) / var_760_2
				local var_760_4 = Vector3.New(0, -0.9, -5.9)

				var_760_0.localPosition = Vector3.Lerp(arg_757_1.var_.moveOldPos1028ui_story, var_760_4, var_760_3)

				local var_760_5 = manager.ui.mainCamera.transform.position - var_760_0.position

				var_760_0.forward = Vector3.New(var_760_5.x, var_760_5.y, var_760_5.z)

				local var_760_6 = var_760_0.localEulerAngles

				var_760_6.z = 0
				var_760_6.x = 0
				var_760_0.localEulerAngles = var_760_6
			end

			if arg_757_1.time_ >= var_760_1 + var_760_2 and arg_757_1.time_ < var_760_1 + var_760_2 + arg_760_0 then
				var_760_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_760_7 = manager.ui.mainCamera.transform.position - var_760_0.position

				var_760_0.forward = Vector3.New(var_760_7.x, var_760_7.y, var_760_7.z)

				local var_760_8 = var_760_0.localEulerAngles

				var_760_8.z = 0
				var_760_8.x = 0
				var_760_0.localEulerAngles = var_760_8
			end

			local var_760_9 = arg_757_1.actors_["1028ui_story"]
			local var_760_10 = 0

			if var_760_10 < arg_757_1.time_ and arg_757_1.time_ <= var_760_10 + arg_760_0 and arg_757_1.var_.characterEffect1028ui_story == nil then
				arg_757_1.var_.characterEffect1028ui_story = var_760_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_760_11 = 0.200000002980232

			if var_760_10 <= arg_757_1.time_ and arg_757_1.time_ < var_760_10 + var_760_11 then
				local var_760_12 = (arg_757_1.time_ - var_760_10) / var_760_11

				if arg_757_1.var_.characterEffect1028ui_story then
					arg_757_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_757_1.time_ >= var_760_10 + var_760_11 and arg_757_1.time_ < var_760_10 + var_760_11 + arg_760_0 and arg_757_1.var_.characterEffect1028ui_story then
				arg_757_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_760_13 = 0

			if var_760_13 < arg_757_1.time_ and arg_757_1.time_ <= var_760_13 + arg_760_0 then
				arg_757_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_760_14 = 0

			if var_760_14 < arg_757_1.time_ and arg_757_1.time_ <= var_760_14 + arg_760_0 then
				arg_757_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_760_15 = 0
			local var_760_16 = 0.075

			if var_760_15 < arg_757_1.time_ and arg_757_1.time_ <= var_760_15 + arg_760_0 then
				arg_757_1.talkMaxDuration = 0
				arg_757_1.dialogCg_.alpha = 1

				arg_757_1.dialog_:SetActive(true)
				SetActive(arg_757_1.leftNameGo_, true)

				local var_760_17 = arg_757_1:FormatText(StoryNameCfg[327].name)

				arg_757_1.leftNameTxt_.text = var_760_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_757_1.leftNameTxt_.transform)

				arg_757_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_757_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_757_1:RecordName(arg_757_1.leftNameTxt_.text)
				SetActive(arg_757_1.iconTrs_.gameObject, false)
				arg_757_1.callingController_:SetSelectedState("normal")

				local var_760_18 = arg_757_1:GetWordFromCfg(1102805183)
				local var_760_19 = arg_757_1:FormatText(var_760_18.content)

				arg_757_1.text_.text = var_760_19

				LuaForUtil.ClearLinePrefixSymbol(arg_757_1.text_)

				local var_760_20 = 3
				local var_760_21 = utf8.len(var_760_19)
				local var_760_22 = var_760_20 <= 0 and var_760_16 or var_760_16 * (var_760_21 / var_760_20)

				if var_760_22 > 0 and var_760_16 < var_760_22 then
					arg_757_1.talkMaxDuration = var_760_22

					if var_760_22 + var_760_15 > arg_757_1.duration_ then
						arg_757_1.duration_ = var_760_22 + var_760_15
					end
				end

				arg_757_1.text_.text = var_760_19
				arg_757_1.typewritter.percent = 0

				arg_757_1.typewritter:SetDirty()
				arg_757_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805183", "story_v_side_new_1102805.awb") ~= 0 then
					local var_760_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805183", "story_v_side_new_1102805.awb") / 1000

					if var_760_23 + var_760_15 > arg_757_1.duration_ then
						arg_757_1.duration_ = var_760_23 + var_760_15
					end

					if var_760_18.prefab_name ~= "" and arg_757_1.actors_[var_760_18.prefab_name] ~= nil then
						local var_760_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_757_1.actors_[var_760_18.prefab_name].transform, "story_v_side_new_1102805", "1102805183", "story_v_side_new_1102805.awb")

						arg_757_1:RecordAudio("1102805183", var_760_24)
						arg_757_1:RecordAudio("1102805183", var_760_24)
					else
						arg_757_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805183", "story_v_side_new_1102805.awb")
					end

					arg_757_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805183", "story_v_side_new_1102805.awb")
				end

				arg_757_1:RecordContent(arg_757_1.text_.text)
			end

			local var_760_25 = math.max(var_760_16, arg_757_1.talkMaxDuration)

			if var_760_15 <= arg_757_1.time_ and arg_757_1.time_ < var_760_15 + var_760_25 then
				arg_757_1.typewritter.percent = (arg_757_1.time_ - var_760_15) / var_760_25

				arg_757_1.typewritter:SetDirty()
			end

			if arg_757_1.time_ >= var_760_15 + var_760_25 and arg_757_1.time_ < var_760_15 + var_760_25 + arg_760_0 then
				arg_757_1.typewritter.percent = 1

				arg_757_1.typewritter:SetDirty()
				arg_757_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805184 = function(arg_761_0, arg_761_1)
		arg_761_1.time_ = 0
		arg_761_1.frameCnt_ = 0
		arg_761_1.state_ = "playing"
		arg_761_1.curTalkId_ = 1102805184
		arg_761_1.duration_ = 5

		SetActive(arg_761_1.tipsGo_, false)

		function arg_761_1.onSingleLineFinish_()
			arg_761_1.onSingleLineUpdate_ = nil
			arg_761_1.onSingleLineFinish_ = nil
			arg_761_1.state_ = "waiting"
		end

		function arg_761_1.playNext_(arg_763_0)
			if arg_763_0 == 1 then
				arg_761_0:Play1102805185(arg_761_1)
			end
		end

		function arg_761_1.onSingleLineUpdate_(arg_764_0)
			local var_764_0 = arg_761_1.actors_["1028ui_story"].transform
			local var_764_1 = 0

			if var_764_1 < arg_761_1.time_ and arg_761_1.time_ <= var_764_1 + arg_764_0 then
				arg_761_1.var_.moveOldPos1028ui_story = var_764_0.localPosition
			end

			local var_764_2 = 0.001

			if var_764_1 <= arg_761_1.time_ and arg_761_1.time_ < var_764_1 + var_764_2 then
				local var_764_3 = (arg_761_1.time_ - var_764_1) / var_764_2
				local var_764_4 = Vector3.New(0, 100, 0)

				var_764_0.localPosition = Vector3.Lerp(arg_761_1.var_.moveOldPos1028ui_story, var_764_4, var_764_3)

				local var_764_5 = manager.ui.mainCamera.transform.position - var_764_0.position

				var_764_0.forward = Vector3.New(var_764_5.x, var_764_5.y, var_764_5.z)

				local var_764_6 = var_764_0.localEulerAngles

				var_764_6.z = 0
				var_764_6.x = 0
				var_764_0.localEulerAngles = var_764_6
			end

			if arg_761_1.time_ >= var_764_1 + var_764_2 and arg_761_1.time_ < var_764_1 + var_764_2 + arg_764_0 then
				var_764_0.localPosition = Vector3.New(0, 100, 0)

				local var_764_7 = manager.ui.mainCamera.transform.position - var_764_0.position

				var_764_0.forward = Vector3.New(var_764_7.x, var_764_7.y, var_764_7.z)

				local var_764_8 = var_764_0.localEulerAngles

				var_764_8.z = 0
				var_764_8.x = 0
				var_764_0.localEulerAngles = var_764_8
			end

			local var_764_9 = arg_761_1.actors_["1028ui_story"]
			local var_764_10 = 0

			if var_764_10 < arg_761_1.time_ and arg_761_1.time_ <= var_764_10 + arg_764_0 and arg_761_1.var_.characterEffect1028ui_story == nil then
				arg_761_1.var_.characterEffect1028ui_story = var_764_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_764_11 = 0.200000002980232

			if var_764_10 <= arg_761_1.time_ and arg_761_1.time_ < var_764_10 + var_764_11 then
				local var_764_12 = (arg_761_1.time_ - var_764_10) / var_764_11

				if arg_761_1.var_.characterEffect1028ui_story then
					local var_764_13 = Mathf.Lerp(0, 0.5, var_764_12)

					arg_761_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_761_1.var_.characterEffect1028ui_story.fillRatio = var_764_13
				end
			end

			if arg_761_1.time_ >= var_764_10 + var_764_11 and arg_761_1.time_ < var_764_10 + var_764_11 + arg_764_0 and arg_761_1.var_.characterEffect1028ui_story then
				local var_764_14 = 0.5

				arg_761_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_761_1.var_.characterEffect1028ui_story.fillRatio = var_764_14
			end

			local var_764_15 = 0

			if var_764_15 < arg_761_1.time_ and arg_761_1.time_ <= var_764_15 + arg_764_0 then
				arg_761_1.mask_.enabled = true
				arg_761_1.mask_.raycastTarget = true

				arg_761_1:SetGaussion(false)
			end

			local var_764_16 = 1

			if var_764_15 <= arg_761_1.time_ and arg_761_1.time_ < var_764_15 + var_764_16 then
				local var_764_17 = (arg_761_1.time_ - var_764_15) / var_764_16
				local var_764_18 = Color.New(1, 0, 0)

				var_764_18.a = Mathf.Lerp(1, 0, var_764_17)
				arg_761_1.mask_.color = var_764_18
			end

			if arg_761_1.time_ >= var_764_15 + var_764_16 and arg_761_1.time_ < var_764_15 + var_764_16 + arg_764_0 then
				local var_764_19 = Color.New(1, 0, 0)
				local var_764_20 = 0

				arg_761_1.mask_.enabled = false
				var_764_19.a = var_764_20
				arg_761_1.mask_.color = var_764_19
			end

			local var_764_21 = 0
			local var_764_22 = 0.85

			if var_764_21 < arg_761_1.time_ and arg_761_1.time_ <= var_764_21 + arg_764_0 then
				arg_761_1.talkMaxDuration = 0

				arg_761_1.dialog_:SetActive(true)

				local var_764_23 = LeanTween.value(arg_761_1.dialog_, 0, 1, 0.3)

				var_764_23:setOnUpdate(LuaHelper.FloatAction(function(arg_765_0)
					arg_761_1.dialogCg_.alpha = arg_765_0
				end))
				var_764_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_761_1.dialog_)
					var_764_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_761_1.duration_ = arg_761_1.duration_ + 0.3

				SetActive(arg_761_1.leftNameGo_, false)

				arg_761_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_761_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_761_1:RecordName(arg_761_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_761_1.iconTrs_.gameObject, false)
				arg_761_1.callingController_:SetSelectedState("normal")

				local var_764_24 = arg_761_1:GetWordFromCfg(1102805184)
				local var_764_25 = arg_761_1:FormatText(var_764_24.content)

				arg_761_1.text_.text = var_764_25

				LuaForUtil.ClearLinePrefixSymbol(arg_761_1.text_)

				local var_764_26 = 34
				local var_764_27 = utf8.len(var_764_25)
				local var_764_28 = var_764_26 <= 0 and var_764_22 or var_764_22 * (var_764_27 / var_764_26)

				if var_764_28 > 0 and var_764_22 < var_764_28 then
					arg_761_1.talkMaxDuration = var_764_28
					var_764_21 = var_764_21 + 0.3

					if var_764_28 + var_764_21 > arg_761_1.duration_ then
						arg_761_1.duration_ = var_764_28 + var_764_21
					end
				end

				arg_761_1.text_.text = var_764_25
				arg_761_1.typewritter.percent = 0

				arg_761_1.typewritter:SetDirty()
				arg_761_1:ShowNextGo(false)
				arg_761_1:RecordContent(arg_761_1.text_.text)
			end

			local var_764_29 = var_764_21 + 0.3
			local var_764_30 = math.max(var_764_22, arg_761_1.talkMaxDuration)

			if var_764_29 <= arg_761_1.time_ and arg_761_1.time_ < var_764_29 + var_764_30 then
				arg_761_1.typewritter.percent = (arg_761_1.time_ - var_764_29) / var_764_30

				arg_761_1.typewritter:SetDirty()
			end

			if arg_761_1.time_ >= var_764_29 + var_764_30 and arg_761_1.time_ < var_764_29 + var_764_30 + arg_764_0 then
				arg_761_1.typewritter.percent = 1

				arg_761_1.typewritter:SetDirty()
				arg_761_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805185 = function(arg_767_0, arg_767_1)
		arg_767_1.time_ = 0
		arg_767_1.frameCnt_ = 0
		arg_767_1.state_ = "playing"
		arg_767_1.curTalkId_ = 1102805185
		arg_767_1.duration_ = 5

		SetActive(arg_767_1.tipsGo_, false)

		function arg_767_1.onSingleLineFinish_()
			arg_767_1.onSingleLineUpdate_ = nil
			arg_767_1.onSingleLineFinish_ = nil
			arg_767_1.state_ = "waiting"
		end

		function arg_767_1.playNext_(arg_769_0)
			if arg_769_0 == 1 then
				arg_767_0:Play1102805186(arg_767_1)
			end
		end

		function arg_767_1.onSingleLineUpdate_(arg_770_0)
			local var_770_0 = 0
			local var_770_1 = 0.725

			if var_770_0 < arg_767_1.time_ and arg_767_1.time_ <= var_770_0 + arg_770_0 then
				arg_767_1.talkMaxDuration = 0
				arg_767_1.dialogCg_.alpha = 1

				arg_767_1.dialog_:SetActive(true)
				SetActive(arg_767_1.leftNameGo_, false)

				arg_767_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_767_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_767_1:RecordName(arg_767_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_767_1.iconTrs_.gameObject, false)
				arg_767_1.callingController_:SetSelectedState("normal")

				local var_770_2 = arg_767_1:GetWordFromCfg(1102805185)
				local var_770_3 = arg_767_1:FormatText(var_770_2.content)

				arg_767_1.text_.text = var_770_3

				LuaForUtil.ClearLinePrefixSymbol(arg_767_1.text_)

				local var_770_4 = 29
				local var_770_5 = utf8.len(var_770_3)
				local var_770_6 = var_770_4 <= 0 and var_770_1 or var_770_1 * (var_770_5 / var_770_4)

				if var_770_6 > 0 and var_770_1 < var_770_6 then
					arg_767_1.talkMaxDuration = var_770_6

					if var_770_6 + var_770_0 > arg_767_1.duration_ then
						arg_767_1.duration_ = var_770_6 + var_770_0
					end
				end

				arg_767_1.text_.text = var_770_3
				arg_767_1.typewritter.percent = 0

				arg_767_1.typewritter:SetDirty()
				arg_767_1:ShowNextGo(false)
				arg_767_1:RecordContent(arg_767_1.text_.text)
			end

			local var_770_7 = math.max(var_770_1, arg_767_1.talkMaxDuration)

			if var_770_0 <= arg_767_1.time_ and arg_767_1.time_ < var_770_0 + var_770_7 then
				arg_767_1.typewritter.percent = (arg_767_1.time_ - var_770_0) / var_770_7

				arg_767_1.typewritter:SetDirty()
			end

			if arg_767_1.time_ >= var_770_0 + var_770_7 and arg_767_1.time_ < var_770_0 + var_770_7 + arg_770_0 then
				arg_767_1.typewritter.percent = 1

				arg_767_1.typewritter:SetDirty()
				arg_767_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805186 = function(arg_771_0, arg_771_1)
		arg_771_1.time_ = 0
		arg_771_1.frameCnt_ = 0
		arg_771_1.state_ = "playing"
		arg_771_1.curTalkId_ = 1102805186
		arg_771_1.duration_ = 5

		SetActive(arg_771_1.tipsGo_, false)

		function arg_771_1.onSingleLineFinish_()
			arg_771_1.onSingleLineUpdate_ = nil
			arg_771_1.onSingleLineFinish_ = nil
			arg_771_1.state_ = "waiting"
		end

		function arg_771_1.playNext_(arg_773_0)
			if arg_773_0 == 1 then
				arg_771_0:Play1102805187(arg_771_1)
			end
		end

		function arg_771_1.onSingleLineUpdate_(arg_774_0)
			local var_774_0 = 0
			local var_774_1 = 0.15

			if var_774_0 < arg_771_1.time_ and arg_771_1.time_ <= var_774_0 + arg_774_0 then
				arg_771_1.talkMaxDuration = 0
				arg_771_1.dialogCg_.alpha = 1

				arg_771_1.dialog_:SetActive(true)
				SetActive(arg_771_1.leftNameGo_, true)

				local var_774_2 = arg_771_1:FormatText(StoryNameCfg[7].name)

				arg_771_1.leftNameTxt_.text = var_774_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_771_1.leftNameTxt_.transform)

				arg_771_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_771_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_771_1:RecordName(arg_771_1.leftNameTxt_.text)
				SetActive(arg_771_1.iconTrs_.gameObject, false)
				arg_771_1.callingController_:SetSelectedState("normal")

				local var_774_3 = arg_771_1:GetWordFromCfg(1102805186)
				local var_774_4 = arg_771_1:FormatText(var_774_3.content)

				arg_771_1.text_.text = var_774_4

				LuaForUtil.ClearLinePrefixSymbol(arg_771_1.text_)

				local var_774_5 = 6
				local var_774_6 = utf8.len(var_774_4)
				local var_774_7 = var_774_5 <= 0 and var_774_1 or var_774_1 * (var_774_6 / var_774_5)

				if var_774_7 > 0 and var_774_1 < var_774_7 then
					arg_771_1.talkMaxDuration = var_774_7

					if var_774_7 + var_774_0 > arg_771_1.duration_ then
						arg_771_1.duration_ = var_774_7 + var_774_0
					end
				end

				arg_771_1.text_.text = var_774_4
				arg_771_1.typewritter.percent = 0

				arg_771_1.typewritter:SetDirty()
				arg_771_1:ShowNextGo(false)
				arg_771_1:RecordContent(arg_771_1.text_.text)
			end

			local var_774_8 = math.max(var_774_1, arg_771_1.talkMaxDuration)

			if var_774_0 <= arg_771_1.time_ and arg_771_1.time_ < var_774_0 + var_774_8 then
				arg_771_1.typewritter.percent = (arg_771_1.time_ - var_774_0) / var_774_8

				arg_771_1.typewritter:SetDirty()
			end

			if arg_771_1.time_ >= var_774_0 + var_774_8 and arg_771_1.time_ < var_774_0 + var_774_8 + arg_774_0 then
				arg_771_1.typewritter.percent = 1

				arg_771_1.typewritter:SetDirty()
				arg_771_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805187 = function(arg_775_0, arg_775_1)
		arg_775_1.time_ = 0
		arg_775_1.frameCnt_ = 0
		arg_775_1.state_ = "playing"
		arg_775_1.curTalkId_ = 1102805187
		arg_775_1.duration_ = 4.666

		SetActive(arg_775_1.tipsGo_, false)

		function arg_775_1.onSingleLineFinish_()
			arg_775_1.onSingleLineUpdate_ = nil
			arg_775_1.onSingleLineFinish_ = nil
			arg_775_1.state_ = "waiting"
		end

		function arg_775_1.playNext_(arg_777_0)
			if arg_777_0 == 1 then
				arg_775_0:Play1102805188(arg_775_1)
			end
		end

		function arg_775_1.onSingleLineUpdate_(arg_778_0)
			local var_778_0 = 0
			local var_778_1 = 0.3

			if var_778_0 < arg_775_1.time_ and arg_775_1.time_ <= var_778_0 + arg_778_0 then
				arg_775_1.talkMaxDuration = 0
				arg_775_1.dialogCg_.alpha = 1

				arg_775_1.dialog_:SetActive(true)
				SetActive(arg_775_1.leftNameGo_, true)

				local var_778_2 = arg_775_1:FormatText(StoryNameCfg[327].name)

				arg_775_1.leftNameTxt_.text = var_778_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_775_1.leftNameTxt_.transform)

				arg_775_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_775_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_775_1:RecordName(arg_775_1.leftNameTxt_.text)
				SetActive(arg_775_1.iconTrs_.gameObject, true)
				arg_775_1.iconController_:SetSelectedState("hero")

				arg_775_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1028")

				arg_775_1.callingController_:SetSelectedState("normal")

				local var_778_3 = arg_775_1:GetWordFromCfg(1102805187)
				local var_778_4 = arg_775_1:FormatText(var_778_3.content)

				arg_775_1.text_.text = var_778_4

				LuaForUtil.ClearLinePrefixSymbol(arg_775_1.text_)

				local var_778_5 = 12
				local var_778_6 = utf8.len(var_778_4)
				local var_778_7 = var_778_5 <= 0 and var_778_1 or var_778_1 * (var_778_6 / var_778_5)

				if var_778_7 > 0 and var_778_1 < var_778_7 then
					arg_775_1.talkMaxDuration = var_778_7

					if var_778_7 + var_778_0 > arg_775_1.duration_ then
						arg_775_1.duration_ = var_778_7 + var_778_0
					end
				end

				arg_775_1.text_.text = var_778_4
				arg_775_1.typewritter.percent = 0

				arg_775_1.typewritter:SetDirty()
				arg_775_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805187", "story_v_side_new_1102805.awb") ~= 0 then
					local var_778_8 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805187", "story_v_side_new_1102805.awb") / 1000

					if var_778_8 + var_778_0 > arg_775_1.duration_ then
						arg_775_1.duration_ = var_778_8 + var_778_0
					end

					if var_778_3.prefab_name ~= "" and arg_775_1.actors_[var_778_3.prefab_name] ~= nil then
						local var_778_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_775_1.actors_[var_778_3.prefab_name].transform, "story_v_side_new_1102805", "1102805187", "story_v_side_new_1102805.awb")

						arg_775_1:RecordAudio("1102805187", var_778_9)
						arg_775_1:RecordAudio("1102805187", var_778_9)
					else
						arg_775_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805187", "story_v_side_new_1102805.awb")
					end

					arg_775_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805187", "story_v_side_new_1102805.awb")
				end

				arg_775_1:RecordContent(arg_775_1.text_.text)
			end

			local var_778_10 = math.max(var_778_1, arg_775_1.talkMaxDuration)

			if var_778_0 <= arg_775_1.time_ and arg_775_1.time_ < var_778_0 + var_778_10 then
				arg_775_1.typewritter.percent = (arg_775_1.time_ - var_778_0) / var_778_10

				arg_775_1.typewritter:SetDirty()
			end

			if arg_775_1.time_ >= var_778_0 + var_778_10 and arg_775_1.time_ < var_778_0 + var_778_10 + arg_778_0 then
				arg_775_1.typewritter.percent = 1

				arg_775_1.typewritter:SetDirty()
				arg_775_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805188 = function(arg_779_0, arg_779_1)
		arg_779_1.time_ = 0
		arg_779_1.frameCnt_ = 0
		arg_779_1.state_ = "playing"
		arg_779_1.curTalkId_ = 1102805188
		arg_779_1.duration_ = 5

		SetActive(arg_779_1.tipsGo_, false)

		function arg_779_1.onSingleLineFinish_()
			arg_779_1.onSingleLineUpdate_ = nil
			arg_779_1.onSingleLineFinish_ = nil
			arg_779_1.state_ = "waiting"
		end

		function arg_779_1.playNext_(arg_781_0)
			if arg_781_0 == 1 then
				arg_779_0:Play1102805189(arg_779_1)
			end
		end

		function arg_779_1.onSingleLineUpdate_(arg_782_0)
			local var_782_0 = arg_779_1.actors_["1028ui_story"].transform
			local var_782_1 = 0

			if var_782_1 < arg_779_1.time_ and arg_779_1.time_ <= var_782_1 + arg_782_0 then
				arg_779_1.var_.moveOldPos1028ui_story = var_782_0.localPosition
			end

			local var_782_2 = 0.001

			if var_782_1 <= arg_779_1.time_ and arg_779_1.time_ < var_782_1 + var_782_2 then
				local var_782_3 = (arg_779_1.time_ - var_782_1) / var_782_2
				local var_782_4 = Vector3.New(0, 100, 0)

				var_782_0.localPosition = Vector3.Lerp(arg_779_1.var_.moveOldPos1028ui_story, var_782_4, var_782_3)

				local var_782_5 = manager.ui.mainCamera.transform.position - var_782_0.position

				var_782_0.forward = Vector3.New(var_782_5.x, var_782_5.y, var_782_5.z)

				local var_782_6 = var_782_0.localEulerAngles

				var_782_6.z = 0
				var_782_6.x = 0
				var_782_0.localEulerAngles = var_782_6
			end

			if arg_779_1.time_ >= var_782_1 + var_782_2 and arg_779_1.time_ < var_782_1 + var_782_2 + arg_782_0 then
				var_782_0.localPosition = Vector3.New(0, 100, 0)

				local var_782_7 = manager.ui.mainCamera.transform.position - var_782_0.position

				var_782_0.forward = Vector3.New(var_782_7.x, var_782_7.y, var_782_7.z)

				local var_782_8 = var_782_0.localEulerAngles

				var_782_8.z = 0
				var_782_8.x = 0
				var_782_0.localEulerAngles = var_782_8
			end

			local var_782_9 = arg_779_1.actors_["1028ui_story"]
			local var_782_10 = 0

			if var_782_10 < arg_779_1.time_ and arg_779_1.time_ <= var_782_10 + arg_782_0 and arg_779_1.var_.characterEffect1028ui_story == nil then
				arg_779_1.var_.characterEffect1028ui_story = var_782_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_782_11 = 0.200000002980232

			if var_782_10 <= arg_779_1.time_ and arg_779_1.time_ < var_782_10 + var_782_11 then
				local var_782_12 = (arg_779_1.time_ - var_782_10) / var_782_11

				if arg_779_1.var_.characterEffect1028ui_story then
					local var_782_13 = Mathf.Lerp(0, 0.5, var_782_12)

					arg_779_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_779_1.var_.characterEffect1028ui_story.fillRatio = var_782_13
				end
			end

			if arg_779_1.time_ >= var_782_10 + var_782_11 and arg_779_1.time_ < var_782_10 + var_782_11 + arg_782_0 and arg_779_1.var_.characterEffect1028ui_story then
				local var_782_14 = 0.5

				arg_779_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_779_1.var_.characterEffect1028ui_story.fillRatio = var_782_14
			end

			local var_782_15 = 0
			local var_782_16 = 0.575

			if var_782_15 < arg_779_1.time_ and arg_779_1.time_ <= var_782_15 + arg_782_0 then
				arg_779_1.talkMaxDuration = 0
				arg_779_1.dialogCg_.alpha = 1

				arg_779_1.dialog_:SetActive(true)
				SetActive(arg_779_1.leftNameGo_, false)

				arg_779_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_779_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_779_1:RecordName(arg_779_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_779_1.iconTrs_.gameObject, false)
				arg_779_1.callingController_:SetSelectedState("normal")

				local var_782_17 = arg_779_1:GetWordFromCfg(1102805188)
				local var_782_18 = arg_779_1:FormatText(var_782_17.content)

				arg_779_1.text_.text = var_782_18

				LuaForUtil.ClearLinePrefixSymbol(arg_779_1.text_)

				local var_782_19 = 23
				local var_782_20 = utf8.len(var_782_18)
				local var_782_21 = var_782_19 <= 0 and var_782_16 or var_782_16 * (var_782_20 / var_782_19)

				if var_782_21 > 0 and var_782_16 < var_782_21 then
					arg_779_1.talkMaxDuration = var_782_21

					if var_782_21 + var_782_15 > arg_779_1.duration_ then
						arg_779_1.duration_ = var_782_21 + var_782_15
					end
				end

				arg_779_1.text_.text = var_782_18
				arg_779_1.typewritter.percent = 0

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(false)
				arg_779_1:RecordContent(arg_779_1.text_.text)
			end

			local var_782_22 = math.max(var_782_16, arg_779_1.talkMaxDuration)

			if var_782_15 <= arg_779_1.time_ and arg_779_1.time_ < var_782_15 + var_782_22 then
				arg_779_1.typewritter.percent = (arg_779_1.time_ - var_782_15) / var_782_22

				arg_779_1.typewritter:SetDirty()
			end

			if arg_779_1.time_ >= var_782_15 + var_782_22 and arg_779_1.time_ < var_782_15 + var_782_22 + arg_782_0 then
				arg_779_1.typewritter.percent = 1

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805189 = function(arg_783_0, arg_783_1)
		arg_783_1.time_ = 0
		arg_783_1.frameCnt_ = 0
		arg_783_1.state_ = "playing"
		arg_783_1.curTalkId_ = 1102805189
		arg_783_1.duration_ = 5

		SetActive(arg_783_1.tipsGo_, false)

		function arg_783_1.onSingleLineFinish_()
			arg_783_1.onSingleLineUpdate_ = nil
			arg_783_1.onSingleLineFinish_ = nil
			arg_783_1.state_ = "waiting"
		end

		function arg_783_1.playNext_(arg_785_0)
			if arg_785_0 == 1 then
				arg_783_0:Play1102805190(arg_783_1)
			end
		end

		function arg_783_1.onSingleLineUpdate_(arg_786_0)
			local var_786_0 = manager.ui.mainCamera.transform
			local var_786_1 = 0

			if var_786_1 < arg_783_1.time_ and arg_783_1.time_ <= var_786_1 + arg_786_0 then
				arg_783_1.var_.shakeOldPos = var_786_0.localPosition
			end

			local var_786_2 = 0.5

			if var_786_1 <= arg_783_1.time_ and arg_783_1.time_ < var_786_1 + var_786_2 then
				local var_786_3 = (arg_783_1.time_ - var_786_1) / 0.066
				local var_786_4, var_786_5 = math.modf(var_786_3)

				var_786_0.localPosition = Vector3.New(var_786_5 * 0.13, var_786_5 * 0.13, var_786_5 * 0.13) + arg_783_1.var_.shakeOldPos
			end

			if arg_783_1.time_ >= var_786_1 + var_786_2 and arg_783_1.time_ < var_786_1 + var_786_2 + arg_786_0 then
				var_786_0.localPosition = arg_783_1.var_.shakeOldPos
			end

			local var_786_6 = manager.ui.mainCamera.transform
			local var_786_7 = 1

			if var_786_7 < arg_783_1.time_ and arg_783_1.time_ <= var_786_7 + arg_786_0 then
				arg_783_1.var_.shakeOldPos = var_786_6.localPosition
			end

			local var_786_8 = 0.5

			if var_786_7 <= arg_783_1.time_ and arg_783_1.time_ < var_786_7 + var_786_8 then
				local var_786_9 = (arg_783_1.time_ - var_786_7) / 0.066
				local var_786_10, var_786_11 = math.modf(var_786_9)

				var_786_6.localPosition = Vector3.New(var_786_11 * 0.13, var_786_11 * 0.13, var_786_11 * 0.13) + arg_783_1.var_.shakeOldPos
			end

			if arg_783_1.time_ >= var_786_7 + var_786_8 and arg_783_1.time_ < var_786_7 + var_786_8 + arg_786_0 then
				var_786_6.localPosition = arg_783_1.var_.shakeOldPos
			end

			local var_786_12 = 0
			local var_786_13 = 0.8

			if var_786_12 < arg_783_1.time_ and arg_783_1.time_ <= var_786_12 + arg_786_0 then
				arg_783_1.talkMaxDuration = 0
				arg_783_1.dialogCg_.alpha = 1

				arg_783_1.dialog_:SetActive(true)
				SetActive(arg_783_1.leftNameGo_, false)

				arg_783_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_783_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_783_1:RecordName(arg_783_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_783_1.iconTrs_.gameObject, false)
				arg_783_1.callingController_:SetSelectedState("normal")

				local var_786_14 = arg_783_1:GetWordFromCfg(1102805189)
				local var_786_15 = arg_783_1:FormatText(var_786_14.content)

				arg_783_1.text_.text = var_786_15

				LuaForUtil.ClearLinePrefixSymbol(arg_783_1.text_)

				local var_786_16 = 32
				local var_786_17 = utf8.len(var_786_15)
				local var_786_18 = var_786_16 <= 0 and var_786_13 or var_786_13 * (var_786_17 / var_786_16)

				if var_786_18 > 0 and var_786_13 < var_786_18 then
					arg_783_1.talkMaxDuration = var_786_18

					if var_786_18 + var_786_12 > arg_783_1.duration_ then
						arg_783_1.duration_ = var_786_18 + var_786_12
					end
				end

				arg_783_1.text_.text = var_786_15
				arg_783_1.typewritter.percent = 0

				arg_783_1.typewritter:SetDirty()
				arg_783_1:ShowNextGo(false)
				arg_783_1:RecordContent(arg_783_1.text_.text)
			end

			local var_786_19 = math.max(var_786_13, arg_783_1.talkMaxDuration)

			if var_786_12 <= arg_783_1.time_ and arg_783_1.time_ < var_786_12 + var_786_19 then
				arg_783_1.typewritter.percent = (arg_783_1.time_ - var_786_12) / var_786_19

				arg_783_1.typewritter:SetDirty()
			end

			if arg_783_1.time_ >= var_786_12 + var_786_19 and arg_783_1.time_ < var_786_12 + var_786_19 + arg_786_0 then
				arg_783_1.typewritter.percent = 1

				arg_783_1.typewritter:SetDirty()
				arg_783_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805190 = function(arg_787_0, arg_787_1)
		arg_787_1.time_ = 0
		arg_787_1.frameCnt_ = 0
		arg_787_1.state_ = "playing"
		arg_787_1.curTalkId_ = 1102805190
		arg_787_1.duration_ = 5

		SetActive(arg_787_1.tipsGo_, false)

		function arg_787_1.onSingleLineFinish_()
			arg_787_1.onSingleLineUpdate_ = nil
			arg_787_1.onSingleLineFinish_ = nil
			arg_787_1.state_ = "waiting"
		end

		function arg_787_1.playNext_(arg_789_0)
			if arg_789_0 == 1 then
				arg_787_0:Play1102805191(arg_787_1)
			end
		end

		function arg_787_1.onSingleLineUpdate_(arg_790_0)
			local var_790_0 = 0
			local var_790_1 = 0.875

			if var_790_0 < arg_787_1.time_ and arg_787_1.time_ <= var_790_0 + arg_790_0 then
				arg_787_1.talkMaxDuration = 0
				arg_787_1.dialogCg_.alpha = 1

				arg_787_1.dialog_:SetActive(true)
				SetActive(arg_787_1.leftNameGo_, false)

				arg_787_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_787_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_787_1:RecordName(arg_787_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_787_1.iconTrs_.gameObject, false)
				arg_787_1.callingController_:SetSelectedState("normal")

				local var_790_2 = arg_787_1:GetWordFromCfg(1102805190)
				local var_790_3 = arg_787_1:FormatText(var_790_2.content)

				arg_787_1.text_.text = var_790_3

				LuaForUtil.ClearLinePrefixSymbol(arg_787_1.text_)

				local var_790_4 = 35
				local var_790_5 = utf8.len(var_790_3)
				local var_790_6 = var_790_4 <= 0 and var_790_1 or var_790_1 * (var_790_5 / var_790_4)

				if var_790_6 > 0 and var_790_1 < var_790_6 then
					arg_787_1.talkMaxDuration = var_790_6

					if var_790_6 + var_790_0 > arg_787_1.duration_ then
						arg_787_1.duration_ = var_790_6 + var_790_0
					end
				end

				arg_787_1.text_.text = var_790_3
				arg_787_1.typewritter.percent = 0

				arg_787_1.typewritter:SetDirty()
				arg_787_1:ShowNextGo(false)
				arg_787_1:RecordContent(arg_787_1.text_.text)
			end

			local var_790_7 = math.max(var_790_1, arg_787_1.talkMaxDuration)

			if var_790_0 <= arg_787_1.time_ and arg_787_1.time_ < var_790_0 + var_790_7 then
				arg_787_1.typewritter.percent = (arg_787_1.time_ - var_790_0) / var_790_7

				arg_787_1.typewritter:SetDirty()
			end

			if arg_787_1.time_ >= var_790_0 + var_790_7 and arg_787_1.time_ < var_790_0 + var_790_7 + arg_790_0 then
				arg_787_1.typewritter.percent = 1

				arg_787_1.typewritter:SetDirty()
				arg_787_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805191 = function(arg_791_0, arg_791_1)
		arg_791_1.time_ = 0
		arg_791_1.frameCnt_ = 0
		arg_791_1.state_ = "playing"
		arg_791_1.curTalkId_ = 1102805191
		arg_791_1.duration_ = 5

		SetActive(arg_791_1.tipsGo_, false)

		function arg_791_1.onSingleLineFinish_()
			arg_791_1.onSingleLineUpdate_ = nil
			arg_791_1.onSingleLineFinish_ = nil
			arg_791_1.state_ = "waiting"
		end

		function arg_791_1.playNext_(arg_793_0)
			if arg_793_0 == 1 then
				arg_791_0:Play1102805192(arg_791_1)
			end
		end

		function arg_791_1.onSingleLineUpdate_(arg_794_0)
			local var_794_0 = 0
			local var_794_1 = 0.1

			if var_794_0 < arg_791_1.time_ and arg_791_1.time_ <= var_794_0 + arg_794_0 then
				arg_791_1.talkMaxDuration = 0
				arg_791_1.dialogCg_.alpha = 1

				arg_791_1.dialog_:SetActive(true)
				SetActive(arg_791_1.leftNameGo_, true)

				local var_794_2 = arg_791_1:FormatText(StoryNameCfg[7].name)

				arg_791_1.leftNameTxt_.text = var_794_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_791_1.leftNameTxt_.transform)

				arg_791_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_791_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_791_1:RecordName(arg_791_1.leftNameTxt_.text)
				SetActive(arg_791_1.iconTrs_.gameObject, false)
				arg_791_1.callingController_:SetSelectedState("normal")

				local var_794_3 = arg_791_1:GetWordFromCfg(1102805191)
				local var_794_4 = arg_791_1:FormatText(var_794_3.content)

				arg_791_1.text_.text = var_794_4

				LuaForUtil.ClearLinePrefixSymbol(arg_791_1.text_)

				local var_794_5 = 4
				local var_794_6 = utf8.len(var_794_4)
				local var_794_7 = var_794_5 <= 0 and var_794_1 or var_794_1 * (var_794_6 / var_794_5)

				if var_794_7 > 0 and var_794_1 < var_794_7 then
					arg_791_1.talkMaxDuration = var_794_7

					if var_794_7 + var_794_0 > arg_791_1.duration_ then
						arg_791_1.duration_ = var_794_7 + var_794_0
					end
				end

				arg_791_1.text_.text = var_794_4
				arg_791_1.typewritter.percent = 0

				arg_791_1.typewritter:SetDirty()
				arg_791_1:ShowNextGo(false)
				arg_791_1:RecordContent(arg_791_1.text_.text)
			end

			local var_794_8 = math.max(var_794_1, arg_791_1.talkMaxDuration)

			if var_794_0 <= arg_791_1.time_ and arg_791_1.time_ < var_794_0 + var_794_8 then
				arg_791_1.typewritter.percent = (arg_791_1.time_ - var_794_0) / var_794_8

				arg_791_1.typewritter:SetDirty()
			end

			if arg_791_1.time_ >= var_794_0 + var_794_8 and arg_791_1.time_ < var_794_0 + var_794_8 + arg_794_0 then
				arg_791_1.typewritter.percent = 1

				arg_791_1.typewritter:SetDirty()
				arg_791_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805192 = function(arg_795_0, arg_795_1)
		arg_795_1.time_ = 0
		arg_795_1.frameCnt_ = 0
		arg_795_1.state_ = "playing"
		arg_795_1.curTalkId_ = 1102805192
		arg_795_1.duration_ = 5

		SetActive(arg_795_1.tipsGo_, false)

		function arg_795_1.onSingleLineFinish_()
			arg_795_1.onSingleLineUpdate_ = nil
			arg_795_1.onSingleLineFinish_ = nil
			arg_795_1.state_ = "waiting"
		end

		function arg_795_1.playNext_(arg_797_0)
			if arg_797_0 == 1 then
				arg_795_0:Play1102805193(arg_795_1)
			end
		end

		function arg_795_1.onSingleLineUpdate_(arg_798_0)
			local var_798_0 = 0
			local var_798_1 = 0.8

			if var_798_0 < arg_795_1.time_ and arg_795_1.time_ <= var_798_0 + arg_798_0 then
				arg_795_1.talkMaxDuration = 0
				arg_795_1.dialogCg_.alpha = 1

				arg_795_1.dialog_:SetActive(true)
				SetActive(arg_795_1.leftNameGo_, false)

				arg_795_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_795_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_795_1:RecordName(arg_795_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_795_1.iconTrs_.gameObject, false)
				arg_795_1.callingController_:SetSelectedState("normal")

				local var_798_2 = arg_795_1:GetWordFromCfg(1102805192)
				local var_798_3 = arg_795_1:FormatText(var_798_2.content)

				arg_795_1.text_.text = var_798_3

				LuaForUtil.ClearLinePrefixSymbol(arg_795_1.text_)

				local var_798_4 = 32
				local var_798_5 = utf8.len(var_798_3)
				local var_798_6 = var_798_4 <= 0 and var_798_1 or var_798_1 * (var_798_5 / var_798_4)

				if var_798_6 > 0 and var_798_1 < var_798_6 then
					arg_795_1.talkMaxDuration = var_798_6

					if var_798_6 + var_798_0 > arg_795_1.duration_ then
						arg_795_1.duration_ = var_798_6 + var_798_0
					end
				end

				arg_795_1.text_.text = var_798_3
				arg_795_1.typewritter.percent = 0

				arg_795_1.typewritter:SetDirty()
				arg_795_1:ShowNextGo(false)
				arg_795_1:RecordContent(arg_795_1.text_.text)
			end

			local var_798_7 = math.max(var_798_1, arg_795_1.talkMaxDuration)

			if var_798_0 <= arg_795_1.time_ and arg_795_1.time_ < var_798_0 + var_798_7 then
				arg_795_1.typewritter.percent = (arg_795_1.time_ - var_798_0) / var_798_7

				arg_795_1.typewritter:SetDirty()
			end

			if arg_795_1.time_ >= var_798_0 + var_798_7 and arg_795_1.time_ < var_798_0 + var_798_7 + arg_798_0 then
				arg_795_1.typewritter.percent = 1

				arg_795_1.typewritter:SetDirty()
				arg_795_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805193 = function(arg_799_0, arg_799_1)
		arg_799_1.time_ = 0
		arg_799_1.frameCnt_ = 0
		arg_799_1.state_ = "playing"
		arg_799_1.curTalkId_ = 1102805193
		arg_799_1.duration_ = 3.133

		SetActive(arg_799_1.tipsGo_, false)

		function arg_799_1.onSingleLineFinish_()
			arg_799_1.onSingleLineUpdate_ = nil
			arg_799_1.onSingleLineFinish_ = nil
			arg_799_1.state_ = "waiting"
		end

		function arg_799_1.playNext_(arg_801_0)
			if arg_801_0 == 1 then
				arg_799_0:Play1102805194(arg_799_1)
			end
		end

		function arg_799_1.onSingleLineUpdate_(arg_802_0)
			local var_802_0 = arg_799_1.actors_["1028ui_story"].transform
			local var_802_1 = 0

			if var_802_1 < arg_799_1.time_ and arg_799_1.time_ <= var_802_1 + arg_802_0 then
				arg_799_1.var_.moveOldPos1028ui_story = var_802_0.localPosition
			end

			local var_802_2 = 0.001

			if var_802_1 <= arg_799_1.time_ and arg_799_1.time_ < var_802_1 + var_802_2 then
				local var_802_3 = (arg_799_1.time_ - var_802_1) / var_802_2
				local var_802_4 = Vector3.New(0, -0.9, -5.9)

				var_802_0.localPosition = Vector3.Lerp(arg_799_1.var_.moveOldPos1028ui_story, var_802_4, var_802_3)

				local var_802_5 = manager.ui.mainCamera.transform.position - var_802_0.position

				var_802_0.forward = Vector3.New(var_802_5.x, var_802_5.y, var_802_5.z)

				local var_802_6 = var_802_0.localEulerAngles

				var_802_6.z = 0
				var_802_6.x = 0
				var_802_0.localEulerAngles = var_802_6
			end

			if arg_799_1.time_ >= var_802_1 + var_802_2 and arg_799_1.time_ < var_802_1 + var_802_2 + arg_802_0 then
				var_802_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_802_7 = manager.ui.mainCamera.transform.position - var_802_0.position

				var_802_0.forward = Vector3.New(var_802_7.x, var_802_7.y, var_802_7.z)

				local var_802_8 = var_802_0.localEulerAngles

				var_802_8.z = 0
				var_802_8.x = 0
				var_802_0.localEulerAngles = var_802_8
			end

			local var_802_9 = arg_799_1.actors_["1028ui_story"]
			local var_802_10 = 0

			if var_802_10 < arg_799_1.time_ and arg_799_1.time_ <= var_802_10 + arg_802_0 and arg_799_1.var_.characterEffect1028ui_story == nil then
				arg_799_1.var_.characterEffect1028ui_story = var_802_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_802_11 = 0.200000002980232

			if var_802_10 <= arg_799_1.time_ and arg_799_1.time_ < var_802_10 + var_802_11 then
				local var_802_12 = (arg_799_1.time_ - var_802_10) / var_802_11

				if arg_799_1.var_.characterEffect1028ui_story then
					arg_799_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_799_1.time_ >= var_802_10 + var_802_11 and arg_799_1.time_ < var_802_10 + var_802_11 + arg_802_0 and arg_799_1.var_.characterEffect1028ui_story then
				arg_799_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_802_13 = 0

			if var_802_13 < arg_799_1.time_ and arg_799_1.time_ <= var_802_13 + arg_802_0 then
				arg_799_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_802_14 = 0

			if var_802_14 < arg_799_1.time_ and arg_799_1.time_ <= var_802_14 + arg_802_0 then
				arg_799_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_802_15 = 0
			local var_802_16 = 0.375

			if var_802_15 < arg_799_1.time_ and arg_799_1.time_ <= var_802_15 + arg_802_0 then
				arg_799_1.talkMaxDuration = 0
				arg_799_1.dialogCg_.alpha = 1

				arg_799_1.dialog_:SetActive(true)
				SetActive(arg_799_1.leftNameGo_, true)

				local var_802_17 = arg_799_1:FormatText(StoryNameCfg[327].name)

				arg_799_1.leftNameTxt_.text = var_802_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_799_1.leftNameTxt_.transform)

				arg_799_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_799_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_799_1:RecordName(arg_799_1.leftNameTxt_.text)
				SetActive(arg_799_1.iconTrs_.gameObject, false)
				arg_799_1.callingController_:SetSelectedState("normal")

				local var_802_18 = arg_799_1:GetWordFromCfg(1102805193)
				local var_802_19 = arg_799_1:FormatText(var_802_18.content)

				arg_799_1.text_.text = var_802_19

				LuaForUtil.ClearLinePrefixSymbol(arg_799_1.text_)

				local var_802_20 = 15
				local var_802_21 = utf8.len(var_802_19)
				local var_802_22 = var_802_20 <= 0 and var_802_16 or var_802_16 * (var_802_21 / var_802_20)

				if var_802_22 > 0 and var_802_16 < var_802_22 then
					arg_799_1.talkMaxDuration = var_802_22

					if var_802_22 + var_802_15 > arg_799_1.duration_ then
						arg_799_1.duration_ = var_802_22 + var_802_15
					end
				end

				arg_799_1.text_.text = var_802_19
				arg_799_1.typewritter.percent = 0

				arg_799_1.typewritter:SetDirty()
				arg_799_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805193", "story_v_side_new_1102805.awb") ~= 0 then
					local var_802_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805193", "story_v_side_new_1102805.awb") / 1000

					if var_802_23 + var_802_15 > arg_799_1.duration_ then
						arg_799_1.duration_ = var_802_23 + var_802_15
					end

					if var_802_18.prefab_name ~= "" and arg_799_1.actors_[var_802_18.prefab_name] ~= nil then
						local var_802_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_799_1.actors_[var_802_18.prefab_name].transform, "story_v_side_new_1102805", "1102805193", "story_v_side_new_1102805.awb")

						arg_799_1:RecordAudio("1102805193", var_802_24)
						arg_799_1:RecordAudio("1102805193", var_802_24)
					else
						arg_799_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805193", "story_v_side_new_1102805.awb")
					end

					arg_799_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805193", "story_v_side_new_1102805.awb")
				end

				arg_799_1:RecordContent(arg_799_1.text_.text)
			end

			local var_802_25 = math.max(var_802_16, arg_799_1.talkMaxDuration)

			if var_802_15 <= arg_799_1.time_ and arg_799_1.time_ < var_802_15 + var_802_25 then
				arg_799_1.typewritter.percent = (arg_799_1.time_ - var_802_15) / var_802_25

				arg_799_1.typewritter:SetDirty()
			end

			if arg_799_1.time_ >= var_802_15 + var_802_25 and arg_799_1.time_ < var_802_15 + var_802_25 + arg_802_0 then
				arg_799_1.typewritter.percent = 1

				arg_799_1.typewritter:SetDirty()
				arg_799_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805194 = function(arg_803_0, arg_803_1)
		arg_803_1.time_ = 0
		arg_803_1.frameCnt_ = 0
		arg_803_1.state_ = "playing"
		arg_803_1.curTalkId_ = 1102805194
		arg_803_1.duration_ = 5

		SetActive(arg_803_1.tipsGo_, false)

		function arg_803_1.onSingleLineFinish_()
			arg_803_1.onSingleLineUpdate_ = nil
			arg_803_1.onSingleLineFinish_ = nil
			arg_803_1.state_ = "waiting"
		end

		function arg_803_1.playNext_(arg_805_0)
			if arg_805_0 == 1 then
				arg_803_0:Play1102805195(arg_803_1)
			end
		end

		function arg_803_1.onSingleLineUpdate_(arg_806_0)
			local var_806_0 = arg_803_1.actors_["1028ui_story"]
			local var_806_1 = 0

			if var_806_1 < arg_803_1.time_ and arg_803_1.time_ <= var_806_1 + arg_806_0 and arg_803_1.var_.characterEffect1028ui_story == nil then
				arg_803_1.var_.characterEffect1028ui_story = var_806_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_806_2 = 0.200000002980232

			if var_806_1 <= arg_803_1.time_ and arg_803_1.time_ < var_806_1 + var_806_2 then
				local var_806_3 = (arg_803_1.time_ - var_806_1) / var_806_2

				if arg_803_1.var_.characterEffect1028ui_story then
					local var_806_4 = Mathf.Lerp(0, 0.5, var_806_3)

					arg_803_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_803_1.var_.characterEffect1028ui_story.fillRatio = var_806_4
				end
			end

			if arg_803_1.time_ >= var_806_1 + var_806_2 and arg_803_1.time_ < var_806_1 + var_806_2 + arg_806_0 and arg_803_1.var_.characterEffect1028ui_story then
				local var_806_5 = 0.5

				arg_803_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_803_1.var_.characterEffect1028ui_story.fillRatio = var_806_5
			end

			local var_806_6 = 0
			local var_806_7 = 1.1

			if var_806_6 < arg_803_1.time_ and arg_803_1.time_ <= var_806_6 + arg_806_0 then
				arg_803_1.talkMaxDuration = 0
				arg_803_1.dialogCg_.alpha = 1

				arg_803_1.dialog_:SetActive(true)
				SetActive(arg_803_1.leftNameGo_, false)

				arg_803_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_803_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_803_1:RecordName(arg_803_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_803_1.iconTrs_.gameObject, false)
				arg_803_1.callingController_:SetSelectedState("normal")

				local var_806_8 = arg_803_1:GetWordFromCfg(1102805194)
				local var_806_9 = arg_803_1:FormatText(var_806_8.content)

				arg_803_1.text_.text = var_806_9

				LuaForUtil.ClearLinePrefixSymbol(arg_803_1.text_)

				local var_806_10 = 44
				local var_806_11 = utf8.len(var_806_9)
				local var_806_12 = var_806_10 <= 0 and var_806_7 or var_806_7 * (var_806_11 / var_806_10)

				if var_806_12 > 0 and var_806_7 < var_806_12 then
					arg_803_1.talkMaxDuration = var_806_12

					if var_806_12 + var_806_6 > arg_803_1.duration_ then
						arg_803_1.duration_ = var_806_12 + var_806_6
					end
				end

				arg_803_1.text_.text = var_806_9
				arg_803_1.typewritter.percent = 0

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(false)
				arg_803_1:RecordContent(arg_803_1.text_.text)
			end

			local var_806_13 = math.max(var_806_7, arg_803_1.talkMaxDuration)

			if var_806_6 <= arg_803_1.time_ and arg_803_1.time_ < var_806_6 + var_806_13 then
				arg_803_1.typewritter.percent = (arg_803_1.time_ - var_806_6) / var_806_13

				arg_803_1.typewritter:SetDirty()
			end

			if arg_803_1.time_ >= var_806_6 + var_806_13 and arg_803_1.time_ < var_806_6 + var_806_13 + arg_806_0 then
				arg_803_1.typewritter.percent = 1

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805195 = function(arg_807_0, arg_807_1)
		arg_807_1.time_ = 0
		arg_807_1.frameCnt_ = 0
		arg_807_1.state_ = "playing"
		arg_807_1.curTalkId_ = 1102805195
		arg_807_1.duration_ = 4.833

		SetActive(arg_807_1.tipsGo_, false)

		function arg_807_1.onSingleLineFinish_()
			arg_807_1.onSingleLineUpdate_ = nil
			arg_807_1.onSingleLineFinish_ = nil
			arg_807_1.state_ = "waiting"
		end

		function arg_807_1.playNext_(arg_809_0)
			if arg_809_0 == 1 then
				arg_807_0:Play1102805196(arg_807_1)
			end
		end

		function arg_807_1.onSingleLineUpdate_(arg_810_0)
			local var_810_0 = arg_807_1.actors_["1028ui_story"]
			local var_810_1 = 0

			if var_810_1 < arg_807_1.time_ and arg_807_1.time_ <= var_810_1 + arg_810_0 and arg_807_1.var_.characterEffect1028ui_story == nil then
				arg_807_1.var_.characterEffect1028ui_story = var_810_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_810_2 = 0.200000002980232

			if var_810_1 <= arg_807_1.time_ and arg_807_1.time_ < var_810_1 + var_810_2 then
				local var_810_3 = (arg_807_1.time_ - var_810_1) / var_810_2

				if arg_807_1.var_.characterEffect1028ui_story then
					arg_807_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_807_1.time_ >= var_810_1 + var_810_2 and arg_807_1.time_ < var_810_1 + var_810_2 + arg_810_0 and arg_807_1.var_.characterEffect1028ui_story then
				arg_807_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_810_4 = 0

			if var_810_4 < arg_807_1.time_ and arg_807_1.time_ <= var_810_4 + arg_810_0 then
				arg_807_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_810_5 = 0
			local var_810_6 = 0.325

			if var_810_5 < arg_807_1.time_ and arg_807_1.time_ <= var_810_5 + arg_810_0 then
				arg_807_1.talkMaxDuration = 0
				arg_807_1.dialogCg_.alpha = 1

				arg_807_1.dialog_:SetActive(true)
				SetActive(arg_807_1.leftNameGo_, true)

				local var_810_7 = arg_807_1:FormatText(StoryNameCfg[327].name)

				arg_807_1.leftNameTxt_.text = var_810_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_807_1.leftNameTxt_.transform)

				arg_807_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_807_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_807_1:RecordName(arg_807_1.leftNameTxt_.text)
				SetActive(arg_807_1.iconTrs_.gameObject, false)
				arg_807_1.callingController_:SetSelectedState("normal")

				local var_810_8 = arg_807_1:GetWordFromCfg(1102805195)
				local var_810_9 = arg_807_1:FormatText(var_810_8.content)

				arg_807_1.text_.text = var_810_9

				LuaForUtil.ClearLinePrefixSymbol(arg_807_1.text_)

				local var_810_10 = 13
				local var_810_11 = utf8.len(var_810_9)
				local var_810_12 = var_810_10 <= 0 and var_810_6 or var_810_6 * (var_810_11 / var_810_10)

				if var_810_12 > 0 and var_810_6 < var_810_12 then
					arg_807_1.talkMaxDuration = var_810_12

					if var_810_12 + var_810_5 > arg_807_1.duration_ then
						arg_807_1.duration_ = var_810_12 + var_810_5
					end
				end

				arg_807_1.text_.text = var_810_9
				arg_807_1.typewritter.percent = 0

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805195", "story_v_side_new_1102805.awb") ~= 0 then
					local var_810_13 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805195", "story_v_side_new_1102805.awb") / 1000

					if var_810_13 + var_810_5 > arg_807_1.duration_ then
						arg_807_1.duration_ = var_810_13 + var_810_5
					end

					if var_810_8.prefab_name ~= "" and arg_807_1.actors_[var_810_8.prefab_name] ~= nil then
						local var_810_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_807_1.actors_[var_810_8.prefab_name].transform, "story_v_side_new_1102805", "1102805195", "story_v_side_new_1102805.awb")

						arg_807_1:RecordAudio("1102805195", var_810_14)
						arg_807_1:RecordAudio("1102805195", var_810_14)
					else
						arg_807_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805195", "story_v_side_new_1102805.awb")
					end

					arg_807_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805195", "story_v_side_new_1102805.awb")
				end

				arg_807_1:RecordContent(arg_807_1.text_.text)
			end

			local var_810_15 = math.max(var_810_6, arg_807_1.talkMaxDuration)

			if var_810_5 <= arg_807_1.time_ and arg_807_1.time_ < var_810_5 + var_810_15 then
				arg_807_1.typewritter.percent = (arg_807_1.time_ - var_810_5) / var_810_15

				arg_807_1.typewritter:SetDirty()
			end

			if arg_807_1.time_ >= var_810_5 + var_810_15 and arg_807_1.time_ < var_810_5 + var_810_15 + arg_810_0 then
				arg_807_1.typewritter.percent = 1

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805196 = function(arg_811_0, arg_811_1)
		arg_811_1.time_ = 0
		arg_811_1.frameCnt_ = 0
		arg_811_1.state_ = "playing"
		arg_811_1.curTalkId_ = 1102805196
		arg_811_1.duration_ = 5

		SetActive(arg_811_1.tipsGo_, false)

		function arg_811_1.onSingleLineFinish_()
			arg_811_1.onSingleLineUpdate_ = nil
			arg_811_1.onSingleLineFinish_ = nil
			arg_811_1.state_ = "waiting"
		end

		function arg_811_1.playNext_(arg_813_0)
			if arg_813_0 == 1 then
				arg_811_0:Play1102805197(arg_811_1)
			end
		end

		function arg_811_1.onSingleLineUpdate_(arg_814_0)
			local var_814_0 = arg_811_1.actors_["1028ui_story"]
			local var_814_1 = 0

			if var_814_1 < arg_811_1.time_ and arg_811_1.time_ <= var_814_1 + arg_814_0 and arg_811_1.var_.characterEffect1028ui_story == nil then
				arg_811_1.var_.characterEffect1028ui_story = var_814_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_814_2 = 0.200000002980232

			if var_814_1 <= arg_811_1.time_ and arg_811_1.time_ < var_814_1 + var_814_2 then
				local var_814_3 = (arg_811_1.time_ - var_814_1) / var_814_2

				if arg_811_1.var_.characterEffect1028ui_story then
					local var_814_4 = Mathf.Lerp(0, 0.5, var_814_3)

					arg_811_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_811_1.var_.characterEffect1028ui_story.fillRatio = var_814_4
				end
			end

			if arg_811_1.time_ >= var_814_1 + var_814_2 and arg_811_1.time_ < var_814_1 + var_814_2 + arg_814_0 and arg_811_1.var_.characterEffect1028ui_story then
				local var_814_5 = 0.5

				arg_811_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_811_1.var_.characterEffect1028ui_story.fillRatio = var_814_5
			end

			local var_814_6 = 0
			local var_814_7 = 0.6

			if var_814_6 < arg_811_1.time_ and arg_811_1.time_ <= var_814_6 + arg_814_0 then
				local var_814_8 = "play"
				local var_814_9 = "effect"

				arg_811_1:AudioAction(var_814_8, var_814_9, "se_story_side_1028", "se_story_side_1028_door", "")
			end

			local var_814_10 = 0
			local var_814_11 = 0.55

			if var_814_10 < arg_811_1.time_ and arg_811_1.time_ <= var_814_10 + arg_814_0 then
				arg_811_1.talkMaxDuration = 0
				arg_811_1.dialogCg_.alpha = 1

				arg_811_1.dialog_:SetActive(true)
				SetActive(arg_811_1.leftNameGo_, false)

				arg_811_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_811_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_811_1:RecordName(arg_811_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_811_1.iconTrs_.gameObject, false)
				arg_811_1.callingController_:SetSelectedState("normal")

				local var_814_12 = arg_811_1:GetWordFromCfg(1102805196)
				local var_814_13 = arg_811_1:FormatText(var_814_12.content)

				arg_811_1.text_.text = var_814_13

				LuaForUtil.ClearLinePrefixSymbol(arg_811_1.text_)

				local var_814_14 = 22
				local var_814_15 = utf8.len(var_814_13)
				local var_814_16 = var_814_14 <= 0 and var_814_11 or var_814_11 * (var_814_15 / var_814_14)

				if var_814_16 > 0 and var_814_11 < var_814_16 then
					arg_811_1.talkMaxDuration = var_814_16

					if var_814_16 + var_814_10 > arg_811_1.duration_ then
						arg_811_1.duration_ = var_814_16 + var_814_10
					end
				end

				arg_811_1.text_.text = var_814_13
				arg_811_1.typewritter.percent = 0

				arg_811_1.typewritter:SetDirty()
				arg_811_1:ShowNextGo(false)
				arg_811_1:RecordContent(arg_811_1.text_.text)
			end

			local var_814_17 = math.max(var_814_11, arg_811_1.talkMaxDuration)

			if var_814_10 <= arg_811_1.time_ and arg_811_1.time_ < var_814_10 + var_814_17 then
				arg_811_1.typewritter.percent = (arg_811_1.time_ - var_814_10) / var_814_17

				arg_811_1.typewritter:SetDirty()
			end

			if arg_811_1.time_ >= var_814_10 + var_814_17 and arg_811_1.time_ < var_814_10 + var_814_17 + arg_814_0 then
				arg_811_1.typewritter.percent = 1

				arg_811_1.typewritter:SetDirty()
				arg_811_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805197 = function(arg_815_0, arg_815_1)
		arg_815_1.time_ = 0
		arg_815_1.frameCnt_ = 0
		arg_815_1.state_ = "playing"
		arg_815_1.curTalkId_ = 1102805197
		arg_815_1.duration_ = 5

		SetActive(arg_815_1.tipsGo_, false)

		function arg_815_1.onSingleLineFinish_()
			arg_815_1.onSingleLineUpdate_ = nil
			arg_815_1.onSingleLineFinish_ = nil
			arg_815_1.state_ = "waiting"
		end

		function arg_815_1.playNext_(arg_817_0)
			if arg_817_0 == 1 then
				arg_815_0:Play1102805198(arg_815_1)
			end
		end

		function arg_815_1.onSingleLineUpdate_(arg_818_0)
			local var_818_0 = arg_815_1.actors_["1028ui_story"].transform
			local var_818_1 = 0

			if var_818_1 < arg_815_1.time_ and arg_815_1.time_ <= var_818_1 + arg_818_0 then
				arg_815_1.var_.moveOldPos1028ui_story = var_818_0.localPosition
			end

			local var_818_2 = 0.001

			if var_818_1 <= arg_815_1.time_ and arg_815_1.time_ < var_818_1 + var_818_2 then
				local var_818_3 = (arg_815_1.time_ - var_818_1) / var_818_2
				local var_818_4 = Vector3.New(0, 100, 0)

				var_818_0.localPosition = Vector3.Lerp(arg_815_1.var_.moveOldPos1028ui_story, var_818_4, var_818_3)

				local var_818_5 = manager.ui.mainCamera.transform.position - var_818_0.position

				var_818_0.forward = Vector3.New(var_818_5.x, var_818_5.y, var_818_5.z)

				local var_818_6 = var_818_0.localEulerAngles

				var_818_6.z = 0
				var_818_6.x = 0
				var_818_0.localEulerAngles = var_818_6
			end

			if arg_815_1.time_ >= var_818_1 + var_818_2 and arg_815_1.time_ < var_818_1 + var_818_2 + arg_818_0 then
				var_818_0.localPosition = Vector3.New(0, 100, 0)

				local var_818_7 = manager.ui.mainCamera.transform.position - var_818_0.position

				var_818_0.forward = Vector3.New(var_818_7.x, var_818_7.y, var_818_7.z)

				local var_818_8 = var_818_0.localEulerAngles

				var_818_8.z = 0
				var_818_8.x = 0
				var_818_0.localEulerAngles = var_818_8
			end

			local var_818_9 = 0
			local var_818_10 = 0.075

			if var_818_9 < arg_815_1.time_ and arg_815_1.time_ <= var_818_9 + arg_818_0 then
				arg_815_1.talkMaxDuration = 0
				arg_815_1.dialogCg_.alpha = 1

				arg_815_1.dialog_:SetActive(true)
				SetActive(arg_815_1.leftNameGo_, true)

				local var_818_11 = arg_815_1:FormatText(StoryNameCfg[7].name)

				arg_815_1.leftNameTxt_.text = var_818_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_815_1.leftNameTxt_.transform)

				arg_815_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_815_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_815_1:RecordName(arg_815_1.leftNameTxt_.text)
				SetActive(arg_815_1.iconTrs_.gameObject, false)
				arg_815_1.callingController_:SetSelectedState("normal")

				local var_818_12 = arg_815_1:GetWordFromCfg(1102805197)
				local var_818_13 = arg_815_1:FormatText(var_818_12.content)

				arg_815_1.text_.text = var_818_13

				LuaForUtil.ClearLinePrefixSymbol(arg_815_1.text_)

				local var_818_14 = 3
				local var_818_15 = utf8.len(var_818_13)
				local var_818_16 = var_818_14 <= 0 and var_818_10 or var_818_10 * (var_818_15 / var_818_14)

				if var_818_16 > 0 and var_818_10 < var_818_16 then
					arg_815_1.talkMaxDuration = var_818_16

					if var_818_16 + var_818_9 > arg_815_1.duration_ then
						arg_815_1.duration_ = var_818_16 + var_818_9
					end
				end

				arg_815_1.text_.text = var_818_13
				arg_815_1.typewritter.percent = 0

				arg_815_1.typewritter:SetDirty()
				arg_815_1:ShowNextGo(false)
				arg_815_1:RecordContent(arg_815_1.text_.text)
			end

			local var_818_17 = math.max(var_818_10, arg_815_1.talkMaxDuration)

			if var_818_9 <= arg_815_1.time_ and arg_815_1.time_ < var_818_9 + var_818_17 then
				arg_815_1.typewritter.percent = (arg_815_1.time_ - var_818_9) / var_818_17

				arg_815_1.typewritter:SetDirty()
			end

			if arg_815_1.time_ >= var_818_9 + var_818_17 and arg_815_1.time_ < var_818_9 + var_818_17 + arg_818_0 then
				arg_815_1.typewritter.percent = 1

				arg_815_1.typewritter:SetDirty()
				arg_815_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805198 = function(arg_819_0, arg_819_1)
		arg_819_1.time_ = 0
		arg_819_1.frameCnt_ = 0
		arg_819_1.state_ = "playing"
		arg_819_1.curTalkId_ = 1102805198
		arg_819_1.duration_ = 5

		SetActive(arg_819_1.tipsGo_, false)

		function arg_819_1.onSingleLineFinish_()
			arg_819_1.onSingleLineUpdate_ = nil
			arg_819_1.onSingleLineFinish_ = nil
			arg_819_1.state_ = "waiting"
		end

		function arg_819_1.playNext_(arg_821_0)
			if arg_821_0 == 1 then
				arg_819_0:Play1102805199(arg_819_1)
			end
		end

		function arg_819_1.onSingleLineUpdate_(arg_822_0)
			local var_822_0 = 0
			local var_822_1 = 1.175

			if var_822_0 < arg_819_1.time_ and arg_819_1.time_ <= var_822_0 + arg_822_0 then
				arg_819_1.talkMaxDuration = 0
				arg_819_1.dialogCg_.alpha = 1

				arg_819_1.dialog_:SetActive(true)
				SetActive(arg_819_1.leftNameGo_, false)

				arg_819_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_819_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_819_1:RecordName(arg_819_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_819_1.iconTrs_.gameObject, false)
				arg_819_1.callingController_:SetSelectedState("normal")

				local var_822_2 = arg_819_1:GetWordFromCfg(1102805198)
				local var_822_3 = arg_819_1:FormatText(var_822_2.content)

				arg_819_1.text_.text = var_822_3

				LuaForUtil.ClearLinePrefixSymbol(arg_819_1.text_)

				local var_822_4 = 47
				local var_822_5 = utf8.len(var_822_3)
				local var_822_6 = var_822_4 <= 0 and var_822_1 or var_822_1 * (var_822_5 / var_822_4)

				if var_822_6 > 0 and var_822_1 < var_822_6 then
					arg_819_1.talkMaxDuration = var_822_6

					if var_822_6 + var_822_0 > arg_819_1.duration_ then
						arg_819_1.duration_ = var_822_6 + var_822_0
					end
				end

				arg_819_1.text_.text = var_822_3
				arg_819_1.typewritter.percent = 0

				arg_819_1.typewritter:SetDirty()
				arg_819_1:ShowNextGo(false)
				arg_819_1:RecordContent(arg_819_1.text_.text)
			end

			local var_822_7 = math.max(var_822_1, arg_819_1.talkMaxDuration)

			if var_822_0 <= arg_819_1.time_ and arg_819_1.time_ < var_822_0 + var_822_7 then
				arg_819_1.typewritter.percent = (arg_819_1.time_ - var_822_0) / var_822_7

				arg_819_1.typewritter:SetDirty()
			end

			if arg_819_1.time_ >= var_822_0 + var_822_7 and arg_819_1.time_ < var_822_0 + var_822_7 + arg_822_0 then
				arg_819_1.typewritter.percent = 1

				arg_819_1.typewritter:SetDirty()
				arg_819_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805199 = function(arg_823_0, arg_823_1)
		arg_823_1.time_ = 0
		arg_823_1.frameCnt_ = 0
		arg_823_1.state_ = "playing"
		arg_823_1.curTalkId_ = 1102805199
		arg_823_1.duration_ = 5

		SetActive(arg_823_1.tipsGo_, false)

		function arg_823_1.onSingleLineFinish_()
			arg_823_1.onSingleLineUpdate_ = nil
			arg_823_1.onSingleLineFinish_ = nil
			arg_823_1.state_ = "waiting"
		end

		function arg_823_1.playNext_(arg_825_0)
			if arg_825_0 == 1 then
				arg_823_0:Play1102805200(arg_823_1)
			end
		end

		function arg_823_1.onSingleLineUpdate_(arg_826_0)
			local var_826_0 = 0
			local var_826_1 = 0.2

			if var_826_0 < arg_823_1.time_ and arg_823_1.time_ <= var_826_0 + arg_826_0 then
				arg_823_1.talkMaxDuration = 0
				arg_823_1.dialogCg_.alpha = 1

				arg_823_1.dialog_:SetActive(true)
				SetActive(arg_823_1.leftNameGo_, true)

				local var_826_2 = arg_823_1:FormatText(StoryNameCfg[7].name)

				arg_823_1.leftNameTxt_.text = var_826_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_823_1.leftNameTxt_.transform)

				arg_823_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_823_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_823_1:RecordName(arg_823_1.leftNameTxt_.text)
				SetActive(arg_823_1.iconTrs_.gameObject, false)
				arg_823_1.callingController_:SetSelectedState("normal")

				local var_826_3 = arg_823_1:GetWordFromCfg(1102805199)
				local var_826_4 = arg_823_1:FormatText(var_826_3.content)

				arg_823_1.text_.text = var_826_4

				LuaForUtil.ClearLinePrefixSymbol(arg_823_1.text_)

				local var_826_5 = 8
				local var_826_6 = utf8.len(var_826_4)
				local var_826_7 = var_826_5 <= 0 and var_826_1 or var_826_1 * (var_826_6 / var_826_5)

				if var_826_7 > 0 and var_826_1 < var_826_7 then
					arg_823_1.talkMaxDuration = var_826_7

					if var_826_7 + var_826_0 > arg_823_1.duration_ then
						arg_823_1.duration_ = var_826_7 + var_826_0
					end
				end

				arg_823_1.text_.text = var_826_4
				arg_823_1.typewritter.percent = 0

				arg_823_1.typewritter:SetDirty()
				arg_823_1:ShowNextGo(false)
				arg_823_1:RecordContent(arg_823_1.text_.text)
			end

			local var_826_8 = math.max(var_826_1, arg_823_1.talkMaxDuration)

			if var_826_0 <= arg_823_1.time_ and arg_823_1.time_ < var_826_0 + var_826_8 then
				arg_823_1.typewritter.percent = (arg_823_1.time_ - var_826_0) / var_826_8

				arg_823_1.typewritter:SetDirty()
			end

			if arg_823_1.time_ >= var_826_0 + var_826_8 and arg_823_1.time_ < var_826_0 + var_826_8 + arg_826_0 then
				arg_823_1.typewritter.percent = 1

				arg_823_1.typewritter:SetDirty()
				arg_823_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805200 = function(arg_827_0, arg_827_1)
		arg_827_1.time_ = 0
		arg_827_1.frameCnt_ = 0
		arg_827_1.state_ = "playing"
		arg_827_1.curTalkId_ = 1102805200
		arg_827_1.duration_ = 1.999999999999

		SetActive(arg_827_1.tipsGo_, false)

		function arg_827_1.onSingleLineFinish_()
			arg_827_1.onSingleLineUpdate_ = nil
			arg_827_1.onSingleLineFinish_ = nil
			arg_827_1.state_ = "waiting"
		end

		function arg_827_1.playNext_(arg_829_0)
			if arg_829_0 == 1 then
				arg_827_0:Play1102805201(arg_827_1)
			end
		end

		function arg_827_1.onSingleLineUpdate_(arg_830_0)
			local var_830_0 = arg_827_1.actors_["1028ui_story"].transform
			local var_830_1 = 0

			if var_830_1 < arg_827_1.time_ and arg_827_1.time_ <= var_830_1 + arg_830_0 then
				arg_827_1.var_.moveOldPos1028ui_story = var_830_0.localPosition
			end

			local var_830_2 = 0.001

			if var_830_1 <= arg_827_1.time_ and arg_827_1.time_ < var_830_1 + var_830_2 then
				local var_830_3 = (arg_827_1.time_ - var_830_1) / var_830_2
				local var_830_4 = Vector3.New(0, -0.9, -5.9)

				var_830_0.localPosition = Vector3.Lerp(arg_827_1.var_.moveOldPos1028ui_story, var_830_4, var_830_3)

				local var_830_5 = manager.ui.mainCamera.transform.position - var_830_0.position

				var_830_0.forward = Vector3.New(var_830_5.x, var_830_5.y, var_830_5.z)

				local var_830_6 = var_830_0.localEulerAngles

				var_830_6.z = 0
				var_830_6.x = 0
				var_830_0.localEulerAngles = var_830_6
			end

			if arg_827_1.time_ >= var_830_1 + var_830_2 and arg_827_1.time_ < var_830_1 + var_830_2 + arg_830_0 then
				var_830_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_830_7 = manager.ui.mainCamera.transform.position - var_830_0.position

				var_830_0.forward = Vector3.New(var_830_7.x, var_830_7.y, var_830_7.z)

				local var_830_8 = var_830_0.localEulerAngles

				var_830_8.z = 0
				var_830_8.x = 0
				var_830_0.localEulerAngles = var_830_8
			end

			local var_830_9 = arg_827_1.actors_["1028ui_story"]
			local var_830_10 = 0

			if var_830_10 < arg_827_1.time_ and arg_827_1.time_ <= var_830_10 + arg_830_0 and arg_827_1.var_.characterEffect1028ui_story == nil then
				arg_827_1.var_.characterEffect1028ui_story = var_830_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_830_11 = 0.200000002980232

			if var_830_10 <= arg_827_1.time_ and arg_827_1.time_ < var_830_10 + var_830_11 then
				local var_830_12 = (arg_827_1.time_ - var_830_10) / var_830_11

				if arg_827_1.var_.characterEffect1028ui_story then
					arg_827_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_827_1.time_ >= var_830_10 + var_830_11 and arg_827_1.time_ < var_830_10 + var_830_11 + arg_830_0 and arg_827_1.var_.characterEffect1028ui_story then
				arg_827_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_830_13 = 0

			if var_830_13 < arg_827_1.time_ and arg_827_1.time_ <= var_830_13 + arg_830_0 then
				arg_827_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_830_14 = 0

			if var_830_14 < arg_827_1.time_ and arg_827_1.time_ <= var_830_14 + arg_830_0 then
				arg_827_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_830_15 = 0
			local var_830_16 = 0.15

			if var_830_15 < arg_827_1.time_ and arg_827_1.time_ <= var_830_15 + arg_830_0 then
				arg_827_1.talkMaxDuration = 0
				arg_827_1.dialogCg_.alpha = 1

				arg_827_1.dialog_:SetActive(true)
				SetActive(arg_827_1.leftNameGo_, true)

				local var_830_17 = arg_827_1:FormatText(StoryNameCfg[327].name)

				arg_827_1.leftNameTxt_.text = var_830_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_827_1.leftNameTxt_.transform)

				arg_827_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_827_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_827_1:RecordName(arg_827_1.leftNameTxt_.text)
				SetActive(arg_827_1.iconTrs_.gameObject, false)
				arg_827_1.callingController_:SetSelectedState("normal")

				local var_830_18 = arg_827_1:GetWordFromCfg(1102805200)
				local var_830_19 = arg_827_1:FormatText(var_830_18.content)

				arg_827_1.text_.text = var_830_19

				LuaForUtil.ClearLinePrefixSymbol(arg_827_1.text_)

				local var_830_20 = 6
				local var_830_21 = utf8.len(var_830_19)
				local var_830_22 = var_830_20 <= 0 and var_830_16 or var_830_16 * (var_830_21 / var_830_20)

				if var_830_22 > 0 and var_830_16 < var_830_22 then
					arg_827_1.talkMaxDuration = var_830_22

					if var_830_22 + var_830_15 > arg_827_1.duration_ then
						arg_827_1.duration_ = var_830_22 + var_830_15
					end
				end

				arg_827_1.text_.text = var_830_19
				arg_827_1.typewritter.percent = 0

				arg_827_1.typewritter:SetDirty()
				arg_827_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805200", "story_v_side_new_1102805.awb") ~= 0 then
					local var_830_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805200", "story_v_side_new_1102805.awb") / 1000

					if var_830_23 + var_830_15 > arg_827_1.duration_ then
						arg_827_1.duration_ = var_830_23 + var_830_15
					end

					if var_830_18.prefab_name ~= "" and arg_827_1.actors_[var_830_18.prefab_name] ~= nil then
						local var_830_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_827_1.actors_[var_830_18.prefab_name].transform, "story_v_side_new_1102805", "1102805200", "story_v_side_new_1102805.awb")

						arg_827_1:RecordAudio("1102805200", var_830_24)
						arg_827_1:RecordAudio("1102805200", var_830_24)
					else
						arg_827_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805200", "story_v_side_new_1102805.awb")
					end

					arg_827_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805200", "story_v_side_new_1102805.awb")
				end

				arg_827_1:RecordContent(arg_827_1.text_.text)
			end

			local var_830_25 = math.max(var_830_16, arg_827_1.talkMaxDuration)

			if var_830_15 <= arg_827_1.time_ and arg_827_1.time_ < var_830_15 + var_830_25 then
				arg_827_1.typewritter.percent = (arg_827_1.time_ - var_830_15) / var_830_25

				arg_827_1.typewritter:SetDirty()
			end

			if arg_827_1.time_ >= var_830_15 + var_830_25 and arg_827_1.time_ < var_830_15 + var_830_25 + arg_830_0 then
				arg_827_1.typewritter.percent = 1

				arg_827_1.typewritter:SetDirty()
				arg_827_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805201 = function(arg_831_0, arg_831_1)
		arg_831_1.time_ = 0
		arg_831_1.frameCnt_ = 0
		arg_831_1.state_ = "playing"
		arg_831_1.curTalkId_ = 1102805201
		arg_831_1.duration_ = 5

		SetActive(arg_831_1.tipsGo_, false)

		function arg_831_1.onSingleLineFinish_()
			arg_831_1.onSingleLineUpdate_ = nil
			arg_831_1.onSingleLineFinish_ = nil
			arg_831_1.state_ = "waiting"
		end

		function arg_831_1.playNext_(arg_833_0)
			if arg_833_0 == 1 then
				arg_831_0:Play1102805202(arg_831_1)
			end
		end

		function arg_831_1.onSingleLineUpdate_(arg_834_0)
			local var_834_0 = arg_831_1.actors_["1028ui_story"]
			local var_834_1 = 0

			if var_834_1 < arg_831_1.time_ and arg_831_1.time_ <= var_834_1 + arg_834_0 and arg_831_1.var_.characterEffect1028ui_story == nil then
				arg_831_1.var_.characterEffect1028ui_story = var_834_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_834_2 = 0.200000002980232

			if var_834_1 <= arg_831_1.time_ and arg_831_1.time_ < var_834_1 + var_834_2 then
				local var_834_3 = (arg_831_1.time_ - var_834_1) / var_834_2

				if arg_831_1.var_.characterEffect1028ui_story then
					local var_834_4 = Mathf.Lerp(0, 0.5, var_834_3)

					arg_831_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_831_1.var_.characterEffect1028ui_story.fillRatio = var_834_4
				end
			end

			if arg_831_1.time_ >= var_834_1 + var_834_2 and arg_831_1.time_ < var_834_1 + var_834_2 + arg_834_0 and arg_831_1.var_.characterEffect1028ui_story then
				local var_834_5 = 0.5

				arg_831_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_831_1.var_.characterEffect1028ui_story.fillRatio = var_834_5
			end

			local var_834_6 = 0
			local var_834_7 = 0.65

			if var_834_6 < arg_831_1.time_ and arg_831_1.time_ <= var_834_6 + arg_834_0 then
				arg_831_1.talkMaxDuration = 0
				arg_831_1.dialogCg_.alpha = 1

				arg_831_1.dialog_:SetActive(true)
				SetActive(arg_831_1.leftNameGo_, true)

				local var_834_8 = arg_831_1:FormatText(StoryNameCfg[7].name)

				arg_831_1.leftNameTxt_.text = var_834_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_831_1.leftNameTxt_.transform)

				arg_831_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_831_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_831_1:RecordName(arg_831_1.leftNameTxt_.text)
				SetActive(arg_831_1.iconTrs_.gameObject, false)
				arg_831_1.callingController_:SetSelectedState("normal")

				local var_834_9 = arg_831_1:GetWordFromCfg(1102805201)
				local var_834_10 = arg_831_1:FormatText(var_834_9.content)

				arg_831_1.text_.text = var_834_10

				LuaForUtil.ClearLinePrefixSymbol(arg_831_1.text_)

				local var_834_11 = 26
				local var_834_12 = utf8.len(var_834_10)
				local var_834_13 = var_834_11 <= 0 and var_834_7 or var_834_7 * (var_834_12 / var_834_11)

				if var_834_13 > 0 and var_834_7 < var_834_13 then
					arg_831_1.talkMaxDuration = var_834_13

					if var_834_13 + var_834_6 > arg_831_1.duration_ then
						arg_831_1.duration_ = var_834_13 + var_834_6
					end
				end

				arg_831_1.text_.text = var_834_10
				arg_831_1.typewritter.percent = 0

				arg_831_1.typewritter:SetDirty()
				arg_831_1:ShowNextGo(false)
				arg_831_1:RecordContent(arg_831_1.text_.text)
			end

			local var_834_14 = math.max(var_834_7, arg_831_1.talkMaxDuration)

			if var_834_6 <= arg_831_1.time_ and arg_831_1.time_ < var_834_6 + var_834_14 then
				arg_831_1.typewritter.percent = (arg_831_1.time_ - var_834_6) / var_834_14

				arg_831_1.typewritter:SetDirty()
			end

			if arg_831_1.time_ >= var_834_6 + var_834_14 and arg_831_1.time_ < var_834_6 + var_834_14 + arg_834_0 then
				arg_831_1.typewritter.percent = 1

				arg_831_1.typewritter:SetDirty()
				arg_831_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805202 = function(arg_835_0, arg_835_1)
		arg_835_1.time_ = 0
		arg_835_1.frameCnt_ = 0
		arg_835_1.state_ = "playing"
		arg_835_1.curTalkId_ = 1102805202
		arg_835_1.duration_ = 1.999999999999

		SetActive(arg_835_1.tipsGo_, false)

		function arg_835_1.onSingleLineFinish_()
			arg_835_1.onSingleLineUpdate_ = nil
			arg_835_1.onSingleLineFinish_ = nil
			arg_835_1.state_ = "waiting"
		end

		function arg_835_1.playNext_(arg_837_0)
			if arg_837_0 == 1 then
				arg_835_0:Play1102805203(arg_835_1)
			end
		end

		function arg_835_1.onSingleLineUpdate_(arg_838_0)
			local var_838_0 = arg_835_1.actors_["1028ui_story"].transform
			local var_838_1 = 0

			if var_838_1 < arg_835_1.time_ and arg_835_1.time_ <= var_838_1 + arg_838_0 then
				arg_835_1.var_.moveOldPos1028ui_story = var_838_0.localPosition
			end

			local var_838_2 = 0.001

			if var_838_1 <= arg_835_1.time_ and arg_835_1.time_ < var_838_1 + var_838_2 then
				local var_838_3 = (arg_835_1.time_ - var_838_1) / var_838_2
				local var_838_4 = Vector3.New(0, -0.9, -5.9)

				var_838_0.localPosition = Vector3.Lerp(arg_835_1.var_.moveOldPos1028ui_story, var_838_4, var_838_3)

				local var_838_5 = manager.ui.mainCamera.transform.position - var_838_0.position

				var_838_0.forward = Vector3.New(var_838_5.x, var_838_5.y, var_838_5.z)

				local var_838_6 = var_838_0.localEulerAngles

				var_838_6.z = 0
				var_838_6.x = 0
				var_838_0.localEulerAngles = var_838_6
			end

			if arg_835_1.time_ >= var_838_1 + var_838_2 and arg_835_1.time_ < var_838_1 + var_838_2 + arg_838_0 then
				var_838_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_838_7 = manager.ui.mainCamera.transform.position - var_838_0.position

				var_838_0.forward = Vector3.New(var_838_7.x, var_838_7.y, var_838_7.z)

				local var_838_8 = var_838_0.localEulerAngles

				var_838_8.z = 0
				var_838_8.x = 0
				var_838_0.localEulerAngles = var_838_8
			end

			local var_838_9 = arg_835_1.actors_["1028ui_story"]
			local var_838_10 = 0

			if var_838_10 < arg_835_1.time_ and arg_835_1.time_ <= var_838_10 + arg_838_0 and arg_835_1.var_.characterEffect1028ui_story == nil then
				arg_835_1.var_.characterEffect1028ui_story = var_838_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_838_11 = 0.200000002980232

			if var_838_10 <= arg_835_1.time_ and arg_835_1.time_ < var_838_10 + var_838_11 then
				local var_838_12 = (arg_835_1.time_ - var_838_10) / var_838_11

				if arg_835_1.var_.characterEffect1028ui_story then
					arg_835_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_835_1.time_ >= var_838_10 + var_838_11 and arg_835_1.time_ < var_838_10 + var_838_11 + arg_838_0 and arg_835_1.var_.characterEffect1028ui_story then
				arg_835_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_838_13 = 0

			if var_838_13 < arg_835_1.time_ and arg_835_1.time_ <= var_838_13 + arg_838_0 then
				arg_835_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_838_14 = 0

			if var_838_14 < arg_835_1.time_ and arg_835_1.time_ <= var_838_14 + arg_838_0 then
				arg_835_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_838_15 = 0
			local var_838_16 = 0.1

			if var_838_15 < arg_835_1.time_ and arg_835_1.time_ <= var_838_15 + arg_838_0 then
				arg_835_1.talkMaxDuration = 0
				arg_835_1.dialogCg_.alpha = 1

				arg_835_1.dialog_:SetActive(true)
				SetActive(arg_835_1.leftNameGo_, true)

				local var_838_17 = arg_835_1:FormatText(StoryNameCfg[327].name)

				arg_835_1.leftNameTxt_.text = var_838_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_835_1.leftNameTxt_.transform)

				arg_835_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_835_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_835_1:RecordName(arg_835_1.leftNameTxt_.text)
				SetActive(arg_835_1.iconTrs_.gameObject, false)
				arg_835_1.callingController_:SetSelectedState("normal")

				local var_838_18 = arg_835_1:GetWordFromCfg(1102805202)
				local var_838_19 = arg_835_1:FormatText(var_838_18.content)

				arg_835_1.text_.text = var_838_19

				LuaForUtil.ClearLinePrefixSymbol(arg_835_1.text_)

				local var_838_20 = 4
				local var_838_21 = utf8.len(var_838_19)
				local var_838_22 = var_838_20 <= 0 and var_838_16 or var_838_16 * (var_838_21 / var_838_20)

				if var_838_22 > 0 and var_838_16 < var_838_22 then
					arg_835_1.talkMaxDuration = var_838_22

					if var_838_22 + var_838_15 > arg_835_1.duration_ then
						arg_835_1.duration_ = var_838_22 + var_838_15
					end
				end

				arg_835_1.text_.text = var_838_19
				arg_835_1.typewritter.percent = 0

				arg_835_1.typewritter:SetDirty()
				arg_835_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805202", "story_v_side_new_1102805.awb") ~= 0 then
					local var_838_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805202", "story_v_side_new_1102805.awb") / 1000

					if var_838_23 + var_838_15 > arg_835_1.duration_ then
						arg_835_1.duration_ = var_838_23 + var_838_15
					end

					if var_838_18.prefab_name ~= "" and arg_835_1.actors_[var_838_18.prefab_name] ~= nil then
						local var_838_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_835_1.actors_[var_838_18.prefab_name].transform, "story_v_side_new_1102805", "1102805202", "story_v_side_new_1102805.awb")

						arg_835_1:RecordAudio("1102805202", var_838_24)
						arg_835_1:RecordAudio("1102805202", var_838_24)
					else
						arg_835_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805202", "story_v_side_new_1102805.awb")
					end

					arg_835_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805202", "story_v_side_new_1102805.awb")
				end

				arg_835_1:RecordContent(arg_835_1.text_.text)
			end

			local var_838_25 = math.max(var_838_16, arg_835_1.talkMaxDuration)

			if var_838_15 <= arg_835_1.time_ and arg_835_1.time_ < var_838_15 + var_838_25 then
				arg_835_1.typewritter.percent = (arg_835_1.time_ - var_838_15) / var_838_25

				arg_835_1.typewritter:SetDirty()
			end

			if arg_835_1.time_ >= var_838_15 + var_838_25 and arg_835_1.time_ < var_838_15 + var_838_25 + arg_838_0 then
				arg_835_1.typewritter.percent = 1

				arg_835_1.typewritter:SetDirty()
				arg_835_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805203 = function(arg_839_0, arg_839_1)
		arg_839_1.time_ = 0
		arg_839_1.frameCnt_ = 0
		arg_839_1.state_ = "playing"
		arg_839_1.curTalkId_ = 1102805203
		arg_839_1.duration_ = 5

		SetActive(arg_839_1.tipsGo_, false)

		function arg_839_1.onSingleLineFinish_()
			arg_839_1.onSingleLineUpdate_ = nil
			arg_839_1.onSingleLineFinish_ = nil
			arg_839_1.state_ = "waiting"
			arg_839_1.auto_ = false
		end

		function arg_839_1.playNext_(arg_841_0)
			arg_839_1.onStoryFinished_()
		end

		function arg_839_1.onSingleLineUpdate_(arg_842_0)
			local var_842_0 = arg_839_1.actors_["1028ui_story"]
			local var_842_1 = 0

			if var_842_1 < arg_839_1.time_ and arg_839_1.time_ <= var_842_1 + arg_842_0 and arg_839_1.var_.characterEffect1028ui_story == nil then
				arg_839_1.var_.characterEffect1028ui_story = var_842_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_842_2 = 0.200000002980232

			if var_842_1 <= arg_839_1.time_ and arg_839_1.time_ < var_842_1 + var_842_2 then
				local var_842_3 = (arg_839_1.time_ - var_842_1) / var_842_2

				if arg_839_1.var_.characterEffect1028ui_story then
					local var_842_4 = Mathf.Lerp(0, 0.5, var_842_3)

					arg_839_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_839_1.var_.characterEffect1028ui_story.fillRatio = var_842_4
				end
			end

			if arg_839_1.time_ >= var_842_1 + var_842_2 and arg_839_1.time_ < var_842_1 + var_842_2 + arg_842_0 and arg_839_1.var_.characterEffect1028ui_story then
				local var_842_5 = 0.5

				arg_839_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_839_1.var_.characterEffect1028ui_story.fillRatio = var_842_5
			end

			local var_842_6 = 0
			local var_842_7 = 0.15

			if var_842_6 < arg_839_1.time_ and arg_839_1.time_ <= var_842_6 + arg_842_0 then
				arg_839_1.talkMaxDuration = 0
				arg_839_1.dialogCg_.alpha = 1

				arg_839_1.dialog_:SetActive(true)
				SetActive(arg_839_1.leftNameGo_, true)

				local var_842_8 = arg_839_1:FormatText(StoryNameCfg[7].name)

				arg_839_1.leftNameTxt_.text = var_842_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_839_1.leftNameTxt_.transform)

				arg_839_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_839_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_839_1:RecordName(arg_839_1.leftNameTxt_.text)
				SetActive(arg_839_1.iconTrs_.gameObject, false)
				arg_839_1.callingController_:SetSelectedState("normal")

				local var_842_9 = arg_839_1:GetWordFromCfg(1102805203)
				local var_842_10 = arg_839_1:FormatText(var_842_9.content)

				arg_839_1.text_.text = var_842_10

				LuaForUtil.ClearLinePrefixSymbol(arg_839_1.text_)

				local var_842_11 = 6
				local var_842_12 = utf8.len(var_842_10)
				local var_842_13 = var_842_11 <= 0 and var_842_7 or var_842_7 * (var_842_12 / var_842_11)

				if var_842_13 > 0 and var_842_7 < var_842_13 then
					arg_839_1.talkMaxDuration = var_842_13

					if var_842_13 + var_842_6 > arg_839_1.duration_ then
						arg_839_1.duration_ = var_842_13 + var_842_6
					end
				end

				arg_839_1.text_.text = var_842_10
				arg_839_1.typewritter.percent = 0

				arg_839_1.typewritter:SetDirty()
				arg_839_1:ShowNextGo(false)
				arg_839_1:RecordContent(arg_839_1.text_.text)
			end

			local var_842_14 = math.max(var_842_7, arg_839_1.talkMaxDuration)

			if var_842_6 <= arg_839_1.time_ and arg_839_1.time_ < var_842_6 + var_842_14 then
				arg_839_1.typewritter.percent = (arg_839_1.time_ - var_842_6) / var_842_14

				arg_839_1.typewritter:SetDirty()
			end

			if arg_839_1.time_ >= var_842_6 + var_842_14 and arg_839_1.time_ < var_842_6 + var_842_14 + arg_842_0 then
				arg_839_1.typewritter.percent = 1

				arg_839_1.typewritter:SetDirty()
				arg_839_1:ShowNextGo(true)
			end
		end
	end,
	Play1102805007 = function(arg_843_0, arg_843_1)
		arg_843_1.time_ = 0
		arg_843_1.frameCnt_ = 0
		arg_843_1.state_ = "playing"
		arg_843_1.curTalkId_ = 1102805007
		arg_843_1.duration_ = 2.966

		SetActive(arg_843_1.tipsGo_, false)

		function arg_843_1.onSingleLineFinish_()
			arg_843_1.onSingleLineUpdate_ = nil
			arg_843_1.onSingleLineFinish_ = nil
			arg_843_1.state_ = "waiting"
		end

		function arg_843_1.playNext_(arg_845_0)
			if arg_845_0 == 1 then
				arg_843_0:Play1102805008(arg_843_1)
			end
		end

		function arg_843_1.onSingleLineUpdate_(arg_846_0)
			local var_846_0 = arg_843_1.actors_["1028ui_story"].transform
			local var_846_1 = 0

			if var_846_1 < arg_843_1.time_ and arg_843_1.time_ <= var_846_1 + arg_846_0 then
				arg_843_1.var_.moveOldPos1028ui_story = var_846_0.localPosition
			end

			local var_846_2 = 0.001

			if var_846_1 <= arg_843_1.time_ and arg_843_1.time_ < var_846_1 + var_846_2 then
				local var_846_3 = (arg_843_1.time_ - var_846_1) / var_846_2
				local var_846_4 = Vector3.New(0, -0.9, -5.9)

				var_846_0.localPosition = Vector3.Lerp(arg_843_1.var_.moveOldPos1028ui_story, var_846_4, var_846_3)

				local var_846_5 = manager.ui.mainCamera.transform.position - var_846_0.position

				var_846_0.forward = Vector3.New(var_846_5.x, var_846_5.y, var_846_5.z)

				local var_846_6 = var_846_0.localEulerAngles

				var_846_6.z = 0
				var_846_6.x = 0
				var_846_0.localEulerAngles = var_846_6
			end

			if arg_843_1.time_ >= var_846_1 + var_846_2 and arg_843_1.time_ < var_846_1 + var_846_2 + arg_846_0 then
				var_846_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_846_7 = manager.ui.mainCamera.transform.position - var_846_0.position

				var_846_0.forward = Vector3.New(var_846_7.x, var_846_7.y, var_846_7.z)

				local var_846_8 = var_846_0.localEulerAngles

				var_846_8.z = 0
				var_846_8.x = 0
				var_846_0.localEulerAngles = var_846_8
			end

			local var_846_9 = arg_843_1.actors_["1028ui_story"]
			local var_846_10 = 0

			if var_846_10 < arg_843_1.time_ and arg_843_1.time_ <= var_846_10 + arg_846_0 and arg_843_1.var_.characterEffect1028ui_story == nil then
				arg_843_1.var_.characterEffect1028ui_story = var_846_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_846_11 = 0.200000002980232

			if var_846_10 <= arg_843_1.time_ and arg_843_1.time_ < var_846_10 + var_846_11 then
				local var_846_12 = (arg_843_1.time_ - var_846_10) / var_846_11

				if arg_843_1.var_.characterEffect1028ui_story then
					arg_843_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_843_1.time_ >= var_846_10 + var_846_11 and arg_843_1.time_ < var_846_10 + var_846_11 + arg_846_0 and arg_843_1.var_.characterEffect1028ui_story then
				arg_843_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_846_13 = 0

			if var_846_13 < arg_843_1.time_ and arg_843_1.time_ <= var_846_13 + arg_846_0 then
				arg_843_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action457")
			end

			local var_846_14 = 0

			if var_846_14 < arg_843_1.time_ and arg_843_1.time_ <= var_846_14 + arg_846_0 then
				arg_843_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_846_15 = 0
			local var_846_16 = 0.55

			if var_846_15 < arg_843_1.time_ and arg_843_1.time_ <= var_846_15 + arg_846_0 then
				arg_843_1.talkMaxDuration = 0
				arg_843_1.dialogCg_.alpha = 1

				arg_843_1.dialog_:SetActive(true)
				SetActive(arg_843_1.leftNameGo_, true)

				local var_846_17 = arg_843_1:FormatText(StoryNameCfg[327].name)

				arg_843_1.leftNameTxt_.text = var_846_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_843_1.leftNameTxt_.transform)

				arg_843_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_843_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_843_1:RecordName(arg_843_1.leftNameTxt_.text)
				SetActive(arg_843_1.iconTrs_.gameObject, false)
				arg_843_1.callingController_:SetSelectedState("normal")

				local var_846_18 = arg_843_1:GetWordFromCfg(1102805007)
				local var_846_19 = arg_843_1:FormatText(var_846_18.content)

				arg_843_1.text_.text = var_846_19

				LuaForUtil.ClearLinePrefixSymbol(arg_843_1.text_)

				local var_846_20 = 22
				local var_846_21 = utf8.len(var_846_19)
				local var_846_22 = var_846_20 <= 0 and var_846_16 or var_846_16 * (var_846_21 / var_846_20)

				if var_846_22 > 0 and var_846_16 < var_846_22 then
					arg_843_1.talkMaxDuration = var_846_22

					if var_846_22 + var_846_15 > arg_843_1.duration_ then
						arg_843_1.duration_ = var_846_22 + var_846_15
					end
				end

				arg_843_1.text_.text = var_846_19
				arg_843_1.typewritter.percent = 0

				arg_843_1.typewritter:SetDirty()
				arg_843_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805007", "story_v_side_new_1102805.awb") ~= 0 then
					local var_846_23 = manager.audio:GetVoiceLength("story_v_side_new_1102805", "1102805007", "story_v_side_new_1102805.awb") / 1000

					if var_846_23 + var_846_15 > arg_843_1.duration_ then
						arg_843_1.duration_ = var_846_23 + var_846_15
					end

					if var_846_18.prefab_name ~= "" and arg_843_1.actors_[var_846_18.prefab_name] ~= nil then
						local var_846_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_843_1.actors_[var_846_18.prefab_name].transform, "story_v_side_new_1102805", "1102805007", "story_v_side_new_1102805.awb")

						arg_843_1:RecordAudio("1102805007", var_846_24)
						arg_843_1:RecordAudio("1102805007", var_846_24)
					else
						arg_843_1:AudioAction("play", "voice", "story_v_side_new_1102805", "1102805007", "story_v_side_new_1102805.awb")
					end

					arg_843_1:RecordHistoryTalkVoice("story_v_side_new_1102805", "1102805007", "story_v_side_new_1102805.awb")
				end

				arg_843_1:RecordContent(arg_843_1.text_.text)
			end

			local var_846_25 = math.max(var_846_16, arg_843_1.talkMaxDuration)

			if var_846_15 <= arg_843_1.time_ and arg_843_1.time_ < var_846_15 + var_846_25 then
				arg_843_1.typewritter.percent = (arg_843_1.time_ - var_846_15) / var_846_25

				arg_843_1.typewritter:SetDirty()
			end

			if arg_843_1.time_ >= var_846_15 + var_846_25 and arg_843_1.time_ < var_846_15 + var_846_25 + arg_846_0 then
				arg_843_1.typewritter.percent = 1

				arg_843_1.typewritter:SetDirty()
				arg_843_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J02a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST10",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B04e",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B04e_blur",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A05",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A05_blur"
	},
	voices = {
		"story_v_side_new_1102805.awb"
	}
}
