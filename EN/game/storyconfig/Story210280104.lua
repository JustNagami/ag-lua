return {
	Play102804001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 102804001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play102804002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "H01a"

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
				local var_4_5 = arg_1_1.bgs_.H01a

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
					if iter_4_0 ~= "H01a" then
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
			local var_4_27 = 1.9

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1028ui_story = var_4_26.localPosition

				local var_4_28 = "1028ui_story"

				arg_1_1:ShowWeapon(arg_1_1.var_[var_4_28 .. "Animator"].transform, false)
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
			local var_4_37 = 1.9

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1028ui_story == nil then
				arg_1_1.var_.characterEffect1028ui_story = var_4_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_38 = 0.2

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 then
				local var_4_39 = (arg_1_1.time_ - var_4_37) / var_4_38

				if arg_1_1.var_.characterEffect1028ui_story then
					local var_4_40 = Mathf.Lerp(0, 0.5, var_4_39)

					arg_1_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_1_1.var_.characterEffect1028ui_story.fillRatio = var_4_40
				end
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1028ui_story then
				local var_4_41 = 0.5

				arg_1_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_1_1.var_.characterEffect1028ui_story.fillRatio = var_4_41
			end

			local var_4_42 = 1.9

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_4_43 = 1.9

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_4_44 = 0
			local var_4_45 = 0.2

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				local var_4_46 = "play"
				local var_4_47 = "music"

				arg_1_1:AudioAction(var_4_46, var_4_47, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_48 = 1.9
			local var_4_49 = 1

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				local var_4_50 = "play"
				local var_4_51 = "music"

				arg_1_1:AudioAction(var_4_50, var_4_51, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			local var_4_52 = 1.9
			local var_4_53 = 1

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				local var_4_54 = "play"
				local var_4_55 = "effect"

				arg_1_1:AudioAction(var_4_54, var_4_55, "se_story_side_1028", "se_story_1028_largewaveloop", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_56 = 2
			local var_4_57 = 0.2

			if var_4_56 < arg_1_1.time_ and arg_1_1.time_ <= var_4_56 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_58 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_58:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_59 = arg_1_1:FormatText(StoryNameCfg[7].name)

				arg_1_1.leftNameTxt_.text = var_4_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_60 = arg_1_1:GetWordFromCfg(102804001)
				local var_4_61 = arg_1_1:FormatText(var_4_60.content)

				arg_1_1.text_.text = var_4_61

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_62 = 8
				local var_4_63 = utf8.len(var_4_61)
				local var_4_64 = var_4_62 <= 0 and var_4_57 or var_4_57 * (var_4_63 / var_4_62)

				if var_4_64 > 0 and var_4_57 < var_4_64 then
					arg_1_1.talkMaxDuration = var_4_64
					var_4_56 = var_4_56 + 0.3

					if var_4_64 + var_4_56 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_64 + var_4_56
					end
				end

				arg_1_1.text_.text = var_4_61
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_65 = var_4_56 + 0.3
			local var_4_66 = math.max(var_4_57, arg_1_1.talkMaxDuration)

			if var_4_65 <= arg_1_1.time_ and arg_1_1.time_ < var_4_65 + var_4_66 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_65) / var_4_66

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_65 + var_4_66 and arg_1_1.time_ < var_4_65 + var_4_66 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play102804002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 102804002
		arg_7_1.duration_ = 0.999999999999

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play102804003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1028ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1028ui_story == nil then
				arg_7_1.var_.characterEffect1028ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.2

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1028ui_story then
					arg_7_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1028ui_story then
				arg_7_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_10_4 = 0
			local var_10_5 = 0.05

			if var_10_4 < arg_7_1.time_ and arg_7_1.time_ <= var_10_4 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_6 = arg_7_1:FormatText(StoryNameCfg[327].name)

				arg_7_1.leftNameTxt_.text = var_10_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_7 = arg_7_1:GetWordFromCfg(102804002)
				local var_10_8 = arg_7_1:FormatText(var_10_7.content)

				arg_7_1.text_.text = var_10_8

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_9 = 2
				local var_10_10 = utf8.len(var_10_8)
				local var_10_11 = var_10_9 <= 0 and var_10_5 or var_10_5 * (var_10_10 / var_10_9)

				if var_10_11 > 0 and var_10_5 < var_10_11 then
					arg_7_1.talkMaxDuration = var_10_11

					if var_10_11 + var_10_4 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_11 + var_10_4
					end
				end

				arg_7_1.text_.text = var_10_8
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804002", "story_v_side_old_102804.awb") ~= 0 then
					local var_10_12 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804002", "story_v_side_old_102804.awb") / 1000

					if var_10_12 + var_10_4 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_12 + var_10_4
					end

					if var_10_7.prefab_name ~= "" and arg_7_1.actors_[var_10_7.prefab_name] ~= nil then
						local var_10_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_7.prefab_name].transform, "story_v_side_old_102804", "102804002", "story_v_side_old_102804.awb")

						arg_7_1:RecordAudio("102804002", var_10_13)
						arg_7_1:RecordAudio("102804002", var_10_13)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804002", "story_v_side_old_102804.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804002", "story_v_side_old_102804.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_14 = math.max(var_10_5, arg_7_1.talkMaxDuration)

			if var_10_4 <= arg_7_1.time_ and arg_7_1.time_ < var_10_4 + var_10_14 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_4) / var_10_14

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_4 + var_10_14 and arg_7_1.time_ < var_10_4 + var_10_14 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play102804003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 102804003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play102804004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1028ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1028ui_story == nil then
				arg_11_1.var_.characterEffect1028ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.2

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1028ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1028ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1028ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1028ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.825

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

				local var_14_8 = arg_11_1:GetWordFromCfg(102804003)
				local var_14_9 = arg_11_1:FormatText(var_14_8.content)

				arg_11_1.text_.text = var_14_9

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_10 = 33
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
	Play102804004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 102804004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play102804005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.55

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

				local var_18_2 = arg_15_1:GetWordFromCfg(102804004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 22
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
	Play102804005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 102804005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play102804006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.525

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(102804005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 21
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
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_8 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_8 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_8

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_8 and arg_19_1.time_ < var_22_0 + var_22_8 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play102804006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 102804006
		arg_23_1.duration_ = 2.033

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play102804007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1028ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1028ui_story == nil then
				arg_23_1.var_.characterEffect1028ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1028ui_story then
					arg_23_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1028ui_story then
				arg_23_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_26_5 = 0
			local var_26_6 = 0.275

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_7 = arg_23_1:FormatText(StoryNameCfg[327].name)

				arg_23_1.leftNameTxt_.text = var_26_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(102804006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 11
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_6 or var_26_6 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_6 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_5 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_5
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804006", "story_v_side_old_102804.awb") ~= 0 then
					local var_26_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804006", "story_v_side_old_102804.awb") / 1000

					if var_26_13 + var_26_5 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_5
					end

					if var_26_8.prefab_name ~= "" and arg_23_1.actors_[var_26_8.prefab_name] ~= nil then
						local var_26_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_8.prefab_name].transform, "story_v_side_old_102804", "102804006", "story_v_side_old_102804.awb")

						arg_23_1:RecordAudio("102804006", var_26_14)
						arg_23_1:RecordAudio("102804006", var_26_14)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804006", "story_v_side_old_102804.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804006", "story_v_side_old_102804.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_15 = math.max(var_26_6, arg_23_1.talkMaxDuration)

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_15 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_5) / var_26_15

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_5 + var_26_15 and arg_23_1.time_ < var_26_5 + var_26_15 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play102804007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 102804007
		arg_27_1.duration_ = 2.1

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play102804008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1028ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1028ui_story == nil then
				arg_27_1.var_.characterEffect1028ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1028ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1028ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1028ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1028ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 0.766666666666667

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				local var_30_8 = "play"
				local var_30_9 = "effect"

				arg_27_1:AudioAction(var_30_8, var_30_9, "se_story_side_1028", "se_story_1028_qidi01", "")
			end

			local var_30_10 = 0
			local var_30_11 = 0.175

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_12 = arg_27_1:FormatText(StoryNameCfg[365].name)

				arg_27_1.leftNameTxt_.text = var_30_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_13 = arg_27_1:GetWordFromCfg(102804007)
				local var_30_14 = arg_27_1:FormatText(var_30_13.content)

				arg_27_1.text_.text = var_30_14

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_15 = 7
				local var_30_16 = utf8.len(var_30_14)
				local var_30_17 = var_30_15 <= 0 and var_30_11 or var_30_11 * (var_30_16 / var_30_15)

				if var_30_17 > 0 and var_30_11 < var_30_17 then
					arg_27_1.talkMaxDuration = var_30_17

					if var_30_17 + var_30_10 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_17 + var_30_10
					end
				end

				arg_27_1.text_.text = var_30_14
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804007", "story_v_side_old_102804.awb") ~= 0 then
					local var_30_18 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804007", "story_v_side_old_102804.awb") / 1000

					if var_30_18 + var_30_10 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_18 + var_30_10
					end

					if var_30_13.prefab_name ~= "" and arg_27_1.actors_[var_30_13.prefab_name] ~= nil then
						local var_30_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_13.prefab_name].transform, "story_v_side_old_102804", "102804007", "story_v_side_old_102804.awb")

						arg_27_1:RecordAudio("102804007", var_30_19)
						arg_27_1:RecordAudio("102804007", var_30_19)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804007", "story_v_side_old_102804.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804007", "story_v_side_old_102804.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_20 = math.max(var_30_11, arg_27_1.talkMaxDuration)

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_20 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_10) / var_30_20

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_10 + var_30_20 and arg_27_1.time_ < var_30_10 + var_30_20 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play102804008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 102804008
		arg_31_1.duration_ = 1.999999999999

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play102804009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1028ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1028ui_story == nil then
				arg_31_1.var_.characterEffect1028ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.2

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1028ui_story then
					arg_31_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1028ui_story then
				arg_31_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_34_4 = 0

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				arg_31_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_34_5 = 0
			local var_34_6 = 0.1

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_7 = arg_31_1:FormatText(StoryNameCfg[327].name)

				arg_31_1.leftNameTxt_.text = var_34_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_8 = arg_31_1:GetWordFromCfg(102804008)
				local var_34_9 = arg_31_1:FormatText(var_34_8.content)

				arg_31_1.text_.text = var_34_9

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_10 = 4
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

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804008", "story_v_side_old_102804.awb") ~= 0 then
					local var_34_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804008", "story_v_side_old_102804.awb") / 1000

					if var_34_13 + var_34_5 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_5
					end

					if var_34_8.prefab_name ~= "" and arg_31_1.actors_[var_34_8.prefab_name] ~= nil then
						local var_34_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_8.prefab_name].transform, "story_v_side_old_102804", "102804008", "story_v_side_old_102804.awb")

						arg_31_1:RecordAudio("102804008", var_34_14)
						arg_31_1:RecordAudio("102804008", var_34_14)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804008", "story_v_side_old_102804.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804008", "story_v_side_old_102804.awb")
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
	Play102804009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 102804009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play102804010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1028ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1028ui_story == nil then
				arg_35_1.var_.characterEffect1028ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1028ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1028ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1028ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1028ui_story.fillRatio = var_38_5
			end

			local var_38_6 = 0
			local var_38_7 = 0.75

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[7].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(102804009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 30
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
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_14 and arg_35_1.time_ < var_38_6 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play102804010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 102804010
		arg_39_1.duration_ = 6.866

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play102804011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1028ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1028ui_story == nil then
				arg_39_1.var_.characterEffect1028ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1028ui_story then
					arg_39_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1028ui_story then
				arg_39_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_42_5 = 0
			local var_42_6 = 0.7

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_7 = arg_39_1:FormatText(StoryNameCfg[327].name)

				arg_39_1.leftNameTxt_.text = var_42_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_8 = arg_39_1:GetWordFromCfg(102804010)
				local var_42_9 = arg_39_1:FormatText(var_42_8.content)

				arg_39_1.text_.text = var_42_9

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_10 = 28
				local var_42_11 = utf8.len(var_42_9)
				local var_42_12 = var_42_10 <= 0 and var_42_6 or var_42_6 * (var_42_11 / var_42_10)

				if var_42_12 > 0 and var_42_6 < var_42_12 then
					arg_39_1.talkMaxDuration = var_42_12

					if var_42_12 + var_42_5 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_12 + var_42_5
					end
				end

				arg_39_1.text_.text = var_42_9
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804010", "story_v_side_old_102804.awb") ~= 0 then
					local var_42_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804010", "story_v_side_old_102804.awb") / 1000

					if var_42_13 + var_42_5 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_5
					end

					if var_42_8.prefab_name ~= "" and arg_39_1.actors_[var_42_8.prefab_name] ~= nil then
						local var_42_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_8.prefab_name].transform, "story_v_side_old_102804", "102804010", "story_v_side_old_102804.awb")

						arg_39_1:RecordAudio("102804010", var_42_14)
						arg_39_1:RecordAudio("102804010", var_42_14)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804010", "story_v_side_old_102804.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804010", "story_v_side_old_102804.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_15 = math.max(var_42_6, arg_39_1.talkMaxDuration)

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_15 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_5) / var_42_15

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_5 + var_42_15 and arg_39_1.time_ < var_42_5 + var_42_15 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play102804011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 102804011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play102804012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1028ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1028ui_story == nil then
				arg_43_1.var_.characterEffect1028ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1028ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1028ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1028ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1028ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0
			local var_46_7 = 0.175

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[7].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(102804011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 7
				local var_46_12 = utf8.len(var_46_10)
				local var_46_13 = var_46_11 <= 0 and var_46_7 or var_46_7 * (var_46_12 / var_46_11)

				if var_46_13 > 0 and var_46_7 < var_46_13 then
					arg_43_1.talkMaxDuration = var_46_13

					if var_46_13 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_10
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_14 and arg_43_1.time_ < var_46_6 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play102804012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 102804012
		arg_47_1.duration_ = 3.433

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play102804013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1028ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1028ui_story == nil then
				arg_47_1.var_.characterEffect1028ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1028ui_story then
					arg_47_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1028ui_story then
				arg_47_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_50_5 = 0
			local var_50_6 = 0.3

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_7 = arg_47_1:FormatText(StoryNameCfg[327].name)

				arg_47_1.leftNameTxt_.text = var_50_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_8 = arg_47_1:GetWordFromCfg(102804012)
				local var_50_9 = arg_47_1:FormatText(var_50_8.content)

				arg_47_1.text_.text = var_50_9

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_10 = 12
				local var_50_11 = utf8.len(var_50_9)
				local var_50_12 = var_50_10 <= 0 and var_50_6 or var_50_6 * (var_50_11 / var_50_10)

				if var_50_12 > 0 and var_50_6 < var_50_12 then
					arg_47_1.talkMaxDuration = var_50_12

					if var_50_12 + var_50_5 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_12 + var_50_5
					end
				end

				arg_47_1.text_.text = var_50_9
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804012", "story_v_side_old_102804.awb") ~= 0 then
					local var_50_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804012", "story_v_side_old_102804.awb") / 1000

					if var_50_13 + var_50_5 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_5
					end

					if var_50_8.prefab_name ~= "" and arg_47_1.actors_[var_50_8.prefab_name] ~= nil then
						local var_50_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_8.prefab_name].transform, "story_v_side_old_102804", "102804012", "story_v_side_old_102804.awb")

						arg_47_1:RecordAudio("102804012", var_50_14)
						arg_47_1:RecordAudio("102804012", var_50_14)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804012", "story_v_side_old_102804.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804012", "story_v_side_old_102804.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_15 = math.max(var_50_6, arg_47_1.talkMaxDuration)

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_15 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_5) / var_50_15

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_5 + var_50_15 and arg_47_1.time_ < var_50_5 + var_50_15 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play102804013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 102804013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play102804014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1028ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1028ui_story == nil then
				arg_51_1.var_.characterEffect1028ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1028ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1028ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1028ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1028ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.175

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

				local var_54_9 = arg_51_1:GetWordFromCfg(102804013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 7
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
	Play102804014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 102804014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play102804015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.5

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

				local var_58_2 = arg_55_1:GetWordFromCfg(102804014)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 20
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
	Play102804015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 102804015
		arg_59_1.duration_ = 9

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play102804016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_1 = 2

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_1 then
				local var_62_2 = (arg_59_1.time_ - var_62_0) / var_62_1
				local var_62_3 = Color.New(0, 0, 0)

				var_62_3.a = Mathf.Lerp(0, 1, var_62_2)
				arg_59_1.mask_.color = var_62_3
			end

			if arg_59_1.time_ >= var_62_0 + var_62_1 and arg_59_1.time_ < var_62_0 + var_62_1 + arg_62_0 then
				local var_62_4 = Color.New(0, 0, 0)

				var_62_4.a = 1
				arg_59_1.mask_.color = var_62_4
			end

			local var_62_5 = 2

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_6 = 2

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6
				local var_62_8 = Color.New(0, 0, 0)

				var_62_8.a = Mathf.Lerp(1, 0, var_62_7)
				arg_59_1.mask_.color = var_62_8
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 then
				local var_62_9 = Color.New(0, 0, 0)
				local var_62_10 = 0

				arg_59_1.mask_.enabled = false
				var_62_9.a = var_62_10
				arg_59_1.mask_.color = var_62_9
			end

			local var_62_11 = arg_59_1.actors_["1028ui_story"].transform
			local var_62_12 = 1.96666666666667

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.var_.moveOldPos1028ui_story = var_62_11.localPosition

				local var_62_13 = "1028ui_story"

				arg_59_1:ShowWeapon(arg_59_1.var_[var_62_13 .. "Animator"].transform, false)
			end

			local var_62_14 = 0.001

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_14 then
				local var_62_15 = (arg_59_1.time_ - var_62_12) / var_62_14
				local var_62_16 = Vector3.New(0, 100, 0)

				var_62_11.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1028ui_story, var_62_16, var_62_15)

				local var_62_17 = manager.ui.mainCamera.transform.position - var_62_11.position

				var_62_11.forward = Vector3.New(var_62_17.x, var_62_17.y, var_62_17.z)

				local var_62_18 = var_62_11.localEulerAngles

				var_62_18.z = 0
				var_62_18.x = 0
				var_62_11.localEulerAngles = var_62_18
			end

			if arg_59_1.time_ >= var_62_12 + var_62_14 and arg_59_1.time_ < var_62_12 + var_62_14 + arg_62_0 then
				var_62_11.localPosition = Vector3.New(0, 100, 0)

				local var_62_19 = manager.ui.mainCamera.transform.position - var_62_11.position

				var_62_11.forward = Vector3.New(var_62_19.x, var_62_19.y, var_62_19.z)

				local var_62_20 = var_62_11.localEulerAngles

				var_62_20.z = 0
				var_62_20.x = 0
				var_62_11.localEulerAngles = var_62_20
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_21 = 4
			local var_62_22 = 0.875

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_23 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_23:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_24 = arg_59_1:GetWordFromCfg(102804015)
				local var_62_25 = arg_59_1:FormatText(var_62_24.content)

				arg_59_1.text_.text = var_62_25

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_26 = 35
				local var_62_27 = utf8.len(var_62_25)
				local var_62_28 = var_62_26 <= 0 and var_62_22 or var_62_22 * (var_62_27 / var_62_26)

				if var_62_28 > 0 and var_62_22 < var_62_28 then
					arg_59_1.talkMaxDuration = var_62_28
					var_62_21 = var_62_21 + 0.3

					if var_62_28 + var_62_21 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_28 + var_62_21
					end
				end

				arg_59_1.text_.text = var_62_25
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_29 = var_62_21 + 0.3
			local var_62_30 = math.max(var_62_22, arg_59_1.talkMaxDuration)

			if var_62_29 <= arg_59_1.time_ and arg_59_1.time_ < var_62_29 + var_62_30 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_29) / var_62_30

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_29 + var_62_30 and arg_59_1.time_ < var_62_29 + var_62_30 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play102804016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 102804016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play102804017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.766666666666667

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				local var_68_2 = "play"
				local var_68_3 = "effect"

				arg_65_1:AudioAction(var_68_2, var_68_3, "se_story_side_1028", "se_story_1028_warning", "")
			end

			local var_68_4 = 0
			local var_68_5 = 0.15

			if var_68_4 < arg_65_1.time_ and arg_65_1.time_ <= var_68_4 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_6 = arg_65_1:GetWordFromCfg(102804016)
				local var_68_7 = arg_65_1:FormatText(var_68_6.content)

				arg_65_1.text_.text = var_68_7

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_8 = 6
				local var_68_9 = utf8.len(var_68_7)
				local var_68_10 = var_68_8 <= 0 and var_68_5 or var_68_5 * (var_68_9 / var_68_8)

				if var_68_10 > 0 and var_68_5 < var_68_10 then
					arg_65_1.talkMaxDuration = var_68_10

					if var_68_10 + var_68_4 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_10 + var_68_4
					end
				end

				arg_65_1.text_.text = var_68_7
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_11 = math.max(var_68_5, arg_65_1.talkMaxDuration)

			if var_68_4 <= arg_65_1.time_ and arg_65_1.time_ < var_68_4 + var_68_11 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_4) / var_68_11

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_4 + var_68_11 and arg_65_1.time_ < var_68_4 + var_68_11 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play102804017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 102804017
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play102804018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.425

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_2 = arg_69_1:GetWordFromCfg(102804017)
				local var_72_3 = arg_69_1:FormatText(var_72_2.content)

				arg_69_1.text_.text = var_72_3

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_4 = 17
				local var_72_5 = utf8.len(var_72_3)
				local var_72_6 = var_72_4 <= 0 and var_72_1 or var_72_1 * (var_72_5 / var_72_4)

				if var_72_6 > 0 and var_72_1 < var_72_6 then
					arg_69_1.talkMaxDuration = var_72_6

					if var_72_6 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_6 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_3
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_7 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_7 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_7

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_7 and arg_69_1.time_ < var_72_0 + var_72_7 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play102804018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 102804018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play102804019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1028ui_story"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos1028ui_story = var_76_0.localPosition

				local var_76_2 = "1028ui_story"

				arg_73_1:ShowWeapon(arg_73_1.var_[var_76_2 .. "Animator"].transform, false)
			end

			local var_76_3 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_3 then
				local var_76_4 = (arg_73_1.time_ - var_76_1) / var_76_3
				local var_76_5 = Vector3.New(0, -0.9, -5.9)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1028ui_story, var_76_5, var_76_4)

				local var_76_6 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_6.x, var_76_6.y, var_76_6.z)

				local var_76_7 = var_76_0.localEulerAngles

				var_76_7.z = 0
				var_76_7.x = 0
				var_76_0.localEulerAngles = var_76_7
			end

			if arg_73_1.time_ >= var_76_1 + var_76_3 and arg_73_1.time_ < var_76_1 + var_76_3 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_76_8 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_8.x, var_76_8.y, var_76_8.z)

				local var_76_9 = var_76_0.localEulerAngles

				var_76_9.z = 0
				var_76_9.x = 0
				var_76_0.localEulerAngles = var_76_9
			end

			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_76_11 = 0
			local var_76_12 = 0.4

			if var_76_11 < arg_73_1.time_ and arg_73_1.time_ <= var_76_11 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_13 = arg_73_1:FormatText(StoryNameCfg[7].name)

				arg_73_1.leftNameTxt_.text = var_76_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_14 = arg_73_1:GetWordFromCfg(102804018)
				local var_76_15 = arg_73_1:FormatText(var_76_14.content)

				arg_73_1.text_.text = var_76_15

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_16 = 16
				local var_76_17 = utf8.len(var_76_15)
				local var_76_18 = var_76_16 <= 0 and var_76_12 or var_76_12 * (var_76_17 / var_76_16)

				if var_76_18 > 0 and var_76_12 < var_76_18 then
					arg_73_1.talkMaxDuration = var_76_18

					if var_76_18 + var_76_11 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_18 + var_76_11
					end
				end

				arg_73_1.text_.text = var_76_15
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_19 = math.max(var_76_12, arg_73_1.talkMaxDuration)

			if var_76_11 <= arg_73_1.time_ and arg_73_1.time_ < var_76_11 + var_76_19 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_11) / var_76_19

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_11 + var_76_19 and arg_73_1.time_ < var_76_11 + var_76_19 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play102804019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 102804019
		arg_77_1.duration_ = 4.2

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play102804020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1028ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1028ui_story == nil then
				arg_77_1.var_.characterEffect1028ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.2

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1028ui_story then
					arg_77_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1028ui_story then
				arg_77_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_80_4 = 0

			if var_80_4 < arg_77_1.time_ and arg_77_1.time_ <= var_80_4 + arg_80_0 then
				arg_77_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_80_5 = 0
			local var_80_6 = 0.375

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_7 = arg_77_1:FormatText(StoryNameCfg[327].name)

				arg_77_1.leftNameTxt_.text = var_80_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_8 = arg_77_1:GetWordFromCfg(102804019)
				local var_80_9 = arg_77_1:FormatText(var_80_8.content)

				arg_77_1.text_.text = var_80_9

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_10 = 15
				local var_80_11 = utf8.len(var_80_9)
				local var_80_12 = var_80_10 <= 0 and var_80_6 or var_80_6 * (var_80_11 / var_80_10)

				if var_80_12 > 0 and var_80_6 < var_80_12 then
					arg_77_1.talkMaxDuration = var_80_12

					if var_80_12 + var_80_5 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_12 + var_80_5
					end
				end

				arg_77_1.text_.text = var_80_9
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804019", "story_v_side_old_102804.awb") ~= 0 then
					local var_80_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804019", "story_v_side_old_102804.awb") / 1000

					if var_80_13 + var_80_5 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_13 + var_80_5
					end

					if var_80_8.prefab_name ~= "" and arg_77_1.actors_[var_80_8.prefab_name] ~= nil then
						local var_80_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_8.prefab_name].transform, "story_v_side_old_102804", "102804019", "story_v_side_old_102804.awb")

						arg_77_1:RecordAudio("102804019", var_80_14)
						arg_77_1:RecordAudio("102804019", var_80_14)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804019", "story_v_side_old_102804.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804019", "story_v_side_old_102804.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_15 = math.max(var_80_6, arg_77_1.talkMaxDuration)

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_15 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_5) / var_80_15

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_5 + var_80_15 and arg_77_1.time_ < var_80_5 + var_80_15 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play102804020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 102804020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play102804021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1028ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1028ui_story == nil then
				arg_81_1.var_.characterEffect1028ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.2

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1028ui_story then
					local var_84_4 = Mathf.Lerp(0, 0.5, var_84_3)

					arg_81_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1028ui_story.fillRatio = var_84_4
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1028ui_story then
				local var_84_5 = 0.5

				arg_81_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1028ui_story.fillRatio = var_84_5
			end

			local var_84_6 = 0
			local var_84_7 = 0.75

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_8 = arg_81_1:FormatText(StoryNameCfg[7].name)

				arg_81_1.leftNameTxt_.text = var_84_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_9 = arg_81_1:GetWordFromCfg(102804020)
				local var_84_10 = arg_81_1:FormatText(var_84_9.content)

				arg_81_1.text_.text = var_84_10

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_11 = 30
				local var_84_12 = utf8.len(var_84_10)
				local var_84_13 = var_84_11 <= 0 and var_84_7 or var_84_7 * (var_84_12 / var_84_11)

				if var_84_13 > 0 and var_84_7 < var_84_13 then
					arg_81_1.talkMaxDuration = var_84_13

					if var_84_13 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_13 + var_84_6
					end
				end

				arg_81_1.text_.text = var_84_10
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_14 = math.max(var_84_7, arg_81_1.talkMaxDuration)

			if var_84_6 <= arg_81_1.time_ and arg_81_1.time_ < var_84_6 + var_84_14 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_6) / var_84_14

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_6 + var_84_14 and arg_81_1.time_ < var_84_6 + var_84_14 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play102804021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 102804021
		arg_85_1.duration_ = 3.566

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play102804022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1028ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1028ui_story == nil then
				arg_85_1.var_.characterEffect1028ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.2

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1028ui_story then
					arg_85_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1028ui_story then
				arg_85_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_88_4 = 0

			if var_88_4 < arg_85_1.time_ and arg_85_1.time_ <= var_88_4 + arg_88_0 then
				arg_85_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 then
				arg_85_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_2")
			end

			local var_88_6 = 0
			local var_88_7 = 0.25

			if var_88_6 < arg_85_1.time_ and arg_85_1.time_ <= var_88_6 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_8 = arg_85_1:FormatText(StoryNameCfg[327].name)

				arg_85_1.leftNameTxt_.text = var_88_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_9 = arg_85_1:GetWordFromCfg(102804021)
				local var_88_10 = arg_85_1:FormatText(var_88_9.content)

				arg_85_1.text_.text = var_88_10

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_11 = 10
				local var_88_12 = utf8.len(var_88_10)
				local var_88_13 = var_88_11 <= 0 and var_88_7 or var_88_7 * (var_88_12 / var_88_11)

				if var_88_13 > 0 and var_88_7 < var_88_13 then
					arg_85_1.talkMaxDuration = var_88_13

					if var_88_13 + var_88_6 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_13 + var_88_6
					end
				end

				arg_85_1.text_.text = var_88_10
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804021", "story_v_side_old_102804.awb") ~= 0 then
					local var_88_14 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804021", "story_v_side_old_102804.awb") / 1000

					if var_88_14 + var_88_6 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_14 + var_88_6
					end

					if var_88_9.prefab_name ~= "" and arg_85_1.actors_[var_88_9.prefab_name] ~= nil then
						local var_88_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_9.prefab_name].transform, "story_v_side_old_102804", "102804021", "story_v_side_old_102804.awb")

						arg_85_1:RecordAudio("102804021", var_88_15)
						arg_85_1:RecordAudio("102804021", var_88_15)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804021", "story_v_side_old_102804.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804021", "story_v_side_old_102804.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_16 = math.max(var_88_7, arg_85_1.talkMaxDuration)

			if var_88_6 <= arg_85_1.time_ and arg_85_1.time_ < var_88_6 + var_88_16 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_6) / var_88_16

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_6 + var_88_16 and arg_85_1.time_ < var_88_6 + var_88_16 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play102804022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 102804022
		arg_89_1.duration_ = 1.6

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play102804023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1028ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1028ui_story == nil then
				arg_89_1.var_.characterEffect1028ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.2

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1028ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1028ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1028ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1028ui_story.fillRatio = var_92_5
			end

			local var_92_6 = 0
			local var_92_7 = 0.833333333333333

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				local var_92_8 = "play"
				local var_92_9 = "effect"

				arg_89_1:AudioAction(var_92_8, var_92_9, "se_story_side_1028", "se_story_1028_qidi02", "")
			end

			local var_92_10 = 0
			local var_92_11 = 0.175

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_12 = arg_89_1:FormatText(StoryNameCfg[365].name)

				arg_89_1.leftNameTxt_.text = var_92_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_13 = arg_89_1:GetWordFromCfg(102804022)
				local var_92_14 = arg_89_1:FormatText(var_92_13.content)

				arg_89_1.text_.text = var_92_14

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_15 = 7
				local var_92_16 = utf8.len(var_92_14)
				local var_92_17 = var_92_15 <= 0 and var_92_11 or var_92_11 * (var_92_16 / var_92_15)

				if var_92_17 > 0 and var_92_11 < var_92_17 then
					arg_89_1.talkMaxDuration = var_92_17

					if var_92_17 + var_92_10 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_17 + var_92_10
					end
				end

				arg_89_1.text_.text = var_92_14
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804022", "story_v_side_old_102804.awb") ~= 0 then
					local var_92_18 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804022", "story_v_side_old_102804.awb") / 1000

					if var_92_18 + var_92_10 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_18 + var_92_10
					end

					if var_92_13.prefab_name ~= "" and arg_89_1.actors_[var_92_13.prefab_name] ~= nil then
						local var_92_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_13.prefab_name].transform, "story_v_side_old_102804", "102804022", "story_v_side_old_102804.awb")

						arg_89_1:RecordAudio("102804022", var_92_19)
						arg_89_1:RecordAudio("102804022", var_92_19)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804022", "story_v_side_old_102804.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804022", "story_v_side_old_102804.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_20 = math.max(var_92_11, arg_89_1.talkMaxDuration)

			if var_92_10 <= arg_89_1.time_ and arg_89_1.time_ < var_92_10 + var_92_20 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_10) / var_92_20

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_10 + var_92_20 and arg_89_1.time_ < var_92_10 + var_92_20 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play102804023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 102804023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play102804024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.9

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

				local var_96_2 = arg_93_1:GetWordFromCfg(102804023)
				local var_96_3 = arg_93_1:FormatText(var_96_2.content)

				arg_93_1.text_.text = var_96_3

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_4 = 36
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
	Play102804024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 102804024
		arg_97_1.duration_ = 3.033

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play102804025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1028ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1028ui_story == nil then
				arg_97_1.var_.characterEffect1028ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.2

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1028ui_story then
					arg_97_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1028ui_story then
				arg_97_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_100_4 = 0

			if var_100_4 < arg_97_1.time_ and arg_97_1.time_ <= var_100_4 + arg_100_0 then
				arg_97_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_100_5 = 0
			local var_100_6 = 0.1

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_7 = arg_97_1:FormatText(StoryNameCfg[327].name)

				arg_97_1.leftNameTxt_.text = var_100_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_8 = arg_97_1:GetWordFromCfg(102804024)
				local var_100_9 = arg_97_1:FormatText(var_100_8.content)

				arg_97_1.text_.text = var_100_9

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_10 = 4
				local var_100_11 = utf8.len(var_100_9)
				local var_100_12 = var_100_10 <= 0 and var_100_6 or var_100_6 * (var_100_11 / var_100_10)

				if var_100_12 > 0 and var_100_6 < var_100_12 then
					arg_97_1.talkMaxDuration = var_100_12

					if var_100_12 + var_100_5 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_12 + var_100_5
					end
				end

				arg_97_1.text_.text = var_100_9
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804024", "story_v_side_old_102804.awb") ~= 0 then
					local var_100_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804024", "story_v_side_old_102804.awb") / 1000

					if var_100_13 + var_100_5 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_13 + var_100_5
					end

					if var_100_8.prefab_name ~= "" and arg_97_1.actors_[var_100_8.prefab_name] ~= nil then
						local var_100_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_8.prefab_name].transform, "story_v_side_old_102804", "102804024", "story_v_side_old_102804.awb")

						arg_97_1:RecordAudio("102804024", var_100_14)
						arg_97_1:RecordAudio("102804024", var_100_14)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804024", "story_v_side_old_102804.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804024", "story_v_side_old_102804.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_15 = math.max(var_100_6, arg_97_1.talkMaxDuration)

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_15 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_5) / var_100_15

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_5 + var_100_15 and arg_97_1.time_ < var_100_5 + var_100_15 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play102804025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 102804025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play102804026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1028ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1028ui_story == nil then
				arg_101_1.var_.characterEffect1028ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.2

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1028ui_story then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1028ui_story.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1028ui_story then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1028ui_story.fillRatio = var_104_5
			end

			local var_104_6 = 0
			local var_104_7 = 0.325

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

				local var_104_8 = arg_101_1:GetWordFromCfg(102804025)
				local var_104_9 = arg_101_1:FormatText(var_104_8.content)

				arg_101_1.text_.text = var_104_9

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_10 = 13
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
	Play102804026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 102804026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play102804027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.775

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[7].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(102804026)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 31
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
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_8 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_8 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_8

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_8 and arg_105_1.time_ < var_108_0 + var_108_8 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play102804027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 102804027
		arg_109_1.duration_ = 3.533

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play102804028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1028ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1028ui_story == nil then
				arg_109_1.var_.characterEffect1028ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.2

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1028ui_story then
					arg_109_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1028ui_story then
				arg_109_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_112_4 = 0

			if var_112_4 < arg_109_1.time_ and arg_109_1.time_ <= var_112_4 + arg_112_0 then
				arg_109_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 then
				arg_109_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_112_6 = 0
			local var_112_7 = 0.45

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_8 = arg_109_1:FormatText(StoryNameCfg[327].name)

				arg_109_1.leftNameTxt_.text = var_112_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_9 = arg_109_1:GetWordFromCfg(102804027)
				local var_112_10 = arg_109_1:FormatText(var_112_9.content)

				arg_109_1.text_.text = var_112_10

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_11 = 18
				local var_112_12 = utf8.len(var_112_10)
				local var_112_13 = var_112_11 <= 0 and var_112_7 or var_112_7 * (var_112_12 / var_112_11)

				if var_112_13 > 0 and var_112_7 < var_112_13 then
					arg_109_1.talkMaxDuration = var_112_13

					if var_112_13 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_13 + var_112_6
					end
				end

				arg_109_1.text_.text = var_112_10
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804027", "story_v_side_old_102804.awb") ~= 0 then
					local var_112_14 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804027", "story_v_side_old_102804.awb") / 1000

					if var_112_14 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_14 + var_112_6
					end

					if var_112_9.prefab_name ~= "" and arg_109_1.actors_[var_112_9.prefab_name] ~= nil then
						local var_112_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_9.prefab_name].transform, "story_v_side_old_102804", "102804027", "story_v_side_old_102804.awb")

						arg_109_1:RecordAudio("102804027", var_112_15)
						arg_109_1:RecordAudio("102804027", var_112_15)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804027", "story_v_side_old_102804.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804027", "story_v_side_old_102804.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_16 = math.max(var_112_7, arg_109_1.talkMaxDuration)

			if var_112_6 <= arg_109_1.time_ and arg_109_1.time_ < var_112_6 + var_112_16 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_6) / var_112_16

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_6 + var_112_16 and arg_109_1.time_ < var_112_6 + var_112_16 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play102804028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 102804028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play102804029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1028ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1028ui_story == nil then
				arg_113_1.var_.characterEffect1028ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.2

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1028ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1028ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1028ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1028ui_story.fillRatio = var_116_5
			end

			local var_116_6 = 0
			local var_116_7 = 0.95

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_8 = arg_113_1:FormatText(StoryNameCfg[7].name)

				arg_113_1.leftNameTxt_.text = var_116_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_9 = arg_113_1:GetWordFromCfg(102804028)
				local var_116_10 = arg_113_1:FormatText(var_116_9.content)

				arg_113_1.text_.text = var_116_10

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_11 = 38
				local var_116_12 = utf8.len(var_116_10)
				local var_116_13 = var_116_11 <= 0 and var_116_7 or var_116_7 * (var_116_12 / var_116_11)

				if var_116_13 > 0 and var_116_7 < var_116_13 then
					arg_113_1.talkMaxDuration = var_116_13

					if var_116_13 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_13 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_10
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_14 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_14 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_14

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_14 and arg_113_1.time_ < var_116_6 + var_116_14 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play102804029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 102804029
		arg_117_1.duration_ = 1.8

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play102804030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 1

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				local var_120_2 = "play"
				local var_120_3 = "effect"

				arg_117_1:AudioAction(var_120_2, var_120_3, "se_story_side_1028", "se_story_1028_qidibugan", "")
			end

			local var_120_4 = 0
			local var_120_5 = 0.175

			if var_120_4 < arg_117_1.time_ and arg_117_1.time_ <= var_120_4 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_6 = arg_117_1:FormatText(StoryNameCfg[365].name)

				arg_117_1.leftNameTxt_.text = var_120_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_7 = arg_117_1:GetWordFromCfg(102804029)
				local var_120_8 = arg_117_1:FormatText(var_120_7.content)

				arg_117_1.text_.text = var_120_8

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_9 = 7
				local var_120_10 = utf8.len(var_120_8)
				local var_120_11 = var_120_9 <= 0 and var_120_5 or var_120_5 * (var_120_10 / var_120_9)

				if var_120_11 > 0 and var_120_5 < var_120_11 then
					arg_117_1.talkMaxDuration = var_120_11

					if var_120_11 + var_120_4 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_11 + var_120_4
					end
				end

				arg_117_1.text_.text = var_120_8
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804029", "story_v_side_old_102804.awb") ~= 0 then
					local var_120_12 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804029", "story_v_side_old_102804.awb") / 1000

					if var_120_12 + var_120_4 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_12 + var_120_4
					end

					if var_120_7.prefab_name ~= "" and arg_117_1.actors_[var_120_7.prefab_name] ~= nil then
						local var_120_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_7.prefab_name].transform, "story_v_side_old_102804", "102804029", "story_v_side_old_102804.awb")

						arg_117_1:RecordAudio("102804029", var_120_13)
						arg_117_1:RecordAudio("102804029", var_120_13)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804029", "story_v_side_old_102804.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804029", "story_v_side_old_102804.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_14 = math.max(var_120_5, arg_117_1.talkMaxDuration)

			if var_120_4 <= arg_117_1.time_ and arg_117_1.time_ < var_120_4 + var_120_14 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_4) / var_120_14

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_4 + var_120_14 and arg_117_1.time_ < var_120_4 + var_120_14 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play102804030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 102804030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play102804031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.825

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_2 = arg_121_1:GetWordFromCfg(102804030)
				local var_124_3 = arg_121_1:FormatText(var_124_2.content)

				arg_121_1.text_.text = var_124_3

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_4 = 33
				local var_124_5 = utf8.len(var_124_3)
				local var_124_6 = var_124_4 <= 0 and var_124_1 or var_124_1 * (var_124_5 / var_124_4)

				if var_124_6 > 0 and var_124_1 < var_124_6 then
					arg_121_1.talkMaxDuration = var_124_6

					if var_124_6 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_6 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_3
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_7 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_7 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_7

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_7 and arg_121_1.time_ < var_124_0 + var_124_7 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play102804031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 102804031
		arg_125_1.duration_ = 1.999999999999

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play102804032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1028ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1028ui_story == nil then
				arg_125_1.var_.characterEffect1028ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.2

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1028ui_story then
					arg_125_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1028ui_story then
				arg_125_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_128_4 = 0

			if var_128_4 < arg_125_1.time_ and arg_125_1.time_ <= var_128_4 + arg_128_0 then
				arg_125_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_2")
			end

			local var_128_5 = 0
			local var_128_6 = 0.05

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_7 = arg_125_1:FormatText(StoryNameCfg[327].name)

				arg_125_1.leftNameTxt_.text = var_128_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_8 = arg_125_1:GetWordFromCfg(102804031)
				local var_128_9 = arg_125_1:FormatText(var_128_8.content)

				arg_125_1.text_.text = var_128_9

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_10 = 2
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

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804031", "story_v_side_old_102804.awb") ~= 0 then
					local var_128_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804031", "story_v_side_old_102804.awb") / 1000

					if var_128_13 + var_128_5 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_13 + var_128_5
					end

					if var_128_8.prefab_name ~= "" and arg_125_1.actors_[var_128_8.prefab_name] ~= nil then
						local var_128_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_8.prefab_name].transform, "story_v_side_old_102804", "102804031", "story_v_side_old_102804.awb")

						arg_125_1:RecordAudio("102804031", var_128_14)
						arg_125_1:RecordAudio("102804031", var_128_14)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804031", "story_v_side_old_102804.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804031", "story_v_side_old_102804.awb")
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
	Play102804032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 102804032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play102804033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.3

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_2 = arg_129_1:GetWordFromCfg(102804032)
				local var_132_3 = arg_129_1:FormatText(var_132_2.content)

				arg_129_1.text_.text = var_132_3

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_4 = 12
				local var_132_5 = utf8.len(var_132_3)
				local var_132_6 = var_132_4 <= 0 and var_132_1 or var_132_1 * (var_132_5 / var_132_4)

				if var_132_6 > 0 and var_132_1 < var_132_6 then
					arg_129_1.talkMaxDuration = var_132_6

					if var_132_6 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_6 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_3
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_7 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_7 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_7

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_7 and arg_129_1.time_ < var_132_0 + var_132_7 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play102804033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 102804033
		arg_133_1.duration_ = 4.7

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play102804034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_136_2 = 0
			local var_136_3 = 0.675

			if var_136_2 < arg_133_1.time_ and arg_133_1.time_ <= var_136_2 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_4 = arg_133_1:FormatText(StoryNameCfg[327].name)

				arg_133_1.leftNameTxt_.text = var_136_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_5 = arg_133_1:GetWordFromCfg(102804033)
				local var_136_6 = arg_133_1:FormatText(var_136_5.content)

				arg_133_1.text_.text = var_136_6

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_7 = 27
				local var_136_8 = utf8.len(var_136_6)
				local var_136_9 = var_136_7 <= 0 and var_136_3 or var_136_3 * (var_136_8 / var_136_7)

				if var_136_9 > 0 and var_136_3 < var_136_9 then
					arg_133_1.talkMaxDuration = var_136_9

					if var_136_9 + var_136_2 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_9 + var_136_2
					end
				end

				arg_133_1.text_.text = var_136_6
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804033", "story_v_side_old_102804.awb") ~= 0 then
					local var_136_10 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804033", "story_v_side_old_102804.awb") / 1000

					if var_136_10 + var_136_2 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_10 + var_136_2
					end

					if var_136_5.prefab_name ~= "" and arg_133_1.actors_[var_136_5.prefab_name] ~= nil then
						local var_136_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_5.prefab_name].transform, "story_v_side_old_102804", "102804033", "story_v_side_old_102804.awb")

						arg_133_1:RecordAudio("102804033", var_136_11)
						arg_133_1:RecordAudio("102804033", var_136_11)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804033", "story_v_side_old_102804.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804033", "story_v_side_old_102804.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_12 = math.max(var_136_3, arg_133_1.talkMaxDuration)

			if var_136_2 <= arg_133_1.time_ and arg_133_1.time_ < var_136_2 + var_136_12 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_2) / var_136_12

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_2 + var_136_12 and arg_133_1.time_ < var_136_2 + var_136_12 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play102804034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 102804034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play102804035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1028ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1028ui_story == nil then
				arg_137_1.var_.characterEffect1028ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.2

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
			local var_140_7 = 0.175

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_8 = arg_137_1:FormatText(StoryNameCfg[7].name)

				arg_137_1.leftNameTxt_.text = var_140_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_9 = arg_137_1:GetWordFromCfg(102804034)
				local var_140_10 = arg_137_1:FormatText(var_140_9.content)

				arg_137_1.text_.text = var_140_10

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_11 = 7
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
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_14 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_14 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_14

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_14 and arg_137_1.time_ < var_140_6 + var_140_14 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play102804035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 102804035
		arg_141_1.duration_ = 4.266

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play102804036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1028ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1028ui_story == nil then
				arg_141_1.var_.characterEffect1028ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.2

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1028ui_story then
					arg_141_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1028ui_story then
				arg_141_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_144_4 = 0

			if var_144_4 < arg_141_1.time_ and arg_141_1.time_ <= var_144_4 + arg_144_0 then
				arg_141_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_144_5 = 0
			local var_144_6 = 0.925

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_7 = arg_141_1:FormatText(StoryNameCfg[327].name)

				arg_141_1.leftNameTxt_.text = var_144_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_8 = arg_141_1:GetWordFromCfg(102804035)
				local var_144_9 = arg_141_1:FormatText(var_144_8.content)

				arg_141_1.text_.text = var_144_9

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_10 = 37
				local var_144_11 = utf8.len(var_144_9)
				local var_144_12 = var_144_10 <= 0 and var_144_6 or var_144_6 * (var_144_11 / var_144_10)

				if var_144_12 > 0 and var_144_6 < var_144_12 then
					arg_141_1.talkMaxDuration = var_144_12

					if var_144_12 + var_144_5 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_12 + var_144_5
					end
				end

				arg_141_1.text_.text = var_144_9
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804035", "story_v_side_old_102804.awb") ~= 0 then
					local var_144_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804035", "story_v_side_old_102804.awb") / 1000

					if var_144_13 + var_144_5 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_13 + var_144_5
					end

					if var_144_8.prefab_name ~= "" and arg_141_1.actors_[var_144_8.prefab_name] ~= nil then
						local var_144_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_8.prefab_name].transform, "story_v_side_old_102804", "102804035", "story_v_side_old_102804.awb")

						arg_141_1:RecordAudio("102804035", var_144_14)
						arg_141_1:RecordAudio("102804035", var_144_14)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804035", "story_v_side_old_102804.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804035", "story_v_side_old_102804.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_15 = math.max(var_144_6, arg_141_1.talkMaxDuration)

			if var_144_5 <= arg_141_1.time_ and arg_141_1.time_ < var_144_5 + var_144_15 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_5) / var_144_15

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_5 + var_144_15 and arg_141_1.time_ < var_144_5 + var_144_15 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play102804036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 102804036
		arg_145_1.duration_ = 4.566

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play102804037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_148_1 = 0
			local var_148_2 = 0.5

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_3 = arg_145_1:FormatText(StoryNameCfg[327].name)

				arg_145_1.leftNameTxt_.text = var_148_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_4 = arg_145_1:GetWordFromCfg(102804036)
				local var_148_5 = arg_145_1:FormatText(var_148_4.content)

				arg_145_1.text_.text = var_148_5

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_6 = 20
				local var_148_7 = utf8.len(var_148_5)
				local var_148_8 = var_148_6 <= 0 and var_148_2 or var_148_2 * (var_148_7 / var_148_6)

				if var_148_8 > 0 and var_148_2 < var_148_8 then
					arg_145_1.talkMaxDuration = var_148_8

					if var_148_8 + var_148_1 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_1
					end
				end

				arg_145_1.text_.text = var_148_5
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804036", "story_v_side_old_102804.awb") ~= 0 then
					local var_148_9 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804036", "story_v_side_old_102804.awb") / 1000

					if var_148_9 + var_148_1 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_9 + var_148_1
					end

					if var_148_4.prefab_name ~= "" and arg_145_1.actors_[var_148_4.prefab_name] ~= nil then
						local var_148_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_4.prefab_name].transform, "story_v_side_old_102804", "102804036", "story_v_side_old_102804.awb")

						arg_145_1:RecordAudio("102804036", var_148_10)
						arg_145_1:RecordAudio("102804036", var_148_10)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804036", "story_v_side_old_102804.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804036", "story_v_side_old_102804.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_11 = math.max(var_148_2, arg_145_1.talkMaxDuration)

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_11 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_1) / var_148_11

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_1 + var_148_11 and arg_145_1.time_ < var_148_1 + var_148_11 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play102804037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 102804037
		arg_149_1.duration_ = 6.5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play102804038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_152_2 = 0
			local var_152_3 = 0.75

			if var_152_2 < arg_149_1.time_ and arg_149_1.time_ <= var_152_2 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_4 = arg_149_1:FormatText(StoryNameCfg[327].name)

				arg_149_1.leftNameTxt_.text = var_152_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_5 = arg_149_1:GetWordFromCfg(102804037)
				local var_152_6 = arg_149_1:FormatText(var_152_5.content)

				arg_149_1.text_.text = var_152_6

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_7 = 30
				local var_152_8 = utf8.len(var_152_6)
				local var_152_9 = var_152_7 <= 0 and var_152_3 or var_152_3 * (var_152_8 / var_152_7)

				if var_152_9 > 0 and var_152_3 < var_152_9 then
					arg_149_1.talkMaxDuration = var_152_9

					if var_152_9 + var_152_2 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_9 + var_152_2
					end
				end

				arg_149_1.text_.text = var_152_6
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804037", "story_v_side_old_102804.awb") ~= 0 then
					local var_152_10 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804037", "story_v_side_old_102804.awb") / 1000

					if var_152_10 + var_152_2 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_10 + var_152_2
					end

					if var_152_5.prefab_name ~= "" and arg_149_1.actors_[var_152_5.prefab_name] ~= nil then
						local var_152_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_5.prefab_name].transform, "story_v_side_old_102804", "102804037", "story_v_side_old_102804.awb")

						arg_149_1:RecordAudio("102804037", var_152_11)
						arg_149_1:RecordAudio("102804037", var_152_11)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804037", "story_v_side_old_102804.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804037", "story_v_side_old_102804.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_12 = math.max(var_152_3, arg_149_1.talkMaxDuration)

			if var_152_2 <= arg_149_1.time_ and arg_149_1.time_ < var_152_2 + var_152_12 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_2) / var_152_12

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_2 + var_152_12 and arg_149_1.time_ < var_152_2 + var_152_12 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play102804038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 102804038
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play102804039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1028ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1028ui_story == nil then
				arg_153_1.var_.characterEffect1028ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.2

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
			local var_156_7 = 0.15

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_8 = arg_153_1:FormatText(StoryNameCfg[7].name)

				arg_153_1.leftNameTxt_.text = var_156_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_9 = arg_153_1:GetWordFromCfg(102804038)
				local var_156_10 = arg_153_1:FormatText(var_156_9.content)

				arg_153_1.text_.text = var_156_10

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_11 = 6
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
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_14 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_14 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_14

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_14 and arg_153_1.time_ < var_156_6 + var_156_14 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play102804039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 102804039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play102804040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.375

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

				local var_160_2 = arg_157_1:GetWordFromCfg(102804039)
				local var_160_3 = arg_157_1:FormatText(var_160_2.content)

				arg_157_1.text_.text = var_160_3

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_4 = 15
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
	Play102804040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 102804040
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play102804041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.925

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[7].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(102804040)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 37
				local var_164_6 = utf8.len(var_164_4)
				local var_164_7 = var_164_5 <= 0 and var_164_1 or var_164_1 * (var_164_6 / var_164_5)

				if var_164_7 > 0 and var_164_1 < var_164_7 then
					arg_161_1.talkMaxDuration = var_164_7

					if var_164_7 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_7 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_4
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_8 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_8 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_8

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_8 and arg_161_1.time_ < var_164_0 + var_164_8 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play102804041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 102804041
		arg_165_1.duration_ = 4.833

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play102804042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1028ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect1028ui_story == nil then
				arg_165_1.var_.characterEffect1028ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.2

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect1028ui_story then
					arg_165_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect1028ui_story then
				arg_165_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_168_4 = 0

			if var_168_4 < arg_165_1.time_ and arg_165_1.time_ <= var_168_4 + arg_168_0 then
				arg_165_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_168_5 = 0
			local var_168_6 = 0.65

			if var_168_5 < arg_165_1.time_ and arg_165_1.time_ <= var_168_5 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_7 = arg_165_1:FormatText(StoryNameCfg[327].name)

				arg_165_1.leftNameTxt_.text = var_168_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_8 = arg_165_1:GetWordFromCfg(102804041)
				local var_168_9 = arg_165_1:FormatText(var_168_8.content)

				arg_165_1.text_.text = var_168_9

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_10 = 26
				local var_168_11 = utf8.len(var_168_9)
				local var_168_12 = var_168_10 <= 0 and var_168_6 or var_168_6 * (var_168_11 / var_168_10)

				if var_168_12 > 0 and var_168_6 < var_168_12 then
					arg_165_1.talkMaxDuration = var_168_12

					if var_168_12 + var_168_5 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_12 + var_168_5
					end
				end

				arg_165_1.text_.text = var_168_9
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804041", "story_v_side_old_102804.awb") ~= 0 then
					local var_168_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804041", "story_v_side_old_102804.awb") / 1000

					if var_168_13 + var_168_5 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_13 + var_168_5
					end

					if var_168_8.prefab_name ~= "" and arg_165_1.actors_[var_168_8.prefab_name] ~= nil then
						local var_168_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_8.prefab_name].transform, "story_v_side_old_102804", "102804041", "story_v_side_old_102804.awb")

						arg_165_1:RecordAudio("102804041", var_168_14)
						arg_165_1:RecordAudio("102804041", var_168_14)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804041", "story_v_side_old_102804.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804041", "story_v_side_old_102804.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_15 = math.max(var_168_6, arg_165_1.talkMaxDuration)

			if var_168_5 <= arg_165_1.time_ and arg_165_1.time_ < var_168_5 + var_168_15 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_5) / var_168_15

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_5 + var_168_15 and arg_165_1.time_ < var_168_5 + var_168_15 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play102804042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 102804042
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play102804043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1028ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect1028ui_story == nil then
				arg_169_1.var_.characterEffect1028ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.2

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect1028ui_story then
					local var_172_4 = Mathf.Lerp(0, 0.5, var_172_3)

					arg_169_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1028ui_story.fillRatio = var_172_4
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect1028ui_story then
				local var_172_5 = 0.5

				arg_169_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1028ui_story.fillRatio = var_172_5
			end

			local var_172_6 = 0
			local var_172_7 = 0.975

			if var_172_6 < arg_169_1.time_ and arg_169_1.time_ <= var_172_6 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_8 = arg_169_1:FormatText(StoryNameCfg[7].name)

				arg_169_1.leftNameTxt_.text = var_172_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_9 = arg_169_1:GetWordFromCfg(102804042)
				local var_172_10 = arg_169_1:FormatText(var_172_9.content)

				arg_169_1.text_.text = var_172_10

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_11 = 39
				local var_172_12 = utf8.len(var_172_10)
				local var_172_13 = var_172_11 <= 0 and var_172_7 or var_172_7 * (var_172_12 / var_172_11)

				if var_172_13 > 0 and var_172_7 < var_172_13 then
					arg_169_1.talkMaxDuration = var_172_13

					if var_172_13 + var_172_6 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_13 + var_172_6
					end
				end

				arg_169_1.text_.text = var_172_10
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_14 = math.max(var_172_7, arg_169_1.talkMaxDuration)

			if var_172_6 <= arg_169_1.time_ and arg_169_1.time_ < var_172_6 + var_172_14 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_6) / var_172_14

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_6 + var_172_14 and arg_169_1.time_ < var_172_6 + var_172_14 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play102804043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 102804043
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play102804044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 1.625

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_2 = arg_173_1:GetWordFromCfg(102804043)
				local var_176_3 = arg_173_1:FormatText(var_176_2.content)

				arg_173_1.text_.text = var_176_3

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_4 = 65
				local var_176_5 = utf8.len(var_176_3)
				local var_176_6 = var_176_4 <= 0 and var_176_1 or var_176_1 * (var_176_5 / var_176_4)

				if var_176_6 > 0 and var_176_1 < var_176_6 then
					arg_173_1.talkMaxDuration = var_176_6

					if var_176_6 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_6 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_3
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_7 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_7 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_7

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_7 and arg_173_1.time_ < var_176_0 + var_176_7 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play102804044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 102804044
		arg_177_1.duration_ = 5.3

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play102804045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1028ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1028ui_story == nil then
				arg_177_1.var_.characterEffect1028ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.2

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1028ui_story then
					arg_177_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1028ui_story then
				arg_177_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_180_4 = 0

			if var_180_4 < arg_177_1.time_ and arg_177_1.time_ <= var_180_4 + arg_180_0 then
				arg_177_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_180_5 = 0

			if var_180_5 < arg_177_1.time_ and arg_177_1.time_ <= var_180_5 + arg_180_0 then
				arg_177_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_1")
			end

			local var_180_6 = 0
			local var_180_7 = 0.775

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_8 = arg_177_1:FormatText(StoryNameCfg[327].name)

				arg_177_1.leftNameTxt_.text = var_180_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_9 = arg_177_1:GetWordFromCfg(102804044)
				local var_180_10 = arg_177_1:FormatText(var_180_9.content)

				arg_177_1.text_.text = var_180_10

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_11 = 31
				local var_180_12 = utf8.len(var_180_10)
				local var_180_13 = var_180_11 <= 0 and var_180_7 or var_180_7 * (var_180_12 / var_180_11)

				if var_180_13 > 0 and var_180_7 < var_180_13 then
					arg_177_1.talkMaxDuration = var_180_13

					if var_180_13 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_13 + var_180_6
					end
				end

				arg_177_1.text_.text = var_180_10
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804044", "story_v_side_old_102804.awb") ~= 0 then
					local var_180_14 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804044", "story_v_side_old_102804.awb") / 1000

					if var_180_14 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_14 + var_180_6
					end

					if var_180_9.prefab_name ~= "" and arg_177_1.actors_[var_180_9.prefab_name] ~= nil then
						local var_180_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_9.prefab_name].transform, "story_v_side_old_102804", "102804044", "story_v_side_old_102804.awb")

						arg_177_1:RecordAudio("102804044", var_180_15)
						arg_177_1:RecordAudio("102804044", var_180_15)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804044", "story_v_side_old_102804.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804044", "story_v_side_old_102804.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_16 = math.max(var_180_7, arg_177_1.talkMaxDuration)

			if var_180_6 <= arg_177_1.time_ and arg_177_1.time_ < var_180_6 + var_180_16 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_6) / var_180_16

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_6 + var_180_16 and arg_177_1.time_ < var_180_6 + var_180_16 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play102804045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 102804045
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play102804046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1028ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1028ui_story == nil then
				arg_181_1.var_.characterEffect1028ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.2

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1028ui_story then
					local var_184_4 = Mathf.Lerp(0, 0.5, var_184_3)

					arg_181_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1028ui_story.fillRatio = var_184_4
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1028ui_story then
				local var_184_5 = 0.5

				arg_181_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1028ui_story.fillRatio = var_184_5
			end

			local var_184_6 = 0

			if var_184_6 < arg_181_1.time_ and arg_181_1.time_ <= var_184_6 + arg_184_0 then
				arg_181_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_2")
			end

			local var_184_7 = 0
			local var_184_8 = 0.25

			if var_184_7 < arg_181_1.time_ and arg_181_1.time_ <= var_184_7 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_9 = arg_181_1:FormatText(StoryNameCfg[7].name)

				arg_181_1.leftNameTxt_.text = var_184_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_10 = arg_181_1:GetWordFromCfg(102804045)
				local var_184_11 = arg_181_1:FormatText(var_184_10.content)

				arg_181_1.text_.text = var_184_11

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_12 = 10
				local var_184_13 = utf8.len(var_184_11)
				local var_184_14 = var_184_12 <= 0 and var_184_8 or var_184_8 * (var_184_13 / var_184_12)

				if var_184_14 > 0 and var_184_8 < var_184_14 then
					arg_181_1.talkMaxDuration = var_184_14

					if var_184_14 + var_184_7 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_14 + var_184_7
					end
				end

				arg_181_1.text_.text = var_184_11
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_15 = math.max(var_184_8, arg_181_1.talkMaxDuration)

			if var_184_7 <= arg_181_1.time_ and arg_181_1.time_ < var_184_7 + var_184_15 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_7) / var_184_15

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_7 + var_184_15 and arg_181_1.time_ < var_184_7 + var_184_15 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play102804046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 102804046
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play102804047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_188_1 = 0
			local var_188_2 = 0.675

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_3 = arg_185_1:GetWordFromCfg(102804046)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 27
				local var_188_6 = utf8.len(var_188_4)
				local var_188_7 = var_188_5 <= 0 and var_188_2 or var_188_2 * (var_188_6 / var_188_5)

				if var_188_7 > 0 and var_188_2 < var_188_7 then
					arg_185_1.talkMaxDuration = var_188_7

					if var_188_7 + var_188_1 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_7 + var_188_1
					end
				end

				arg_185_1.text_.text = var_188_4
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_8 = math.max(var_188_2, arg_185_1.talkMaxDuration)

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_8 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_1) / var_188_8

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_1 + var_188_8 and arg_185_1.time_ < var_188_1 + var_188_8 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play102804047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 102804047
		arg_189_1.duration_ = 8.866

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play102804048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1028ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect1028ui_story == nil then
				arg_189_1.var_.characterEffect1028ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.2

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect1028ui_story then
					arg_189_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect1028ui_story then
				arg_189_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_192_4 = 0

			if var_192_4 < arg_189_1.time_ and arg_189_1.time_ <= var_192_4 + arg_192_0 then
				arg_189_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_192_5 = 0
			local var_192_6 = 0.6

			if var_192_5 < arg_189_1.time_ and arg_189_1.time_ <= var_192_5 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_7 = arg_189_1:FormatText(StoryNameCfg[327].name)

				arg_189_1.leftNameTxt_.text = var_192_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_8 = arg_189_1:GetWordFromCfg(102804047)
				local var_192_9 = arg_189_1:FormatText(var_192_8.content)

				arg_189_1.text_.text = var_192_9

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_10 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804047", "story_v_side_old_102804.awb") ~= 0 then
					local var_192_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804047", "story_v_side_old_102804.awb") / 1000

					if var_192_13 + var_192_5 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_13 + var_192_5
					end

					if var_192_8.prefab_name ~= "" and arg_189_1.actors_[var_192_8.prefab_name] ~= nil then
						local var_192_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_8.prefab_name].transform, "story_v_side_old_102804", "102804047", "story_v_side_old_102804.awb")

						arg_189_1:RecordAudio("102804047", var_192_14)
						arg_189_1:RecordAudio("102804047", var_192_14)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804047", "story_v_side_old_102804.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804047", "story_v_side_old_102804.awb")
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
	Play102804048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 102804048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play102804049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1028ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect1028ui_story == nil then
				arg_193_1.var_.characterEffect1028ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.2

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect1028ui_story then
					local var_196_4 = Mathf.Lerp(0, 0.5, var_196_3)

					arg_193_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1028ui_story.fillRatio = var_196_4
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect1028ui_story then
				local var_196_5 = 0.5

				arg_193_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1028ui_story.fillRatio = var_196_5
			end

			local var_196_6 = 0
			local var_196_7 = 1.325

			if var_196_6 < arg_193_1.time_ and arg_193_1.time_ <= var_196_6 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_8 = arg_193_1:GetWordFromCfg(102804048)
				local var_196_9 = arg_193_1:FormatText(var_196_8.content)

				arg_193_1.text_.text = var_196_9

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_10 = 53
				local var_196_11 = utf8.len(var_196_9)
				local var_196_12 = var_196_10 <= 0 and var_196_7 or var_196_7 * (var_196_11 / var_196_10)

				if var_196_12 > 0 and var_196_7 < var_196_12 then
					arg_193_1.talkMaxDuration = var_196_12

					if var_196_12 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_12 + var_196_6
					end
				end

				arg_193_1.text_.text = var_196_9
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_13 = math.max(var_196_7, arg_193_1.talkMaxDuration)

			if var_196_6 <= arg_193_1.time_ and arg_193_1.time_ < var_196_6 + var_196_13 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_6) / var_196_13

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_6 + var_196_13 and arg_193_1.time_ < var_196_6 + var_196_13 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play102804049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 102804049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play102804050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.225

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_2 = arg_197_1:GetWordFromCfg(102804049)
				local var_200_3 = arg_197_1:FormatText(var_200_2.content)

				arg_197_1.text_.text = var_200_3

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_4 = 9
				local var_200_5 = utf8.len(var_200_3)
				local var_200_6 = var_200_4 <= 0 and var_200_1 or var_200_1 * (var_200_5 / var_200_4)

				if var_200_6 > 0 and var_200_1 < var_200_6 then
					arg_197_1.talkMaxDuration = var_200_6

					if var_200_6 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_6 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_3
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_7 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_7 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_7

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_7 and arg_197_1.time_ < var_200_0 + var_200_7 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play102804050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 102804050
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play102804051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 0.125

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_2 = arg_201_1:FormatText(StoryNameCfg[7].name)

				arg_201_1.leftNameTxt_.text = var_204_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_3 = arg_201_1:GetWordFromCfg(102804050)
				local var_204_4 = arg_201_1:FormatText(var_204_3.content)

				arg_201_1.text_.text = var_204_4

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_5 = 5
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
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_8 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_8 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_8

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_8 and arg_201_1.time_ < var_204_0 + var_204_8 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play102804051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 102804051
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play102804052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 1.275

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

				local var_208_2 = arg_205_1:GetWordFromCfg(102804051)
				local var_208_3 = arg_205_1:FormatText(var_208_2.content)

				arg_205_1.text_.text = var_208_3

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_4 = 51
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
	Play102804052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 102804052
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play102804053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 0.075

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[7].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(102804052)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 3
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
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_8 = math.max(var_212_1, arg_209_1.talkMaxDuration)

			if var_212_0 <= arg_209_1.time_ and arg_209_1.time_ < var_212_0 + var_212_8 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_0) / var_212_8

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_0 + var_212_8 and arg_209_1.time_ < var_212_0 + var_212_8 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play102804053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 102804053
		arg_213_1.duration_ = 1.999999999999

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play102804054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1028ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1028ui_story == nil then
				arg_213_1.var_.characterEffect1028ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.2

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1028ui_story then
					arg_213_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1028ui_story then
				arg_213_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_216_4 = 0

			if var_216_4 < arg_213_1.time_ and arg_213_1.time_ <= var_216_4 + arg_216_0 then
				arg_213_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_216_5 = 0
			local var_216_6 = 0.1

			if var_216_5 < arg_213_1.time_ and arg_213_1.time_ <= var_216_5 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_7 = arg_213_1:FormatText(StoryNameCfg[327].name)

				arg_213_1.leftNameTxt_.text = var_216_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_8 = arg_213_1:GetWordFromCfg(102804053)
				local var_216_9 = arg_213_1:FormatText(var_216_8.content)

				arg_213_1.text_.text = var_216_9

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_10 = 4
				local var_216_11 = utf8.len(var_216_9)
				local var_216_12 = var_216_10 <= 0 and var_216_6 or var_216_6 * (var_216_11 / var_216_10)

				if var_216_12 > 0 and var_216_6 < var_216_12 then
					arg_213_1.talkMaxDuration = var_216_12

					if var_216_12 + var_216_5 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_12 + var_216_5
					end
				end

				arg_213_1.text_.text = var_216_9
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804053", "story_v_side_old_102804.awb") ~= 0 then
					local var_216_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804053", "story_v_side_old_102804.awb") / 1000

					if var_216_13 + var_216_5 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_13 + var_216_5
					end

					if var_216_8.prefab_name ~= "" and arg_213_1.actors_[var_216_8.prefab_name] ~= nil then
						local var_216_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_8.prefab_name].transform, "story_v_side_old_102804", "102804053", "story_v_side_old_102804.awb")

						arg_213_1:RecordAudio("102804053", var_216_14)
						arg_213_1:RecordAudio("102804053", var_216_14)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804053", "story_v_side_old_102804.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804053", "story_v_side_old_102804.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_15 = math.max(var_216_6, arg_213_1.talkMaxDuration)

			if var_216_5 <= arg_213_1.time_ and arg_213_1.time_ < var_216_5 + var_216_15 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_5) / var_216_15

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_5 + var_216_15 and arg_213_1.time_ < var_216_5 + var_216_15 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play102804054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 102804054
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play102804055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.5

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_2 = arg_217_1:GetWordFromCfg(102804054)
				local var_220_3 = arg_217_1:FormatText(var_220_2.content)

				arg_217_1.text_.text = var_220_3

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_4 = 20
				local var_220_5 = utf8.len(var_220_3)
				local var_220_6 = var_220_4 <= 0 and var_220_1 or var_220_1 * (var_220_5 / var_220_4)

				if var_220_6 > 0 and var_220_1 < var_220_6 then
					arg_217_1.talkMaxDuration = var_220_6

					if var_220_6 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_6 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_3
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_7 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_7 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_7

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_7 and arg_217_1.time_ < var_220_0 + var_220_7 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play102804055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 102804055
		arg_221_1.duration_ = 13

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play102804056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_224_2 = 0
			local var_224_3 = 0.825

			if var_224_2 < arg_221_1.time_ and arg_221_1.time_ <= var_224_2 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_4 = arg_221_1:FormatText(StoryNameCfg[327].name)

				arg_221_1.leftNameTxt_.text = var_224_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_5 = arg_221_1:GetWordFromCfg(102804055)
				local var_224_6 = arg_221_1:FormatText(var_224_5.content)

				arg_221_1.text_.text = var_224_6

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_7 = 33
				local var_224_8 = utf8.len(var_224_6)
				local var_224_9 = var_224_7 <= 0 and var_224_3 or var_224_3 * (var_224_8 / var_224_7)

				if var_224_9 > 0 and var_224_3 < var_224_9 then
					arg_221_1.talkMaxDuration = var_224_9

					if var_224_9 + var_224_2 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_9 + var_224_2
					end
				end

				arg_221_1.text_.text = var_224_6
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804055", "story_v_side_old_102804.awb") ~= 0 then
					local var_224_10 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804055", "story_v_side_old_102804.awb") / 1000

					if var_224_10 + var_224_2 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_10 + var_224_2
					end

					if var_224_5.prefab_name ~= "" and arg_221_1.actors_[var_224_5.prefab_name] ~= nil then
						local var_224_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_5.prefab_name].transform, "story_v_side_old_102804", "102804055", "story_v_side_old_102804.awb")

						arg_221_1:RecordAudio("102804055", var_224_11)
						arg_221_1:RecordAudio("102804055", var_224_11)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804055", "story_v_side_old_102804.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804055", "story_v_side_old_102804.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_12 = math.max(var_224_3, arg_221_1.talkMaxDuration)

			if var_224_2 <= arg_221_1.time_ and arg_221_1.time_ < var_224_2 + var_224_12 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_2) / var_224_12

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_2 + var_224_12 and arg_221_1.time_ < var_224_2 + var_224_12 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play102804056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 102804056
		arg_225_1.duration_ = 7.533

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play102804057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_228_1 = 0
			local var_228_2 = 0.675

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_3 = arg_225_1:FormatText(StoryNameCfg[327].name)

				arg_225_1.leftNameTxt_.text = var_228_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_4 = arg_225_1:GetWordFromCfg(102804056)
				local var_228_5 = arg_225_1:FormatText(var_228_4.content)

				arg_225_1.text_.text = var_228_5

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_6 = 27
				local var_228_7 = utf8.len(var_228_5)
				local var_228_8 = var_228_6 <= 0 and var_228_2 or var_228_2 * (var_228_7 / var_228_6)

				if var_228_8 > 0 and var_228_2 < var_228_8 then
					arg_225_1.talkMaxDuration = var_228_8

					if var_228_8 + var_228_1 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_1
					end
				end

				arg_225_1.text_.text = var_228_5
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804056", "story_v_side_old_102804.awb") ~= 0 then
					local var_228_9 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804056", "story_v_side_old_102804.awb") / 1000

					if var_228_9 + var_228_1 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_9 + var_228_1
					end

					if var_228_4.prefab_name ~= "" and arg_225_1.actors_[var_228_4.prefab_name] ~= nil then
						local var_228_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_4.prefab_name].transform, "story_v_side_old_102804", "102804056", "story_v_side_old_102804.awb")

						arg_225_1:RecordAudio("102804056", var_228_10)
						arg_225_1:RecordAudio("102804056", var_228_10)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804056", "story_v_side_old_102804.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804056", "story_v_side_old_102804.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_11 = math.max(var_228_2, arg_225_1.talkMaxDuration)

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_11 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_1) / var_228_11

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_1 + var_228_11 and arg_225_1.time_ < var_228_1 + var_228_11 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play102804057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 102804057
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play102804058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1028ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.characterEffect1028ui_story == nil then
				arg_229_1.var_.characterEffect1028ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.2

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1028ui_story then
					local var_232_4 = Mathf.Lerp(0, 0.5, var_232_3)

					arg_229_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1028ui_story.fillRatio = var_232_4
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1028ui_story then
				local var_232_5 = 0.5

				arg_229_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1028ui_story.fillRatio = var_232_5
			end

			local var_232_6 = 0
			local var_232_7 = 0.35

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_8 = arg_229_1:FormatText(StoryNameCfg[7].name)

				arg_229_1.leftNameTxt_.text = var_232_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_9 = arg_229_1:GetWordFromCfg(102804057)
				local var_232_10 = arg_229_1:FormatText(var_232_9.content)

				arg_229_1.text_.text = var_232_10

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_11 = 14
				local var_232_12 = utf8.len(var_232_10)
				local var_232_13 = var_232_11 <= 0 and var_232_7 or var_232_7 * (var_232_12 / var_232_11)

				if var_232_13 > 0 and var_232_7 < var_232_13 then
					arg_229_1.talkMaxDuration = var_232_13

					if var_232_13 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_13 + var_232_6
					end
				end

				arg_229_1.text_.text = var_232_10
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_14 = math.max(var_232_7, arg_229_1.talkMaxDuration)

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_14 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_6) / var_232_14

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_6 + var_232_14 and arg_229_1.time_ < var_232_6 + var_232_14 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play102804058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 102804058
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play102804059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 0.975

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, false)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_2 = arg_233_1:GetWordFromCfg(102804058)
				local var_236_3 = arg_233_1:FormatText(var_236_2.content)

				arg_233_1.text_.text = var_236_3

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_4 = 39
				local var_236_5 = utf8.len(var_236_3)
				local var_236_6 = var_236_4 <= 0 and var_236_1 or var_236_1 * (var_236_5 / var_236_4)

				if var_236_6 > 0 and var_236_1 < var_236_6 then
					arg_233_1.talkMaxDuration = var_236_6

					if var_236_6 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_6 + var_236_0
					end
				end

				arg_233_1.text_.text = var_236_3
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_7 = math.max(var_236_1, arg_233_1.talkMaxDuration)

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_7 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_0) / var_236_7

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_0 + var_236_7 and arg_233_1.time_ < var_236_0 + var_236_7 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play102804059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 102804059
		arg_237_1.duration_ = 4.2

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play102804060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1028ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1028ui_story == nil then
				arg_237_1.var_.characterEffect1028ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1028ui_story then
					arg_237_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1028ui_story then
				arg_237_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_240_4 = 0
			local var_240_5 = 0.4

			if var_240_4 < arg_237_1.time_ and arg_237_1.time_ <= var_240_4 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_6 = arg_237_1:FormatText(StoryNameCfg[327].name)

				arg_237_1.leftNameTxt_.text = var_240_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_7 = arg_237_1:GetWordFromCfg(102804059)
				local var_240_8 = arg_237_1:FormatText(var_240_7.content)

				arg_237_1.text_.text = var_240_8

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_9 = 16
				local var_240_10 = utf8.len(var_240_8)
				local var_240_11 = var_240_9 <= 0 and var_240_5 or var_240_5 * (var_240_10 / var_240_9)

				if var_240_11 > 0 and var_240_5 < var_240_11 then
					arg_237_1.talkMaxDuration = var_240_11

					if var_240_11 + var_240_4 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_11 + var_240_4
					end
				end

				arg_237_1.text_.text = var_240_8
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804059", "story_v_side_old_102804.awb") ~= 0 then
					local var_240_12 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804059", "story_v_side_old_102804.awb") / 1000

					if var_240_12 + var_240_4 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_12 + var_240_4
					end

					if var_240_7.prefab_name ~= "" and arg_237_1.actors_[var_240_7.prefab_name] ~= nil then
						local var_240_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_7.prefab_name].transform, "story_v_side_old_102804", "102804059", "story_v_side_old_102804.awb")

						arg_237_1:RecordAudio("102804059", var_240_13)
						arg_237_1:RecordAudio("102804059", var_240_13)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804059", "story_v_side_old_102804.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804059", "story_v_side_old_102804.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_14 = math.max(var_240_5, arg_237_1.talkMaxDuration)

			if var_240_4 <= arg_237_1.time_ and arg_237_1.time_ < var_240_4 + var_240_14 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_4) / var_240_14

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_4 + var_240_14 and arg_237_1.time_ < var_240_4 + var_240_14 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play102804060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 102804060
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play102804061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1028ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect1028ui_story == nil then
				arg_241_1.var_.characterEffect1028ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.2

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect1028ui_story then
					local var_244_4 = Mathf.Lerp(0, 0.5, var_244_3)

					arg_241_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1028ui_story.fillRatio = var_244_4
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1028ui_story then
				local var_244_5 = 0.5

				arg_241_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1028ui_story.fillRatio = var_244_5
			end

			local var_244_6 = 0
			local var_244_7 = 1.15

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_8 = arg_241_1:FormatText(StoryNameCfg[7].name)

				arg_241_1.leftNameTxt_.text = var_244_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_9 = arg_241_1:GetWordFromCfg(102804060)
				local var_244_10 = arg_241_1:FormatText(var_244_9.content)

				arg_241_1.text_.text = var_244_10

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_11 = 46
				local var_244_12 = utf8.len(var_244_10)
				local var_244_13 = var_244_11 <= 0 and var_244_7 or var_244_7 * (var_244_12 / var_244_11)

				if var_244_13 > 0 and var_244_7 < var_244_13 then
					arg_241_1.talkMaxDuration = var_244_13

					if var_244_13 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_13 + var_244_6
					end
				end

				arg_241_1.text_.text = var_244_10
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_14 = math.max(var_244_7, arg_241_1.talkMaxDuration)

			if var_244_6 <= arg_241_1.time_ and arg_241_1.time_ < var_244_6 + var_244_14 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_6) / var_244_14

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_6 + var_244_14 and arg_241_1.time_ < var_244_6 + var_244_14 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play102804061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 102804061
		arg_245_1.duration_ = 2.966

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play102804062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1028ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1028ui_story == nil then
				arg_245_1.var_.characterEffect1028ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.2

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1028ui_story then
					arg_245_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1028ui_story then
				arg_245_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_248_4 = 0

			if var_248_4 < arg_245_1.time_ and arg_245_1.time_ <= var_248_4 + arg_248_0 then
				arg_245_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_248_5 = 0
			local var_248_6 = 0.425

			if var_248_5 < arg_245_1.time_ and arg_245_1.time_ <= var_248_5 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_7 = arg_245_1:FormatText(StoryNameCfg[327].name)

				arg_245_1.leftNameTxt_.text = var_248_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_8 = arg_245_1:GetWordFromCfg(102804061)
				local var_248_9 = arg_245_1:FormatText(var_248_8.content)

				arg_245_1.text_.text = var_248_9

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_10 = 17
				local var_248_11 = utf8.len(var_248_9)
				local var_248_12 = var_248_10 <= 0 and var_248_6 or var_248_6 * (var_248_11 / var_248_10)

				if var_248_12 > 0 and var_248_6 < var_248_12 then
					arg_245_1.talkMaxDuration = var_248_12

					if var_248_12 + var_248_5 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_12 + var_248_5
					end
				end

				arg_245_1.text_.text = var_248_9
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804061", "story_v_side_old_102804.awb") ~= 0 then
					local var_248_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804061", "story_v_side_old_102804.awb") / 1000

					if var_248_13 + var_248_5 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_13 + var_248_5
					end

					if var_248_8.prefab_name ~= "" and arg_245_1.actors_[var_248_8.prefab_name] ~= nil then
						local var_248_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_8.prefab_name].transform, "story_v_side_old_102804", "102804061", "story_v_side_old_102804.awb")

						arg_245_1:RecordAudio("102804061", var_248_14)
						arg_245_1:RecordAudio("102804061", var_248_14)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804061", "story_v_side_old_102804.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804061", "story_v_side_old_102804.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_15 = math.max(var_248_6, arg_245_1.talkMaxDuration)

			if var_248_5 <= arg_245_1.time_ and arg_245_1.time_ < var_248_5 + var_248_15 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_5) / var_248_15

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_5 + var_248_15 and arg_245_1.time_ < var_248_5 + var_248_15 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play102804062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 102804062
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play102804063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1028ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect1028ui_story == nil then
				arg_249_1.var_.characterEffect1028ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.2

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect1028ui_story then
					local var_252_4 = Mathf.Lerp(0, 0.5, var_252_3)

					arg_249_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_249_1.var_.characterEffect1028ui_story.fillRatio = var_252_4
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1028ui_story then
				local var_252_5 = 0.5

				arg_249_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_249_1.var_.characterEffect1028ui_story.fillRatio = var_252_5
			end

			local var_252_6 = 0
			local var_252_7 = 0.975

			if var_252_6 < arg_249_1.time_ and arg_249_1.time_ <= var_252_6 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_8 = arg_249_1:FormatText(StoryNameCfg[7].name)

				arg_249_1.leftNameTxt_.text = var_252_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_9 = arg_249_1:GetWordFromCfg(102804062)
				local var_252_10 = arg_249_1:FormatText(var_252_9.content)

				arg_249_1.text_.text = var_252_10

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_11 = 39
				local var_252_12 = utf8.len(var_252_10)
				local var_252_13 = var_252_11 <= 0 and var_252_7 or var_252_7 * (var_252_12 / var_252_11)

				if var_252_13 > 0 and var_252_7 < var_252_13 then
					arg_249_1.talkMaxDuration = var_252_13

					if var_252_13 + var_252_6 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_13 + var_252_6
					end
				end

				arg_249_1.text_.text = var_252_10
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_14 = math.max(var_252_7, arg_249_1.talkMaxDuration)

			if var_252_6 <= arg_249_1.time_ and arg_249_1.time_ < var_252_6 + var_252_14 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_6) / var_252_14

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_6 + var_252_14 and arg_249_1.time_ < var_252_6 + var_252_14 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play102804063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 102804063
		arg_253_1.duration_ = 1.999999999999

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play102804064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1028ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1028ui_story == nil then
				arg_253_1.var_.characterEffect1028ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.2

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1028ui_story then
					arg_253_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1028ui_story then
				arg_253_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_256_4 = 0

			if var_256_4 < arg_253_1.time_ and arg_253_1.time_ <= var_256_4 + arg_256_0 then
				arg_253_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_256_5 = 0

			if var_256_5 < arg_253_1.time_ and arg_253_1.time_ <= var_256_5 + arg_256_0 then
				arg_253_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_2")
			end

			local var_256_6 = 0
			local var_256_7 = 0.2

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_8 = arg_253_1:FormatText(StoryNameCfg[327].name)

				arg_253_1.leftNameTxt_.text = var_256_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_9 = arg_253_1:GetWordFromCfg(102804063)
				local var_256_10 = arg_253_1:FormatText(var_256_9.content)

				arg_253_1.text_.text = var_256_10

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_11 = 8
				local var_256_12 = utf8.len(var_256_10)
				local var_256_13 = var_256_11 <= 0 and var_256_7 or var_256_7 * (var_256_12 / var_256_11)

				if var_256_13 > 0 and var_256_7 < var_256_13 then
					arg_253_1.talkMaxDuration = var_256_13

					if var_256_13 + var_256_6 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_13 + var_256_6
					end
				end

				arg_253_1.text_.text = var_256_10
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804063", "story_v_side_old_102804.awb") ~= 0 then
					local var_256_14 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804063", "story_v_side_old_102804.awb") / 1000

					if var_256_14 + var_256_6 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_14 + var_256_6
					end

					if var_256_9.prefab_name ~= "" and arg_253_1.actors_[var_256_9.prefab_name] ~= nil then
						local var_256_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_9.prefab_name].transform, "story_v_side_old_102804", "102804063", "story_v_side_old_102804.awb")

						arg_253_1:RecordAudio("102804063", var_256_15)
						arg_253_1:RecordAudio("102804063", var_256_15)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804063", "story_v_side_old_102804.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804063", "story_v_side_old_102804.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_16 = math.max(var_256_7, arg_253_1.talkMaxDuration)

			if var_256_6 <= arg_253_1.time_ and arg_253_1.time_ < var_256_6 + var_256_16 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_6) / var_256_16

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_6 + var_256_16 and arg_253_1.time_ < var_256_6 + var_256_16 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play102804064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 102804064
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play102804065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.8

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, false)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_2 = arg_257_1:GetWordFromCfg(102804064)
				local var_260_3 = arg_257_1:FormatText(var_260_2.content)

				arg_257_1.text_.text = var_260_3

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_4 = 32
				local var_260_5 = utf8.len(var_260_3)
				local var_260_6 = var_260_4 <= 0 and var_260_1 or var_260_1 * (var_260_5 / var_260_4)

				if var_260_6 > 0 and var_260_1 < var_260_6 then
					arg_257_1.talkMaxDuration = var_260_6

					if var_260_6 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_6 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_3
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_7 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_7 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_7

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_7 and arg_257_1.time_ < var_260_0 + var_260_7 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play102804065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 102804065
		arg_261_1.duration_ = 10.766

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play102804066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.mask_.enabled = true
				arg_261_1.mask_.raycastTarget = true

				arg_261_1:SetGaussion(false)
			end

			local var_264_1 = 2

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_1 then
				local var_264_2 = (arg_261_1.time_ - var_264_0) / var_264_1
				local var_264_3 = Color.New(0, 0, 0)

				var_264_3.a = Mathf.Lerp(0, 1, var_264_2)
				arg_261_1.mask_.color = var_264_3
			end

			if arg_261_1.time_ >= var_264_0 + var_264_1 and arg_261_1.time_ < var_264_0 + var_264_1 + arg_264_0 then
				local var_264_4 = Color.New(0, 0, 0)

				var_264_4.a = 1
				arg_261_1.mask_.color = var_264_4
			end

			local var_264_5 = 2

			if var_264_5 < arg_261_1.time_ and arg_261_1.time_ <= var_264_5 + arg_264_0 then
				arg_261_1.mask_.enabled = true
				arg_261_1.mask_.raycastTarget = true

				arg_261_1:SetGaussion(false)
			end

			local var_264_6 = 2

			if var_264_5 <= arg_261_1.time_ and arg_261_1.time_ < var_264_5 + var_264_6 then
				local var_264_7 = (arg_261_1.time_ - var_264_5) / var_264_6
				local var_264_8 = Color.New(0, 0, 0)

				var_264_8.a = Mathf.Lerp(1, 0, var_264_7)
				arg_261_1.mask_.color = var_264_8
			end

			if arg_261_1.time_ >= var_264_5 + var_264_6 and arg_261_1.time_ < var_264_5 + var_264_6 + arg_264_0 then
				local var_264_9 = Color.New(0, 0, 0)
				local var_264_10 = 0

				arg_261_1.mask_.enabled = false
				var_264_9.a = var_264_10
				arg_261_1.mask_.color = var_264_9
			end

			local var_264_11 = arg_261_1.actors_["1028ui_story"].transform
			local var_264_12 = 0

			if var_264_12 < arg_261_1.time_ and arg_261_1.time_ <= var_264_12 + arg_264_0 then
				arg_261_1.var_.moveOldPos1028ui_story = var_264_11.localPosition

				local var_264_13 = "1028ui_story"

				arg_261_1:ShowWeapon(arg_261_1.var_[var_264_13 .. "Animator"].transform, false)
			end

			local var_264_14 = 0.001

			if var_264_12 <= arg_261_1.time_ and arg_261_1.time_ < var_264_12 + var_264_14 then
				local var_264_15 = (arg_261_1.time_ - var_264_12) / var_264_14
				local var_264_16 = Vector3.New(0, 100, 0)

				var_264_11.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1028ui_story, var_264_16, var_264_15)

				local var_264_17 = manager.ui.mainCamera.transform.position - var_264_11.position

				var_264_11.forward = Vector3.New(var_264_17.x, var_264_17.y, var_264_17.z)

				local var_264_18 = var_264_11.localEulerAngles

				var_264_18.z = 0
				var_264_18.x = 0
				var_264_11.localEulerAngles = var_264_18
			end

			if arg_261_1.time_ >= var_264_12 + var_264_14 and arg_261_1.time_ < var_264_12 + var_264_14 + arg_264_0 then
				var_264_11.localPosition = Vector3.New(0, 100, 0)

				local var_264_19 = manager.ui.mainCamera.transform.position - var_264_11.position

				var_264_11.forward = Vector3.New(var_264_19.x, var_264_19.y, var_264_19.z)

				local var_264_20 = var_264_11.localEulerAngles

				var_264_20.z = 0
				var_264_20.x = 0
				var_264_11.localEulerAngles = var_264_20
			end

			local var_264_21 = arg_261_1.actors_["1028ui_story"].transform
			local var_264_22 = 1.96666666666667

			if var_264_22 < arg_261_1.time_ and arg_261_1.time_ <= var_264_22 + arg_264_0 then
				arg_261_1.var_.moveOldPos1028ui_story = var_264_21.localPosition

				local var_264_23 = "1028ui_story"

				arg_261_1:ShowWeapon(arg_261_1.var_[var_264_23 .. "Animator"].transform, false)
			end

			local var_264_24 = 0.001

			if var_264_22 <= arg_261_1.time_ and arg_261_1.time_ < var_264_22 + var_264_24 then
				local var_264_25 = (arg_261_1.time_ - var_264_22) / var_264_24
				local var_264_26 = Vector3.New(0, -0.9, -5.9)

				var_264_21.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1028ui_story, var_264_26, var_264_25)

				local var_264_27 = manager.ui.mainCamera.transform.position - var_264_21.position

				var_264_21.forward = Vector3.New(var_264_27.x, var_264_27.y, var_264_27.z)

				local var_264_28 = var_264_21.localEulerAngles

				var_264_28.z = 0
				var_264_28.x = 0
				var_264_21.localEulerAngles = var_264_28
			end

			if arg_261_1.time_ >= var_264_22 + var_264_24 and arg_261_1.time_ < var_264_22 + var_264_24 + arg_264_0 then
				var_264_21.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_264_29 = manager.ui.mainCamera.transform.position - var_264_21.position

				var_264_21.forward = Vector3.New(var_264_29.x, var_264_29.y, var_264_29.z)

				local var_264_30 = var_264_21.localEulerAngles

				var_264_30.z = 0
				var_264_30.x = 0
				var_264_21.localEulerAngles = var_264_30
			end

			local var_264_31 = arg_261_1.actors_["1028ui_story"]
			local var_264_32 = 1.96666666666667

			if var_264_32 < arg_261_1.time_ and arg_261_1.time_ <= var_264_32 + arg_264_0 and arg_261_1.var_.characterEffect1028ui_story == nil then
				arg_261_1.var_.characterEffect1028ui_story = var_264_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_33 = 0.0333333333333334

			if var_264_32 <= arg_261_1.time_ and arg_261_1.time_ < var_264_32 + var_264_33 then
				local var_264_34 = (arg_261_1.time_ - var_264_32) / var_264_33

				if arg_261_1.var_.characterEffect1028ui_story then
					arg_261_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_32 + var_264_33 and arg_261_1.time_ < var_264_32 + var_264_33 + arg_264_0 and arg_261_1.var_.characterEffect1028ui_story then
				arg_261_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_264_35 = 4

			if var_264_35 < arg_261_1.time_ and arg_261_1.time_ <= var_264_35 + arg_264_0 then
				arg_261_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_264_36 = 4

			if var_264_36 < arg_261_1.time_ and arg_261_1.time_ <= var_264_36 + arg_264_0 then
				arg_261_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			if arg_261_1.frameCnt_ <= 1 then
				arg_261_1.dialog_:SetActive(false)
			end

			local var_264_37 = 4
			local var_264_38 = 0.625

			if var_264_37 < arg_261_1.time_ and arg_261_1.time_ <= var_264_37 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0

				arg_261_1.dialog_:SetActive(true)

				local var_264_39 = LeanTween.value(arg_261_1.dialog_, 0, 1, 0.3)

				var_264_39:setOnUpdate(LuaHelper.FloatAction(function(arg_265_0)
					arg_261_1.dialogCg_.alpha = arg_265_0
				end))
				var_264_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_261_1.dialog_)
					var_264_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_261_1.duration_ = arg_261_1.duration_ + 0.3

				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_40 = arg_261_1:FormatText(StoryNameCfg[327].name)

				arg_261_1.leftNameTxt_.text = var_264_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_41 = arg_261_1:GetWordFromCfg(102804065)
				local var_264_42 = arg_261_1:FormatText(var_264_41.content)

				arg_261_1.text_.text = var_264_42

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_43 = 25
				local var_264_44 = utf8.len(var_264_42)
				local var_264_45 = var_264_43 <= 0 and var_264_38 or var_264_38 * (var_264_44 / var_264_43)

				if var_264_45 > 0 and var_264_38 < var_264_45 then
					arg_261_1.talkMaxDuration = var_264_45
					var_264_37 = var_264_37 + 0.3

					if var_264_45 + var_264_37 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_45 + var_264_37
					end
				end

				arg_261_1.text_.text = var_264_42
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804065", "story_v_side_old_102804.awb") ~= 0 then
					local var_264_46 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804065", "story_v_side_old_102804.awb") / 1000

					if var_264_46 + var_264_37 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_46 + var_264_37
					end

					if var_264_41.prefab_name ~= "" and arg_261_1.actors_[var_264_41.prefab_name] ~= nil then
						local var_264_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_41.prefab_name].transform, "story_v_side_old_102804", "102804065", "story_v_side_old_102804.awb")

						arg_261_1:RecordAudio("102804065", var_264_47)
						arg_261_1:RecordAudio("102804065", var_264_47)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804065", "story_v_side_old_102804.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804065", "story_v_side_old_102804.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_48 = var_264_37 + 0.3
			local var_264_49 = math.max(var_264_38, arg_261_1.talkMaxDuration)

			if var_264_48 <= arg_261_1.time_ and arg_261_1.time_ < var_264_48 + var_264_49 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_48) / var_264_49

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_48 + var_264_49 and arg_261_1.time_ < var_264_48 + var_264_49 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play102804066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 102804066
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play102804067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1028ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect1028ui_story == nil then
				arg_267_1.var_.characterEffect1028ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.2

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect1028ui_story then
					local var_270_4 = Mathf.Lerp(0, 0.5, var_270_3)

					arg_267_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1028ui_story.fillRatio = var_270_4
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect1028ui_story then
				local var_270_5 = 0.5

				arg_267_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1028ui_story.fillRatio = var_270_5
			end

			local var_270_6 = 0

			if var_270_6 < arg_267_1.time_ and arg_267_1.time_ <= var_270_6 + arg_270_0 then
				arg_267_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_270_7 = 0
			local var_270_8 = 1.25

			if var_270_7 < arg_267_1.time_ and arg_267_1.time_ <= var_270_7 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_9 = arg_267_1:FormatText(StoryNameCfg[7].name)

				arg_267_1.leftNameTxt_.text = var_270_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_10 = arg_267_1:GetWordFromCfg(102804066)
				local var_270_11 = arg_267_1:FormatText(var_270_10.content)

				arg_267_1.text_.text = var_270_11

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_12 = 49
				local var_270_13 = utf8.len(var_270_11)
				local var_270_14 = var_270_12 <= 0 and var_270_8 or var_270_8 * (var_270_13 / var_270_12)

				if var_270_14 > 0 and var_270_8 < var_270_14 then
					arg_267_1.talkMaxDuration = var_270_14

					if var_270_14 + var_270_7 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_14 + var_270_7
					end
				end

				arg_267_1.text_.text = var_270_11
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_15 = math.max(var_270_8, arg_267_1.talkMaxDuration)

			if var_270_7 <= arg_267_1.time_ and arg_267_1.time_ < var_270_7 + var_270_15 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_7) / var_270_15

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_7 + var_270_15 and arg_267_1.time_ < var_270_7 + var_270_15 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play102804067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 102804067
		arg_271_1.duration_ = 3

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play102804068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1028ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.characterEffect1028ui_story == nil then
				arg_271_1.var_.characterEffect1028ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.2

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect1028ui_story then
					arg_271_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect1028ui_story then
				arg_271_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_274_4 = 0

			if var_274_4 < arg_271_1.time_ and arg_271_1.time_ <= var_274_4 + arg_274_0 then
				arg_271_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_274_5 = 0
			local var_274_6 = 0.2

			if var_274_5 < arg_271_1.time_ and arg_271_1.time_ <= var_274_5 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_7 = arg_271_1:FormatText(StoryNameCfg[327].name)

				arg_271_1.leftNameTxt_.text = var_274_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_8 = arg_271_1:GetWordFromCfg(102804067)
				local var_274_9 = arg_271_1:FormatText(var_274_8.content)

				arg_271_1.text_.text = var_274_9

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_10 = 8
				local var_274_11 = utf8.len(var_274_9)
				local var_274_12 = var_274_10 <= 0 and var_274_6 or var_274_6 * (var_274_11 / var_274_10)

				if var_274_12 > 0 and var_274_6 < var_274_12 then
					arg_271_1.talkMaxDuration = var_274_12

					if var_274_12 + var_274_5 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_12 + var_274_5
					end
				end

				arg_271_1.text_.text = var_274_9
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804067", "story_v_side_old_102804.awb") ~= 0 then
					local var_274_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804067", "story_v_side_old_102804.awb") / 1000

					if var_274_13 + var_274_5 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_13 + var_274_5
					end

					if var_274_8.prefab_name ~= "" and arg_271_1.actors_[var_274_8.prefab_name] ~= nil then
						local var_274_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_8.prefab_name].transform, "story_v_side_old_102804", "102804067", "story_v_side_old_102804.awb")

						arg_271_1:RecordAudio("102804067", var_274_14)
						arg_271_1:RecordAudio("102804067", var_274_14)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804067", "story_v_side_old_102804.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804067", "story_v_side_old_102804.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_15 = math.max(var_274_6, arg_271_1.talkMaxDuration)

			if var_274_5 <= arg_271_1.time_ and arg_271_1.time_ < var_274_5 + var_274_15 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_5) / var_274_15

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_5 + var_274_15 and arg_271_1.time_ < var_274_5 + var_274_15 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play102804068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 102804068
		arg_275_1.duration_ = 8.433

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play102804069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_278_1 = 0
			local var_278_2 = 1.125

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_3 = arg_275_1:FormatText(StoryNameCfg[327].name)

				arg_275_1.leftNameTxt_.text = var_278_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_4 = arg_275_1:GetWordFromCfg(102804068)
				local var_278_5 = arg_275_1:FormatText(var_278_4.content)

				arg_275_1.text_.text = var_278_5

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_6 = 45
				local var_278_7 = utf8.len(var_278_5)
				local var_278_8 = var_278_6 <= 0 and var_278_2 or var_278_2 * (var_278_7 / var_278_6)

				if var_278_8 > 0 and var_278_2 < var_278_8 then
					arg_275_1.talkMaxDuration = var_278_8

					if var_278_8 + var_278_1 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_8 + var_278_1
					end
				end

				arg_275_1.text_.text = var_278_5
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804068", "story_v_side_old_102804.awb") ~= 0 then
					local var_278_9 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804068", "story_v_side_old_102804.awb") / 1000

					if var_278_9 + var_278_1 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_9 + var_278_1
					end

					if var_278_4.prefab_name ~= "" and arg_275_1.actors_[var_278_4.prefab_name] ~= nil then
						local var_278_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_4.prefab_name].transform, "story_v_side_old_102804", "102804068", "story_v_side_old_102804.awb")

						arg_275_1:RecordAudio("102804068", var_278_10)
						arg_275_1:RecordAudio("102804068", var_278_10)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804068", "story_v_side_old_102804.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804068", "story_v_side_old_102804.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_11 = math.max(var_278_2, arg_275_1.talkMaxDuration)

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_11 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_1) / var_278_11

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_1 + var_278_11 and arg_275_1.time_ < var_278_1 + var_278_11 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play102804069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 102804069
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play102804070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1028ui_story"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect1028ui_story == nil then
				arg_279_1.var_.characterEffect1028ui_story = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.2

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect1028ui_story then
					local var_282_4 = Mathf.Lerp(0, 0.5, var_282_3)

					arg_279_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1028ui_story.fillRatio = var_282_4
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1028ui_story then
				local var_282_5 = 0.5

				arg_279_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1028ui_story.fillRatio = var_282_5
			end

			local var_282_6 = 0
			local var_282_7 = 1

			if var_282_6 < arg_279_1.time_ and arg_279_1.time_ <= var_282_6 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, false)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_8 = arg_279_1:GetWordFromCfg(102804069)
				local var_282_9 = arg_279_1:FormatText(var_282_8.content)

				arg_279_1.text_.text = var_282_9

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_10 = 49
				local var_282_11 = utf8.len(var_282_9)
				local var_282_12 = var_282_10 <= 0 and var_282_7 or var_282_7 * (var_282_11 / var_282_10)

				if var_282_12 > 0 and var_282_7 < var_282_12 then
					arg_279_1.talkMaxDuration = var_282_12

					if var_282_12 + var_282_6 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_12 + var_282_6
					end
				end

				arg_279_1.text_.text = var_282_9
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_13 = math.max(var_282_7, arg_279_1.talkMaxDuration)

			if var_282_6 <= arg_279_1.time_ and arg_279_1.time_ < var_282_6 + var_282_13 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_6) / var_282_13

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_6 + var_282_13 and arg_279_1.time_ < var_282_6 + var_282_13 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play102804070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 102804070
		arg_283_1.duration_ = 5.2

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play102804071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = "R2801"

			if arg_283_1.bgs_[var_286_0] == nil then
				local var_286_1 = Object.Instantiate(arg_283_1.paintGo_)

				var_286_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_286_0)
				var_286_1.name = var_286_0
				var_286_1.transform.parent = arg_283_1.stage_.transform
				var_286_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_283_1.bgs_[var_286_0] = var_286_1
			end

			local var_286_2 = 2

			if var_286_2 < arg_283_1.time_ and arg_283_1.time_ <= var_286_2 + arg_286_0 then
				local var_286_3 = manager.ui.mainCamera.transform.localPosition
				local var_286_4 = Vector3.New(0, 0, 10) + Vector3.New(var_286_3.x, var_286_3.y, 0)
				local var_286_5 = arg_283_1.bgs_.R2801

				var_286_5.transform.localPosition = var_286_4
				var_286_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_286_6 = var_286_5:GetComponent("SpriteRenderer")

				if var_286_6 and var_286_6.sprite then
					local var_286_7 = (var_286_5.transform.localPosition - var_286_3).z
					local var_286_8 = manager.ui.mainCameraCom_
					local var_286_9 = 2 * var_286_7 * Mathf.Tan(var_286_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_286_10 = var_286_9 * var_286_8.aspect
					local var_286_11 = var_286_6.sprite.bounds.size.x
					local var_286_12 = var_286_6.sprite.bounds.size.y
					local var_286_13 = var_286_10 / var_286_11
					local var_286_14 = var_286_9 / var_286_12
					local var_286_15 = var_286_14 < var_286_13 and var_286_13 or var_286_14

					var_286_5.transform.localScale = Vector3.New(var_286_15, var_286_15, 0)
				end

				for iter_286_0, iter_286_1 in pairs(arg_283_1.bgs_) do
					if iter_286_0 ~= "R2801" then
						iter_286_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_286_16 = 0

			if var_286_16 < arg_283_1.time_ and arg_283_1.time_ <= var_286_16 + arg_286_0 then
				arg_283_1.mask_.enabled = true
				arg_283_1.mask_.raycastTarget = true

				arg_283_1:SetGaussion(false)
			end

			local var_286_17 = 2

			if var_286_16 <= arg_283_1.time_ and arg_283_1.time_ < var_286_16 + var_286_17 then
				local var_286_18 = (arg_283_1.time_ - var_286_16) / var_286_17
				local var_286_19 = Color.New(0, 0, 0)

				var_286_19.a = Mathf.Lerp(0, 1, var_286_18)
				arg_283_1.mask_.color = var_286_19
			end

			if arg_283_1.time_ >= var_286_16 + var_286_17 and arg_283_1.time_ < var_286_16 + var_286_17 + arg_286_0 then
				local var_286_20 = Color.New(0, 0, 0)

				var_286_20.a = 1
				arg_283_1.mask_.color = var_286_20
			end

			local var_286_21 = 2

			if var_286_21 < arg_283_1.time_ and arg_283_1.time_ <= var_286_21 + arg_286_0 then
				arg_283_1.mask_.enabled = true
				arg_283_1.mask_.raycastTarget = true

				arg_283_1:SetGaussion(false)
			end

			local var_286_22 = 2

			if var_286_21 <= arg_283_1.time_ and arg_283_1.time_ < var_286_21 + var_286_22 then
				local var_286_23 = (arg_283_1.time_ - var_286_21) / var_286_22
				local var_286_24 = Color.New(0, 0, 0)

				var_286_24.a = Mathf.Lerp(1, 0, var_286_23)
				arg_283_1.mask_.color = var_286_24
			end

			if arg_283_1.time_ >= var_286_21 + var_286_22 and arg_283_1.time_ < var_286_21 + var_286_22 + arg_286_0 then
				local var_286_25 = Color.New(0, 0, 0)
				local var_286_26 = 0

				arg_283_1.mask_.enabled = false
				var_286_25.a = var_286_26
				arg_283_1.mask_.color = var_286_25
			end

			local var_286_27 = arg_283_1.actors_["1028ui_story"].transform
			local var_286_28 = 1.966

			if var_286_28 < arg_283_1.time_ and arg_283_1.time_ <= var_286_28 + arg_286_0 then
				arg_283_1.var_.moveOldPos1028ui_story = var_286_27.localPosition

				local var_286_29 = "1028ui_story"

				arg_283_1:ShowWeapon(arg_283_1.var_[var_286_29 .. "Animator"].transform, false)
			end

			local var_286_30 = 0.001

			if var_286_28 <= arg_283_1.time_ and arg_283_1.time_ < var_286_28 + var_286_30 then
				local var_286_31 = (arg_283_1.time_ - var_286_28) / var_286_30
				local var_286_32 = Vector3.New(0, 100, 0)

				var_286_27.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1028ui_story, var_286_32, var_286_31)

				local var_286_33 = manager.ui.mainCamera.transform.position - var_286_27.position

				var_286_27.forward = Vector3.New(var_286_33.x, var_286_33.y, var_286_33.z)

				local var_286_34 = var_286_27.localEulerAngles

				var_286_34.z = 0
				var_286_34.x = 0
				var_286_27.localEulerAngles = var_286_34
			end

			if arg_283_1.time_ >= var_286_28 + var_286_30 and arg_283_1.time_ < var_286_28 + var_286_30 + arg_286_0 then
				var_286_27.localPosition = Vector3.New(0, 100, 0)

				local var_286_35 = manager.ui.mainCamera.transform.position - var_286_27.position

				var_286_27.forward = Vector3.New(var_286_35.x, var_286_35.y, var_286_35.z)

				local var_286_36 = var_286_27.localEulerAngles

				var_286_36.z = 0
				var_286_36.x = 0
				var_286_27.localEulerAngles = var_286_36
			end

			local var_286_37 = 2
			local var_286_38 = 1

			if var_286_37 < arg_283_1.time_ and arg_283_1.time_ <= var_286_37 + arg_286_0 then
				local var_286_39 = "play"
				local var_286_40 = "effect"

				arg_283_1:AudioAction(var_286_39, var_286_40, "se_story_side_1028", "se_story_1028_thunder", "")
			end

			if arg_283_1.frameCnt_ <= 1 then
				arg_283_1.dialog_:SetActive(false)
			end

			local var_286_41 = 4
			local var_286_42 = 0.1

			if var_286_41 < arg_283_1.time_ and arg_283_1.time_ <= var_286_41 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0

				arg_283_1.dialog_:SetActive(true)

				local var_286_43 = LeanTween.value(arg_283_1.dialog_, 0, 1, 0.3)

				var_286_43:setOnUpdate(LuaHelper.FloatAction(function(arg_287_0)
					arg_283_1.dialogCg_.alpha = arg_287_0
				end))
				var_286_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_283_1.dialog_)
					var_286_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_283_1.duration_ = arg_283_1.duration_ + 0.3

				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_44 = arg_283_1:FormatText(StoryNameCfg[327].name)

				arg_283_1.leftNameTxt_.text = var_286_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_45 = arg_283_1:GetWordFromCfg(102804070)
				local var_286_46 = arg_283_1:FormatText(var_286_45.content)

				arg_283_1.text_.text = var_286_46

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_47 = 4
				local var_286_48 = utf8.len(var_286_46)
				local var_286_49 = var_286_47 <= 0 and var_286_42 or var_286_42 * (var_286_48 / var_286_47)

				if var_286_49 > 0 and var_286_42 < var_286_49 then
					arg_283_1.talkMaxDuration = var_286_49
					var_286_41 = var_286_41 + 0.3

					if var_286_49 + var_286_41 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_49 + var_286_41
					end
				end

				arg_283_1.text_.text = var_286_46
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804070", "story_v_side_old_102804.awb") ~= 0 then
					local var_286_50 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804070", "story_v_side_old_102804.awb") / 1000

					if var_286_50 + var_286_41 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_50 + var_286_41
					end

					if var_286_45.prefab_name ~= "" and arg_283_1.actors_[var_286_45.prefab_name] ~= nil then
						local var_286_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_45.prefab_name].transform, "story_v_side_old_102804", "102804070", "story_v_side_old_102804.awb")

						arg_283_1:RecordAudio("102804070", var_286_51)
						arg_283_1:RecordAudio("102804070", var_286_51)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804070", "story_v_side_old_102804.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804070", "story_v_side_old_102804.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_52 = var_286_41 + 0.3
			local var_286_53 = math.max(var_286_42, arg_283_1.talkMaxDuration)

			if var_286_52 <= arg_283_1.time_ and arg_283_1.time_ < var_286_52 + var_286_53 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_52) / var_286_53

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_52 + var_286_53 and arg_283_1.time_ < var_286_52 + var_286_53 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play102804071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 102804071
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play102804072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.7

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

				local var_292_2 = arg_289_1:GetWordFromCfg(102804071)
				local var_292_3 = arg_289_1:FormatText(var_292_2.content)

				arg_289_1.text_.text = var_292_3

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_4 = 38
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
	Play102804072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 102804072
		arg_293_1.duration_ = 1.599999999999

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play102804073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = manager.ui.mainCamera.transform
			local var_296_1 = 0.075

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				arg_293_1.var_.shakeOldPos = var_296_0.localPosition
			end

			local var_296_2 = 0.525

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / 0.066
				local var_296_4, var_296_5 = math.modf(var_296_3)

				var_296_0.localPosition = Vector3.New(var_296_5 * 0.13, var_296_5 * 0.13, var_296_5 * 0.13) + arg_293_1.var_.shakeOldPos
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 then
				var_296_0.localPosition = arg_293_1.var_.shakeOldPos
			end

			local var_296_6 = 0.4
			local var_296_7 = 1

			if var_296_6 < arg_293_1.time_ and arg_293_1.time_ <= var_296_6 + arg_296_0 then
				local var_296_8 = "play"
				local var_296_9 = "effect"

				arg_293_1:AudioAction(var_296_8, var_296_9, "se_story_side_1028", "se_story_1028_hongming", "")
			end

			local var_296_10 = 0
			local var_296_11 = 0.075

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_12 = arg_293_1:FormatText(StoryNameCfg[327].name)

				arg_293_1.leftNameTxt_.text = var_296_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_13 = arg_293_1:GetWordFromCfg(102804072)
				local var_296_14 = arg_293_1:FormatText(var_296_13.content)

				arg_293_1.text_.text = var_296_14

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_15 = 3
				local var_296_16 = utf8.len(var_296_14)
				local var_296_17 = var_296_15 <= 0 and var_296_11 or var_296_11 * (var_296_16 / var_296_15)

				if var_296_17 > 0 and var_296_11 < var_296_17 then
					arg_293_1.talkMaxDuration = var_296_17

					if var_296_17 + var_296_10 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_17 + var_296_10
					end
				end

				arg_293_1.text_.text = var_296_14
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804072", "story_v_side_old_102804.awb") ~= 0 then
					local var_296_18 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804072", "story_v_side_old_102804.awb") / 1000

					if var_296_18 + var_296_10 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_18 + var_296_10
					end

					if var_296_13.prefab_name ~= "" and arg_293_1.actors_[var_296_13.prefab_name] ~= nil then
						local var_296_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_13.prefab_name].transform, "story_v_side_old_102804", "102804072", "story_v_side_old_102804.awb")

						arg_293_1:RecordAudio("102804072", var_296_19)
						arg_293_1:RecordAudio("102804072", var_296_19)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804072", "story_v_side_old_102804.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804072", "story_v_side_old_102804.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_20 = math.max(var_296_11, arg_293_1.talkMaxDuration)

			if var_296_10 <= arg_293_1.time_ and arg_293_1.time_ < var_296_10 + var_296_20 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_10) / var_296_20

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_10 + var_296_20 and arg_293_1.time_ < var_296_10 + var_296_20 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play102804073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 102804073
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play102804074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.875

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

				local var_300_2 = arg_297_1:GetWordFromCfg(102804073)
				local var_300_3 = arg_297_1:FormatText(var_300_2.content)

				arg_297_1.text_.text = var_300_3

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_4 = 35
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
	Play102804074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 102804074
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play102804075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.9

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_2 = arg_301_1:GetWordFromCfg(102804074)
				local var_304_3 = arg_301_1:FormatText(var_304_2.content)

				arg_301_1.text_.text = var_304_3

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_4 = 36
				local var_304_5 = utf8.len(var_304_3)
				local var_304_6 = var_304_4 <= 0 and var_304_1 or var_304_1 * (var_304_5 / var_304_4)

				if var_304_6 > 0 and var_304_1 < var_304_6 then
					arg_301_1.talkMaxDuration = var_304_6

					if var_304_6 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_6 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_3
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_7 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_7 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_7

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_7 and arg_301_1.time_ < var_304_0 + var_304_7 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play102804075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 102804075
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play102804076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.45

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, false)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_2 = arg_305_1:GetWordFromCfg(102804075)
				local var_308_3 = arg_305_1:FormatText(var_308_2.content)

				arg_305_1.text_.text = var_308_3

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_4 = 18
				local var_308_5 = utf8.len(var_308_3)
				local var_308_6 = var_308_4 <= 0 and var_308_1 or var_308_1 * (var_308_5 / var_308_4)

				if var_308_6 > 0 and var_308_1 < var_308_6 then
					arg_305_1.talkMaxDuration = var_308_6

					if var_308_6 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_6 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_3
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_7 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_7 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_7

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_7 and arg_305_1.time_ < var_308_0 + var_308_7 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play102804076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 102804076
		arg_309_1.duration_ = 5

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play102804077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0
			local var_312_1 = 0.35

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, false)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_2 = arg_309_1:GetWordFromCfg(102804076)
				local var_312_3 = arg_309_1:FormatText(var_312_2.content)

				arg_309_1.text_.text = var_312_3

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_4 = 14
				local var_312_5 = utf8.len(var_312_3)
				local var_312_6 = var_312_4 <= 0 and var_312_1 or var_312_1 * (var_312_5 / var_312_4)

				if var_312_6 > 0 and var_312_1 < var_312_6 then
					arg_309_1.talkMaxDuration = var_312_6

					if var_312_6 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_6 + var_312_0
					end
				end

				arg_309_1.text_.text = var_312_3
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_7 = math.max(var_312_1, arg_309_1.talkMaxDuration)

			if var_312_0 <= arg_309_1.time_ and arg_309_1.time_ < var_312_0 + var_312_7 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_0) / var_312_7

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_0 + var_312_7 and arg_309_1.time_ < var_312_0 + var_312_7 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play102804077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 102804077
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play102804078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.925

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, false)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_2 = arg_313_1:GetWordFromCfg(102804077)
				local var_316_3 = arg_313_1:FormatText(var_316_2.content)

				arg_313_1.text_.text = var_316_3

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_4 = 37
				local var_316_5 = utf8.len(var_316_3)
				local var_316_6 = var_316_4 <= 0 and var_316_1 or var_316_1 * (var_316_5 / var_316_4)

				if var_316_6 > 0 and var_316_1 < var_316_6 then
					arg_313_1.talkMaxDuration = var_316_6

					if var_316_6 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_6 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_3
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_7 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_7 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_7

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_7 and arg_313_1.time_ < var_316_0 + var_316_7 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play102804078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 102804078
		arg_317_1.duration_ = 6.23333333333333

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play102804079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 2

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				local var_320_1 = manager.ui.mainCamera.transform.localPosition
				local var_320_2 = Vector3.New(0, 0, 10) + Vector3.New(var_320_1.x, var_320_1.y, 0)
				local var_320_3 = arg_317_1.bgs_.H01a

				var_320_3.transform.localPosition = var_320_2
				var_320_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_320_4 = var_320_3:GetComponent("SpriteRenderer")

				if var_320_4 and var_320_4.sprite then
					local var_320_5 = (var_320_3.transform.localPosition - var_320_1).z
					local var_320_6 = manager.ui.mainCameraCom_
					local var_320_7 = 2 * var_320_5 * Mathf.Tan(var_320_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_320_8 = var_320_7 * var_320_6.aspect
					local var_320_9 = var_320_4.sprite.bounds.size.x
					local var_320_10 = var_320_4.sprite.bounds.size.y
					local var_320_11 = var_320_8 / var_320_9
					local var_320_12 = var_320_7 / var_320_10
					local var_320_13 = var_320_12 < var_320_11 and var_320_11 or var_320_12

					var_320_3.transform.localScale = Vector3.New(var_320_13, var_320_13, 0)
				end

				for iter_320_0, iter_320_1 in pairs(arg_317_1.bgs_) do
					if iter_320_0 ~= "H01a" then
						iter_320_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 then
				arg_317_1.mask_.enabled = true
				arg_317_1.mask_.raycastTarget = true

				arg_317_1:SetGaussion(false)
			end

			local var_320_15 = 2

			if var_320_14 <= arg_317_1.time_ and arg_317_1.time_ < var_320_14 + var_320_15 then
				local var_320_16 = (arg_317_1.time_ - var_320_14) / var_320_15
				local var_320_17 = Color.New(1, 1, 1)

				var_320_17.a = Mathf.Lerp(0, 1, var_320_16)
				arg_317_1.mask_.color = var_320_17
			end

			if arg_317_1.time_ >= var_320_14 + var_320_15 and arg_317_1.time_ < var_320_14 + var_320_15 + arg_320_0 then
				local var_320_18 = Color.New(1, 1, 1)

				var_320_18.a = 1
				arg_317_1.mask_.color = var_320_18
			end

			local var_320_19 = 2

			if var_320_19 < arg_317_1.time_ and arg_317_1.time_ <= var_320_19 + arg_320_0 then
				arg_317_1.mask_.enabled = true
				arg_317_1.mask_.raycastTarget = true

				arg_317_1:SetGaussion(false)
			end

			local var_320_20 = 2.03333333333333

			if var_320_19 <= arg_317_1.time_ and arg_317_1.time_ < var_320_19 + var_320_20 then
				local var_320_21 = (arg_317_1.time_ - var_320_19) / var_320_20
				local var_320_22 = Color.New(1, 1, 1)

				var_320_22.a = Mathf.Lerp(1, 0, var_320_21)
				arg_317_1.mask_.color = var_320_22
			end

			if arg_317_1.time_ >= var_320_19 + var_320_20 and arg_317_1.time_ < var_320_19 + var_320_20 + arg_320_0 then
				local var_320_23 = Color.New(1, 1, 1)
				local var_320_24 = 0

				arg_317_1.mask_.enabled = false
				var_320_23.a = var_320_24
				arg_317_1.mask_.color = var_320_23
			end

			local var_320_25 = arg_317_1.actors_["1028ui_story"].transform
			local var_320_26 = 3.96666666666667

			if var_320_26 < arg_317_1.time_ and arg_317_1.time_ <= var_320_26 + arg_320_0 then
				arg_317_1.var_.moveOldPos1028ui_story = var_320_25.localPosition

				local var_320_27 = "1028ui_story"

				arg_317_1:ShowWeapon(arg_317_1.var_[var_320_27 .. "Animator"].transform, false)
			end

			local var_320_28 = 0.001

			if var_320_26 <= arg_317_1.time_ and arg_317_1.time_ < var_320_26 + var_320_28 then
				local var_320_29 = (arg_317_1.time_ - var_320_26) / var_320_28
				local var_320_30 = Vector3.New(0, -0.9, -5.9)

				var_320_25.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1028ui_story, var_320_30, var_320_29)

				local var_320_31 = manager.ui.mainCamera.transform.position - var_320_25.position

				var_320_25.forward = Vector3.New(var_320_31.x, var_320_31.y, var_320_31.z)

				local var_320_32 = var_320_25.localEulerAngles

				var_320_32.z = 0
				var_320_32.x = 0
				var_320_25.localEulerAngles = var_320_32
			end

			if arg_317_1.time_ >= var_320_26 + var_320_28 and arg_317_1.time_ < var_320_26 + var_320_28 + arg_320_0 then
				var_320_25.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_320_33 = manager.ui.mainCamera.transform.position - var_320_25.position

				var_320_25.forward = Vector3.New(var_320_33.x, var_320_33.y, var_320_33.z)

				local var_320_34 = var_320_25.localEulerAngles

				var_320_34.z = 0
				var_320_34.x = 0
				var_320_25.localEulerAngles = var_320_34
			end

			local var_320_35 = arg_317_1.actors_["1028ui_story"]
			local var_320_36 = 3.96666666666667

			if var_320_36 < arg_317_1.time_ and arg_317_1.time_ <= var_320_36 + arg_320_0 and arg_317_1.var_.characterEffect1028ui_story == nil then
				arg_317_1.var_.characterEffect1028ui_story = var_320_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_37 = 0.166666666666666

			if var_320_36 <= arg_317_1.time_ and arg_317_1.time_ < var_320_36 + var_320_37 then
				local var_320_38 = (arg_317_1.time_ - var_320_36) / var_320_37

				if arg_317_1.var_.characterEffect1028ui_story then
					arg_317_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_36 + var_320_37 and arg_317_1.time_ < var_320_36 + var_320_37 + arg_320_0 and arg_317_1.var_.characterEffect1028ui_story then
				arg_317_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_320_39 = 3.96666666666667

			if var_320_39 < arg_317_1.time_ and arg_317_1.time_ <= var_320_39 + arg_320_0 then
				arg_317_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_320_40 = 3.96666666666667

			if var_320_40 < arg_317_1.time_ and arg_317_1.time_ <= var_320_40 + arg_320_0 then
				arg_317_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_320_41 = 1.96666666666667

			if var_320_41 < arg_317_1.time_ and arg_317_1.time_ <= var_320_41 + arg_320_0 then
				arg_317_1.screenFilterGo_:SetActive(true)

				arg_317_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_320_42 = 0.233333333333334

			if var_320_41 <= arg_317_1.time_ and arg_317_1.time_ < var_320_41 + var_320_42 then
				local var_320_43 = (arg_317_1.time_ - var_320_41) / var_320_42

				arg_317_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_320_43)
			end

			if arg_317_1.time_ >= var_320_41 + var_320_42 and arg_317_1.time_ < var_320_41 + var_320_42 + arg_320_0 then
				arg_317_1.screenFilterEffect_.weight = 1
			end

			if arg_317_1.frameCnt_ <= 1 then
				arg_317_1.dialog_:SetActive(false)
			end

			local var_320_44 = 4.03333333333333
			local var_320_45 = 0.1

			if var_320_44 < arg_317_1.time_ and arg_317_1.time_ <= var_320_44 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0

				arg_317_1.dialog_:SetActive(true)

				local var_320_46 = LeanTween.value(arg_317_1.dialog_, 0, 1, 0.3)

				var_320_46:setOnUpdate(LuaHelper.FloatAction(function(arg_321_0)
					arg_317_1.dialogCg_.alpha = arg_321_0
				end))
				var_320_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_317_1.dialog_)
					var_320_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_317_1.duration_ = arg_317_1.duration_ + 0.3

				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_47 = arg_317_1:FormatText(StoryNameCfg[327].name)

				arg_317_1.leftNameTxt_.text = var_320_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_48 = arg_317_1:GetWordFromCfg(102804078)
				local var_320_49 = arg_317_1:FormatText(var_320_48.content)

				arg_317_1.text_.text = var_320_49

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_50 = 4
				local var_320_51 = utf8.len(var_320_49)
				local var_320_52 = var_320_50 <= 0 and var_320_45 or var_320_45 * (var_320_51 / var_320_50)

				if var_320_52 > 0 and var_320_45 < var_320_52 then
					arg_317_1.talkMaxDuration = var_320_52
					var_320_44 = var_320_44 + 0.3

					if var_320_52 + var_320_44 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_52 + var_320_44
					end
				end

				arg_317_1.text_.text = var_320_49
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804078", "story_v_side_old_102804.awb") ~= 0 then
					local var_320_53 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804078", "story_v_side_old_102804.awb") / 1000

					if var_320_53 + var_320_44 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_53 + var_320_44
					end

					if var_320_48.prefab_name ~= "" and arg_317_1.actors_[var_320_48.prefab_name] ~= nil then
						local var_320_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_48.prefab_name].transform, "story_v_side_old_102804", "102804078", "story_v_side_old_102804.awb")

						arg_317_1:RecordAudio("102804078", var_320_54)
						arg_317_1:RecordAudio("102804078", var_320_54)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804078", "story_v_side_old_102804.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804078", "story_v_side_old_102804.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_55 = var_320_44 + 0.3
			local var_320_56 = math.max(var_320_45, arg_317_1.talkMaxDuration)

			if var_320_55 <= arg_317_1.time_ and arg_317_1.time_ < var_320_55 + var_320_56 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_55) / var_320_56

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_55 + var_320_56 and arg_317_1.time_ < var_320_55 + var_320_56 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play102804079 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 102804079
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play102804080(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1028ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect1028ui_story == nil then
				arg_323_1.var_.characterEffect1028ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.166666666666666

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect1028ui_story then
					local var_326_4 = Mathf.Lerp(0, 0.5, var_326_3)

					arg_323_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1028ui_story.fillRatio = var_326_4
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect1028ui_story then
				local var_326_5 = 0.5

				arg_323_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1028ui_story.fillRatio = var_326_5
			end

			local var_326_6 = 0
			local var_326_7 = 0.55

			if var_326_6 < arg_323_1.time_ and arg_323_1.time_ <= var_326_6 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_8 = arg_323_1:FormatText(StoryNameCfg[7].name)

				arg_323_1.leftNameTxt_.text = var_326_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_9 = arg_323_1:GetWordFromCfg(102804079)
				local var_326_10 = arg_323_1:FormatText(var_326_9.content)

				arg_323_1.text_.text = var_326_10

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_11 = 22
				local var_326_12 = utf8.len(var_326_10)
				local var_326_13 = var_326_11 <= 0 and var_326_7 or var_326_7 * (var_326_12 / var_326_11)

				if var_326_13 > 0 and var_326_7 < var_326_13 then
					arg_323_1.talkMaxDuration = var_326_13

					if var_326_13 + var_326_6 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_13 + var_326_6
					end
				end

				arg_323_1.text_.text = var_326_10
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_14 = math.max(var_326_7, arg_323_1.talkMaxDuration)

			if var_326_6 <= arg_323_1.time_ and arg_323_1.time_ < var_326_6 + var_326_14 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_6) / var_326_14

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_6 + var_326_14 and arg_323_1.time_ < var_326_6 + var_326_14 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play102804080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 102804080
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play102804081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 0.325

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_2 = arg_327_1:FormatText(StoryNameCfg[7].name)

				arg_327_1.leftNameTxt_.text = var_330_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_3 = arg_327_1:GetWordFromCfg(102804080)
				local var_330_4 = arg_327_1:FormatText(var_330_3.content)

				arg_327_1.text_.text = var_330_4

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_5 = 13
				local var_330_6 = utf8.len(var_330_4)
				local var_330_7 = var_330_5 <= 0 and var_330_1 or var_330_1 * (var_330_6 / var_330_5)

				if var_330_7 > 0 and var_330_1 < var_330_7 then
					arg_327_1.talkMaxDuration = var_330_7

					if var_330_7 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_7 + var_330_0
					end
				end

				arg_327_1.text_.text = var_330_4
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_8 = math.max(var_330_1, arg_327_1.talkMaxDuration)

			if var_330_0 <= arg_327_1.time_ and arg_327_1.time_ < var_330_0 + var_330_8 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_0) / var_330_8

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_0 + var_330_8 and arg_327_1.time_ < var_330_0 + var_330_8 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play102804081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 102804081
		arg_331_1.duration_ = 5

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play102804082(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0
			local var_334_1 = 1.05

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, false)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_2 = arg_331_1:GetWordFromCfg(102804081)
				local var_334_3 = arg_331_1:FormatText(var_334_2.content)

				arg_331_1.text_.text = var_334_3

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_4 = 42
				local var_334_5 = utf8.len(var_334_3)
				local var_334_6 = var_334_4 <= 0 and var_334_1 or var_334_1 * (var_334_5 / var_334_4)

				if var_334_6 > 0 and var_334_1 < var_334_6 then
					arg_331_1.talkMaxDuration = var_334_6

					if var_334_6 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_6 + var_334_0
					end
				end

				arg_331_1.text_.text = var_334_3
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_7 = math.max(var_334_1, arg_331_1.talkMaxDuration)

			if var_334_0 <= arg_331_1.time_ and arg_331_1.time_ < var_334_0 + var_334_7 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_0) / var_334_7

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_0 + var_334_7 and arg_331_1.time_ < var_334_0 + var_334_7 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play102804082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 102804082
		arg_335_1.duration_ = 7.95

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play102804083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0.966666666666667

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.screenFilterGo_:SetActive(false)
			end

			local var_338_1 = 0.0333333333333333

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_1 then
				local var_338_2 = (arg_335_1.time_ - var_338_0) / var_338_1

				arg_335_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_338_2)
			end

			if arg_335_1.time_ >= var_338_0 + var_338_1 and arg_335_1.time_ < var_338_0 + var_338_1 + arg_338_0 then
				arg_335_1.screenFilterEffect_.weight = 0
			end

			local var_338_3 = 0

			if var_338_3 < arg_335_1.time_ and arg_335_1.time_ <= var_338_3 + arg_338_0 then
				arg_335_1.mask_.enabled = true
				arg_335_1.mask_.raycastTarget = true

				arg_335_1:SetGaussion(false)
			end

			local var_338_4 = 1

			if var_338_3 <= arg_335_1.time_ and arg_335_1.time_ < var_338_3 + var_338_4 then
				local var_338_5 = (arg_335_1.time_ - var_338_3) / var_338_4
				local var_338_6 = Color.New(1, 1, 1)

				var_338_6.a = Mathf.Lerp(0, 1, var_338_5)
				arg_335_1.mask_.color = var_338_6
			end

			if arg_335_1.time_ >= var_338_3 + var_338_4 and arg_335_1.time_ < var_338_3 + var_338_4 + arg_338_0 then
				local var_338_7 = Color.New(1, 1, 1)

				var_338_7.a = 1
				arg_335_1.mask_.color = var_338_7
			end

			local var_338_8 = 1

			if var_338_8 < arg_335_1.time_ and arg_335_1.time_ <= var_338_8 + arg_338_0 then
				arg_335_1.mask_.enabled = true
				arg_335_1.mask_.raycastTarget = true

				arg_335_1:SetGaussion(false)
			end

			local var_338_9 = 2

			if var_338_8 <= arg_335_1.time_ and arg_335_1.time_ < var_338_8 + var_338_9 then
				local var_338_10 = (arg_335_1.time_ - var_338_8) / var_338_9
				local var_338_11 = Color.New(1, 1, 1)

				var_338_11.a = Mathf.Lerp(1, 0, var_338_10)
				arg_335_1.mask_.color = var_338_11
			end

			if arg_335_1.time_ >= var_338_8 + var_338_9 and arg_335_1.time_ < var_338_8 + var_338_9 + arg_338_0 then
				local var_338_12 = Color.New(1, 1, 1)
				local var_338_13 = 0

				arg_335_1.mask_.enabled = false
				var_338_12.a = var_338_13
				arg_335_1.mask_.color = var_338_12
			end

			local var_338_14 = arg_335_1.actors_["1028ui_story"].transform
			local var_338_15 = 0.983333333333333

			if var_338_15 < arg_335_1.time_ and arg_335_1.time_ <= var_338_15 + arg_338_0 then
				arg_335_1.var_.moveOldPos1028ui_story = var_338_14.localPosition

				local var_338_16 = "1028ui_story"

				arg_335_1:ShowWeapon(arg_335_1.var_[var_338_16 .. "Animator"].transform, false)
			end

			local var_338_17 = 0.001

			if var_338_15 <= arg_335_1.time_ and arg_335_1.time_ < var_338_15 + var_338_17 then
				local var_338_18 = (arg_335_1.time_ - var_338_15) / var_338_17
				local var_338_19 = Vector3.New(0, 100, 0)

				var_338_14.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos1028ui_story, var_338_19, var_338_18)

				local var_338_20 = manager.ui.mainCamera.transform.position - var_338_14.position

				var_338_14.forward = Vector3.New(var_338_20.x, var_338_20.y, var_338_20.z)

				local var_338_21 = var_338_14.localEulerAngles

				var_338_21.z = 0
				var_338_21.x = 0
				var_338_14.localEulerAngles = var_338_21
			end

			if arg_335_1.time_ >= var_338_15 + var_338_17 and arg_335_1.time_ < var_338_15 + var_338_17 + arg_338_0 then
				var_338_14.localPosition = Vector3.New(0, 100, 0)

				local var_338_22 = manager.ui.mainCamera.transform.position - var_338_14.position

				var_338_14.forward = Vector3.New(var_338_22.x, var_338_22.y, var_338_22.z)

				local var_338_23 = var_338_14.localEulerAngles

				var_338_23.z = 0
				var_338_23.x = 0
				var_338_14.localEulerAngles = var_338_23
			end

			local var_338_24 = arg_335_1.actors_["1028ui_story"]
			local var_338_25 = 0

			if var_338_25 < arg_335_1.time_ and arg_335_1.time_ <= var_338_25 + arg_338_0 and arg_335_1.var_.characterEffect1028ui_story == nil then
				arg_335_1.var_.characterEffect1028ui_story = var_338_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_26 = 0.133333333333333

			if var_338_25 <= arg_335_1.time_ and arg_335_1.time_ < var_338_25 + var_338_26 then
				local var_338_27 = (arg_335_1.time_ - var_338_25) / var_338_26

				if arg_335_1.var_.characterEffect1028ui_story then
					local var_338_28 = Mathf.Lerp(0, 0.5, var_338_27)

					arg_335_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_335_1.var_.characterEffect1028ui_story.fillRatio = var_338_28
				end
			end

			if arg_335_1.time_ >= var_338_25 + var_338_26 and arg_335_1.time_ < var_338_25 + var_338_26 + arg_338_0 and arg_335_1.var_.characterEffect1028ui_story then
				local var_338_29 = 0.5

				arg_335_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_335_1.var_.characterEffect1028ui_story.fillRatio = var_338_29
			end

			if arg_335_1.frameCnt_ <= 1 then
				arg_335_1.dialog_:SetActive(false)
			end

			local var_338_30 = 2.95
			local var_338_31 = 0.05

			if var_338_30 < arg_335_1.time_ and arg_335_1.time_ <= var_338_30 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0

				arg_335_1.dialog_:SetActive(true)

				local var_338_32 = LeanTween.value(arg_335_1.dialog_, 0, 1, 0.3)

				var_338_32:setOnUpdate(LuaHelper.FloatAction(function(arg_339_0)
					arg_335_1.dialogCg_.alpha = arg_339_0
				end))
				var_338_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_335_1.dialog_)
					var_338_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_335_1.duration_ = arg_335_1.duration_ + 0.3

				SetActive(arg_335_1.leftNameGo_, false)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_33 = arg_335_1:GetWordFromCfg(102804082)
				local var_338_34 = arg_335_1:FormatText(var_338_33.content)

				arg_335_1.text_.text = var_338_34

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_35 = 2
				local var_338_36 = utf8.len(var_338_34)
				local var_338_37 = var_338_35 <= 0 and var_338_31 or var_338_31 * (var_338_36 / var_338_35)

				if var_338_37 > 0 and var_338_31 < var_338_37 then
					arg_335_1.talkMaxDuration = var_338_37
					var_338_30 = var_338_30 + 0.3

					if var_338_37 + var_338_30 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_37 + var_338_30
					end
				end

				arg_335_1.text_.text = var_338_34
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_38 = var_338_30 + 0.3
			local var_338_39 = math.max(var_338_31, arg_335_1.talkMaxDuration)

			if var_338_38 <= arg_335_1.time_ and arg_335_1.time_ < var_338_38 + var_338_39 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_38) / var_338_39

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_38 + var_338_39 and arg_335_1.time_ < var_338_38 + var_338_39 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play102804083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 102804083
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play102804084(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0
			local var_344_1 = 1

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				local var_344_2 = "play"
				local var_344_3 = "effect"

				arg_341_1:AudioAction(var_344_2, var_344_3, "se_story_side_1028", "se_story_1028_lightarrow", "")
			end

			local var_344_4 = 0
			local var_344_5 = 0.7

			if var_344_4 < arg_341_1.time_ and arg_341_1.time_ <= var_344_4 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, false)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_6 = arg_341_1:GetWordFromCfg(102804083)
				local var_344_7 = arg_341_1:FormatText(var_344_6.content)

				arg_341_1.text_.text = var_344_7

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_8 = 41
				local var_344_9 = utf8.len(var_344_7)
				local var_344_10 = var_344_8 <= 0 and var_344_5 or var_344_5 * (var_344_9 / var_344_8)

				if var_344_10 > 0 and var_344_5 < var_344_10 then
					arg_341_1.talkMaxDuration = var_344_10

					if var_344_10 + var_344_4 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_10 + var_344_4
					end
				end

				arg_341_1.text_.text = var_344_7
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_11 = math.max(var_344_5, arg_341_1.talkMaxDuration)

			if var_344_4 <= arg_341_1.time_ and arg_341_1.time_ < var_344_4 + var_344_11 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_4) / var_344_11

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_4 + var_344_11 and arg_341_1.time_ < var_344_4 + var_344_11 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play102804084 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 102804084
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play102804085(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 0.125

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_2 = arg_345_1:FormatText(StoryNameCfg[7].name)

				arg_345_1.leftNameTxt_.text = var_348_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_3 = arg_345_1:GetWordFromCfg(102804084)
				local var_348_4 = arg_345_1:FormatText(var_348_3.content)

				arg_345_1.text_.text = var_348_4

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_5 = 5
				local var_348_6 = utf8.len(var_348_4)
				local var_348_7 = var_348_5 <= 0 and var_348_1 or var_348_1 * (var_348_6 / var_348_5)

				if var_348_7 > 0 and var_348_1 < var_348_7 then
					arg_345_1.talkMaxDuration = var_348_7

					if var_348_7 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_7 + var_348_0
					end
				end

				arg_345_1.text_.text = var_348_4
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_8 = math.max(var_348_1, arg_345_1.talkMaxDuration)

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_8 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_0) / var_348_8

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_0 + var_348_8 and arg_345_1.time_ < var_348_0 + var_348_8 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play102804085 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 102804085
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play102804086(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1028ui_story"].transform
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos1028ui_story = var_352_0.localPosition

				local var_352_2 = "1028ui_story"

				arg_349_1:ShowWeapon(arg_349_1.var_[var_352_2 .. "Animator"].transform, false)
			end

			local var_352_3 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_3 then
				local var_352_4 = (arg_349_1.time_ - var_352_1) / var_352_3
				local var_352_5 = Vector3.New(0, -0.9, -5.9)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1028ui_story, var_352_5, var_352_4)

				local var_352_6 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_6.x, var_352_6.y, var_352_6.z)

				local var_352_7 = var_352_0.localEulerAngles

				var_352_7.z = 0
				var_352_7.x = 0
				var_352_0.localEulerAngles = var_352_7
			end

			if arg_349_1.time_ >= var_352_1 + var_352_3 and arg_349_1.time_ < var_352_1 + var_352_3 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_352_8 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_8.x, var_352_8.y, var_352_8.z)

				local var_352_9 = var_352_0.localEulerAngles

				var_352_9.z = 0
				var_352_9.x = 0
				var_352_0.localEulerAngles = var_352_9
			end

			local var_352_10 = arg_349_1.actors_["1028ui_story"]
			local var_352_11 = 0

			if var_352_11 < arg_349_1.time_ and arg_349_1.time_ <= var_352_11 + arg_352_0 and arg_349_1.var_.characterEffect1028ui_story == nil then
				arg_349_1.var_.characterEffect1028ui_story = var_352_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_12 = 0.133333333333333

			if var_352_11 <= arg_349_1.time_ and arg_349_1.time_ < var_352_11 + var_352_12 then
				local var_352_13 = (arg_349_1.time_ - var_352_11) / var_352_12

				if arg_349_1.var_.characterEffect1028ui_story then
					arg_349_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_11 + var_352_12 and arg_349_1.time_ < var_352_11 + var_352_12 + arg_352_0 and arg_349_1.var_.characterEffect1028ui_story then
				arg_349_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_352_14 = 0

			if var_352_14 < arg_349_1.time_ and arg_349_1.time_ <= var_352_14 + arg_352_0 then
				arg_349_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_352_15 = 0

			if var_352_15 < arg_349_1.time_ and arg_349_1.time_ <= var_352_15 + arg_352_0 then
				arg_349_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_352_16 = 0
			local var_352_17 = 0.575

			if var_352_16 < arg_349_1.time_ and arg_349_1.time_ <= var_352_16 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_18 = arg_349_1:FormatText(StoryNameCfg[327].name)

				arg_349_1.leftNameTxt_.text = var_352_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_19 = arg_349_1:GetWordFromCfg(102804085)
				local var_352_20 = arg_349_1:FormatText(var_352_19.content)

				arg_349_1.text_.text = var_352_20

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_21 = 23
				local var_352_22 = utf8.len(var_352_20)
				local var_352_23 = var_352_21 <= 0 and var_352_17 or var_352_17 * (var_352_22 / var_352_21)

				if var_352_23 > 0 and var_352_17 < var_352_23 then
					arg_349_1.talkMaxDuration = var_352_23

					if var_352_23 + var_352_16 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_23 + var_352_16
					end
				end

				arg_349_1.text_.text = var_352_20
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804085", "story_v_side_old_102804.awb") ~= 0 then
					local var_352_24 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804085", "story_v_side_old_102804.awb") / 1000

					if var_352_24 + var_352_16 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_24 + var_352_16
					end

					if var_352_19.prefab_name ~= "" and arg_349_1.actors_[var_352_19.prefab_name] ~= nil then
						local var_352_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_19.prefab_name].transform, "story_v_side_old_102804", "102804085", "story_v_side_old_102804.awb")

						arg_349_1:RecordAudio("102804085", var_352_25)
						arg_349_1:RecordAudio("102804085", var_352_25)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804085", "story_v_side_old_102804.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804085", "story_v_side_old_102804.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_26 = math.max(var_352_17, arg_349_1.talkMaxDuration)

			if var_352_16 <= arg_349_1.time_ and arg_349_1.time_ < var_352_16 + var_352_26 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_16) / var_352_26

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_16 + var_352_26 and arg_349_1.time_ < var_352_16 + var_352_26 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play102804086 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 102804086
		arg_353_1.duration_ = 6.366

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play102804087(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_356_1 = 0
			local var_356_2 = 0.525

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_3 = arg_353_1:FormatText(StoryNameCfg[327].name)

				arg_353_1.leftNameTxt_.text = var_356_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_4 = arg_353_1:GetWordFromCfg(102804086)
				local var_356_5 = arg_353_1:FormatText(var_356_4.content)

				arg_353_1.text_.text = var_356_5

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_6 = 21
				local var_356_7 = utf8.len(var_356_5)
				local var_356_8 = var_356_6 <= 0 and var_356_2 or var_356_2 * (var_356_7 / var_356_6)

				if var_356_8 > 0 and var_356_2 < var_356_8 then
					arg_353_1.talkMaxDuration = var_356_8

					if var_356_8 + var_356_1 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_1
					end
				end

				arg_353_1.text_.text = var_356_5
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804086", "story_v_side_old_102804.awb") ~= 0 then
					local var_356_9 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804086", "story_v_side_old_102804.awb") / 1000

					if var_356_9 + var_356_1 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_9 + var_356_1
					end

					if var_356_4.prefab_name ~= "" and arg_353_1.actors_[var_356_4.prefab_name] ~= nil then
						local var_356_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_4.prefab_name].transform, "story_v_side_old_102804", "102804086", "story_v_side_old_102804.awb")

						arg_353_1:RecordAudio("102804086", var_356_10)
						arg_353_1:RecordAudio("102804086", var_356_10)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804086", "story_v_side_old_102804.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804086", "story_v_side_old_102804.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_11 = math.max(var_356_2, arg_353_1.talkMaxDuration)

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_11 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_1) / var_356_11

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_1 + var_356_11 and arg_353_1.time_ < var_356_1 + var_356_11 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play102804087 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 102804087
		arg_357_1.duration_ = 5

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play102804088(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["1028ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect1028ui_story == nil then
				arg_357_1.var_.characterEffect1028ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.133333333333333

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect1028ui_story then
					local var_360_4 = Mathf.Lerp(0, 0.5, var_360_3)

					arg_357_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_357_1.var_.characterEffect1028ui_story.fillRatio = var_360_4
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect1028ui_story then
				local var_360_5 = 0.5

				arg_357_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_357_1.var_.characterEffect1028ui_story.fillRatio = var_360_5
			end

			local var_360_6 = 0
			local var_360_7 = 1.425

			if var_360_6 < arg_357_1.time_ and arg_357_1.time_ <= var_360_6 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_8 = arg_357_1:FormatText(StoryNameCfg[7].name)

				arg_357_1.leftNameTxt_.text = var_360_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_9 = arg_357_1:GetWordFromCfg(102804087)
				local var_360_10 = arg_357_1:FormatText(var_360_9.content)

				arg_357_1.text_.text = var_360_10

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_11 = 57
				local var_360_12 = utf8.len(var_360_10)
				local var_360_13 = var_360_11 <= 0 and var_360_7 or var_360_7 * (var_360_12 / var_360_11)

				if var_360_13 > 0 and var_360_7 < var_360_13 then
					arg_357_1.talkMaxDuration = var_360_13

					if var_360_13 + var_360_6 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_13 + var_360_6
					end
				end

				arg_357_1.text_.text = var_360_10
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)
				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_14 = math.max(var_360_7, arg_357_1.talkMaxDuration)

			if var_360_6 <= arg_357_1.time_ and arg_357_1.time_ < var_360_6 + var_360_14 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_6) / var_360_14

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_6 + var_360_14 and arg_357_1.time_ < var_360_6 + var_360_14 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play102804088 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 102804088
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play102804089(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.55

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_2 = arg_361_1:FormatText(StoryNameCfg[7].name)

				arg_361_1.leftNameTxt_.text = var_364_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_3 = arg_361_1:GetWordFromCfg(102804088)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 22
				local var_364_6 = utf8.len(var_364_4)
				local var_364_7 = var_364_5 <= 0 and var_364_1 or var_364_1 * (var_364_6 / var_364_5)

				if var_364_7 > 0 and var_364_1 < var_364_7 then
					arg_361_1.talkMaxDuration = var_364_7

					if var_364_7 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_7 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_4
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_8 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_8 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_8

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_8 and arg_361_1.time_ < var_364_0 + var_364_8 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play102804089 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 102804089
		arg_365_1.duration_ = 9.966

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play102804090(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1028ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect1028ui_story == nil then
				arg_365_1.var_.characterEffect1028ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.133333333333333

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect1028ui_story then
					arg_365_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect1028ui_story then
				arg_365_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_368_4 = 0

			if var_368_4 < arg_365_1.time_ and arg_365_1.time_ <= var_368_4 + arg_368_0 then
				arg_365_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_368_5 = 0
			local var_368_6 = 0.775

			if var_368_5 < arg_365_1.time_ and arg_365_1.time_ <= var_368_5 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_7 = arg_365_1:FormatText(StoryNameCfg[327].name)

				arg_365_1.leftNameTxt_.text = var_368_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_8 = arg_365_1:GetWordFromCfg(102804089)
				local var_368_9 = arg_365_1:FormatText(var_368_8.content)

				arg_365_1.text_.text = var_368_9

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_10 = 31
				local var_368_11 = utf8.len(var_368_9)
				local var_368_12 = var_368_10 <= 0 and var_368_6 or var_368_6 * (var_368_11 / var_368_10)

				if var_368_12 > 0 and var_368_6 < var_368_12 then
					arg_365_1.talkMaxDuration = var_368_12

					if var_368_12 + var_368_5 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_12 + var_368_5
					end
				end

				arg_365_1.text_.text = var_368_9
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804089", "story_v_side_old_102804.awb") ~= 0 then
					local var_368_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804089", "story_v_side_old_102804.awb") / 1000

					if var_368_13 + var_368_5 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_13 + var_368_5
					end

					if var_368_8.prefab_name ~= "" and arg_365_1.actors_[var_368_8.prefab_name] ~= nil then
						local var_368_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_8.prefab_name].transform, "story_v_side_old_102804", "102804089", "story_v_side_old_102804.awb")

						arg_365_1:RecordAudio("102804089", var_368_14)
						arg_365_1:RecordAudio("102804089", var_368_14)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804089", "story_v_side_old_102804.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804089", "story_v_side_old_102804.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_15 = math.max(var_368_6, arg_365_1.talkMaxDuration)

			if var_368_5 <= arg_365_1.time_ and arg_365_1.time_ < var_368_5 + var_368_15 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_5) / var_368_15

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_5 + var_368_15 and arg_365_1.time_ < var_368_5 + var_368_15 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play102804090 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 102804090
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play102804091(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["1028ui_story"]
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 and arg_369_1.var_.characterEffect1028ui_story == nil then
				arg_369_1.var_.characterEffect1028ui_story = var_372_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_2 = 0.133333333333333

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2

				if arg_369_1.var_.characterEffect1028ui_story then
					local var_372_4 = Mathf.Lerp(0, 0.5, var_372_3)

					arg_369_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_369_1.var_.characterEffect1028ui_story.fillRatio = var_372_4
				end
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 and arg_369_1.var_.characterEffect1028ui_story then
				local var_372_5 = 0.5

				arg_369_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_369_1.var_.characterEffect1028ui_story.fillRatio = var_372_5
			end

			local var_372_6 = 0
			local var_372_7 = 0.5

			if var_372_6 < arg_369_1.time_ and arg_369_1.time_ <= var_372_6 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_8 = arg_369_1:FormatText(StoryNameCfg[7].name)

				arg_369_1.leftNameTxt_.text = var_372_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_9 = arg_369_1:GetWordFromCfg(102804090)
				local var_372_10 = arg_369_1:FormatText(var_372_9.content)

				arg_369_1.text_.text = var_372_10

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_11 = 20
				local var_372_12 = utf8.len(var_372_10)
				local var_372_13 = var_372_11 <= 0 and var_372_7 or var_372_7 * (var_372_12 / var_372_11)

				if var_372_13 > 0 and var_372_7 < var_372_13 then
					arg_369_1.talkMaxDuration = var_372_13

					if var_372_13 + var_372_6 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_13 + var_372_6
					end
				end

				arg_369_1.text_.text = var_372_10
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_14 = math.max(var_372_7, arg_369_1.talkMaxDuration)

			if var_372_6 <= arg_369_1.time_ and arg_369_1.time_ < var_372_6 + var_372_14 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_6) / var_372_14

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_6 + var_372_14 and arg_369_1.time_ < var_372_6 + var_372_14 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play102804091 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 102804091
		arg_373_1.duration_ = 1.999999999999

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play102804092(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1028ui_story"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.characterEffect1028ui_story == nil then
				arg_373_1.var_.characterEffect1028ui_story = var_376_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_2 = 0.133333333333333

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.characterEffect1028ui_story then
					arg_373_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.characterEffect1028ui_story then
				arg_373_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_376_4 = 0

			if var_376_4 < arg_373_1.time_ and arg_373_1.time_ <= var_376_4 + arg_376_0 then
				arg_373_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_376_5 = 0
			local var_376_6 = 0.05

			if var_376_5 < arg_373_1.time_ and arg_373_1.time_ <= var_376_5 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_7 = arg_373_1:FormatText(StoryNameCfg[327].name)

				arg_373_1.leftNameTxt_.text = var_376_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_8 = arg_373_1:GetWordFromCfg(102804091)
				local var_376_9 = arg_373_1:FormatText(var_376_8.content)

				arg_373_1.text_.text = var_376_9

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_10 = 2
				local var_376_11 = utf8.len(var_376_9)
				local var_376_12 = var_376_10 <= 0 and var_376_6 or var_376_6 * (var_376_11 / var_376_10)

				if var_376_12 > 0 and var_376_6 < var_376_12 then
					arg_373_1.talkMaxDuration = var_376_12

					if var_376_12 + var_376_5 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_12 + var_376_5
					end
				end

				arg_373_1.text_.text = var_376_9
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804091", "story_v_side_old_102804.awb") ~= 0 then
					local var_376_13 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804091", "story_v_side_old_102804.awb") / 1000

					if var_376_13 + var_376_5 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_13 + var_376_5
					end

					if var_376_8.prefab_name ~= "" and arg_373_1.actors_[var_376_8.prefab_name] ~= nil then
						local var_376_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_8.prefab_name].transform, "story_v_side_old_102804", "102804091", "story_v_side_old_102804.awb")

						arg_373_1:RecordAudio("102804091", var_376_14)
						arg_373_1:RecordAudio("102804091", var_376_14)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804091", "story_v_side_old_102804.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804091", "story_v_side_old_102804.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_15 = math.max(var_376_6, arg_373_1.talkMaxDuration)

			if var_376_5 <= arg_373_1.time_ and arg_373_1.time_ < var_376_5 + var_376_15 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_5) / var_376_15

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_5 + var_376_15 and arg_373_1.time_ < var_376_5 + var_376_15 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play102804092 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 102804092
		arg_377_1.duration_ = 5.166

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play102804093(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_380_2 = 0
			local var_380_3 = 0.7

			if var_380_2 < arg_377_1.time_ and arg_377_1.time_ <= var_380_2 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_4 = arg_377_1:FormatText(StoryNameCfg[327].name)

				arg_377_1.leftNameTxt_.text = var_380_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_5 = arg_377_1:GetWordFromCfg(102804092)
				local var_380_6 = arg_377_1:FormatText(var_380_5.content)

				arg_377_1.text_.text = var_380_6

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_7 = 28
				local var_380_8 = utf8.len(var_380_6)
				local var_380_9 = var_380_7 <= 0 and var_380_3 or var_380_3 * (var_380_8 / var_380_7)

				if var_380_9 > 0 and var_380_3 < var_380_9 then
					arg_377_1.talkMaxDuration = var_380_9

					if var_380_9 + var_380_2 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_9 + var_380_2
					end
				end

				arg_377_1.text_.text = var_380_6
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804092", "story_v_side_old_102804.awb") ~= 0 then
					local var_380_10 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804092", "story_v_side_old_102804.awb") / 1000

					if var_380_10 + var_380_2 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_10 + var_380_2
					end

					if var_380_5.prefab_name ~= "" and arg_377_1.actors_[var_380_5.prefab_name] ~= nil then
						local var_380_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_5.prefab_name].transform, "story_v_side_old_102804", "102804092", "story_v_side_old_102804.awb")

						arg_377_1:RecordAudio("102804092", var_380_11)
						arg_377_1:RecordAudio("102804092", var_380_11)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804092", "story_v_side_old_102804.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804092", "story_v_side_old_102804.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_12 = math.max(var_380_3, arg_377_1.talkMaxDuration)

			if var_380_2 <= arg_377_1.time_ and arg_377_1.time_ < var_380_2 + var_380_12 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_2) / var_380_12

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_2 + var_380_12 and arg_377_1.time_ < var_380_2 + var_380_12 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play102804093 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 102804093
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play102804094(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["1028ui_story"]
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 and arg_381_1.var_.characterEffect1028ui_story == nil then
				arg_381_1.var_.characterEffect1028ui_story = var_384_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_2 = 0.133333333333333

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2

				if arg_381_1.var_.characterEffect1028ui_story then
					local var_384_4 = Mathf.Lerp(0, 0.5, var_384_3)

					arg_381_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_381_1.var_.characterEffect1028ui_story.fillRatio = var_384_4
				end
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 and arg_381_1.var_.characterEffect1028ui_story then
				local var_384_5 = 0.5

				arg_381_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_381_1.var_.characterEffect1028ui_story.fillRatio = var_384_5
			end

			local var_384_6 = 0
			local var_384_7 = 0.65

			if var_384_6 < arg_381_1.time_ and arg_381_1.time_ <= var_384_6 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, false)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_8 = arg_381_1:GetWordFromCfg(102804093)
				local var_384_9 = arg_381_1:FormatText(var_384_8.content)

				arg_381_1.text_.text = var_384_9

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_10 = 26
				local var_384_11 = utf8.len(var_384_9)
				local var_384_12 = var_384_10 <= 0 and var_384_7 or var_384_7 * (var_384_11 / var_384_10)

				if var_384_12 > 0 and var_384_7 < var_384_12 then
					arg_381_1.talkMaxDuration = var_384_12

					if var_384_12 + var_384_6 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_12 + var_384_6
					end
				end

				arg_381_1.text_.text = var_384_9
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_13 = math.max(var_384_7, arg_381_1.talkMaxDuration)

			if var_384_6 <= arg_381_1.time_ and arg_381_1.time_ < var_384_6 + var_384_13 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_6) / var_384_13

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_6 + var_384_13 and arg_381_1.time_ < var_384_6 + var_384_13 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play102804094 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 102804094
		arg_385_1.duration_ = 9

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play102804095(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = "H02"

			if arg_385_1.bgs_[var_388_0] == nil then
				local var_388_1 = Object.Instantiate(arg_385_1.paintGo_)

				var_388_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_388_0)
				var_388_1.name = var_388_0
				var_388_1.transform.parent = arg_385_1.stage_.transform
				var_388_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_385_1.bgs_[var_388_0] = var_388_1
			end

			local var_388_2 = 1.96666666666667

			if var_388_2 < arg_385_1.time_ and arg_385_1.time_ <= var_388_2 + arg_388_0 then
				local var_388_3 = manager.ui.mainCamera.transform.localPosition
				local var_388_4 = Vector3.New(0, 0, 10) + Vector3.New(var_388_3.x, var_388_3.y, 0)
				local var_388_5 = arg_385_1.bgs_.H02

				var_388_5.transform.localPosition = var_388_4
				var_388_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_388_6 = var_388_5:GetComponent("SpriteRenderer")

				if var_388_6 and var_388_6.sprite then
					local var_388_7 = (var_388_5.transform.localPosition - var_388_3).z
					local var_388_8 = manager.ui.mainCameraCom_
					local var_388_9 = 2 * var_388_7 * Mathf.Tan(var_388_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_388_10 = var_388_9 * var_388_8.aspect
					local var_388_11 = var_388_6.sprite.bounds.size.x
					local var_388_12 = var_388_6.sprite.bounds.size.y
					local var_388_13 = var_388_10 / var_388_11
					local var_388_14 = var_388_9 / var_388_12
					local var_388_15 = var_388_14 < var_388_13 and var_388_13 or var_388_14

					var_388_5.transform.localScale = Vector3.New(var_388_15, var_388_15, 0)
				end

				for iter_388_0, iter_388_1 in pairs(arg_385_1.bgs_) do
					if iter_388_0 ~= "H02" then
						iter_388_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_388_16 = 0

			if var_388_16 < arg_385_1.time_ and arg_385_1.time_ <= var_388_16 + arg_388_0 then
				arg_385_1.mask_.enabled = true
				arg_385_1.mask_.raycastTarget = true

				arg_385_1:SetGaussion(false)
			end

			local var_388_17 = 2

			if var_388_16 <= arg_385_1.time_ and arg_385_1.time_ < var_388_16 + var_388_17 then
				local var_388_18 = (arg_385_1.time_ - var_388_16) / var_388_17
				local var_388_19 = Color.New(1, 1, 1)

				var_388_19.a = Mathf.Lerp(0, 1, var_388_18)
				arg_385_1.mask_.color = var_388_19
			end

			if arg_385_1.time_ >= var_388_16 + var_388_17 and arg_385_1.time_ < var_388_16 + var_388_17 + arg_388_0 then
				local var_388_20 = Color.New(1, 1, 1)

				var_388_20.a = 1
				arg_385_1.mask_.color = var_388_20
			end

			local var_388_21 = 2

			if var_388_21 < arg_385_1.time_ and arg_385_1.time_ <= var_388_21 + arg_388_0 then
				arg_385_1.mask_.enabled = true
				arg_385_1.mask_.raycastTarget = true

				arg_385_1:SetGaussion(false)
			end

			local var_388_22 = 2

			if var_388_21 <= arg_385_1.time_ and arg_385_1.time_ < var_388_21 + var_388_22 then
				local var_388_23 = (arg_385_1.time_ - var_388_21) / var_388_22
				local var_388_24 = Color.New(1, 1, 1)

				var_388_24.a = Mathf.Lerp(1, 0, var_388_23)
				arg_385_1.mask_.color = var_388_24
			end

			if arg_385_1.time_ >= var_388_21 + var_388_22 and arg_385_1.time_ < var_388_21 + var_388_22 + arg_388_0 then
				local var_388_25 = Color.New(1, 1, 1)
				local var_388_26 = 0

				arg_385_1.mask_.enabled = false
				var_388_25.a = var_388_26
				arg_385_1.mask_.color = var_388_25
			end

			local var_388_27 = arg_385_1.actors_["1028ui_story"].transform
			local var_388_28 = 1.93266666666667

			if var_388_28 < arg_385_1.time_ and arg_385_1.time_ <= var_388_28 + arg_388_0 then
				arg_385_1.var_.moveOldPos1028ui_story = var_388_27.localPosition

				local var_388_29 = "1028ui_story"

				arg_385_1:ShowWeapon(arg_385_1.var_[var_388_29 .. "Animator"].transform, false)
			end

			local var_388_30 = 0.001

			if var_388_28 <= arg_385_1.time_ and arg_385_1.time_ < var_388_28 + var_388_30 then
				local var_388_31 = (arg_385_1.time_ - var_388_28) / var_388_30
				local var_388_32 = Vector3.New(0, 100, 0)

				var_388_27.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1028ui_story, var_388_32, var_388_31)

				local var_388_33 = manager.ui.mainCamera.transform.position - var_388_27.position

				var_388_27.forward = Vector3.New(var_388_33.x, var_388_33.y, var_388_33.z)

				local var_388_34 = var_388_27.localEulerAngles

				var_388_34.z = 0
				var_388_34.x = 0
				var_388_27.localEulerAngles = var_388_34
			end

			if arg_385_1.time_ >= var_388_28 + var_388_30 and arg_385_1.time_ < var_388_28 + var_388_30 + arg_388_0 then
				var_388_27.localPosition = Vector3.New(0, 100, 0)

				local var_388_35 = manager.ui.mainCamera.transform.position - var_388_27.position

				var_388_27.forward = Vector3.New(var_388_35.x, var_388_35.y, var_388_35.z)

				local var_388_36 = var_388_27.localEulerAngles

				var_388_36.z = 0
				var_388_36.x = 0
				var_388_27.localEulerAngles = var_388_36
			end

			local var_388_37 = arg_385_1.actors_["1028ui_story"].transform
			local var_388_38 = 4

			if var_388_38 < arg_385_1.time_ and arg_385_1.time_ <= var_388_38 + arg_388_0 then
				arg_385_1.var_.moveOldPos1028ui_story = var_388_37.localPosition

				local var_388_39 = "1028ui_story"

				arg_385_1:ShowWeapon(arg_385_1.var_[var_388_39 .. "Animator"].transform, false)
			end

			local var_388_40 = 0.001

			if var_388_38 <= arg_385_1.time_ and arg_385_1.time_ < var_388_38 + var_388_40 then
				local var_388_41 = (arg_385_1.time_ - var_388_38) / var_388_40
				local var_388_42 = Vector3.New(0, -0.9, -5.9)

				var_388_37.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1028ui_story, var_388_42, var_388_41)

				local var_388_43 = manager.ui.mainCamera.transform.position - var_388_37.position

				var_388_37.forward = Vector3.New(var_388_43.x, var_388_43.y, var_388_43.z)

				local var_388_44 = var_388_37.localEulerAngles

				var_388_44.z = 0
				var_388_44.x = 0
				var_388_37.localEulerAngles = var_388_44
			end

			if arg_385_1.time_ >= var_388_38 + var_388_40 and arg_385_1.time_ < var_388_38 + var_388_40 + arg_388_0 then
				var_388_37.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_388_45 = manager.ui.mainCamera.transform.position - var_388_37.position

				var_388_37.forward = Vector3.New(var_388_45.x, var_388_45.y, var_388_45.z)

				local var_388_46 = var_388_37.localEulerAngles

				var_388_46.z = 0
				var_388_46.x = 0
				var_388_37.localEulerAngles = var_388_46
			end

			local var_388_47 = 4

			if var_388_47 < arg_385_1.time_ and arg_385_1.time_ <= var_388_47 + arg_388_0 then
				arg_385_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			if arg_385_1.frameCnt_ <= 1 then
				arg_385_1.dialog_:SetActive(false)
			end

			local var_388_48 = 4
			local var_388_49 = 0.475

			if var_388_48 < arg_385_1.time_ and arg_385_1.time_ <= var_388_48 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0

				arg_385_1.dialog_:SetActive(true)

				local var_388_50 = LeanTween.value(arg_385_1.dialog_, 0, 1, 0.3)

				var_388_50:setOnUpdate(LuaHelper.FloatAction(function(arg_389_0)
					arg_385_1.dialogCg_.alpha = arg_389_0
				end))
				var_388_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_385_1.dialog_)
					var_388_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_385_1.duration_ = arg_385_1.duration_ + 0.3

				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_51 = arg_385_1:GetWordFromCfg(102804094)
				local var_388_52 = arg_385_1:FormatText(var_388_51.content)

				arg_385_1.text_.text = var_388_52

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_53 = 19
				local var_388_54 = utf8.len(var_388_52)
				local var_388_55 = var_388_53 <= 0 and var_388_49 or var_388_49 * (var_388_54 / var_388_53)

				if var_388_55 > 0 and var_388_49 < var_388_55 then
					arg_385_1.talkMaxDuration = var_388_55
					var_388_48 = var_388_48 + 0.3

					if var_388_55 + var_388_48 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_55 + var_388_48
					end
				end

				arg_385_1.text_.text = var_388_52
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_56 = var_388_48 + 0.3
			local var_388_57 = math.max(var_388_49, arg_385_1.talkMaxDuration)

			if var_388_56 <= arg_385_1.time_ and arg_385_1.time_ < var_388_56 + var_388_57 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_56) / var_388_57

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_56 + var_388_57 and arg_385_1.time_ < var_388_56 + var_388_57 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play102804095 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 102804095
		arg_391_1.duration_ = 8.133

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play102804096(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = "1148ui_story"

			if arg_391_1.actors_[var_394_0] == nil then
				local var_394_1 = Object.Instantiate(Asset.Load("Char/" .. var_394_0), arg_391_1.stage_.transform)

				var_394_1.name = var_394_0
				var_394_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_391_1.actors_[var_394_0] = var_394_1

				local var_394_2 = var_394_1:GetComponentInChildren(typeof(CharacterEffect))

				var_394_2.enabled = true

				local var_394_3 = GameObjectTools.GetOrAddComponent(var_394_1, typeof(DynamicBoneHelper))

				if var_394_3 then
					var_394_3:EnableDynamicBone(false)
				end

				arg_391_1:ShowWeapon(var_394_2.transform, false)

				arg_391_1.var_[var_394_0 .. "Animator"] = var_394_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_391_1.var_[var_394_0 .. "Animator"].applyRootMotion = true
				arg_391_1.var_[var_394_0 .. "LipSync"] = var_394_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_394_4 = arg_391_1.actors_["1148ui_story"].transform
			local var_394_5 = 0

			if var_394_5 < arg_391_1.time_ and arg_391_1.time_ <= var_394_5 + arg_394_0 then
				arg_391_1.var_.moveOldPos1148ui_story = var_394_4.localPosition

				local var_394_6 = "1148ui_story"

				arg_391_1:ShowWeapon(arg_391_1.var_[var_394_6 .. "Animator"].transform, false)
			end

			local var_394_7 = 0.001

			if var_394_5 <= arg_391_1.time_ and arg_391_1.time_ < var_394_5 + var_394_7 then
				local var_394_8 = (arg_391_1.time_ - var_394_5) / var_394_7
				local var_394_9 = Vector3.New(-0.7, -0.8, -6.2)

				var_394_4.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1148ui_story, var_394_9, var_394_8)

				local var_394_10 = manager.ui.mainCamera.transform.position - var_394_4.position

				var_394_4.forward = Vector3.New(var_394_10.x, var_394_10.y, var_394_10.z)

				local var_394_11 = var_394_4.localEulerAngles

				var_394_11.z = 0
				var_394_11.x = 0
				var_394_4.localEulerAngles = var_394_11
			end

			if arg_391_1.time_ >= var_394_5 + var_394_7 and arg_391_1.time_ < var_394_5 + var_394_7 + arg_394_0 then
				var_394_4.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_394_12 = manager.ui.mainCamera.transform.position - var_394_4.position

				var_394_4.forward = Vector3.New(var_394_12.x, var_394_12.y, var_394_12.z)

				local var_394_13 = var_394_4.localEulerAngles

				var_394_13.z = 0
				var_394_13.x = 0
				var_394_4.localEulerAngles = var_394_13
			end

			local var_394_14 = "1059ui_story"

			if arg_391_1.actors_[var_394_14] == nil then
				local var_394_15 = Object.Instantiate(Asset.Load("Char/" .. var_394_14), arg_391_1.stage_.transform)

				var_394_15.name = var_394_14
				var_394_15.transform.localPosition = Vector3.New(0, 100, 0)
				arg_391_1.actors_[var_394_14] = var_394_15

				local var_394_16 = var_394_15:GetComponentInChildren(typeof(CharacterEffect))

				var_394_16.enabled = true

				local var_394_17 = GameObjectTools.GetOrAddComponent(var_394_15, typeof(DynamicBoneHelper))

				if var_394_17 then
					var_394_17:EnableDynamicBone(false)
				end

				arg_391_1:ShowWeapon(var_394_16.transform, false)

				arg_391_1.var_[var_394_14 .. "Animator"] = var_394_16.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_391_1.var_[var_394_14 .. "Animator"].applyRootMotion = true
				arg_391_1.var_[var_394_14 .. "LipSync"] = var_394_16.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_394_18 = arg_391_1.actors_["1059ui_story"].transform
			local var_394_19 = 0

			if var_394_19 < arg_391_1.time_ and arg_391_1.time_ <= var_394_19 + arg_394_0 then
				arg_391_1.var_.moveOldPos1059ui_story = var_394_18.localPosition

				local var_394_20 = "1059ui_story"

				arg_391_1:ShowWeapon(arg_391_1.var_[var_394_20 .. "Animator"].transform, false)
			end

			local var_394_21 = 0.001

			if var_394_19 <= arg_391_1.time_ and arg_391_1.time_ < var_394_19 + var_394_21 then
				local var_394_22 = (arg_391_1.time_ - var_394_19) / var_394_21
				local var_394_23 = Vector3.New(0.7, -1.05, -6)

				var_394_18.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1059ui_story, var_394_23, var_394_22)

				local var_394_24 = manager.ui.mainCamera.transform.position - var_394_18.position

				var_394_18.forward = Vector3.New(var_394_24.x, var_394_24.y, var_394_24.z)

				local var_394_25 = var_394_18.localEulerAngles

				var_394_25.z = 0
				var_394_25.x = 0
				var_394_18.localEulerAngles = var_394_25
			end

			if arg_391_1.time_ >= var_394_19 + var_394_21 and arg_391_1.time_ < var_394_19 + var_394_21 + arg_394_0 then
				var_394_18.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_394_26 = manager.ui.mainCamera.transform.position - var_394_18.position

				var_394_18.forward = Vector3.New(var_394_26.x, var_394_26.y, var_394_26.z)

				local var_394_27 = var_394_18.localEulerAngles

				var_394_27.z = 0
				var_394_27.x = 0
				var_394_18.localEulerAngles = var_394_27
			end

			local var_394_28 = arg_391_1.actors_["1148ui_story"]
			local var_394_29 = 0

			if var_394_29 < arg_391_1.time_ and arg_391_1.time_ <= var_394_29 + arg_394_0 and arg_391_1.var_.characterEffect1148ui_story == nil then
				arg_391_1.var_.characterEffect1148ui_story = var_394_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_30 = 0.0333333333333333

			if var_394_29 <= arg_391_1.time_ and arg_391_1.time_ < var_394_29 + var_394_30 then
				local var_394_31 = (arg_391_1.time_ - var_394_29) / var_394_30

				if arg_391_1.var_.characterEffect1148ui_story then
					arg_391_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_391_1.time_ >= var_394_29 + var_394_30 and arg_391_1.time_ < var_394_29 + var_394_30 + arg_394_0 and arg_391_1.var_.characterEffect1148ui_story then
				arg_391_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_394_32 = 0

			if var_394_32 < arg_391_1.time_ and arg_391_1.time_ <= var_394_32 + arg_394_0 then
				arg_391_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action9_1")
			end

			local var_394_33 = 0

			if var_394_33 < arg_391_1.time_ and arg_391_1.time_ <= var_394_33 + arg_394_0 then
				arg_391_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_394_34 = 0

			if var_394_34 < arg_391_1.time_ and arg_391_1.time_ <= var_394_34 + arg_394_0 then
				arg_391_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_394_35 = 0
			local var_394_36 = 0.533333333333333

			if var_394_35 < arg_391_1.time_ and arg_391_1.time_ <= var_394_35 + arg_394_0 then
				local var_394_37 = "play"
				local var_394_38 = "music"

				arg_391_1:AudioAction(var_394_37, var_394_38, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_394_39 = 0.833333333333333
			local var_394_40 = 1

			if var_394_39 < arg_391_1.time_ and arg_391_1.time_ <= var_394_39 + arg_394_0 then
				local var_394_41 = "play"
				local var_394_42 = "music"

				arg_391_1:AudioAction(var_394_41, var_394_42, "bgm_side_daily05", "bgm_side_daily05", "bgm_side_daily05.awb")
			end

			local var_394_43 = 0
			local var_394_44 = 1

			if var_394_43 < arg_391_1.time_ and arg_391_1.time_ <= var_394_43 + arg_394_0 then
				local var_394_45 = "stop"
				local var_394_46 = "effect"

				arg_391_1:AudioAction(var_394_45, var_394_46, "se_story_side_1028", "se_story_1028_largewaveloop", "")
			end

			local var_394_47 = 0
			local var_394_48 = 1

			if var_394_47 < arg_391_1.time_ and arg_391_1.time_ <= var_394_47 + arg_394_0 then
				local var_394_49 = "play"
				local var_394_50 = "effect"

				arg_391_1:AudioAction(var_394_49, var_394_50, "se_story_activity_1_2_summer1", "se_story_activity_1_2_summer1_beachdayloop", "")
			end

			local var_394_51 = arg_391_1.actors_["1059ui_story"]
			local var_394_52 = 0

			if var_394_52 < arg_391_1.time_ and arg_391_1.time_ <= var_394_52 + arg_394_0 and arg_391_1.var_.characterEffect1059ui_story == nil then
				arg_391_1.var_.characterEffect1059ui_story = var_394_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_53 = 0.0166666666666667

			if var_394_52 <= arg_391_1.time_ and arg_391_1.time_ < var_394_52 + var_394_53 then
				local var_394_54 = (arg_391_1.time_ - var_394_52) / var_394_53

				if arg_391_1.var_.characterEffect1059ui_story then
					local var_394_55 = Mathf.Lerp(0, 0.5, var_394_54)

					arg_391_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_391_1.var_.characterEffect1059ui_story.fillRatio = var_394_55
				end
			end

			if arg_391_1.time_ >= var_394_52 + var_394_53 and arg_391_1.time_ < var_394_52 + var_394_53 + arg_394_0 and arg_391_1.var_.characterEffect1059ui_story then
				local var_394_56 = 0.5

				arg_391_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_391_1.var_.characterEffect1059ui_story.fillRatio = var_394_56
			end

			local var_394_57 = 0
			local var_394_58 = 0.8

			if var_394_57 < arg_391_1.time_ and arg_391_1.time_ <= var_394_57 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_59 = arg_391_1:FormatText(StoryNameCfg[8].name)

				arg_391_1.leftNameTxt_.text = var_394_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_60 = arg_391_1:GetWordFromCfg(102804095)
				local var_394_61 = arg_391_1:FormatText(var_394_60.content)

				arg_391_1.text_.text = var_394_61

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_62 = 35
				local var_394_63 = utf8.len(var_394_61)
				local var_394_64 = var_394_62 <= 0 and var_394_58 or var_394_58 * (var_394_63 / var_394_62)

				if var_394_64 > 0 and var_394_58 < var_394_64 then
					arg_391_1.talkMaxDuration = var_394_64

					if var_394_64 + var_394_57 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_64 + var_394_57
					end
				end

				arg_391_1.text_.text = var_394_61
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804095", "story_v_side_old_102804.awb") ~= 0 then
					local var_394_65 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804095", "story_v_side_old_102804.awb") / 1000

					if var_394_65 + var_394_57 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_65 + var_394_57
					end

					if var_394_60.prefab_name ~= "" and arg_391_1.actors_[var_394_60.prefab_name] ~= nil then
						local var_394_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_60.prefab_name].transform, "story_v_side_old_102804", "102804095", "story_v_side_old_102804.awb")

						arg_391_1:RecordAudio("102804095", var_394_66)
						arg_391_1:RecordAudio("102804095", var_394_66)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804095", "story_v_side_old_102804.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804095", "story_v_side_old_102804.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_67 = math.max(var_394_58, arg_391_1.talkMaxDuration)

			if var_394_57 <= arg_391_1.time_ and arg_391_1.time_ < var_394_57 + var_394_67 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_57) / var_394_67

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_57 + var_394_67 and arg_391_1.time_ < var_394_57 + var_394_67 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play102804096 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 102804096
		arg_395_1.duration_ = 9.566

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play102804097(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = 0

			if var_398_0 < arg_395_1.time_ and arg_395_1.time_ <= var_398_0 + arg_398_0 then
				arg_395_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action9_2")
			end

			local var_398_2 = 0
			local var_398_3 = 0.325

			if var_398_2 < arg_395_1.time_ and arg_395_1.time_ <= var_398_2 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_4 = arg_395_1:FormatText(StoryNameCfg[8].name)

				arg_395_1.leftNameTxt_.text = var_398_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_5 = arg_395_1:GetWordFromCfg(102804096)
				local var_398_6 = arg_395_1:FormatText(var_398_5.content)

				arg_395_1.text_.text = var_398_6

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_7 = 13
				local var_398_8 = utf8.len(var_398_6)
				local var_398_9 = var_398_7 <= 0 and var_398_3 or var_398_3 * (var_398_8 / var_398_7)

				if var_398_9 > 0 and var_398_3 < var_398_9 then
					arg_395_1.talkMaxDuration = var_398_9

					if var_398_9 + var_398_2 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_9 + var_398_2
					end
				end

				arg_395_1.text_.text = var_398_6
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804096", "story_v_side_old_102804.awb") ~= 0 then
					local var_398_10 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804096", "story_v_side_old_102804.awb") / 1000

					if var_398_10 + var_398_2 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_10 + var_398_2
					end

					if var_398_5.prefab_name ~= "" and arg_395_1.actors_[var_398_5.prefab_name] ~= nil then
						local var_398_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_5.prefab_name].transform, "story_v_side_old_102804", "102804096", "story_v_side_old_102804.awb")

						arg_395_1:RecordAudio("102804096", var_398_11)
						arg_395_1:RecordAudio("102804096", var_398_11)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804096", "story_v_side_old_102804.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804096", "story_v_side_old_102804.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_12 = math.max(var_398_3, arg_395_1.talkMaxDuration)

			if var_398_2 <= arg_395_1.time_ and arg_395_1.time_ < var_398_2 + var_398_12 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_2) / var_398_12

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_2 + var_398_12 and arg_395_1.time_ < var_398_2 + var_398_12 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play102804097 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 102804097
		arg_399_1.duration_ = 6.633

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play102804098(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1148ui_story"]
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 and arg_399_1.var_.characterEffect1148ui_story == nil then
				arg_399_1.var_.characterEffect1148ui_story = var_402_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_2 = 0.0333333333333333

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2

				if arg_399_1.var_.characterEffect1148ui_story then
					local var_402_4 = Mathf.Lerp(0, 0.5, var_402_3)

					arg_399_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_399_1.var_.characterEffect1148ui_story.fillRatio = var_402_4
				end
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 and arg_399_1.var_.characterEffect1148ui_story then
				local var_402_5 = 0.5

				arg_399_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_399_1.var_.characterEffect1148ui_story.fillRatio = var_402_5
			end

			local var_402_6 = arg_399_1.actors_["1059ui_story"]
			local var_402_7 = 0

			if var_402_7 < arg_399_1.time_ and arg_399_1.time_ <= var_402_7 + arg_402_0 and arg_399_1.var_.characterEffect1059ui_story == nil then
				arg_399_1.var_.characterEffect1059ui_story = var_402_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_8 = 0.0333333333333333

			if var_402_7 <= arg_399_1.time_ and arg_399_1.time_ < var_402_7 + var_402_8 then
				local var_402_9 = (arg_399_1.time_ - var_402_7) / var_402_8

				if arg_399_1.var_.characterEffect1059ui_story then
					arg_399_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_399_1.time_ >= var_402_7 + var_402_8 and arg_399_1.time_ < var_402_7 + var_402_8 + arg_402_0 and arg_399_1.var_.characterEffect1059ui_story then
				arg_399_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_402_10 = 0

			if var_402_10 < arg_399_1.time_ and arg_399_1.time_ <= var_402_10 + arg_402_0 then
				arg_399_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_402_11 = 0

			if var_402_11 < arg_399_1.time_ and arg_399_1.time_ <= var_402_11 + arg_402_0 then
				arg_399_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_402_12 = 0
			local var_402_13 = 0.7

			if var_402_12 < arg_399_1.time_ and arg_399_1.time_ <= var_402_12 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_14 = arg_399_1:FormatText(StoryNameCfg[28].name)

				arg_399_1.leftNameTxt_.text = var_402_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_15 = arg_399_1:GetWordFromCfg(102804097)
				local var_402_16 = arg_399_1:FormatText(var_402_15.content)

				arg_399_1.text_.text = var_402_16

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_17 = 28
				local var_402_18 = utf8.len(var_402_16)
				local var_402_19 = var_402_17 <= 0 and var_402_13 or var_402_13 * (var_402_18 / var_402_17)

				if var_402_19 > 0 and var_402_13 < var_402_19 then
					arg_399_1.talkMaxDuration = var_402_19

					if var_402_19 + var_402_12 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_19 + var_402_12
					end
				end

				arg_399_1.text_.text = var_402_16
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804097", "story_v_side_old_102804.awb") ~= 0 then
					local var_402_20 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804097", "story_v_side_old_102804.awb") / 1000

					if var_402_20 + var_402_12 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_20 + var_402_12
					end

					if var_402_15.prefab_name ~= "" and arg_399_1.actors_[var_402_15.prefab_name] ~= nil then
						local var_402_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_15.prefab_name].transform, "story_v_side_old_102804", "102804097", "story_v_side_old_102804.awb")

						arg_399_1:RecordAudio("102804097", var_402_21)
						arg_399_1:RecordAudio("102804097", var_402_21)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804097", "story_v_side_old_102804.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804097", "story_v_side_old_102804.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_22 = math.max(var_402_13, arg_399_1.talkMaxDuration)

			if var_402_12 <= arg_399_1.time_ and arg_399_1.time_ < var_402_12 + var_402_22 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_12) / var_402_22

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_12 + var_402_22 and arg_399_1.time_ < var_402_12 + var_402_22 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play102804098 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 102804098
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play102804099(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1059ui_story"]
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 and arg_403_1.var_.characterEffect1059ui_story == nil then
				arg_403_1.var_.characterEffect1059ui_story = var_406_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_2 = 0.0333333333333333

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2

				if arg_403_1.var_.characterEffect1059ui_story then
					local var_406_4 = Mathf.Lerp(0, 0.5, var_406_3)

					arg_403_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1059ui_story.fillRatio = var_406_4
				end
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 and arg_403_1.var_.characterEffect1059ui_story then
				local var_406_5 = 0.5

				arg_403_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1059ui_story.fillRatio = var_406_5
			end

			local var_406_6 = 0

			if var_406_6 < arg_403_1.time_ and arg_403_1.time_ <= var_406_6 + arg_406_0 then
				arg_403_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_406_7 = 0
			local var_406_8 = 0.766666666666667

			if var_406_7 < arg_403_1.time_ and arg_403_1.time_ <= var_406_7 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, false)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_9 = arg_403_1:GetWordFromCfg(102804098)
				local var_406_10 = arg_403_1:FormatText(var_406_9.content)

				arg_403_1.text_.text = var_406_10

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_11 = 44
				local var_406_12 = utf8.len(var_406_10)
				local var_406_13 = var_406_11 <= 0 and var_406_8 or var_406_8 * (var_406_12 / var_406_11)

				if var_406_13 > 0 and var_406_8 < var_406_13 then
					arg_403_1.talkMaxDuration = var_406_13

					if var_406_13 + var_406_7 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_13 + var_406_7
					end
				end

				arg_403_1.text_.text = var_406_10
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_14 = math.max(var_406_8, arg_403_1.talkMaxDuration)

			if var_406_7 <= arg_403_1.time_ and arg_403_1.time_ < var_406_7 + var_406_14 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_7) / var_406_14

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_7 + var_406_14 and arg_403_1.time_ < var_406_7 + var_406_14 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play102804099 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 102804099
		arg_407_1.duration_ = 5.766

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play102804100(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1028ui_story"]
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 and arg_407_1.var_.characterEffect1028ui_story == nil then
				arg_407_1.var_.characterEffect1028ui_story = var_410_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_2 = 0.0333333333333333

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2

				if arg_407_1.var_.characterEffect1028ui_story then
					arg_407_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 and arg_407_1.var_.characterEffect1028ui_story then
				arg_407_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_410_4 = 0

			if var_410_4 < arg_407_1.time_ and arg_407_1.time_ <= var_410_4 + arg_410_0 then
				arg_407_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_2")
			end

			local var_410_5 = 0

			if var_410_5 < arg_407_1.time_ and arg_407_1.time_ <= var_410_5 + arg_410_0 then
				arg_407_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_410_6 = 0
			local var_410_7 = 0.375

			if var_410_6 < arg_407_1.time_ and arg_407_1.time_ <= var_410_6 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_8 = arg_407_1:FormatText(StoryNameCfg[327].name)

				arg_407_1.leftNameTxt_.text = var_410_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_9 = arg_407_1:GetWordFromCfg(102804099)
				local var_410_10 = arg_407_1:FormatText(var_410_9.content)

				arg_407_1.text_.text = var_410_10

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_11 = 15
				local var_410_12 = utf8.len(var_410_10)
				local var_410_13 = var_410_11 <= 0 and var_410_7 or var_410_7 * (var_410_12 / var_410_11)

				if var_410_13 > 0 and var_410_7 < var_410_13 then
					arg_407_1.talkMaxDuration = var_410_13

					if var_410_13 + var_410_6 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_13 + var_410_6
					end
				end

				arg_407_1.text_.text = var_410_10
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804099", "story_v_side_old_102804.awb") ~= 0 then
					local var_410_14 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804099", "story_v_side_old_102804.awb") / 1000

					if var_410_14 + var_410_6 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_14 + var_410_6
					end

					if var_410_9.prefab_name ~= "" and arg_407_1.actors_[var_410_9.prefab_name] ~= nil then
						local var_410_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_9.prefab_name].transform, "story_v_side_old_102804", "102804099", "story_v_side_old_102804.awb")

						arg_407_1:RecordAudio("102804099", var_410_15)
						arg_407_1:RecordAudio("102804099", var_410_15)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804099", "story_v_side_old_102804.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804099", "story_v_side_old_102804.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_16 = math.max(var_410_7, arg_407_1.talkMaxDuration)

			if var_410_6 <= arg_407_1.time_ and arg_407_1.time_ < var_410_6 + var_410_16 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_6) / var_410_16

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_6 + var_410_16 and arg_407_1.time_ < var_410_6 + var_410_16 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play102804100 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 102804100
		arg_411_1.duration_ = 6.633

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play102804101(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_414_1 = 0
			local var_414_2 = 0.625

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_3 = arg_411_1:FormatText(StoryNameCfg[327].name)

				arg_411_1.leftNameTxt_.text = var_414_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_4 = arg_411_1:GetWordFromCfg(102804100)
				local var_414_5 = arg_411_1:FormatText(var_414_4.content)

				arg_411_1.text_.text = var_414_5

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_6 = 25
				local var_414_7 = utf8.len(var_414_5)
				local var_414_8 = var_414_6 <= 0 and var_414_2 or var_414_2 * (var_414_7 / var_414_6)

				if var_414_8 > 0 and var_414_2 < var_414_8 then
					arg_411_1.talkMaxDuration = var_414_8

					if var_414_8 + var_414_1 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_8 + var_414_1
					end
				end

				arg_411_1.text_.text = var_414_5
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804100", "story_v_side_old_102804.awb") ~= 0 then
					local var_414_9 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804100", "story_v_side_old_102804.awb") / 1000

					if var_414_9 + var_414_1 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_9 + var_414_1
					end

					if var_414_4.prefab_name ~= "" and arg_411_1.actors_[var_414_4.prefab_name] ~= nil then
						local var_414_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_4.prefab_name].transform, "story_v_side_old_102804", "102804100", "story_v_side_old_102804.awb")

						arg_411_1:RecordAudio("102804100", var_414_10)
						arg_411_1:RecordAudio("102804100", var_414_10)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804100", "story_v_side_old_102804.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804100", "story_v_side_old_102804.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_11 = math.max(var_414_2, arg_411_1.talkMaxDuration)

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_11 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_1) / var_414_11

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_1 + var_414_11 and arg_411_1.time_ < var_414_1 + var_414_11 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play102804101 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 102804101
		arg_415_1.duration_ = 5.166

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play102804102(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = 0

			if var_418_0 < arg_415_1.time_ and arg_415_1.time_ <= var_418_0 + arg_418_0 then
				arg_415_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_418_1 = 0
			local var_418_2 = 0.425

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_3 = arg_415_1:FormatText(StoryNameCfg[327].name)

				arg_415_1.leftNameTxt_.text = var_418_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_4 = arg_415_1:GetWordFromCfg(102804101)
				local var_418_5 = arg_415_1:FormatText(var_418_4.content)

				arg_415_1.text_.text = var_418_5

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_6 = 17
				local var_418_7 = utf8.len(var_418_5)
				local var_418_8 = var_418_6 <= 0 and var_418_2 or var_418_2 * (var_418_7 / var_418_6)

				if var_418_8 > 0 and var_418_2 < var_418_8 then
					arg_415_1.talkMaxDuration = var_418_8

					if var_418_8 + var_418_1 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_8 + var_418_1
					end
				end

				arg_415_1.text_.text = var_418_5
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804101", "story_v_side_old_102804.awb") ~= 0 then
					local var_418_9 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804101", "story_v_side_old_102804.awb") / 1000

					if var_418_9 + var_418_1 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_9 + var_418_1
					end

					if var_418_4.prefab_name ~= "" and arg_415_1.actors_[var_418_4.prefab_name] ~= nil then
						local var_418_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_415_1.actors_[var_418_4.prefab_name].transform, "story_v_side_old_102804", "102804101", "story_v_side_old_102804.awb")

						arg_415_1:RecordAudio("102804101", var_418_10)
						arg_415_1:RecordAudio("102804101", var_418_10)
					else
						arg_415_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804101", "story_v_side_old_102804.awb")
					end

					arg_415_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804101", "story_v_side_old_102804.awb")
				end

				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_11 = math.max(var_418_2, arg_415_1.talkMaxDuration)

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_11 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_1) / var_418_11

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_1 + var_418_11 and arg_415_1.time_ < var_418_1 + var_418_11 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play102804102 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 102804102
		arg_419_1.duration_ = 5

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play102804103(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1028ui_story"]
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 and arg_419_1.var_.characterEffect1028ui_story == nil then
				arg_419_1.var_.characterEffect1028ui_story = var_422_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_2 = 0.0333333333333333

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2

				if arg_419_1.var_.characterEffect1028ui_story then
					local var_422_4 = Mathf.Lerp(0, 0.5, var_422_3)

					arg_419_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_419_1.var_.characterEffect1028ui_story.fillRatio = var_422_4
				end
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 and arg_419_1.var_.characterEffect1028ui_story then
				local var_422_5 = 0.5

				arg_419_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_419_1.var_.characterEffect1028ui_story.fillRatio = var_422_5
			end

			local var_422_6 = 0
			local var_422_7 = 0.85

			if var_422_6 < arg_419_1.time_ and arg_419_1.time_ <= var_422_6 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, false)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_8 = arg_419_1:GetWordFromCfg(102804102)
				local var_422_9 = arg_419_1:FormatText(var_422_8.content)

				arg_419_1.text_.text = var_422_9

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_10 = 34
				local var_422_11 = utf8.len(var_422_9)
				local var_422_12 = var_422_10 <= 0 and var_422_7 or var_422_7 * (var_422_11 / var_422_10)

				if var_422_12 > 0 and var_422_7 < var_422_12 then
					arg_419_1.talkMaxDuration = var_422_12

					if var_422_12 + var_422_6 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_12 + var_422_6
					end
				end

				arg_419_1.text_.text = var_422_9
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)
				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_13 = math.max(var_422_7, arg_419_1.talkMaxDuration)

			if var_422_6 <= arg_419_1.time_ and arg_419_1.time_ < var_422_6 + var_422_13 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_6) / var_422_13

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_6 + var_422_13 and arg_419_1.time_ < var_422_6 + var_422_13 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play102804103 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 102804103
		arg_423_1.duration_ = 5

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play102804104(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0
			local var_426_1 = 1

			if var_426_0 < arg_423_1.time_ and arg_423_1.time_ <= var_426_0 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, false)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_2 = arg_423_1:GetWordFromCfg(102804103)
				local var_426_3 = arg_423_1:FormatText(var_426_2.content)

				arg_423_1.text_.text = var_426_3

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_4 = 40
				local var_426_5 = utf8.len(var_426_3)
				local var_426_6 = var_426_4 <= 0 and var_426_1 or var_426_1 * (var_426_5 / var_426_4)

				if var_426_6 > 0 and var_426_1 < var_426_6 then
					arg_423_1.talkMaxDuration = var_426_6

					if var_426_6 + var_426_0 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_6 + var_426_0
					end
				end

				arg_423_1.text_.text = var_426_3
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)
				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_7 = math.max(var_426_1, arg_423_1.talkMaxDuration)

			if var_426_0 <= arg_423_1.time_ and arg_423_1.time_ < var_426_0 + var_426_7 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_0) / var_426_7

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_0 + var_426_7 and arg_423_1.time_ < var_426_0 + var_426_7 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play102804104 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 102804104
		arg_427_1.duration_ = 4

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play102804105(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["1059ui_story"]
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 and arg_427_1.var_.characterEffect1059ui_story == nil then
				arg_427_1.var_.characterEffect1059ui_story = var_430_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_2 = 0.2

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2

				if arg_427_1.var_.characterEffect1059ui_story then
					arg_427_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 and arg_427_1.var_.characterEffect1059ui_story then
				arg_427_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_430_4 = 0

			if var_430_4 < arg_427_1.time_ and arg_427_1.time_ <= var_430_4 + arg_430_0 then
				arg_427_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_430_5 = 0

			if var_430_5 < arg_427_1.time_ and arg_427_1.time_ <= var_430_5 + arg_430_0 then
				arg_427_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_430_6 = 0
			local var_430_7 = 0.45

			if var_430_6 < arg_427_1.time_ and arg_427_1.time_ <= var_430_6 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_8 = arg_427_1:FormatText(StoryNameCfg[28].name)

				arg_427_1.leftNameTxt_.text = var_430_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_9 = arg_427_1:GetWordFromCfg(102804104)
				local var_430_10 = arg_427_1:FormatText(var_430_9.content)

				arg_427_1.text_.text = var_430_10

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_11 = 18
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

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804104", "story_v_side_old_102804.awb") ~= 0 then
					local var_430_14 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804104", "story_v_side_old_102804.awb") / 1000

					if var_430_14 + var_430_6 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_14 + var_430_6
					end

					if var_430_9.prefab_name ~= "" and arg_427_1.actors_[var_430_9.prefab_name] ~= nil then
						local var_430_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_9.prefab_name].transform, "story_v_side_old_102804", "102804104", "story_v_side_old_102804.awb")

						arg_427_1:RecordAudio("102804104", var_430_15)
						arg_427_1:RecordAudio("102804104", var_430_15)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804104", "story_v_side_old_102804.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804104", "story_v_side_old_102804.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_16 = math.max(var_430_7, arg_427_1.talkMaxDuration)

			if var_430_6 <= arg_427_1.time_ and arg_427_1.time_ < var_430_6 + var_430_16 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_6) / var_430_16

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_6 + var_430_16 and arg_427_1.time_ < var_430_6 + var_430_16 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play102804105 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 102804105
		arg_431_1.duration_ = 7.4

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play102804106(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1059ui_story"]
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 and arg_431_1.var_.characterEffect1059ui_story == nil then
				arg_431_1.var_.characterEffect1059ui_story = var_434_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_2 = 0.2

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2

				if arg_431_1.var_.characterEffect1059ui_story then
					local var_434_4 = Mathf.Lerp(0, 0.5, var_434_3)

					arg_431_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_431_1.var_.characterEffect1059ui_story.fillRatio = var_434_4
				end
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 and arg_431_1.var_.characterEffect1059ui_story then
				local var_434_5 = 0.5

				arg_431_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_431_1.var_.characterEffect1059ui_story.fillRatio = var_434_5
			end

			local var_434_6 = arg_431_1.actors_["1148ui_story"]
			local var_434_7 = 0

			if var_434_7 < arg_431_1.time_ and arg_431_1.time_ <= var_434_7 + arg_434_0 and arg_431_1.var_.characterEffect1148ui_story == nil then
				arg_431_1.var_.characterEffect1148ui_story = var_434_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_8 = 0.2

			if var_434_7 <= arg_431_1.time_ and arg_431_1.time_ < var_434_7 + var_434_8 then
				local var_434_9 = (arg_431_1.time_ - var_434_7) / var_434_8

				if arg_431_1.var_.characterEffect1148ui_story then
					arg_431_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_7 + var_434_8 and arg_431_1.time_ < var_434_7 + var_434_8 + arg_434_0 and arg_431_1.var_.characterEffect1148ui_story then
				arg_431_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_434_10 = 0

			if var_434_10 < arg_431_1.time_ and arg_431_1.time_ <= var_434_10 + arg_434_0 then
				arg_431_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action2_1")
			end

			local var_434_11 = 0

			if var_434_11 < arg_431_1.time_ and arg_431_1.time_ <= var_434_11 + arg_434_0 then
				arg_431_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_434_12 = 0

			if var_434_12 < arg_431_1.time_ and arg_431_1.time_ <= var_434_12 + arg_434_0 then
				arg_431_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_434_13 = 0
			local var_434_14 = 0.65

			if var_434_13 < arg_431_1.time_ and arg_431_1.time_ <= var_434_13 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_15 = arg_431_1:FormatText(StoryNameCfg[8].name)

				arg_431_1.leftNameTxt_.text = var_434_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_16 = arg_431_1:GetWordFromCfg(102804105)
				local var_434_17 = arg_431_1:FormatText(var_434_16.content)

				arg_431_1.text_.text = var_434_17

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_18 = 26
				local var_434_19 = utf8.len(var_434_17)
				local var_434_20 = var_434_18 <= 0 and var_434_14 or var_434_14 * (var_434_19 / var_434_18)

				if var_434_20 > 0 and var_434_14 < var_434_20 then
					arg_431_1.talkMaxDuration = var_434_20

					if var_434_20 + var_434_13 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_20 + var_434_13
					end
				end

				arg_431_1.text_.text = var_434_17
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804105", "story_v_side_old_102804.awb") ~= 0 then
					local var_434_21 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804105", "story_v_side_old_102804.awb") / 1000

					if var_434_21 + var_434_13 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_21 + var_434_13
					end

					if var_434_16.prefab_name ~= "" and arg_431_1.actors_[var_434_16.prefab_name] ~= nil then
						local var_434_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_16.prefab_name].transform, "story_v_side_old_102804", "102804105", "story_v_side_old_102804.awb")

						arg_431_1:RecordAudio("102804105", var_434_22)
						arg_431_1:RecordAudio("102804105", var_434_22)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804105", "story_v_side_old_102804.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804105", "story_v_side_old_102804.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_23 = math.max(var_434_14, arg_431_1.talkMaxDuration)

			if var_434_13 <= arg_431_1.time_ and arg_431_1.time_ < var_434_13 + var_434_23 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_13) / var_434_23

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_13 + var_434_23 and arg_431_1.time_ < var_434_13 + var_434_23 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play102804106 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 102804106
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play102804107(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action2_2")
			end

			local var_438_1 = 0
			local var_438_2 = 0.35

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, false)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_3 = arg_435_1:GetWordFromCfg(102804106)
				local var_438_4 = arg_435_1:FormatText(var_438_3.content)

				arg_435_1.text_.text = var_438_4

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_5 = 14
				local var_438_6 = utf8.len(var_438_4)
				local var_438_7 = var_438_5 <= 0 and var_438_2 or var_438_2 * (var_438_6 / var_438_5)

				if var_438_7 > 0 and var_438_2 < var_438_7 then
					arg_435_1.talkMaxDuration = var_438_7

					if var_438_7 + var_438_1 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_7 + var_438_1
					end
				end

				arg_435_1.text_.text = var_438_4
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_8 = math.max(var_438_2, arg_435_1.talkMaxDuration)

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_8 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_1) / var_438_8

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_1 + var_438_8 and arg_435_1.time_ < var_438_1 + var_438_8 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play102804107 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 102804107
		arg_439_1.duration_ = 10.5

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play102804108(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_442_1 = 0
			local var_442_2 = 0.75

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_3 = arg_439_1:FormatText(StoryNameCfg[8].name)

				arg_439_1.leftNameTxt_.text = var_442_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_4 = arg_439_1:GetWordFromCfg(102804107)
				local var_442_5 = arg_439_1:FormatText(var_442_4.content)

				arg_439_1.text_.text = var_442_5

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_6 = 30
				local var_442_7 = utf8.len(var_442_5)
				local var_442_8 = var_442_6 <= 0 and var_442_2 or var_442_2 * (var_442_7 / var_442_6)

				if var_442_8 > 0 and var_442_2 < var_442_8 then
					arg_439_1.talkMaxDuration = var_442_8

					if var_442_8 + var_442_1 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_8 + var_442_1
					end
				end

				arg_439_1.text_.text = var_442_5
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804107", "story_v_side_old_102804.awb") ~= 0 then
					local var_442_9 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804107", "story_v_side_old_102804.awb") / 1000

					if var_442_9 + var_442_1 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_9 + var_442_1
					end

					if var_442_4.prefab_name ~= "" and arg_439_1.actors_[var_442_4.prefab_name] ~= nil then
						local var_442_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_4.prefab_name].transform, "story_v_side_old_102804", "102804107", "story_v_side_old_102804.awb")

						arg_439_1:RecordAudio("102804107", var_442_10)
						arg_439_1:RecordAudio("102804107", var_442_10)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804107", "story_v_side_old_102804.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804107", "story_v_side_old_102804.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_11 = math.max(var_442_2, arg_439_1.talkMaxDuration)

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_11 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_1) / var_442_11

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_1 + var_442_11 and arg_439_1.time_ < var_442_1 + var_442_11 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play102804108 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 102804108
		arg_443_1.duration_ = 12.933

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play102804109(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1148ui_story"]
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 and arg_443_1.var_.characterEffect1148ui_story == nil then
				arg_443_1.var_.characterEffect1148ui_story = var_446_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_2 = 0.2

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2

				if arg_443_1.var_.characterEffect1148ui_story then
					local var_446_4 = Mathf.Lerp(0, 0.5, var_446_3)

					arg_443_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_443_1.var_.characterEffect1148ui_story.fillRatio = var_446_4
				end
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 and arg_443_1.var_.characterEffect1148ui_story then
				local var_446_5 = 0.5

				arg_443_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_443_1.var_.characterEffect1148ui_story.fillRatio = var_446_5
			end

			local var_446_6 = arg_443_1.actors_["1059ui_story"]
			local var_446_7 = 0

			if var_446_7 < arg_443_1.time_ and arg_443_1.time_ <= var_446_7 + arg_446_0 and arg_443_1.var_.characterEffect1059ui_story == nil then
				arg_443_1.var_.characterEffect1059ui_story = var_446_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_8 = 0.2

			if var_446_7 <= arg_443_1.time_ and arg_443_1.time_ < var_446_7 + var_446_8 then
				local var_446_9 = (arg_443_1.time_ - var_446_7) / var_446_8

				if arg_443_1.var_.characterEffect1059ui_story then
					arg_443_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_443_1.time_ >= var_446_7 + var_446_8 and arg_443_1.time_ < var_446_7 + var_446_8 + arg_446_0 and arg_443_1.var_.characterEffect1059ui_story then
				arg_443_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_446_10 = 0

			if var_446_10 < arg_443_1.time_ and arg_443_1.time_ <= var_446_10 + arg_446_0 then
				arg_443_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_446_11 = 0

			if var_446_11 < arg_443_1.time_ and arg_443_1.time_ <= var_446_11 + arg_446_0 then
				arg_443_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_446_12 = 0
			local var_446_13 = 1.175

			if var_446_12 < arg_443_1.time_ and arg_443_1.time_ <= var_446_12 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_14 = arg_443_1:FormatText(StoryNameCfg[28].name)

				arg_443_1.leftNameTxt_.text = var_446_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_15 = arg_443_1:GetWordFromCfg(102804108)
				local var_446_16 = arg_443_1:FormatText(var_446_15.content)

				arg_443_1.text_.text = var_446_16

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_17 = 46
				local var_446_18 = utf8.len(var_446_16)
				local var_446_19 = var_446_17 <= 0 and var_446_13 or var_446_13 * (var_446_18 / var_446_17)

				if var_446_19 > 0 and var_446_13 < var_446_19 then
					arg_443_1.talkMaxDuration = var_446_19

					if var_446_19 + var_446_12 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_19 + var_446_12
					end
				end

				arg_443_1.text_.text = var_446_16
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804108", "story_v_side_old_102804.awb") ~= 0 then
					local var_446_20 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804108", "story_v_side_old_102804.awb") / 1000

					if var_446_20 + var_446_12 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_20 + var_446_12
					end

					if var_446_15.prefab_name ~= "" and arg_443_1.actors_[var_446_15.prefab_name] ~= nil then
						local var_446_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_15.prefab_name].transform, "story_v_side_old_102804", "102804108", "story_v_side_old_102804.awb")

						arg_443_1:RecordAudio("102804108", var_446_21)
						arg_443_1:RecordAudio("102804108", var_446_21)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804108", "story_v_side_old_102804.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804108", "story_v_side_old_102804.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_22 = math.max(var_446_13, arg_443_1.talkMaxDuration)

			if var_446_12 <= arg_443_1.time_ and arg_443_1.time_ < var_446_12 + var_446_22 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_12) / var_446_22

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_12 + var_446_22 and arg_443_1.time_ < var_446_12 + var_446_22 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play102804109 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 102804109
		arg_447_1.duration_ = 2.3

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play102804110(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["1059ui_story"]
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 and arg_447_1.var_.characterEffect1059ui_story == nil then
				arg_447_1.var_.characterEffect1059ui_story = var_450_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_2 = 0.2

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2

				if arg_447_1.var_.characterEffect1059ui_story then
					local var_450_4 = Mathf.Lerp(0, 0.5, var_450_3)

					arg_447_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_447_1.var_.characterEffect1059ui_story.fillRatio = var_450_4
				end
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 and arg_447_1.var_.characterEffect1059ui_story then
				local var_450_5 = 0.5

				arg_447_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_447_1.var_.characterEffect1059ui_story.fillRatio = var_450_5
			end

			local var_450_6 = arg_447_1.actors_["1028ui_story"]
			local var_450_7 = 0

			if var_450_7 < arg_447_1.time_ and arg_447_1.time_ <= var_450_7 + arg_450_0 and arg_447_1.var_.characterEffect1028ui_story == nil then
				arg_447_1.var_.characterEffect1028ui_story = var_450_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_8 = 0.2

			if var_450_7 <= arg_447_1.time_ and arg_447_1.time_ < var_450_7 + var_450_8 then
				local var_450_9 = (arg_447_1.time_ - var_450_7) / var_450_8

				if arg_447_1.var_.characterEffect1028ui_story then
					arg_447_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_447_1.time_ >= var_450_7 + var_450_8 and arg_447_1.time_ < var_450_7 + var_450_8 + arg_450_0 and arg_447_1.var_.characterEffect1028ui_story then
				arg_447_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_450_10 = 0

			if var_450_10 < arg_447_1.time_ and arg_447_1.time_ <= var_450_10 + arg_450_0 then
				arg_447_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action3_1")
			end

			local var_450_11 = 0

			if var_450_11 < arg_447_1.time_ and arg_447_1.time_ <= var_450_11 + arg_450_0 then
				arg_447_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_450_12 = 0
			local var_450_13 = 0.175

			if var_450_12 < arg_447_1.time_ and arg_447_1.time_ <= var_450_12 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_14 = arg_447_1:FormatText(StoryNameCfg[327].name)

				arg_447_1.leftNameTxt_.text = var_450_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_15 = arg_447_1:GetWordFromCfg(102804109)
				local var_450_16 = arg_447_1:FormatText(var_450_15.content)

				arg_447_1.text_.text = var_450_16

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_17 = 7
				local var_450_18 = utf8.len(var_450_16)
				local var_450_19 = var_450_17 <= 0 and var_450_13 or var_450_13 * (var_450_18 / var_450_17)

				if var_450_19 > 0 and var_450_13 < var_450_19 then
					arg_447_1.talkMaxDuration = var_450_19

					if var_450_19 + var_450_12 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_19 + var_450_12
					end
				end

				arg_447_1.text_.text = var_450_16
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804109", "story_v_side_old_102804.awb") ~= 0 then
					local var_450_20 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804109", "story_v_side_old_102804.awb") / 1000

					if var_450_20 + var_450_12 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_20 + var_450_12
					end

					if var_450_15.prefab_name ~= "" and arg_447_1.actors_[var_450_15.prefab_name] ~= nil then
						local var_450_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_15.prefab_name].transform, "story_v_side_old_102804", "102804109", "story_v_side_old_102804.awb")

						arg_447_1:RecordAudio("102804109", var_450_21)
						arg_447_1:RecordAudio("102804109", var_450_21)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804109", "story_v_side_old_102804.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804109", "story_v_side_old_102804.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_22 = math.max(var_450_13, arg_447_1.talkMaxDuration)

			if var_450_12 <= arg_447_1.time_ and arg_447_1.time_ < var_450_12 + var_450_22 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_12) / var_450_22

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_12 + var_450_22 and arg_447_1.time_ < var_450_12 + var_450_22 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play102804110 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 102804110
		arg_451_1.duration_ = 3.8

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play102804111(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_454_2 = 0

			if var_454_2 < arg_451_1.time_ and arg_451_1.time_ <= var_454_2 + arg_454_0 then
				arg_451_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_454_3 = 0
			local var_454_4 = 0.225

			if var_454_3 < arg_451_1.time_ and arg_451_1.time_ <= var_454_3 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_5 = arg_451_1:FormatText(StoryNameCfg[327].name)

				arg_451_1.leftNameTxt_.text = var_454_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_6 = arg_451_1:GetWordFromCfg(102804110)
				local var_454_7 = arg_451_1:FormatText(var_454_6.content)

				arg_451_1.text_.text = var_454_7

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_8 = 9
				local var_454_9 = utf8.len(var_454_7)
				local var_454_10 = var_454_8 <= 0 and var_454_4 or var_454_4 * (var_454_9 / var_454_8)

				if var_454_10 > 0 and var_454_4 < var_454_10 then
					arg_451_1.talkMaxDuration = var_454_10

					if var_454_10 + var_454_3 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_10 + var_454_3
					end
				end

				arg_451_1.text_.text = var_454_7
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804110", "story_v_side_old_102804.awb") ~= 0 then
					local var_454_11 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804110", "story_v_side_old_102804.awb") / 1000

					if var_454_11 + var_454_3 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_11 + var_454_3
					end

					if var_454_6.prefab_name ~= "" and arg_451_1.actors_[var_454_6.prefab_name] ~= nil then
						local var_454_12 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_6.prefab_name].transform, "story_v_side_old_102804", "102804110", "story_v_side_old_102804.awb")

						arg_451_1:RecordAudio("102804110", var_454_12)
						arg_451_1:RecordAudio("102804110", var_454_12)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804110", "story_v_side_old_102804.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804110", "story_v_side_old_102804.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_13 = math.max(var_454_4, arg_451_1.talkMaxDuration)

			if var_454_3 <= arg_451_1.time_ and arg_451_1.time_ < var_454_3 + var_454_13 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_3) / var_454_13

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_3 + var_454_13 and arg_451_1.time_ < var_454_3 + var_454_13 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play102804111 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 102804111
		arg_455_1.duration_ = 1.999999999999

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play102804112(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["1028ui_story"]
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 and arg_455_1.var_.characterEffect1028ui_story == nil then
				arg_455_1.var_.characterEffect1028ui_story = var_458_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_2 = 0.2

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_2 then
				local var_458_3 = (arg_455_1.time_ - var_458_1) / var_458_2

				if arg_455_1.var_.characterEffect1028ui_story then
					local var_458_4 = Mathf.Lerp(0, 0.5, var_458_3)

					arg_455_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_455_1.var_.characterEffect1028ui_story.fillRatio = var_458_4
				end
			end

			if arg_455_1.time_ >= var_458_1 + var_458_2 and arg_455_1.time_ < var_458_1 + var_458_2 + arg_458_0 and arg_455_1.var_.characterEffect1028ui_story then
				local var_458_5 = 0.5

				arg_455_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_455_1.var_.characterEffect1028ui_story.fillRatio = var_458_5
			end

			local var_458_6 = arg_455_1.actors_["1148ui_story"]
			local var_458_7 = 0

			if var_458_7 < arg_455_1.time_ and arg_455_1.time_ <= var_458_7 + arg_458_0 and arg_455_1.var_.characterEffect1148ui_story == nil then
				arg_455_1.var_.characterEffect1148ui_story = var_458_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_8 = 0.2

			if var_458_7 <= arg_455_1.time_ and arg_455_1.time_ < var_458_7 + var_458_8 then
				local var_458_9 = (arg_455_1.time_ - var_458_7) / var_458_8

				if arg_455_1.var_.characterEffect1148ui_story then
					arg_455_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_455_1.time_ >= var_458_7 + var_458_8 and arg_455_1.time_ < var_458_7 + var_458_8 + arg_458_0 and arg_455_1.var_.characterEffect1148ui_story then
				arg_455_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_458_10 = arg_455_1.actors_["1059ui_story"]
			local var_458_11 = 0

			if var_458_11 < arg_455_1.time_ and arg_455_1.time_ <= var_458_11 + arg_458_0 and arg_455_1.var_.characterEffect1059ui_story == nil then
				arg_455_1.var_.characterEffect1059ui_story = var_458_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_12 = 0.2

			if var_458_11 <= arg_455_1.time_ and arg_455_1.time_ < var_458_11 + var_458_12 then
				local var_458_13 = (arg_455_1.time_ - var_458_11) / var_458_12

				if arg_455_1.var_.characterEffect1059ui_story then
					arg_455_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_455_1.time_ >= var_458_11 + var_458_12 and arg_455_1.time_ < var_458_11 + var_458_12 + arg_458_0 and arg_455_1.var_.characterEffect1059ui_story then
				arg_455_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_458_14 = 0

			if var_458_14 < arg_455_1.time_ and arg_455_1.time_ <= var_458_14 + arg_458_0 then
				arg_455_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action7_1")
			end

			local var_458_15 = 0

			if var_458_15 < arg_455_1.time_ and arg_455_1.time_ <= var_458_15 + arg_458_0 then
				arg_455_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_2")
			end

			local var_458_16 = 0

			if var_458_16 < arg_455_1.time_ and arg_455_1.time_ <= var_458_16 + arg_458_0 then
				arg_455_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_458_17 = 0

			if var_458_17 < arg_455_1.time_ and arg_455_1.time_ <= var_458_17 + arg_458_0 then
				arg_455_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_458_18 = 0
			local var_458_19 = 0.075

			if var_458_18 < arg_455_1.time_ and arg_455_1.time_ <= var_458_18 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_20 = arg_455_1:FormatText(StoryNameCfg[335].name)

				arg_455_1.leftNameTxt_.text = var_458_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_21 = arg_455_1:GetWordFromCfg(102804111)
				local var_458_22 = arg_455_1:FormatText(var_458_21.content)

				arg_455_1.text_.text = var_458_22

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_23 = 3
				local var_458_24 = utf8.len(var_458_22)
				local var_458_25 = var_458_23 <= 0 and var_458_19 or var_458_19 * (var_458_24 / var_458_23)

				if var_458_25 > 0 and var_458_19 < var_458_25 then
					arg_455_1.talkMaxDuration = var_458_25

					if var_458_25 + var_458_18 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_25 + var_458_18
					end
				end

				arg_455_1.text_.text = var_458_22
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804111", "story_v_side_old_102804.awb") ~= 0 then
					local var_458_26 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804111", "story_v_side_old_102804.awb") / 1000

					if var_458_26 + var_458_18 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_26 + var_458_18
					end

					if var_458_21.prefab_name ~= "" and arg_455_1.actors_[var_458_21.prefab_name] ~= nil then
						local var_458_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_21.prefab_name].transform, "story_v_side_old_102804", "102804111", "story_v_side_old_102804.awb")

						arg_455_1:RecordAudio("102804111", var_458_27)
						arg_455_1:RecordAudio("102804111", var_458_27)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804111", "story_v_side_old_102804.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804111", "story_v_side_old_102804.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_28 = math.max(var_458_19, arg_455_1.talkMaxDuration)

			if var_458_18 <= arg_455_1.time_ and arg_455_1.time_ < var_458_18 + var_458_28 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_18) / var_458_28

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_18 + var_458_28 and arg_455_1.time_ < var_458_18 + var_458_28 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play102804112 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 102804112
		arg_459_1.duration_ = 10.866

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play102804113(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["1028ui_story"]
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 and arg_459_1.var_.characterEffect1028ui_story == nil then
				arg_459_1.var_.characterEffect1028ui_story = var_462_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_2 = 0.2

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2

				if arg_459_1.var_.characterEffect1028ui_story then
					arg_459_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 and arg_459_1.var_.characterEffect1028ui_story then
				arg_459_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_462_4 = arg_459_1.actors_["1148ui_story"]
			local var_462_5 = 0

			if var_462_5 < arg_459_1.time_ and arg_459_1.time_ <= var_462_5 + arg_462_0 and arg_459_1.var_.characterEffect1148ui_story == nil then
				arg_459_1.var_.characterEffect1148ui_story = var_462_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_6 = 0.2

			if var_462_5 <= arg_459_1.time_ and arg_459_1.time_ < var_462_5 + var_462_6 then
				local var_462_7 = (arg_459_1.time_ - var_462_5) / var_462_6

				if arg_459_1.var_.characterEffect1148ui_story then
					local var_462_8 = Mathf.Lerp(0, 0.5, var_462_7)

					arg_459_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_459_1.var_.characterEffect1148ui_story.fillRatio = var_462_8
				end
			end

			if arg_459_1.time_ >= var_462_5 + var_462_6 and arg_459_1.time_ < var_462_5 + var_462_6 + arg_462_0 and arg_459_1.var_.characterEffect1148ui_story then
				local var_462_9 = 0.5

				arg_459_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_459_1.var_.characterEffect1148ui_story.fillRatio = var_462_9
			end

			local var_462_10 = arg_459_1.actors_["1059ui_story"]
			local var_462_11 = 0

			if var_462_11 < arg_459_1.time_ and arg_459_1.time_ <= var_462_11 + arg_462_0 and arg_459_1.var_.characterEffect1059ui_story == nil then
				arg_459_1.var_.characterEffect1059ui_story = var_462_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_12 = 0.2

			if var_462_11 <= arg_459_1.time_ and arg_459_1.time_ < var_462_11 + var_462_12 then
				local var_462_13 = (arg_459_1.time_ - var_462_11) / var_462_12

				if arg_459_1.var_.characterEffect1059ui_story then
					local var_462_14 = Mathf.Lerp(0, 0.5, var_462_13)

					arg_459_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_459_1.var_.characterEffect1059ui_story.fillRatio = var_462_14
				end
			end

			if arg_459_1.time_ >= var_462_11 + var_462_12 and arg_459_1.time_ < var_462_11 + var_462_12 + arg_462_0 and arg_459_1.var_.characterEffect1059ui_story then
				local var_462_15 = 0.5

				arg_459_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_459_1.var_.characterEffect1059ui_story.fillRatio = var_462_15
			end

			local var_462_16 = 0

			if var_462_16 < arg_459_1.time_ and arg_459_1.time_ <= var_462_16 + arg_462_0 then
				arg_459_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_462_17 = 0
			local var_462_18 = 0.7

			if var_462_17 < arg_459_1.time_ and arg_459_1.time_ <= var_462_17 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_19 = arg_459_1:FormatText(StoryNameCfg[327].name)

				arg_459_1.leftNameTxt_.text = var_462_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_20 = arg_459_1:GetWordFromCfg(102804112)
				local var_462_21 = arg_459_1:FormatText(var_462_20.content)

				arg_459_1.text_.text = var_462_21

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_22 = 28
				local var_462_23 = utf8.len(var_462_21)
				local var_462_24 = var_462_22 <= 0 and var_462_18 or var_462_18 * (var_462_23 / var_462_22)

				if var_462_24 > 0 and var_462_18 < var_462_24 then
					arg_459_1.talkMaxDuration = var_462_24

					if var_462_24 + var_462_17 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_24 + var_462_17
					end
				end

				arg_459_1.text_.text = var_462_21
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804112", "story_v_side_old_102804.awb") ~= 0 then
					local var_462_25 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804112", "story_v_side_old_102804.awb") / 1000

					if var_462_25 + var_462_17 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_25 + var_462_17
					end

					if var_462_20.prefab_name ~= "" and arg_459_1.actors_[var_462_20.prefab_name] ~= nil then
						local var_462_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_20.prefab_name].transform, "story_v_side_old_102804", "102804112", "story_v_side_old_102804.awb")

						arg_459_1:RecordAudio("102804112", var_462_26)
						arg_459_1:RecordAudio("102804112", var_462_26)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804112", "story_v_side_old_102804.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804112", "story_v_side_old_102804.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_27 = math.max(var_462_18, arg_459_1.talkMaxDuration)

			if var_462_17 <= arg_459_1.time_ and arg_459_1.time_ < var_462_17 + var_462_27 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_17) / var_462_27

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_17 + var_462_27 and arg_459_1.time_ < var_462_17 + var_462_27 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play102804113 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 102804113
		arg_463_1.duration_ = 9.5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play102804114(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_466_1 = 0
			local var_466_2 = 0.9

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_3 = arg_463_1:FormatText(StoryNameCfg[327].name)

				arg_463_1.leftNameTxt_.text = var_466_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_4 = arg_463_1:GetWordFromCfg(102804113)
				local var_466_5 = arg_463_1:FormatText(var_466_4.content)

				arg_463_1.text_.text = var_466_5

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_6 = 36
				local var_466_7 = utf8.len(var_466_5)
				local var_466_8 = var_466_6 <= 0 and var_466_2 or var_466_2 * (var_466_7 / var_466_6)

				if var_466_8 > 0 and var_466_2 < var_466_8 then
					arg_463_1.talkMaxDuration = var_466_8

					if var_466_8 + var_466_1 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_8 + var_466_1
					end
				end

				arg_463_1.text_.text = var_466_5
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804113", "story_v_side_old_102804.awb") ~= 0 then
					local var_466_9 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804113", "story_v_side_old_102804.awb") / 1000

					if var_466_9 + var_466_1 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_9 + var_466_1
					end

					if var_466_4.prefab_name ~= "" and arg_463_1.actors_[var_466_4.prefab_name] ~= nil then
						local var_466_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_4.prefab_name].transform, "story_v_side_old_102804", "102804113", "story_v_side_old_102804.awb")

						arg_463_1:RecordAudio("102804113", var_466_10)
						arg_463_1:RecordAudio("102804113", var_466_10)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804113", "story_v_side_old_102804.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804113", "story_v_side_old_102804.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_11 = math.max(var_466_2, arg_463_1.talkMaxDuration)

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_11 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_1) / var_466_11

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_1 + var_466_11 and arg_463_1.time_ < var_466_1 + var_466_11 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play102804114 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 102804114
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play102804115(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["1028ui_story"]
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 and arg_467_1.var_.characterEffect1028ui_story == nil then
				arg_467_1.var_.characterEffect1028ui_story = var_470_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_470_2 = 0.2

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
			local var_470_7 = 0.475

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

				local var_470_9 = arg_467_1:GetWordFromCfg(102804114)
				local var_470_10 = arg_467_1:FormatText(var_470_9.content)

				arg_467_1.text_.text = var_470_10

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_11 = 19
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
	Play102804115 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 102804115
		arg_471_1.duration_ = 5.1

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play102804116(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["1028ui_story"]
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 and arg_471_1.var_.characterEffect1028ui_story == nil then
				arg_471_1.var_.characterEffect1028ui_story = var_474_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_2 = 0.2

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2

				if arg_471_1.var_.characterEffect1028ui_story then
					arg_471_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 and arg_471_1.var_.characterEffect1028ui_story then
				arg_471_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_474_4 = 0

			if var_474_4 < arg_471_1.time_ and arg_471_1.time_ <= var_474_4 + arg_474_0 then
				arg_471_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action3_2")
			end

			local var_474_5 = 0

			if var_474_5 < arg_471_1.time_ and arg_471_1.time_ <= var_474_5 + arg_474_0 then
				arg_471_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_474_6 = 0
			local var_474_7 = 0.45

			if var_474_6 < arg_471_1.time_ and arg_471_1.time_ <= var_474_6 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_8 = arg_471_1:FormatText(StoryNameCfg[327].name)

				arg_471_1.leftNameTxt_.text = var_474_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_9 = arg_471_1:GetWordFromCfg(102804115)
				local var_474_10 = arg_471_1:FormatText(var_474_9.content)

				arg_471_1.text_.text = var_474_10

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_11 = 18
				local var_474_12 = utf8.len(var_474_10)
				local var_474_13 = var_474_11 <= 0 and var_474_7 or var_474_7 * (var_474_12 / var_474_11)

				if var_474_13 > 0 and var_474_7 < var_474_13 then
					arg_471_1.talkMaxDuration = var_474_13

					if var_474_13 + var_474_6 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_13 + var_474_6
					end
				end

				arg_471_1.text_.text = var_474_10
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804115", "story_v_side_old_102804.awb") ~= 0 then
					local var_474_14 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804115", "story_v_side_old_102804.awb") / 1000

					if var_474_14 + var_474_6 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_14 + var_474_6
					end

					if var_474_9.prefab_name ~= "" and arg_471_1.actors_[var_474_9.prefab_name] ~= nil then
						local var_474_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_9.prefab_name].transform, "story_v_side_old_102804", "102804115", "story_v_side_old_102804.awb")

						arg_471_1:RecordAudio("102804115", var_474_15)
						arg_471_1:RecordAudio("102804115", var_474_15)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804115", "story_v_side_old_102804.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804115", "story_v_side_old_102804.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_16 = math.max(var_474_7, arg_471_1.talkMaxDuration)

			if var_474_6 <= arg_471_1.time_ and arg_471_1.time_ < var_474_6 + var_474_16 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_6) / var_474_16

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_6 + var_474_16 and arg_471_1.time_ < var_474_6 + var_474_16 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play102804116 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 102804116
		arg_475_1.duration_ = 2.666

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play102804117(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["1028ui_story"]
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 and arg_475_1.var_.characterEffect1028ui_story == nil then
				arg_475_1.var_.characterEffect1028ui_story = var_478_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_2 = 0.2

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2

				if arg_475_1.var_.characterEffect1028ui_story then
					local var_478_4 = Mathf.Lerp(0, 0.5, var_478_3)

					arg_475_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_475_1.var_.characterEffect1028ui_story.fillRatio = var_478_4
				end
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 and arg_475_1.var_.characterEffect1028ui_story then
				local var_478_5 = 0.5

				arg_475_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_475_1.var_.characterEffect1028ui_story.fillRatio = var_478_5
			end

			local var_478_6 = arg_475_1.actors_["1148ui_story"]
			local var_478_7 = 0

			if var_478_7 < arg_475_1.time_ and arg_475_1.time_ <= var_478_7 + arg_478_0 and arg_475_1.var_.characterEffect1148ui_story == nil then
				arg_475_1.var_.characterEffect1148ui_story = var_478_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_8 = 0.2

			if var_478_7 <= arg_475_1.time_ and arg_475_1.time_ < var_478_7 + var_478_8 then
				local var_478_9 = (arg_475_1.time_ - var_478_7) / var_478_8

				if arg_475_1.var_.characterEffect1148ui_story then
					arg_475_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_475_1.time_ >= var_478_7 + var_478_8 and arg_475_1.time_ < var_478_7 + var_478_8 + arg_478_0 and arg_475_1.var_.characterEffect1148ui_story then
				arg_475_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_478_10 = arg_475_1.actors_["1059ui_story"]
			local var_478_11 = 0

			if var_478_11 < arg_475_1.time_ and arg_475_1.time_ <= var_478_11 + arg_478_0 and arg_475_1.var_.characterEffect1059ui_story == nil then
				arg_475_1.var_.characterEffect1059ui_story = var_478_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_12 = 0.2

			if var_478_11 <= arg_475_1.time_ and arg_475_1.time_ < var_478_11 + var_478_12 then
				local var_478_13 = (arg_475_1.time_ - var_478_11) / var_478_12

				if arg_475_1.var_.characterEffect1059ui_story then
					arg_475_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_475_1.time_ >= var_478_11 + var_478_12 and arg_475_1.time_ < var_478_11 + var_478_12 + arg_478_0 and arg_475_1.var_.characterEffect1059ui_story then
				arg_475_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_478_14 = 0

			if var_478_14 < arg_475_1.time_ and arg_475_1.time_ <= var_478_14 + arg_478_0 then
				arg_475_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action7_2")
			end

			local var_478_15 = 0

			if var_478_15 < arg_475_1.time_ and arg_475_1.time_ <= var_478_15 + arg_478_0 then
				arg_475_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_478_16 = 0
			local var_478_17 = 0.05

			if var_478_16 < arg_475_1.time_ and arg_475_1.time_ <= var_478_16 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_18 = arg_475_1:FormatText(StoryNameCfg[335].name)

				arg_475_1.leftNameTxt_.text = var_478_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_19 = arg_475_1:GetWordFromCfg(102804116)
				local var_478_20 = arg_475_1:FormatText(var_478_19.content)

				arg_475_1.text_.text = var_478_20

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_21 = 2
				local var_478_22 = utf8.len(var_478_20)
				local var_478_23 = var_478_21 <= 0 and var_478_17 or var_478_17 * (var_478_22 / var_478_21)

				if var_478_23 > 0 and var_478_17 < var_478_23 then
					arg_475_1.talkMaxDuration = var_478_23

					if var_478_23 + var_478_16 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_23 + var_478_16
					end
				end

				arg_475_1.text_.text = var_478_20
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804116", "story_v_side_old_102804.awb") ~= 0 then
					local var_478_24 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804116", "story_v_side_old_102804.awb") / 1000

					if var_478_24 + var_478_16 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_24 + var_478_16
					end

					if var_478_19.prefab_name ~= "" and arg_475_1.actors_[var_478_19.prefab_name] ~= nil then
						local var_478_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_19.prefab_name].transform, "story_v_side_old_102804", "102804116", "story_v_side_old_102804.awb")

						arg_475_1:RecordAudio("102804116", var_478_25)
						arg_475_1:RecordAudio("102804116", var_478_25)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804116", "story_v_side_old_102804.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804116", "story_v_side_old_102804.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_26 = math.max(var_478_17, arg_475_1.talkMaxDuration)

			if var_478_16 <= arg_475_1.time_ and arg_475_1.time_ < var_478_16 + var_478_26 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_16) / var_478_26

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_16 + var_478_26 and arg_475_1.time_ < var_478_16 + var_478_26 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play102804117 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 102804117
		arg_479_1.duration_ = 5

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play102804118(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = 0

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_482_1 = 0
			local var_482_2 = 0.675

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, false)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_3 = arg_479_1:GetWordFromCfg(102804117)
				local var_482_4 = arg_479_1:FormatText(var_482_3.content)

				arg_479_1.text_.text = var_482_4

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_5 = 27
				local var_482_6 = utf8.len(var_482_4)
				local var_482_7 = var_482_5 <= 0 and var_482_2 or var_482_2 * (var_482_6 / var_482_5)

				if var_482_7 > 0 and var_482_2 < var_482_7 then
					arg_479_1.talkMaxDuration = var_482_7

					if var_482_7 + var_482_1 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_7 + var_482_1
					end
				end

				arg_479_1.text_.text = var_482_4
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)
				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_8 = math.max(var_482_2, arg_479_1.talkMaxDuration)

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_8 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_1) / var_482_8

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_1 + var_482_8 and arg_479_1.time_ < var_482_1 + var_482_8 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play102804118 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 102804118
		arg_483_1.duration_ = 3.333

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play102804119(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = 0

			if var_486_0 < arg_483_1.time_ and arg_483_1.time_ <= var_486_0 + arg_486_0 then
				arg_483_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 then
				arg_483_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_486_2 = 0
			local var_486_3 = 0.1

			if var_486_2 < arg_483_1.time_ and arg_483_1.time_ <= var_486_2 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_4 = arg_483_1:FormatText(StoryNameCfg[335].name)

				arg_483_1.leftNameTxt_.text = var_486_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_5 = arg_483_1:GetWordFromCfg(102804118)
				local var_486_6 = arg_483_1:FormatText(var_486_5.content)

				arg_483_1.text_.text = var_486_6

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_7 = 4
				local var_486_8 = utf8.len(var_486_6)
				local var_486_9 = var_486_7 <= 0 and var_486_3 or var_486_3 * (var_486_8 / var_486_7)

				if var_486_9 > 0 and var_486_3 < var_486_9 then
					arg_483_1.talkMaxDuration = var_486_9

					if var_486_9 + var_486_2 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_9 + var_486_2
					end
				end

				arg_483_1.text_.text = var_486_6
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804118", "story_v_side_old_102804.awb") ~= 0 then
					local var_486_10 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804118", "story_v_side_old_102804.awb") / 1000

					if var_486_10 + var_486_2 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_10 + var_486_2
					end

					if var_486_5.prefab_name ~= "" and arg_483_1.actors_[var_486_5.prefab_name] ~= nil then
						local var_486_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_483_1.actors_[var_486_5.prefab_name].transform, "story_v_side_old_102804", "102804118", "story_v_side_old_102804.awb")

						arg_483_1:RecordAudio("102804118", var_486_11)
						arg_483_1:RecordAudio("102804118", var_486_11)
					else
						arg_483_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804118", "story_v_side_old_102804.awb")
					end

					arg_483_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804118", "story_v_side_old_102804.awb")
				end

				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_12 = math.max(var_486_3, arg_483_1.talkMaxDuration)

			if var_486_2 <= arg_483_1.time_ and arg_483_1.time_ < var_486_2 + var_486_12 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_2) / var_486_12

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_2 + var_486_12 and arg_483_1.time_ < var_486_2 + var_486_12 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play102804119 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 102804119
		arg_487_1.duration_ = 11.233

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play102804120(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["1028ui_story"]
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 and arg_487_1.var_.characterEffect1028ui_story == nil then
				arg_487_1.var_.characterEffect1028ui_story = var_490_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_2 = 0.2

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2

				if arg_487_1.var_.characterEffect1028ui_story then
					arg_487_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 and arg_487_1.var_.characterEffect1028ui_story then
				arg_487_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_490_4 = arg_487_1.actors_["1148ui_story"]
			local var_490_5 = 0

			if var_490_5 < arg_487_1.time_ and arg_487_1.time_ <= var_490_5 + arg_490_0 and arg_487_1.var_.characterEffect1148ui_story == nil then
				arg_487_1.var_.characterEffect1148ui_story = var_490_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_6 = 0.2

			if var_490_5 <= arg_487_1.time_ and arg_487_1.time_ < var_490_5 + var_490_6 then
				local var_490_7 = (arg_487_1.time_ - var_490_5) / var_490_6

				if arg_487_1.var_.characterEffect1148ui_story then
					local var_490_8 = Mathf.Lerp(0, 0.5, var_490_7)

					arg_487_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_487_1.var_.characterEffect1148ui_story.fillRatio = var_490_8
				end
			end

			if arg_487_1.time_ >= var_490_5 + var_490_6 and arg_487_1.time_ < var_490_5 + var_490_6 + arg_490_0 and arg_487_1.var_.characterEffect1148ui_story then
				local var_490_9 = 0.5

				arg_487_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_487_1.var_.characterEffect1148ui_story.fillRatio = var_490_9
			end

			local var_490_10 = arg_487_1.actors_["1059ui_story"]
			local var_490_11 = 0

			if var_490_11 < arg_487_1.time_ and arg_487_1.time_ <= var_490_11 + arg_490_0 and arg_487_1.var_.characterEffect1059ui_story == nil then
				arg_487_1.var_.characterEffect1059ui_story = var_490_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_12 = 0.2

			if var_490_11 <= arg_487_1.time_ and arg_487_1.time_ < var_490_11 + var_490_12 then
				local var_490_13 = (arg_487_1.time_ - var_490_11) / var_490_12

				if arg_487_1.var_.characterEffect1059ui_story then
					local var_490_14 = Mathf.Lerp(0, 0.5, var_490_13)

					arg_487_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_487_1.var_.characterEffect1059ui_story.fillRatio = var_490_14
				end
			end

			if arg_487_1.time_ >= var_490_11 + var_490_12 and arg_487_1.time_ < var_490_11 + var_490_12 + arg_490_0 and arg_487_1.var_.characterEffect1059ui_story then
				local var_490_15 = 0.5

				arg_487_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_487_1.var_.characterEffect1059ui_story.fillRatio = var_490_15
			end

			local var_490_16 = 0

			if var_490_16 < arg_487_1.time_ and arg_487_1.time_ <= var_490_16 + arg_490_0 then
				arg_487_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_490_17 = 0

			if var_490_17 < arg_487_1.time_ and arg_487_1.time_ <= var_490_17 + arg_490_0 then
				arg_487_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_490_18 = 0
			local var_490_19 = 0.95

			if var_490_18 < arg_487_1.time_ and arg_487_1.time_ <= var_490_18 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_20 = arg_487_1:FormatText(StoryNameCfg[327].name)

				arg_487_1.leftNameTxt_.text = var_490_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_21 = arg_487_1:GetWordFromCfg(102804119)
				local var_490_22 = arg_487_1:FormatText(var_490_21.content)

				arg_487_1.text_.text = var_490_22

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_23 = 38
				local var_490_24 = utf8.len(var_490_22)
				local var_490_25 = var_490_23 <= 0 and var_490_19 or var_490_19 * (var_490_24 / var_490_23)

				if var_490_25 > 0 and var_490_19 < var_490_25 then
					arg_487_1.talkMaxDuration = var_490_25

					if var_490_25 + var_490_18 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_25 + var_490_18
					end
				end

				arg_487_1.text_.text = var_490_22
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_102804", "102804119", "story_v_side_old_102804.awb") ~= 0 then
					local var_490_26 = manager.audio:GetVoiceLength("story_v_side_old_102804", "102804119", "story_v_side_old_102804.awb") / 1000

					if var_490_26 + var_490_18 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_26 + var_490_18
					end

					if var_490_21.prefab_name ~= "" and arg_487_1.actors_[var_490_21.prefab_name] ~= nil then
						local var_490_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_21.prefab_name].transform, "story_v_side_old_102804", "102804119", "story_v_side_old_102804.awb")

						arg_487_1:RecordAudio("102804119", var_490_27)
						arg_487_1:RecordAudio("102804119", var_490_27)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_side_old_102804", "102804119", "story_v_side_old_102804.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_side_old_102804", "102804119", "story_v_side_old_102804.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_28 = math.max(var_490_19, arg_487_1.talkMaxDuration)

			if var_490_18 <= arg_487_1.time_ and arg_487_1.time_ < var_490_18 + var_490_28 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_18) / var_490_28

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_18 + var_490_28 and arg_487_1.time_ < var_490_18 + var_490_28 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play102804120 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 102804120
		arg_491_1.duration_ = 5

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
			arg_491_1.auto_ = false
		end

		function arg_491_1.playNext_(arg_493_0)
			arg_491_1.onStoryFinished_()
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1028ui_story"]
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 and arg_491_1.var_.characterEffect1028ui_story == nil then
				arg_491_1.var_.characterEffect1028ui_story = var_494_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_2 = 0.2

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2

				if arg_491_1.var_.characterEffect1028ui_story then
					local var_494_4 = Mathf.Lerp(0, 0.5, var_494_3)

					arg_491_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_491_1.var_.characterEffect1028ui_story.fillRatio = var_494_4
				end
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 and arg_491_1.var_.characterEffect1028ui_story then
				local var_494_5 = 0.5

				arg_491_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_491_1.var_.characterEffect1028ui_story.fillRatio = var_494_5
			end

			local var_494_6 = 0
			local var_494_7 = 1

			if var_494_6 < arg_491_1.time_ and arg_491_1.time_ <= var_494_6 + arg_494_0 then
				local var_494_8 = "stop"
				local var_494_9 = "effect"

				arg_491_1:AudioAction(var_494_8, var_494_9, "", "", "")
			end

			local var_494_10 = 0
			local var_494_11 = 1

			if var_494_10 < arg_491_1.time_ and arg_491_1.time_ <= var_494_10 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, false)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_12 = arg_491_1:GetWordFromCfg(102804120)
				local var_494_13 = arg_491_1:FormatText(var_494_12.content)

				arg_491_1.text_.text = var_494_13

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_14 = 49
				local var_494_15 = utf8.len(var_494_13)
				local var_494_16 = var_494_14 <= 0 and var_494_11 or var_494_11 * (var_494_15 / var_494_14)

				if var_494_16 > 0 and var_494_11 < var_494_16 then
					arg_491_1.talkMaxDuration = var_494_16

					if var_494_16 + var_494_10 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_16 + var_494_10
					end
				end

				arg_491_1.text_.text = var_494_13
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)
				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_17 = math.max(var_494_11, arg_491_1.talkMaxDuration)

			if var_494_10 <= arg_491_1.time_ and arg_491_1.time_ < var_494_10 + var_494_17 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_10) / var_494_17

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_10 + var_494_17 and arg_491_1.time_ < var_494_10 + var_494_17 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/H01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R2801",
		"Assets/UIResources/UI_AB/TextureConfig/Background/H02"
	},
	voices = {
		"story_v_side_old_102804.awb"
	}
}
