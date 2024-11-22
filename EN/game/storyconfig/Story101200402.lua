return {
	Play120042001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120042001
		arg_1_1.duration_ = 4.633

		local var_1_0 = {
			zh = 4.633,
			ja = 4.533
		}
		local var_1_1 = manager.audio:GetLocalizationFlag()

		if var_1_0[var_1_1] ~= nil then
			arg_1_1.duration_ = var_1_0[var_1_1]
		end

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play120042002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J02i"

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
				local var_4_5 = arg_1_1.bgs_.J02i

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
					if iter_4_0 ~= "J02i" then
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

			local var_4_22 = "1069ui_story"

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

			local var_4_26 = arg_1_1.actors_["1069ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1069ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -1, -6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1069ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -1, -6)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1069ui_story"]
			local var_4_36 = 2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1069ui_story == nil then
				arg_1_1.var_.characterEffect1069ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.2

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1069ui_story then
					arg_1_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1069ui_story then
				arg_1_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_4_39 = 2

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action4_1")
			end

			local var_4_41 = 0
			local var_4_42 = 0.266666666666667

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 0.4
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_activity_2_0_story_oldtown", "bgm_activity_2_0_story_oldtown", "bgm_activity_2_0_story_oldtown.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.25

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_51 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_51:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[378].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(120042001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 11
				local var_4_56 = utf8.len(var_4_54)
				local var_4_57 = var_4_55 <= 0 and var_4_50 or var_4_50 * (var_4_56 / var_4_55)

				if var_4_57 > 0 and var_4_50 < var_4_57 then
					arg_1_1.talkMaxDuration = var_4_57
					var_4_49 = var_4_49 + 0.3

					if var_4_57 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_49
					end
				end

				arg_1_1.text_.text = var_4_54
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042001", "story_v_out_120042.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_120042", "120042001", "story_v_out_120042.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_120042", "120042001", "story_v_out_120042.awb")

						arg_1_1:RecordAudio("120042001", var_4_59)
						arg_1_1:RecordAudio("120042001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_120042", "120042001", "story_v_out_120042.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_120042", "120042001", "story_v_out_120042.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_60 = var_4_49 + 0.3
			local var_4_61 = math.max(var_4_50, arg_1_1.talkMaxDuration)

			if var_4_60 <= arg_1_1.time_ and arg_1_1.time_ < var_4_60 + var_4_61 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_60) / var_4_61

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_60 + var_4_61 and arg_1_1.time_ < var_4_60 + var_4_61 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play120042002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120042002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play120042003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1069ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1069ui_story == nil then
				arg_7_1.var_.characterEffect1069ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.2

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1069ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1069ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1069ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1069ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 0.25

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[7].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(120042002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 10
				local var_10_12 = utf8.len(var_10_10)
				local var_10_13 = var_10_11 <= 0 and var_10_7 or var_10_7 * (var_10_12 / var_10_11)

				if var_10_13 > 0 and var_10_7 < var_10_13 then
					arg_7_1.talkMaxDuration = var_10_13

					if var_10_13 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_13 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_10
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_14 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_14 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_14

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_14 and arg_7_1.time_ < var_10_6 + var_10_14 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play120042003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 120042003
		arg_11_1.duration_ = 7

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play120042004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1069ui_story"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1069ui_story = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(0, 100, 0)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1069ui_story, var_14_4, var_14_3)

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

			local var_14_9 = 0.034
			local var_14_10 = 0.833333333333333

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 then
				local var_14_11 = "play"
				local var_14_12 = "effect"

				arg_11_1:AudioAction(var_14_11, var_14_12, "se_story_16", "se_story_16_metal", "")
			end

			local var_14_13 = 0
			local var_14_14 = 1

			if var_14_13 < arg_11_1.time_ and arg_11_1.time_ <= var_14_13 + arg_14_0 then
				local var_14_15 = "play"
				local var_14_16 = "effect"

				arg_11_1:AudioAction(var_14_15, var_14_16, "se_story_15", "se_story_15_blast03", "")
			end

			local var_14_17 = 0
			local var_14_18 = 0.867333333333333

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				local var_14_19 = "play"
				local var_14_20 = "effect"

				arg_11_1:AudioAction(var_14_19, var_14_20, "se_story_side_1066", "se_story_1066_Metal", "")
			end

			local var_14_21 = 0

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				arg_11_1.mask_.enabled = true
				arg_11_1.mask_.raycastTarget = true

				arg_11_1:SetGaussion(false)
			end

			local var_14_22 = 2

			if var_14_21 <= arg_11_1.time_ and arg_11_1.time_ < var_14_21 + var_14_22 then
				local var_14_23 = (arg_11_1.time_ - var_14_21) / var_14_22
				local var_14_24 = Color.New(1, 1, 1)

				var_14_24.a = Mathf.Lerp(1, 0, var_14_23)
				arg_11_1.mask_.color = var_14_24
			end

			if arg_11_1.time_ >= var_14_21 + var_14_22 and arg_11_1.time_ < var_14_21 + var_14_22 + arg_14_0 then
				local var_14_25 = Color.New(1, 1, 1)
				local var_14_26 = 0

				arg_11_1.mask_.enabled = false
				var_14_25.a = var_14_26
				arg_11_1.mask_.color = var_14_25
			end

			local var_14_27 = manager.ui.mainCamera.transform
			local var_14_28 = 0

			if var_14_28 < arg_11_1.time_ and arg_11_1.time_ <= var_14_28 + arg_14_0 then
				arg_11_1.var_.shakeOldPos = var_14_27.localPosition
			end

			local var_14_29 = 1

			if var_14_28 <= arg_11_1.time_ and arg_11_1.time_ < var_14_28 + var_14_29 then
				local var_14_30 = (arg_11_1.time_ - var_14_28) / 0.066
				local var_14_31, var_14_32 = math.modf(var_14_30)

				var_14_27.localPosition = Vector3.New(var_14_32 * 0.13, var_14_32 * 0.13, var_14_32 * 0.13) + arg_11_1.var_.shakeOldPos
			end

			if arg_11_1.time_ >= var_14_28 + var_14_29 and arg_11_1.time_ < var_14_28 + var_14_29 + arg_14_0 then
				var_14_27.localPosition = arg_11_1.var_.shakeOldPos
			end

			local var_14_33 = 2
			local var_14_34 = 1.25

			if var_14_33 < arg_11_1.time_ and arg_11_1.time_ <= var_14_33 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_35 = arg_11_1:GetWordFromCfg(120042003)
				local var_14_36 = arg_11_1:FormatText(var_14_35.content)

				arg_11_1.text_.text = var_14_36

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_37 = 50
				local var_14_38 = utf8.len(var_14_36)
				local var_14_39 = var_14_37 <= 0 and var_14_34 or var_14_34 * (var_14_38 / var_14_37)

				if var_14_39 > 0 and var_14_34 < var_14_39 then
					arg_11_1.talkMaxDuration = var_14_39

					if var_14_39 + var_14_33 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_39 + var_14_33
					end
				end

				arg_11_1.text_.text = var_14_36
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_40 = math.max(var_14_34, arg_11_1.talkMaxDuration)

			if var_14_33 <= arg_11_1.time_ and arg_11_1.time_ < var_14_33 + var_14_40 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_33) / var_14_40

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_33 + var_14_40 and arg_11_1.time_ < var_14_33 + var_14_40 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play120042004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 120042004
		arg_15_1.duration_ = 2.966

		local var_15_0 = {
			zh = 2.466,
			ja = 2.966
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
				arg_15_0:Play120042005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1069ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1069ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, -1, -6)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1069ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -1, -6)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["1069ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1069ui_story == nil then
				arg_15_1.var_.characterEffect1069ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.2

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1069ui_story then
					arg_15_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1069ui_story then
				arg_15_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action5_1")
			end

			local var_18_14 = 0
			local var_18_15 = 0.25

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_16 = arg_15_1:FormatText(StoryNameCfg[378].name)

				arg_15_1.leftNameTxt_.text = var_18_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_17 = arg_15_1:GetWordFromCfg(120042004)
				local var_18_18 = arg_15_1:FormatText(var_18_17.content)

				arg_15_1.text_.text = var_18_18

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_19 = 10
				local var_18_20 = utf8.len(var_18_18)
				local var_18_21 = var_18_19 <= 0 and var_18_15 or var_18_15 * (var_18_20 / var_18_19)

				if var_18_21 > 0 and var_18_15 < var_18_21 then
					arg_15_1.talkMaxDuration = var_18_21

					if var_18_21 + var_18_14 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_14
					end
				end

				arg_15_1.text_.text = var_18_18
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042004", "story_v_out_120042.awb") ~= 0 then
					local var_18_22 = manager.audio:GetVoiceLength("story_v_out_120042", "120042004", "story_v_out_120042.awb") / 1000

					if var_18_22 + var_18_14 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_22 + var_18_14
					end

					if var_18_17.prefab_name ~= "" and arg_15_1.actors_[var_18_17.prefab_name] ~= nil then
						local var_18_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_17.prefab_name].transform, "story_v_out_120042", "120042004", "story_v_out_120042.awb")

						arg_15_1:RecordAudio("120042004", var_18_23)
						arg_15_1:RecordAudio("120042004", var_18_23)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_120042", "120042004", "story_v_out_120042.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_120042", "120042004", "story_v_out_120042.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_24 = math.max(var_18_15, arg_15_1.talkMaxDuration)

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_24 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_14) / var_18_24

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_14 + var_18_24 and arg_15_1.time_ < var_18_14 + var_18_24 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play120042005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 120042005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play120042006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1069ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1069ui_story == nil then
				arg_19_1.var_.characterEffect1069ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1069ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1069ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1069ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1069ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0
			local var_22_7 = 0.45

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(120042005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 18
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
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_14 and arg_19_1.time_ < var_22_6 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play120042006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 120042006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play120042007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1069ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1069ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1069ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, 100, 0)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = 0
			local var_26_10 = 0.625

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_11 = arg_23_1:GetWordFromCfg(120042006)
				local var_26_12 = arg_23_1:FormatText(var_26_11.content)

				arg_23_1.text_.text = var_26_12

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_13 = 25
				local var_26_14 = utf8.len(var_26_12)
				local var_26_15 = var_26_13 <= 0 and var_26_10 or var_26_10 * (var_26_14 / var_26_13)

				if var_26_15 > 0 and var_26_10 < var_26_15 then
					arg_23_1.talkMaxDuration = var_26_15

					if var_26_15 + var_26_9 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_15 + var_26_9
					end
				end

				arg_23_1.text_.text = var_26_12
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_16 = math.max(var_26_10, arg_23_1.talkMaxDuration)

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_16 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_9) / var_26_16

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_9 + var_26_16 and arg_23_1.time_ < var_26_9 + var_26_16 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play120042007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 120042007
		arg_27_1.duration_ = 11.5

		local var_27_0 = {
			zh = 8.733,
			ja = 11.5
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
				arg_27_0:Play120042008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "1184ui_story"

			if arg_27_1.actors_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(Asset.Load("Char/" .. var_30_0), arg_27_1.stage_.transform)

				var_30_1.name = var_30_0
				var_30_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.actors_[var_30_0] = var_30_1

				local var_30_2 = var_30_1:GetComponentInChildren(typeof(CharacterEffect))

				var_30_2.enabled = true

				local var_30_3 = GameObjectTools.GetOrAddComponent(var_30_1, typeof(DynamicBoneHelper))

				if var_30_3 then
					var_30_3:EnableDynamicBone(false)
				end

				arg_27_1:ShowWeapon(var_30_2.transform, false)

				arg_27_1.var_[var_30_0 .. "Animator"] = var_30_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_27_1.var_[var_30_0 .. "Animator"].applyRootMotion = true
				arg_27_1.var_[var_30_0 .. "LipSync"] = var_30_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_30_4 = arg_27_1.actors_["1184ui_story"].transform
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos1184ui_story = var_30_4.localPosition
			end

			local var_30_6 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6
				local var_30_8 = Vector3.New(-0.7, -0.97, -6)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1184ui_story, var_30_8, var_30_7)

				local var_30_9 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_9.x, var_30_9.y, var_30_9.z)

				local var_30_10 = var_30_4.localEulerAngles

				var_30_10.z = 0
				var_30_10.x = 0
				var_30_4.localEulerAngles = var_30_10
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_4.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_4.localEulerAngles = var_30_12
			end

			local var_30_13 = arg_27_1.actors_["1184ui_story"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 and arg_27_1.var_.characterEffect1184ui_story == nil then
				arg_27_1.var_.characterEffect1184ui_story = var_30_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_15 = 0.2

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15

				if arg_27_1.var_.characterEffect1184ui_story then
					arg_27_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 and arg_27_1.var_.characterEffect1184ui_story then
				arg_27_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_30_17 = 0

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 then
				arg_27_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_30_18 = 0

			if var_30_18 < arg_27_1.time_ and arg_27_1.time_ <= var_30_18 + arg_30_0 then
				arg_27_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_30_19 = 0
			local var_30_20 = 0.825

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_21 = arg_27_1:FormatText(StoryNameCfg[6].name)

				arg_27_1.leftNameTxt_.text = var_30_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_22 = arg_27_1:GetWordFromCfg(120042007)
				local var_30_23 = arg_27_1:FormatText(var_30_22.content)

				arg_27_1.text_.text = var_30_23

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_24 = 33
				local var_30_25 = utf8.len(var_30_23)
				local var_30_26 = var_30_24 <= 0 and var_30_20 or var_30_20 * (var_30_25 / var_30_24)

				if var_30_26 > 0 and var_30_20 < var_30_26 then
					arg_27_1.talkMaxDuration = var_30_26

					if var_30_26 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_26 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_23
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042007", "story_v_out_120042.awb") ~= 0 then
					local var_30_27 = manager.audio:GetVoiceLength("story_v_out_120042", "120042007", "story_v_out_120042.awb") / 1000

					if var_30_27 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_19
					end

					if var_30_22.prefab_name ~= "" and arg_27_1.actors_[var_30_22.prefab_name] ~= nil then
						local var_30_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_22.prefab_name].transform, "story_v_out_120042", "120042007", "story_v_out_120042.awb")

						arg_27_1:RecordAudio("120042007", var_30_28)
						arg_27_1:RecordAudio("120042007", var_30_28)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_120042", "120042007", "story_v_out_120042.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_120042", "120042007", "story_v_out_120042.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_29 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_29 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_19) / var_30_29

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_19 + var_30_29 and arg_27_1.time_ < var_30_19 + var_30_29 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play120042008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 120042008
		arg_31_1.duration_ = 5.666

		local var_31_0 = {
			zh = 2.7,
			ja = 5.666
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
				arg_31_0:Play120042009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1069ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1069ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0.7, -1, -6)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1069ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0.7, -1, -6)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1069ui_story"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1069ui_story == nil then
				arg_31_1.var_.characterEffect1069ui_story = var_34_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_11 = 0.2

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.characterEffect1069ui_story then
					arg_31_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.characterEffect1069ui_story then
				arg_31_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_34_13 = arg_31_1.actors_["1184ui_story"]
			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 and arg_31_1.var_.characterEffect1184ui_story == nil then
				arg_31_1.var_.characterEffect1184ui_story = var_34_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_15 = 0.2

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_15 then
				local var_34_16 = (arg_31_1.time_ - var_34_14) / var_34_15

				if arg_31_1.var_.characterEffect1184ui_story then
					local var_34_17 = Mathf.Lerp(0, 0.5, var_34_16)

					arg_31_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1184ui_story.fillRatio = var_34_17
				end
			end

			if arg_31_1.time_ >= var_34_14 + var_34_15 and arg_31_1.time_ < var_34_14 + var_34_15 + arg_34_0 and arg_31_1.var_.characterEffect1184ui_story then
				local var_34_18 = 0.5

				arg_31_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1184ui_story.fillRatio = var_34_18
			end

			local var_34_19 = 0

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 then
				arg_31_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_34_20 = 0

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				arg_31_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_34_21 = 0

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_34_22 = 0
			local var_34_23 = 0.325

			if var_34_22 < arg_31_1.time_ and arg_31_1.time_ <= var_34_22 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_24 = arg_31_1:FormatText(StoryNameCfg[378].name)

				arg_31_1.leftNameTxt_.text = var_34_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_25 = arg_31_1:GetWordFromCfg(120042008)
				local var_34_26 = arg_31_1:FormatText(var_34_25.content)

				arg_31_1.text_.text = var_34_26

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_27 = 13
				local var_34_28 = utf8.len(var_34_26)
				local var_34_29 = var_34_27 <= 0 and var_34_23 or var_34_23 * (var_34_28 / var_34_27)

				if var_34_29 > 0 and var_34_23 < var_34_29 then
					arg_31_1.talkMaxDuration = var_34_29

					if var_34_29 + var_34_22 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_29 + var_34_22
					end
				end

				arg_31_1.text_.text = var_34_26
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042008", "story_v_out_120042.awb") ~= 0 then
					local var_34_30 = manager.audio:GetVoiceLength("story_v_out_120042", "120042008", "story_v_out_120042.awb") / 1000

					if var_34_30 + var_34_22 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_30 + var_34_22
					end

					if var_34_25.prefab_name ~= "" and arg_31_1.actors_[var_34_25.prefab_name] ~= nil then
						local var_34_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_25.prefab_name].transform, "story_v_out_120042", "120042008", "story_v_out_120042.awb")

						arg_31_1:RecordAudio("120042008", var_34_31)
						arg_31_1:RecordAudio("120042008", var_34_31)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_120042", "120042008", "story_v_out_120042.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_120042", "120042008", "story_v_out_120042.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_32 = math.max(var_34_23, arg_31_1.talkMaxDuration)

			if var_34_22 <= arg_31_1.time_ and arg_31_1.time_ < var_34_22 + var_34_32 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_22) / var_34_32

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_22 + var_34_32 and arg_31_1.time_ < var_34_22 + var_34_32 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play120042009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 120042009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play120042010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1069ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1069ui_story == nil then
				arg_35_1.var_.characterEffect1069ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1069ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1069ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1069ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1069ui_story.fillRatio = var_38_5
			end

			local var_38_6 = 0
			local var_38_7 = 0.575

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

				local var_38_9 = arg_35_1:GetWordFromCfg(120042009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 23
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
	Play120042010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 120042010
		arg_39_1.duration_ = 2.3

		local var_39_0 = {
			zh = 0.999999999999,
			ja = 2.3
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
				arg_39_0:Play120042011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1069ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1069ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0.7, -1, -6)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1069ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0.7, -1, -6)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1069ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1069ui_story == nil then
				arg_39_1.var_.characterEffect1069ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.2

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1069ui_story then
					arg_39_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1069ui_story then
				arg_39_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_42_13 = 0
			local var_42_14 = 0.075

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_15 = arg_39_1:FormatText(StoryNameCfg[378].name)

				arg_39_1.leftNameTxt_.text = var_42_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_16 = arg_39_1:GetWordFromCfg(120042010)
				local var_42_17 = arg_39_1:FormatText(var_42_16.content)

				arg_39_1.text_.text = var_42_17

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_18 = 3
				local var_42_19 = utf8.len(var_42_17)
				local var_42_20 = var_42_18 <= 0 and var_42_14 or var_42_14 * (var_42_19 / var_42_18)

				if var_42_20 > 0 and var_42_14 < var_42_20 then
					arg_39_1.talkMaxDuration = var_42_20

					if var_42_20 + var_42_13 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_13
					end
				end

				arg_39_1.text_.text = var_42_17
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042010", "story_v_out_120042.awb") ~= 0 then
					local var_42_21 = manager.audio:GetVoiceLength("story_v_out_120042", "120042010", "story_v_out_120042.awb") / 1000

					if var_42_21 + var_42_13 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_21 + var_42_13
					end

					if var_42_16.prefab_name ~= "" and arg_39_1.actors_[var_42_16.prefab_name] ~= nil then
						local var_42_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_16.prefab_name].transform, "story_v_out_120042", "120042010", "story_v_out_120042.awb")

						arg_39_1:RecordAudio("120042010", var_42_22)
						arg_39_1:RecordAudio("120042010", var_42_22)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_120042", "120042010", "story_v_out_120042.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_120042", "120042010", "story_v_out_120042.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_23 = math.max(var_42_14, arg_39_1.talkMaxDuration)

			if var_42_13 <= arg_39_1.time_ and arg_39_1.time_ < var_42_13 + var_42_23 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_13) / var_42_23

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_13 + var_42_23 and arg_39_1.time_ < var_42_13 + var_42_23 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play120042011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 120042011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play120042012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1069ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1069ui_story == nil then
				arg_43_1.var_.characterEffect1069ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1069ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1069ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1069ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1069ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0
			local var_46_7 = 0.425

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_8 = arg_43_1:GetWordFromCfg(120042011)
				local var_46_9 = arg_43_1:FormatText(var_46_8.content)

				arg_43_1.text_.text = var_46_9

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_10 = 17
				local var_46_11 = utf8.len(var_46_9)
				local var_46_12 = var_46_10 <= 0 and var_46_7 or var_46_7 * (var_46_11 / var_46_10)

				if var_46_12 > 0 and var_46_7 < var_46_12 then
					arg_43_1.talkMaxDuration = var_46_12

					if var_46_12 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_9
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_13 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_13 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_13

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_13 and arg_43_1.time_ < var_46_6 + var_46_13 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play120042012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 120042012
		arg_47_1.duration_ = 2.9

		local var_47_0 = {
			zh = 1.3,
			ja = 2.9
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
				arg_47_0:Play120042013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1069ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1069ui_story == nil then
				arg_47_1.var_.characterEffect1069ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1069ui_story then
					arg_47_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1069ui_story then
				arg_47_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_50_4 = 0
			local var_50_5 = 0.15

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_6 = arg_47_1:FormatText(StoryNameCfg[378].name)

				arg_47_1.leftNameTxt_.text = var_50_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_7 = arg_47_1:GetWordFromCfg(120042012)
				local var_50_8 = arg_47_1:FormatText(var_50_7.content)

				arg_47_1.text_.text = var_50_8

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_9 = 6
				local var_50_10 = utf8.len(var_50_8)
				local var_50_11 = var_50_9 <= 0 and var_50_5 or var_50_5 * (var_50_10 / var_50_9)

				if var_50_11 > 0 and var_50_5 < var_50_11 then
					arg_47_1.talkMaxDuration = var_50_11

					if var_50_11 + var_50_4 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_11 + var_50_4
					end
				end

				arg_47_1.text_.text = var_50_8
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042012", "story_v_out_120042.awb") ~= 0 then
					local var_50_12 = manager.audio:GetVoiceLength("story_v_out_120042", "120042012", "story_v_out_120042.awb") / 1000

					if var_50_12 + var_50_4 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_12 + var_50_4
					end

					if var_50_7.prefab_name ~= "" and arg_47_1.actors_[var_50_7.prefab_name] ~= nil then
						local var_50_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_7.prefab_name].transform, "story_v_out_120042", "120042012", "story_v_out_120042.awb")

						arg_47_1:RecordAudio("120042012", var_50_13)
						arg_47_1:RecordAudio("120042012", var_50_13)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_120042", "120042012", "story_v_out_120042.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_120042", "120042012", "story_v_out_120042.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_14 = math.max(var_50_5, arg_47_1.talkMaxDuration)

			if var_50_4 <= arg_47_1.time_ and arg_47_1.time_ < var_50_4 + var_50_14 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_4) / var_50_14

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_4 + var_50_14 and arg_47_1.time_ < var_50_4 + var_50_14 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play120042013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 120042013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play120042014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1184ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1184ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, 100, 0)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1184ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, 100, 0)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["1069ui_story"].transform
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.var_.moveOldPos1069ui_story = var_54_9.localPosition
			end

			local var_54_11 = 0.001

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11
				local var_54_13 = Vector3.New(0, 100, 0)

				var_54_9.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1069ui_story, var_54_13, var_54_12)

				local var_54_14 = manager.ui.mainCamera.transform.position - var_54_9.position

				var_54_9.forward = Vector3.New(var_54_14.x, var_54_14.y, var_54_14.z)

				local var_54_15 = var_54_9.localEulerAngles

				var_54_15.z = 0
				var_54_15.x = 0
				var_54_9.localEulerAngles = var_54_15
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 then
				var_54_9.localPosition = Vector3.New(0, 100, 0)

				local var_54_16 = manager.ui.mainCamera.transform.position - var_54_9.position

				var_54_9.forward = Vector3.New(var_54_16.x, var_54_16.y, var_54_16.z)

				local var_54_17 = var_54_9.localEulerAngles

				var_54_17.z = 0
				var_54_17.x = 0
				var_54_9.localEulerAngles = var_54_17
			end

			local var_54_18 = 0
			local var_54_19 = 1.15

			if var_54_18 < arg_51_1.time_ and arg_51_1.time_ <= var_54_18 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_20 = arg_51_1:GetWordFromCfg(120042013)
				local var_54_21 = arg_51_1:FormatText(var_54_20.content)

				arg_51_1.text_.text = var_54_21

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_22 = 46
				local var_54_23 = utf8.len(var_54_21)
				local var_54_24 = var_54_22 <= 0 and var_54_19 or var_54_19 * (var_54_23 / var_54_22)

				if var_54_24 > 0 and var_54_19 < var_54_24 then
					arg_51_1.talkMaxDuration = var_54_24

					if var_54_24 + var_54_18 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_24 + var_54_18
					end
				end

				arg_51_1.text_.text = var_54_21
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_25 = math.max(var_54_19, arg_51_1.talkMaxDuration)

			if var_54_18 <= arg_51_1.time_ and arg_51_1.time_ < var_54_18 + var_54_25 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_18) / var_54_25

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_18 + var_54_25 and arg_51_1.time_ < var_54_18 + var_54_25 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play120042014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120042014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play120042015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.4

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

				local var_58_2 = arg_55_1:GetWordFromCfg(120042014)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 56
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
	Play120042015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 120042015
		arg_59_1.duration_ = 1.999999999999

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play120042016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1184ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1184ui_story = var_62_0.localPosition

				local var_62_2 = "1184ui_story"

				arg_59_1:ShowWeapon(arg_59_1.var_[var_62_2 .. "Animator"].transform, true)
			end

			local var_62_3 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_3 then
				local var_62_4 = (arg_59_1.time_ - var_62_1) / var_62_3
				local var_62_5 = Vector3.New(0, -0.97, -6)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1184ui_story, var_62_5, var_62_4)

				local var_62_6 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_6.x, var_62_6.y, var_62_6.z)

				local var_62_7 = var_62_0.localEulerAngles

				var_62_7.z = 0
				var_62_7.x = 0
				var_62_0.localEulerAngles = var_62_7
			end

			if arg_59_1.time_ >= var_62_1 + var_62_3 and arg_59_1.time_ < var_62_1 + var_62_3 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_62_8 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_8.x, var_62_8.y, var_62_8.z)

				local var_62_9 = var_62_0.localEulerAngles

				var_62_9.z = 0
				var_62_9.x = 0
				var_62_0.localEulerAngles = var_62_9
			end

			local var_62_10 = arg_59_1.actors_["1184ui_story"]
			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect1184ui_story == nil then
				arg_59_1.var_.characterEffect1184ui_story = var_62_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_12 = 0.2

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_12 then
				local var_62_13 = (arg_59_1.time_ - var_62_11) / var_62_12

				if arg_59_1.var_.characterEffect1184ui_story then
					arg_59_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_11 + var_62_12 and arg_59_1.time_ < var_62_11 + var_62_12 + arg_62_0 and arg_59_1.var_.characterEffect1184ui_story then
				arg_59_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_62_15 = 0

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 then
				arg_59_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_62_16 = 0
			local var_62_17 = 0.125

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_18 = arg_59_1:FormatText(StoryNameCfg[6].name)

				arg_59_1.leftNameTxt_.text = var_62_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_19 = arg_59_1:GetWordFromCfg(120042015)
				local var_62_20 = arg_59_1:FormatText(var_62_19.content)

				arg_59_1.text_.text = var_62_20

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_21 = 5
				local var_62_22 = utf8.len(var_62_20)
				local var_62_23 = var_62_21 <= 0 and var_62_17 or var_62_17 * (var_62_22 / var_62_21)

				if var_62_23 > 0 and var_62_17 < var_62_23 then
					arg_59_1.talkMaxDuration = var_62_23

					if var_62_23 + var_62_16 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_23 + var_62_16
					end
				end

				arg_59_1.text_.text = var_62_20
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042015", "story_v_out_120042.awb") ~= 0 then
					local var_62_24 = manager.audio:GetVoiceLength("story_v_out_120042", "120042015", "story_v_out_120042.awb") / 1000

					if var_62_24 + var_62_16 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_24 + var_62_16
					end

					if var_62_19.prefab_name ~= "" and arg_59_1.actors_[var_62_19.prefab_name] ~= nil then
						local var_62_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_19.prefab_name].transform, "story_v_out_120042", "120042015", "story_v_out_120042.awb")

						arg_59_1:RecordAudio("120042015", var_62_25)
						arg_59_1:RecordAudio("120042015", var_62_25)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_120042", "120042015", "story_v_out_120042.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_120042", "120042015", "story_v_out_120042.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_26 = math.max(var_62_17, arg_59_1.talkMaxDuration)

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_26 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_16) / var_62_26

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_16 + var_62_26 and arg_59_1.time_ < var_62_16 + var_62_26 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play120042016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 120042016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play120042017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1184ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1184ui_story = var_66_0.localPosition

				local var_66_2 = "1184ui_story"

				arg_63_1:ShowWeapon(arg_63_1.var_[var_66_2 .. "Animator"].transform, false)
			end

			local var_66_3 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_3 then
				local var_66_4 = (arg_63_1.time_ - var_66_1) / var_66_3
				local var_66_5 = Vector3.New(0, 100, 0)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1184ui_story, var_66_5, var_66_4)

				local var_66_6 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_6.x, var_66_6.y, var_66_6.z)

				local var_66_7 = var_66_0.localEulerAngles

				var_66_7.z = 0
				var_66_7.x = 0
				var_66_0.localEulerAngles = var_66_7
			end

			if arg_63_1.time_ >= var_66_1 + var_66_3 and arg_63_1.time_ < var_66_1 + var_66_3 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, 100, 0)

				local var_66_8 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_8.x, var_66_8.y, var_66_8.z)

				local var_66_9 = var_66_0.localEulerAngles

				var_66_9.z = 0
				var_66_9.x = 0
				var_66_0.localEulerAngles = var_66_9
			end

			local var_66_10 = 0
			local var_66_11 = 0.4

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_12 = arg_63_1:GetWordFromCfg(120042016)
				local var_66_13 = arg_63_1:FormatText(var_66_12.content)

				arg_63_1.text_.text = var_66_13

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_14 = 16
				local var_66_15 = utf8.len(var_66_13)
				local var_66_16 = var_66_14 <= 0 and var_66_11 or var_66_11 * (var_66_15 / var_66_14)

				if var_66_16 > 0 and var_66_11 < var_66_16 then
					arg_63_1.talkMaxDuration = var_66_16

					if var_66_16 + var_66_10 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_16 + var_66_10
					end
				end

				arg_63_1.text_.text = var_66_13
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_17 = math.max(var_66_11, arg_63_1.talkMaxDuration)

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_17 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_10) / var_66_17

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_10 + var_66_17 and arg_63_1.time_ < var_66_10 + var_66_17 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play120042017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 120042017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play120042018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.8

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_2 = arg_67_1:GetWordFromCfg(120042017)
				local var_70_3 = arg_67_1:FormatText(var_70_2.content)

				arg_67_1.text_.text = var_70_3

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_4 = 32
				local var_70_5 = utf8.len(var_70_3)
				local var_70_6 = var_70_4 <= 0 and var_70_1 or var_70_1 * (var_70_5 / var_70_4)

				if var_70_6 > 0 and var_70_1 < var_70_6 then
					arg_67_1.talkMaxDuration = var_70_6

					if var_70_6 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_6 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_3
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_7 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_7 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_7

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_7 and arg_67_1.time_ < var_70_0 + var_70_7 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play120042018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 120042018
		arg_71_1.duration_ = 6.866

		local var_71_0 = {
			zh = 6.433,
			ja = 6.866
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
				arg_71_0:Play120042019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = "XH0104a"

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
				local var_74_5 = arg_71_1.bgs_.XH0104a

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
					if iter_74_0 ~= "XH0104a" then
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

			local var_74_27 = arg_71_1.bgs_.XH0104a.transform
			local var_74_28 = 2

			if var_74_28 < arg_71_1.time_ and arg_71_1.time_ <= var_74_28 + arg_74_0 then
				arg_71_1.var_.moveOldPosXH0104a = var_74_27.localPosition
			end

			local var_74_29 = 0.001

			if var_74_28 <= arg_71_1.time_ and arg_71_1.time_ < var_74_28 + var_74_29 then
				local var_74_30 = (arg_71_1.time_ - var_74_28) / var_74_29
				local var_74_31 = Vector3.New(0, 1, 9.5)

				var_74_27.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPosXH0104a, var_74_31, var_74_30)
			end

			if arg_71_1.time_ >= var_74_28 + var_74_29 and arg_71_1.time_ < var_74_28 + var_74_29 + arg_74_0 then
				var_74_27.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_74_32 = arg_71_1.bgs_.XH0104a.transform
			local var_74_33 = 2.01666666666667

			if var_74_33 < arg_71_1.time_ and arg_71_1.time_ <= var_74_33 + arg_74_0 then
				arg_71_1.var_.moveOldPosXH0104a = var_74_32.localPosition
			end

			local var_74_34 = 3.5

			if var_74_33 <= arg_71_1.time_ and arg_71_1.time_ < var_74_33 + var_74_34 then
				local var_74_35 = (arg_71_1.time_ - var_74_33) / var_74_34
				local var_74_36 = Vector3.New(0, 1, 10)

				var_74_32.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPosXH0104a, var_74_36, var_74_35)
			end

			if arg_71_1.time_ >= var_74_33 + var_74_34 and arg_71_1.time_ < var_74_33 + var_74_34 + arg_74_0 then
				var_74_32.localPosition = Vector3.New(0, 1, 10)
			end

			local var_74_37 = 4

			if var_74_37 < arg_71_1.time_ and arg_71_1.time_ <= var_74_37 + arg_74_0 then
				arg_71_1.allBtn_.enabled = false
			end

			local var_74_38 = 1.5

			if arg_71_1.time_ >= var_74_37 + var_74_38 and arg_71_1.time_ < var_74_37 + var_74_38 + arg_74_0 then
				arg_71_1.allBtn_.enabled = true
			end

			if arg_71_1.frameCnt_ <= 1 then
				arg_71_1.dialog_:SetActive(false)
			end

			local var_74_39 = 4
			local var_74_40 = 0.2

			if var_74_39 < arg_71_1.time_ and arg_71_1.time_ <= var_74_39 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				arg_71_1.dialog_:SetActive(true)

				local var_74_41 = LeanTween.value(arg_71_1.dialog_, 0, 1, 0.3)

				var_74_41:setOnUpdate(LuaHelper.FloatAction(function(arg_75_0)
					arg_71_1.dialogCg_.alpha = arg_75_0
				end))
				var_74_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_71_1.dialog_)
					var_74_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_71_1.duration_ = arg_71_1.duration_ + 0.3

				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_42 = arg_71_1:FormatText(StoryNameCfg[36].name)

				arg_71_1.leftNameTxt_.text = var_74_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_43 = arg_71_1:GetWordFromCfg(120042018)
				local var_74_44 = arg_71_1:FormatText(var_74_43.content)

				arg_71_1.text_.text = var_74_44

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_45 = 8
				local var_74_46 = utf8.len(var_74_44)
				local var_74_47 = var_74_45 <= 0 and var_74_40 or var_74_40 * (var_74_46 / var_74_45)

				if var_74_47 > 0 and var_74_40 < var_74_47 then
					arg_71_1.talkMaxDuration = var_74_47
					var_74_39 = var_74_39 + 0.3

					if var_74_47 + var_74_39 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_47 + var_74_39
					end
				end

				arg_71_1.text_.text = var_74_44
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042018", "story_v_out_120042.awb") ~= 0 then
					local var_74_48 = manager.audio:GetVoiceLength("story_v_out_120042", "120042018", "story_v_out_120042.awb") / 1000

					if var_74_48 + var_74_39 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_48 + var_74_39
					end

					if var_74_43.prefab_name ~= "" and arg_71_1.actors_[var_74_43.prefab_name] ~= nil then
						local var_74_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_43.prefab_name].transform, "story_v_out_120042", "120042018", "story_v_out_120042.awb")

						arg_71_1:RecordAudio("120042018", var_74_49)
						arg_71_1:RecordAudio("120042018", var_74_49)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_120042", "120042018", "story_v_out_120042.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_120042", "120042018", "story_v_out_120042.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_50 = var_74_39 + 0.3
			local var_74_51 = math.max(var_74_40, arg_71_1.talkMaxDuration)

			if var_74_50 <= arg_71_1.time_ and arg_71_1.time_ < var_74_50 + var_74_51 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_50) / var_74_51

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_50 + var_74_51 and arg_71_1.time_ < var_74_50 + var_74_51 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play120042019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 120042019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play120042020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.575

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

				local var_80_2 = arg_77_1:GetWordFromCfg(120042019)
				local var_80_3 = arg_77_1:FormatText(var_80_2.content)

				arg_77_1.text_.text = var_80_3

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_4 = 23
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
	Play120042020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 120042020
		arg_81_1.duration_ = 7.733

		local var_81_0 = {
			zh = 7.733,
			ja = 6.9
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
				arg_81_0:Play120042021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.9

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

				local var_84_3 = arg_81_1:GetWordFromCfg(120042020)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042020", "story_v_out_120042.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042020", "story_v_out_120042.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_120042", "120042020", "story_v_out_120042.awb")

						arg_81_1:RecordAudio("120042020", var_84_9)
						arg_81_1:RecordAudio("120042020", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_120042", "120042020", "story_v_out_120042.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_120042", "120042020", "story_v_out_120042.awb")
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
	Play120042021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 120042021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play120042022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.975

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

				local var_88_2 = arg_85_1:GetWordFromCfg(120042021)
				local var_88_3 = arg_85_1:FormatText(var_88_2.content)

				arg_85_1.text_.text = var_88_3

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_4 = 39
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
	Play120042022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 120042022
		arg_89_1.duration_ = 5.533

		local var_89_0 = {
			zh = 3.666,
			ja = 5.533
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
				arg_89_0:Play120042023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.375

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[36].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(120042022)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042022", "story_v_out_120042.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042022", "story_v_out_120042.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_120042", "120042022", "story_v_out_120042.awb")

						arg_89_1:RecordAudio("120042022", var_92_9)
						arg_89_1:RecordAudio("120042022", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_120042", "120042022", "story_v_out_120042.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_120042", "120042022", "story_v_out_120042.awb")
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
	Play120042023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 120042023
		arg_93_1.duration_ = 9

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play120042024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = "XH0104"

			if arg_93_1.bgs_[var_96_0] == nil then
				local var_96_1 = Object.Instantiate(arg_93_1.paintGo_)

				var_96_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_96_0)
				var_96_1.name = var_96_0
				var_96_1.transform.parent = arg_93_1.stage_.transform
				var_96_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_93_1.bgs_[var_96_0] = var_96_1
			end

			local var_96_2 = 2

			if var_96_2 < arg_93_1.time_ and arg_93_1.time_ <= var_96_2 + arg_96_0 then
				local var_96_3 = manager.ui.mainCamera.transform.localPosition
				local var_96_4 = Vector3.New(0, 0, 10) + Vector3.New(var_96_3.x, var_96_3.y, 0)
				local var_96_5 = arg_93_1.bgs_.XH0104

				var_96_5.transform.localPosition = var_96_4
				var_96_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_96_6 = var_96_5:GetComponent("SpriteRenderer")

				if var_96_6 and var_96_6.sprite then
					local var_96_7 = (var_96_5.transform.localPosition - var_96_3).z
					local var_96_8 = manager.ui.mainCameraCom_
					local var_96_9 = 2 * var_96_7 * Mathf.Tan(var_96_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_96_10 = var_96_9 * var_96_8.aspect
					local var_96_11 = var_96_6.sprite.bounds.size.x
					local var_96_12 = var_96_6.sprite.bounds.size.y
					local var_96_13 = var_96_10 / var_96_11
					local var_96_14 = var_96_9 / var_96_12
					local var_96_15 = var_96_14 < var_96_13 and var_96_13 or var_96_14

					var_96_5.transform.localScale = Vector3.New(var_96_15, var_96_15, 0)
				end

				for iter_96_0, iter_96_1 in pairs(arg_93_1.bgs_) do
					if iter_96_0 ~= "XH0104" then
						iter_96_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_96_16 = 0

			if var_96_16 < arg_93_1.time_ and arg_93_1.time_ <= var_96_16 + arg_96_0 then
				arg_93_1.mask_.enabled = true
				arg_93_1.mask_.raycastTarget = true

				arg_93_1:SetGaussion(false)
			end

			local var_96_17 = 2

			if var_96_16 <= arg_93_1.time_ and arg_93_1.time_ < var_96_16 + var_96_17 then
				local var_96_18 = (arg_93_1.time_ - var_96_16) / var_96_17
				local var_96_19 = Color.New(0, 0, 0)

				var_96_19.a = Mathf.Lerp(0, 1, var_96_18)
				arg_93_1.mask_.color = var_96_19
			end

			if arg_93_1.time_ >= var_96_16 + var_96_17 and arg_93_1.time_ < var_96_16 + var_96_17 + arg_96_0 then
				local var_96_20 = Color.New(0, 0, 0)

				var_96_20.a = 1
				arg_93_1.mask_.color = var_96_20
			end

			local var_96_21 = 2

			if var_96_21 < arg_93_1.time_ and arg_93_1.time_ <= var_96_21 + arg_96_0 then
				arg_93_1.mask_.enabled = true
				arg_93_1.mask_.raycastTarget = true

				arg_93_1:SetGaussion(false)
			end

			local var_96_22 = 2

			if var_96_21 <= arg_93_1.time_ and arg_93_1.time_ < var_96_21 + var_96_22 then
				local var_96_23 = (arg_93_1.time_ - var_96_21) / var_96_22
				local var_96_24 = Color.New(0, 0, 0)

				var_96_24.a = Mathf.Lerp(1, 0, var_96_23)
				arg_93_1.mask_.color = var_96_24
			end

			if arg_93_1.time_ >= var_96_21 + var_96_22 and arg_93_1.time_ < var_96_21 + var_96_22 + arg_96_0 then
				local var_96_25 = Color.New(0, 0, 0)
				local var_96_26 = 0

				arg_93_1.mask_.enabled = false
				var_96_25.a = var_96_26
				arg_93_1.mask_.color = var_96_25
			end

			if arg_93_1.frameCnt_ <= 1 then
				arg_93_1.dialog_:SetActive(false)
			end

			local var_96_27 = 4
			local var_96_28 = 0.925

			if var_96_27 < arg_93_1.time_ and arg_93_1.time_ <= var_96_27 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0

				arg_93_1.dialog_:SetActive(true)

				local var_96_29 = LeanTween.value(arg_93_1.dialog_, 0, 1, 0.3)

				var_96_29:setOnUpdate(LuaHelper.FloatAction(function(arg_97_0)
					arg_93_1.dialogCg_.alpha = arg_97_0
				end))
				var_96_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_93_1.dialog_)
					var_96_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_93_1.duration_ = arg_93_1.duration_ + 0.3

				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_30 = arg_93_1:GetWordFromCfg(120042023)
				local var_96_31 = arg_93_1:FormatText(var_96_30.content)

				arg_93_1.text_.text = var_96_31

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_32 = 37
				local var_96_33 = utf8.len(var_96_31)
				local var_96_34 = var_96_32 <= 0 and var_96_28 or var_96_28 * (var_96_33 / var_96_32)

				if var_96_34 > 0 and var_96_28 < var_96_34 then
					arg_93_1.talkMaxDuration = var_96_34
					var_96_27 = var_96_27 + 0.3

					if var_96_34 + var_96_27 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_34 + var_96_27
					end
				end

				arg_93_1.text_.text = var_96_31
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_35 = var_96_27 + 0.3
			local var_96_36 = math.max(var_96_28, arg_93_1.talkMaxDuration)

			if var_96_35 <= arg_93_1.time_ and arg_93_1.time_ < var_96_35 + var_96_36 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_35) / var_96_36

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_35 + var_96_36 and arg_93_1.time_ < var_96_35 + var_96_36 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play120042024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 120042024
		arg_99_1.duration_ = 3.7

		local var_99_0 = {
			zh = 3.7,
			ja = 2.4
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
				arg_99_0:Play120042025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.275

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[6].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(120042024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 11
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042024", "story_v_out_120042.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042024", "story_v_out_120042.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_120042", "120042024", "story_v_out_120042.awb")

						arg_99_1:RecordAudio("120042024", var_102_9)
						arg_99_1:RecordAudio("120042024", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_120042", "120042024", "story_v_out_120042.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_120042", "120042024", "story_v_out_120042.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play120042025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 120042025
		arg_103_1.duration_ = 9.6

		local var_103_0 = {
			zh = 3.533,
			ja = 9.6
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
				arg_103_0:Play120042026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.425

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[378].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, true)
				arg_103_1.iconController_:SetSelectedState("hero")

				arg_103_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(120042025)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 17
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042025", "story_v_out_120042.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042025", "story_v_out_120042.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_120042", "120042025", "story_v_out_120042.awb")

						arg_103_1:RecordAudio("120042025", var_106_9)
						arg_103_1:RecordAudio("120042025", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_120042", "120042025", "story_v_out_120042.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_120042", "120042025", "story_v_out_120042.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play120042026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 120042026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play120042027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.85

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[7].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(120042026)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 34
				local var_110_6 = utf8.len(var_110_4)
				local var_110_7 = var_110_5 <= 0 and var_110_1 or var_110_1 * (var_110_6 / var_110_5)

				if var_110_7 > 0 and var_110_1 < var_110_7 then
					arg_107_1.talkMaxDuration = var_110_7

					if var_110_7 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_7 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_4
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_8 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_8 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_8

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_8 and arg_107_1.time_ < var_110_0 + var_110_8 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play120042027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 120042027
		arg_111_1.duration_ = 6.1

		local var_111_0 = {
			zh = 6.1,
			ja = 5.1
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
				arg_111_0:Play120042028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.675

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[6].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(120042027)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 27
				local var_114_6 = utf8.len(var_114_4)
				local var_114_7 = var_114_5 <= 0 and var_114_1 or var_114_1 * (var_114_6 / var_114_5)

				if var_114_7 > 0 and var_114_1 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_4
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042027", "story_v_out_120042.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042027", "story_v_out_120042.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_120042", "120042027", "story_v_out_120042.awb")

						arg_111_1:RecordAudio("120042027", var_114_9)
						arg_111_1:RecordAudio("120042027", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_120042", "120042027", "story_v_out_120042.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_120042", "120042027", "story_v_out_120042.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_10 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_10 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_10

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_10 and arg_111_1.time_ < var_114_0 + var_114_10 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play120042028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 120042028
		arg_115_1.duration_ = 7.066

		local var_115_0 = {
			zh = 7.066,
			ja = 4.966
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
				arg_115_0:Play120042029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.875

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[384].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(120042028)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042028", "story_v_out_120042.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042028", "story_v_out_120042.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_120042", "120042028", "story_v_out_120042.awb")

						arg_115_1:RecordAudio("120042028", var_118_9)
						arg_115_1:RecordAudio("120042028", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_120042", "120042028", "story_v_out_120042.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_120042", "120042028", "story_v_out_120042.awb")
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
	Play120042029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 120042029
		arg_119_1.duration_ = 13.266

		local var_119_0 = {
			zh = 12.766,
			ja = 13.266
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
				arg_119_0:Play120042030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 1.5

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[384].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(120042029)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 60
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

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042029", "story_v_out_120042.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042029", "story_v_out_120042.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_120042", "120042029", "story_v_out_120042.awb")

						arg_119_1:RecordAudio("120042029", var_122_9)
						arg_119_1:RecordAudio("120042029", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_120042", "120042029", "story_v_out_120042.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_120042", "120042029", "story_v_out_120042.awb")
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
	Play120042030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 120042030
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play120042031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 1.125

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_2 = arg_123_1:GetWordFromCfg(120042030)
				local var_126_3 = arg_123_1:FormatText(var_126_2.content)

				arg_123_1.text_.text = var_126_3

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_4 = 45
				local var_126_5 = utf8.len(var_126_3)
				local var_126_6 = var_126_4 <= 0 and var_126_1 or var_126_1 * (var_126_5 / var_126_4)

				if var_126_6 > 0 and var_126_1 < var_126_6 then
					arg_123_1.talkMaxDuration = var_126_6

					if var_126_6 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_6 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_3
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_7 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_7 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_7

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_7 and arg_123_1.time_ < var_126_0 + var_126_7 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play120042031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 120042031
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play120042032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.275

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_2 = arg_127_1:GetWordFromCfg(120042031)
				local var_130_3 = arg_127_1:FormatText(var_130_2.content)

				arg_127_1.text_.text = var_130_3

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_4 = 11
				local var_130_5 = utf8.len(var_130_3)
				local var_130_6 = var_130_4 <= 0 and var_130_1 or var_130_1 * (var_130_5 / var_130_4)

				if var_130_6 > 0 and var_130_1 < var_130_6 then
					arg_127_1.talkMaxDuration = var_130_6

					if var_130_6 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_6 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_3
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_7 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_7 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_7

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_7 and arg_127_1.time_ < var_130_0 + var_130_7 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play120042032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 120042032
		arg_131_1.duration_ = 14.566

		local var_131_0 = {
			zh = 11.866,
			ja = 14.566
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
				arg_131_0:Play120042033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 2

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				local var_134_1 = manager.ui.mainCamera.transform.localPosition
				local var_134_2 = Vector3.New(0, 0, 10) + Vector3.New(var_134_1.x, var_134_1.y, 0)
				local var_134_3 = arg_131_1.bgs_.J02i

				var_134_3.transform.localPosition = var_134_2
				var_134_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_134_4 = var_134_3:GetComponent("SpriteRenderer")

				if var_134_4 and var_134_4.sprite then
					local var_134_5 = (var_134_3.transform.localPosition - var_134_1).z
					local var_134_6 = manager.ui.mainCameraCom_
					local var_134_7 = 2 * var_134_5 * Mathf.Tan(var_134_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_134_8 = var_134_7 * var_134_6.aspect
					local var_134_9 = var_134_4.sprite.bounds.size.x
					local var_134_10 = var_134_4.sprite.bounds.size.y
					local var_134_11 = var_134_8 / var_134_9
					local var_134_12 = var_134_7 / var_134_10
					local var_134_13 = var_134_12 < var_134_11 and var_134_11 or var_134_12

					var_134_3.transform.localScale = Vector3.New(var_134_13, var_134_13, 0)
				end

				for iter_134_0, iter_134_1 in pairs(arg_131_1.bgs_) do
					if iter_134_0 ~= "J02i" then
						iter_134_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_15 = 2

			if var_134_14 <= arg_131_1.time_ and arg_131_1.time_ < var_134_14 + var_134_15 then
				local var_134_16 = (arg_131_1.time_ - var_134_14) / var_134_15
				local var_134_17 = Color.New(0, 0, 0)

				var_134_17.a = Mathf.Lerp(0, 1, var_134_16)
				arg_131_1.mask_.color = var_134_17
			end

			if arg_131_1.time_ >= var_134_14 + var_134_15 and arg_131_1.time_ < var_134_14 + var_134_15 + arg_134_0 then
				local var_134_18 = Color.New(0, 0, 0)

				var_134_18.a = 1
				arg_131_1.mask_.color = var_134_18
			end

			local var_134_19 = 2

			if var_134_19 < arg_131_1.time_ and arg_131_1.time_ <= var_134_19 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_20 = 2

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_20 then
				local var_134_21 = (arg_131_1.time_ - var_134_19) / var_134_20
				local var_134_22 = Color.New(0, 0, 0)

				var_134_22.a = Mathf.Lerp(1, 0, var_134_21)
				arg_131_1.mask_.color = var_134_22
			end

			if arg_131_1.time_ >= var_134_19 + var_134_20 and arg_131_1.time_ < var_134_19 + var_134_20 + arg_134_0 then
				local var_134_23 = Color.New(0, 0, 0)
				local var_134_24 = 0

				arg_131_1.mask_.enabled = false
				var_134_23.a = var_134_24
				arg_131_1.mask_.color = var_134_23
			end

			local var_134_25 = "1071ui_story"

			if arg_131_1.actors_[var_134_25] == nil then
				local var_134_26 = Object.Instantiate(Asset.Load("Char/" .. var_134_25), arg_131_1.stage_.transform)

				var_134_26.name = var_134_25
				var_134_26.transform.localPosition = Vector3.New(0, 100, 0)
				arg_131_1.actors_[var_134_25] = var_134_26

				local var_134_27 = var_134_26:GetComponentInChildren(typeof(CharacterEffect))

				var_134_27.enabled = true

				local var_134_28 = GameObjectTools.GetOrAddComponent(var_134_26, typeof(DynamicBoneHelper))

				if var_134_28 then
					var_134_28:EnableDynamicBone(false)
				end

				arg_131_1:ShowWeapon(var_134_27.transform, false)

				arg_131_1.var_[var_134_25 .. "Animator"] = var_134_27.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_131_1.var_[var_134_25 .. "Animator"].applyRootMotion = true
				arg_131_1.var_[var_134_25 .. "LipSync"] = var_134_27.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_134_29 = arg_131_1.actors_["1071ui_story"].transform
			local var_134_30 = 4

			if var_134_30 < arg_131_1.time_ and arg_131_1.time_ <= var_134_30 + arg_134_0 then
				arg_131_1.var_.moveOldPos1071ui_story = var_134_29.localPosition
			end

			local var_134_31 = 0.001

			if var_134_30 <= arg_131_1.time_ and arg_131_1.time_ < var_134_30 + var_134_31 then
				local var_134_32 = (arg_131_1.time_ - var_134_30) / var_134_31
				local var_134_33 = Vector3.New(-0.7, -1.05, -6.2)

				var_134_29.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1071ui_story, var_134_33, var_134_32)

				local var_134_34 = manager.ui.mainCamera.transform.position - var_134_29.position

				var_134_29.forward = Vector3.New(var_134_34.x, var_134_34.y, var_134_34.z)

				local var_134_35 = var_134_29.localEulerAngles

				var_134_35.z = 0
				var_134_35.x = 0
				var_134_29.localEulerAngles = var_134_35
			end

			if arg_131_1.time_ >= var_134_30 + var_134_31 and arg_131_1.time_ < var_134_30 + var_134_31 + arg_134_0 then
				var_134_29.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_134_36 = manager.ui.mainCamera.transform.position - var_134_29.position

				var_134_29.forward = Vector3.New(var_134_36.x, var_134_36.y, var_134_36.z)

				local var_134_37 = var_134_29.localEulerAngles

				var_134_37.z = 0
				var_134_37.x = 0
				var_134_29.localEulerAngles = var_134_37
			end

			local var_134_38 = arg_131_1.actors_["1069ui_story"].transform
			local var_134_39 = 4

			if var_134_39 < arg_131_1.time_ and arg_131_1.time_ <= var_134_39 + arg_134_0 then
				arg_131_1.var_.moveOldPos1069ui_story = var_134_38.localPosition
			end

			local var_134_40 = 0.001

			if var_134_39 <= arg_131_1.time_ and arg_131_1.time_ < var_134_39 + var_134_40 then
				local var_134_41 = (arg_131_1.time_ - var_134_39) / var_134_40
				local var_134_42 = Vector3.New(0.7, -1, -6)

				var_134_38.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1069ui_story, var_134_42, var_134_41)

				local var_134_43 = manager.ui.mainCamera.transform.position - var_134_38.position

				var_134_38.forward = Vector3.New(var_134_43.x, var_134_43.y, var_134_43.z)

				local var_134_44 = var_134_38.localEulerAngles

				var_134_44.z = 0
				var_134_44.x = 0
				var_134_38.localEulerAngles = var_134_44
			end

			if arg_131_1.time_ >= var_134_39 + var_134_40 and arg_131_1.time_ < var_134_39 + var_134_40 + arg_134_0 then
				var_134_38.localPosition = Vector3.New(0.7, -1, -6)

				local var_134_45 = manager.ui.mainCamera.transform.position - var_134_38.position

				var_134_38.forward = Vector3.New(var_134_45.x, var_134_45.y, var_134_45.z)

				local var_134_46 = var_134_38.localEulerAngles

				var_134_46.z = 0
				var_134_46.x = 0
				var_134_38.localEulerAngles = var_134_46
			end

			local var_134_47 = arg_131_1.actors_["1071ui_story"]
			local var_134_48 = 4

			if var_134_48 < arg_131_1.time_ and arg_131_1.time_ <= var_134_48 + arg_134_0 and arg_131_1.var_.characterEffect1071ui_story == nil then
				arg_131_1.var_.characterEffect1071ui_story = var_134_47:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_49 = 0.2

			if var_134_48 <= arg_131_1.time_ and arg_131_1.time_ < var_134_48 + var_134_49 then
				local var_134_50 = (arg_131_1.time_ - var_134_48) / var_134_49

				if arg_131_1.var_.characterEffect1071ui_story then
					arg_131_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_48 + var_134_49 and arg_131_1.time_ < var_134_48 + var_134_49 + arg_134_0 and arg_131_1.var_.characterEffect1071ui_story then
				arg_131_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_134_51 = arg_131_1.actors_["1069ui_story"]
			local var_134_52 = 4

			if var_134_52 < arg_131_1.time_ and arg_131_1.time_ <= var_134_52 + arg_134_0 and arg_131_1.var_.characterEffect1069ui_story == nil then
				arg_131_1.var_.characterEffect1069ui_story = var_134_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_53 = 0.0339999999999998

			if var_134_52 <= arg_131_1.time_ and arg_131_1.time_ < var_134_52 + var_134_53 then
				local var_134_54 = (arg_131_1.time_ - var_134_52) / var_134_53

				if arg_131_1.var_.characterEffect1069ui_story then
					local var_134_55 = Mathf.Lerp(0, 0.5, var_134_54)

					arg_131_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1069ui_story.fillRatio = var_134_55
				end
			end

			if arg_131_1.time_ >= var_134_52 + var_134_53 and arg_131_1.time_ < var_134_52 + var_134_53 + arg_134_0 and arg_131_1.var_.characterEffect1069ui_story then
				local var_134_56 = 0.5

				arg_131_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1069ui_story.fillRatio = var_134_56
			end

			local var_134_57 = 4

			if var_134_57 < arg_131_1.time_ and arg_131_1.time_ <= var_134_57 + arg_134_0 then
				arg_131_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_134_58 = 0

			if var_134_58 < arg_131_1.time_ and arg_131_1.time_ <= var_134_58 + arg_134_0 then
				arg_131_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_134_59 = 4

			if var_134_59 < arg_131_1.time_ and arg_131_1.time_ <= var_134_59 + arg_134_0 then
				arg_131_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_134_60 = 4

			if var_134_60 < arg_131_1.time_ and arg_131_1.time_ <= var_134_60 + arg_134_0 then
				arg_131_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			if arg_131_1.frameCnt_ <= 1 then
				arg_131_1.dialog_:SetActive(false)
			end

			local var_134_61 = 4
			local var_134_62 = 0.925

			if var_134_61 < arg_131_1.time_ and arg_131_1.time_ <= var_134_61 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				arg_131_1.dialog_:SetActive(true)

				local var_134_63 = LeanTween.value(arg_131_1.dialog_, 0, 1, 0.3)

				var_134_63:setOnUpdate(LuaHelper.FloatAction(function(arg_135_0)
					arg_131_1.dialogCg_.alpha = arg_135_0
				end))
				var_134_63:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_131_1.dialog_)
					var_134_63:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_131_1.duration_ = arg_131_1.duration_ + 0.3

				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_64 = arg_131_1:FormatText(StoryNameCfg[384].name)

				arg_131_1.leftNameTxt_.text = var_134_64

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_65 = arg_131_1:GetWordFromCfg(120042032)
				local var_134_66 = arg_131_1:FormatText(var_134_65.content)

				arg_131_1.text_.text = var_134_66

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_67 = 37
				local var_134_68 = utf8.len(var_134_66)
				local var_134_69 = var_134_67 <= 0 and var_134_62 or var_134_62 * (var_134_68 / var_134_67)

				if var_134_69 > 0 and var_134_62 < var_134_69 then
					arg_131_1.talkMaxDuration = var_134_69
					var_134_61 = var_134_61 + 0.3

					if var_134_69 + var_134_61 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_69 + var_134_61
					end
				end

				arg_131_1.text_.text = var_134_66
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042032", "story_v_out_120042.awb") ~= 0 then
					local var_134_70 = manager.audio:GetVoiceLength("story_v_out_120042", "120042032", "story_v_out_120042.awb") / 1000

					if var_134_70 + var_134_61 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_70 + var_134_61
					end

					if var_134_65.prefab_name ~= "" and arg_131_1.actors_[var_134_65.prefab_name] ~= nil then
						local var_134_71 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_65.prefab_name].transform, "story_v_out_120042", "120042032", "story_v_out_120042.awb")

						arg_131_1:RecordAudio("120042032", var_134_71)
						arg_131_1:RecordAudio("120042032", var_134_71)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_120042", "120042032", "story_v_out_120042.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_120042", "120042032", "story_v_out_120042.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_72 = var_134_61 + 0.3
			local var_134_73 = math.max(var_134_62, arg_131_1.talkMaxDuration)

			if var_134_72 <= arg_131_1.time_ and arg_131_1.time_ < var_134_72 + var_134_73 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_72) / var_134_73

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_72 + var_134_73 and arg_131_1.time_ < var_134_72 + var_134_73 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play120042033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 120042033
		arg_137_1.duration_ = 8.966

		local var_137_0 = {
			zh = 8.966,
			ja = 6.033
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
				arg_137_0:Play120042034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1071ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1071ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1071ui_story, var_140_4, var_140_3)

				local var_140_5 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_5.x, var_140_5.y, var_140_5.z)

				local var_140_6 = var_140_0.localEulerAngles

				var_140_6.z = 0
				var_140_6.x = 0
				var_140_0.localEulerAngles = var_140_6
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_140_7 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_7.x, var_140_7.y, var_140_7.z)

				local var_140_8 = var_140_0.localEulerAngles

				var_140_8.z = 0
				var_140_8.x = 0
				var_140_0.localEulerAngles = var_140_8
			end

			local var_140_9 = arg_137_1.actors_["1069ui_story"].transform
			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1.var_.moveOldPos1069ui_story = var_140_9.localPosition
			end

			local var_140_11 = 0.001

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11
				local var_140_13 = Vector3.New(0.7, -1, -6)

				var_140_9.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1069ui_story, var_140_13, var_140_12)

				local var_140_14 = manager.ui.mainCamera.transform.position - var_140_9.position

				var_140_9.forward = Vector3.New(var_140_14.x, var_140_14.y, var_140_14.z)

				local var_140_15 = var_140_9.localEulerAngles

				var_140_15.z = 0
				var_140_15.x = 0
				var_140_9.localEulerAngles = var_140_15
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 then
				var_140_9.localPosition = Vector3.New(0.7, -1, -6)

				local var_140_16 = manager.ui.mainCamera.transform.position - var_140_9.position

				var_140_9.forward = Vector3.New(var_140_16.x, var_140_16.y, var_140_16.z)

				local var_140_17 = var_140_9.localEulerAngles

				var_140_17.z = 0
				var_140_17.x = 0
				var_140_9.localEulerAngles = var_140_17
			end

			local var_140_18 = arg_137_1.actors_["1071ui_story"]
			local var_140_19 = 0

			if var_140_19 < arg_137_1.time_ and arg_137_1.time_ <= var_140_19 + arg_140_0 and arg_137_1.var_.characterEffect1071ui_story == nil then
				arg_137_1.var_.characterEffect1071ui_story = var_140_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_20 = 0.2

			if var_140_19 <= arg_137_1.time_ and arg_137_1.time_ < var_140_19 + var_140_20 then
				local var_140_21 = (arg_137_1.time_ - var_140_19) / var_140_20

				if arg_137_1.var_.characterEffect1071ui_story then
					local var_140_22 = Mathf.Lerp(0, 0.5, var_140_21)

					arg_137_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1071ui_story.fillRatio = var_140_22
				end
			end

			if arg_137_1.time_ >= var_140_19 + var_140_20 and arg_137_1.time_ < var_140_19 + var_140_20 + arg_140_0 and arg_137_1.var_.characterEffect1071ui_story then
				local var_140_23 = 0.5

				arg_137_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1071ui_story.fillRatio = var_140_23
			end

			local var_140_24 = arg_137_1.actors_["1069ui_story"]
			local var_140_25 = 0

			if var_140_25 < arg_137_1.time_ and arg_137_1.time_ <= var_140_25 + arg_140_0 and arg_137_1.var_.characterEffect1069ui_story == nil then
				arg_137_1.var_.characterEffect1069ui_story = var_140_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_26 = 0.2

			if var_140_25 <= arg_137_1.time_ and arg_137_1.time_ < var_140_25 + var_140_26 then
				local var_140_27 = (arg_137_1.time_ - var_140_25) / var_140_26

				if arg_137_1.var_.characterEffect1069ui_story then
					arg_137_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_25 + var_140_26 and arg_137_1.time_ < var_140_25 + var_140_26 + arg_140_0 and arg_137_1.var_.characterEffect1069ui_story then
				arg_137_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_140_28 = 0

			if var_140_28 < arg_137_1.time_ and arg_137_1.time_ <= var_140_28 + arg_140_0 then
				arg_137_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action6_1")
			end

			local var_140_29 = 0

			if var_140_29 < arg_137_1.time_ and arg_137_1.time_ <= var_140_29 + arg_140_0 then
				arg_137_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_140_30 = 0
			local var_140_31 = 1

			if var_140_30 < arg_137_1.time_ and arg_137_1.time_ <= var_140_30 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_32 = arg_137_1:FormatText(StoryNameCfg[378].name)

				arg_137_1.leftNameTxt_.text = var_140_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_33 = arg_137_1:GetWordFromCfg(120042033)
				local var_140_34 = arg_137_1:FormatText(var_140_33.content)

				arg_137_1.text_.text = var_140_34

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_35 = 40
				local var_140_36 = utf8.len(var_140_34)
				local var_140_37 = var_140_35 <= 0 and var_140_31 or var_140_31 * (var_140_36 / var_140_35)

				if var_140_37 > 0 and var_140_31 < var_140_37 then
					arg_137_1.talkMaxDuration = var_140_37

					if var_140_37 + var_140_30 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_37 + var_140_30
					end
				end

				arg_137_1.text_.text = var_140_34
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042033", "story_v_out_120042.awb") ~= 0 then
					local var_140_38 = manager.audio:GetVoiceLength("story_v_out_120042", "120042033", "story_v_out_120042.awb") / 1000

					if var_140_38 + var_140_30 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_38 + var_140_30
					end

					if var_140_33.prefab_name ~= "" and arg_137_1.actors_[var_140_33.prefab_name] ~= nil then
						local var_140_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_33.prefab_name].transform, "story_v_out_120042", "120042033", "story_v_out_120042.awb")

						arg_137_1:RecordAudio("120042033", var_140_39)
						arg_137_1:RecordAudio("120042033", var_140_39)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_120042", "120042033", "story_v_out_120042.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_120042", "120042033", "story_v_out_120042.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_40 = math.max(var_140_31, arg_137_1.talkMaxDuration)

			if var_140_30 <= arg_137_1.time_ and arg_137_1.time_ < var_140_30 + var_140_40 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_30) / var_140_40

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_30 + var_140_40 and arg_137_1.time_ < var_140_30 + var_140_40 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play120042034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 120042034
		arg_141_1.duration_ = 4

		local var_141_0 = {
			zh = 3.933,
			ja = 4
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
				arg_141_0:Play120042035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1071ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1071ui_story == nil then
				arg_141_1.var_.characterEffect1071ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.2

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1071ui_story then
					arg_141_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1071ui_story then
				arg_141_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_144_4 = arg_141_1.actors_["1069ui_story"]
			local var_144_5 = 0

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 and arg_141_1.var_.characterEffect1069ui_story == nil then
				arg_141_1.var_.characterEffect1069ui_story = var_144_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_6 = 0.2

			if var_144_5 <= arg_141_1.time_ and arg_141_1.time_ < var_144_5 + var_144_6 then
				local var_144_7 = (arg_141_1.time_ - var_144_5) / var_144_6

				if arg_141_1.var_.characterEffect1069ui_story then
					local var_144_8 = Mathf.Lerp(0, 0.5, var_144_7)

					arg_141_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1069ui_story.fillRatio = var_144_8
				end
			end

			if arg_141_1.time_ >= var_144_5 + var_144_6 and arg_141_1.time_ < var_144_5 + var_144_6 + arg_144_0 and arg_141_1.var_.characterEffect1069ui_story then
				local var_144_9 = 0.5

				arg_141_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1069ui_story.fillRatio = var_144_9
			end

			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_144_11 = 0
			local var_144_12 = 0.425

			if var_144_11 < arg_141_1.time_ and arg_141_1.time_ <= var_144_11 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_13 = arg_141_1:FormatText(StoryNameCfg[384].name)

				arg_141_1.leftNameTxt_.text = var_144_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_14 = arg_141_1:GetWordFromCfg(120042034)
				local var_144_15 = arg_141_1:FormatText(var_144_14.content)

				arg_141_1.text_.text = var_144_15

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_16 = 17
				local var_144_17 = utf8.len(var_144_15)
				local var_144_18 = var_144_16 <= 0 and var_144_12 or var_144_12 * (var_144_17 / var_144_16)

				if var_144_18 > 0 and var_144_12 < var_144_18 then
					arg_141_1.talkMaxDuration = var_144_18

					if var_144_18 + var_144_11 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_18 + var_144_11
					end
				end

				arg_141_1.text_.text = var_144_15
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042034", "story_v_out_120042.awb") ~= 0 then
					local var_144_19 = manager.audio:GetVoiceLength("story_v_out_120042", "120042034", "story_v_out_120042.awb") / 1000

					if var_144_19 + var_144_11 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_11
					end

					if var_144_14.prefab_name ~= "" and arg_141_1.actors_[var_144_14.prefab_name] ~= nil then
						local var_144_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_14.prefab_name].transform, "story_v_out_120042", "120042034", "story_v_out_120042.awb")

						arg_141_1:RecordAudio("120042034", var_144_20)
						arg_141_1:RecordAudio("120042034", var_144_20)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_120042", "120042034", "story_v_out_120042.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_120042", "120042034", "story_v_out_120042.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_21 = math.max(var_144_12, arg_141_1.talkMaxDuration)

			if var_144_11 <= arg_141_1.time_ and arg_141_1.time_ < var_144_11 + var_144_21 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_11) / var_144_21

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_11 + var_144_21 and arg_141_1.time_ < var_144_11 + var_144_21 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play120042035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 120042035
		arg_145_1.duration_ = 11.566

		local var_145_0 = {
			zh = 7.366,
			ja = 11.566
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
				arg_145_0:Play120042036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.975

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[384].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(120042035)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042035", "story_v_out_120042.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042035", "story_v_out_120042.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_120042", "120042035", "story_v_out_120042.awb")

						arg_145_1:RecordAudio("120042035", var_148_9)
						arg_145_1:RecordAudio("120042035", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_120042", "120042035", "story_v_out_120042.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_120042", "120042035", "story_v_out_120042.awb")
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
	Play120042036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 120042036
		arg_149_1.duration_ = 7.966

		local var_149_0 = {
			zh = 3.466,
			ja = 7.966
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
				arg_149_0:Play120042037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.425

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[384].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(120042036)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042036", "story_v_out_120042.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042036", "story_v_out_120042.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_120042", "120042036", "story_v_out_120042.awb")

						arg_149_1:RecordAudio("120042036", var_152_9)
						arg_149_1:RecordAudio("120042036", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_120042", "120042036", "story_v_out_120042.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_120042", "120042036", "story_v_out_120042.awb")
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
	Play120042037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 120042037
		arg_153_1.duration_ = 5.133

		local var_153_0 = {
			zh = 3.1,
			ja = 5.133
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
				arg_153_0:Play120042038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1069ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1069ui_story == nil then
				arg_153_1.var_.characterEffect1069ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.2

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1069ui_story then
					arg_153_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1069ui_story then
				arg_153_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_156_4 = arg_153_1.actors_["1071ui_story"]
			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 and arg_153_1.var_.characterEffect1071ui_story == nil then
				arg_153_1.var_.characterEffect1071ui_story = var_156_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_6 = 0.2

			if var_156_5 <= arg_153_1.time_ and arg_153_1.time_ < var_156_5 + var_156_6 then
				local var_156_7 = (arg_153_1.time_ - var_156_5) / var_156_6

				if arg_153_1.var_.characterEffect1071ui_story then
					local var_156_8 = Mathf.Lerp(0, 0.5, var_156_7)

					arg_153_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1071ui_story.fillRatio = var_156_8
				end
			end

			if arg_153_1.time_ >= var_156_5 + var_156_6 and arg_153_1.time_ < var_156_5 + var_156_6 + arg_156_0 and arg_153_1.var_.characterEffect1071ui_story then
				local var_156_9 = 0.5

				arg_153_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1071ui_story.fillRatio = var_156_9
			end

			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_156_11 = 0

			if var_156_11 < arg_153_1.time_ and arg_153_1.time_ <= var_156_11 + arg_156_0 then
				arg_153_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069actionlink/1069action464")
			end

			local var_156_12 = 0
			local var_156_13 = 0.425

			if var_156_12 < arg_153_1.time_ and arg_153_1.time_ <= var_156_12 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_14 = arg_153_1:FormatText(StoryNameCfg[378].name)

				arg_153_1.leftNameTxt_.text = var_156_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_15 = arg_153_1:GetWordFromCfg(120042037)
				local var_156_16 = arg_153_1:FormatText(var_156_15.content)

				arg_153_1.text_.text = var_156_16

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_17 = 17
				local var_156_18 = utf8.len(var_156_16)
				local var_156_19 = var_156_17 <= 0 and var_156_13 or var_156_13 * (var_156_18 / var_156_17)

				if var_156_19 > 0 and var_156_13 < var_156_19 then
					arg_153_1.talkMaxDuration = var_156_19

					if var_156_19 + var_156_12 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_19 + var_156_12
					end
				end

				arg_153_1.text_.text = var_156_16
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042037", "story_v_out_120042.awb") ~= 0 then
					local var_156_20 = manager.audio:GetVoiceLength("story_v_out_120042", "120042037", "story_v_out_120042.awb") / 1000

					if var_156_20 + var_156_12 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_20 + var_156_12
					end

					if var_156_15.prefab_name ~= "" and arg_153_1.actors_[var_156_15.prefab_name] ~= nil then
						local var_156_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_15.prefab_name].transform, "story_v_out_120042", "120042037", "story_v_out_120042.awb")

						arg_153_1:RecordAudio("120042037", var_156_21)
						arg_153_1:RecordAudio("120042037", var_156_21)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_120042", "120042037", "story_v_out_120042.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_120042", "120042037", "story_v_out_120042.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_22 = math.max(var_156_13, arg_153_1.talkMaxDuration)

			if var_156_12 <= arg_153_1.time_ and arg_153_1.time_ < var_156_12 + var_156_22 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_12) / var_156_22

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_12 + var_156_22 and arg_153_1.time_ < var_156_12 + var_156_22 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play120042038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 120042038
		arg_157_1.duration_ = 7.666

		local var_157_0 = {
			zh = 2.4,
			ja = 7.666
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
				arg_157_0:Play120042039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1071ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1071ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1071ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["1069ui_story"].transform
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 then
				arg_157_1.var_.moveOldPos1069ui_story = var_160_9.localPosition
			end

			local var_160_11 = 0.001

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11
				local var_160_13 = Vector3.New(0.7, -1, -6)

				var_160_9.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1069ui_story, var_160_13, var_160_12)

				local var_160_14 = manager.ui.mainCamera.transform.position - var_160_9.position

				var_160_9.forward = Vector3.New(var_160_14.x, var_160_14.y, var_160_14.z)

				local var_160_15 = var_160_9.localEulerAngles

				var_160_15.z = 0
				var_160_15.x = 0
				var_160_9.localEulerAngles = var_160_15
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 then
				var_160_9.localPosition = Vector3.New(0.7, -1, -6)

				local var_160_16 = manager.ui.mainCamera.transform.position - var_160_9.position

				var_160_9.forward = Vector3.New(var_160_16.x, var_160_16.y, var_160_16.z)

				local var_160_17 = var_160_9.localEulerAngles

				var_160_17.z = 0
				var_160_17.x = 0
				var_160_9.localEulerAngles = var_160_17
			end

			local var_160_18 = arg_157_1.actors_["1069ui_story"]
			local var_160_19 = 0

			if var_160_19 < arg_157_1.time_ and arg_157_1.time_ <= var_160_19 + arg_160_0 and arg_157_1.var_.characterEffect1069ui_story == nil then
				arg_157_1.var_.characterEffect1069ui_story = var_160_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_20 = 0.2

			if var_160_19 <= arg_157_1.time_ and arg_157_1.time_ < var_160_19 + var_160_20 then
				local var_160_21 = (arg_157_1.time_ - var_160_19) / var_160_20

				if arg_157_1.var_.characterEffect1069ui_story then
					arg_157_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_19 + var_160_20 and arg_157_1.time_ < var_160_19 + var_160_20 + arg_160_0 and arg_157_1.var_.characterEffect1069ui_story then
				arg_157_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_160_22 = 0
			local var_160_23 = 0.35

			if var_160_22 < arg_157_1.time_ and arg_157_1.time_ <= var_160_22 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_24 = arg_157_1:FormatText(StoryNameCfg[378].name)

				arg_157_1.leftNameTxt_.text = var_160_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_25 = arg_157_1:GetWordFromCfg(120042038)
				local var_160_26 = arg_157_1:FormatText(var_160_25.content)

				arg_157_1.text_.text = var_160_26

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_27 = 14
				local var_160_28 = utf8.len(var_160_26)
				local var_160_29 = var_160_27 <= 0 and var_160_23 or var_160_23 * (var_160_28 / var_160_27)

				if var_160_29 > 0 and var_160_23 < var_160_29 then
					arg_157_1.talkMaxDuration = var_160_29

					if var_160_29 + var_160_22 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_29 + var_160_22
					end
				end

				arg_157_1.text_.text = var_160_26
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042038", "story_v_out_120042.awb") ~= 0 then
					local var_160_30 = manager.audio:GetVoiceLength("story_v_out_120042", "120042038", "story_v_out_120042.awb") / 1000

					if var_160_30 + var_160_22 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_30 + var_160_22
					end

					if var_160_25.prefab_name ~= "" and arg_157_1.actors_[var_160_25.prefab_name] ~= nil then
						local var_160_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_25.prefab_name].transform, "story_v_out_120042", "120042038", "story_v_out_120042.awb")

						arg_157_1:RecordAudio("120042038", var_160_31)
						arg_157_1:RecordAudio("120042038", var_160_31)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_120042", "120042038", "story_v_out_120042.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_120042", "120042038", "story_v_out_120042.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_32 = math.max(var_160_23, arg_157_1.talkMaxDuration)

			if var_160_22 <= arg_157_1.time_ and arg_157_1.time_ < var_160_22 + var_160_32 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_22) / var_160_32

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_22 + var_160_32 and arg_157_1.time_ < var_160_22 + var_160_32 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play120042039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 120042039
		arg_161_1.duration_ = 8.233

		local var_161_0 = {
			zh = 5.766,
			ja = 8.233
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
				arg_161_0:Play120042040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1071ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1071ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1071ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["1069ui_story"].transform
			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1.var_.moveOldPos1069ui_story = var_164_9.localPosition
			end

			local var_164_11 = 0.001

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11
				local var_164_13 = Vector3.New(0.7, -1, -6)

				var_164_9.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1069ui_story, var_164_13, var_164_12)

				local var_164_14 = manager.ui.mainCamera.transform.position - var_164_9.position

				var_164_9.forward = Vector3.New(var_164_14.x, var_164_14.y, var_164_14.z)

				local var_164_15 = var_164_9.localEulerAngles

				var_164_15.z = 0
				var_164_15.x = 0
				var_164_9.localEulerAngles = var_164_15
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 then
				var_164_9.localPosition = Vector3.New(0.7, -1, -6)

				local var_164_16 = manager.ui.mainCamera.transform.position - var_164_9.position

				var_164_9.forward = Vector3.New(var_164_16.x, var_164_16.y, var_164_16.z)

				local var_164_17 = var_164_9.localEulerAngles

				var_164_17.z = 0
				var_164_17.x = 0
				var_164_9.localEulerAngles = var_164_17
			end

			local var_164_18 = arg_161_1.actors_["1071ui_story"]
			local var_164_19 = 0

			if var_164_19 < arg_161_1.time_ and arg_161_1.time_ <= var_164_19 + arg_164_0 and arg_161_1.var_.characterEffect1071ui_story == nil then
				arg_161_1.var_.characterEffect1071ui_story = var_164_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_20 = 0.2

			if var_164_19 <= arg_161_1.time_ and arg_161_1.time_ < var_164_19 + var_164_20 then
				local var_164_21 = (arg_161_1.time_ - var_164_19) / var_164_20

				if arg_161_1.var_.characterEffect1071ui_story then
					arg_161_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_19 + var_164_20 and arg_161_1.time_ < var_164_19 + var_164_20 + arg_164_0 and arg_161_1.var_.characterEffect1071ui_story then
				arg_161_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_164_22 = arg_161_1.actors_["1069ui_story"]
			local var_164_23 = 0

			if var_164_23 < arg_161_1.time_ and arg_161_1.time_ <= var_164_23 + arg_164_0 and arg_161_1.var_.characterEffect1069ui_story == nil then
				arg_161_1.var_.characterEffect1069ui_story = var_164_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_24 = 0.2

			if var_164_23 <= arg_161_1.time_ and arg_161_1.time_ < var_164_23 + var_164_24 then
				local var_164_25 = (arg_161_1.time_ - var_164_23) / var_164_24

				if arg_161_1.var_.characterEffect1069ui_story then
					local var_164_26 = Mathf.Lerp(0, 0.5, var_164_25)

					arg_161_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1069ui_story.fillRatio = var_164_26
				end
			end

			if arg_161_1.time_ >= var_164_23 + var_164_24 and arg_161_1.time_ < var_164_23 + var_164_24 + arg_164_0 and arg_161_1.var_.characterEffect1069ui_story then
				local var_164_27 = 0.5

				arg_161_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1069ui_story.fillRatio = var_164_27
			end

			local var_164_28 = 0
			local var_164_29 = 0.7

			if var_164_28 < arg_161_1.time_ and arg_161_1.time_ <= var_164_28 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_30 = arg_161_1:FormatText(StoryNameCfg[384].name)

				arg_161_1.leftNameTxt_.text = var_164_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_31 = arg_161_1:GetWordFromCfg(120042039)
				local var_164_32 = arg_161_1:FormatText(var_164_31.content)

				arg_161_1.text_.text = var_164_32

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_33 = 28
				local var_164_34 = utf8.len(var_164_32)
				local var_164_35 = var_164_33 <= 0 and var_164_29 or var_164_29 * (var_164_34 / var_164_33)

				if var_164_35 > 0 and var_164_29 < var_164_35 then
					arg_161_1.talkMaxDuration = var_164_35

					if var_164_35 + var_164_28 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_35 + var_164_28
					end
				end

				arg_161_1.text_.text = var_164_32
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042039", "story_v_out_120042.awb") ~= 0 then
					local var_164_36 = manager.audio:GetVoiceLength("story_v_out_120042", "120042039", "story_v_out_120042.awb") / 1000

					if var_164_36 + var_164_28 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_36 + var_164_28
					end

					if var_164_31.prefab_name ~= "" and arg_161_1.actors_[var_164_31.prefab_name] ~= nil then
						local var_164_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_31.prefab_name].transform, "story_v_out_120042", "120042039", "story_v_out_120042.awb")

						arg_161_1:RecordAudio("120042039", var_164_37)
						arg_161_1:RecordAudio("120042039", var_164_37)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_120042", "120042039", "story_v_out_120042.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_120042", "120042039", "story_v_out_120042.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_38 = math.max(var_164_29, arg_161_1.talkMaxDuration)

			if var_164_28 <= arg_161_1.time_ and arg_161_1.time_ < var_164_28 + var_164_38 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_28) / var_164_38

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_28 + var_164_38 and arg_161_1.time_ < var_164_28 + var_164_38 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play120042040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 120042040
		arg_165_1.duration_ = 7

		local var_165_0 = {
			zh = 7,
			ja = 6.333
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
				arg_165_0:Play120042041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1071ui_story"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1071ui_story = var_168_0.localPosition
			end

			local var_168_2 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2
				local var_168_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1071ui_story, var_168_4, var_168_3)

				local var_168_5 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_5.x, var_168_5.y, var_168_5.z)

				local var_168_6 = var_168_0.localEulerAngles

				var_168_6.z = 0
				var_168_6.x = 0
				var_168_0.localEulerAngles = var_168_6
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_168_7 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_7.x, var_168_7.y, var_168_7.z)

				local var_168_8 = var_168_0.localEulerAngles

				var_168_8.z = 0
				var_168_8.x = 0
				var_168_0.localEulerAngles = var_168_8
			end

			local var_168_9 = arg_165_1.actors_["1069ui_story"].transform
			local var_168_10 = 0

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 then
				arg_165_1.var_.moveOldPos1069ui_story = var_168_9.localPosition
			end

			local var_168_11 = 0.001

			if var_168_10 <= arg_165_1.time_ and arg_165_1.time_ < var_168_10 + var_168_11 then
				local var_168_12 = (arg_165_1.time_ - var_168_10) / var_168_11
				local var_168_13 = Vector3.New(0.7, -1, -6)

				var_168_9.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1069ui_story, var_168_13, var_168_12)

				local var_168_14 = manager.ui.mainCamera.transform.position - var_168_9.position

				var_168_9.forward = Vector3.New(var_168_14.x, var_168_14.y, var_168_14.z)

				local var_168_15 = var_168_9.localEulerAngles

				var_168_15.z = 0
				var_168_15.x = 0
				var_168_9.localEulerAngles = var_168_15
			end

			if arg_165_1.time_ >= var_168_10 + var_168_11 and arg_165_1.time_ < var_168_10 + var_168_11 + arg_168_0 then
				var_168_9.localPosition = Vector3.New(0.7, -1, -6)

				local var_168_16 = manager.ui.mainCamera.transform.position - var_168_9.position

				var_168_9.forward = Vector3.New(var_168_16.x, var_168_16.y, var_168_16.z)

				local var_168_17 = var_168_9.localEulerAngles

				var_168_17.z = 0
				var_168_17.x = 0
				var_168_9.localEulerAngles = var_168_17
			end

			local var_168_18 = arg_165_1.actors_["1071ui_story"]
			local var_168_19 = 0

			if var_168_19 < arg_165_1.time_ and arg_165_1.time_ <= var_168_19 + arg_168_0 and arg_165_1.var_.characterEffect1071ui_story == nil then
				arg_165_1.var_.characterEffect1071ui_story = var_168_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_20 = 0.2

			if var_168_19 <= arg_165_1.time_ and arg_165_1.time_ < var_168_19 + var_168_20 then
				local var_168_21 = (arg_165_1.time_ - var_168_19) / var_168_20

				if arg_165_1.var_.characterEffect1071ui_story then
					local var_168_22 = Mathf.Lerp(0, 0.5, var_168_21)

					arg_165_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1071ui_story.fillRatio = var_168_22
				end
			end

			if arg_165_1.time_ >= var_168_19 + var_168_20 and arg_165_1.time_ < var_168_19 + var_168_20 + arg_168_0 and arg_165_1.var_.characterEffect1071ui_story then
				local var_168_23 = 0.5

				arg_165_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1071ui_story.fillRatio = var_168_23
			end

			local var_168_24 = arg_165_1.actors_["1069ui_story"]
			local var_168_25 = 0

			if var_168_25 < arg_165_1.time_ and arg_165_1.time_ <= var_168_25 + arg_168_0 and arg_165_1.var_.characterEffect1069ui_story == nil then
				arg_165_1.var_.characterEffect1069ui_story = var_168_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_26 = 0.2

			if var_168_25 <= arg_165_1.time_ and arg_165_1.time_ < var_168_25 + var_168_26 then
				local var_168_27 = (arg_165_1.time_ - var_168_25) / var_168_26

				if arg_165_1.var_.characterEffect1069ui_story then
					arg_165_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_25 + var_168_26 and arg_165_1.time_ < var_168_25 + var_168_26 + arg_168_0 and arg_165_1.var_.characterEffect1069ui_story then
				arg_165_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_168_28 = 0

			if var_168_28 < arg_165_1.time_ and arg_165_1.time_ <= var_168_28 + arg_168_0 then
				arg_165_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_168_29 = 0
			local var_168_30 = 0.975

			if var_168_29 < arg_165_1.time_ and arg_165_1.time_ <= var_168_29 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_31 = arg_165_1:FormatText(StoryNameCfg[378].name)

				arg_165_1.leftNameTxt_.text = var_168_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_32 = arg_165_1:GetWordFromCfg(120042040)
				local var_168_33 = arg_165_1:FormatText(var_168_32.content)

				arg_165_1.text_.text = var_168_33

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_34 = 39
				local var_168_35 = utf8.len(var_168_33)
				local var_168_36 = var_168_34 <= 0 and var_168_30 or var_168_30 * (var_168_35 / var_168_34)

				if var_168_36 > 0 and var_168_30 < var_168_36 then
					arg_165_1.talkMaxDuration = var_168_36

					if var_168_36 + var_168_29 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_36 + var_168_29
					end
				end

				arg_165_1.text_.text = var_168_33
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042040", "story_v_out_120042.awb") ~= 0 then
					local var_168_37 = manager.audio:GetVoiceLength("story_v_out_120042", "120042040", "story_v_out_120042.awb") / 1000

					if var_168_37 + var_168_29 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_37 + var_168_29
					end

					if var_168_32.prefab_name ~= "" and arg_165_1.actors_[var_168_32.prefab_name] ~= nil then
						local var_168_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_32.prefab_name].transform, "story_v_out_120042", "120042040", "story_v_out_120042.awb")

						arg_165_1:RecordAudio("120042040", var_168_38)
						arg_165_1:RecordAudio("120042040", var_168_38)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_120042", "120042040", "story_v_out_120042.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_120042", "120042040", "story_v_out_120042.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_39 = math.max(var_168_30, arg_165_1.talkMaxDuration)

			if var_168_29 <= arg_165_1.time_ and arg_165_1.time_ < var_168_29 + var_168_39 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_29) / var_168_39

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_29 + var_168_39 and arg_165_1.time_ < var_168_29 + var_168_39 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play120042041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 120042041
		arg_169_1.duration_ = 1.7

		local var_169_0 = {
			zh = 1.7,
			ja = 1.466
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
				arg_169_0:Play120042042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1071ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect1071ui_story == nil then
				arg_169_1.var_.characterEffect1071ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.2

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect1071ui_story then
					arg_169_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect1071ui_story then
				arg_169_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_172_4 = arg_169_1.actors_["1069ui_story"]
			local var_172_5 = 0

			if var_172_5 < arg_169_1.time_ and arg_169_1.time_ <= var_172_5 + arg_172_0 and arg_169_1.var_.characterEffect1069ui_story == nil then
				arg_169_1.var_.characterEffect1069ui_story = var_172_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_6 = 0.2

			if var_172_5 <= arg_169_1.time_ and arg_169_1.time_ < var_172_5 + var_172_6 then
				local var_172_7 = (arg_169_1.time_ - var_172_5) / var_172_6

				if arg_169_1.var_.characterEffect1069ui_story then
					local var_172_8 = Mathf.Lerp(0, 0.5, var_172_7)

					arg_169_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1069ui_story.fillRatio = var_172_8
				end
			end

			if arg_169_1.time_ >= var_172_5 + var_172_6 and arg_169_1.time_ < var_172_5 + var_172_6 + arg_172_0 and arg_169_1.var_.characterEffect1069ui_story then
				local var_172_9 = 0.5

				arg_169_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1069ui_story.fillRatio = var_172_9
			end

			local var_172_10 = 0
			local var_172_11 = 0.15

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_12 = arg_169_1:FormatText(StoryNameCfg[384].name)

				arg_169_1.leftNameTxt_.text = var_172_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_13 = arg_169_1:GetWordFromCfg(120042041)
				local var_172_14 = arg_169_1:FormatText(var_172_13.content)

				arg_169_1.text_.text = var_172_14

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_15 = 6
				local var_172_16 = utf8.len(var_172_14)
				local var_172_17 = var_172_15 <= 0 and var_172_11 or var_172_11 * (var_172_16 / var_172_15)

				if var_172_17 > 0 and var_172_11 < var_172_17 then
					arg_169_1.talkMaxDuration = var_172_17

					if var_172_17 + var_172_10 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_17 + var_172_10
					end
				end

				arg_169_1.text_.text = var_172_14
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042041", "story_v_out_120042.awb") ~= 0 then
					local var_172_18 = manager.audio:GetVoiceLength("story_v_out_120042", "120042041", "story_v_out_120042.awb") / 1000

					if var_172_18 + var_172_10 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_18 + var_172_10
					end

					if var_172_13.prefab_name ~= "" and arg_169_1.actors_[var_172_13.prefab_name] ~= nil then
						local var_172_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_13.prefab_name].transform, "story_v_out_120042", "120042041", "story_v_out_120042.awb")

						arg_169_1:RecordAudio("120042041", var_172_19)
						arg_169_1:RecordAudio("120042041", var_172_19)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_120042", "120042041", "story_v_out_120042.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_120042", "120042041", "story_v_out_120042.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_20 = math.max(var_172_11, arg_169_1.talkMaxDuration)

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_20 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_10) / var_172_20

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_10 + var_172_20 and arg_169_1.time_ < var_172_10 + var_172_20 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play120042042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 120042042
		arg_173_1.duration_ = 5.5

		local var_173_0 = {
			zh = 4.066,
			ja = 5.5
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
				arg_173_0:Play120042043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_176_1 = 0
			local var_176_2 = 0.25

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_3 = arg_173_1:FormatText(StoryNameCfg[384].name)

				arg_173_1.leftNameTxt_.text = var_176_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_4 = arg_173_1:GetWordFromCfg(120042042)
				local var_176_5 = arg_173_1:FormatText(var_176_4.content)

				arg_173_1.text_.text = var_176_5

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_6 = 10
				local var_176_7 = utf8.len(var_176_5)
				local var_176_8 = var_176_6 <= 0 and var_176_2 or var_176_2 * (var_176_7 / var_176_6)

				if var_176_8 > 0 and var_176_2 < var_176_8 then
					arg_173_1.talkMaxDuration = var_176_8

					if var_176_8 + var_176_1 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_8 + var_176_1
					end
				end

				arg_173_1.text_.text = var_176_5
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042042", "story_v_out_120042.awb") ~= 0 then
					local var_176_9 = manager.audio:GetVoiceLength("story_v_out_120042", "120042042", "story_v_out_120042.awb") / 1000

					if var_176_9 + var_176_1 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_9 + var_176_1
					end

					if var_176_4.prefab_name ~= "" and arg_173_1.actors_[var_176_4.prefab_name] ~= nil then
						local var_176_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_4.prefab_name].transform, "story_v_out_120042", "120042042", "story_v_out_120042.awb")

						arg_173_1:RecordAudio("120042042", var_176_10)
						arg_173_1:RecordAudio("120042042", var_176_10)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_120042", "120042042", "story_v_out_120042.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_120042", "120042042", "story_v_out_120042.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_11 = math.max(var_176_2, arg_173_1.talkMaxDuration)

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_11 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_1) / var_176_11

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_1 + var_176_11 and arg_173_1.time_ < var_176_1 + var_176_11 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play120042043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 120042043
		arg_177_1.duration_ = 2.266

		local var_177_0 = {
			zh = 2.266,
			ja = 1.933
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
				arg_177_0:Play120042044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1071ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1071ui_story == nil then
				arg_177_1.var_.characterEffect1071ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.2

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1071ui_story then
					local var_180_4 = Mathf.Lerp(0, 0.5, var_180_3)

					arg_177_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1071ui_story.fillRatio = var_180_4
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1071ui_story then
				local var_180_5 = 0.5

				arg_177_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1071ui_story.fillRatio = var_180_5
			end

			local var_180_6 = arg_177_1.actors_["1069ui_story"]
			local var_180_7 = 0

			if var_180_7 < arg_177_1.time_ and arg_177_1.time_ <= var_180_7 + arg_180_0 and arg_177_1.var_.characterEffect1069ui_story == nil then
				arg_177_1.var_.characterEffect1069ui_story = var_180_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_8 = 0.2

			if var_180_7 <= arg_177_1.time_ and arg_177_1.time_ < var_180_7 + var_180_8 then
				local var_180_9 = (arg_177_1.time_ - var_180_7) / var_180_8

				if arg_177_1.var_.characterEffect1069ui_story then
					arg_177_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_7 + var_180_8 and arg_177_1.time_ < var_180_7 + var_180_8 + arg_180_0 and arg_177_1.var_.characterEffect1069ui_story then
				arg_177_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_180_10 = 0
			local var_180_11 = 0.3

			if var_180_10 < arg_177_1.time_ and arg_177_1.time_ <= var_180_10 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_12 = arg_177_1:FormatText(StoryNameCfg[378].name)

				arg_177_1.leftNameTxt_.text = var_180_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_13 = arg_177_1:GetWordFromCfg(120042043)
				local var_180_14 = arg_177_1:FormatText(var_180_13.content)

				arg_177_1.text_.text = var_180_14

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_15 = 12
				local var_180_16 = utf8.len(var_180_14)
				local var_180_17 = var_180_15 <= 0 and var_180_11 or var_180_11 * (var_180_16 / var_180_15)

				if var_180_17 > 0 and var_180_11 < var_180_17 then
					arg_177_1.talkMaxDuration = var_180_17

					if var_180_17 + var_180_10 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_17 + var_180_10
					end
				end

				arg_177_1.text_.text = var_180_14
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042043", "story_v_out_120042.awb") ~= 0 then
					local var_180_18 = manager.audio:GetVoiceLength("story_v_out_120042", "120042043", "story_v_out_120042.awb") / 1000

					if var_180_18 + var_180_10 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_18 + var_180_10
					end

					if var_180_13.prefab_name ~= "" and arg_177_1.actors_[var_180_13.prefab_name] ~= nil then
						local var_180_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_13.prefab_name].transform, "story_v_out_120042", "120042043", "story_v_out_120042.awb")

						arg_177_1:RecordAudio("120042043", var_180_19)
						arg_177_1:RecordAudio("120042043", var_180_19)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_120042", "120042043", "story_v_out_120042.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_120042", "120042043", "story_v_out_120042.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_20 = math.max(var_180_11, arg_177_1.talkMaxDuration)

			if var_180_10 <= arg_177_1.time_ and arg_177_1.time_ < var_180_10 + var_180_20 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_10) / var_180_20

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_10 + var_180_20 and arg_177_1.time_ < var_180_10 + var_180_20 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play120042044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 120042044
		arg_181_1.duration_ = 9.266

		local var_181_0 = {
			zh = 7.8,
			ja = 9.266
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
				arg_181_0:Play120042045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1071ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1071ui_story == nil then
				arg_181_1.var_.characterEffect1071ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.2

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1071ui_story then
					arg_181_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1071ui_story then
				arg_181_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_184_4 = arg_181_1.actors_["1069ui_story"]
			local var_184_5 = 0

			if var_184_5 < arg_181_1.time_ and arg_181_1.time_ <= var_184_5 + arg_184_0 and arg_181_1.var_.characterEffect1069ui_story == nil then
				arg_181_1.var_.characterEffect1069ui_story = var_184_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_6 = 0.2

			if var_184_5 <= arg_181_1.time_ and arg_181_1.time_ < var_184_5 + var_184_6 then
				local var_184_7 = (arg_181_1.time_ - var_184_5) / var_184_6

				if arg_181_1.var_.characterEffect1069ui_story then
					local var_184_8 = Mathf.Lerp(0, 0.5, var_184_7)

					arg_181_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1069ui_story.fillRatio = var_184_8
				end
			end

			if arg_181_1.time_ >= var_184_5 + var_184_6 and arg_181_1.time_ < var_184_5 + var_184_6 + arg_184_0 and arg_181_1.var_.characterEffect1069ui_story then
				local var_184_9 = 0.5

				arg_181_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1069ui_story.fillRatio = var_184_9
			end

			local var_184_10 = 0

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 then
				arg_181_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_2")
			end

			local var_184_11 = 0
			local var_184_12 = 0.775

			if var_184_11 < arg_181_1.time_ and arg_181_1.time_ <= var_184_11 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_13 = arg_181_1:FormatText(StoryNameCfg[384].name)

				arg_181_1.leftNameTxt_.text = var_184_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_14 = arg_181_1:GetWordFromCfg(120042044)
				local var_184_15 = arg_181_1:FormatText(var_184_14.content)

				arg_181_1.text_.text = var_184_15

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_16 = 31
				local var_184_17 = utf8.len(var_184_15)
				local var_184_18 = var_184_16 <= 0 and var_184_12 or var_184_12 * (var_184_17 / var_184_16)

				if var_184_18 > 0 and var_184_12 < var_184_18 then
					arg_181_1.talkMaxDuration = var_184_18

					if var_184_18 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_18 + var_184_11
					end
				end

				arg_181_1.text_.text = var_184_15
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042044", "story_v_out_120042.awb") ~= 0 then
					local var_184_19 = manager.audio:GetVoiceLength("story_v_out_120042", "120042044", "story_v_out_120042.awb") / 1000

					if var_184_19 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_19 + var_184_11
					end

					if var_184_14.prefab_name ~= "" and arg_181_1.actors_[var_184_14.prefab_name] ~= nil then
						local var_184_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_14.prefab_name].transform, "story_v_out_120042", "120042044", "story_v_out_120042.awb")

						arg_181_1:RecordAudio("120042044", var_184_20)
						arg_181_1:RecordAudio("120042044", var_184_20)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_120042", "120042044", "story_v_out_120042.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_120042", "120042044", "story_v_out_120042.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_21 = math.max(var_184_12, arg_181_1.talkMaxDuration)

			if var_184_11 <= arg_181_1.time_ and arg_181_1.time_ < var_184_11 + var_184_21 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_11) / var_184_21

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_11 + var_184_21 and arg_181_1.time_ < var_184_11 + var_184_21 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play120042045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 120042045
		arg_185_1.duration_ = 6.5

		local var_185_0 = {
			zh = 6.166,
			ja = 6.5
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
				arg_185_0:Play120042046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.775

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_2 = arg_185_1:FormatText(StoryNameCfg[384].name)

				arg_185_1.leftNameTxt_.text = var_188_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_3 = arg_185_1:GetWordFromCfg(120042045)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 31
				local var_188_6 = utf8.len(var_188_4)
				local var_188_7 = var_188_5 <= 0 and var_188_1 or var_188_1 * (var_188_6 / var_188_5)

				if var_188_7 > 0 and var_188_1 < var_188_7 then
					arg_185_1.talkMaxDuration = var_188_7

					if var_188_7 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_7 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_4
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042045", "story_v_out_120042.awb") ~= 0 then
					local var_188_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042045", "story_v_out_120042.awb") / 1000

					if var_188_8 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_8 + var_188_0
					end

					if var_188_3.prefab_name ~= "" and arg_185_1.actors_[var_188_3.prefab_name] ~= nil then
						local var_188_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_3.prefab_name].transform, "story_v_out_120042", "120042045", "story_v_out_120042.awb")

						arg_185_1:RecordAudio("120042045", var_188_9)
						arg_185_1:RecordAudio("120042045", var_188_9)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_120042", "120042045", "story_v_out_120042.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_120042", "120042045", "story_v_out_120042.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_10 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_10 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_10

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_10 and arg_185_1.time_ < var_188_0 + var_188_10 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play120042046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 120042046
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play120042047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1071ui_story"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1071ui_story = var_192_0.localPosition
			end

			local var_192_2 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2
				local var_192_4 = Vector3.New(0, 100, 0)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1071ui_story, var_192_4, var_192_3)

				local var_192_5 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_5.x, var_192_5.y, var_192_5.z)

				local var_192_6 = var_192_0.localEulerAngles

				var_192_6.z = 0
				var_192_6.x = 0
				var_192_0.localEulerAngles = var_192_6
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(0, 100, 0)

				local var_192_7 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_7.x, var_192_7.y, var_192_7.z)

				local var_192_8 = var_192_0.localEulerAngles

				var_192_8.z = 0
				var_192_8.x = 0
				var_192_0.localEulerAngles = var_192_8
			end

			local var_192_9 = arg_189_1.actors_["1069ui_story"].transform
			local var_192_10 = 0

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 then
				arg_189_1.var_.moveOldPos1069ui_story = var_192_9.localPosition
			end

			local var_192_11 = 0.001

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_11 then
				local var_192_12 = (arg_189_1.time_ - var_192_10) / var_192_11
				local var_192_13 = Vector3.New(0, 100, 0)

				var_192_9.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1069ui_story, var_192_13, var_192_12)

				local var_192_14 = manager.ui.mainCamera.transform.position - var_192_9.position

				var_192_9.forward = Vector3.New(var_192_14.x, var_192_14.y, var_192_14.z)

				local var_192_15 = var_192_9.localEulerAngles

				var_192_15.z = 0
				var_192_15.x = 0
				var_192_9.localEulerAngles = var_192_15
			end

			if arg_189_1.time_ >= var_192_10 + var_192_11 and arg_189_1.time_ < var_192_10 + var_192_11 + arg_192_0 then
				var_192_9.localPosition = Vector3.New(0, 100, 0)

				local var_192_16 = manager.ui.mainCamera.transform.position - var_192_9.position

				var_192_9.forward = Vector3.New(var_192_16.x, var_192_16.y, var_192_16.z)

				local var_192_17 = var_192_9.localEulerAngles

				var_192_17.z = 0
				var_192_17.x = 0
				var_192_9.localEulerAngles = var_192_17
			end

			local var_192_18 = 0
			local var_192_19 = 0.6

			if var_192_18 < arg_189_1.time_ and arg_189_1.time_ <= var_192_18 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_20 = arg_189_1:GetWordFromCfg(120042046)
				local var_192_21 = arg_189_1:FormatText(var_192_20.content)

				arg_189_1.text_.text = var_192_21

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_22 = 24
				local var_192_23 = utf8.len(var_192_21)
				local var_192_24 = var_192_22 <= 0 and var_192_19 or var_192_19 * (var_192_23 / var_192_22)

				if var_192_24 > 0 and var_192_19 < var_192_24 then
					arg_189_1.talkMaxDuration = var_192_24

					if var_192_24 + var_192_18 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_24 + var_192_18
					end
				end

				arg_189_1.text_.text = var_192_21
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_25 = math.max(var_192_19, arg_189_1.talkMaxDuration)

			if var_192_18 <= arg_189_1.time_ and arg_189_1.time_ < var_192_18 + var_192_25 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_18) / var_192_25

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_18 + var_192_25 and arg_189_1.time_ < var_192_18 + var_192_25 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play120042047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 120042047
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play120042048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.725

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_2 = arg_193_1:GetWordFromCfg(120042047)
				local var_196_3 = arg_193_1:FormatText(var_196_2.content)

				arg_193_1.text_.text = var_196_3

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_4 = 29
				local var_196_5 = utf8.len(var_196_3)
				local var_196_6 = var_196_4 <= 0 and var_196_1 or var_196_1 * (var_196_5 / var_196_4)

				if var_196_6 > 0 and var_196_1 < var_196_6 then
					arg_193_1.talkMaxDuration = var_196_6

					if var_196_6 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_6 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_3
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_7 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_7 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_7

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_7 and arg_193_1.time_ < var_196_0 + var_196_7 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play120042048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 120042048
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play120042049(arg_197_1)
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

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[7].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(120042048)
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
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_8 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_8 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_8

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_8 and arg_197_1.time_ < var_200_0 + var_200_8 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play120042049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 120042049
		arg_201_1.duration_ = 14.066

		local var_201_0 = {
			zh = 14.066,
			ja = 11.3
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
				arg_201_0:Play120042050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1184ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1184ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, -0.97, -6)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1184ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["1184ui_story"]
			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect1184ui_story == nil then
				arg_201_1.var_.characterEffect1184ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.2

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect1184ui_story then
					arg_201_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and arg_201_1.var_.characterEffect1184ui_story then
				arg_201_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_204_13 = 0

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 then
				arg_201_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_204_15 = 0
			local var_204_16 = 1.125

			if var_204_15 < arg_201_1.time_ and arg_201_1.time_ <= var_204_15 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_17 = arg_201_1:FormatText(StoryNameCfg[6].name)

				arg_201_1.leftNameTxt_.text = var_204_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_18 = arg_201_1:GetWordFromCfg(120042049)
				local var_204_19 = arg_201_1:FormatText(var_204_18.content)

				arg_201_1.text_.text = var_204_19

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_20 = 45
				local var_204_21 = utf8.len(var_204_19)
				local var_204_22 = var_204_20 <= 0 and var_204_16 or var_204_16 * (var_204_21 / var_204_20)

				if var_204_22 > 0 and var_204_16 < var_204_22 then
					arg_201_1.talkMaxDuration = var_204_22

					if var_204_22 + var_204_15 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_22 + var_204_15
					end
				end

				arg_201_1.text_.text = var_204_19
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042049", "story_v_out_120042.awb") ~= 0 then
					local var_204_23 = manager.audio:GetVoiceLength("story_v_out_120042", "120042049", "story_v_out_120042.awb") / 1000

					if var_204_23 + var_204_15 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_23 + var_204_15
					end

					if var_204_18.prefab_name ~= "" and arg_201_1.actors_[var_204_18.prefab_name] ~= nil then
						local var_204_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_18.prefab_name].transform, "story_v_out_120042", "120042049", "story_v_out_120042.awb")

						arg_201_1:RecordAudio("120042049", var_204_24)
						arg_201_1:RecordAudio("120042049", var_204_24)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_120042", "120042049", "story_v_out_120042.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_120042", "120042049", "story_v_out_120042.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_25 = math.max(var_204_16, arg_201_1.talkMaxDuration)

			if var_204_15 <= arg_201_1.time_ and arg_201_1.time_ < var_204_15 + var_204_25 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_15) / var_204_25

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_15 + var_204_25 and arg_201_1.time_ < var_204_15 + var_204_25 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play120042050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 120042050
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play120042051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1184ui_story"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos1184ui_story = var_208_0.localPosition
			end

			local var_208_2 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2
				local var_208_4 = Vector3.New(0, -0.97, -6)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1184ui_story, var_208_4, var_208_3)

				local var_208_5 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_5.x, var_208_5.y, var_208_5.z)

				local var_208_6 = var_208_0.localEulerAngles

				var_208_6.z = 0
				var_208_6.x = 0
				var_208_0.localEulerAngles = var_208_6
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_208_7 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_7.x, var_208_7.y, var_208_7.z)

				local var_208_8 = var_208_0.localEulerAngles

				var_208_8.z = 0
				var_208_8.x = 0
				var_208_0.localEulerAngles = var_208_8
			end

			local var_208_9 = arg_205_1.actors_["1184ui_story"]
			local var_208_10 = 0

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 and arg_205_1.var_.characterEffect1184ui_story == nil then
				arg_205_1.var_.characterEffect1184ui_story = var_208_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_11 = 0.2

			if var_208_10 <= arg_205_1.time_ and arg_205_1.time_ < var_208_10 + var_208_11 then
				local var_208_12 = (arg_205_1.time_ - var_208_10) / var_208_11

				if arg_205_1.var_.characterEffect1184ui_story then
					local var_208_13 = Mathf.Lerp(0, 0.5, var_208_12)

					arg_205_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1184ui_story.fillRatio = var_208_13
				end
			end

			if arg_205_1.time_ >= var_208_10 + var_208_11 and arg_205_1.time_ < var_208_10 + var_208_11 + arg_208_0 and arg_205_1.var_.characterEffect1184ui_story then
				local var_208_14 = 0.5

				arg_205_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1184ui_story.fillRatio = var_208_14
			end

			local var_208_15 = 0
			local var_208_16 = 0.15

			if var_208_15 < arg_205_1.time_ and arg_205_1.time_ <= var_208_15 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_17 = arg_205_1:FormatText(StoryNameCfg[7].name)

				arg_205_1.leftNameTxt_.text = var_208_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_18 = arg_205_1:GetWordFromCfg(120042050)
				local var_208_19 = arg_205_1:FormatText(var_208_18.content)

				arg_205_1.text_.text = var_208_19

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_20 = 6
				local var_208_21 = utf8.len(var_208_19)
				local var_208_22 = var_208_20 <= 0 and var_208_16 or var_208_16 * (var_208_21 / var_208_20)

				if var_208_22 > 0 and var_208_16 < var_208_22 then
					arg_205_1.talkMaxDuration = var_208_22

					if var_208_22 + var_208_15 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_22 + var_208_15
					end
				end

				arg_205_1.text_.text = var_208_19
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_23 = math.max(var_208_16, arg_205_1.talkMaxDuration)

			if var_208_15 <= arg_205_1.time_ and arg_205_1.time_ < var_208_15 + var_208_23 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_15) / var_208_23

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_15 + var_208_23 and arg_205_1.time_ < var_208_15 + var_208_23 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play120042051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 120042051
		arg_209_1.duration_ = 14.266

		local var_209_0 = {
			zh = 8.4,
			ja = 14.266
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
				arg_209_0:Play120042052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1184ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect1184ui_story == nil then
				arg_209_1.var_.characterEffect1184ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.2

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1184ui_story then
					arg_209_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1184ui_story then
				arg_209_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_212_4 = 0

			if var_212_4 < arg_209_1.time_ and arg_209_1.time_ <= var_212_4 + arg_212_0 then
				arg_209_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_212_5 = 0
			local var_212_6 = 0.65

			if var_212_5 < arg_209_1.time_ and arg_209_1.time_ <= var_212_5 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_7 = arg_209_1:FormatText(StoryNameCfg[6].name)

				arg_209_1.leftNameTxt_.text = var_212_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_8 = arg_209_1:GetWordFromCfg(120042051)
				local var_212_9 = arg_209_1:FormatText(var_212_8.content)

				arg_209_1.text_.text = var_212_9

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_10 = 26
				local var_212_11 = utf8.len(var_212_9)
				local var_212_12 = var_212_10 <= 0 and var_212_6 or var_212_6 * (var_212_11 / var_212_10)

				if var_212_12 > 0 and var_212_6 < var_212_12 then
					arg_209_1.talkMaxDuration = var_212_12

					if var_212_12 + var_212_5 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_12 + var_212_5
					end
				end

				arg_209_1.text_.text = var_212_9
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042051", "story_v_out_120042.awb") ~= 0 then
					local var_212_13 = manager.audio:GetVoiceLength("story_v_out_120042", "120042051", "story_v_out_120042.awb") / 1000

					if var_212_13 + var_212_5 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_13 + var_212_5
					end

					if var_212_8.prefab_name ~= "" and arg_209_1.actors_[var_212_8.prefab_name] ~= nil then
						local var_212_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_8.prefab_name].transform, "story_v_out_120042", "120042051", "story_v_out_120042.awb")

						arg_209_1:RecordAudio("120042051", var_212_14)
						arg_209_1:RecordAudio("120042051", var_212_14)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_120042", "120042051", "story_v_out_120042.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_120042", "120042051", "story_v_out_120042.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_15 = math.max(var_212_6, arg_209_1.talkMaxDuration)

			if var_212_5 <= arg_209_1.time_ and arg_209_1.time_ < var_212_5 + var_212_15 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_5) / var_212_15

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_5 + var_212_15 and arg_209_1.time_ < var_212_5 + var_212_15 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play120042052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 120042052
		arg_213_1.duration_ = 6.433

		local var_213_0 = {
			zh = 6.433,
			ja = 5.9
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
				arg_213_0:Play120042053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_216_2 = 0
			local var_216_3 = 0.65

			if var_216_2 < arg_213_1.time_ and arg_213_1.time_ <= var_216_2 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_4 = arg_213_1:FormatText(StoryNameCfg[6].name)

				arg_213_1.leftNameTxt_.text = var_216_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_5 = arg_213_1:GetWordFromCfg(120042052)
				local var_216_6 = arg_213_1:FormatText(var_216_5.content)

				arg_213_1.text_.text = var_216_6

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_7 = 26
				local var_216_8 = utf8.len(var_216_6)
				local var_216_9 = var_216_7 <= 0 and var_216_3 or var_216_3 * (var_216_8 / var_216_7)

				if var_216_9 > 0 and var_216_3 < var_216_9 then
					arg_213_1.talkMaxDuration = var_216_9

					if var_216_9 + var_216_2 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_9 + var_216_2
					end
				end

				arg_213_1.text_.text = var_216_6
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042052", "story_v_out_120042.awb") ~= 0 then
					local var_216_10 = manager.audio:GetVoiceLength("story_v_out_120042", "120042052", "story_v_out_120042.awb") / 1000

					if var_216_10 + var_216_2 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_10 + var_216_2
					end

					if var_216_5.prefab_name ~= "" and arg_213_1.actors_[var_216_5.prefab_name] ~= nil then
						local var_216_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_5.prefab_name].transform, "story_v_out_120042", "120042052", "story_v_out_120042.awb")

						arg_213_1:RecordAudio("120042052", var_216_11)
						arg_213_1:RecordAudio("120042052", var_216_11)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_120042", "120042052", "story_v_out_120042.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_120042", "120042052", "story_v_out_120042.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_12 = math.max(var_216_3, arg_213_1.talkMaxDuration)

			if var_216_2 <= arg_213_1.time_ and arg_213_1.time_ < var_216_2 + var_216_12 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_2) / var_216_12

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_2 + var_216_12 and arg_213_1.time_ < var_216_2 + var_216_12 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play120042053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 120042053
		arg_217_1.duration_ = 0.199999999999

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"

			SetActive(arg_217_1.choicesGo_, true)

			for iter_218_0, iter_218_1 in ipairs(arg_217_1.choices_) do
				local var_218_0 = iter_218_0 <= 2

				SetActive(iter_218_1.go, var_218_0)
			end

			arg_217_1.choices_[1].txt.text = arg_217_1:FormatText(StoryChoiceCfg[368].name)
			arg_217_1.choices_[2].txt.text = arg_217_1:FormatText(StoryChoiceCfg[369].name)
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play120042054(arg_217_1)
			end

			if arg_219_0 == 2 then
				arg_217_0:Play120042054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.allBtn_.enabled = false
			end

			local var_220_1 = 0.2

			if arg_217_1.time_ >= var_220_0 + var_220_1 and arg_217_1.time_ < var_220_0 + var_220_1 + arg_220_0 then
				arg_217_1.allBtn_.enabled = true
			end

			local var_220_2 = arg_217_1.actors_["1184ui_story"]
			local var_220_3 = 0

			if var_220_3 < arg_217_1.time_ and arg_217_1.time_ <= var_220_3 + arg_220_0 and arg_217_1.var_.characterEffect1184ui_story == nil then
				arg_217_1.var_.characterEffect1184ui_story = var_220_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_4 = 0.2

			if var_220_3 <= arg_217_1.time_ and arg_217_1.time_ < var_220_3 + var_220_4 then
				local var_220_5 = (arg_217_1.time_ - var_220_3) / var_220_4

				if arg_217_1.var_.characterEffect1184ui_story then
					local var_220_6 = Mathf.Lerp(0, 0.5, var_220_5)

					arg_217_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1184ui_story.fillRatio = var_220_6
				end
			end

			if arg_217_1.time_ >= var_220_3 + var_220_4 and arg_217_1.time_ < var_220_3 + var_220_4 + arg_220_0 and arg_217_1.var_.characterEffect1184ui_story then
				local var_220_7 = 0.5

				arg_217_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1184ui_story.fillRatio = var_220_7
			end
		end
	end,
	Play120042054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 120042054
		arg_221_1.duration_ = 6.233

		local var_221_0 = {
			zh = 6.233,
			ja = 5.8
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
				arg_221_0:Play120042055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1184ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1184ui_story == nil then
				arg_221_1.var_.characterEffect1184ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.2

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1184ui_story then
					arg_221_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1184ui_story then
				arg_221_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_224_4 = 0
			local var_224_5 = 0.775

			if var_224_4 < arg_221_1.time_ and arg_221_1.time_ <= var_224_4 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_6 = arg_221_1:FormatText(StoryNameCfg[6].name)

				arg_221_1.leftNameTxt_.text = var_224_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_7 = arg_221_1:GetWordFromCfg(120042054)
				local var_224_8 = arg_221_1:FormatText(var_224_7.content)

				arg_221_1.text_.text = var_224_8

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_9 = 31
				local var_224_10 = utf8.len(var_224_8)
				local var_224_11 = var_224_9 <= 0 and var_224_5 or var_224_5 * (var_224_10 / var_224_9)

				if var_224_11 > 0 and var_224_5 < var_224_11 then
					arg_221_1.talkMaxDuration = var_224_11

					if var_224_11 + var_224_4 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_11 + var_224_4
					end
				end

				arg_221_1.text_.text = var_224_8
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042054", "story_v_out_120042.awb") ~= 0 then
					local var_224_12 = manager.audio:GetVoiceLength("story_v_out_120042", "120042054", "story_v_out_120042.awb") / 1000

					if var_224_12 + var_224_4 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_12 + var_224_4
					end

					if var_224_7.prefab_name ~= "" and arg_221_1.actors_[var_224_7.prefab_name] ~= nil then
						local var_224_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_7.prefab_name].transform, "story_v_out_120042", "120042054", "story_v_out_120042.awb")

						arg_221_1:RecordAudio("120042054", var_224_13)
						arg_221_1:RecordAudio("120042054", var_224_13)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_120042", "120042054", "story_v_out_120042.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_120042", "120042054", "story_v_out_120042.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_14 = math.max(var_224_5, arg_221_1.talkMaxDuration)

			if var_224_4 <= arg_221_1.time_ and arg_221_1.time_ < var_224_4 + var_224_14 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_4) / var_224_14

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_4 + var_224_14 and arg_221_1.time_ < var_224_4 + var_224_14 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play120042055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 120042055
		arg_225_1.duration_ = 5

		local var_225_0 = {
			zh = 3.166,
			ja = 5
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
				arg_225_0:Play120042056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.325

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[6].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(120042055)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042055", "story_v_out_120042.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042055", "story_v_out_120042.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_out_120042", "120042055", "story_v_out_120042.awb")

						arg_225_1:RecordAudio("120042055", var_228_9)
						arg_225_1:RecordAudio("120042055", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_120042", "120042055", "story_v_out_120042.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_120042", "120042055", "story_v_out_120042.awb")
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
	Play120042056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 120042056
		arg_229_1.duration_ = 9

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play120042057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = "ST37a"

			if arg_229_1.bgs_[var_232_0] == nil then
				local var_232_1 = Object.Instantiate(arg_229_1.paintGo_)

				var_232_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_232_0)
				var_232_1.name = var_232_0
				var_232_1.transform.parent = arg_229_1.stage_.transform
				var_232_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_229_1.bgs_[var_232_0] = var_232_1
			end

			local var_232_2 = 2

			if var_232_2 < arg_229_1.time_ and arg_229_1.time_ <= var_232_2 + arg_232_0 then
				local var_232_3 = manager.ui.mainCamera.transform.localPosition
				local var_232_4 = Vector3.New(0, 0, 10) + Vector3.New(var_232_3.x, var_232_3.y, 0)
				local var_232_5 = arg_229_1.bgs_.ST37a

				var_232_5.transform.localPosition = var_232_4
				var_232_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_232_6 = var_232_5:GetComponent("SpriteRenderer")

				if var_232_6 and var_232_6.sprite then
					local var_232_7 = (var_232_5.transform.localPosition - var_232_3).z
					local var_232_8 = manager.ui.mainCameraCom_
					local var_232_9 = 2 * var_232_7 * Mathf.Tan(var_232_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_232_10 = var_232_9 * var_232_8.aspect
					local var_232_11 = var_232_6.sprite.bounds.size.x
					local var_232_12 = var_232_6.sprite.bounds.size.y
					local var_232_13 = var_232_10 / var_232_11
					local var_232_14 = var_232_9 / var_232_12
					local var_232_15 = var_232_14 < var_232_13 and var_232_13 or var_232_14

					var_232_5.transform.localScale = Vector3.New(var_232_15, var_232_15, 0)
				end

				for iter_232_0, iter_232_1 in pairs(arg_229_1.bgs_) do
					if iter_232_0 ~= "ST37a" then
						iter_232_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_232_16 = 0

			if var_232_16 < arg_229_1.time_ and arg_229_1.time_ <= var_232_16 + arg_232_0 then
				arg_229_1.mask_.enabled = true
				arg_229_1.mask_.raycastTarget = true

				arg_229_1:SetGaussion(false)
			end

			local var_232_17 = 2

			if var_232_16 <= arg_229_1.time_ and arg_229_1.time_ < var_232_16 + var_232_17 then
				local var_232_18 = (arg_229_1.time_ - var_232_16) / var_232_17
				local var_232_19 = Color.New(0, 0, 0)

				var_232_19.a = Mathf.Lerp(0, 1, var_232_18)
				arg_229_1.mask_.color = var_232_19
			end

			if arg_229_1.time_ >= var_232_16 + var_232_17 and arg_229_1.time_ < var_232_16 + var_232_17 + arg_232_0 then
				local var_232_20 = Color.New(0, 0, 0)

				var_232_20.a = 1
				arg_229_1.mask_.color = var_232_20
			end

			local var_232_21 = 2

			if var_232_21 < arg_229_1.time_ and arg_229_1.time_ <= var_232_21 + arg_232_0 then
				arg_229_1.mask_.enabled = true
				arg_229_1.mask_.raycastTarget = true

				arg_229_1:SetGaussion(false)
			end

			local var_232_22 = 2

			if var_232_21 <= arg_229_1.time_ and arg_229_1.time_ < var_232_21 + var_232_22 then
				local var_232_23 = (arg_229_1.time_ - var_232_21) / var_232_22
				local var_232_24 = Color.New(0, 0, 0)

				var_232_24.a = Mathf.Lerp(1, 0, var_232_23)
				arg_229_1.mask_.color = var_232_24
			end

			if arg_229_1.time_ >= var_232_21 + var_232_22 and arg_229_1.time_ < var_232_21 + var_232_22 + arg_232_0 then
				local var_232_25 = Color.New(0, 0, 0)
				local var_232_26 = 0

				arg_229_1.mask_.enabled = false
				var_232_25.a = var_232_26
				arg_229_1.mask_.color = var_232_25
			end

			local var_232_27 = arg_229_1.actors_["1184ui_story"].transform
			local var_232_28 = 1.966

			if var_232_28 < arg_229_1.time_ and arg_229_1.time_ <= var_232_28 + arg_232_0 then
				arg_229_1.var_.moveOldPos1184ui_story = var_232_27.localPosition
			end

			local var_232_29 = 0.001

			if var_232_28 <= arg_229_1.time_ and arg_229_1.time_ < var_232_28 + var_232_29 then
				local var_232_30 = (arg_229_1.time_ - var_232_28) / var_232_29
				local var_232_31 = Vector3.New(0, 100, 0)

				var_232_27.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1184ui_story, var_232_31, var_232_30)

				local var_232_32 = manager.ui.mainCamera.transform.position - var_232_27.position

				var_232_27.forward = Vector3.New(var_232_32.x, var_232_32.y, var_232_32.z)

				local var_232_33 = var_232_27.localEulerAngles

				var_232_33.z = 0
				var_232_33.x = 0
				var_232_27.localEulerAngles = var_232_33
			end

			if arg_229_1.time_ >= var_232_28 + var_232_29 and arg_229_1.time_ < var_232_28 + var_232_29 + arg_232_0 then
				var_232_27.localPosition = Vector3.New(0, 100, 0)

				local var_232_34 = manager.ui.mainCamera.transform.position - var_232_27.position

				var_232_27.forward = Vector3.New(var_232_34.x, var_232_34.y, var_232_34.z)

				local var_232_35 = var_232_27.localEulerAngles

				var_232_35.z = 0
				var_232_35.x = 0
				var_232_27.localEulerAngles = var_232_35
			end

			local var_232_36 = 0

			if var_232_36 < arg_229_1.time_ and arg_229_1.time_ <= var_232_36 + arg_232_0 then
				arg_229_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			if arg_229_1.frameCnt_ <= 1 then
				arg_229_1.dialog_:SetActive(false)
			end

			local var_232_37 = 4
			local var_232_38 = 1.35

			if var_232_37 < arg_229_1.time_ and arg_229_1.time_ <= var_232_37 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0

				arg_229_1.dialog_:SetActive(true)

				local var_232_39 = LeanTween.value(arg_229_1.dialog_, 0, 1, 0.3)

				var_232_39:setOnUpdate(LuaHelper.FloatAction(function(arg_233_0)
					arg_229_1.dialogCg_.alpha = arg_233_0
				end))
				var_232_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_229_1.dialog_)
					var_232_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_229_1.duration_ = arg_229_1.duration_ + 0.3

				SetActive(arg_229_1.leftNameGo_, false)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_40 = arg_229_1:GetWordFromCfg(120042056)
				local var_232_41 = arg_229_1:FormatText(var_232_40.content)

				arg_229_1.text_.text = var_232_41

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_42 = 54
				local var_232_43 = utf8.len(var_232_41)
				local var_232_44 = var_232_42 <= 0 and var_232_38 or var_232_38 * (var_232_43 / var_232_42)

				if var_232_44 > 0 and var_232_38 < var_232_44 then
					arg_229_1.talkMaxDuration = var_232_44
					var_232_37 = var_232_37 + 0.3

					if var_232_44 + var_232_37 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_44 + var_232_37
					end
				end

				arg_229_1.text_.text = var_232_41
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_45 = var_232_37 + 0.3
			local var_232_46 = math.max(var_232_38, arg_229_1.talkMaxDuration)

			if var_232_45 <= arg_229_1.time_ and arg_229_1.time_ < var_232_45 + var_232_46 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_45) / var_232_46

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_45 + var_232_46 and arg_229_1.time_ < var_232_45 + var_232_46 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play120042057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 120042057
		arg_235_1.duration_ = 4.033

		local var_235_0 = {
			zh = 4.033,
			ja = 3.766
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
				arg_235_0:Play120042058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = "10044ui_story"

			if arg_235_1.actors_[var_238_0] == nil then
				local var_238_1 = Object.Instantiate(Asset.Load("Char/" .. var_238_0), arg_235_1.stage_.transform)

				var_238_1.name = var_238_0
				var_238_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_235_1.actors_[var_238_0] = var_238_1

				local var_238_2 = var_238_1:GetComponentInChildren(typeof(CharacterEffect))

				var_238_2.enabled = true

				local var_238_3 = GameObjectTools.GetOrAddComponent(var_238_1, typeof(DynamicBoneHelper))

				if var_238_3 then
					var_238_3:EnableDynamicBone(false)
				end

				arg_235_1:ShowWeapon(var_238_2.transform, false)

				arg_235_1.var_[var_238_0 .. "Animator"] = var_238_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_235_1.var_[var_238_0 .. "Animator"].applyRootMotion = true
				arg_235_1.var_[var_238_0 .. "LipSync"] = var_238_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_238_4 = arg_235_1.actors_["10044ui_story"].transform
			local var_238_5 = 0

			if var_238_5 < arg_235_1.time_ and arg_235_1.time_ <= var_238_5 + arg_238_0 then
				arg_235_1.var_.moveOldPos10044ui_story = var_238_4.localPosition
			end

			local var_238_6 = 0.001

			if var_238_5 <= arg_235_1.time_ and arg_235_1.time_ < var_238_5 + var_238_6 then
				local var_238_7 = (arg_235_1.time_ - var_238_5) / var_238_6
				local var_238_8 = Vector3.New(-0.7, -0.72, -6.3)

				var_238_4.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10044ui_story, var_238_8, var_238_7)

				local var_238_9 = manager.ui.mainCamera.transform.position - var_238_4.position

				var_238_4.forward = Vector3.New(var_238_9.x, var_238_9.y, var_238_9.z)

				local var_238_10 = var_238_4.localEulerAngles

				var_238_10.z = 0
				var_238_10.x = 0
				var_238_4.localEulerAngles = var_238_10
			end

			if arg_235_1.time_ >= var_238_5 + var_238_6 and arg_235_1.time_ < var_238_5 + var_238_6 + arg_238_0 then
				var_238_4.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_238_11 = manager.ui.mainCamera.transform.position - var_238_4.position

				var_238_4.forward = Vector3.New(var_238_11.x, var_238_11.y, var_238_11.z)

				local var_238_12 = var_238_4.localEulerAngles

				var_238_12.z = 0
				var_238_12.x = 0
				var_238_4.localEulerAngles = var_238_12
			end

			local var_238_13 = arg_235_1.actors_["1071ui_story"].transform
			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				arg_235_1.var_.moveOldPos1071ui_story = var_238_13.localPosition
			end

			local var_238_15 = 0.001

			if var_238_14 <= arg_235_1.time_ and arg_235_1.time_ < var_238_14 + var_238_15 then
				local var_238_16 = (arg_235_1.time_ - var_238_14) / var_238_15
				local var_238_17 = Vector3.New(0.7, -1.05, -6.2)

				var_238_13.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1071ui_story, var_238_17, var_238_16)

				local var_238_18 = manager.ui.mainCamera.transform.position - var_238_13.position

				var_238_13.forward = Vector3.New(var_238_18.x, var_238_18.y, var_238_18.z)

				local var_238_19 = var_238_13.localEulerAngles

				var_238_19.z = 0
				var_238_19.x = 0
				var_238_13.localEulerAngles = var_238_19
			end

			if arg_235_1.time_ >= var_238_14 + var_238_15 and arg_235_1.time_ < var_238_14 + var_238_15 + arg_238_0 then
				var_238_13.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_238_20 = manager.ui.mainCamera.transform.position - var_238_13.position

				var_238_13.forward = Vector3.New(var_238_20.x, var_238_20.y, var_238_20.z)

				local var_238_21 = var_238_13.localEulerAngles

				var_238_21.z = 0
				var_238_21.x = 0
				var_238_13.localEulerAngles = var_238_21
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
					arg_235_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_23 + var_238_24 and arg_235_1.time_ < var_238_23 + var_238_24 + arg_238_0 and arg_235_1.var_.characterEffect10044ui_story then
				arg_235_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_238_26 = arg_235_1.actors_["1071ui_story"]
			local var_238_27 = 0

			if var_238_27 < arg_235_1.time_ and arg_235_1.time_ <= var_238_27 + arg_238_0 and arg_235_1.var_.characterEffect1071ui_story == nil then
				arg_235_1.var_.characterEffect1071ui_story = var_238_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_28 = 0.2

			if var_238_27 <= arg_235_1.time_ and arg_235_1.time_ < var_238_27 + var_238_28 then
				local var_238_29 = (arg_235_1.time_ - var_238_27) / var_238_28

				if arg_235_1.var_.characterEffect1071ui_story then
					local var_238_30 = Mathf.Lerp(0, 0.5, var_238_29)

					arg_235_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1071ui_story.fillRatio = var_238_30
				end
			end

			if arg_235_1.time_ >= var_238_27 + var_238_28 and arg_235_1.time_ < var_238_27 + var_238_28 + arg_238_0 and arg_235_1.var_.characterEffect1071ui_story then
				local var_238_31 = 0.5

				arg_235_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1071ui_story.fillRatio = var_238_31
			end

			local var_238_32 = 0

			if var_238_32 < arg_235_1.time_ and arg_235_1.time_ <= var_238_32 + arg_238_0 then
				arg_235_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_238_33 = 0

			if var_238_33 < arg_235_1.time_ and arg_235_1.time_ <= var_238_33 + arg_238_0 then
				arg_235_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_238_34 = 0

			if var_238_34 < arg_235_1.time_ and arg_235_1.time_ <= var_238_34 + arg_238_0 then
				arg_235_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_238_35 = 0
			local var_238_36 = 0.275

			if var_238_35 < arg_235_1.time_ and arg_235_1.time_ <= var_238_35 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_37 = arg_235_1:FormatText(StoryNameCfg[380].name)

				arg_235_1.leftNameTxt_.text = var_238_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_38 = arg_235_1:GetWordFromCfg(120042057)
				local var_238_39 = arg_235_1:FormatText(var_238_38.content)

				arg_235_1.text_.text = var_238_39

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_40 = 11
				local var_238_41 = utf8.len(var_238_39)
				local var_238_42 = var_238_40 <= 0 and var_238_36 or var_238_36 * (var_238_41 / var_238_40)

				if var_238_42 > 0 and var_238_36 < var_238_42 then
					arg_235_1.talkMaxDuration = var_238_42

					if var_238_42 + var_238_35 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_42 + var_238_35
					end
				end

				arg_235_1.text_.text = var_238_39
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042057", "story_v_out_120042.awb") ~= 0 then
					local var_238_43 = manager.audio:GetVoiceLength("story_v_out_120042", "120042057", "story_v_out_120042.awb") / 1000

					if var_238_43 + var_238_35 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_43 + var_238_35
					end

					if var_238_38.prefab_name ~= "" and arg_235_1.actors_[var_238_38.prefab_name] ~= nil then
						local var_238_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_38.prefab_name].transform, "story_v_out_120042", "120042057", "story_v_out_120042.awb")

						arg_235_1:RecordAudio("120042057", var_238_44)
						arg_235_1:RecordAudio("120042057", var_238_44)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_120042", "120042057", "story_v_out_120042.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_120042", "120042057", "story_v_out_120042.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_45 = math.max(var_238_36, arg_235_1.talkMaxDuration)

			if var_238_35 <= arg_235_1.time_ and arg_235_1.time_ < var_238_35 + var_238_45 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_35) / var_238_45

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_35 + var_238_45 and arg_235_1.time_ < var_238_35 + var_238_45 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play120042058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 120042058
		arg_239_1.duration_ = 3

		local var_239_0 = {
			zh = 2.733,
			ja = 3
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
				arg_239_0:Play120042059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1071ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1071ui_story == nil then
				arg_239_1.var_.characterEffect1071ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.2

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1071ui_story then
					arg_239_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1071ui_story then
				arg_239_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_242_4 = arg_239_1.actors_["10044ui_story"]
			local var_242_5 = 0

			if var_242_5 < arg_239_1.time_ and arg_239_1.time_ <= var_242_5 + arg_242_0 and arg_239_1.var_.characterEffect10044ui_story == nil then
				arg_239_1.var_.characterEffect10044ui_story = var_242_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_6 = 0.2

			if var_242_5 <= arg_239_1.time_ and arg_239_1.time_ < var_242_5 + var_242_6 then
				local var_242_7 = (arg_239_1.time_ - var_242_5) / var_242_6

				if arg_239_1.var_.characterEffect10044ui_story then
					local var_242_8 = Mathf.Lerp(0, 0.5, var_242_7)

					arg_239_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_239_1.var_.characterEffect10044ui_story.fillRatio = var_242_8
				end
			end

			if arg_239_1.time_ >= var_242_5 + var_242_6 and arg_239_1.time_ < var_242_5 + var_242_6 + arg_242_0 and arg_239_1.var_.characterEffect10044ui_story then
				local var_242_9 = 0.5

				arg_239_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_239_1.var_.characterEffect10044ui_story.fillRatio = var_242_9
			end

			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 then
				arg_239_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_242_11 = 0
			local var_242_12 = 0.2

			if var_242_11 < arg_239_1.time_ and arg_239_1.time_ <= var_242_11 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_13 = arg_239_1:FormatText(StoryNameCfg[384].name)

				arg_239_1.leftNameTxt_.text = var_242_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_14 = arg_239_1:GetWordFromCfg(120042058)
				local var_242_15 = arg_239_1:FormatText(var_242_14.content)

				arg_239_1.text_.text = var_242_15

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_16 = 8
				local var_242_17 = utf8.len(var_242_15)
				local var_242_18 = var_242_16 <= 0 and var_242_12 or var_242_12 * (var_242_17 / var_242_16)

				if var_242_18 > 0 and var_242_12 < var_242_18 then
					arg_239_1.talkMaxDuration = var_242_18

					if var_242_18 + var_242_11 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_18 + var_242_11
					end
				end

				arg_239_1.text_.text = var_242_15
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042058", "story_v_out_120042.awb") ~= 0 then
					local var_242_19 = manager.audio:GetVoiceLength("story_v_out_120042", "120042058", "story_v_out_120042.awb") / 1000

					if var_242_19 + var_242_11 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_19 + var_242_11
					end

					if var_242_14.prefab_name ~= "" and arg_239_1.actors_[var_242_14.prefab_name] ~= nil then
						local var_242_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_14.prefab_name].transform, "story_v_out_120042", "120042058", "story_v_out_120042.awb")

						arg_239_1:RecordAudio("120042058", var_242_20)
						arg_239_1:RecordAudio("120042058", var_242_20)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_120042", "120042058", "story_v_out_120042.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_120042", "120042058", "story_v_out_120042.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_21 = math.max(var_242_12, arg_239_1.talkMaxDuration)

			if var_242_11 <= arg_239_1.time_ and arg_239_1.time_ < var_242_11 + var_242_21 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_11) / var_242_21

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_11 + var_242_21 and arg_239_1.time_ < var_242_11 + var_242_21 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play120042059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 120042059
		arg_243_1.duration_ = 4.133

		local var_243_0 = {
			zh = 4.133,
			ja = 3.7
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
				arg_243_0:Play120042060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1071ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect1071ui_story == nil then
				arg_243_1.var_.characterEffect1071ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.2

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect1071ui_story then
					local var_246_4 = Mathf.Lerp(0, 0.5, var_246_3)

					arg_243_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1071ui_story.fillRatio = var_246_4
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect1071ui_story then
				local var_246_5 = 0.5

				arg_243_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1071ui_story.fillRatio = var_246_5
			end

			local var_246_6 = arg_243_1.actors_["10044ui_story"]
			local var_246_7 = 0

			if var_246_7 < arg_243_1.time_ and arg_243_1.time_ <= var_246_7 + arg_246_0 and arg_243_1.var_.characterEffect10044ui_story == nil then
				arg_243_1.var_.characterEffect10044ui_story = var_246_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_8 = 0.2

			if var_246_7 <= arg_243_1.time_ and arg_243_1.time_ < var_246_7 + var_246_8 then
				local var_246_9 = (arg_243_1.time_ - var_246_7) / var_246_8

				if arg_243_1.var_.characterEffect10044ui_story then
					arg_243_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_7 + var_246_8 and arg_243_1.time_ < var_246_7 + var_246_8 + arg_246_0 and arg_243_1.var_.characterEffect10044ui_story then
				arg_243_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_246_10 = 0
			local var_246_11 = 0.375

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_12 = arg_243_1:FormatText(StoryNameCfg[380].name)

				arg_243_1.leftNameTxt_.text = var_246_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_13 = arg_243_1:GetWordFromCfg(120042059)
				local var_246_14 = arg_243_1:FormatText(var_246_13.content)

				arg_243_1.text_.text = var_246_14

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_15 = 15
				local var_246_16 = utf8.len(var_246_14)
				local var_246_17 = var_246_15 <= 0 and var_246_11 or var_246_11 * (var_246_16 / var_246_15)

				if var_246_17 > 0 and var_246_11 < var_246_17 then
					arg_243_1.talkMaxDuration = var_246_17

					if var_246_17 + var_246_10 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_17 + var_246_10
					end
				end

				arg_243_1.text_.text = var_246_14
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042059", "story_v_out_120042.awb") ~= 0 then
					local var_246_18 = manager.audio:GetVoiceLength("story_v_out_120042", "120042059", "story_v_out_120042.awb") / 1000

					if var_246_18 + var_246_10 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_18 + var_246_10
					end

					if var_246_13.prefab_name ~= "" and arg_243_1.actors_[var_246_13.prefab_name] ~= nil then
						local var_246_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_13.prefab_name].transform, "story_v_out_120042", "120042059", "story_v_out_120042.awb")

						arg_243_1:RecordAudio("120042059", var_246_19)
						arg_243_1:RecordAudio("120042059", var_246_19)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_120042", "120042059", "story_v_out_120042.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_120042", "120042059", "story_v_out_120042.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_20 = math.max(var_246_11, arg_243_1.talkMaxDuration)

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_20 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_10) / var_246_20

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_10 + var_246_20 and arg_243_1.time_ < var_246_10 + var_246_20 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play120042060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 120042060
		arg_247_1.duration_ = 3

		local var_247_0 = {
			zh = 2.666,
			ja = 3
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
				arg_247_0:Play120042061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10044ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect10044ui_story == nil then
				arg_247_1.var_.characterEffect10044ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect10044ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_247_1.var_.characterEffect10044ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect10044ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_247_1.var_.characterEffect10044ui_story.fillRatio = var_250_5
			end

			local var_250_6 = 0
			local var_250_7 = 0.25

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_8 = arg_247_1:FormatText(StoryNameCfg[381].name)

				arg_247_1.leftNameTxt_.text = var_250_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, true)
				arg_247_1.iconController_:SetSelectedState("hero")

				arg_247_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_9 = arg_247_1:GetWordFromCfg(120042060)
				local var_250_10 = arg_247_1:FormatText(var_250_9.content)

				arg_247_1.text_.text = var_250_10

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_11 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042060", "story_v_out_120042.awb") ~= 0 then
					local var_250_14 = manager.audio:GetVoiceLength("story_v_out_120042", "120042060", "story_v_out_120042.awb") / 1000

					if var_250_14 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_14 + var_250_6
					end

					if var_250_9.prefab_name ~= "" and arg_247_1.actors_[var_250_9.prefab_name] ~= nil then
						local var_250_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_9.prefab_name].transform, "story_v_out_120042", "120042060", "story_v_out_120042.awb")

						arg_247_1:RecordAudio("120042060", var_250_15)
						arg_247_1:RecordAudio("120042060", var_250_15)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_120042", "120042060", "story_v_out_120042.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_120042", "120042060", "story_v_out_120042.awb")
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
	Play120042061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 120042061
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play120042062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10044ui_story"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos10044ui_story = var_254_0.localPosition
			end

			local var_254_2 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2
				local var_254_4 = Vector3.New(0, 100, 0)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos10044ui_story, var_254_4, var_254_3)

				local var_254_5 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_5.x, var_254_5.y, var_254_5.z)

				local var_254_6 = var_254_0.localEulerAngles

				var_254_6.z = 0
				var_254_6.x = 0
				var_254_0.localEulerAngles = var_254_6
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(0, 100, 0)

				local var_254_7 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_7.x, var_254_7.y, var_254_7.z)

				local var_254_8 = var_254_0.localEulerAngles

				var_254_8.z = 0
				var_254_8.x = 0
				var_254_0.localEulerAngles = var_254_8
			end

			local var_254_9 = arg_251_1.actors_["1071ui_story"].transform
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 then
				arg_251_1.var_.moveOldPos1071ui_story = var_254_9.localPosition
			end

			local var_254_11 = 0.001

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_11 then
				local var_254_12 = (arg_251_1.time_ - var_254_10) / var_254_11
				local var_254_13 = Vector3.New(0, 100, 0)

				var_254_9.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1071ui_story, var_254_13, var_254_12)

				local var_254_14 = manager.ui.mainCamera.transform.position - var_254_9.position

				var_254_9.forward = Vector3.New(var_254_14.x, var_254_14.y, var_254_14.z)

				local var_254_15 = var_254_9.localEulerAngles

				var_254_15.z = 0
				var_254_15.x = 0
				var_254_9.localEulerAngles = var_254_15
			end

			if arg_251_1.time_ >= var_254_10 + var_254_11 and arg_251_1.time_ < var_254_10 + var_254_11 + arg_254_0 then
				var_254_9.localPosition = Vector3.New(0, 100, 0)

				local var_254_16 = manager.ui.mainCamera.transform.position - var_254_9.position

				var_254_9.forward = Vector3.New(var_254_16.x, var_254_16.y, var_254_16.z)

				local var_254_17 = var_254_9.localEulerAngles

				var_254_17.z = 0
				var_254_17.x = 0
				var_254_9.localEulerAngles = var_254_17
			end

			local var_254_18 = 0
			local var_254_19 = 0.825

			if var_254_18 < arg_251_1.time_ and arg_251_1.time_ <= var_254_18 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_20 = arg_251_1:GetWordFromCfg(120042061)
				local var_254_21 = arg_251_1:FormatText(var_254_20.content)

				arg_251_1.text_.text = var_254_21

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_22 = 33
				local var_254_23 = utf8.len(var_254_21)
				local var_254_24 = var_254_22 <= 0 and var_254_19 or var_254_19 * (var_254_23 / var_254_22)

				if var_254_24 > 0 and var_254_19 < var_254_24 then
					arg_251_1.talkMaxDuration = var_254_24

					if var_254_24 + var_254_18 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_24 + var_254_18
					end
				end

				arg_251_1.text_.text = var_254_21
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_25 = math.max(var_254_19, arg_251_1.talkMaxDuration)

			if var_254_18 <= arg_251_1.time_ and arg_251_1.time_ < var_254_18 + var_254_25 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_18) / var_254_25

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_18 + var_254_25 and arg_251_1.time_ < var_254_18 + var_254_25 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play120042062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 120042062
		arg_255_1.duration_ = 4.733

		local var_255_0 = {
			zh = 2.7,
			ja = 4.733
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
				arg_255_0:Play120042063(arg_255_1)
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

			local var_258_9 = arg_255_1.actors_["1069ui_story"].transform
			local var_258_10 = 0

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 then
				arg_255_1.var_.moveOldPos1069ui_story = var_258_9.localPosition
			end

			local var_258_11 = 0.001

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_11 then
				local var_258_12 = (arg_255_1.time_ - var_258_10) / var_258_11
				local var_258_13 = Vector3.New(0.7, -1, -6)

				var_258_9.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1069ui_story, var_258_13, var_258_12)

				local var_258_14 = manager.ui.mainCamera.transform.position - var_258_9.position

				var_258_9.forward = Vector3.New(var_258_14.x, var_258_14.y, var_258_14.z)

				local var_258_15 = var_258_9.localEulerAngles

				var_258_15.z = 0
				var_258_15.x = 0
				var_258_9.localEulerAngles = var_258_15
			end

			if arg_255_1.time_ >= var_258_10 + var_258_11 and arg_255_1.time_ < var_258_10 + var_258_11 + arg_258_0 then
				var_258_9.localPosition = Vector3.New(0.7, -1, -6)

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

			local var_258_24 = arg_255_1.actors_["1069ui_story"]
			local var_258_25 = 0

			if var_258_25 < arg_255_1.time_ and arg_255_1.time_ <= var_258_25 + arg_258_0 and arg_255_1.var_.characterEffect1069ui_story == nil then
				arg_255_1.var_.characterEffect1069ui_story = var_258_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_26 = 0.2

			if var_258_25 <= arg_255_1.time_ and arg_255_1.time_ < var_258_25 + var_258_26 then
				local var_258_27 = (arg_255_1.time_ - var_258_25) / var_258_26

				if arg_255_1.var_.characterEffect1069ui_story then
					arg_255_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_25 + var_258_26 and arg_255_1.time_ < var_258_25 + var_258_26 + arg_258_0 and arg_255_1.var_.characterEffect1069ui_story then
				arg_255_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_258_28 = 0

			if var_258_28 < arg_255_1.time_ and arg_255_1.time_ <= var_258_28 + arg_258_0 then
				arg_255_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_258_29 = 0

			if var_258_29 < arg_255_1.time_ and arg_255_1.time_ <= var_258_29 + arg_258_0 then
				arg_255_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_258_30 = 0

			if var_258_30 < arg_255_1.time_ and arg_255_1.time_ <= var_258_30 + arg_258_0 then
				arg_255_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_258_31 = 0
			local var_258_32 = 0.35

			if var_258_31 < arg_255_1.time_ and arg_255_1.time_ <= var_258_31 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_33 = arg_255_1:FormatText(StoryNameCfg[378].name)

				arg_255_1.leftNameTxt_.text = var_258_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_34 = arg_255_1:GetWordFromCfg(120042062)
				local var_258_35 = arg_255_1:FormatText(var_258_34.content)

				arg_255_1.text_.text = var_258_35

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_36 = 14
				local var_258_37 = utf8.len(var_258_35)
				local var_258_38 = var_258_36 <= 0 and var_258_32 or var_258_32 * (var_258_37 / var_258_36)

				if var_258_38 > 0 and var_258_32 < var_258_38 then
					arg_255_1.talkMaxDuration = var_258_38

					if var_258_38 + var_258_31 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_38 + var_258_31
					end
				end

				arg_255_1.text_.text = var_258_35
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042062", "story_v_out_120042.awb") ~= 0 then
					local var_258_39 = manager.audio:GetVoiceLength("story_v_out_120042", "120042062", "story_v_out_120042.awb") / 1000

					if var_258_39 + var_258_31 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_39 + var_258_31
					end

					if var_258_34.prefab_name ~= "" and arg_255_1.actors_[var_258_34.prefab_name] ~= nil then
						local var_258_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_34.prefab_name].transform, "story_v_out_120042", "120042062", "story_v_out_120042.awb")

						arg_255_1:RecordAudio("120042062", var_258_40)
						arg_255_1:RecordAudio("120042062", var_258_40)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_120042", "120042062", "story_v_out_120042.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_120042", "120042062", "story_v_out_120042.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_41 = math.max(var_258_32, arg_255_1.talkMaxDuration)

			if var_258_31 <= arg_255_1.time_ and arg_255_1.time_ < var_258_31 + var_258_41 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_31) / var_258_41

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_31 + var_258_41 and arg_255_1.time_ < var_258_31 + var_258_41 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play120042063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 120042063
		arg_259_1.duration_ = 11.633

		local var_259_0 = {
			zh = 11.633,
			ja = 10.2
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
				arg_259_0:Play120042064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1069ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1069ui_story == nil then
				arg_259_1.var_.characterEffect1069ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.2

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1069ui_story then
					local var_262_4 = Mathf.Lerp(0, 0.5, var_262_3)

					arg_259_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1069ui_story.fillRatio = var_262_4
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1069ui_story then
				local var_262_5 = 0.5

				arg_259_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1069ui_story.fillRatio = var_262_5
			end

			local var_262_6 = arg_259_1.actors_["1071ui_story"]
			local var_262_7 = 0

			if var_262_7 < arg_259_1.time_ and arg_259_1.time_ <= var_262_7 + arg_262_0 and arg_259_1.var_.characterEffect1071ui_story == nil then
				arg_259_1.var_.characterEffect1071ui_story = var_262_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_8 = 0.2

			if var_262_7 <= arg_259_1.time_ and arg_259_1.time_ < var_262_7 + var_262_8 then
				local var_262_9 = (arg_259_1.time_ - var_262_7) / var_262_8

				if arg_259_1.var_.characterEffect1071ui_story then
					arg_259_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_7 + var_262_8 and arg_259_1.time_ < var_262_7 + var_262_8 + arg_262_0 and arg_259_1.var_.characterEffect1071ui_story then
				arg_259_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_262_10 = 0

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 then
				arg_259_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_262_11 = 0
			local var_262_12 = 1.15

			if var_262_11 < arg_259_1.time_ and arg_259_1.time_ <= var_262_11 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_13 = arg_259_1:FormatText(StoryNameCfg[384].name)

				arg_259_1.leftNameTxt_.text = var_262_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_14 = arg_259_1:GetWordFromCfg(120042063)
				local var_262_15 = arg_259_1:FormatText(var_262_14.content)

				arg_259_1.text_.text = var_262_15

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_16 = 46
				local var_262_17 = utf8.len(var_262_15)
				local var_262_18 = var_262_16 <= 0 and var_262_12 or var_262_12 * (var_262_17 / var_262_16)

				if var_262_18 > 0 and var_262_12 < var_262_18 then
					arg_259_1.talkMaxDuration = var_262_18

					if var_262_18 + var_262_11 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_18 + var_262_11
					end
				end

				arg_259_1.text_.text = var_262_15
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042063", "story_v_out_120042.awb") ~= 0 then
					local var_262_19 = manager.audio:GetVoiceLength("story_v_out_120042", "120042063", "story_v_out_120042.awb") / 1000

					if var_262_19 + var_262_11 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_19 + var_262_11
					end

					if var_262_14.prefab_name ~= "" and arg_259_1.actors_[var_262_14.prefab_name] ~= nil then
						local var_262_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_14.prefab_name].transform, "story_v_out_120042", "120042063", "story_v_out_120042.awb")

						arg_259_1:RecordAudio("120042063", var_262_20)
						arg_259_1:RecordAudio("120042063", var_262_20)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_120042", "120042063", "story_v_out_120042.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_120042", "120042063", "story_v_out_120042.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_21 = math.max(var_262_12, arg_259_1.talkMaxDuration)

			if var_262_11 <= arg_259_1.time_ and arg_259_1.time_ < var_262_11 + var_262_21 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_11) / var_262_21

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_11 + var_262_21 and arg_259_1.time_ < var_262_11 + var_262_21 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play120042064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 120042064
		arg_263_1.duration_ = 14.166

		local var_263_0 = {
			zh = 9.433,
			ja = 14.166
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
				arg_263_0:Play120042065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1069ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1069ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(0, 100, 0)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1069ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, 100, 0)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = "1075ui_story"

			if arg_263_1.actors_[var_266_9] == nil then
				local var_266_10 = Object.Instantiate(Asset.Load("Char/" .. var_266_9), arg_263_1.stage_.transform)

				var_266_10.name = var_266_9
				var_266_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_263_1.actors_[var_266_9] = var_266_10

				local var_266_11 = var_266_10:GetComponentInChildren(typeof(CharacterEffect))

				var_266_11.enabled = true

				local var_266_12 = GameObjectTools.GetOrAddComponent(var_266_10, typeof(DynamicBoneHelper))

				if var_266_12 then
					var_266_12:EnableDynamicBone(false)
				end

				arg_263_1:ShowWeapon(var_266_11.transform, false)

				arg_263_1.var_[var_266_9 .. "Animator"] = var_266_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_263_1.var_[var_266_9 .. "Animator"].applyRootMotion = true
				arg_263_1.var_[var_266_9 .. "LipSync"] = var_266_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_266_13 = arg_263_1.actors_["1075ui_story"].transform
			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1.var_.moveOldPos1075ui_story = var_266_13.localPosition
			end

			local var_266_15 = 0.001

			if var_266_14 <= arg_263_1.time_ and arg_263_1.time_ < var_266_14 + var_266_15 then
				local var_266_16 = (arg_263_1.time_ - var_266_14) / var_266_15
				local var_266_17 = Vector3.New(0.7, -1.055, -6.16)

				var_266_13.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1075ui_story, var_266_17, var_266_16)

				local var_266_18 = manager.ui.mainCamera.transform.position - var_266_13.position

				var_266_13.forward = Vector3.New(var_266_18.x, var_266_18.y, var_266_18.z)

				local var_266_19 = var_266_13.localEulerAngles

				var_266_19.z = 0
				var_266_19.x = 0
				var_266_13.localEulerAngles = var_266_19
			end

			if arg_263_1.time_ >= var_266_14 + var_266_15 and arg_263_1.time_ < var_266_14 + var_266_15 + arg_266_0 then
				var_266_13.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_266_20 = manager.ui.mainCamera.transform.position - var_266_13.position

				var_266_13.forward = Vector3.New(var_266_20.x, var_266_20.y, var_266_20.z)

				local var_266_21 = var_266_13.localEulerAngles

				var_266_21.z = 0
				var_266_21.x = 0
				var_266_13.localEulerAngles = var_266_21
			end

			local var_266_22 = arg_263_1.actors_["1071ui_story"]
			local var_266_23 = 0

			if var_266_23 < arg_263_1.time_ and arg_263_1.time_ <= var_266_23 + arg_266_0 and arg_263_1.var_.characterEffect1071ui_story == nil then
				arg_263_1.var_.characterEffect1071ui_story = var_266_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_24 = 0.2

			if var_266_23 <= arg_263_1.time_ and arg_263_1.time_ < var_266_23 + var_266_24 then
				local var_266_25 = (arg_263_1.time_ - var_266_23) / var_266_24

				if arg_263_1.var_.characterEffect1071ui_story then
					local var_266_26 = Mathf.Lerp(0, 0.5, var_266_25)

					arg_263_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_263_1.var_.characterEffect1071ui_story.fillRatio = var_266_26
				end
			end

			if arg_263_1.time_ >= var_266_23 + var_266_24 and arg_263_1.time_ < var_266_23 + var_266_24 + arg_266_0 and arg_263_1.var_.characterEffect1071ui_story then
				local var_266_27 = 0.5

				arg_263_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_263_1.var_.characterEffect1071ui_story.fillRatio = var_266_27
			end

			local var_266_28 = arg_263_1.actors_["1075ui_story"]
			local var_266_29 = 0

			if var_266_29 < arg_263_1.time_ and arg_263_1.time_ <= var_266_29 + arg_266_0 and arg_263_1.var_.characterEffect1075ui_story == nil then
				arg_263_1.var_.characterEffect1075ui_story = var_266_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_30 = 0.2

			if var_266_29 <= arg_263_1.time_ and arg_263_1.time_ < var_266_29 + var_266_30 then
				local var_266_31 = (arg_263_1.time_ - var_266_29) / var_266_30

				if arg_263_1.var_.characterEffect1075ui_story then
					arg_263_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_29 + var_266_30 and arg_263_1.time_ < var_266_29 + var_266_30 + arg_266_0 and arg_263_1.var_.characterEffect1075ui_story then
				arg_263_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_266_32 = 0

			if var_266_32 < arg_263_1.time_ and arg_263_1.time_ <= var_266_32 + arg_266_0 then
				arg_263_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_266_33 = 0

			if var_266_33 < arg_263_1.time_ and arg_263_1.time_ <= var_266_33 + arg_266_0 then
				arg_263_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_266_34 = 0
			local var_266_35 = 1.025

			if var_266_34 < arg_263_1.time_ and arg_263_1.time_ <= var_266_34 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_36 = arg_263_1:FormatText(StoryNameCfg[381].name)

				arg_263_1.leftNameTxt_.text = var_266_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_37 = arg_263_1:GetWordFromCfg(120042064)
				local var_266_38 = arg_263_1:FormatText(var_266_37.content)

				arg_263_1.text_.text = var_266_38

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_39 = 41
				local var_266_40 = utf8.len(var_266_38)
				local var_266_41 = var_266_39 <= 0 and var_266_35 or var_266_35 * (var_266_40 / var_266_39)

				if var_266_41 > 0 and var_266_35 < var_266_41 then
					arg_263_1.talkMaxDuration = var_266_41

					if var_266_41 + var_266_34 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_41 + var_266_34
					end
				end

				arg_263_1.text_.text = var_266_38
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042064", "story_v_out_120042.awb") ~= 0 then
					local var_266_42 = manager.audio:GetVoiceLength("story_v_out_120042", "120042064", "story_v_out_120042.awb") / 1000

					if var_266_42 + var_266_34 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_42 + var_266_34
					end

					if var_266_37.prefab_name ~= "" and arg_263_1.actors_[var_266_37.prefab_name] ~= nil then
						local var_266_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_37.prefab_name].transform, "story_v_out_120042", "120042064", "story_v_out_120042.awb")

						arg_263_1:RecordAudio("120042064", var_266_43)
						arg_263_1:RecordAudio("120042064", var_266_43)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_120042", "120042064", "story_v_out_120042.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_120042", "120042064", "story_v_out_120042.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_44 = math.max(var_266_35, arg_263_1.talkMaxDuration)

			if var_266_34 <= arg_263_1.time_ and arg_263_1.time_ < var_266_34 + var_266_44 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_34) / var_266_44

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_34 + var_266_44 and arg_263_1.time_ < var_266_34 + var_266_44 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play120042065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 120042065
		arg_267_1.duration_ = 11.133

		local var_267_0 = {
			zh = 11.133,
			ja = 10.266
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
				arg_267_0:Play120042066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1075ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect1075ui_story == nil then
				arg_267_1.var_.characterEffect1075ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.2

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect1075ui_story then
					local var_270_4 = Mathf.Lerp(0, 0.5, var_270_3)

					arg_267_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1075ui_story.fillRatio = var_270_4
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect1075ui_story then
				local var_270_5 = 0.5

				arg_267_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1075ui_story.fillRatio = var_270_5
			end

			local var_270_6 = arg_267_1.actors_["1071ui_story"]
			local var_270_7 = 0

			if var_270_7 < arg_267_1.time_ and arg_267_1.time_ <= var_270_7 + arg_270_0 and arg_267_1.var_.characterEffect1071ui_story == nil then
				arg_267_1.var_.characterEffect1071ui_story = var_270_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_8 = 0.2

			if var_270_7 <= arg_267_1.time_ and arg_267_1.time_ < var_270_7 + var_270_8 then
				local var_270_9 = (arg_267_1.time_ - var_270_7) / var_270_8

				if arg_267_1.var_.characterEffect1071ui_story then
					arg_267_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_7 + var_270_8 and arg_267_1.time_ < var_270_7 + var_270_8 + arg_270_0 and arg_267_1.var_.characterEffect1071ui_story then
				arg_267_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_270_10 = 0

			if var_270_10 < arg_267_1.time_ and arg_267_1.time_ <= var_270_10 + arg_270_0 then
				arg_267_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action432")
			end

			local var_270_11 = 0
			local var_270_12 = 0.975

			if var_270_11 < arg_267_1.time_ and arg_267_1.time_ <= var_270_11 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_13 = arg_267_1:FormatText(StoryNameCfg[384].name)

				arg_267_1.leftNameTxt_.text = var_270_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_14 = arg_267_1:GetWordFromCfg(120042065)
				local var_270_15 = arg_267_1:FormatText(var_270_14.content)

				arg_267_1.text_.text = var_270_15

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_16 = 39
				local var_270_17 = utf8.len(var_270_15)
				local var_270_18 = var_270_16 <= 0 and var_270_12 or var_270_12 * (var_270_17 / var_270_16)

				if var_270_18 > 0 and var_270_12 < var_270_18 then
					arg_267_1.talkMaxDuration = var_270_18

					if var_270_18 + var_270_11 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_18 + var_270_11
					end
				end

				arg_267_1.text_.text = var_270_15
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042065", "story_v_out_120042.awb") ~= 0 then
					local var_270_19 = manager.audio:GetVoiceLength("story_v_out_120042", "120042065", "story_v_out_120042.awb") / 1000

					if var_270_19 + var_270_11 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_19 + var_270_11
					end

					if var_270_14.prefab_name ~= "" and arg_267_1.actors_[var_270_14.prefab_name] ~= nil then
						local var_270_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_14.prefab_name].transform, "story_v_out_120042", "120042065", "story_v_out_120042.awb")

						arg_267_1:RecordAudio("120042065", var_270_20)
						arg_267_1:RecordAudio("120042065", var_270_20)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_120042", "120042065", "story_v_out_120042.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_120042", "120042065", "story_v_out_120042.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_21 = math.max(var_270_12, arg_267_1.talkMaxDuration)

			if var_270_11 <= arg_267_1.time_ and arg_267_1.time_ < var_270_11 + var_270_21 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_11) / var_270_21

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_11 + var_270_21 and arg_267_1.time_ < var_270_11 + var_270_21 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play120042066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 120042066
		arg_271_1.duration_ = 10.2

		local var_271_0 = {
			zh = 10.2,
			ja = 6.7
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
				arg_271_0:Play120042067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 1.05

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_2 = arg_271_1:FormatText(StoryNameCfg[384].name)

				arg_271_1.leftNameTxt_.text = var_274_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_3 = arg_271_1:GetWordFromCfg(120042066)
				local var_274_4 = arg_271_1:FormatText(var_274_3.content)

				arg_271_1.text_.text = var_274_4

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_5 = 42
				local var_274_6 = utf8.len(var_274_4)
				local var_274_7 = var_274_5 <= 0 and var_274_1 or var_274_1 * (var_274_6 / var_274_5)

				if var_274_7 > 0 and var_274_1 < var_274_7 then
					arg_271_1.talkMaxDuration = var_274_7

					if var_274_7 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_7 + var_274_0
					end
				end

				arg_271_1.text_.text = var_274_4
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042066", "story_v_out_120042.awb") ~= 0 then
					local var_274_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042066", "story_v_out_120042.awb") / 1000

					if var_274_8 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_8 + var_274_0
					end

					if var_274_3.prefab_name ~= "" and arg_271_1.actors_[var_274_3.prefab_name] ~= nil then
						local var_274_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_3.prefab_name].transform, "story_v_out_120042", "120042066", "story_v_out_120042.awb")

						arg_271_1:RecordAudio("120042066", var_274_9)
						arg_271_1:RecordAudio("120042066", var_274_9)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_120042", "120042066", "story_v_out_120042.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_120042", "120042066", "story_v_out_120042.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_10 = math.max(var_274_1, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_10 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_0) / var_274_10

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_10 and arg_271_1.time_ < var_274_0 + var_274_10 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play120042067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 120042067
		arg_275_1.duration_ = 3.466

		local var_275_0 = {
			zh = 2.1,
			ja = 3.466
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
				arg_275_0:Play120042068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1071ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect1071ui_story == nil then
				arg_275_1.var_.characterEffect1071ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.2

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect1071ui_story then
					local var_278_4 = Mathf.Lerp(0, 0.5, var_278_3)

					arg_275_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_275_1.var_.characterEffect1071ui_story.fillRatio = var_278_4
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect1071ui_story then
				local var_278_5 = 0.5

				arg_275_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_275_1.var_.characterEffect1071ui_story.fillRatio = var_278_5
			end

			local var_278_6 = arg_275_1.actors_["1075ui_story"]
			local var_278_7 = 0

			if var_278_7 < arg_275_1.time_ and arg_275_1.time_ <= var_278_7 + arg_278_0 and arg_275_1.var_.characterEffect1075ui_story == nil then
				arg_275_1.var_.characterEffect1075ui_story = var_278_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_8 = 0.2

			if var_278_7 <= arg_275_1.time_ and arg_275_1.time_ < var_278_7 + var_278_8 then
				local var_278_9 = (arg_275_1.time_ - var_278_7) / var_278_8

				if arg_275_1.var_.characterEffect1075ui_story then
					arg_275_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_7 + var_278_8 and arg_275_1.time_ < var_278_7 + var_278_8 + arg_278_0 and arg_275_1.var_.characterEffect1075ui_story then
				arg_275_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_278_10 = 0
			local var_278_11 = 0.3

			if var_278_10 < arg_275_1.time_ and arg_275_1.time_ <= var_278_10 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_12 = arg_275_1:FormatText(StoryNameCfg[381].name)

				arg_275_1.leftNameTxt_.text = var_278_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_13 = arg_275_1:GetWordFromCfg(120042067)
				local var_278_14 = arg_275_1:FormatText(var_278_13.content)

				arg_275_1.text_.text = var_278_14

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_15 = 12
				local var_278_16 = utf8.len(var_278_14)
				local var_278_17 = var_278_15 <= 0 and var_278_11 or var_278_11 * (var_278_16 / var_278_15)

				if var_278_17 > 0 and var_278_11 < var_278_17 then
					arg_275_1.talkMaxDuration = var_278_17

					if var_278_17 + var_278_10 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_17 + var_278_10
					end
				end

				arg_275_1.text_.text = var_278_14
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042067", "story_v_out_120042.awb") ~= 0 then
					local var_278_18 = manager.audio:GetVoiceLength("story_v_out_120042", "120042067", "story_v_out_120042.awb") / 1000

					if var_278_18 + var_278_10 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_18 + var_278_10
					end

					if var_278_13.prefab_name ~= "" and arg_275_1.actors_[var_278_13.prefab_name] ~= nil then
						local var_278_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_13.prefab_name].transform, "story_v_out_120042", "120042067", "story_v_out_120042.awb")

						arg_275_1:RecordAudio("120042067", var_278_19)
						arg_275_1:RecordAudio("120042067", var_278_19)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_120042", "120042067", "story_v_out_120042.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_120042", "120042067", "story_v_out_120042.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_20 = math.max(var_278_11, arg_275_1.talkMaxDuration)

			if var_278_10 <= arg_275_1.time_ and arg_275_1.time_ < var_278_10 + var_278_20 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_10) / var_278_20

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_10 + var_278_20 and arg_275_1.time_ < var_278_10 + var_278_20 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play120042068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 120042068
		arg_279_1.duration_ = 5.333

		local var_279_0 = {
			zh = 5.333,
			ja = 3.066
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
				arg_279_0:Play120042069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1071ui_story"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect1071ui_story == nil then
				arg_279_1.var_.characterEffect1071ui_story = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.2

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect1071ui_story then
					arg_279_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1071ui_story then
				arg_279_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_282_4 = arg_279_1.actors_["1075ui_story"]
			local var_282_5 = 0

			if var_282_5 < arg_279_1.time_ and arg_279_1.time_ <= var_282_5 + arg_282_0 and arg_279_1.var_.characterEffect1075ui_story == nil then
				arg_279_1.var_.characterEffect1075ui_story = var_282_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_6 = 0.2

			if var_282_5 <= arg_279_1.time_ and arg_279_1.time_ < var_282_5 + var_282_6 then
				local var_282_7 = (arg_279_1.time_ - var_282_5) / var_282_6

				if arg_279_1.var_.characterEffect1075ui_story then
					local var_282_8 = Mathf.Lerp(0, 0.5, var_282_7)

					arg_279_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1075ui_story.fillRatio = var_282_8
				end
			end

			if arg_279_1.time_ >= var_282_5 + var_282_6 and arg_279_1.time_ < var_282_5 + var_282_6 + arg_282_0 and arg_279_1.var_.characterEffect1075ui_story then
				local var_282_9 = 0.5

				arg_279_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1075ui_story.fillRatio = var_282_9
			end

			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 then
				arg_279_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action425")
			end

			local var_282_11 = 0
			local var_282_12 = 0.475

			if var_282_11 < arg_279_1.time_ and arg_279_1.time_ <= var_282_11 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_13 = arg_279_1:FormatText(StoryNameCfg[384].name)

				arg_279_1.leftNameTxt_.text = var_282_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_14 = arg_279_1:GetWordFromCfg(120042068)
				local var_282_15 = arg_279_1:FormatText(var_282_14.content)

				arg_279_1.text_.text = var_282_15

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_16 = 19
				local var_282_17 = utf8.len(var_282_15)
				local var_282_18 = var_282_16 <= 0 and var_282_12 or var_282_12 * (var_282_17 / var_282_16)

				if var_282_18 > 0 and var_282_12 < var_282_18 then
					arg_279_1.talkMaxDuration = var_282_18

					if var_282_18 + var_282_11 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_18 + var_282_11
					end
				end

				arg_279_1.text_.text = var_282_15
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042068", "story_v_out_120042.awb") ~= 0 then
					local var_282_19 = manager.audio:GetVoiceLength("story_v_out_120042", "120042068", "story_v_out_120042.awb") / 1000

					if var_282_19 + var_282_11 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_11
					end

					if var_282_14.prefab_name ~= "" and arg_279_1.actors_[var_282_14.prefab_name] ~= nil then
						local var_282_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_14.prefab_name].transform, "story_v_out_120042", "120042068", "story_v_out_120042.awb")

						arg_279_1:RecordAudio("120042068", var_282_20)
						arg_279_1:RecordAudio("120042068", var_282_20)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_120042", "120042068", "story_v_out_120042.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_120042", "120042068", "story_v_out_120042.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_21 = math.max(var_282_12, arg_279_1.talkMaxDuration)

			if var_282_11 <= arg_279_1.time_ and arg_279_1.time_ < var_282_11 + var_282_21 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_11) / var_282_21

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_11 + var_282_21 and arg_279_1.time_ < var_282_11 + var_282_21 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play120042069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 120042069
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play120042070(arg_283_1)
			end
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
					local var_286_4 = Mathf.Lerp(0, 0.5, var_286_3)

					arg_283_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1071ui_story.fillRatio = var_286_4
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect1071ui_story then
				local var_286_5 = 0.5

				arg_283_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1071ui_story.fillRatio = var_286_5
			end

			local var_286_6 = 0
			local var_286_7 = 0.7

			if var_286_6 < arg_283_1.time_ and arg_283_1.time_ <= var_286_6 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, false)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_8 = arg_283_1:GetWordFromCfg(120042069)
				local var_286_9 = arg_283_1:FormatText(var_286_8.content)

				arg_283_1.text_.text = var_286_9

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_10 = 28
				local var_286_11 = utf8.len(var_286_9)
				local var_286_12 = var_286_10 <= 0 and var_286_7 or var_286_7 * (var_286_11 / var_286_10)

				if var_286_12 > 0 and var_286_7 < var_286_12 then
					arg_283_1.talkMaxDuration = var_286_12

					if var_286_12 + var_286_6 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_12 + var_286_6
					end
				end

				arg_283_1.text_.text = var_286_9
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_13 = math.max(var_286_7, arg_283_1.talkMaxDuration)

			if var_286_6 <= arg_283_1.time_ and arg_283_1.time_ < var_286_6 + var_286_13 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_6) / var_286_13

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_6 + var_286_13 and arg_283_1.time_ < var_286_6 + var_286_13 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play120042070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 120042070
		arg_287_1.duration_ = 8.966

		local var_287_0 = {
			zh = 3.8,
			ja = 8.966
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
				arg_287_0:Play120042071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1071ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1071ui_story == nil then
				arg_287_1.var_.characterEffect1071ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.2

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1071ui_story then
					arg_287_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1071ui_story then
				arg_287_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_290_4 = 0

			if var_290_4 < arg_287_1.time_ and arg_287_1.time_ <= var_290_4 + arg_290_0 then
				arg_287_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_290_5 = 0
			local var_290_6 = 0.275

			if var_290_5 < arg_287_1.time_ and arg_287_1.time_ <= var_290_5 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_7 = arg_287_1:FormatText(StoryNameCfg[384].name)

				arg_287_1.leftNameTxt_.text = var_290_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_8 = arg_287_1:GetWordFromCfg(120042070)
				local var_290_9 = arg_287_1:FormatText(var_290_8.content)

				arg_287_1.text_.text = var_290_9

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_10 = 11
				local var_290_11 = utf8.len(var_290_9)
				local var_290_12 = var_290_10 <= 0 and var_290_6 or var_290_6 * (var_290_11 / var_290_10)

				if var_290_12 > 0 and var_290_6 < var_290_12 then
					arg_287_1.talkMaxDuration = var_290_12

					if var_290_12 + var_290_5 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_12 + var_290_5
					end
				end

				arg_287_1.text_.text = var_290_9
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042070", "story_v_out_120042.awb") ~= 0 then
					local var_290_13 = manager.audio:GetVoiceLength("story_v_out_120042", "120042070", "story_v_out_120042.awb") / 1000

					if var_290_13 + var_290_5 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_13 + var_290_5
					end

					if var_290_8.prefab_name ~= "" and arg_287_1.actors_[var_290_8.prefab_name] ~= nil then
						local var_290_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_8.prefab_name].transform, "story_v_out_120042", "120042070", "story_v_out_120042.awb")

						arg_287_1:RecordAudio("120042070", var_290_14)
						arg_287_1:RecordAudio("120042070", var_290_14)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_120042", "120042070", "story_v_out_120042.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_120042", "120042070", "story_v_out_120042.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_15 = math.max(var_290_6, arg_287_1.talkMaxDuration)

			if var_290_5 <= arg_287_1.time_ and arg_287_1.time_ < var_290_5 + var_290_15 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_5) / var_290_15

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_5 + var_290_15 and arg_287_1.time_ < var_290_5 + var_290_15 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play120042071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 120042071
		arg_291_1.duration_ = 8.066

		local var_291_0 = {
			zh = 2.566,
			ja = 8.066
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
				arg_291_0:Play120042072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1075ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1075ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0, 100, 0)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1075ui_story, var_294_4, var_294_3)

				local var_294_5 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_5.x, var_294_5.y, var_294_5.z)

				local var_294_6 = var_294_0.localEulerAngles

				var_294_6.z = 0
				var_294_6.x = 0
				var_294_0.localEulerAngles = var_294_6
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(0, 100, 0)

				local var_294_7 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_7.x, var_294_7.y, var_294_7.z)

				local var_294_8 = var_294_0.localEulerAngles

				var_294_8.z = 0
				var_294_8.x = 0
				var_294_0.localEulerAngles = var_294_8
			end

			local var_294_9 = arg_291_1.actors_["1069ui_story"].transform
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 then
				arg_291_1.var_.moveOldPos1069ui_story = var_294_9.localPosition
			end

			local var_294_11 = 0.001

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11
				local var_294_13 = Vector3.New(0.7, -1, -6)

				var_294_9.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1069ui_story, var_294_13, var_294_12)

				local var_294_14 = manager.ui.mainCamera.transform.position - var_294_9.position

				var_294_9.forward = Vector3.New(var_294_14.x, var_294_14.y, var_294_14.z)

				local var_294_15 = var_294_9.localEulerAngles

				var_294_15.z = 0
				var_294_15.x = 0
				var_294_9.localEulerAngles = var_294_15
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 then
				var_294_9.localPosition = Vector3.New(0.7, -1, -6)

				local var_294_16 = manager.ui.mainCamera.transform.position - var_294_9.position

				var_294_9.forward = Vector3.New(var_294_16.x, var_294_16.y, var_294_16.z)

				local var_294_17 = var_294_9.localEulerAngles

				var_294_17.z = 0
				var_294_17.x = 0
				var_294_9.localEulerAngles = var_294_17
			end

			local var_294_18 = 0

			if var_294_18 < arg_291_1.time_ and arg_291_1.time_ <= var_294_18 + arg_294_0 then
				arg_291_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_294_19 = arg_291_1.actors_["1069ui_story"]
			local var_294_20 = 0

			if var_294_20 < arg_291_1.time_ and arg_291_1.time_ <= var_294_20 + arg_294_0 and arg_291_1.var_.characterEffect1069ui_story == nil then
				arg_291_1.var_.characterEffect1069ui_story = var_294_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_21 = 0.2

			if var_294_20 <= arg_291_1.time_ and arg_291_1.time_ < var_294_20 + var_294_21 then
				local var_294_22 = (arg_291_1.time_ - var_294_20) / var_294_21

				if arg_291_1.var_.characterEffect1069ui_story then
					arg_291_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_20 + var_294_21 and arg_291_1.time_ < var_294_20 + var_294_21 + arg_294_0 and arg_291_1.var_.characterEffect1069ui_story then
				arg_291_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_294_23 = arg_291_1.actors_["1071ui_story"]
			local var_294_24 = 0

			if var_294_24 < arg_291_1.time_ and arg_291_1.time_ <= var_294_24 + arg_294_0 and arg_291_1.var_.characterEffect1071ui_story == nil then
				arg_291_1.var_.characterEffect1071ui_story = var_294_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_25 = 0.2

			if var_294_24 <= arg_291_1.time_ and arg_291_1.time_ < var_294_24 + var_294_25 then
				local var_294_26 = (arg_291_1.time_ - var_294_24) / var_294_25

				if arg_291_1.var_.characterEffect1071ui_story then
					local var_294_27 = Mathf.Lerp(0, 0.5, var_294_26)

					arg_291_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1071ui_story.fillRatio = var_294_27
				end
			end

			if arg_291_1.time_ >= var_294_24 + var_294_25 and arg_291_1.time_ < var_294_24 + var_294_25 + arg_294_0 and arg_291_1.var_.characterEffect1071ui_story then
				local var_294_28 = 0.5

				arg_291_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1071ui_story.fillRatio = var_294_28
			end

			local var_294_29 = 0
			local var_294_30 = 0.3

			if var_294_29 < arg_291_1.time_ and arg_291_1.time_ <= var_294_29 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_31 = arg_291_1:FormatText(StoryNameCfg[378].name)

				arg_291_1.leftNameTxt_.text = var_294_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_32 = arg_291_1:GetWordFromCfg(120042071)
				local var_294_33 = arg_291_1:FormatText(var_294_32.content)

				arg_291_1.text_.text = var_294_33

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_34 = 12
				local var_294_35 = utf8.len(var_294_33)
				local var_294_36 = var_294_34 <= 0 and var_294_30 or var_294_30 * (var_294_35 / var_294_34)

				if var_294_36 > 0 and var_294_30 < var_294_36 then
					arg_291_1.talkMaxDuration = var_294_36

					if var_294_36 + var_294_29 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_36 + var_294_29
					end
				end

				arg_291_1.text_.text = var_294_33
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042071", "story_v_out_120042.awb") ~= 0 then
					local var_294_37 = manager.audio:GetVoiceLength("story_v_out_120042", "120042071", "story_v_out_120042.awb") / 1000

					if var_294_37 + var_294_29 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_37 + var_294_29
					end

					if var_294_32.prefab_name ~= "" and arg_291_1.actors_[var_294_32.prefab_name] ~= nil then
						local var_294_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_32.prefab_name].transform, "story_v_out_120042", "120042071", "story_v_out_120042.awb")

						arg_291_1:RecordAudio("120042071", var_294_38)
						arg_291_1:RecordAudio("120042071", var_294_38)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_120042", "120042071", "story_v_out_120042.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_120042", "120042071", "story_v_out_120042.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_39 = math.max(var_294_30, arg_291_1.talkMaxDuration)

			if var_294_29 <= arg_291_1.time_ and arg_291_1.time_ < var_294_29 + var_294_39 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_29) / var_294_39

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_29 + var_294_39 and arg_291_1.time_ < var_294_29 + var_294_39 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play120042072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 120042072
		arg_295_1.duration_ = 5.8

		local var_295_0 = {
			zh = 5.8,
			ja = 3.366
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
				arg_295_0:Play120042073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1069ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1069ui_story == nil then
				arg_295_1.var_.characterEffect1069ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.2

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1069ui_story then
					local var_298_4 = Mathf.Lerp(0, 0.5, var_298_3)

					arg_295_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1069ui_story.fillRatio = var_298_4
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1069ui_story then
				local var_298_5 = 0.5

				arg_295_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1069ui_story.fillRatio = var_298_5
			end

			local var_298_6 = arg_295_1.actors_["1071ui_story"]
			local var_298_7 = 0

			if var_298_7 < arg_295_1.time_ and arg_295_1.time_ <= var_298_7 + arg_298_0 and arg_295_1.var_.characterEffect1071ui_story == nil then
				arg_295_1.var_.characterEffect1071ui_story = var_298_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_8 = 0.2

			if var_298_7 <= arg_295_1.time_ and arg_295_1.time_ < var_298_7 + var_298_8 then
				local var_298_9 = (arg_295_1.time_ - var_298_7) / var_298_8

				if arg_295_1.var_.characterEffect1071ui_story then
					arg_295_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_7 + var_298_8 and arg_295_1.time_ < var_298_7 + var_298_8 + arg_298_0 and arg_295_1.var_.characterEffect1071ui_story then
				arg_295_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_298_10 = 0
			local var_298_11 = 0.4

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_12 = arg_295_1:FormatText(StoryNameCfg[384].name)

				arg_295_1.leftNameTxt_.text = var_298_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_13 = arg_295_1:GetWordFromCfg(120042072)
				local var_298_14 = arg_295_1:FormatText(var_298_13.content)

				arg_295_1.text_.text = var_298_14

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_15 = 16
				local var_298_16 = utf8.len(var_298_14)
				local var_298_17 = var_298_15 <= 0 and var_298_11 or var_298_11 * (var_298_16 / var_298_15)

				if var_298_17 > 0 and var_298_11 < var_298_17 then
					arg_295_1.talkMaxDuration = var_298_17

					if var_298_17 + var_298_10 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_17 + var_298_10
					end
				end

				arg_295_1.text_.text = var_298_14
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042072", "story_v_out_120042.awb") ~= 0 then
					local var_298_18 = manager.audio:GetVoiceLength("story_v_out_120042", "120042072", "story_v_out_120042.awb") / 1000

					if var_298_18 + var_298_10 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_18 + var_298_10
					end

					if var_298_13.prefab_name ~= "" and arg_295_1.actors_[var_298_13.prefab_name] ~= nil then
						local var_298_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_13.prefab_name].transform, "story_v_out_120042", "120042072", "story_v_out_120042.awb")

						arg_295_1:RecordAudio("120042072", var_298_19)
						arg_295_1:RecordAudio("120042072", var_298_19)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_120042", "120042072", "story_v_out_120042.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_120042", "120042072", "story_v_out_120042.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_20 = math.max(var_298_11, arg_295_1.talkMaxDuration)

			if var_298_10 <= arg_295_1.time_ and arg_295_1.time_ < var_298_10 + var_298_20 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_10) / var_298_20

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_10 + var_298_20 and arg_295_1.time_ < var_298_10 + var_298_20 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play120042073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 120042073
		arg_299_1.duration_ = 11.766

		local var_299_0 = {
			zh = 11.766,
			ja = 8.5
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
				arg_299_0:Play120042074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 1.3

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[384].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(120042073)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 52
				local var_302_6 = utf8.len(var_302_4)
				local var_302_7 = var_302_5 <= 0 and var_302_1 or var_302_1 * (var_302_6 / var_302_5)

				if var_302_7 > 0 and var_302_1 < var_302_7 then
					arg_299_1.talkMaxDuration = var_302_7

					if var_302_7 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_7 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_4
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042073", "story_v_out_120042.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042073", "story_v_out_120042.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_120042", "120042073", "story_v_out_120042.awb")

						arg_299_1:RecordAudio("120042073", var_302_9)
						arg_299_1:RecordAudio("120042073", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_120042", "120042073", "story_v_out_120042.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_120042", "120042073", "story_v_out_120042.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_10 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_10 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_10

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_10 and arg_299_1.time_ < var_302_0 + var_302_10 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play120042074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 120042074
		arg_303_1.duration_ = 5

		local var_303_0 = {
			zh = 4.2,
			ja = 5
		}
		local var_303_1 = manager.audio:GetLocalizationFlag()

		if var_303_0[var_303_1] ~= nil then
			arg_303_1.duration_ = var_303_0[var_303_1]
		end

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play120042075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1071ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect1071ui_story == nil then
				arg_303_1.var_.characterEffect1071ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.2

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect1071ui_story then
					local var_306_4 = Mathf.Lerp(0, 0.5, var_306_3)

					arg_303_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1071ui_story.fillRatio = var_306_4
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect1071ui_story then
				local var_306_5 = 0.5

				arg_303_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1071ui_story.fillRatio = var_306_5
			end

			local var_306_6 = arg_303_1.actors_["1069ui_story"]
			local var_306_7 = 0

			if var_306_7 < arg_303_1.time_ and arg_303_1.time_ <= var_306_7 + arg_306_0 and arg_303_1.var_.characterEffect1069ui_story == nil then
				arg_303_1.var_.characterEffect1069ui_story = var_306_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_8 = 0.2

			if var_306_7 <= arg_303_1.time_ and arg_303_1.time_ < var_306_7 + var_306_8 then
				local var_306_9 = (arg_303_1.time_ - var_306_7) / var_306_8

				if arg_303_1.var_.characterEffect1069ui_story then
					arg_303_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_7 + var_306_8 and arg_303_1.time_ < var_306_7 + var_306_8 + arg_306_0 and arg_303_1.var_.characterEffect1069ui_story then
				arg_303_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_306_10 = 0

			if var_306_10 < arg_303_1.time_ and arg_303_1.time_ <= var_306_10 + arg_306_0 then
				arg_303_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069actionlink/1069action423")
			end

			local var_306_11 = 0
			local var_306_12 = 0.65

			if var_306_11 < arg_303_1.time_ and arg_303_1.time_ <= var_306_11 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_13 = arg_303_1:FormatText(StoryNameCfg[378].name)

				arg_303_1.leftNameTxt_.text = var_306_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_14 = arg_303_1:GetWordFromCfg(120042074)
				local var_306_15 = arg_303_1:FormatText(var_306_14.content)

				arg_303_1.text_.text = var_306_15

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_16 = 26
				local var_306_17 = utf8.len(var_306_15)
				local var_306_18 = var_306_16 <= 0 and var_306_12 or var_306_12 * (var_306_17 / var_306_16)

				if var_306_18 > 0 and var_306_12 < var_306_18 then
					arg_303_1.talkMaxDuration = var_306_18

					if var_306_18 + var_306_11 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_18 + var_306_11
					end
				end

				arg_303_1.text_.text = var_306_15
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042074", "story_v_out_120042.awb") ~= 0 then
					local var_306_19 = manager.audio:GetVoiceLength("story_v_out_120042", "120042074", "story_v_out_120042.awb") / 1000

					if var_306_19 + var_306_11 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_19 + var_306_11
					end

					if var_306_14.prefab_name ~= "" and arg_303_1.actors_[var_306_14.prefab_name] ~= nil then
						local var_306_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_14.prefab_name].transform, "story_v_out_120042", "120042074", "story_v_out_120042.awb")

						arg_303_1:RecordAudio("120042074", var_306_20)
						arg_303_1:RecordAudio("120042074", var_306_20)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_120042", "120042074", "story_v_out_120042.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_120042", "120042074", "story_v_out_120042.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_21 = math.max(var_306_12, arg_303_1.talkMaxDuration)

			if var_306_11 <= arg_303_1.time_ and arg_303_1.time_ < var_306_11 + var_306_21 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_11) / var_306_21

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_11 + var_306_21 and arg_303_1.time_ < var_306_11 + var_306_21 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play120042075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 120042075
		arg_307_1.duration_ = 6.933

		local var_307_0 = {
			zh = 6.233,
			ja = 6.933
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
				arg_307_0:Play120042076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1071ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.characterEffect1071ui_story == nil then
				arg_307_1.var_.characterEffect1071ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.2

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect1071ui_story then
					arg_307_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect1071ui_story then
				arg_307_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_310_4 = arg_307_1.actors_["1069ui_story"]
			local var_310_5 = 0

			if var_310_5 < arg_307_1.time_ and arg_307_1.time_ <= var_310_5 + arg_310_0 and arg_307_1.var_.characterEffect1069ui_story == nil then
				arg_307_1.var_.characterEffect1069ui_story = var_310_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_6 = 0.2

			if var_310_5 <= arg_307_1.time_ and arg_307_1.time_ < var_310_5 + var_310_6 then
				local var_310_7 = (arg_307_1.time_ - var_310_5) / var_310_6

				if arg_307_1.var_.characterEffect1069ui_story then
					local var_310_8 = Mathf.Lerp(0, 0.5, var_310_7)

					arg_307_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1069ui_story.fillRatio = var_310_8
				end
			end

			if arg_307_1.time_ >= var_310_5 + var_310_6 and arg_307_1.time_ < var_310_5 + var_310_6 + arg_310_0 and arg_307_1.var_.characterEffect1069ui_story then
				local var_310_9 = 0.5

				arg_307_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1069ui_story.fillRatio = var_310_9
			end

			local var_310_10 = 0
			local var_310_11 = 0.725

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_12 = arg_307_1:FormatText(StoryNameCfg[384].name)

				arg_307_1.leftNameTxt_.text = var_310_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_13 = arg_307_1:GetWordFromCfg(120042075)
				local var_310_14 = arg_307_1:FormatText(var_310_13.content)

				arg_307_1.text_.text = var_310_14

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_15 = 29
				local var_310_16 = utf8.len(var_310_14)
				local var_310_17 = var_310_15 <= 0 and var_310_11 or var_310_11 * (var_310_16 / var_310_15)

				if var_310_17 > 0 and var_310_11 < var_310_17 then
					arg_307_1.talkMaxDuration = var_310_17

					if var_310_17 + var_310_10 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_17 + var_310_10
					end
				end

				arg_307_1.text_.text = var_310_14
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042075", "story_v_out_120042.awb") ~= 0 then
					local var_310_18 = manager.audio:GetVoiceLength("story_v_out_120042", "120042075", "story_v_out_120042.awb") / 1000

					if var_310_18 + var_310_10 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_18 + var_310_10
					end

					if var_310_13.prefab_name ~= "" and arg_307_1.actors_[var_310_13.prefab_name] ~= nil then
						local var_310_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_13.prefab_name].transform, "story_v_out_120042", "120042075", "story_v_out_120042.awb")

						arg_307_1:RecordAudio("120042075", var_310_19)
						arg_307_1:RecordAudio("120042075", var_310_19)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_120042", "120042075", "story_v_out_120042.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_120042", "120042075", "story_v_out_120042.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_20 = math.max(var_310_11, arg_307_1.talkMaxDuration)

			if var_310_10 <= arg_307_1.time_ and arg_307_1.time_ < var_310_10 + var_310_20 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_10) / var_310_20

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_10 + var_310_20 and arg_307_1.time_ < var_310_10 + var_310_20 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play120042076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 120042076
		arg_311_1.duration_ = 6.9

		local var_311_0 = {
			zh = 5.5,
			ja = 6.9
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
				arg_311_0:Play120042077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.65

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_2 = arg_311_1:FormatText(StoryNameCfg[384].name)

				arg_311_1.leftNameTxt_.text = var_314_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_3 = arg_311_1:GetWordFromCfg(120042076)
				local var_314_4 = arg_311_1:FormatText(var_314_3.content)

				arg_311_1.text_.text = var_314_4

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_5 = 26
				local var_314_6 = utf8.len(var_314_4)
				local var_314_7 = var_314_5 <= 0 and var_314_1 or var_314_1 * (var_314_6 / var_314_5)

				if var_314_7 > 0 and var_314_1 < var_314_7 then
					arg_311_1.talkMaxDuration = var_314_7

					if var_314_7 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_7 + var_314_0
					end
				end

				arg_311_1.text_.text = var_314_4
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042076", "story_v_out_120042.awb") ~= 0 then
					local var_314_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042076", "story_v_out_120042.awb") / 1000

					if var_314_8 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_8 + var_314_0
					end

					if var_314_3.prefab_name ~= "" and arg_311_1.actors_[var_314_3.prefab_name] ~= nil then
						local var_314_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_3.prefab_name].transform, "story_v_out_120042", "120042076", "story_v_out_120042.awb")

						arg_311_1:RecordAudio("120042076", var_314_9)
						arg_311_1:RecordAudio("120042076", var_314_9)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_120042", "120042076", "story_v_out_120042.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_120042", "120042076", "story_v_out_120042.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_10 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_10 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_10

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_10 and arg_311_1.time_ < var_314_0 + var_314_10 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play120042077 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 120042077
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play120042078(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1069ui_story"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos1069ui_story = var_318_0.localPosition
			end

			local var_318_2 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2
				local var_318_4 = Vector3.New(0, 100, 0)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1069ui_story, var_318_4, var_318_3)

				local var_318_5 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_5.x, var_318_5.y, var_318_5.z)

				local var_318_6 = var_318_0.localEulerAngles

				var_318_6.z = 0
				var_318_6.x = 0
				var_318_0.localEulerAngles = var_318_6
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(0, 100, 0)

				local var_318_7 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_7.x, var_318_7.y, var_318_7.z)

				local var_318_8 = var_318_0.localEulerAngles

				var_318_8.z = 0
				var_318_8.x = 0
				var_318_0.localEulerAngles = var_318_8
			end

			local var_318_9 = arg_315_1.actors_["1071ui_story"].transform
			local var_318_10 = 0

			if var_318_10 < arg_315_1.time_ and arg_315_1.time_ <= var_318_10 + arg_318_0 then
				arg_315_1.var_.moveOldPos1071ui_story = var_318_9.localPosition
			end

			local var_318_11 = 0.001

			if var_318_10 <= arg_315_1.time_ and arg_315_1.time_ < var_318_10 + var_318_11 then
				local var_318_12 = (arg_315_1.time_ - var_318_10) / var_318_11
				local var_318_13 = Vector3.New(0, 100, 0)

				var_318_9.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1071ui_story, var_318_13, var_318_12)

				local var_318_14 = manager.ui.mainCamera.transform.position - var_318_9.position

				var_318_9.forward = Vector3.New(var_318_14.x, var_318_14.y, var_318_14.z)

				local var_318_15 = var_318_9.localEulerAngles

				var_318_15.z = 0
				var_318_15.x = 0
				var_318_9.localEulerAngles = var_318_15
			end

			if arg_315_1.time_ >= var_318_10 + var_318_11 and arg_315_1.time_ < var_318_10 + var_318_11 + arg_318_0 then
				var_318_9.localPosition = Vector3.New(0, 100, 0)

				local var_318_16 = manager.ui.mainCamera.transform.position - var_318_9.position

				var_318_9.forward = Vector3.New(var_318_16.x, var_318_16.y, var_318_16.z)

				local var_318_17 = var_318_9.localEulerAngles

				var_318_17.z = 0
				var_318_17.x = 0
				var_318_9.localEulerAngles = var_318_17
			end

			local var_318_18 = 0
			local var_318_19 = 0.9

			if var_318_18 < arg_315_1.time_ and arg_315_1.time_ <= var_318_18 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_20 = arg_315_1:GetWordFromCfg(120042077)
				local var_318_21 = arg_315_1:FormatText(var_318_20.content)

				arg_315_1.text_.text = var_318_21

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_22 = 36
				local var_318_23 = utf8.len(var_318_21)
				local var_318_24 = var_318_22 <= 0 and var_318_19 or var_318_19 * (var_318_23 / var_318_22)

				if var_318_24 > 0 and var_318_19 < var_318_24 then
					arg_315_1.talkMaxDuration = var_318_24

					if var_318_24 + var_318_18 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_24 + var_318_18
					end
				end

				arg_315_1.text_.text = var_318_21
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_25 = math.max(var_318_19, arg_315_1.talkMaxDuration)

			if var_318_18 <= arg_315_1.time_ and arg_315_1.time_ < var_318_18 + var_318_25 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_18) / var_318_25

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_18 + var_318_25 and arg_315_1.time_ < var_318_18 + var_318_25 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play120042078 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 120042078
		arg_319_1.duration_ = 5.866

		local var_319_0 = {
			zh = 5.866,
			ja = 5.533
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
				arg_319_0:Play120042079(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1071ui_story"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.characterEffect1071ui_story == nil then
				arg_319_1.var_.characterEffect1071ui_story = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.2

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect1071ui_story then
					arg_319_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1071ui_story then
				arg_319_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_322_4 = arg_319_1.actors_["1071ui_story"].transform
			local var_322_5 = 0

			if var_322_5 < arg_319_1.time_ and arg_319_1.time_ <= var_322_5 + arg_322_0 then
				arg_319_1.var_.moveOldPos1071ui_story = var_322_4.localPosition
			end

			local var_322_6 = 0.001

			if var_322_5 <= arg_319_1.time_ and arg_319_1.time_ < var_322_5 + var_322_6 then
				local var_322_7 = (arg_319_1.time_ - var_322_5) / var_322_6
				local var_322_8 = Vector3.New(0, -1.05, -6.2)

				var_322_4.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1071ui_story, var_322_8, var_322_7)

				local var_322_9 = manager.ui.mainCamera.transform.position - var_322_4.position

				var_322_4.forward = Vector3.New(var_322_9.x, var_322_9.y, var_322_9.z)

				local var_322_10 = var_322_4.localEulerAngles

				var_322_10.z = 0
				var_322_10.x = 0
				var_322_4.localEulerAngles = var_322_10
			end

			if arg_319_1.time_ >= var_322_5 + var_322_6 and arg_319_1.time_ < var_322_5 + var_322_6 + arg_322_0 then
				var_322_4.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_322_11 = manager.ui.mainCamera.transform.position - var_322_4.position

				var_322_4.forward = Vector3.New(var_322_11.x, var_322_11.y, var_322_11.z)

				local var_322_12 = var_322_4.localEulerAngles

				var_322_12.z = 0
				var_322_12.x = 0
				var_322_4.localEulerAngles = var_322_12
			end

			local var_322_13 = 0
			local var_322_14 = 0.4

			if var_322_13 < arg_319_1.time_ and arg_319_1.time_ <= var_322_13 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_15 = arg_319_1:FormatText(StoryNameCfg[384].name)

				arg_319_1.leftNameTxt_.text = var_322_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_16 = arg_319_1:GetWordFromCfg(120042078)
				local var_322_17 = arg_319_1:FormatText(var_322_16.content)

				arg_319_1.text_.text = var_322_17

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_18 = 16
				local var_322_19 = utf8.len(var_322_17)
				local var_322_20 = var_322_18 <= 0 and var_322_14 or var_322_14 * (var_322_19 / var_322_18)

				if var_322_20 > 0 and var_322_14 < var_322_20 then
					arg_319_1.talkMaxDuration = var_322_20

					if var_322_20 + var_322_13 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_20 + var_322_13
					end
				end

				arg_319_1.text_.text = var_322_17
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042078", "story_v_out_120042.awb") ~= 0 then
					local var_322_21 = manager.audio:GetVoiceLength("story_v_out_120042", "120042078", "story_v_out_120042.awb") / 1000

					if var_322_21 + var_322_13 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_21 + var_322_13
					end

					if var_322_16.prefab_name ~= "" and arg_319_1.actors_[var_322_16.prefab_name] ~= nil then
						local var_322_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_16.prefab_name].transform, "story_v_out_120042", "120042078", "story_v_out_120042.awb")

						arg_319_1:RecordAudio("120042078", var_322_22)
						arg_319_1:RecordAudio("120042078", var_322_22)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_120042", "120042078", "story_v_out_120042.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_120042", "120042078", "story_v_out_120042.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_23 = math.max(var_322_14, arg_319_1.talkMaxDuration)

			if var_322_13 <= arg_319_1.time_ and arg_319_1.time_ < var_322_13 + var_322_23 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_13) / var_322_23

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_13 + var_322_23 and arg_319_1.time_ < var_322_13 + var_322_23 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play120042079 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 120042079
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play120042080(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1071ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect1071ui_story == nil then
				arg_323_1.var_.characterEffect1071ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.2

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect1071ui_story then
					local var_326_4 = Mathf.Lerp(0, 0.5, var_326_3)

					arg_323_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1071ui_story.fillRatio = var_326_4
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect1071ui_story then
				local var_326_5 = 0.5

				arg_323_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1071ui_story.fillRatio = var_326_5
			end

			local var_326_6 = 0
			local var_326_7 = 1.575

			if var_326_6 < arg_323_1.time_ and arg_323_1.time_ <= var_326_6 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_8 = arg_323_1:GetWordFromCfg(120042079)
				local var_326_9 = arg_323_1:FormatText(var_326_8.content)

				arg_323_1.text_.text = var_326_9

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_10 = 63
				local var_326_11 = utf8.len(var_326_9)
				local var_326_12 = var_326_10 <= 0 and var_326_7 or var_326_7 * (var_326_11 / var_326_10)

				if var_326_12 > 0 and var_326_7 < var_326_12 then
					arg_323_1.talkMaxDuration = var_326_12

					if var_326_12 + var_326_6 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_12 + var_326_6
					end
				end

				arg_323_1.text_.text = var_326_9
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_13 = math.max(var_326_7, arg_323_1.talkMaxDuration)

			if var_326_6 <= arg_323_1.time_ and arg_323_1.time_ < var_326_6 + var_326_13 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_6) / var_326_13

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_6 + var_326_13 and arg_323_1.time_ < var_326_6 + var_326_13 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play120042080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 120042080
		arg_327_1.duration_ = 7.5

		local var_327_0 = {
			zh = 6.833,
			ja = 7.5
		}
		local var_327_1 = manager.audio:GetLocalizationFlag()

		if var_327_0[var_327_1] ~= nil then
			arg_327_1.duration_ = var_327_0[var_327_1]
		end

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play120042081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1071ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1071ui_story == nil then
				arg_327_1.var_.characterEffect1071ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.2

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1071ui_story then
					arg_327_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1071ui_story then
				arg_327_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_330_4 = 0

			if var_330_4 < arg_327_1.time_ and arg_327_1.time_ <= var_330_4 + arg_330_0 then
				arg_327_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_330_5 = 0
			local var_330_6 = 0.575

			if var_330_5 < arg_327_1.time_ and arg_327_1.time_ <= var_330_5 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_7 = arg_327_1:FormatText(StoryNameCfg[384].name)

				arg_327_1.leftNameTxt_.text = var_330_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_8 = arg_327_1:GetWordFromCfg(120042080)
				local var_330_9 = arg_327_1:FormatText(var_330_8.content)

				arg_327_1.text_.text = var_330_9

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_10 = 23
				local var_330_11 = utf8.len(var_330_9)
				local var_330_12 = var_330_10 <= 0 and var_330_6 or var_330_6 * (var_330_11 / var_330_10)

				if var_330_12 > 0 and var_330_6 < var_330_12 then
					arg_327_1.talkMaxDuration = var_330_12

					if var_330_12 + var_330_5 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_12 + var_330_5
					end
				end

				arg_327_1.text_.text = var_330_9
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042080", "story_v_out_120042.awb") ~= 0 then
					local var_330_13 = manager.audio:GetVoiceLength("story_v_out_120042", "120042080", "story_v_out_120042.awb") / 1000

					if var_330_13 + var_330_5 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_13 + var_330_5
					end

					if var_330_8.prefab_name ~= "" and arg_327_1.actors_[var_330_8.prefab_name] ~= nil then
						local var_330_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_8.prefab_name].transform, "story_v_out_120042", "120042080", "story_v_out_120042.awb")

						arg_327_1:RecordAudio("120042080", var_330_14)
						arg_327_1:RecordAudio("120042080", var_330_14)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_120042", "120042080", "story_v_out_120042.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_120042", "120042080", "story_v_out_120042.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_15 = math.max(var_330_6, arg_327_1.talkMaxDuration)

			if var_330_5 <= arg_327_1.time_ and arg_327_1.time_ < var_330_5 + var_330_15 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_5) / var_330_15

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_5 + var_330_15 and arg_327_1.time_ < var_330_5 + var_330_15 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play120042081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 120042081
		arg_331_1.duration_ = 3.566

		local var_331_0 = {
			zh = 3.566,
			ja = 3.266
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
				arg_331_0:Play120042082(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1071ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1071ui_story == nil then
				arg_331_1.var_.characterEffect1071ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.2

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1071ui_story then
					local var_334_4 = Mathf.Lerp(0, 0.5, var_334_3)

					arg_331_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1071ui_story.fillRatio = var_334_4
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1071ui_story then
				local var_334_5 = 0.5

				arg_331_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1071ui_story.fillRatio = var_334_5
			end

			local var_334_6 = 0

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_334_7 = 0
			local var_334_8 = 0.275

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_9 = arg_331_1:FormatText(StoryNameCfg[380].name)

				arg_331_1.leftNameTxt_.text = var_334_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, true)
				arg_331_1.iconController_:SetSelectedState("hero")

				arg_331_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10044")

				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_10 = arg_331_1:GetWordFromCfg(120042081)
				local var_334_11 = arg_331_1:FormatText(var_334_10.content)

				arg_331_1.text_.text = var_334_11

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_12 = 11
				local var_334_13 = utf8.len(var_334_11)
				local var_334_14 = var_334_12 <= 0 and var_334_8 or var_334_8 * (var_334_13 / var_334_12)

				if var_334_14 > 0 and var_334_8 < var_334_14 then
					arg_331_1.talkMaxDuration = var_334_14

					if var_334_14 + var_334_7 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_14 + var_334_7
					end
				end

				arg_331_1.text_.text = var_334_11
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042081", "story_v_out_120042.awb") ~= 0 then
					local var_334_15 = manager.audio:GetVoiceLength("story_v_out_120042", "120042081", "story_v_out_120042.awb") / 1000

					if var_334_15 + var_334_7 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_15 + var_334_7
					end

					if var_334_10.prefab_name ~= "" and arg_331_1.actors_[var_334_10.prefab_name] ~= nil then
						local var_334_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_10.prefab_name].transform, "story_v_out_120042", "120042081", "story_v_out_120042.awb")

						arg_331_1:RecordAudio("120042081", var_334_16)
						arg_331_1:RecordAudio("120042081", var_334_16)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_120042", "120042081", "story_v_out_120042.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_120042", "120042081", "story_v_out_120042.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_17 = math.max(var_334_8, arg_331_1.talkMaxDuration)

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_17 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_7) / var_334_17

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_7 + var_334_17 and arg_331_1.time_ < var_334_7 + var_334_17 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play120042082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 120042082
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play120042083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 0.6

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, false)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_2 = arg_335_1:GetWordFromCfg(120042082)
				local var_338_3 = arg_335_1:FormatText(var_338_2.content)

				arg_335_1.text_.text = var_338_3

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_4 = 24
				local var_338_5 = utf8.len(var_338_3)
				local var_338_6 = var_338_4 <= 0 and var_338_1 or var_338_1 * (var_338_5 / var_338_4)

				if var_338_6 > 0 and var_338_1 < var_338_6 then
					arg_335_1.talkMaxDuration = var_338_6

					if var_338_6 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_6 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_3
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_7 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_7 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_7

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_7 and arg_335_1.time_ < var_338_0 + var_338_7 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play120042083 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 120042083
		arg_339_1.duration_ = 8.366

		local var_339_0 = {
			zh = 4.3,
			ja = 8.366
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
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play120042084(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1071ui_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and arg_339_1.var_.characterEffect1071ui_story == nil then
				arg_339_1.var_.characterEffect1071ui_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.2

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect1071ui_story then
					arg_339_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect1071ui_story then
				arg_339_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_342_4 = 0
			local var_342_5 = 0.5

			if var_342_4 < arg_339_1.time_ and arg_339_1.time_ <= var_342_4 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_6 = arg_339_1:FormatText(StoryNameCfg[384].name)

				arg_339_1.leftNameTxt_.text = var_342_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_7 = arg_339_1:GetWordFromCfg(120042083)
				local var_342_8 = arg_339_1:FormatText(var_342_7.content)

				arg_339_1.text_.text = var_342_8

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_9 = 20
				local var_342_10 = utf8.len(var_342_8)
				local var_342_11 = var_342_9 <= 0 and var_342_5 or var_342_5 * (var_342_10 / var_342_9)

				if var_342_11 > 0 and var_342_5 < var_342_11 then
					arg_339_1.talkMaxDuration = var_342_11

					if var_342_11 + var_342_4 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_11 + var_342_4
					end
				end

				arg_339_1.text_.text = var_342_8
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042083", "story_v_out_120042.awb") ~= 0 then
					local var_342_12 = manager.audio:GetVoiceLength("story_v_out_120042", "120042083", "story_v_out_120042.awb") / 1000

					if var_342_12 + var_342_4 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_12 + var_342_4
					end

					if var_342_7.prefab_name ~= "" and arg_339_1.actors_[var_342_7.prefab_name] ~= nil then
						local var_342_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_7.prefab_name].transform, "story_v_out_120042", "120042083", "story_v_out_120042.awb")

						arg_339_1:RecordAudio("120042083", var_342_13)
						arg_339_1:RecordAudio("120042083", var_342_13)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_120042", "120042083", "story_v_out_120042.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_120042", "120042083", "story_v_out_120042.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_14 = math.max(var_342_5, arg_339_1.talkMaxDuration)

			if var_342_4 <= arg_339_1.time_ and arg_339_1.time_ < var_342_4 + var_342_14 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_4) / var_342_14

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_4 + var_342_14 and arg_339_1.time_ < var_342_4 + var_342_14 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play120042084 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 120042084
		arg_343_1.duration_ = 9.633

		local var_343_0 = {
			zh = 9.633,
			ja = 8.4
		}
		local var_343_1 = manager.audio:GetLocalizationFlag()

		if var_343_0[var_343_1] ~= nil then
			arg_343_1.duration_ = var_343_0[var_343_1]
		end

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play120042085(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0
			local var_346_1 = 0.775

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_2 = arg_343_1:FormatText(StoryNameCfg[384].name)

				arg_343_1.leftNameTxt_.text = var_346_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_3 = arg_343_1:GetWordFromCfg(120042084)
				local var_346_4 = arg_343_1:FormatText(var_346_3.content)

				arg_343_1.text_.text = var_346_4

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_5 = 31
				local var_346_6 = utf8.len(var_346_4)
				local var_346_7 = var_346_5 <= 0 and var_346_1 or var_346_1 * (var_346_6 / var_346_5)

				if var_346_7 > 0 and var_346_1 < var_346_7 then
					arg_343_1.talkMaxDuration = var_346_7

					if var_346_7 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_7 + var_346_0
					end
				end

				arg_343_1.text_.text = var_346_4
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042084", "story_v_out_120042.awb") ~= 0 then
					local var_346_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042084", "story_v_out_120042.awb") / 1000

					if var_346_8 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_8 + var_346_0
					end

					if var_346_3.prefab_name ~= "" and arg_343_1.actors_[var_346_3.prefab_name] ~= nil then
						local var_346_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_3.prefab_name].transform, "story_v_out_120042", "120042084", "story_v_out_120042.awb")

						arg_343_1:RecordAudio("120042084", var_346_9)
						arg_343_1:RecordAudio("120042084", var_346_9)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_120042", "120042084", "story_v_out_120042.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_120042", "120042084", "story_v_out_120042.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_10 = math.max(var_346_1, arg_343_1.talkMaxDuration)

			if var_346_0 <= arg_343_1.time_ and arg_343_1.time_ < var_346_0 + var_346_10 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_0) / var_346_10

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_0 + var_346_10 and arg_343_1.time_ < var_346_0 + var_346_10 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play120042085 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 120042085
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play120042086(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1071ui_story"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos1071ui_story = var_350_0.localPosition
			end

			local var_350_2 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2
				local var_350_4 = Vector3.New(0, 100, 0)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1071ui_story, var_350_4, var_350_3)

				local var_350_5 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_5.x, var_350_5.y, var_350_5.z)

				local var_350_6 = var_350_0.localEulerAngles

				var_350_6.z = 0
				var_350_6.x = 0
				var_350_0.localEulerAngles = var_350_6
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 then
				var_350_0.localPosition = Vector3.New(0, 100, 0)

				local var_350_7 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_7.x, var_350_7.y, var_350_7.z)

				local var_350_8 = var_350_0.localEulerAngles

				var_350_8.z = 0
				var_350_8.x = 0
				var_350_0.localEulerAngles = var_350_8
			end

			local var_350_9 = 0
			local var_350_10 = 0.725

			if var_350_9 < arg_347_1.time_ and arg_347_1.time_ <= var_350_9 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, false)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_11 = arg_347_1:GetWordFromCfg(120042085)
				local var_350_12 = arg_347_1:FormatText(var_350_11.content)

				arg_347_1.text_.text = var_350_12

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_13 = 29
				local var_350_14 = utf8.len(var_350_12)
				local var_350_15 = var_350_13 <= 0 and var_350_10 or var_350_10 * (var_350_14 / var_350_13)

				if var_350_15 > 0 and var_350_10 < var_350_15 then
					arg_347_1.talkMaxDuration = var_350_15

					if var_350_15 + var_350_9 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_15 + var_350_9
					end
				end

				arg_347_1.text_.text = var_350_12
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_16 = math.max(var_350_10, arg_347_1.talkMaxDuration)

			if var_350_9 <= arg_347_1.time_ and arg_347_1.time_ < var_350_9 + var_350_16 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_9) / var_350_16

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_9 + var_350_16 and arg_347_1.time_ < var_350_9 + var_350_16 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play120042086 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 120042086
		arg_351_1.duration_ = 6.933

		local var_351_0 = {
			zh = 2.266,
			ja = 6.933
		}
		local var_351_1 = manager.audio:GetLocalizationFlag()

		if var_351_0[var_351_1] ~= nil then
			arg_351_1.duration_ = var_351_0[var_351_1]
		end

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play120042087(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1069ui_story"].transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPos1069ui_story = var_354_0.localPosition
			end

			local var_354_2 = 0.001

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2
				local var_354_4 = Vector3.New(0.7, -1, -6)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1069ui_story, var_354_4, var_354_3)

				local var_354_5 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_5.x, var_354_5.y, var_354_5.z)

				local var_354_6 = var_354_0.localEulerAngles

				var_354_6.z = 0
				var_354_6.x = 0
				var_354_0.localEulerAngles = var_354_6
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(0.7, -1, -6)

				local var_354_7 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_7.x, var_354_7.y, var_354_7.z)

				local var_354_8 = var_354_0.localEulerAngles

				var_354_8.z = 0
				var_354_8.x = 0
				var_354_0.localEulerAngles = var_354_8
			end

			local var_354_9 = arg_351_1.actors_["1071ui_story"].transform
			local var_354_10 = 0

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 then
				arg_351_1.var_.moveOldPos1071ui_story = var_354_9.localPosition
			end

			local var_354_11 = 0.001

			if var_354_10 <= arg_351_1.time_ and arg_351_1.time_ < var_354_10 + var_354_11 then
				local var_354_12 = (arg_351_1.time_ - var_354_10) / var_354_11
				local var_354_13 = Vector3.New(-0.7, -1.05, -6.2)

				var_354_9.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1071ui_story, var_354_13, var_354_12)

				local var_354_14 = manager.ui.mainCamera.transform.position - var_354_9.position

				var_354_9.forward = Vector3.New(var_354_14.x, var_354_14.y, var_354_14.z)

				local var_354_15 = var_354_9.localEulerAngles

				var_354_15.z = 0
				var_354_15.x = 0
				var_354_9.localEulerAngles = var_354_15
			end

			if arg_351_1.time_ >= var_354_10 + var_354_11 and arg_351_1.time_ < var_354_10 + var_354_11 + arg_354_0 then
				var_354_9.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_354_16 = manager.ui.mainCamera.transform.position - var_354_9.position

				var_354_9.forward = Vector3.New(var_354_16.x, var_354_16.y, var_354_16.z)

				local var_354_17 = var_354_9.localEulerAngles

				var_354_17.z = 0
				var_354_17.x = 0
				var_354_9.localEulerAngles = var_354_17
			end

			local var_354_18 = arg_351_1.actors_["1069ui_story"]
			local var_354_19 = 0

			if var_354_19 < arg_351_1.time_ and arg_351_1.time_ <= var_354_19 + arg_354_0 and arg_351_1.var_.characterEffect1069ui_story == nil then
				arg_351_1.var_.characterEffect1069ui_story = var_354_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_20 = 0.2

			if var_354_19 <= arg_351_1.time_ and arg_351_1.time_ < var_354_19 + var_354_20 then
				local var_354_21 = (arg_351_1.time_ - var_354_19) / var_354_20

				if arg_351_1.var_.characterEffect1069ui_story then
					arg_351_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_19 + var_354_20 and arg_351_1.time_ < var_354_19 + var_354_20 + arg_354_0 and arg_351_1.var_.characterEffect1069ui_story then
				arg_351_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_354_22 = arg_351_1.actors_["1071ui_story"]
			local var_354_23 = 0

			if var_354_23 < arg_351_1.time_ and arg_351_1.time_ <= var_354_23 + arg_354_0 and arg_351_1.var_.characterEffect1071ui_story == nil then
				arg_351_1.var_.characterEffect1071ui_story = var_354_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_24 = 0.0166666666666667

			if var_354_23 <= arg_351_1.time_ and arg_351_1.time_ < var_354_23 + var_354_24 then
				local var_354_25 = (arg_351_1.time_ - var_354_23) / var_354_24

				if arg_351_1.var_.characterEffect1071ui_story then
					local var_354_26 = Mathf.Lerp(0, 0.5, var_354_25)

					arg_351_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_351_1.var_.characterEffect1071ui_story.fillRatio = var_354_26
				end
			end

			if arg_351_1.time_ >= var_354_23 + var_354_24 and arg_351_1.time_ < var_354_23 + var_354_24 + arg_354_0 and arg_351_1.var_.characterEffect1071ui_story then
				local var_354_27 = 0.5

				arg_351_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_351_1.var_.characterEffect1071ui_story.fillRatio = var_354_27
			end

			local var_354_28 = 0

			if var_354_28 < arg_351_1.time_ and arg_351_1.time_ <= var_354_28 + arg_354_0 then
				arg_351_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action4_1")
			end

			local var_354_29 = 0
			local var_354_30 = 0.275

			if var_354_29 < arg_351_1.time_ and arg_351_1.time_ <= var_354_29 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_31 = arg_351_1:FormatText(StoryNameCfg[378].name)

				arg_351_1.leftNameTxt_.text = var_354_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_32 = arg_351_1:GetWordFromCfg(120042086)
				local var_354_33 = arg_351_1:FormatText(var_354_32.content)

				arg_351_1.text_.text = var_354_33

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_34 = 11
				local var_354_35 = utf8.len(var_354_33)
				local var_354_36 = var_354_34 <= 0 and var_354_30 or var_354_30 * (var_354_35 / var_354_34)

				if var_354_36 > 0 and var_354_30 < var_354_36 then
					arg_351_1.talkMaxDuration = var_354_36

					if var_354_36 + var_354_29 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_36 + var_354_29
					end
				end

				arg_351_1.text_.text = var_354_33
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042086", "story_v_out_120042.awb") ~= 0 then
					local var_354_37 = manager.audio:GetVoiceLength("story_v_out_120042", "120042086", "story_v_out_120042.awb") / 1000

					if var_354_37 + var_354_29 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_37 + var_354_29
					end

					if var_354_32.prefab_name ~= "" and arg_351_1.actors_[var_354_32.prefab_name] ~= nil then
						local var_354_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_32.prefab_name].transform, "story_v_out_120042", "120042086", "story_v_out_120042.awb")

						arg_351_1:RecordAudio("120042086", var_354_38)
						arg_351_1:RecordAudio("120042086", var_354_38)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_120042", "120042086", "story_v_out_120042.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_120042", "120042086", "story_v_out_120042.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_39 = math.max(var_354_30, arg_351_1.talkMaxDuration)

			if var_354_29 <= arg_351_1.time_ and arg_351_1.time_ < var_354_29 + var_354_39 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_29) / var_354_39

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_29 + var_354_39 and arg_351_1.time_ < var_354_29 + var_354_39 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play120042087 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 120042087
		arg_355_1.duration_ = 9.1

		local var_355_0 = {
			zh = 5.9,
			ja = 9.1
		}
		local var_355_1 = manager.audio:GetLocalizationFlag()

		if var_355_0[var_355_1] ~= nil then
			arg_355_1.duration_ = var_355_0[var_355_1]
		end

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play120042088(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1071ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect1071ui_story == nil then
				arg_355_1.var_.characterEffect1071ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.2

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect1071ui_story then
					arg_355_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1071ui_story then
				arg_355_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_358_4 = 0

			if var_358_4 < arg_355_1.time_ and arg_355_1.time_ <= var_358_4 + arg_358_0 then
				arg_355_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_358_5 = arg_355_1.actors_["1069ui_story"]
			local var_358_6 = 0

			if var_358_6 < arg_355_1.time_ and arg_355_1.time_ <= var_358_6 + arg_358_0 and arg_355_1.var_.characterEffect1069ui_story == nil then
				arg_355_1.var_.characterEffect1069ui_story = var_358_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_7 = 0.2

			if var_358_6 <= arg_355_1.time_ and arg_355_1.time_ < var_358_6 + var_358_7 then
				local var_358_8 = (arg_355_1.time_ - var_358_6) / var_358_7

				if arg_355_1.var_.characterEffect1069ui_story then
					local var_358_9 = Mathf.Lerp(0, 0.5, var_358_8)

					arg_355_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1069ui_story.fillRatio = var_358_9
				end
			end

			if arg_355_1.time_ >= var_358_6 + var_358_7 and arg_355_1.time_ < var_358_6 + var_358_7 + arg_358_0 and arg_355_1.var_.characterEffect1069ui_story then
				local var_358_10 = 0.5

				arg_355_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1069ui_story.fillRatio = var_358_10
			end

			local var_358_11 = 0
			local var_358_12 = 0.65

			if var_358_11 < arg_355_1.time_ and arg_355_1.time_ <= var_358_11 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_13 = arg_355_1:FormatText(StoryNameCfg[384].name)

				arg_355_1.leftNameTxt_.text = var_358_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_14 = arg_355_1:GetWordFromCfg(120042087)
				local var_358_15 = arg_355_1:FormatText(var_358_14.content)

				arg_355_1.text_.text = var_358_15

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_16 = 26
				local var_358_17 = utf8.len(var_358_15)
				local var_358_18 = var_358_16 <= 0 and var_358_12 or var_358_12 * (var_358_17 / var_358_16)

				if var_358_18 > 0 and var_358_12 < var_358_18 then
					arg_355_1.talkMaxDuration = var_358_18

					if var_358_18 + var_358_11 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_18 + var_358_11
					end
				end

				arg_355_1.text_.text = var_358_15
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042087", "story_v_out_120042.awb") ~= 0 then
					local var_358_19 = manager.audio:GetVoiceLength("story_v_out_120042", "120042087", "story_v_out_120042.awb") / 1000

					if var_358_19 + var_358_11 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_19 + var_358_11
					end

					if var_358_14.prefab_name ~= "" and arg_355_1.actors_[var_358_14.prefab_name] ~= nil then
						local var_358_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_14.prefab_name].transform, "story_v_out_120042", "120042087", "story_v_out_120042.awb")

						arg_355_1:RecordAudio("120042087", var_358_20)
						arg_355_1:RecordAudio("120042087", var_358_20)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_120042", "120042087", "story_v_out_120042.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_120042", "120042087", "story_v_out_120042.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_21 = math.max(var_358_12, arg_355_1.talkMaxDuration)

			if var_358_11 <= arg_355_1.time_ and arg_355_1.time_ < var_358_11 + var_358_21 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_11) / var_358_21

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_11 + var_358_21 and arg_355_1.time_ < var_358_11 + var_358_21 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play120042088 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 120042088
		arg_359_1.duration_ = 6.433

		local var_359_0 = {
			zh = 3.466,
			ja = 6.433
		}
		local var_359_1 = manager.audio:GetLocalizationFlag()

		if var_359_0[var_359_1] ~= nil then
			arg_359_1.duration_ = var_359_0[var_359_1]
		end

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play120042089(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 0.425

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[384].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(120042088)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 17
				local var_362_6 = utf8.len(var_362_4)
				local var_362_7 = var_362_5 <= 0 and var_362_1 or var_362_1 * (var_362_6 / var_362_5)

				if var_362_7 > 0 and var_362_1 < var_362_7 then
					arg_359_1.talkMaxDuration = var_362_7

					if var_362_7 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_7 + var_362_0
					end
				end

				arg_359_1.text_.text = var_362_4
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042088", "story_v_out_120042.awb") ~= 0 then
					local var_362_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042088", "story_v_out_120042.awb") / 1000

					if var_362_8 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_8 + var_362_0
					end

					if var_362_3.prefab_name ~= "" and arg_359_1.actors_[var_362_3.prefab_name] ~= nil then
						local var_362_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_3.prefab_name].transform, "story_v_out_120042", "120042088", "story_v_out_120042.awb")

						arg_359_1:RecordAudio("120042088", var_362_9)
						arg_359_1:RecordAudio("120042088", var_362_9)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_120042", "120042088", "story_v_out_120042.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_120042", "120042088", "story_v_out_120042.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_10 = math.max(var_362_1, arg_359_1.talkMaxDuration)

			if var_362_0 <= arg_359_1.time_ and arg_359_1.time_ < var_362_0 + var_362_10 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_0) / var_362_10

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_0 + var_362_10 and arg_359_1.time_ < var_362_0 + var_362_10 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play120042089 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 120042089
		arg_363_1.duration_ = 6.4

		local var_363_0 = {
			zh = 6.4,
			ja = 3.333
		}
		local var_363_1 = manager.audio:GetLocalizationFlag()

		if var_363_0[var_363_1] ~= nil then
			arg_363_1.duration_ = var_363_0[var_363_1]
		end

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play120042090(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1071ui_story"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos1071ui_story = var_366_0.localPosition
			end

			local var_366_2 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2
				local var_366_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1071ui_story, var_366_4, var_366_3)

				local var_366_5 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_5.x, var_366_5.y, var_366_5.z)

				local var_366_6 = var_366_0.localEulerAngles

				var_366_6.z = 0
				var_366_6.x = 0
				var_366_0.localEulerAngles = var_366_6
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_366_7 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_7.x, var_366_7.y, var_366_7.z)

				local var_366_8 = var_366_0.localEulerAngles

				var_366_8.z = 0
				var_366_8.x = 0
				var_366_0.localEulerAngles = var_366_8
			end

			local var_366_9 = arg_363_1.actors_["1075ui_story"].transform
			local var_366_10 = 0

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 then
				arg_363_1.var_.moveOldPos1075ui_story = var_366_9.localPosition
			end

			local var_366_11 = 0.001

			if var_366_10 <= arg_363_1.time_ and arg_363_1.time_ < var_366_10 + var_366_11 then
				local var_366_12 = (arg_363_1.time_ - var_366_10) / var_366_11
				local var_366_13 = Vector3.New(0.7, -1.055, -6.16)

				var_366_9.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1075ui_story, var_366_13, var_366_12)

				local var_366_14 = manager.ui.mainCamera.transform.position - var_366_9.position

				var_366_9.forward = Vector3.New(var_366_14.x, var_366_14.y, var_366_14.z)

				local var_366_15 = var_366_9.localEulerAngles

				var_366_15.z = 0
				var_366_15.x = 0
				var_366_9.localEulerAngles = var_366_15
			end

			if arg_363_1.time_ >= var_366_10 + var_366_11 and arg_363_1.time_ < var_366_10 + var_366_11 + arg_366_0 then
				var_366_9.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_366_16 = manager.ui.mainCamera.transform.position - var_366_9.position

				var_366_9.forward = Vector3.New(var_366_16.x, var_366_16.y, var_366_16.z)

				local var_366_17 = var_366_9.localEulerAngles

				var_366_17.z = 0
				var_366_17.x = 0
				var_366_9.localEulerAngles = var_366_17
			end

			local var_366_18 = arg_363_1.actors_["1075ui_story"]
			local var_366_19 = 0

			if var_366_19 < arg_363_1.time_ and arg_363_1.time_ <= var_366_19 + arg_366_0 and arg_363_1.var_.characterEffect1075ui_story == nil then
				arg_363_1.var_.characterEffect1075ui_story = var_366_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_20 = 0.2

			if var_366_19 <= arg_363_1.time_ and arg_363_1.time_ < var_366_19 + var_366_20 then
				local var_366_21 = (arg_363_1.time_ - var_366_19) / var_366_20

				if arg_363_1.var_.characterEffect1075ui_story then
					arg_363_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_19 + var_366_20 and arg_363_1.time_ < var_366_19 + var_366_20 + arg_366_0 and arg_363_1.var_.characterEffect1075ui_story then
				arg_363_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_366_22 = arg_363_1.actors_["1071ui_story"]
			local var_366_23 = 0

			if var_366_23 < arg_363_1.time_ and arg_363_1.time_ <= var_366_23 + arg_366_0 and arg_363_1.var_.characterEffect1071ui_story == nil then
				arg_363_1.var_.characterEffect1071ui_story = var_366_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_24 = 0.2

			if var_366_23 <= arg_363_1.time_ and arg_363_1.time_ < var_366_23 + var_366_24 then
				local var_366_25 = (arg_363_1.time_ - var_366_23) / var_366_24

				if arg_363_1.var_.characterEffect1071ui_story then
					local var_366_26 = Mathf.Lerp(0, 0.5, var_366_25)

					arg_363_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_363_1.var_.characterEffect1071ui_story.fillRatio = var_366_26
				end
			end

			if arg_363_1.time_ >= var_366_23 + var_366_24 and arg_363_1.time_ < var_366_23 + var_366_24 + arg_366_0 and arg_363_1.var_.characterEffect1071ui_story then
				local var_366_27 = 0.5

				arg_363_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_363_1.var_.characterEffect1071ui_story.fillRatio = var_366_27
			end

			local var_366_28 = 0

			if var_366_28 < arg_363_1.time_ and arg_363_1.time_ <= var_366_28 + arg_366_0 then
				arg_363_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_366_29 = 0

			if var_366_29 < arg_363_1.time_ and arg_363_1.time_ <= var_366_29 + arg_366_0 then
				arg_363_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_366_30 = 0

			if var_366_30 < arg_363_1.time_ and arg_363_1.time_ <= var_366_30 + arg_366_0 then
				arg_363_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_366_31 = arg_363_1.actors_["1069ui_story"].transform
			local var_366_32 = 0

			if var_366_32 < arg_363_1.time_ and arg_363_1.time_ <= var_366_32 + arg_366_0 then
				arg_363_1.var_.moveOldPos1069ui_story = var_366_31.localPosition
			end

			local var_366_33 = 0.001

			if var_366_32 <= arg_363_1.time_ and arg_363_1.time_ < var_366_32 + var_366_33 then
				local var_366_34 = (arg_363_1.time_ - var_366_32) / var_366_33
				local var_366_35 = Vector3.New(0, 100, 0)

				var_366_31.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1069ui_story, var_366_35, var_366_34)

				local var_366_36 = manager.ui.mainCamera.transform.position - var_366_31.position

				var_366_31.forward = Vector3.New(var_366_36.x, var_366_36.y, var_366_36.z)

				local var_366_37 = var_366_31.localEulerAngles

				var_366_37.z = 0
				var_366_37.x = 0
				var_366_31.localEulerAngles = var_366_37
			end

			if arg_363_1.time_ >= var_366_32 + var_366_33 and arg_363_1.time_ < var_366_32 + var_366_33 + arg_366_0 then
				var_366_31.localPosition = Vector3.New(0, 100, 0)

				local var_366_38 = manager.ui.mainCamera.transform.position - var_366_31.position

				var_366_31.forward = Vector3.New(var_366_38.x, var_366_38.y, var_366_38.z)

				local var_366_39 = var_366_31.localEulerAngles

				var_366_39.z = 0
				var_366_39.x = 0
				var_366_31.localEulerAngles = var_366_39
			end

			local var_366_40 = 0
			local var_366_41 = 0.925

			if var_366_40 < arg_363_1.time_ and arg_363_1.time_ <= var_366_40 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_42 = arg_363_1:FormatText(StoryNameCfg[381].name)

				arg_363_1.leftNameTxt_.text = var_366_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_43 = arg_363_1:GetWordFromCfg(120042089)
				local var_366_44 = arg_363_1:FormatText(var_366_43.content)

				arg_363_1.text_.text = var_366_44

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_45 = 39
				local var_366_46 = utf8.len(var_366_44)
				local var_366_47 = var_366_45 <= 0 and var_366_41 or var_366_41 * (var_366_46 / var_366_45)

				if var_366_47 > 0 and var_366_41 < var_366_47 then
					arg_363_1.talkMaxDuration = var_366_47

					if var_366_47 + var_366_40 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_47 + var_366_40
					end
				end

				arg_363_1.text_.text = var_366_44
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042089", "story_v_out_120042.awb") ~= 0 then
					local var_366_48 = manager.audio:GetVoiceLength("story_v_out_120042", "120042089", "story_v_out_120042.awb") / 1000

					if var_366_48 + var_366_40 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_48 + var_366_40
					end

					if var_366_43.prefab_name ~= "" and arg_363_1.actors_[var_366_43.prefab_name] ~= nil then
						local var_366_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_43.prefab_name].transform, "story_v_out_120042", "120042089", "story_v_out_120042.awb")

						arg_363_1:RecordAudio("120042089", var_366_49)
						arg_363_1:RecordAudio("120042089", var_366_49)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_120042", "120042089", "story_v_out_120042.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_120042", "120042089", "story_v_out_120042.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_50 = math.max(var_366_41, arg_363_1.talkMaxDuration)

			if var_366_40 <= arg_363_1.time_ and arg_363_1.time_ < var_366_40 + var_366_50 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_40) / var_366_50

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_40 + var_366_50 and arg_363_1.time_ < var_366_40 + var_366_50 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play120042090 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 120042090
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play120042091(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1075ui_story"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and arg_367_1.var_.characterEffect1075ui_story == nil then
				arg_367_1.var_.characterEffect1075ui_story = var_370_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_2 = 0.2

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.characterEffect1075ui_story then
					local var_370_4 = Mathf.Lerp(0, 0.5, var_370_3)

					arg_367_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1075ui_story.fillRatio = var_370_4
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and arg_367_1.var_.characterEffect1075ui_story then
				local var_370_5 = 0.5

				arg_367_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1075ui_story.fillRatio = var_370_5
			end

			local var_370_6 = 0
			local var_370_7 = 0.5

			if var_370_6 < arg_367_1.time_ and arg_367_1.time_ <= var_370_6 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_8 = arg_367_1:FormatText(StoryNameCfg[7].name)

				arg_367_1.leftNameTxt_.text = var_370_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_9 = arg_367_1:GetWordFromCfg(120042090)
				local var_370_10 = arg_367_1:FormatText(var_370_9.content)

				arg_367_1.text_.text = var_370_10

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_11 = 20
				local var_370_12 = utf8.len(var_370_10)
				local var_370_13 = var_370_11 <= 0 and var_370_7 or var_370_7 * (var_370_12 / var_370_11)

				if var_370_13 > 0 and var_370_7 < var_370_13 then
					arg_367_1.talkMaxDuration = var_370_13

					if var_370_13 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_13 + var_370_6
					end
				end

				arg_367_1.text_.text = var_370_10
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_14 = math.max(var_370_7, arg_367_1.talkMaxDuration)

			if var_370_6 <= arg_367_1.time_ and arg_367_1.time_ < var_370_6 + var_370_14 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_6) / var_370_14

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_6 + var_370_14 and arg_367_1.time_ < var_370_6 + var_370_14 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play120042091 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 120042091
		arg_371_1.duration_ = 7.333

		local var_371_0 = {
			zh = 7.333,
			ja = 6.733
		}
		local var_371_1 = manager.audio:GetLocalizationFlag()

		if var_371_0[var_371_1] ~= nil then
			arg_371_1.duration_ = var_371_0[var_371_1]
		end

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play120042092(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1075ui_story"]
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 and arg_371_1.var_.characterEffect1075ui_story == nil then
				arg_371_1.var_.characterEffect1075ui_story = var_374_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_2 = 0.2

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2

				if arg_371_1.var_.characterEffect1075ui_story then
					arg_371_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 and arg_371_1.var_.characterEffect1075ui_story then
				arg_371_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_374_4 = 0

			if var_374_4 < arg_371_1.time_ and arg_371_1.time_ <= var_374_4 + arg_374_0 then
				arg_371_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_2")
			end

			local var_374_5 = 0
			local var_374_6 = 0.85

			if var_374_5 < arg_371_1.time_ and arg_371_1.time_ <= var_374_5 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_7 = arg_371_1:FormatText(StoryNameCfg[381].name)

				arg_371_1.leftNameTxt_.text = var_374_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_8 = arg_371_1:GetWordFromCfg(120042091)
				local var_374_9 = arg_371_1:FormatText(var_374_8.content)

				arg_371_1.text_.text = var_374_9

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_10 = 34
				local var_374_11 = utf8.len(var_374_9)
				local var_374_12 = var_374_10 <= 0 and var_374_6 or var_374_6 * (var_374_11 / var_374_10)

				if var_374_12 > 0 and var_374_6 < var_374_12 then
					arg_371_1.talkMaxDuration = var_374_12

					if var_374_12 + var_374_5 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_12 + var_374_5
					end
				end

				arg_371_1.text_.text = var_374_9
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042091", "story_v_out_120042.awb") ~= 0 then
					local var_374_13 = manager.audio:GetVoiceLength("story_v_out_120042", "120042091", "story_v_out_120042.awb") / 1000

					if var_374_13 + var_374_5 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_13 + var_374_5
					end

					if var_374_8.prefab_name ~= "" and arg_371_1.actors_[var_374_8.prefab_name] ~= nil then
						local var_374_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_8.prefab_name].transform, "story_v_out_120042", "120042091", "story_v_out_120042.awb")

						arg_371_1:RecordAudio("120042091", var_374_14)
						arg_371_1:RecordAudio("120042091", var_374_14)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_120042", "120042091", "story_v_out_120042.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_120042", "120042091", "story_v_out_120042.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_15 = math.max(var_374_6, arg_371_1.talkMaxDuration)

			if var_374_5 <= arg_371_1.time_ and arg_371_1.time_ < var_374_5 + var_374_15 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_5) / var_374_15

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_5 + var_374_15 and arg_371_1.time_ < var_374_5 + var_374_15 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play120042092 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 120042092
		arg_375_1.duration_ = 5

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play120042093(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1075ui_story"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos1075ui_story = var_378_0.localPosition
			end

			local var_378_2 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2
				local var_378_4 = Vector3.New(0, 100, 0)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1075ui_story, var_378_4, var_378_3)

				local var_378_5 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_5.x, var_378_5.y, var_378_5.z)

				local var_378_6 = var_378_0.localEulerAngles

				var_378_6.z = 0
				var_378_6.x = 0
				var_378_0.localEulerAngles = var_378_6
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(0, 100, 0)

				local var_378_7 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_7.x, var_378_7.y, var_378_7.z)

				local var_378_8 = var_378_0.localEulerAngles

				var_378_8.z = 0
				var_378_8.x = 0
				var_378_0.localEulerAngles = var_378_8
			end

			local var_378_9 = arg_375_1.actors_["1071ui_story"].transform
			local var_378_10 = 0

			if var_378_10 < arg_375_1.time_ and arg_375_1.time_ <= var_378_10 + arg_378_0 then
				arg_375_1.var_.moveOldPos1071ui_story = var_378_9.localPosition
			end

			local var_378_11 = 0.001

			if var_378_10 <= arg_375_1.time_ and arg_375_1.time_ < var_378_10 + var_378_11 then
				local var_378_12 = (arg_375_1.time_ - var_378_10) / var_378_11
				local var_378_13 = Vector3.New(0, 100, 0)

				var_378_9.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1071ui_story, var_378_13, var_378_12)

				local var_378_14 = manager.ui.mainCamera.transform.position - var_378_9.position

				var_378_9.forward = Vector3.New(var_378_14.x, var_378_14.y, var_378_14.z)

				local var_378_15 = var_378_9.localEulerAngles

				var_378_15.z = 0
				var_378_15.x = 0
				var_378_9.localEulerAngles = var_378_15
			end

			if arg_375_1.time_ >= var_378_10 + var_378_11 and arg_375_1.time_ < var_378_10 + var_378_11 + arg_378_0 then
				var_378_9.localPosition = Vector3.New(0, 100, 0)

				local var_378_16 = manager.ui.mainCamera.transform.position - var_378_9.position

				var_378_9.forward = Vector3.New(var_378_16.x, var_378_16.y, var_378_16.z)

				local var_378_17 = var_378_9.localEulerAngles

				var_378_17.z = 0
				var_378_17.x = 0
				var_378_9.localEulerAngles = var_378_17
			end

			local var_378_18 = 0
			local var_378_19 = 0.7

			if var_378_18 < arg_375_1.time_ and arg_375_1.time_ <= var_378_18 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, false)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_20 = arg_375_1:GetWordFromCfg(120042092)
				local var_378_21 = arg_375_1:FormatText(var_378_20.content)

				arg_375_1.text_.text = var_378_21

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_22 = 28
				local var_378_23 = utf8.len(var_378_21)
				local var_378_24 = var_378_22 <= 0 and var_378_19 or var_378_19 * (var_378_23 / var_378_22)

				if var_378_24 > 0 and var_378_19 < var_378_24 then
					arg_375_1.talkMaxDuration = var_378_24

					if var_378_24 + var_378_18 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_24 + var_378_18
					end
				end

				arg_375_1.text_.text = var_378_21
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)
				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_25 = math.max(var_378_19, arg_375_1.talkMaxDuration)

			if var_378_18 <= arg_375_1.time_ and arg_375_1.time_ < var_378_18 + var_378_25 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_18) / var_378_25

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_18 + var_378_25 and arg_375_1.time_ < var_378_18 + var_378_25 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play120042093 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 120042093
		arg_379_1.duration_ = 8.366

		local var_379_0 = {
			zh = 8.366,
			ja = 6.966
		}
		local var_379_1 = manager.audio:GetLocalizationFlag()

		if var_379_0[var_379_1] ~= nil then
			arg_379_1.duration_ = var_379_0[var_379_1]
		end

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play120042094(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1071ui_story"].transform
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 then
				arg_379_1.var_.moveOldPos1071ui_story = var_382_0.localPosition
			end

			local var_382_2 = 0.001

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2
				local var_382_4 = Vector3.New(0, -1.05, -6.2)

				var_382_0.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos1071ui_story, var_382_4, var_382_3)

				local var_382_5 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_5.x, var_382_5.y, var_382_5.z)

				local var_382_6 = var_382_0.localEulerAngles

				var_382_6.z = 0
				var_382_6.x = 0
				var_382_0.localEulerAngles = var_382_6
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 then
				var_382_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_382_7 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_7.x, var_382_7.y, var_382_7.z)

				local var_382_8 = var_382_0.localEulerAngles

				var_382_8.z = 0
				var_382_8.x = 0
				var_382_0.localEulerAngles = var_382_8
			end

			local var_382_9 = arg_379_1.actors_["1071ui_story"]
			local var_382_10 = 0

			if var_382_10 < arg_379_1.time_ and arg_379_1.time_ <= var_382_10 + arg_382_0 and arg_379_1.var_.characterEffect1071ui_story == nil then
				arg_379_1.var_.characterEffect1071ui_story = var_382_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_11 = 0.2

			if var_382_10 <= arg_379_1.time_ and arg_379_1.time_ < var_382_10 + var_382_11 then
				local var_382_12 = (arg_379_1.time_ - var_382_10) / var_382_11

				if arg_379_1.var_.characterEffect1071ui_story then
					arg_379_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_379_1.time_ >= var_382_10 + var_382_11 and arg_379_1.time_ < var_382_10 + var_382_11 + arg_382_0 and arg_379_1.var_.characterEffect1071ui_story then
				arg_379_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_382_13 = 0

			if var_382_13 < arg_379_1.time_ and arg_379_1.time_ <= var_382_13 + arg_382_0 then
				arg_379_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_382_14 = 0
			local var_382_15 = 0.75

			if var_382_14 < arg_379_1.time_ and arg_379_1.time_ <= var_382_14 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_16 = arg_379_1:FormatText(StoryNameCfg[384].name)

				arg_379_1.leftNameTxt_.text = var_382_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_17 = arg_379_1:GetWordFromCfg(120042093)
				local var_382_18 = arg_379_1:FormatText(var_382_17.content)

				arg_379_1.text_.text = var_382_18

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_19 = 30
				local var_382_20 = utf8.len(var_382_18)
				local var_382_21 = var_382_19 <= 0 and var_382_15 or var_382_15 * (var_382_20 / var_382_19)

				if var_382_21 > 0 and var_382_15 < var_382_21 then
					arg_379_1.talkMaxDuration = var_382_21

					if var_382_21 + var_382_14 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_21 + var_382_14
					end
				end

				arg_379_1.text_.text = var_382_18
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042093", "story_v_out_120042.awb") ~= 0 then
					local var_382_22 = manager.audio:GetVoiceLength("story_v_out_120042", "120042093", "story_v_out_120042.awb") / 1000

					if var_382_22 + var_382_14 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_22 + var_382_14
					end

					if var_382_17.prefab_name ~= "" and arg_379_1.actors_[var_382_17.prefab_name] ~= nil then
						local var_382_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_17.prefab_name].transform, "story_v_out_120042", "120042093", "story_v_out_120042.awb")

						arg_379_1:RecordAudio("120042093", var_382_23)
						arg_379_1:RecordAudio("120042093", var_382_23)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_120042", "120042093", "story_v_out_120042.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_120042", "120042093", "story_v_out_120042.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_24 = math.max(var_382_15, arg_379_1.talkMaxDuration)

			if var_382_14 <= arg_379_1.time_ and arg_379_1.time_ < var_382_14 + var_382_24 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_14) / var_382_24

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_14 + var_382_24 and arg_379_1.time_ < var_382_14 + var_382_24 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play120042094 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 120042094
		arg_383_1.duration_ = 1.8

		local var_383_0 = {
			zh = 1.8,
			ja = 1.566
		}
		local var_383_1 = manager.audio:GetLocalizationFlag()

		if var_383_0[var_383_1] ~= nil then
			arg_383_1.duration_ = var_383_0[var_383_1]
		end

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play120042095(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0
			local var_386_1 = 0.15

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_2 = arg_383_1:FormatText(StoryNameCfg[384].name)

				arg_383_1.leftNameTxt_.text = var_386_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_3 = arg_383_1:GetWordFromCfg(120042094)
				local var_386_4 = arg_383_1:FormatText(var_386_3.content)

				arg_383_1.text_.text = var_386_4

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_5 = 6
				local var_386_6 = utf8.len(var_386_4)
				local var_386_7 = var_386_5 <= 0 and var_386_1 or var_386_1 * (var_386_6 / var_386_5)

				if var_386_7 > 0 and var_386_1 < var_386_7 then
					arg_383_1.talkMaxDuration = var_386_7

					if var_386_7 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_7 + var_386_0
					end
				end

				arg_383_1.text_.text = var_386_4
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042094", "story_v_out_120042.awb") ~= 0 then
					local var_386_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042094", "story_v_out_120042.awb") / 1000

					if var_386_8 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_8 + var_386_0
					end

					if var_386_3.prefab_name ~= "" and arg_383_1.actors_[var_386_3.prefab_name] ~= nil then
						local var_386_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_3.prefab_name].transform, "story_v_out_120042", "120042094", "story_v_out_120042.awb")

						arg_383_1:RecordAudio("120042094", var_386_9)
						arg_383_1:RecordAudio("120042094", var_386_9)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_120042", "120042094", "story_v_out_120042.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_120042", "120042094", "story_v_out_120042.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_10 = math.max(var_386_1, arg_383_1.talkMaxDuration)

			if var_386_0 <= arg_383_1.time_ and arg_383_1.time_ < var_386_0 + var_386_10 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_0) / var_386_10

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_0 + var_386_10 and arg_383_1.time_ < var_386_0 + var_386_10 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play120042095 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 120042095
		arg_387_1.duration_ = 5.033

		local var_387_0 = {
			zh = 4.666,
			ja = 5.033
		}
		local var_387_1 = manager.audio:GetLocalizationFlag()

		if var_387_0[var_387_1] ~= nil then
			arg_387_1.duration_ = var_387_0[var_387_1]
		end

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
			arg_387_1.auto_ = false
		end

		function arg_387_1.playNext_(arg_389_0)
			arg_387_1.onStoryFinished_()
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.55

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_2 = arg_387_1:FormatText(StoryNameCfg[384].name)

				arg_387_1.leftNameTxt_.text = var_390_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_3 = arg_387_1:GetWordFromCfg(120042095)
				local var_390_4 = arg_387_1:FormatText(var_390_3.content)

				arg_387_1.text_.text = var_390_4

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_5 = 22
				local var_390_6 = utf8.len(var_390_4)
				local var_390_7 = var_390_5 <= 0 and var_390_1 or var_390_1 * (var_390_6 / var_390_5)

				if var_390_7 > 0 and var_390_1 < var_390_7 then
					arg_387_1.talkMaxDuration = var_390_7

					if var_390_7 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_7 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_4
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120042", "120042095", "story_v_out_120042.awb") ~= 0 then
					local var_390_8 = manager.audio:GetVoiceLength("story_v_out_120042", "120042095", "story_v_out_120042.awb") / 1000

					if var_390_8 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_8 + var_390_0
					end

					if var_390_3.prefab_name ~= "" and arg_387_1.actors_[var_390_3.prefab_name] ~= nil then
						local var_390_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_3.prefab_name].transform, "story_v_out_120042", "120042095", "story_v_out_120042.awb")

						arg_387_1:RecordAudio("120042095", var_390_9)
						arg_387_1:RecordAudio("120042095", var_390_9)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_120042", "120042095", "story_v_out_120042.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_120042", "120042095", "story_v_out_120042.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_10 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_10 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_10

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_10 and arg_387_1.time_ < var_390_0 + var_390_10 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J02i",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0104a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0104",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST37a"
	},
	voices = {
		"story_v_out_120042.awb"
	}
}
