return {
	Play221061001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 221061001
		arg_1_1.duration_ = 8.7

		local var_1_0 = {
			ja = 8.7,
			ko = 8.133,
			zh = 8.133
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
				arg_1_0:Play221061002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST31"

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
				local var_4_5 = arg_1_1.bgs_.ST31

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
					if iter_4_0 ~= "ST31" then
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

			local var_4_22 = "1072ui_story"

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

			local var_4_26 = arg_1_1.actors_["1072ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1072ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -0.71, -6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1072ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.71, -6)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1072ui_story"]
			local var_4_36 = 2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1072ui_story == nil then
				arg_1_1.var_.characterEffect1072ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1072ui_story then
					arg_1_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1072ui_story then
				arg_1_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_4_39 = 2

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action2_1")
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_41 = 0
			local var_4_42 = 0.6

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 1.3
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.575

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

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[379].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(221061001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061001", "story_v_out_221061.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_221061", "221061001", "story_v_out_221061.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_221061", "221061001", "story_v_out_221061.awb")

						arg_1_1:RecordAudio("221061001", var_4_59)
						arg_1_1:RecordAudio("221061001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_221061", "221061001", "story_v_out_221061.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_221061", "221061001", "story_v_out_221061.awb")
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
	Play221061002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 221061002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play221061003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1072ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1072ui_story == nil then
				arg_7_1.var_.characterEffect1072ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.200000002980232

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1072ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1072ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1072ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1072ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 1.55

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

				local var_10_8 = arg_7_1:GetWordFromCfg(221061002)
				local var_10_9 = arg_7_1:FormatText(var_10_8.content)

				arg_7_1.text_.text = var_10_9

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_10 = 61
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
	Play221061003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 221061003
		arg_11_1.duration_ = 8.333

		local var_11_0 = {
			ja = 8.333,
			ko = 8,
			zh = 8
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
				arg_11_0:Play221061004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.75

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[428].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bossma")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(221061003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061003", "story_v_out_221061.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061003", "story_v_out_221061.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_221061", "221061003", "story_v_out_221061.awb")

						arg_11_1:RecordAudio("221061003", var_14_9)
						arg_11_1:RecordAudio("221061003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_221061", "221061003", "story_v_out_221061.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_221061", "221061003", "story_v_out_221061.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_10 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_10 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_10

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_10 and arg_11_1.time_ < var_14_0 + var_14_10 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play221061004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 221061004
		arg_15_1.duration_ = 2.7

		local var_15_0 = {
			ja = 2.7,
			ko = 2.166,
			zh = 2.166
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
				arg_15_0:Play221061005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1072ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1072ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, -0.71, -6)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1072ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["1072ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1072ui_story == nil then
				arg_15_1.var_.characterEffect1072ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1072ui_story then
					arg_15_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1072ui_story then
				arg_15_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072actionlink/1072action424")
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_15 = 0
			local var_18_16 = 0.25

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_17 = arg_15_1:FormatText(StoryNameCfg[379].name)

				arg_15_1.leftNameTxt_.text = var_18_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_18 = arg_15_1:GetWordFromCfg(221061004)
				local var_18_19 = arg_15_1:FormatText(var_18_18.content)

				arg_15_1.text_.text = var_18_19

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_20 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061004", "story_v_out_221061.awb") ~= 0 then
					local var_18_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061004", "story_v_out_221061.awb") / 1000

					if var_18_23 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_23 + var_18_15
					end

					if var_18_18.prefab_name ~= "" and arg_15_1.actors_[var_18_18.prefab_name] ~= nil then
						local var_18_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_18.prefab_name].transform, "story_v_out_221061", "221061004", "story_v_out_221061.awb")

						arg_15_1:RecordAudio("221061004", var_18_24)
						arg_15_1:RecordAudio("221061004", var_18_24)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_221061", "221061004", "story_v_out_221061.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_221061", "221061004", "story_v_out_221061.awb")
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
	Play221061005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 221061005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play221061006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1072ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1072ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, 100, 0)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1072ui_story, var_22_4, var_22_3)

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

			local var_22_9 = arg_19_1.actors_["1072ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect1072ui_story == nil then
				arg_19_1.var_.characterEffect1072ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect1072ui_story then
					local var_22_13 = Mathf.Lerp(0, 0.5, var_22_12)

					arg_19_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1072ui_story.fillRatio = var_22_13
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect1072ui_story then
				local var_22_14 = 0.5

				arg_19_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1072ui_story.fillRatio = var_22_14
			end

			local var_22_15 = 0
			local var_22_16 = 1.5

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_17 = arg_19_1:GetWordFromCfg(221061005)
				local var_22_18 = arg_19_1:FormatText(var_22_17.content)

				arg_19_1.text_.text = var_22_18

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_19 = 60
				local var_22_20 = utf8.len(var_22_18)
				local var_22_21 = var_22_19 <= 0 and var_22_16 or var_22_16 * (var_22_20 / var_22_19)

				if var_22_21 > 0 and var_22_16 < var_22_21 then
					arg_19_1.talkMaxDuration = var_22_21

					if var_22_21 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_21 + var_22_15
					end
				end

				arg_19_1.text_.text = var_22_18
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_22 = math.max(var_22_16, arg_19_1.talkMaxDuration)

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_22 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_15) / var_22_22

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_15 + var_22_22 and arg_19_1.time_ < var_22_15 + var_22_22 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play221061006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 221061006
		arg_23_1.duration_ = 4.233

		local var_23_0 = {
			ja = 4.233,
			ko = 2.933,
			zh = 2.933
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
				arg_23_0:Play221061007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1072ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1072ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(-0.7, -0.71, -6)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1072ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1072ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1072ui_story == nil then
				arg_23_1.var_.characterEffect1072ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1072ui_story then
					arg_23_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1072ui_story then
				arg_23_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_26_15 = "1076ui_story"

			if arg_23_1.actors_[var_26_15] == nil then
				local var_26_16 = Object.Instantiate(Asset.Load("Char/" .. var_26_15), arg_23_1.stage_.transform)

				var_26_16.name = var_26_15
				var_26_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_15] = var_26_16

				local var_26_17 = var_26_16:GetComponentInChildren(typeof(CharacterEffect))

				var_26_17.enabled = true

				local var_26_18 = GameObjectTools.GetOrAddComponent(var_26_16, typeof(DynamicBoneHelper))

				if var_26_18 then
					var_26_18:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_17.transform, false)

				arg_23_1.var_[var_26_15 .. "Animator"] = var_26_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_15 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_15 .. "LipSync"] = var_26_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_19 = arg_23_1.actors_["1076ui_story"].transform
			local var_26_20 = 0

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.var_.moveOldPos1076ui_story = var_26_19.localPosition
			end

			local var_26_21 = 0.001

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_21 then
				local var_26_22 = (arg_23_1.time_ - var_26_20) / var_26_21
				local var_26_23 = Vector3.New(0.7, -1.06, -6.2)

				var_26_19.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1076ui_story, var_26_23, var_26_22)

				local var_26_24 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_24.x, var_26_24.y, var_26_24.z)

				local var_26_25 = var_26_19.localEulerAngles

				var_26_25.z = 0
				var_26_25.x = 0
				var_26_19.localEulerAngles = var_26_25
			end

			if arg_23_1.time_ >= var_26_20 + var_26_21 and arg_23_1.time_ < var_26_20 + var_26_21 + arg_26_0 then
				var_26_19.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_26_26 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_26.x, var_26_26.y, var_26_26.z)

				local var_26_27 = var_26_19.localEulerAngles

				var_26_27.z = 0
				var_26_27.x = 0
				var_26_19.localEulerAngles = var_26_27
			end

			local var_26_28 = arg_23_1.actors_["1076ui_story"]
			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 and arg_23_1.var_.characterEffect1076ui_story == nil then
				arg_23_1.var_.characterEffect1076ui_story = var_26_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_30 = 0.0166666666666667

			if var_26_29 <= arg_23_1.time_ and arg_23_1.time_ < var_26_29 + var_26_30 then
				local var_26_31 = (arg_23_1.time_ - var_26_29) / var_26_30

				if arg_23_1.var_.characterEffect1076ui_story then
					local var_26_32 = Mathf.Lerp(0, 0.5, var_26_31)

					arg_23_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1076ui_story.fillRatio = var_26_32
				end
			end

			if arg_23_1.time_ >= var_26_29 + var_26_30 and arg_23_1.time_ < var_26_29 + var_26_30 + arg_26_0 and arg_23_1.var_.characterEffect1076ui_story then
				local var_26_33 = 0.5

				arg_23_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1076ui_story.fillRatio = var_26_33
			end

			local var_26_34 = 0

			if var_26_34 < arg_23_1.time_ and arg_23_1.time_ <= var_26_34 + arg_26_0 then
				arg_23_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_26_35 = 0
			local var_26_36 = 0.275

			if var_26_35 < arg_23_1.time_ and arg_23_1.time_ <= var_26_35 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_37 = arg_23_1:FormatText(StoryNameCfg[379].name)

				arg_23_1.leftNameTxt_.text = var_26_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_38 = arg_23_1:GetWordFromCfg(221061006)
				local var_26_39 = arg_23_1:FormatText(var_26_38.content)

				arg_23_1.text_.text = var_26_39

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_40 = 11
				local var_26_41 = utf8.len(var_26_39)
				local var_26_42 = var_26_40 <= 0 and var_26_36 or var_26_36 * (var_26_41 / var_26_40)

				if var_26_42 > 0 and var_26_36 < var_26_42 then
					arg_23_1.talkMaxDuration = var_26_42

					if var_26_42 + var_26_35 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_42 + var_26_35
					end
				end

				arg_23_1.text_.text = var_26_39
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061006", "story_v_out_221061.awb") ~= 0 then
					local var_26_43 = manager.audio:GetVoiceLength("story_v_out_221061", "221061006", "story_v_out_221061.awb") / 1000

					if var_26_43 + var_26_35 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_43 + var_26_35
					end

					if var_26_38.prefab_name ~= "" and arg_23_1.actors_[var_26_38.prefab_name] ~= nil then
						local var_26_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_38.prefab_name].transform, "story_v_out_221061", "221061006", "story_v_out_221061.awb")

						arg_23_1:RecordAudio("221061006", var_26_44)
						arg_23_1:RecordAudio("221061006", var_26_44)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_221061", "221061006", "story_v_out_221061.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_221061", "221061006", "story_v_out_221061.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_45 = math.max(var_26_36, arg_23_1.talkMaxDuration)

			if var_26_35 <= arg_23_1.time_ and arg_23_1.time_ < var_26_35 + var_26_45 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_35) / var_26_45

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_35 + var_26_45 and arg_23_1.time_ < var_26_35 + var_26_45 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play221061007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 221061007
		arg_27_1.duration_ = 13.2

		local var_27_0 = {
			ja = 13.2,
			ko = 9.366,
			zh = 9.366
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
				arg_27_0:Play221061008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1072ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1072ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(-0.7, -0.71, -6)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1072ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_10 = 0
			local var_30_11 = 0.825

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_12 = arg_27_1:FormatText(StoryNameCfg[379].name)

				arg_27_1.leftNameTxt_.text = var_30_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_13 = arg_27_1:GetWordFromCfg(221061007)
				local var_30_14 = arg_27_1:FormatText(var_30_13.content)

				arg_27_1.text_.text = var_30_14

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_15 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061007", "story_v_out_221061.awb") ~= 0 then
					local var_30_18 = manager.audio:GetVoiceLength("story_v_out_221061", "221061007", "story_v_out_221061.awb") / 1000

					if var_30_18 + var_30_10 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_18 + var_30_10
					end

					if var_30_13.prefab_name ~= "" and arg_27_1.actors_[var_30_13.prefab_name] ~= nil then
						local var_30_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_13.prefab_name].transform, "story_v_out_221061", "221061007", "story_v_out_221061.awb")

						arg_27_1:RecordAudio("221061007", var_30_19)
						arg_27_1:RecordAudio("221061007", var_30_19)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_221061", "221061007", "story_v_out_221061.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_221061", "221061007", "story_v_out_221061.awb")
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
	Play221061008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 221061008
		arg_31_1.duration_ = 3.933

		local var_31_0 = {
			ja = 3.933,
			ko = 3,
			zh = 3
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
				arg_31_0:Play221061009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1076ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1076ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0.7, -1.06, -6.2)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1076ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1076ui_story"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1076ui_story == nil then
				arg_31_1.var_.characterEffect1076ui_story = var_34_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_11 = 0.200000002980232

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.characterEffect1076ui_story then
					arg_31_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.characterEffect1076ui_story then
				arg_31_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_14 = arg_31_1.actors_["1072ui_story"]
			local var_34_15 = 0

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 and arg_31_1.var_.characterEffect1072ui_story == nil then
				arg_31_1.var_.characterEffect1072ui_story = var_34_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_16 = 0.200000002980232

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_16 then
				local var_34_17 = (arg_31_1.time_ - var_34_15) / var_34_16

				if arg_31_1.var_.characterEffect1072ui_story then
					local var_34_18 = Mathf.Lerp(0, 0.5, var_34_17)

					arg_31_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1072ui_story.fillRatio = var_34_18
				end
			end

			if arg_31_1.time_ >= var_34_15 + var_34_16 and arg_31_1.time_ < var_34_15 + var_34_16 + arg_34_0 and arg_31_1.var_.characterEffect1072ui_story then
				local var_34_19 = 0.5

				arg_31_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1072ui_story.fillRatio = var_34_19
			end

			local var_34_20 = 0
			local var_34_21 = 0.25

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_22 = arg_31_1:FormatText(StoryNameCfg[389].name)

				arg_31_1.leftNameTxt_.text = var_34_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_23 = arg_31_1:GetWordFromCfg(221061008)
				local var_34_24 = arg_31_1:FormatText(var_34_23.content)

				arg_31_1.text_.text = var_34_24

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_25 = 10
				local var_34_26 = utf8.len(var_34_24)
				local var_34_27 = var_34_25 <= 0 and var_34_21 or var_34_21 * (var_34_26 / var_34_25)

				if var_34_27 > 0 and var_34_21 < var_34_27 then
					arg_31_1.talkMaxDuration = var_34_27

					if var_34_27 + var_34_20 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_27 + var_34_20
					end
				end

				arg_31_1.text_.text = var_34_24
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061008", "story_v_out_221061.awb") ~= 0 then
					local var_34_28 = manager.audio:GetVoiceLength("story_v_out_221061", "221061008", "story_v_out_221061.awb") / 1000

					if var_34_28 + var_34_20 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_28 + var_34_20
					end

					if var_34_23.prefab_name ~= "" and arg_31_1.actors_[var_34_23.prefab_name] ~= nil then
						local var_34_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_23.prefab_name].transform, "story_v_out_221061", "221061008", "story_v_out_221061.awb")

						arg_31_1:RecordAudio("221061008", var_34_29)
						arg_31_1:RecordAudio("221061008", var_34_29)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_221061", "221061008", "story_v_out_221061.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_221061", "221061008", "story_v_out_221061.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_30 = math.max(var_34_21, arg_31_1.talkMaxDuration)

			if var_34_20 <= arg_31_1.time_ and arg_31_1.time_ < var_34_20 + var_34_30 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_20) / var_34_30

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_20 + var_34_30 and arg_31_1.time_ < var_34_20 + var_34_30 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play221061009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 221061009
		arg_35_1.duration_ = 11.633

		local var_35_0 = {
			ja = 11.633,
			ko = 9.833,
			zh = 9.833
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
				arg_35_0:Play221061010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1072ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1072ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(-0.7, -0.71, -6)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1072ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1072ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1072ui_story == nil then
				arg_35_1.var_.characterEffect1072ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1072ui_story then
					arg_35_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1072ui_story then
				arg_35_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_14 = arg_35_1.actors_["1076ui_story"]
			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 and arg_35_1.var_.characterEffect1076ui_story == nil then
				arg_35_1.var_.characterEffect1076ui_story = var_38_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_16 = 0.200000002980232

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_16 then
				local var_38_17 = (arg_35_1.time_ - var_38_15) / var_38_16

				if arg_35_1.var_.characterEffect1076ui_story then
					local var_38_18 = Mathf.Lerp(0, 0.5, var_38_17)

					arg_35_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1076ui_story.fillRatio = var_38_18
				end
			end

			if arg_35_1.time_ >= var_38_15 + var_38_16 and arg_35_1.time_ < var_38_15 + var_38_16 + arg_38_0 and arg_35_1.var_.characterEffect1076ui_story then
				local var_38_19 = 0.5

				arg_35_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1076ui_story.fillRatio = var_38_19
			end

			local var_38_20 = 0
			local var_38_21 = 1.05

			if var_38_20 < arg_35_1.time_ and arg_35_1.time_ <= var_38_20 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_22 = arg_35_1:FormatText(StoryNameCfg[379].name)

				arg_35_1.leftNameTxt_.text = var_38_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_23 = arg_35_1:GetWordFromCfg(221061009)
				local var_38_24 = arg_35_1:FormatText(var_38_23.content)

				arg_35_1.text_.text = var_38_24

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_25 = 42
				local var_38_26 = utf8.len(var_38_24)
				local var_38_27 = var_38_25 <= 0 and var_38_21 or var_38_21 * (var_38_26 / var_38_25)

				if var_38_27 > 0 and var_38_21 < var_38_27 then
					arg_35_1.talkMaxDuration = var_38_27

					if var_38_27 + var_38_20 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_27 + var_38_20
					end
				end

				arg_35_1.text_.text = var_38_24
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061009", "story_v_out_221061.awb") ~= 0 then
					local var_38_28 = manager.audio:GetVoiceLength("story_v_out_221061", "221061009", "story_v_out_221061.awb") / 1000

					if var_38_28 + var_38_20 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_28 + var_38_20
					end

					if var_38_23.prefab_name ~= "" and arg_35_1.actors_[var_38_23.prefab_name] ~= nil then
						local var_38_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_23.prefab_name].transform, "story_v_out_221061", "221061009", "story_v_out_221061.awb")

						arg_35_1:RecordAudio("221061009", var_38_29)
						arg_35_1:RecordAudio("221061009", var_38_29)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_221061", "221061009", "story_v_out_221061.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_221061", "221061009", "story_v_out_221061.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_30 = math.max(var_38_21, arg_35_1.talkMaxDuration)

			if var_38_20 <= arg_35_1.time_ and arg_35_1.time_ < var_38_20 + var_38_30 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_20) / var_38_30

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_20 + var_38_30 and arg_35_1.time_ < var_38_20 + var_38_30 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play221061010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 221061010
		arg_39_1.duration_ = 4.6

		local var_39_0 = {
			ja = 4.6,
			ko = 4.066,
			zh = 4.066
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
				arg_39_0:Play221061011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1072ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1072ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(-0.7, -0.71, -6)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1072ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = 0

			if var_42_9 < arg_39_1.time_ and arg_39_1.time_ <= var_42_9 + arg_42_0 then
				arg_39_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_11 = 0
			local var_42_12 = 0.4

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_13 = arg_39_1:FormatText(StoryNameCfg[379].name)

				arg_39_1.leftNameTxt_.text = var_42_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_14 = arg_39_1:GetWordFromCfg(221061010)
				local var_42_15 = arg_39_1:FormatText(var_42_14.content)

				arg_39_1.text_.text = var_42_15

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_16 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061010", "story_v_out_221061.awb") ~= 0 then
					local var_42_19 = manager.audio:GetVoiceLength("story_v_out_221061", "221061010", "story_v_out_221061.awb") / 1000

					if var_42_19 + var_42_11 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_11
					end

					if var_42_14.prefab_name ~= "" and arg_39_1.actors_[var_42_14.prefab_name] ~= nil then
						local var_42_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_14.prefab_name].transform, "story_v_out_221061", "221061010", "story_v_out_221061.awb")

						arg_39_1:RecordAudio("221061010", var_42_20)
						arg_39_1:RecordAudio("221061010", var_42_20)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_221061", "221061010", "story_v_out_221061.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_221061", "221061010", "story_v_out_221061.awb")
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
	Play221061011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 221061011
		arg_43_1.duration_ = 8.4

		local var_43_0 = {
			ja = 8.4,
			ko = 5.9,
			zh = 5.9
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
				arg_43_0:Play221061012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1072ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1072ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(-0.7, -0.71, -6)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1072ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1072ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1072ui_story == nil then
				arg_43_1.var_.characterEffect1072ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1072ui_story then
					arg_43_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1072ui_story then
				arg_43_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072actionlink/1072action462")
			end

			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_15 = 0
			local var_46_16 = 0.55

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_17 = arg_43_1:FormatText(StoryNameCfg[379].name)

				arg_43_1.leftNameTxt_.text = var_46_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_18 = arg_43_1:GetWordFromCfg(221061011)
				local var_46_19 = arg_43_1:FormatText(var_46_18.content)

				arg_43_1.text_.text = var_46_19

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_20 = 22
				local var_46_21 = utf8.len(var_46_19)
				local var_46_22 = var_46_20 <= 0 and var_46_16 or var_46_16 * (var_46_21 / var_46_20)

				if var_46_22 > 0 and var_46_16 < var_46_22 then
					arg_43_1.talkMaxDuration = var_46_22

					if var_46_22 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_22 + var_46_15
					end
				end

				arg_43_1.text_.text = var_46_19
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061011", "story_v_out_221061.awb") ~= 0 then
					local var_46_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061011", "story_v_out_221061.awb") / 1000

					if var_46_23 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_23 + var_46_15
					end

					if var_46_18.prefab_name ~= "" and arg_43_1.actors_[var_46_18.prefab_name] ~= nil then
						local var_46_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_18.prefab_name].transform, "story_v_out_221061", "221061011", "story_v_out_221061.awb")

						arg_43_1:RecordAudio("221061011", var_46_24)
						arg_43_1:RecordAudio("221061011", var_46_24)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_221061", "221061011", "story_v_out_221061.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_221061", "221061011", "story_v_out_221061.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_25 = math.max(var_46_16, arg_43_1.talkMaxDuration)

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_25 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_15) / var_46_25

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_15 + var_46_25 and arg_43_1.time_ < var_46_15 + var_46_25 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play221061012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 221061012
		arg_47_1.duration_ = 7.933

		local var_47_0 = {
			ja = 6.5,
			ko = 7.933,
			zh = 7.933
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
				arg_47_0:Play221061013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1076ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1076ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0.7, -1.06, -6.2)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1076ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1076ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1076ui_story == nil then
				arg_47_1.var_.characterEffect1076ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1076ui_story then
					arg_47_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1076ui_story then
				arg_47_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_14 = arg_47_1.actors_["1072ui_story"]
			local var_50_15 = 0

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect1072ui_story == nil then
				arg_47_1.var_.characterEffect1072ui_story = var_50_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_16 = 0.200000002980232

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_16 then
				local var_50_17 = (arg_47_1.time_ - var_50_15) / var_50_16

				if arg_47_1.var_.characterEffect1072ui_story then
					local var_50_18 = Mathf.Lerp(0, 0.5, var_50_17)

					arg_47_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1072ui_story.fillRatio = var_50_18
				end
			end

			if arg_47_1.time_ >= var_50_15 + var_50_16 and arg_47_1.time_ < var_50_15 + var_50_16 + arg_50_0 and arg_47_1.var_.characterEffect1072ui_story then
				local var_50_19 = 0.5

				arg_47_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1072ui_story.fillRatio = var_50_19
			end

			local var_50_20 = 0
			local var_50_21 = 0.775

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_22 = arg_47_1:FormatText(StoryNameCfg[389].name)

				arg_47_1.leftNameTxt_.text = var_50_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_23 = arg_47_1:GetWordFromCfg(221061012)
				local var_50_24 = arg_47_1:FormatText(var_50_23.content)

				arg_47_1.text_.text = var_50_24

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_25 = 30
				local var_50_26 = utf8.len(var_50_24)
				local var_50_27 = var_50_25 <= 0 and var_50_21 or var_50_21 * (var_50_26 / var_50_25)

				if var_50_27 > 0 and var_50_21 < var_50_27 then
					arg_47_1.talkMaxDuration = var_50_27

					if var_50_27 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_20
					end
				end

				arg_47_1.text_.text = var_50_24
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061012", "story_v_out_221061.awb") ~= 0 then
					local var_50_28 = manager.audio:GetVoiceLength("story_v_out_221061", "221061012", "story_v_out_221061.awb") / 1000

					if var_50_28 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_28 + var_50_20
					end

					if var_50_23.prefab_name ~= "" and arg_47_1.actors_[var_50_23.prefab_name] ~= nil then
						local var_50_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_23.prefab_name].transform, "story_v_out_221061", "221061012", "story_v_out_221061.awb")

						arg_47_1:RecordAudio("221061012", var_50_29)
						arg_47_1:RecordAudio("221061012", var_50_29)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_221061", "221061012", "story_v_out_221061.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_221061", "221061012", "story_v_out_221061.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_30 = math.max(var_50_21, arg_47_1.talkMaxDuration)

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_30 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_20) / var_50_30

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_20 + var_50_30 and arg_47_1.time_ < var_50_20 + var_50_30 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play221061013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 221061013
		arg_51_1.duration_ = 7.8

		local var_51_0 = {
			ja = 7.8,
			ko = 5.466,
			zh = 5.466
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
				arg_51_0:Play221061014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1076ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1076ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0.7, -1.06, -6.2)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1076ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = 0

			if var_54_9 < arg_51_1.time_ and arg_51_1.time_ <= var_54_9 + arg_54_0 then
				arg_51_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_54_10 = 0
			local var_54_11 = 0.6

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_12 = arg_51_1:FormatText(StoryNameCfg[389].name)

				arg_51_1.leftNameTxt_.text = var_54_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_13 = arg_51_1:GetWordFromCfg(221061013)
				local var_54_14 = arg_51_1:FormatText(var_54_13.content)

				arg_51_1.text_.text = var_54_14

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_15 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061013", "story_v_out_221061.awb") ~= 0 then
					local var_54_18 = manager.audio:GetVoiceLength("story_v_out_221061", "221061013", "story_v_out_221061.awb") / 1000

					if var_54_18 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_10
					end

					if var_54_13.prefab_name ~= "" and arg_51_1.actors_[var_54_13.prefab_name] ~= nil then
						local var_54_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_13.prefab_name].transform, "story_v_out_221061", "221061013", "story_v_out_221061.awb")

						arg_51_1:RecordAudio("221061013", var_54_19)
						arg_51_1:RecordAudio("221061013", var_54_19)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_221061", "221061013", "story_v_out_221061.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_221061", "221061013", "story_v_out_221061.awb")
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
	Play221061014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 221061014
		arg_55_1.duration_ = 2.833

		local var_55_0 = {
			ja = 2.166,
			ko = 2.833,
			zh = 2.833
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
				arg_55_0:Play221061015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1072ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1072ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(-0.7, -0.71, -6)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1072ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1072ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1072ui_story == nil then
				arg_55_1.var_.characterEffect1072ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1072ui_story then
					arg_55_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1072ui_story then
				arg_55_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action2_2")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_58_15 = arg_55_1.actors_["1076ui_story"]
			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 and arg_55_1.var_.characterEffect1076ui_story == nil then
				arg_55_1.var_.characterEffect1076ui_story = var_58_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_17 = 0.200000002980232

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17

				if arg_55_1.var_.characterEffect1076ui_story then
					local var_58_19 = Mathf.Lerp(0, 0.5, var_58_18)

					arg_55_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1076ui_story.fillRatio = var_58_19
				end
			end

			if arg_55_1.time_ >= var_58_16 + var_58_17 and arg_55_1.time_ < var_58_16 + var_58_17 + arg_58_0 and arg_55_1.var_.characterEffect1076ui_story then
				local var_58_20 = 0.5

				arg_55_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1076ui_story.fillRatio = var_58_20
			end

			local var_58_21 = 0
			local var_58_22 = 0.05

			if var_58_21 < arg_55_1.time_ and arg_55_1.time_ <= var_58_21 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_23 = arg_55_1:FormatText(StoryNameCfg[379].name)

				arg_55_1.leftNameTxt_.text = var_58_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_24 = arg_55_1:GetWordFromCfg(221061014)
				local var_58_25 = arg_55_1:FormatText(var_58_24.content)

				arg_55_1.text_.text = var_58_25

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_26 = 2
				local var_58_27 = utf8.len(var_58_25)
				local var_58_28 = var_58_26 <= 0 and var_58_22 or var_58_22 * (var_58_27 / var_58_26)

				if var_58_28 > 0 and var_58_22 < var_58_28 then
					arg_55_1.talkMaxDuration = var_58_28

					if var_58_28 + var_58_21 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_28 + var_58_21
					end
				end

				arg_55_1.text_.text = var_58_25
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061014", "story_v_out_221061.awb") ~= 0 then
					local var_58_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061014", "story_v_out_221061.awb") / 1000

					if var_58_29 + var_58_21 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_29 + var_58_21
					end

					if var_58_24.prefab_name ~= "" and arg_55_1.actors_[var_58_24.prefab_name] ~= nil then
						local var_58_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_24.prefab_name].transform, "story_v_out_221061", "221061014", "story_v_out_221061.awb")

						arg_55_1:RecordAudio("221061014", var_58_30)
						arg_55_1:RecordAudio("221061014", var_58_30)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_221061", "221061014", "story_v_out_221061.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_221061", "221061014", "story_v_out_221061.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_31 = math.max(var_58_22, arg_55_1.talkMaxDuration)

			if var_58_21 <= arg_55_1.time_ and arg_55_1.time_ < var_58_21 + var_58_31 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_21) / var_58_31

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_21 + var_58_31 and arg_55_1.time_ < var_58_21 + var_58_31 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play221061015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 221061015
		arg_59_1.duration_ = 11.666

		local var_59_0 = {
			ja = 11.666,
			ko = 9.466,
			zh = 9.466
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
				arg_59_0:Play221061016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1072ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1072ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(-0.7, -0.71, -6)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1072ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = arg_59_1.actors_["1072ui_story"]
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect1072ui_story == nil then
				arg_59_1.var_.characterEffect1072ui_story = var_62_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_11 = 0.200000002980232

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11

				if arg_59_1.var_.characterEffect1072ui_story then
					arg_59_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect1072ui_story then
				arg_59_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_62_13 = 0
			local var_62_14 = 0.85

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_15 = arg_59_1:FormatText(StoryNameCfg[379].name)

				arg_59_1.leftNameTxt_.text = var_62_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_16 = arg_59_1:GetWordFromCfg(221061015)
				local var_62_17 = arg_59_1:FormatText(var_62_16.content)

				arg_59_1.text_.text = var_62_17

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_18 = 34
				local var_62_19 = utf8.len(var_62_17)
				local var_62_20 = var_62_18 <= 0 and var_62_14 or var_62_14 * (var_62_19 / var_62_18)

				if var_62_20 > 0 and var_62_14 < var_62_20 then
					arg_59_1.talkMaxDuration = var_62_20

					if var_62_20 + var_62_13 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_13
					end
				end

				arg_59_1.text_.text = var_62_17
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061015", "story_v_out_221061.awb") ~= 0 then
					local var_62_21 = manager.audio:GetVoiceLength("story_v_out_221061", "221061015", "story_v_out_221061.awb") / 1000

					if var_62_21 + var_62_13 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_21 + var_62_13
					end

					if var_62_16.prefab_name ~= "" and arg_59_1.actors_[var_62_16.prefab_name] ~= nil then
						local var_62_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_16.prefab_name].transform, "story_v_out_221061", "221061015", "story_v_out_221061.awb")

						arg_59_1:RecordAudio("221061015", var_62_22)
						arg_59_1:RecordAudio("221061015", var_62_22)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_221061", "221061015", "story_v_out_221061.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_221061", "221061015", "story_v_out_221061.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_23 = math.max(var_62_14, arg_59_1.talkMaxDuration)

			if var_62_13 <= arg_59_1.time_ and arg_59_1.time_ < var_62_13 + var_62_23 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_13) / var_62_23

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_13 + var_62_23 and arg_59_1.time_ < var_62_13 + var_62_23 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play221061016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 221061016
		arg_63_1.duration_ = 8.233

		local var_63_0 = {
			ja = 8.233,
			ko = 6.133,
			zh = 6.133
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
				arg_63_0:Play221061017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1076ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1076ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0.7, -1.06, -6.2)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1076ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1076ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect1076ui_story == nil then
				arg_63_1.var_.characterEffect1076ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1076ui_story then
					arg_63_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect1076ui_story then
				arg_63_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action2_1")
			end

			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_15 = arg_63_1.actors_["1072ui_story"]
			local var_66_16 = 0

			if var_66_16 < arg_63_1.time_ and arg_63_1.time_ <= var_66_16 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story == nil then
				arg_63_1.var_.characterEffect1072ui_story = var_66_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_17 = 0.200000002980232

			if var_66_16 <= arg_63_1.time_ and arg_63_1.time_ < var_66_16 + var_66_17 then
				local var_66_18 = (arg_63_1.time_ - var_66_16) / var_66_17

				if arg_63_1.var_.characterEffect1072ui_story then
					local var_66_19 = Mathf.Lerp(0, 0.5, var_66_18)

					arg_63_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1072ui_story.fillRatio = var_66_19
				end
			end

			if arg_63_1.time_ >= var_66_16 + var_66_17 and arg_63_1.time_ < var_66_16 + var_66_17 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story then
				local var_66_20 = 0.5

				arg_63_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1072ui_story.fillRatio = var_66_20
			end

			local var_66_21 = 0
			local var_66_22 = 0.6

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_23 = arg_63_1:FormatText(StoryNameCfg[389].name)

				arg_63_1.leftNameTxt_.text = var_66_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_24 = arg_63_1:GetWordFromCfg(221061016)
				local var_66_25 = arg_63_1:FormatText(var_66_24.content)

				arg_63_1.text_.text = var_66_25

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_26 = 24
				local var_66_27 = utf8.len(var_66_25)
				local var_66_28 = var_66_26 <= 0 and var_66_22 or var_66_22 * (var_66_27 / var_66_26)

				if var_66_28 > 0 and var_66_22 < var_66_28 then
					arg_63_1.talkMaxDuration = var_66_28

					if var_66_28 + var_66_21 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_28 + var_66_21
					end
				end

				arg_63_1.text_.text = var_66_25
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061016", "story_v_out_221061.awb") ~= 0 then
					local var_66_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061016", "story_v_out_221061.awb") / 1000

					if var_66_29 + var_66_21 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_29 + var_66_21
					end

					if var_66_24.prefab_name ~= "" and arg_63_1.actors_[var_66_24.prefab_name] ~= nil then
						local var_66_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_24.prefab_name].transform, "story_v_out_221061", "221061016", "story_v_out_221061.awb")

						arg_63_1:RecordAudio("221061016", var_66_30)
						arg_63_1:RecordAudio("221061016", var_66_30)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_221061", "221061016", "story_v_out_221061.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_221061", "221061016", "story_v_out_221061.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_31 = math.max(var_66_22, arg_63_1.talkMaxDuration)

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_31 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_21) / var_66_31

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_21 + var_66_31 and arg_63_1.time_ < var_66_21 + var_66_31 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play221061017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 221061017
		arg_67_1.duration_ = 6.9

		local var_67_0 = {
			ja = 5.466,
			ko = 6.9,
			zh = 6.9
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
				arg_67_0:Play221061018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1072ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1072ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(-0.7, -0.71, -6)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1072ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["1072ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story == nil then
				arg_67_1.var_.characterEffect1072ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect1072ui_story then
					arg_67_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story then
				arg_67_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action4_1")
			end

			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_15 = arg_67_1.actors_["1076ui_story"]
			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 and arg_67_1.var_.characterEffect1076ui_story == nil then
				arg_67_1.var_.characterEffect1076ui_story = var_70_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_17 = 0.200000002980232

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17

				if arg_67_1.var_.characterEffect1076ui_story then
					local var_70_19 = Mathf.Lerp(0, 0.5, var_70_18)

					arg_67_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1076ui_story.fillRatio = var_70_19
				end
			end

			if arg_67_1.time_ >= var_70_16 + var_70_17 and arg_67_1.time_ < var_70_16 + var_70_17 + arg_70_0 and arg_67_1.var_.characterEffect1076ui_story then
				local var_70_20 = 0.5

				arg_67_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1076ui_story.fillRatio = var_70_20
			end

			local var_70_21 = 0
			local var_70_22 = 0.45

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_23 = arg_67_1:FormatText(StoryNameCfg[379].name)

				arg_67_1.leftNameTxt_.text = var_70_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_24 = arg_67_1:GetWordFromCfg(221061017)
				local var_70_25 = arg_67_1:FormatText(var_70_24.content)

				arg_67_1.text_.text = var_70_25

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_26 = 18
				local var_70_27 = utf8.len(var_70_25)
				local var_70_28 = var_70_26 <= 0 and var_70_22 or var_70_22 * (var_70_27 / var_70_26)

				if var_70_28 > 0 and var_70_22 < var_70_28 then
					arg_67_1.talkMaxDuration = var_70_28

					if var_70_28 + var_70_21 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_28 + var_70_21
					end
				end

				arg_67_1.text_.text = var_70_25
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061017", "story_v_out_221061.awb") ~= 0 then
					local var_70_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061017", "story_v_out_221061.awb") / 1000

					if var_70_29 + var_70_21 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_29 + var_70_21
					end

					if var_70_24.prefab_name ~= "" and arg_67_1.actors_[var_70_24.prefab_name] ~= nil then
						local var_70_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_24.prefab_name].transform, "story_v_out_221061", "221061017", "story_v_out_221061.awb")

						arg_67_1:RecordAudio("221061017", var_70_30)
						arg_67_1:RecordAudio("221061017", var_70_30)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_221061", "221061017", "story_v_out_221061.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_221061", "221061017", "story_v_out_221061.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_31 = math.max(var_70_22, arg_67_1.talkMaxDuration)

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_31 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_21) / var_70_31

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_21 + var_70_31 and arg_67_1.time_ < var_70_21 + var_70_31 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play221061018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 221061018
		arg_71_1.duration_ = 6.833

		local var_71_0 = {
			ja = 6.833,
			ko = 5.033,
			zh = 5.033
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
				arg_71_0:Play221061019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1072ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1072ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(-0.7, -0.71, -6)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1072ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = 0

			if var_74_9 < arg_71_1.time_ and arg_71_1.time_ <= var_74_9 + arg_74_0 then
				arg_71_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_74_10 = 0
			local var_74_11 = 0.475

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_12 = arg_71_1:FormatText(StoryNameCfg[379].name)

				arg_71_1.leftNameTxt_.text = var_74_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_13 = arg_71_1:GetWordFromCfg(221061018)
				local var_74_14 = arg_71_1:FormatText(var_74_13.content)

				arg_71_1.text_.text = var_74_14

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_15 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061018", "story_v_out_221061.awb") ~= 0 then
					local var_74_18 = manager.audio:GetVoiceLength("story_v_out_221061", "221061018", "story_v_out_221061.awb") / 1000

					if var_74_18 + var_74_10 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_18 + var_74_10
					end

					if var_74_13.prefab_name ~= "" and arg_71_1.actors_[var_74_13.prefab_name] ~= nil then
						local var_74_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_13.prefab_name].transform, "story_v_out_221061", "221061018", "story_v_out_221061.awb")

						arg_71_1:RecordAudio("221061018", var_74_19)
						arg_71_1:RecordAudio("221061018", var_74_19)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_221061", "221061018", "story_v_out_221061.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_221061", "221061018", "story_v_out_221061.awb")
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
	Play221061019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 221061019
		arg_75_1.duration_ = 2

		local var_75_0 = {
			ja = 2,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_75_0:Play221061020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1076ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1076ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0.7, -1.06, -6.2)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1076ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1076ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect1076ui_story == nil then
				arg_75_1.var_.characterEffect1076ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect1076ui_story then
					arg_75_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect1076ui_story then
				arg_75_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_14 = arg_75_1.actors_["1072ui_story"]
			local var_78_15 = 0

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 and arg_75_1.var_.characterEffect1072ui_story == nil then
				arg_75_1.var_.characterEffect1072ui_story = var_78_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_16 = 0.200000002980232

			if var_78_15 <= arg_75_1.time_ and arg_75_1.time_ < var_78_15 + var_78_16 then
				local var_78_17 = (arg_75_1.time_ - var_78_15) / var_78_16

				if arg_75_1.var_.characterEffect1072ui_story then
					local var_78_18 = Mathf.Lerp(0, 0.5, var_78_17)

					arg_75_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1072ui_story.fillRatio = var_78_18
				end
			end

			if arg_75_1.time_ >= var_78_15 + var_78_16 and arg_75_1.time_ < var_78_15 + var_78_16 + arg_78_0 and arg_75_1.var_.characterEffect1072ui_story then
				local var_78_19 = 0.5

				arg_75_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1072ui_story.fillRatio = var_78_19
			end

			local var_78_20 = 0
			local var_78_21 = 0.125

			if var_78_20 < arg_75_1.time_ and arg_75_1.time_ <= var_78_20 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_22 = arg_75_1:FormatText(StoryNameCfg[389].name)

				arg_75_1.leftNameTxt_.text = var_78_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_23 = arg_75_1:GetWordFromCfg(221061019)
				local var_78_24 = arg_75_1:FormatText(var_78_23.content)

				arg_75_1.text_.text = var_78_24

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_25 = 5
				local var_78_26 = utf8.len(var_78_24)
				local var_78_27 = var_78_25 <= 0 and var_78_21 or var_78_21 * (var_78_26 / var_78_25)

				if var_78_27 > 0 and var_78_21 < var_78_27 then
					arg_75_1.talkMaxDuration = var_78_27

					if var_78_27 + var_78_20 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_27 + var_78_20
					end
				end

				arg_75_1.text_.text = var_78_24
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061019", "story_v_out_221061.awb") ~= 0 then
					local var_78_28 = manager.audio:GetVoiceLength("story_v_out_221061", "221061019", "story_v_out_221061.awb") / 1000

					if var_78_28 + var_78_20 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_28 + var_78_20
					end

					if var_78_23.prefab_name ~= "" and arg_75_1.actors_[var_78_23.prefab_name] ~= nil then
						local var_78_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_23.prefab_name].transform, "story_v_out_221061", "221061019", "story_v_out_221061.awb")

						arg_75_1:RecordAudio("221061019", var_78_29)
						arg_75_1:RecordAudio("221061019", var_78_29)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_221061", "221061019", "story_v_out_221061.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_221061", "221061019", "story_v_out_221061.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_30 = math.max(var_78_21, arg_75_1.talkMaxDuration)

			if var_78_20 <= arg_75_1.time_ and arg_75_1.time_ < var_78_20 + var_78_30 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_20) / var_78_30

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_20 + var_78_30 and arg_75_1.time_ < var_78_20 + var_78_30 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play221061020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 221061020
		arg_79_1.duration_ = 6.466

		local var_79_0 = {
			ja = 6.466,
			ko = 4.3,
			zh = 4.3
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
				arg_79_0:Play221061021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1072ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1072ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(-0.7, -0.71, -6)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1072ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["1072ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect1072ui_story == nil then
				arg_79_1.var_.characterEffect1072ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect1072ui_story then
					arg_79_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect1072ui_story then
				arg_79_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action4_2")
			end

			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_15 = arg_79_1.actors_["1076ui_story"]
			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 and arg_79_1.var_.characterEffect1076ui_story == nil then
				arg_79_1.var_.characterEffect1076ui_story = var_82_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_17 = 0.200000002980232

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_17 then
				local var_82_18 = (arg_79_1.time_ - var_82_16) / var_82_17

				if arg_79_1.var_.characterEffect1076ui_story then
					local var_82_19 = Mathf.Lerp(0, 0.5, var_82_18)

					arg_79_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1076ui_story.fillRatio = var_82_19
				end
			end

			if arg_79_1.time_ >= var_82_16 + var_82_17 and arg_79_1.time_ < var_82_16 + var_82_17 + arg_82_0 and arg_79_1.var_.characterEffect1076ui_story then
				local var_82_20 = 0.5

				arg_79_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1076ui_story.fillRatio = var_82_20
			end

			local var_82_21 = 0
			local var_82_22 = 0.425

			if var_82_21 < arg_79_1.time_ and arg_79_1.time_ <= var_82_21 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_23 = arg_79_1:FormatText(StoryNameCfg[379].name)

				arg_79_1.leftNameTxt_.text = var_82_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_24 = arg_79_1:GetWordFromCfg(221061020)
				local var_82_25 = arg_79_1:FormatText(var_82_24.content)

				arg_79_1.text_.text = var_82_25

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_26 = 17
				local var_82_27 = utf8.len(var_82_25)
				local var_82_28 = var_82_26 <= 0 and var_82_22 or var_82_22 * (var_82_27 / var_82_26)

				if var_82_28 > 0 and var_82_22 < var_82_28 then
					arg_79_1.talkMaxDuration = var_82_28

					if var_82_28 + var_82_21 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_28 + var_82_21
					end
				end

				arg_79_1.text_.text = var_82_25
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061020", "story_v_out_221061.awb") ~= 0 then
					local var_82_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061020", "story_v_out_221061.awb") / 1000

					if var_82_29 + var_82_21 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_29 + var_82_21
					end

					if var_82_24.prefab_name ~= "" and arg_79_1.actors_[var_82_24.prefab_name] ~= nil then
						local var_82_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_24.prefab_name].transform, "story_v_out_221061", "221061020", "story_v_out_221061.awb")

						arg_79_1:RecordAudio("221061020", var_82_30)
						arg_79_1:RecordAudio("221061020", var_82_30)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_221061", "221061020", "story_v_out_221061.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_221061", "221061020", "story_v_out_221061.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_31 = math.max(var_82_22, arg_79_1.talkMaxDuration)

			if var_82_21 <= arg_79_1.time_ and arg_79_1.time_ < var_82_21 + var_82_31 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_21) / var_82_31

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_21 + var_82_31 and arg_79_1.time_ < var_82_21 + var_82_31 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play221061021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 221061021
		arg_83_1.duration_ = 8.4

		local var_83_0 = {
			ja = 8.4,
			ko = 8.166,
			zh = 8.166
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
				arg_83_0:Play221061022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1072ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1072ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(-0.7, -0.71, -6)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1072ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = 0

			if var_86_9 < arg_83_1.time_ and arg_83_1.time_ <= var_86_9 + arg_86_0 then
				arg_83_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_86_10 = 0
			local var_86_11 = 0.875

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_12 = arg_83_1:FormatText(StoryNameCfg[379].name)

				arg_83_1.leftNameTxt_.text = var_86_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_13 = arg_83_1:GetWordFromCfg(221061021)
				local var_86_14 = arg_83_1:FormatText(var_86_13.content)

				arg_83_1.text_.text = var_86_14

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_15 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061021", "story_v_out_221061.awb") ~= 0 then
					local var_86_18 = manager.audio:GetVoiceLength("story_v_out_221061", "221061021", "story_v_out_221061.awb") / 1000

					if var_86_18 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_18 + var_86_10
					end

					if var_86_13.prefab_name ~= "" and arg_83_1.actors_[var_86_13.prefab_name] ~= nil then
						local var_86_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_13.prefab_name].transform, "story_v_out_221061", "221061021", "story_v_out_221061.awb")

						arg_83_1:RecordAudio("221061021", var_86_19)
						arg_83_1:RecordAudio("221061021", var_86_19)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_221061", "221061021", "story_v_out_221061.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_221061", "221061021", "story_v_out_221061.awb")
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
	Play221061022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 221061022
		arg_87_1.duration_ = 8

		local var_87_0 = {
			ja = 8,
			ko = 6.7,
			zh = 6.7
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
				arg_87_0:Play221061023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_90_1 = 0
			local var_90_2 = 0.925

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_3 = arg_87_1:FormatText(StoryNameCfg[379].name)

				arg_87_1.leftNameTxt_.text = var_90_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_4 = arg_87_1:GetWordFromCfg(221061022)
				local var_90_5 = arg_87_1:FormatText(var_90_4.content)

				arg_87_1.text_.text = var_90_5

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_6 = 37
				local var_90_7 = utf8.len(var_90_5)
				local var_90_8 = var_90_6 <= 0 and var_90_2 or var_90_2 * (var_90_7 / var_90_6)

				if var_90_8 > 0 and var_90_2 < var_90_8 then
					arg_87_1.talkMaxDuration = var_90_8

					if var_90_8 + var_90_1 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_1
					end
				end

				arg_87_1.text_.text = var_90_5
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061022", "story_v_out_221061.awb") ~= 0 then
					local var_90_9 = manager.audio:GetVoiceLength("story_v_out_221061", "221061022", "story_v_out_221061.awb") / 1000

					if var_90_9 + var_90_1 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_9 + var_90_1
					end

					if var_90_4.prefab_name ~= "" and arg_87_1.actors_[var_90_4.prefab_name] ~= nil then
						local var_90_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_4.prefab_name].transform, "story_v_out_221061", "221061022", "story_v_out_221061.awb")

						arg_87_1:RecordAudio("221061022", var_90_10)
						arg_87_1:RecordAudio("221061022", var_90_10)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_221061", "221061022", "story_v_out_221061.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_221061", "221061022", "story_v_out_221061.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_11 = math.max(var_90_2, arg_87_1.talkMaxDuration)

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_11 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_1) / var_90_11

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_1 + var_90_11 and arg_87_1.time_ < var_90_1 + var_90_11 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play221061023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 221061023
		arg_91_1.duration_ = 1.999999999999

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play221061024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1076ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1076ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0.7, -1.06, -6.2)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1076ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["1076ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect1076ui_story == nil then
				arg_91_1.var_.characterEffect1076ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect1076ui_story then
					arg_91_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1076ui_story then
				arg_91_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action2_2")
			end

			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_94_15 = arg_91_1.actors_["1072ui_story"]
			local var_94_16 = 0

			if var_94_16 < arg_91_1.time_ and arg_91_1.time_ <= var_94_16 + arg_94_0 and arg_91_1.var_.characterEffect1072ui_story == nil then
				arg_91_1.var_.characterEffect1072ui_story = var_94_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_17 = 0.200000002980232

			if var_94_16 <= arg_91_1.time_ and arg_91_1.time_ < var_94_16 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_16) / var_94_17

				if arg_91_1.var_.characterEffect1072ui_story then
					local var_94_19 = Mathf.Lerp(0, 0.5, var_94_18)

					arg_91_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1072ui_story.fillRatio = var_94_19
				end
			end

			if arg_91_1.time_ >= var_94_16 + var_94_17 and arg_91_1.time_ < var_94_16 + var_94_17 + arg_94_0 and arg_91_1.var_.characterEffect1072ui_story then
				local var_94_20 = 0.5

				arg_91_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1072ui_story.fillRatio = var_94_20
			end

			local var_94_21 = 0
			local var_94_22 = 0.05

			if var_94_21 < arg_91_1.time_ and arg_91_1.time_ <= var_94_21 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_23 = arg_91_1:FormatText(StoryNameCfg[389].name)

				arg_91_1.leftNameTxt_.text = var_94_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_24 = arg_91_1:GetWordFromCfg(221061023)
				local var_94_25 = arg_91_1:FormatText(var_94_24.content)

				arg_91_1.text_.text = var_94_25

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_26 = 2
				local var_94_27 = utf8.len(var_94_25)
				local var_94_28 = var_94_26 <= 0 and var_94_22 or var_94_22 * (var_94_27 / var_94_26)

				if var_94_28 > 0 and var_94_22 < var_94_28 then
					arg_91_1.talkMaxDuration = var_94_28

					if var_94_28 + var_94_21 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_28 + var_94_21
					end
				end

				arg_91_1.text_.text = var_94_25
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061023", "story_v_out_221061.awb") ~= 0 then
					local var_94_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061023", "story_v_out_221061.awb") / 1000

					if var_94_29 + var_94_21 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_29 + var_94_21
					end

					if var_94_24.prefab_name ~= "" and arg_91_1.actors_[var_94_24.prefab_name] ~= nil then
						local var_94_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_24.prefab_name].transform, "story_v_out_221061", "221061023", "story_v_out_221061.awb")

						arg_91_1:RecordAudio("221061023", var_94_30)
						arg_91_1:RecordAudio("221061023", var_94_30)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_221061", "221061023", "story_v_out_221061.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_221061", "221061023", "story_v_out_221061.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_31 = math.max(var_94_22, arg_91_1.talkMaxDuration)

			if var_94_21 <= arg_91_1.time_ and arg_91_1.time_ < var_94_21 + var_94_31 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_21) / var_94_31

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_21 + var_94_31 and arg_91_1.time_ < var_94_21 + var_94_31 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play221061024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 221061024
		arg_95_1.duration_ = 8.233

		local var_95_0 = {
			ja = 8.233,
			ko = 6.2,
			zh = 6.2
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
				arg_95_0:Play221061025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1072ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1072ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(-0.7, -0.71, -6)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1072ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["1072ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect1072ui_story == nil then
				arg_95_1.var_.characterEffect1072ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect1072ui_story then
					arg_95_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect1072ui_story then
				arg_95_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action7_1")
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_15 = arg_95_1.actors_["1076ui_story"]
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 and arg_95_1.var_.characterEffect1076ui_story == nil then
				arg_95_1.var_.characterEffect1076ui_story = var_98_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_17 = 0.200000002980232

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17

				if arg_95_1.var_.characterEffect1076ui_story then
					local var_98_19 = Mathf.Lerp(0, 0.5, var_98_18)

					arg_95_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1076ui_story.fillRatio = var_98_19
				end
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 and arg_95_1.var_.characterEffect1076ui_story then
				local var_98_20 = 0.5

				arg_95_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1076ui_story.fillRatio = var_98_20
			end

			local var_98_21 = 0
			local var_98_22 = 0.725

			if var_98_21 < arg_95_1.time_ and arg_95_1.time_ <= var_98_21 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_23 = arg_95_1:FormatText(StoryNameCfg[379].name)

				arg_95_1.leftNameTxt_.text = var_98_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_24 = arg_95_1:GetWordFromCfg(221061024)
				local var_98_25 = arg_95_1:FormatText(var_98_24.content)

				arg_95_1.text_.text = var_98_25

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_26 = 29
				local var_98_27 = utf8.len(var_98_25)
				local var_98_28 = var_98_26 <= 0 and var_98_22 or var_98_22 * (var_98_27 / var_98_26)

				if var_98_28 > 0 and var_98_22 < var_98_28 then
					arg_95_1.talkMaxDuration = var_98_28

					if var_98_28 + var_98_21 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_28 + var_98_21
					end
				end

				arg_95_1.text_.text = var_98_25
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061024", "story_v_out_221061.awb") ~= 0 then
					local var_98_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061024", "story_v_out_221061.awb") / 1000

					if var_98_29 + var_98_21 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_29 + var_98_21
					end

					if var_98_24.prefab_name ~= "" and arg_95_1.actors_[var_98_24.prefab_name] ~= nil then
						local var_98_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_24.prefab_name].transform, "story_v_out_221061", "221061024", "story_v_out_221061.awb")

						arg_95_1:RecordAudio("221061024", var_98_30)
						arg_95_1:RecordAudio("221061024", var_98_30)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_221061", "221061024", "story_v_out_221061.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_221061", "221061024", "story_v_out_221061.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_31 = math.max(var_98_22, arg_95_1.talkMaxDuration)

			if var_98_21 <= arg_95_1.time_ and arg_95_1.time_ < var_98_21 + var_98_31 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_21) / var_98_31

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_21 + var_98_31 and arg_95_1.time_ < var_98_21 + var_98_31 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play221061025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 221061025
		arg_99_1.duration_ = 9.1

		local var_99_0 = {
			ja = 9.1,
			ko = 5.666,
			zh = 5.666
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
				arg_99_0:Play221061026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1072ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1072ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(-0.7, -0.71, -6)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1072ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1072ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1072ui_story == nil then
				arg_99_1.var_.characterEffect1072ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1072ui_story then
					arg_99_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1072ui_story then
				arg_99_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072actionlink/1072action472")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_15 = 0
			local var_102_16 = 0.725

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_17 = arg_99_1:FormatText(StoryNameCfg[379].name)

				arg_99_1.leftNameTxt_.text = var_102_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_18 = arg_99_1:GetWordFromCfg(221061025)
				local var_102_19 = arg_99_1:FormatText(var_102_18.content)

				arg_99_1.text_.text = var_102_19

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_20 = 29
				local var_102_21 = utf8.len(var_102_19)
				local var_102_22 = var_102_20 <= 0 and var_102_16 or var_102_16 * (var_102_21 / var_102_20)

				if var_102_22 > 0 and var_102_16 < var_102_22 then
					arg_99_1.talkMaxDuration = var_102_22

					if var_102_22 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_22 + var_102_15
					end
				end

				arg_99_1.text_.text = var_102_19
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061025", "story_v_out_221061.awb") ~= 0 then
					local var_102_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061025", "story_v_out_221061.awb") / 1000

					if var_102_23 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_23 + var_102_15
					end

					if var_102_18.prefab_name ~= "" and arg_99_1.actors_[var_102_18.prefab_name] ~= nil then
						local var_102_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_18.prefab_name].transform, "story_v_out_221061", "221061025", "story_v_out_221061.awb")

						arg_99_1:RecordAudio("221061025", var_102_24)
						arg_99_1:RecordAudio("221061025", var_102_24)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_221061", "221061025", "story_v_out_221061.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_221061", "221061025", "story_v_out_221061.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_25 = math.max(var_102_16, arg_99_1.talkMaxDuration)

			if var_102_15 <= arg_99_1.time_ and arg_99_1.time_ < var_102_15 + var_102_25 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_15) / var_102_25

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_15 + var_102_25 and arg_99_1.time_ < var_102_15 + var_102_25 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play221061026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 221061026
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play221061027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1076ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1076ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, 100, 0)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1076ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, 100, 0)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["1076ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect1076ui_story == nil then
				arg_103_1.var_.characterEffect1076ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect1076ui_story then
					local var_106_13 = Mathf.Lerp(0, 0.5, var_106_12)

					arg_103_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1076ui_story.fillRatio = var_106_13
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect1076ui_story then
				local var_106_14 = 0.5

				arg_103_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1076ui_story.fillRatio = var_106_14
			end

			local var_106_15 = arg_103_1.actors_["1072ui_story"].transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.moveOldPos1072ui_story = var_106_15.localPosition
			end

			local var_106_17 = 0.001

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Vector3.New(0, 100, 0)

				var_106_15.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1072ui_story, var_106_19, var_106_18)

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

			local var_106_24 = arg_103_1.actors_["1072ui_story"]
			local var_106_25 = 0

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 and arg_103_1.var_.characterEffect1072ui_story == nil then
				arg_103_1.var_.characterEffect1072ui_story = var_106_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_26 = 0.200000002980232

			if var_106_25 <= arg_103_1.time_ and arg_103_1.time_ < var_106_25 + var_106_26 then
				local var_106_27 = (arg_103_1.time_ - var_106_25) / var_106_26

				if arg_103_1.var_.characterEffect1072ui_story then
					local var_106_28 = Mathf.Lerp(0, 0.5, var_106_27)

					arg_103_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1072ui_story.fillRatio = var_106_28
				end
			end

			if arg_103_1.time_ >= var_106_25 + var_106_26 and arg_103_1.time_ < var_106_25 + var_106_26 + arg_106_0 and arg_103_1.var_.characterEffect1072ui_story then
				local var_106_29 = 0.5

				arg_103_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1072ui_story.fillRatio = var_106_29
			end

			local var_106_30 = 0
			local var_106_31 = 0.925

			if var_106_30 < arg_103_1.time_ and arg_103_1.time_ <= var_106_30 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_32 = arg_103_1:GetWordFromCfg(221061026)
				local var_106_33 = arg_103_1:FormatText(var_106_32.content)

				arg_103_1.text_.text = var_106_33

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_34 = 37
				local var_106_35 = utf8.len(var_106_33)
				local var_106_36 = var_106_34 <= 0 and var_106_31 or var_106_31 * (var_106_35 / var_106_34)

				if var_106_36 > 0 and var_106_31 < var_106_36 then
					arg_103_1.talkMaxDuration = var_106_36

					if var_106_36 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_36 + var_106_30
					end
				end

				arg_103_1.text_.text = var_106_33
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_37 = math.max(var_106_31, arg_103_1.talkMaxDuration)

			if var_106_30 <= arg_103_1.time_ and arg_103_1.time_ < var_106_30 + var_106_37 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_30) / var_106_37

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_30 + var_106_37 and arg_103_1.time_ < var_106_30 + var_106_37 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play221061027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 221061027
		arg_107_1.duration_ = 9

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play221061028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = "ST39"

			if arg_107_1.bgs_[var_110_0] == nil then
				local var_110_1 = Object.Instantiate(arg_107_1.paintGo_)

				var_110_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_110_0)
				var_110_1.name = var_110_0
				var_110_1.transform.parent = arg_107_1.stage_.transform
				var_110_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_107_1.bgs_[var_110_0] = var_110_1
			end

			local var_110_2 = 2

			if var_110_2 < arg_107_1.time_ and arg_107_1.time_ <= var_110_2 + arg_110_0 then
				local var_110_3 = manager.ui.mainCamera.transform.localPosition
				local var_110_4 = Vector3.New(0, 0, 10) + Vector3.New(var_110_3.x, var_110_3.y, 0)
				local var_110_5 = arg_107_1.bgs_.ST39

				var_110_5.transform.localPosition = var_110_4
				var_110_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_110_6 = var_110_5:GetComponent("SpriteRenderer")

				if var_110_6 and var_110_6.sprite then
					local var_110_7 = (var_110_5.transform.localPosition - var_110_3).z
					local var_110_8 = manager.ui.mainCameraCom_
					local var_110_9 = 2 * var_110_7 * Mathf.Tan(var_110_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_110_10 = var_110_9 * var_110_8.aspect
					local var_110_11 = var_110_6.sprite.bounds.size.x
					local var_110_12 = var_110_6.sprite.bounds.size.y
					local var_110_13 = var_110_10 / var_110_11
					local var_110_14 = var_110_9 / var_110_12
					local var_110_15 = var_110_14 < var_110_13 and var_110_13 or var_110_14

					var_110_5.transform.localScale = Vector3.New(var_110_15, var_110_15, 0)
				end

				for iter_110_0, iter_110_1 in pairs(arg_107_1.bgs_) do
					if iter_110_0 ~= "ST39" then
						iter_110_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = true

				arg_107_1:SetGaussion(false)
			end

			local var_110_17 = 2

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17
				local var_110_19 = Color.New(0, 0, 0)

				var_110_19.a = Mathf.Lerp(0, 1, var_110_18)
				arg_107_1.mask_.color = var_110_19
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				local var_110_20 = Color.New(0, 0, 0)

				var_110_20.a = 1
				arg_107_1.mask_.color = var_110_20
			end

			local var_110_21 = 2

			if var_110_21 < arg_107_1.time_ and arg_107_1.time_ <= var_110_21 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = true

				arg_107_1:SetGaussion(false)
			end

			local var_110_22 = 2

			if var_110_21 <= arg_107_1.time_ and arg_107_1.time_ < var_110_21 + var_110_22 then
				local var_110_23 = (arg_107_1.time_ - var_110_21) / var_110_22
				local var_110_24 = Color.New(0, 0, 0)

				var_110_24.a = Mathf.Lerp(1, 0, var_110_23)
				arg_107_1.mask_.color = var_110_24
			end

			if arg_107_1.time_ >= var_110_21 + var_110_22 and arg_107_1.time_ < var_110_21 + var_110_22 + arg_110_0 then
				local var_110_25 = Color.New(0, 0, 0)
				local var_110_26 = 0

				arg_107_1.mask_.enabled = false
				var_110_25.a = var_110_26
				arg_107_1.mask_.color = var_110_25
			end

			if arg_107_1.frameCnt_ <= 1 then
				arg_107_1.dialog_:SetActive(false)
			end

			local var_110_27 = 4
			local var_110_28 = 1.125

			if var_110_27 < arg_107_1.time_ and arg_107_1.time_ <= var_110_27 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0

				arg_107_1.dialog_:SetActive(true)

				local var_110_29 = LeanTween.value(arg_107_1.dialog_, 0, 1, 0.3)

				var_110_29:setOnUpdate(LuaHelper.FloatAction(function(arg_111_0)
					arg_107_1.dialogCg_.alpha = arg_111_0
				end))
				var_110_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_107_1.dialog_)
					var_110_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_107_1.duration_ = arg_107_1.duration_ + 0.3

				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_30 = arg_107_1:GetWordFromCfg(221061027)
				local var_110_31 = arg_107_1:FormatText(var_110_30.content)

				arg_107_1.text_.text = var_110_31

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_32 = 45
				local var_110_33 = utf8.len(var_110_31)
				local var_110_34 = var_110_32 <= 0 and var_110_28 or var_110_28 * (var_110_33 / var_110_32)

				if var_110_34 > 0 and var_110_28 < var_110_34 then
					arg_107_1.talkMaxDuration = var_110_34
					var_110_27 = var_110_27 + 0.3

					if var_110_34 + var_110_27 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_34 + var_110_27
					end
				end

				arg_107_1.text_.text = var_110_31
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_35 = var_110_27 + 0.3
			local var_110_36 = math.max(var_110_28, arg_107_1.talkMaxDuration)

			if var_110_35 <= arg_107_1.time_ and arg_107_1.time_ < var_110_35 + var_110_36 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_35) / var_110_36

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_35 + var_110_36 and arg_107_1.time_ < var_110_35 + var_110_36 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play221061028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 221061028
		arg_113_1.duration_ = 8.3

		local var_113_0 = {
			ja = 8.3,
			ko = 6.066,
			zh = 6.066
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
				arg_113_0:Play221061029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.6

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[422].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, true)
				arg_113_1.iconController_:SetSelectedState("hero")

				arg_113_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(221061028)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061028", "story_v_out_221061.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061028", "story_v_out_221061.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_221061", "221061028", "story_v_out_221061.awb")

						arg_113_1:RecordAudio("221061028", var_116_9)
						arg_113_1:RecordAudio("221061028", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_221061", "221061028", "story_v_out_221061.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_221061", "221061028", "story_v_out_221061.awb")
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
	Play221061029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 221061029
		arg_117_1.duration_ = 4.366

		local var_117_0 = {
			ja = 3.633,
			ko = 4.366,
			zh = 4.366
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
				arg_117_0:Play221061030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 0.35

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[422].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, true)
				arg_117_1.iconController_:SetSelectedState("hero")

				arg_117_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(221061029)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061029", "story_v_out_221061.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061029", "story_v_out_221061.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_out_221061", "221061029", "story_v_out_221061.awb")

						arg_117_1:RecordAudio("221061029", var_120_9)
						arg_117_1:RecordAudio("221061029", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_221061", "221061029", "story_v_out_221061.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_221061", "221061029", "story_v_out_221061.awb")
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
	Play221061030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 221061030
		arg_121_1.duration_ = 7.166

		local var_121_0 = {
			ja = 7.166,
			ko = 6.133,
			zh = 6.133
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
				arg_121_0:Play221061031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1072ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1072ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0, -0.71, -6)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1072ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["1072ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect1072ui_story == nil then
				arg_121_1.var_.characterEffect1072ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect1072ui_story then
					arg_121_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect1072ui_story then
				arg_121_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_124_13 = 0

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_15 = 0
			local var_124_16 = 0.7

			if var_124_15 < arg_121_1.time_ and arg_121_1.time_ <= var_124_15 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_17 = arg_121_1:FormatText(StoryNameCfg[379].name)

				arg_121_1.leftNameTxt_.text = var_124_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_18 = arg_121_1:GetWordFromCfg(221061030)
				local var_124_19 = arg_121_1:FormatText(var_124_18.content)

				arg_121_1.text_.text = var_124_19

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_20 = 28
				local var_124_21 = utf8.len(var_124_19)
				local var_124_22 = var_124_20 <= 0 and var_124_16 or var_124_16 * (var_124_21 / var_124_20)

				if var_124_22 > 0 and var_124_16 < var_124_22 then
					arg_121_1.talkMaxDuration = var_124_22

					if var_124_22 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_22 + var_124_15
					end
				end

				arg_121_1.text_.text = var_124_19
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061030", "story_v_out_221061.awb") ~= 0 then
					local var_124_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061030", "story_v_out_221061.awb") / 1000

					if var_124_23 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_23 + var_124_15
					end

					if var_124_18.prefab_name ~= "" and arg_121_1.actors_[var_124_18.prefab_name] ~= nil then
						local var_124_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_18.prefab_name].transform, "story_v_out_221061", "221061030", "story_v_out_221061.awb")

						arg_121_1:RecordAudio("221061030", var_124_24)
						arg_121_1:RecordAudio("221061030", var_124_24)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_221061", "221061030", "story_v_out_221061.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_221061", "221061030", "story_v_out_221061.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_25 = math.max(var_124_16, arg_121_1.talkMaxDuration)

			if var_124_15 <= arg_121_1.time_ and arg_121_1.time_ < var_124_15 + var_124_25 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_15) / var_124_25

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_15 + var_124_25 and arg_121_1.time_ < var_124_15 + var_124_25 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play221061031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 221061031
		arg_125_1.duration_ = 6.066

		local var_125_0 = {
			ja = 6.066,
			ko = 3.8,
			zh = 3.8
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
				arg_125_0:Play221061032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.525

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_2 = arg_125_1:FormatText(StoryNameCfg[379].name)

				arg_125_1.leftNameTxt_.text = var_128_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_3 = arg_125_1:GetWordFromCfg(221061031)
				local var_128_4 = arg_125_1:FormatText(var_128_3.content)

				arg_125_1.text_.text = var_128_4

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_5 = 21
				local var_128_6 = utf8.len(var_128_4)
				local var_128_7 = var_128_5 <= 0 and var_128_1 or var_128_1 * (var_128_6 / var_128_5)

				if var_128_7 > 0 and var_128_1 < var_128_7 then
					arg_125_1.talkMaxDuration = var_128_7

					if var_128_7 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_7 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_4
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061031", "story_v_out_221061.awb") ~= 0 then
					local var_128_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061031", "story_v_out_221061.awb") / 1000

					if var_128_8 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_8 + var_128_0
					end

					if var_128_3.prefab_name ~= "" and arg_125_1.actors_[var_128_3.prefab_name] ~= nil then
						local var_128_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_3.prefab_name].transform, "story_v_out_221061", "221061031", "story_v_out_221061.awb")

						arg_125_1:RecordAudio("221061031", var_128_9)
						arg_125_1:RecordAudio("221061031", var_128_9)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_221061", "221061031", "story_v_out_221061.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_221061", "221061031", "story_v_out_221061.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_10 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_10 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_10

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_10 and arg_125_1.time_ < var_128_0 + var_128_10 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play221061032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 221061032
		arg_129_1.duration_ = 10.133

		local var_129_0 = {
			ja = 10.133,
			ko = 7.933,
			zh = 7.933
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
				arg_129_0:Play221061033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_132_2 = 0
			local var_132_3 = 0.8

			if var_132_2 < arg_129_1.time_ and arg_129_1.time_ <= var_132_2 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_4 = arg_129_1:FormatText(StoryNameCfg[379].name)

				arg_129_1.leftNameTxt_.text = var_132_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_5 = arg_129_1:GetWordFromCfg(221061032)
				local var_132_6 = arg_129_1:FormatText(var_132_5.content)

				arg_129_1.text_.text = var_132_6

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_7 = 32
				local var_132_8 = utf8.len(var_132_6)
				local var_132_9 = var_132_7 <= 0 and var_132_3 or var_132_3 * (var_132_8 / var_132_7)

				if var_132_9 > 0 and var_132_3 < var_132_9 then
					arg_129_1.talkMaxDuration = var_132_9

					if var_132_9 + var_132_2 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_9 + var_132_2
					end
				end

				arg_129_1.text_.text = var_132_6
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061032", "story_v_out_221061.awb") ~= 0 then
					local var_132_10 = manager.audio:GetVoiceLength("story_v_out_221061", "221061032", "story_v_out_221061.awb") / 1000

					if var_132_10 + var_132_2 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_10 + var_132_2
					end

					if var_132_5.prefab_name ~= "" and arg_129_1.actors_[var_132_5.prefab_name] ~= nil then
						local var_132_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_5.prefab_name].transform, "story_v_out_221061", "221061032", "story_v_out_221061.awb")

						arg_129_1:RecordAudio("221061032", var_132_11)
						arg_129_1:RecordAudio("221061032", var_132_11)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_221061", "221061032", "story_v_out_221061.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_221061", "221061032", "story_v_out_221061.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_12 = math.max(var_132_3, arg_129_1.talkMaxDuration)

			if var_132_2 <= arg_129_1.time_ and arg_129_1.time_ < var_132_2 + var_132_12 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_2) / var_132_12

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_2 + var_132_12 and arg_129_1.time_ < var_132_2 + var_132_12 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play221061033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 221061033
		arg_133_1.duration_ = 4.733

		local var_133_0 = {
			ja = 4.733,
			ko = 4.466,
			zh = 4.466
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
				arg_133_0:Play221061034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072actionlink/1072action462")
			end

			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_136_2 = 0
			local var_136_3 = 0.45

			if var_136_2 < arg_133_1.time_ and arg_133_1.time_ <= var_136_2 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_4 = arg_133_1:FormatText(StoryNameCfg[379].name)

				arg_133_1.leftNameTxt_.text = var_136_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_5 = arg_133_1:GetWordFromCfg(221061033)
				local var_136_6 = arg_133_1:FormatText(var_136_5.content)

				arg_133_1.text_.text = var_136_6

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_7 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061033", "story_v_out_221061.awb") ~= 0 then
					local var_136_10 = manager.audio:GetVoiceLength("story_v_out_221061", "221061033", "story_v_out_221061.awb") / 1000

					if var_136_10 + var_136_2 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_10 + var_136_2
					end

					if var_136_5.prefab_name ~= "" and arg_133_1.actors_[var_136_5.prefab_name] ~= nil then
						local var_136_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_5.prefab_name].transform, "story_v_out_221061", "221061033", "story_v_out_221061.awb")

						arg_133_1:RecordAudio("221061033", var_136_11)
						arg_133_1:RecordAudio("221061033", var_136_11)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_221061", "221061033", "story_v_out_221061.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_221061", "221061033", "story_v_out_221061.awb")
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
	Play221061034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 221061034
		arg_137_1.duration_ = 3.7

		local var_137_0 = {
			ja = 3.7,
			ko = 3.5,
			zh = 3.5
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
				arg_137_0:Play221061035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.3

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[379].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(221061034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061034", "story_v_out_221061.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061034", "story_v_out_221061.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_221061", "221061034", "story_v_out_221061.awb")

						arg_137_1:RecordAudio("221061034", var_140_9)
						arg_137_1:RecordAudio("221061034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_221061", "221061034", "story_v_out_221061.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_221061", "221061034", "story_v_out_221061.awb")
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
	Play221061035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 221061035
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play221061036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1072ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1072ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0, 100, 0)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1072ui_story, var_144_4, var_144_3)

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

			local var_144_9 = arg_141_1.actors_["1072ui_story"]
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 and arg_141_1.var_.characterEffect1072ui_story == nil then
				arg_141_1.var_.characterEffect1072ui_story = var_144_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_11 = 0.200000002980232

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11

				if arg_141_1.var_.characterEffect1072ui_story then
					local var_144_13 = Mathf.Lerp(0, 0.5, var_144_12)

					arg_141_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1072ui_story.fillRatio = var_144_13
				end
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 and arg_141_1.var_.characterEffect1072ui_story then
				local var_144_14 = 0.5

				arg_141_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1072ui_story.fillRatio = var_144_14
			end

			local var_144_15 = 0
			local var_144_16 = 1.175

			if var_144_15 < arg_141_1.time_ and arg_141_1.time_ <= var_144_15 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_17 = arg_141_1:GetWordFromCfg(221061035)
				local var_144_18 = arg_141_1:FormatText(var_144_17.content)

				arg_141_1.text_.text = var_144_18

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_19 = 47
				local var_144_20 = utf8.len(var_144_18)
				local var_144_21 = var_144_19 <= 0 and var_144_16 or var_144_16 * (var_144_20 / var_144_19)

				if var_144_21 > 0 and var_144_16 < var_144_21 then
					arg_141_1.talkMaxDuration = var_144_21

					if var_144_21 + var_144_15 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_21 + var_144_15
					end
				end

				arg_141_1.text_.text = var_144_18
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_22 = math.max(var_144_16, arg_141_1.talkMaxDuration)

			if var_144_15 <= arg_141_1.time_ and arg_141_1.time_ < var_144_15 + var_144_22 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_15) / var_144_22

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_15 + var_144_22 and arg_141_1.time_ < var_144_15 + var_144_22 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play221061036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 221061036
		arg_145_1.duration_ = 7.566

		local var_145_0 = {
			ja = 4.633,
			ko = 7.566,
			zh = 7.566
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
				arg_145_0:Play221061037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.75

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[422].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, true)
				arg_145_1.iconController_:SetSelectedState("hero")

				arg_145_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(221061036)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061036", "story_v_out_221061.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061036", "story_v_out_221061.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_221061", "221061036", "story_v_out_221061.awb")

						arg_145_1:RecordAudio("221061036", var_148_9)
						arg_145_1:RecordAudio("221061036", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_221061", "221061036", "story_v_out_221061.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_221061", "221061036", "story_v_out_221061.awb")
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
	Play221061037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 221061037
		arg_149_1.duration_ = 9.9

		local var_149_0 = {
			ja = 9.9,
			ko = 6.833,
			zh = 6.833
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
				arg_149_0:Play221061038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.725

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[422].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(221061037)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061037", "story_v_out_221061.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061037", "story_v_out_221061.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_221061", "221061037", "story_v_out_221061.awb")

						arg_149_1:RecordAudio("221061037", var_152_9)
						arg_149_1:RecordAudio("221061037", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_221061", "221061037", "story_v_out_221061.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_221061", "221061037", "story_v_out_221061.awb")
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
	Play221061038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 221061038
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play221061039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.6

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_2 = arg_153_1:GetWordFromCfg(221061038)
				local var_156_3 = arg_153_1:FormatText(var_156_2.content)

				arg_153_1.text_.text = var_156_3

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_4 = 24
				local var_156_5 = utf8.len(var_156_3)
				local var_156_6 = var_156_4 <= 0 and var_156_1 or var_156_1 * (var_156_5 / var_156_4)

				if var_156_6 > 0 and var_156_1 < var_156_6 then
					arg_153_1.talkMaxDuration = var_156_6

					if var_156_6 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_6 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_3
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_7 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_7 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_7

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_7 and arg_153_1.time_ < var_156_0 + var_156_7 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play221061039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 221061039
		arg_157_1.duration_ = 6.233

		local var_157_0 = {
			ja = 6.233,
			ko = 5.2,
			zh = 5.2
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
				arg_157_0:Play221061040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1072ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1072ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0, -0.71, -6)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1072ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["1072ui_story"]
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 and arg_157_1.var_.characterEffect1072ui_story == nil then
				arg_157_1.var_.characterEffect1072ui_story = var_160_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_11 = 0.200000002980232

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11

				if arg_157_1.var_.characterEffect1072ui_story then
					arg_157_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 and arg_157_1.var_.characterEffect1072ui_story then
				arg_157_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_160_13 = 0

			if var_160_13 < arg_157_1.time_ and arg_157_1.time_ <= var_160_13 + arg_160_0 then
				arg_157_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action8_1")
			end

			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_160_15 = 0
			local var_160_16 = 0.425

			if var_160_15 < arg_157_1.time_ and arg_157_1.time_ <= var_160_15 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_17 = arg_157_1:FormatText(StoryNameCfg[379].name)

				arg_157_1.leftNameTxt_.text = var_160_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_18 = arg_157_1:GetWordFromCfg(221061039)
				local var_160_19 = arg_157_1:FormatText(var_160_18.content)

				arg_157_1.text_.text = var_160_19

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_20 = 17
				local var_160_21 = utf8.len(var_160_19)
				local var_160_22 = var_160_20 <= 0 and var_160_16 or var_160_16 * (var_160_21 / var_160_20)

				if var_160_22 > 0 and var_160_16 < var_160_22 then
					arg_157_1.talkMaxDuration = var_160_22

					if var_160_22 + var_160_15 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_22 + var_160_15
					end
				end

				arg_157_1.text_.text = var_160_19
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061039", "story_v_out_221061.awb") ~= 0 then
					local var_160_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061039", "story_v_out_221061.awb") / 1000

					if var_160_23 + var_160_15 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_23 + var_160_15
					end

					if var_160_18.prefab_name ~= "" and arg_157_1.actors_[var_160_18.prefab_name] ~= nil then
						local var_160_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_18.prefab_name].transform, "story_v_out_221061", "221061039", "story_v_out_221061.awb")

						arg_157_1:RecordAudio("221061039", var_160_24)
						arg_157_1:RecordAudio("221061039", var_160_24)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_221061", "221061039", "story_v_out_221061.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_221061", "221061039", "story_v_out_221061.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_25 = math.max(var_160_16, arg_157_1.talkMaxDuration)

			if var_160_15 <= arg_157_1.time_ and arg_157_1.time_ < var_160_15 + var_160_25 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_15) / var_160_25

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_15 + var_160_25 and arg_157_1.time_ < var_160_15 + var_160_25 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play221061040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 221061040
		arg_161_1.duration_ = 8.7

		local var_161_0 = {
			ja = 8.7,
			ko = 6.533,
			zh = 6.533
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
				arg_161_0:Play221061041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1072ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1072ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(0, -0.71, -6)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1072ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["1072ui_story"]
			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 and arg_161_1.var_.characterEffect1072ui_story == nil then
				arg_161_1.var_.characterEffect1072ui_story = var_164_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_11 = 0.200000002980232

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11

				if arg_161_1.var_.characterEffect1072ui_story then
					arg_161_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 and arg_161_1.var_.characterEffect1072ui_story then
				arg_161_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_164_13 = 0

			if var_164_13 < arg_161_1.time_ and arg_161_1.time_ <= var_164_13 + arg_164_0 then
				arg_161_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072actionlink/1072action485")
			end

			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				arg_161_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_164_15 = 0
			local var_164_16 = 0.725

			if var_164_15 < arg_161_1.time_ and arg_161_1.time_ <= var_164_15 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_17 = arg_161_1:FormatText(StoryNameCfg[379].name)

				arg_161_1.leftNameTxt_.text = var_164_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_18 = arg_161_1:GetWordFromCfg(221061040)
				local var_164_19 = arg_161_1:FormatText(var_164_18.content)

				arg_161_1.text_.text = var_164_19

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_20 = 29
				local var_164_21 = utf8.len(var_164_19)
				local var_164_22 = var_164_20 <= 0 and var_164_16 or var_164_16 * (var_164_21 / var_164_20)

				if var_164_22 > 0 and var_164_16 < var_164_22 then
					arg_161_1.talkMaxDuration = var_164_22

					if var_164_22 + var_164_15 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_22 + var_164_15
					end
				end

				arg_161_1.text_.text = var_164_19
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061040", "story_v_out_221061.awb") ~= 0 then
					local var_164_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061040", "story_v_out_221061.awb") / 1000

					if var_164_23 + var_164_15 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_23 + var_164_15
					end

					if var_164_18.prefab_name ~= "" and arg_161_1.actors_[var_164_18.prefab_name] ~= nil then
						local var_164_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_18.prefab_name].transform, "story_v_out_221061", "221061040", "story_v_out_221061.awb")

						arg_161_1:RecordAudio("221061040", var_164_24)
						arg_161_1:RecordAudio("221061040", var_164_24)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_221061", "221061040", "story_v_out_221061.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_221061", "221061040", "story_v_out_221061.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_25 = math.max(var_164_16, arg_161_1.talkMaxDuration)

			if var_164_15 <= arg_161_1.time_ and arg_161_1.time_ < var_164_15 + var_164_25 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_15) / var_164_25

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_15 + var_164_25 and arg_161_1.time_ < var_164_15 + var_164_25 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play221061041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 221061041
		arg_165_1.duration_ = 5.2

		local var_165_0 = {
			ja = 2.966,
			ko = 5.2,
			zh = 5.2
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
				arg_165_0:Play221061042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1072ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect1072ui_story == nil then
				arg_165_1.var_.characterEffect1072ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.200000002980232

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect1072ui_story then
					local var_168_4 = Mathf.Lerp(0, 0.5, var_168_3)

					arg_165_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1072ui_story.fillRatio = var_168_4
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect1072ui_story then
				local var_168_5 = 0.5

				arg_165_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1072ui_story.fillRatio = var_168_5
			end

			local var_168_6 = 0
			local var_168_7 = 0.55

			if var_168_6 < arg_165_1.time_ and arg_165_1.time_ <= var_168_6 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_8 = arg_165_1:FormatText(StoryNameCfg[422].name)

				arg_165_1.leftNameTxt_.text = var_168_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, true)
				arg_165_1.iconController_:SetSelectedState("hero")

				arg_165_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_9 = arg_165_1:GetWordFromCfg(221061041)
				local var_168_10 = arg_165_1:FormatText(var_168_9.content)

				arg_165_1.text_.text = var_168_10

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_11 = 22
				local var_168_12 = utf8.len(var_168_10)
				local var_168_13 = var_168_11 <= 0 and var_168_7 or var_168_7 * (var_168_12 / var_168_11)

				if var_168_13 > 0 and var_168_7 < var_168_13 then
					arg_165_1.talkMaxDuration = var_168_13

					if var_168_13 + var_168_6 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_13 + var_168_6
					end
				end

				arg_165_1.text_.text = var_168_10
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061041", "story_v_out_221061.awb") ~= 0 then
					local var_168_14 = manager.audio:GetVoiceLength("story_v_out_221061", "221061041", "story_v_out_221061.awb") / 1000

					if var_168_14 + var_168_6 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_14 + var_168_6
					end

					if var_168_9.prefab_name ~= "" and arg_165_1.actors_[var_168_9.prefab_name] ~= nil then
						local var_168_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_9.prefab_name].transform, "story_v_out_221061", "221061041", "story_v_out_221061.awb")

						arg_165_1:RecordAudio("221061041", var_168_15)
						arg_165_1:RecordAudio("221061041", var_168_15)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_221061", "221061041", "story_v_out_221061.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_221061", "221061041", "story_v_out_221061.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_16 = math.max(var_168_7, arg_165_1.talkMaxDuration)

			if var_168_6 <= arg_165_1.time_ and arg_165_1.time_ < var_168_6 + var_168_16 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_6) / var_168_16

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_6 + var_168_16 and arg_165_1.time_ < var_168_6 + var_168_16 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play221061042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 221061042
		arg_169_1.duration_ = 3.166

		local var_169_0 = {
			ja = 3.033,
			ko = 3.166,
			zh = 3.166
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
				arg_169_0:Play221061043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1072ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1072ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, -0.71, -6)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1072ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["1072ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and arg_169_1.var_.characterEffect1072ui_story == nil then
				arg_169_1.var_.characterEffect1072ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect1072ui_story then
					arg_169_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect1072ui_story then
				arg_169_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_172_13 = 0

			if var_172_13 < arg_169_1.time_ and arg_169_1.time_ <= var_172_13 + arg_172_0 then
				arg_169_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_2")
			end

			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_172_15 = 0
			local var_172_16 = 0.275

			if var_172_15 < arg_169_1.time_ and arg_169_1.time_ <= var_172_15 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_17 = arg_169_1:FormatText(StoryNameCfg[379].name)

				arg_169_1.leftNameTxt_.text = var_172_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_18 = arg_169_1:GetWordFromCfg(221061042)
				local var_172_19 = arg_169_1:FormatText(var_172_18.content)

				arg_169_1.text_.text = var_172_19

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_20 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061042", "story_v_out_221061.awb") ~= 0 then
					local var_172_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061042", "story_v_out_221061.awb") / 1000

					if var_172_23 + var_172_15 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_23 + var_172_15
					end

					if var_172_18.prefab_name ~= "" and arg_169_1.actors_[var_172_18.prefab_name] ~= nil then
						local var_172_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_18.prefab_name].transform, "story_v_out_221061", "221061042", "story_v_out_221061.awb")

						arg_169_1:RecordAudio("221061042", var_172_24)
						arg_169_1:RecordAudio("221061042", var_172_24)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_221061", "221061042", "story_v_out_221061.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_221061", "221061042", "story_v_out_221061.awb")
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
	Play221061043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 221061043
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play221061044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1072ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1072ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(0, 100, 0)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1072ui_story, var_176_4, var_176_3)

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

			local var_176_9 = arg_173_1.actors_["1072ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1072ui_story == nil then
				arg_173_1.var_.characterEffect1072ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.200000002980232

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1072ui_story then
					local var_176_13 = Mathf.Lerp(0, 0.5, var_176_12)

					arg_173_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1072ui_story.fillRatio = var_176_13
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1072ui_story then
				local var_176_14 = 0.5

				arg_173_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1072ui_story.fillRatio = var_176_14
			end

			local var_176_15 = 0
			local var_176_16 = 0.85

			if var_176_15 < arg_173_1.time_ and arg_173_1.time_ <= var_176_15 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_17 = arg_173_1:GetWordFromCfg(221061043)
				local var_176_18 = arg_173_1:FormatText(var_176_17.content)

				arg_173_1.text_.text = var_176_18

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_19 = 34
				local var_176_20 = utf8.len(var_176_18)
				local var_176_21 = var_176_19 <= 0 and var_176_16 or var_176_16 * (var_176_20 / var_176_19)

				if var_176_21 > 0 and var_176_16 < var_176_21 then
					arg_173_1.talkMaxDuration = var_176_21

					if var_176_21 + var_176_15 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_21 + var_176_15
					end
				end

				arg_173_1.text_.text = var_176_18
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_22 = math.max(var_176_16, arg_173_1.talkMaxDuration)

			if var_176_15 <= arg_173_1.time_ and arg_173_1.time_ < var_176_15 + var_176_22 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_15) / var_176_22

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_15 + var_176_22 and arg_173_1.time_ < var_176_15 + var_176_22 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play221061044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 221061044
		arg_177_1.duration_ = 10.7

		local var_177_0 = {
			ja = 10.7,
			ko = 7.4,
			zh = 7.4
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
				arg_177_0:Play221061045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1076ui_story"].transform
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.var_.moveOldPos1076ui_story = var_180_0.localPosition
			end

			local var_180_2 = 0.001

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2
				local var_180_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_180_0.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1076ui_story, var_180_4, var_180_3)

				local var_180_5 = manager.ui.mainCamera.transform.position - var_180_0.position

				var_180_0.forward = Vector3.New(var_180_5.x, var_180_5.y, var_180_5.z)

				local var_180_6 = var_180_0.localEulerAngles

				var_180_6.z = 0
				var_180_6.x = 0
				var_180_0.localEulerAngles = var_180_6
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 then
				var_180_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_180_7 = manager.ui.mainCamera.transform.position - var_180_0.position

				var_180_0.forward = Vector3.New(var_180_7.x, var_180_7.y, var_180_7.z)

				local var_180_8 = var_180_0.localEulerAngles

				var_180_8.z = 0
				var_180_8.x = 0
				var_180_0.localEulerAngles = var_180_8
			end

			local var_180_9 = arg_177_1.actors_["1076ui_story"]
			local var_180_10 = 0

			if var_180_10 < arg_177_1.time_ and arg_177_1.time_ <= var_180_10 + arg_180_0 and arg_177_1.var_.characterEffect1076ui_story == nil then
				arg_177_1.var_.characterEffect1076ui_story = var_180_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_11 = 0.200000002980232

			if var_180_10 <= arg_177_1.time_ and arg_177_1.time_ < var_180_10 + var_180_11 then
				local var_180_12 = (arg_177_1.time_ - var_180_10) / var_180_11

				if arg_177_1.var_.characterEffect1076ui_story then
					arg_177_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_10 + var_180_11 and arg_177_1.time_ < var_180_10 + var_180_11 + arg_180_0 and arg_177_1.var_.characterEffect1076ui_story then
				arg_177_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_180_13 = 0

			if var_180_13 < arg_177_1.time_ and arg_177_1.time_ <= var_180_13 + arg_180_0 then
				arg_177_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_180_14 = 0

			if var_180_14 < arg_177_1.time_ and arg_177_1.time_ <= var_180_14 + arg_180_0 then
				arg_177_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_180_15 = arg_177_1.actors_["1072ui_story"].transform
			local var_180_16 = 0

			if var_180_16 < arg_177_1.time_ and arg_177_1.time_ <= var_180_16 + arg_180_0 then
				arg_177_1.var_.moveOldPos1072ui_story = var_180_15.localPosition
			end

			local var_180_17 = 0.001

			if var_180_16 <= arg_177_1.time_ and arg_177_1.time_ < var_180_16 + var_180_17 then
				local var_180_18 = (arg_177_1.time_ - var_180_16) / var_180_17
				local var_180_19 = Vector3.New(0.7, -0.71, -6)

				var_180_15.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1072ui_story, var_180_19, var_180_18)

				local var_180_20 = manager.ui.mainCamera.transform.position - var_180_15.position

				var_180_15.forward = Vector3.New(var_180_20.x, var_180_20.y, var_180_20.z)

				local var_180_21 = var_180_15.localEulerAngles

				var_180_21.z = 0
				var_180_21.x = 0
				var_180_15.localEulerAngles = var_180_21
			end

			if arg_177_1.time_ >= var_180_16 + var_180_17 and arg_177_1.time_ < var_180_16 + var_180_17 + arg_180_0 then
				var_180_15.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_180_22 = manager.ui.mainCamera.transform.position - var_180_15.position

				var_180_15.forward = Vector3.New(var_180_22.x, var_180_22.y, var_180_22.z)

				local var_180_23 = var_180_15.localEulerAngles

				var_180_23.z = 0
				var_180_23.x = 0
				var_180_15.localEulerAngles = var_180_23
			end

			local var_180_24 = arg_177_1.actors_["1072ui_story"]
			local var_180_25 = 0

			if var_180_25 < arg_177_1.time_ and arg_177_1.time_ <= var_180_25 + arg_180_0 and arg_177_1.var_.characterEffect1072ui_story == nil then
				arg_177_1.var_.characterEffect1072ui_story = var_180_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_26 = 0.0166666666666667

			if var_180_25 <= arg_177_1.time_ and arg_177_1.time_ < var_180_25 + var_180_26 then
				local var_180_27 = (arg_177_1.time_ - var_180_25) / var_180_26

				if arg_177_1.var_.characterEffect1072ui_story then
					local var_180_28 = Mathf.Lerp(0, 0.5, var_180_27)

					arg_177_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1072ui_story.fillRatio = var_180_28
				end
			end

			if arg_177_1.time_ >= var_180_25 + var_180_26 and arg_177_1.time_ < var_180_25 + var_180_26 + arg_180_0 and arg_177_1.var_.characterEffect1072ui_story then
				local var_180_29 = 0.5

				arg_177_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1072ui_story.fillRatio = var_180_29
			end

			local var_180_30 = 0
			local var_180_31 = 0.233333333333333

			if var_180_30 < arg_177_1.time_ and arg_177_1.time_ <= var_180_30 + arg_180_0 then
				local var_180_32 = "play"
				local var_180_33 = "music"

				arg_177_1:AudioAction(var_180_32, var_180_33, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_180_34 = 0
			local var_180_35 = 0.7

			if var_180_34 < arg_177_1.time_ and arg_177_1.time_ <= var_180_34 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_36 = arg_177_1:FormatText(StoryNameCfg[389].name)

				arg_177_1.leftNameTxt_.text = var_180_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_37 = arg_177_1:GetWordFromCfg(221061044)
				local var_180_38 = arg_177_1:FormatText(var_180_37.content)

				arg_177_1.text_.text = var_180_38

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_39 = 28
				local var_180_40 = utf8.len(var_180_38)
				local var_180_41 = var_180_39 <= 0 and var_180_35 or var_180_35 * (var_180_40 / var_180_39)

				if var_180_41 > 0 and var_180_35 < var_180_41 then
					arg_177_1.talkMaxDuration = var_180_41

					if var_180_41 + var_180_34 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_41 + var_180_34
					end
				end

				arg_177_1.text_.text = var_180_38
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061044", "story_v_out_221061.awb") ~= 0 then
					local var_180_42 = manager.audio:GetVoiceLength("story_v_out_221061", "221061044", "story_v_out_221061.awb") / 1000

					if var_180_42 + var_180_34 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_42 + var_180_34
					end

					if var_180_37.prefab_name ~= "" and arg_177_1.actors_[var_180_37.prefab_name] ~= nil then
						local var_180_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_37.prefab_name].transform, "story_v_out_221061", "221061044", "story_v_out_221061.awb")

						arg_177_1:RecordAudio("221061044", var_180_43)
						arg_177_1:RecordAudio("221061044", var_180_43)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_221061", "221061044", "story_v_out_221061.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_221061", "221061044", "story_v_out_221061.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_44 = math.max(var_180_35, arg_177_1.talkMaxDuration)

			if var_180_34 <= arg_177_1.time_ and arg_177_1.time_ < var_180_34 + var_180_44 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_34) / var_180_44

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_34 + var_180_44 and arg_177_1.time_ < var_180_34 + var_180_44 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play221061045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 221061045
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play221061046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1076ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1076ui_story == nil then
				arg_181_1.var_.characterEffect1076ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1076ui_story then
					local var_184_4 = Mathf.Lerp(0, 0.5, var_184_3)

					arg_181_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1076ui_story.fillRatio = var_184_4
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1076ui_story then
				local var_184_5 = 0.5

				arg_181_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1076ui_story.fillRatio = var_184_5
			end

			local var_184_6 = 0
			local var_184_7 = 0.166666666666667

			if var_184_6 < arg_181_1.time_ and arg_181_1.time_ <= var_184_6 + arg_184_0 then
				local var_184_8 = "play"
				local var_184_9 = "music"

				arg_181_1:AudioAction(var_184_8, var_184_9, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_184_10 = 0.233333333333333
			local var_184_11 = 1

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 then
				local var_184_12 = "play"
				local var_184_13 = "music"

				arg_181_1:AudioAction(var_184_12, var_184_13, "bgm_activity_2_0_warchess", "bgm_activity_2_0_warchess", "bgm_activity_2_0_warchess.awb")
			end

			local var_184_14 = 0
			local var_184_15 = 0.725

			if var_184_14 < arg_181_1.time_ and arg_181_1.time_ <= var_184_14 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, false)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_16 = arg_181_1:GetWordFromCfg(221061045)
				local var_184_17 = arg_181_1:FormatText(var_184_16.content)

				arg_181_1.text_.text = var_184_17

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_18 = 29
				local var_184_19 = utf8.len(var_184_17)
				local var_184_20 = var_184_18 <= 0 and var_184_15 or var_184_15 * (var_184_19 / var_184_18)

				if var_184_20 > 0 and var_184_15 < var_184_20 then
					arg_181_1.talkMaxDuration = var_184_20

					if var_184_20 + var_184_14 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_20 + var_184_14
					end
				end

				arg_181_1.text_.text = var_184_17
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_21 = math.max(var_184_15, arg_181_1.talkMaxDuration)

			if var_184_14 <= arg_181_1.time_ and arg_181_1.time_ < var_184_14 + var_184_21 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_14) / var_184_21

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_14 + var_184_21 and arg_181_1.time_ < var_184_14 + var_184_21 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play221061046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 221061046
		arg_185_1.duration_ = 5

		local var_185_0 = {
			ja = 5,
			ko = 3.8,
			zh = 3.8
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
				arg_185_0:Play221061047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1072ui_story"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos1072ui_story = var_188_0.localPosition
			end

			local var_188_2 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2
				local var_188_4 = Vector3.New(0.7, -0.71, -6)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1072ui_story, var_188_4, var_188_3)

				local var_188_5 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_5.x, var_188_5.y, var_188_5.z)

				local var_188_6 = var_188_0.localEulerAngles

				var_188_6.z = 0
				var_188_6.x = 0
				var_188_0.localEulerAngles = var_188_6
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_188_7 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_7.x, var_188_7.y, var_188_7.z)

				local var_188_8 = var_188_0.localEulerAngles

				var_188_8.z = 0
				var_188_8.x = 0
				var_188_0.localEulerAngles = var_188_8
			end

			local var_188_9 = arg_185_1.actors_["1072ui_story"]
			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect1072ui_story == nil then
				arg_185_1.var_.characterEffect1072ui_story = var_188_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_11 = 0.200000002980232

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_10) / var_188_11

				if arg_185_1.var_.characterEffect1072ui_story then
					arg_185_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_10 + var_188_11 and arg_185_1.time_ < var_188_10 + var_188_11 + arg_188_0 and arg_185_1.var_.characterEffect1072ui_story then
				arg_185_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_188_13 = 0

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_188_14 = 0

			if var_188_14 < arg_185_1.time_ and arg_185_1.time_ <= var_188_14 + arg_188_0 then
				arg_185_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_188_15 = 0
			local var_188_16 = 0.325

			if var_188_15 < arg_185_1.time_ and arg_185_1.time_ <= var_188_15 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_17 = arg_185_1:FormatText(StoryNameCfg[379].name)

				arg_185_1.leftNameTxt_.text = var_188_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_18 = arg_185_1:GetWordFromCfg(221061046)
				local var_188_19 = arg_185_1:FormatText(var_188_18.content)

				arg_185_1.text_.text = var_188_19

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_20 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061046", "story_v_out_221061.awb") ~= 0 then
					local var_188_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061046", "story_v_out_221061.awb") / 1000

					if var_188_23 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_23 + var_188_15
					end

					if var_188_18.prefab_name ~= "" and arg_185_1.actors_[var_188_18.prefab_name] ~= nil then
						local var_188_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_18.prefab_name].transform, "story_v_out_221061", "221061046", "story_v_out_221061.awb")

						arg_185_1:RecordAudio("221061046", var_188_24)
						arg_185_1:RecordAudio("221061046", var_188_24)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_221061", "221061046", "story_v_out_221061.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_221061", "221061046", "story_v_out_221061.awb")
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
	Play221061047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 221061047
		arg_189_1.duration_ = 4.866

		local var_189_0 = {
			ja = 4.866,
			ko = 4.166,
			zh = 4.166
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
				arg_189_0:Play221061048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = "XH0801"

			if arg_189_1.bgs_[var_192_0] == nil then
				local var_192_1 = Object.Instantiate(arg_189_1.paintGo_)

				var_192_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_192_0)
				var_192_1.name = var_192_0
				var_192_1.transform.parent = arg_189_1.stage_.transform
				var_192_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_189_1.bgs_[var_192_0] = var_192_1
			end

			local var_192_2 = 2

			if var_192_2 < arg_189_1.time_ and arg_189_1.time_ <= var_192_2 + arg_192_0 then
				local var_192_3 = manager.ui.mainCamera.transform.localPosition
				local var_192_4 = Vector3.New(0, 0, 10) + Vector3.New(var_192_3.x, var_192_3.y, 0)
				local var_192_5 = arg_189_1.bgs_.XH0801

				var_192_5.transform.localPosition = var_192_4
				var_192_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_192_6 = var_192_5:GetComponent("SpriteRenderer")

				if var_192_6 and var_192_6.sprite then
					local var_192_7 = (var_192_5.transform.localPosition - var_192_3).z
					local var_192_8 = manager.ui.mainCameraCom_
					local var_192_9 = 2 * var_192_7 * Mathf.Tan(var_192_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_192_10 = var_192_9 * var_192_8.aspect
					local var_192_11 = var_192_6.sprite.bounds.size.x
					local var_192_12 = var_192_6.sprite.bounds.size.y
					local var_192_13 = var_192_10 / var_192_11
					local var_192_14 = var_192_9 / var_192_12
					local var_192_15 = var_192_14 < var_192_13 and var_192_13 or var_192_14

					var_192_5.transform.localScale = Vector3.New(var_192_15, var_192_15, 0)
				end

				for iter_192_0, iter_192_1 in pairs(arg_189_1.bgs_) do
					if iter_192_0 ~= "XH0801" then
						iter_192_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_192_16 = 0

			if var_192_16 < arg_189_1.time_ and arg_189_1.time_ <= var_192_16 + arg_192_0 then
				arg_189_1.mask_.enabled = true
				arg_189_1.mask_.raycastTarget = true

				arg_189_1:SetGaussion(false)
			end

			local var_192_17 = 2

			if var_192_16 <= arg_189_1.time_ and arg_189_1.time_ < var_192_16 + var_192_17 then
				local var_192_18 = (arg_189_1.time_ - var_192_16) / var_192_17
				local var_192_19 = Color.New(0, 0, 0)

				var_192_19.a = Mathf.Lerp(0, 1, var_192_18)
				arg_189_1.mask_.color = var_192_19
			end

			if arg_189_1.time_ >= var_192_16 + var_192_17 and arg_189_1.time_ < var_192_16 + var_192_17 + arg_192_0 then
				local var_192_20 = Color.New(0, 0, 0)

				var_192_20.a = 1
				arg_189_1.mask_.color = var_192_20
			end

			local var_192_21 = 2

			if var_192_21 < arg_189_1.time_ and arg_189_1.time_ <= var_192_21 + arg_192_0 then
				arg_189_1.mask_.enabled = true
				arg_189_1.mask_.raycastTarget = true

				arg_189_1:SetGaussion(false)
			end

			local var_192_22 = 2

			if var_192_21 <= arg_189_1.time_ and arg_189_1.time_ < var_192_21 + var_192_22 then
				local var_192_23 = (arg_189_1.time_ - var_192_21) / var_192_22
				local var_192_24 = Color.New(0, 0, 0)

				var_192_24.a = Mathf.Lerp(1, 0, var_192_23)
				arg_189_1.mask_.color = var_192_24
			end

			if arg_189_1.time_ >= var_192_21 + var_192_22 and arg_189_1.time_ < var_192_21 + var_192_22 + arg_192_0 then
				local var_192_25 = Color.New(0, 0, 0)
				local var_192_26 = 0

				arg_189_1.mask_.enabled = false
				var_192_25.a = var_192_26
				arg_189_1.mask_.color = var_192_25
			end

			local var_192_27 = arg_189_1.actors_["1076ui_story"].transform
			local var_192_28 = 0

			if var_192_28 < arg_189_1.time_ and arg_189_1.time_ <= var_192_28 + arg_192_0 then
				arg_189_1.var_.moveOldPos1076ui_story = var_192_27.localPosition
			end

			local var_192_29 = 0.001

			if var_192_28 <= arg_189_1.time_ and arg_189_1.time_ < var_192_28 + var_192_29 then
				local var_192_30 = (arg_189_1.time_ - var_192_28) / var_192_29
				local var_192_31 = Vector3.New(0, 100, 0)

				var_192_27.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1076ui_story, var_192_31, var_192_30)

				local var_192_32 = manager.ui.mainCamera.transform.position - var_192_27.position

				var_192_27.forward = Vector3.New(var_192_32.x, var_192_32.y, var_192_32.z)

				local var_192_33 = var_192_27.localEulerAngles

				var_192_33.z = 0
				var_192_33.x = 0
				var_192_27.localEulerAngles = var_192_33
			end

			if arg_189_1.time_ >= var_192_28 + var_192_29 and arg_189_1.time_ < var_192_28 + var_192_29 + arg_192_0 then
				var_192_27.localPosition = Vector3.New(0, 100, 0)

				local var_192_34 = manager.ui.mainCamera.transform.position - var_192_27.position

				var_192_27.forward = Vector3.New(var_192_34.x, var_192_34.y, var_192_34.z)

				local var_192_35 = var_192_27.localEulerAngles

				var_192_35.z = 0
				var_192_35.x = 0
				var_192_27.localEulerAngles = var_192_35
			end

			local var_192_36 = arg_189_1.actors_["1072ui_story"].transform
			local var_192_37 = 0

			if var_192_37 < arg_189_1.time_ and arg_189_1.time_ <= var_192_37 + arg_192_0 then
				arg_189_1.var_.moveOldPos1072ui_story = var_192_36.localPosition
			end

			local var_192_38 = 0.001

			if var_192_37 <= arg_189_1.time_ and arg_189_1.time_ < var_192_37 + var_192_38 then
				local var_192_39 = (arg_189_1.time_ - var_192_37) / var_192_38
				local var_192_40 = Vector3.New(0, 100, 0)

				var_192_36.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1072ui_story, var_192_40, var_192_39)

				local var_192_41 = manager.ui.mainCamera.transform.position - var_192_36.position

				var_192_36.forward = Vector3.New(var_192_41.x, var_192_41.y, var_192_41.z)

				local var_192_42 = var_192_36.localEulerAngles

				var_192_42.z = 0
				var_192_42.x = 0
				var_192_36.localEulerAngles = var_192_42
			end

			if arg_189_1.time_ >= var_192_37 + var_192_38 and arg_189_1.time_ < var_192_37 + var_192_38 + arg_192_0 then
				var_192_36.localPosition = Vector3.New(0, 100, 0)

				local var_192_43 = manager.ui.mainCamera.transform.position - var_192_36.position

				var_192_36.forward = Vector3.New(var_192_43.x, var_192_43.y, var_192_43.z)

				local var_192_44 = var_192_36.localEulerAngles

				var_192_44.z = 0
				var_192_44.x = 0
				var_192_36.localEulerAngles = var_192_44
			end

			if arg_189_1.frameCnt_ <= 1 then
				arg_189_1.dialog_:SetActive(false)
			end

			local var_192_45 = 4
			local var_192_46 = 0.05

			if var_192_45 < arg_189_1.time_ and arg_189_1.time_ <= var_192_45 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0

				arg_189_1.dialog_:SetActive(true)

				local var_192_47 = LeanTween.value(arg_189_1.dialog_, 0, 1, 0.3)

				var_192_47:setOnUpdate(LuaHelper.FloatAction(function(arg_193_0)
					arg_189_1.dialogCg_.alpha = arg_193_0
				end))
				var_192_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_189_1.dialog_)
					var_192_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_189_1.duration_ = arg_189_1.duration_ + 0.3

				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_48 = arg_189_1:FormatText(StoryNameCfg[389].name)

				arg_189_1.leftNameTxt_.text = var_192_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, true)
				arg_189_1.iconController_:SetSelectedState("hero")

				arg_189_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1076")

				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_49 = arg_189_1:GetWordFromCfg(221061047)
				local var_192_50 = arg_189_1:FormatText(var_192_49.content)

				arg_189_1.text_.text = var_192_50

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_51 = 2
				local var_192_52 = utf8.len(var_192_50)
				local var_192_53 = var_192_51 <= 0 and var_192_46 or var_192_46 * (var_192_52 / var_192_51)

				if var_192_53 > 0 and var_192_46 < var_192_53 then
					arg_189_1.talkMaxDuration = var_192_53
					var_192_45 = var_192_45 + 0.3

					if var_192_53 + var_192_45 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_53 + var_192_45
					end
				end

				arg_189_1.text_.text = var_192_50
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061047", "story_v_out_221061.awb") ~= 0 then
					local var_192_54 = manager.audio:GetVoiceLength("story_v_out_221061", "221061047", "story_v_out_221061.awb") / 1000

					if var_192_54 + var_192_45 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_54 + var_192_45
					end

					if var_192_49.prefab_name ~= "" and arg_189_1.actors_[var_192_49.prefab_name] ~= nil then
						local var_192_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_49.prefab_name].transform, "story_v_out_221061", "221061047", "story_v_out_221061.awb")

						arg_189_1:RecordAudio("221061047", var_192_55)
						arg_189_1:RecordAudio("221061047", var_192_55)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_221061", "221061047", "story_v_out_221061.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_221061", "221061047", "story_v_out_221061.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_56 = var_192_45 + 0.3
			local var_192_57 = math.max(var_192_46, arg_189_1.talkMaxDuration)

			if var_192_56 <= arg_189_1.time_ and arg_189_1.time_ < var_192_56 + var_192_57 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_56) / var_192_57

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_56 + var_192_57 and arg_189_1.time_ < var_192_56 + var_192_57 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play221061048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 221061048
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play221061049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.7

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_2 = arg_195_1:GetWordFromCfg(221061048)
				local var_198_3 = arg_195_1:FormatText(var_198_2.content)

				arg_195_1.text_.text = var_198_3

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_4 = 28
				local var_198_5 = utf8.len(var_198_3)
				local var_198_6 = var_198_4 <= 0 and var_198_1 or var_198_1 * (var_198_5 / var_198_4)

				if var_198_6 > 0 and var_198_1 < var_198_6 then
					arg_195_1.talkMaxDuration = var_198_6

					if var_198_6 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_6 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_3
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_7 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_7 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_7

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_7 and arg_195_1.time_ < var_198_0 + var_198_7 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play221061049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 221061049
		arg_199_1.duration_ = 18.1

		local var_199_0 = {
			ja = 18.1,
			ko = 16.1,
			zh = 16.1
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
				arg_199_0:Play221061050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = "XH0802"

			if arg_199_1.bgs_[var_202_0] == nil then
				local var_202_1 = Object.Instantiate(arg_199_1.paintGo_)

				var_202_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_202_0)
				var_202_1.name = var_202_0
				var_202_1.transform.parent = arg_199_1.stage_.transform
				var_202_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_199_1.bgs_[var_202_0] = var_202_1
			end

			local var_202_2 = 2

			if var_202_2 < arg_199_1.time_ and arg_199_1.time_ <= var_202_2 + arg_202_0 then
				local var_202_3 = manager.ui.mainCamera.transform.localPosition
				local var_202_4 = Vector3.New(0, 0, 10) + Vector3.New(var_202_3.x, var_202_3.y, 0)
				local var_202_5 = arg_199_1.bgs_.XH0802

				var_202_5.transform.localPosition = var_202_4
				var_202_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_202_6 = var_202_5:GetComponent("SpriteRenderer")

				if var_202_6 and var_202_6.sprite then
					local var_202_7 = (var_202_5.transform.localPosition - var_202_3).z
					local var_202_8 = manager.ui.mainCameraCom_
					local var_202_9 = 2 * var_202_7 * Mathf.Tan(var_202_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_202_10 = var_202_9 * var_202_8.aspect
					local var_202_11 = var_202_6.sprite.bounds.size.x
					local var_202_12 = var_202_6.sprite.bounds.size.y
					local var_202_13 = var_202_10 / var_202_11
					local var_202_14 = var_202_9 / var_202_12
					local var_202_15 = var_202_14 < var_202_13 and var_202_13 or var_202_14

					var_202_5.transform.localScale = Vector3.New(var_202_15, var_202_15, 0)
				end

				for iter_202_0, iter_202_1 in pairs(arg_199_1.bgs_) do
					if iter_202_0 ~= "XH0802" then
						iter_202_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_202_16 = 0

			if var_202_16 < arg_199_1.time_ and arg_199_1.time_ <= var_202_16 + arg_202_0 then
				arg_199_1.mask_.enabled = true
				arg_199_1.mask_.raycastTarget = true

				arg_199_1:SetGaussion(false)
			end

			local var_202_17 = 2

			if var_202_16 <= arg_199_1.time_ and arg_199_1.time_ < var_202_16 + var_202_17 then
				local var_202_18 = (arg_199_1.time_ - var_202_16) / var_202_17
				local var_202_19 = Color.New(0, 0, 0)

				var_202_19.a = Mathf.Lerp(0, 1, var_202_18)
				arg_199_1.mask_.color = var_202_19
			end

			if arg_199_1.time_ >= var_202_16 + var_202_17 and arg_199_1.time_ < var_202_16 + var_202_17 + arg_202_0 then
				local var_202_20 = Color.New(0, 0, 0)

				var_202_20.a = 1
				arg_199_1.mask_.color = var_202_20
			end

			local var_202_21 = 2

			if var_202_21 < arg_199_1.time_ and arg_199_1.time_ <= var_202_21 + arg_202_0 then
				arg_199_1.mask_.enabled = true
				arg_199_1.mask_.raycastTarget = true

				arg_199_1:SetGaussion(false)
			end

			local var_202_22 = 2

			if var_202_21 <= arg_199_1.time_ and arg_199_1.time_ < var_202_21 + var_202_22 then
				local var_202_23 = (arg_199_1.time_ - var_202_21) / var_202_22
				local var_202_24 = Color.New(0, 0, 0)

				var_202_24.a = Mathf.Lerp(1, 0, var_202_23)
				arg_199_1.mask_.color = var_202_24
			end

			if arg_199_1.time_ >= var_202_21 + var_202_22 and arg_199_1.time_ < var_202_21 + var_202_22 + arg_202_0 then
				local var_202_25 = Color.New(0, 0, 0)
				local var_202_26 = 0

				arg_199_1.mask_.enabled = false
				var_202_25.a = var_202_26
				arg_199_1.mask_.color = var_202_25
			end

			if arg_199_1.frameCnt_ <= 1 then
				arg_199_1.dialog_:SetActive(false)
			end

			local var_202_27 = 4
			local var_202_28 = 1.2

			if var_202_27 < arg_199_1.time_ and arg_199_1.time_ <= var_202_27 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0

				arg_199_1.dialog_:SetActive(true)

				local var_202_29 = LeanTween.value(arg_199_1.dialog_, 0, 1, 0.3)

				var_202_29:setOnUpdate(LuaHelper.FloatAction(function(arg_203_0)
					arg_199_1.dialogCg_.alpha = arg_203_0
				end))
				var_202_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_199_1.dialog_)
					var_202_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_199_1.duration_ = arg_199_1.duration_ + 0.3

				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_30 = arg_199_1:FormatText(StoryNameCfg[379].name)

				arg_199_1.leftNameTxt_.text = var_202_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, true)
				arg_199_1.iconController_:SetSelectedState("hero")

				arg_199_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_31 = arg_199_1:GetWordFromCfg(221061049)
				local var_202_32 = arg_199_1:FormatText(var_202_31.content)

				arg_199_1.text_.text = var_202_32

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_33 = 48
				local var_202_34 = utf8.len(var_202_32)
				local var_202_35 = var_202_33 <= 0 and var_202_28 or var_202_28 * (var_202_34 / var_202_33)

				if var_202_35 > 0 and var_202_28 < var_202_35 then
					arg_199_1.talkMaxDuration = var_202_35
					var_202_27 = var_202_27 + 0.3

					if var_202_35 + var_202_27 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_35 + var_202_27
					end
				end

				arg_199_1.text_.text = var_202_32
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061049", "story_v_out_221061.awb") ~= 0 then
					local var_202_36 = manager.audio:GetVoiceLength("story_v_out_221061", "221061049", "story_v_out_221061.awb") / 1000

					if var_202_36 + var_202_27 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_36 + var_202_27
					end

					if var_202_31.prefab_name ~= "" and arg_199_1.actors_[var_202_31.prefab_name] ~= nil then
						local var_202_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_31.prefab_name].transform, "story_v_out_221061", "221061049", "story_v_out_221061.awb")

						arg_199_1:RecordAudio("221061049", var_202_37)
						arg_199_1:RecordAudio("221061049", var_202_37)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_221061", "221061049", "story_v_out_221061.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_221061", "221061049", "story_v_out_221061.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_38 = var_202_27 + 0.3
			local var_202_39 = math.max(var_202_28, arg_199_1.talkMaxDuration)

			if var_202_38 <= arg_199_1.time_ and arg_199_1.time_ < var_202_38 + var_202_39 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_38) / var_202_39

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_38 + var_202_39 and arg_199_1.time_ < var_202_38 + var_202_39 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play221061050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 221061050
		arg_205_1.duration_ = 10.2

		local var_205_0 = {
			ja = 10.2,
			ko = 5.1,
			zh = 5.1
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
				arg_205_0:Play221061051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.575

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[379].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, true)
				arg_205_1.iconController_:SetSelectedState("hero")

				arg_205_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(221061050)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061050", "story_v_out_221061.awb") ~= 0 then
					local var_208_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061050", "story_v_out_221061.awb") / 1000

					if var_208_8 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_8 + var_208_0
					end

					if var_208_3.prefab_name ~= "" and arg_205_1.actors_[var_208_3.prefab_name] ~= nil then
						local var_208_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_3.prefab_name].transform, "story_v_out_221061", "221061050", "story_v_out_221061.awb")

						arg_205_1:RecordAudio("221061050", var_208_9)
						arg_205_1:RecordAudio("221061050", var_208_9)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_221061", "221061050", "story_v_out_221061.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_221061", "221061050", "story_v_out_221061.awb")
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
	Play221061051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 221061051
		arg_209_1.duration_ = 22.7

		local var_209_0 = {
			ja = 22.7,
			ko = 10.7,
			zh = 10.7
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
				arg_209_0:Play221061052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = "XH0804"

			if arg_209_1.bgs_[var_212_0] == nil then
				local var_212_1 = Object.Instantiate(arg_209_1.paintGo_)

				var_212_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_212_0)
				var_212_1.name = var_212_0
				var_212_1.transform.parent = arg_209_1.stage_.transform
				var_212_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_209_1.bgs_[var_212_0] = var_212_1
			end

			local var_212_2 = 2

			if var_212_2 < arg_209_1.time_ and arg_209_1.time_ <= var_212_2 + arg_212_0 then
				local var_212_3 = manager.ui.mainCamera.transform.localPosition
				local var_212_4 = Vector3.New(0, 0, 10) + Vector3.New(var_212_3.x, var_212_3.y, 0)
				local var_212_5 = arg_209_1.bgs_.XH0804

				var_212_5.transform.localPosition = var_212_4
				var_212_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_212_6 = var_212_5:GetComponent("SpriteRenderer")

				if var_212_6 and var_212_6.sprite then
					local var_212_7 = (var_212_5.transform.localPosition - var_212_3).z
					local var_212_8 = manager.ui.mainCameraCom_
					local var_212_9 = 2 * var_212_7 * Mathf.Tan(var_212_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_212_10 = var_212_9 * var_212_8.aspect
					local var_212_11 = var_212_6.sprite.bounds.size.x
					local var_212_12 = var_212_6.sprite.bounds.size.y
					local var_212_13 = var_212_10 / var_212_11
					local var_212_14 = var_212_9 / var_212_12
					local var_212_15 = var_212_14 < var_212_13 and var_212_13 or var_212_14

					var_212_5.transform.localScale = Vector3.New(var_212_15, var_212_15, 0)
				end

				for iter_212_0, iter_212_1 in pairs(arg_209_1.bgs_) do
					if iter_212_0 ~= "XH0804" then
						iter_212_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_212_16 = 0

			if var_212_16 < arg_209_1.time_ and arg_209_1.time_ <= var_212_16 + arg_212_0 then
				arg_209_1.mask_.enabled = true
				arg_209_1.mask_.raycastTarget = true

				arg_209_1:SetGaussion(false)
			end

			local var_212_17 = 2

			if var_212_16 <= arg_209_1.time_ and arg_209_1.time_ < var_212_16 + var_212_17 then
				local var_212_18 = (arg_209_1.time_ - var_212_16) / var_212_17
				local var_212_19 = Color.New(0, 0, 0)

				var_212_19.a = Mathf.Lerp(0, 1, var_212_18)
				arg_209_1.mask_.color = var_212_19
			end

			if arg_209_1.time_ >= var_212_16 + var_212_17 and arg_209_1.time_ < var_212_16 + var_212_17 + arg_212_0 then
				local var_212_20 = Color.New(0, 0, 0)

				var_212_20.a = 1
				arg_209_1.mask_.color = var_212_20
			end

			local var_212_21 = 2

			if var_212_21 < arg_209_1.time_ and arg_209_1.time_ <= var_212_21 + arg_212_0 then
				arg_209_1.mask_.enabled = true
				arg_209_1.mask_.raycastTarget = true

				arg_209_1:SetGaussion(false)
			end

			local var_212_22 = 2

			if var_212_21 <= arg_209_1.time_ and arg_209_1.time_ < var_212_21 + var_212_22 then
				local var_212_23 = (arg_209_1.time_ - var_212_21) / var_212_22
				local var_212_24 = Color.New(0, 0, 0)

				var_212_24.a = Mathf.Lerp(1, 0, var_212_23)
				arg_209_1.mask_.color = var_212_24
			end

			if arg_209_1.time_ >= var_212_21 + var_212_22 and arg_209_1.time_ < var_212_21 + var_212_22 + arg_212_0 then
				local var_212_25 = Color.New(0, 0, 0)
				local var_212_26 = 0

				arg_209_1.mask_.enabled = false
				var_212_25.a = var_212_26
				arg_209_1.mask_.color = var_212_25
			end

			if arg_209_1.frameCnt_ <= 1 then
				arg_209_1.dialog_:SetActive(false)
			end

			local var_212_27 = 4
			local var_212_28 = 0.8

			if var_212_27 < arg_209_1.time_ and arg_209_1.time_ <= var_212_27 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0

				arg_209_1.dialog_:SetActive(true)

				local var_212_29 = LeanTween.value(arg_209_1.dialog_, 0, 1, 0.3)

				var_212_29:setOnUpdate(LuaHelper.FloatAction(function(arg_213_0)
					arg_209_1.dialogCg_.alpha = arg_213_0
				end))
				var_212_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_209_1.dialog_)
					var_212_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_209_1.duration_ = arg_209_1.duration_ + 0.3

				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_30 = arg_209_1:FormatText(StoryNameCfg[389].name)

				arg_209_1.leftNameTxt_.text = var_212_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, true)
				arg_209_1.iconController_:SetSelectedState("hero")

				arg_209_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1076")

				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_31 = arg_209_1:GetWordFromCfg(221061051)
				local var_212_32 = arg_209_1:FormatText(var_212_31.content)

				arg_209_1.text_.text = var_212_32

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_33 = 32
				local var_212_34 = utf8.len(var_212_32)
				local var_212_35 = var_212_33 <= 0 and var_212_28 or var_212_28 * (var_212_34 / var_212_33)

				if var_212_35 > 0 and var_212_28 < var_212_35 then
					arg_209_1.talkMaxDuration = var_212_35
					var_212_27 = var_212_27 + 0.3

					if var_212_35 + var_212_27 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_35 + var_212_27
					end
				end

				arg_209_1.text_.text = var_212_32
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061051", "story_v_out_221061.awb") ~= 0 then
					local var_212_36 = manager.audio:GetVoiceLength("story_v_out_221061", "221061051", "story_v_out_221061.awb") / 1000

					if var_212_36 + var_212_27 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_36 + var_212_27
					end

					if var_212_31.prefab_name ~= "" and arg_209_1.actors_[var_212_31.prefab_name] ~= nil then
						local var_212_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_31.prefab_name].transform, "story_v_out_221061", "221061051", "story_v_out_221061.awb")

						arg_209_1:RecordAudio("221061051", var_212_37)
						arg_209_1:RecordAudio("221061051", var_212_37)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_221061", "221061051", "story_v_out_221061.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_221061", "221061051", "story_v_out_221061.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_38 = var_212_27 + 0.3
			local var_212_39 = math.max(var_212_28, arg_209_1.talkMaxDuration)

			if var_212_38 <= arg_209_1.time_ and arg_209_1.time_ < var_212_38 + var_212_39 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_38) / var_212_39

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_38 + var_212_39 and arg_209_1.time_ < var_212_38 + var_212_39 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play221061052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 221061052
		arg_215_1.duration_ = 3.166

		local var_215_0 = {
			ja = 3.166,
			ko = 3,
			zh = 3
		}
		local var_215_1 = manager.audio:GetLocalizationFlag()

		if var_215_0[var_215_1] ~= nil then
			arg_215_1.duration_ = var_215_0[var_215_1]
		end

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play221061053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.3

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[379].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, true)
				arg_215_1.iconController_:SetSelectedState("hero")

				arg_215_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(221061052)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 12
				local var_218_6 = utf8.len(var_218_4)
				local var_218_7 = var_218_5 <= 0 and var_218_1 or var_218_1 * (var_218_6 / var_218_5)

				if var_218_7 > 0 and var_218_1 < var_218_7 then
					arg_215_1.talkMaxDuration = var_218_7

					if var_218_7 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_7 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_4
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061052", "story_v_out_221061.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061052", "story_v_out_221061.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_221061", "221061052", "story_v_out_221061.awb")

						arg_215_1:RecordAudio("221061052", var_218_9)
						arg_215_1:RecordAudio("221061052", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_221061", "221061052", "story_v_out_221061.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_221061", "221061052", "story_v_out_221061.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_10 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_10 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_10

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_10 and arg_215_1.time_ < var_218_0 + var_218_10 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play221061053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 221061053
		arg_219_1.duration_ = 21.966

		local var_219_0 = {
			ja = 21.966,
			ko = 13.666,
			zh = 13.666
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
				arg_219_0:Play221061054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = "XH0805"

			if arg_219_1.bgs_[var_222_0] == nil then
				local var_222_1 = Object.Instantiate(arg_219_1.paintGo_)

				var_222_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_222_0)
				var_222_1.name = var_222_0
				var_222_1.transform.parent = arg_219_1.stage_.transform
				var_222_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_219_1.bgs_[var_222_0] = var_222_1
			end

			local var_222_2 = 2

			if var_222_2 < arg_219_1.time_ and arg_219_1.time_ <= var_222_2 + arg_222_0 then
				local var_222_3 = manager.ui.mainCamera.transform.localPosition
				local var_222_4 = Vector3.New(0, 0, 10) + Vector3.New(var_222_3.x, var_222_3.y, 0)
				local var_222_5 = arg_219_1.bgs_.XH0805

				var_222_5.transform.localPosition = var_222_4
				var_222_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_222_6 = var_222_5:GetComponent("SpriteRenderer")

				if var_222_6 and var_222_6.sprite then
					local var_222_7 = (var_222_5.transform.localPosition - var_222_3).z
					local var_222_8 = manager.ui.mainCameraCom_
					local var_222_9 = 2 * var_222_7 * Mathf.Tan(var_222_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_222_10 = var_222_9 * var_222_8.aspect
					local var_222_11 = var_222_6.sprite.bounds.size.x
					local var_222_12 = var_222_6.sprite.bounds.size.y
					local var_222_13 = var_222_10 / var_222_11
					local var_222_14 = var_222_9 / var_222_12
					local var_222_15 = var_222_14 < var_222_13 and var_222_13 or var_222_14

					var_222_5.transform.localScale = Vector3.New(var_222_15, var_222_15, 0)
				end

				for iter_222_0, iter_222_1 in pairs(arg_219_1.bgs_) do
					if iter_222_0 ~= "XH0805" then
						iter_222_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_222_16 = 0

			if var_222_16 < arg_219_1.time_ and arg_219_1.time_ <= var_222_16 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = true

				arg_219_1:SetGaussion(false)
			end

			local var_222_17 = 2

			if var_222_16 <= arg_219_1.time_ and arg_219_1.time_ < var_222_16 + var_222_17 then
				local var_222_18 = (arg_219_1.time_ - var_222_16) / var_222_17
				local var_222_19 = Color.New(0, 0, 0)

				var_222_19.a = Mathf.Lerp(0, 1, var_222_18)
				arg_219_1.mask_.color = var_222_19
			end

			if arg_219_1.time_ >= var_222_16 + var_222_17 and arg_219_1.time_ < var_222_16 + var_222_17 + arg_222_0 then
				local var_222_20 = Color.New(0, 0, 0)

				var_222_20.a = 1
				arg_219_1.mask_.color = var_222_20
			end

			local var_222_21 = 2

			if var_222_21 < arg_219_1.time_ and arg_219_1.time_ <= var_222_21 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = true

				arg_219_1:SetGaussion(false)
			end

			local var_222_22 = 2

			if var_222_21 <= arg_219_1.time_ and arg_219_1.time_ < var_222_21 + var_222_22 then
				local var_222_23 = (arg_219_1.time_ - var_222_21) / var_222_22
				local var_222_24 = Color.New(0, 0, 0)

				var_222_24.a = Mathf.Lerp(1, 0, var_222_23)
				arg_219_1.mask_.color = var_222_24
			end

			if arg_219_1.time_ >= var_222_21 + var_222_22 and arg_219_1.time_ < var_222_21 + var_222_22 + arg_222_0 then
				local var_222_25 = Color.New(0, 0, 0)
				local var_222_26 = 0

				arg_219_1.mask_.enabled = false
				var_222_25.a = var_222_26
				arg_219_1.mask_.color = var_222_25
			end

			if arg_219_1.frameCnt_ <= 1 then
				arg_219_1.dialog_:SetActive(false)
			end

			local var_222_27 = 4
			local var_222_28 = 0.875

			if var_222_27 < arg_219_1.time_ and arg_219_1.time_ <= var_222_27 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0

				arg_219_1.dialog_:SetActive(true)

				local var_222_29 = LeanTween.value(arg_219_1.dialog_, 0, 1, 0.3)

				var_222_29:setOnUpdate(LuaHelper.FloatAction(function(arg_223_0)
					arg_219_1.dialogCg_.alpha = arg_223_0
				end))
				var_222_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_219_1.dialog_)
					var_222_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_219_1.duration_ = arg_219_1.duration_ + 0.3

				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_30 = arg_219_1:FormatText(StoryNameCfg[389].name)

				arg_219_1.leftNameTxt_.text = var_222_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1076")

				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_31 = arg_219_1:GetWordFromCfg(221061053)
				local var_222_32 = arg_219_1:FormatText(var_222_31.content)

				arg_219_1.text_.text = var_222_32

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_33 = 35
				local var_222_34 = utf8.len(var_222_32)
				local var_222_35 = var_222_33 <= 0 and var_222_28 or var_222_28 * (var_222_34 / var_222_33)

				if var_222_35 > 0 and var_222_28 < var_222_35 then
					arg_219_1.talkMaxDuration = var_222_35
					var_222_27 = var_222_27 + 0.3

					if var_222_35 + var_222_27 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_35 + var_222_27
					end
				end

				arg_219_1.text_.text = var_222_32
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061053", "story_v_out_221061.awb") ~= 0 then
					local var_222_36 = manager.audio:GetVoiceLength("story_v_out_221061", "221061053", "story_v_out_221061.awb") / 1000

					if var_222_36 + var_222_27 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_36 + var_222_27
					end

					if var_222_31.prefab_name ~= "" and arg_219_1.actors_[var_222_31.prefab_name] ~= nil then
						local var_222_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_31.prefab_name].transform, "story_v_out_221061", "221061053", "story_v_out_221061.awb")

						arg_219_1:RecordAudio("221061053", var_222_37)
						arg_219_1:RecordAudio("221061053", var_222_37)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_221061", "221061053", "story_v_out_221061.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_221061", "221061053", "story_v_out_221061.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_38 = var_222_27 + 0.3
			local var_222_39 = math.max(var_222_28, arg_219_1.talkMaxDuration)

			if var_222_38 <= arg_219_1.time_ and arg_219_1.time_ < var_222_38 + var_222_39 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_38) / var_222_39

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_38 + var_222_39 and arg_219_1.time_ < var_222_38 + var_222_39 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play221061054 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 221061054
		arg_225_1.duration_ = 12.433

		local var_225_0 = {
			ja = 12.433,
			ko = 9.633,
			zh = 9.633
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
				arg_225_0:Play221061055(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 1.225

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[379].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, true)
				arg_225_1.iconController_:SetSelectedState("hero")

				arg_225_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(221061054)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061054", "story_v_out_221061.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061054", "story_v_out_221061.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_out_221061", "221061054", "story_v_out_221061.awb")

						arg_225_1:RecordAudio("221061054", var_228_9)
						arg_225_1:RecordAudio("221061054", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_221061", "221061054", "story_v_out_221061.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_221061", "221061054", "story_v_out_221061.awb")
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
	Play221061055 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 221061055
		arg_229_1.duration_ = 4.333

		local var_229_0 = {
			ja = 4.333,
			ko = 2.666,
			zh = 2.666
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
				arg_229_0:Play221061056(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 0.325

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_2 = arg_229_1:FormatText(StoryNameCfg[379].name)

				arg_229_1.leftNameTxt_.text = var_232_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, true)
				arg_229_1.iconController_:SetSelectedState("hero")

				arg_229_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_3 = arg_229_1:GetWordFromCfg(221061055)
				local var_232_4 = arg_229_1:FormatText(var_232_3.content)

				arg_229_1.text_.text = var_232_4

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061055", "story_v_out_221061.awb") ~= 0 then
					local var_232_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061055", "story_v_out_221061.awb") / 1000

					if var_232_8 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_8 + var_232_0
					end

					if var_232_3.prefab_name ~= "" and arg_229_1.actors_[var_232_3.prefab_name] ~= nil then
						local var_232_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_3.prefab_name].transform, "story_v_out_221061", "221061055", "story_v_out_221061.awb")

						arg_229_1:RecordAudio("221061055", var_232_9)
						arg_229_1:RecordAudio("221061055", var_232_9)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_221061", "221061055", "story_v_out_221061.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_221061", "221061055", "story_v_out_221061.awb")
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
	Play221061056 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 221061056
		arg_233_1.duration_ = 1.033

		local var_233_0 = {
			ja = 1.033,
			ko = 0.999999999999,
			zh = 0.999999999999
		}
		local var_233_1 = manager.audio:GetLocalizationFlag()

		if var_233_0[var_233_1] ~= nil then
			arg_233_1.duration_ = var_233_0[var_233_1]
		end

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play221061057(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 0.05

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_2 = arg_233_1:FormatText(StoryNameCfg[389].name)

				arg_233_1.leftNameTxt_.text = var_236_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, true)
				arg_233_1.iconController_:SetSelectedState("hero")

				arg_233_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_3 = arg_233_1:GetWordFromCfg(221061056)
				local var_236_4 = arg_233_1:FormatText(var_236_3.content)

				arg_233_1.text_.text = var_236_4

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_5 = 2
				local var_236_6 = utf8.len(var_236_4)
				local var_236_7 = var_236_5 <= 0 and var_236_1 or var_236_1 * (var_236_6 / var_236_5)

				if var_236_7 > 0 and var_236_1 < var_236_7 then
					arg_233_1.talkMaxDuration = var_236_7

					if var_236_7 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_7 + var_236_0
					end
				end

				arg_233_1.text_.text = var_236_4
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061056", "story_v_out_221061.awb") ~= 0 then
					local var_236_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061056", "story_v_out_221061.awb") / 1000

					if var_236_8 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_8 + var_236_0
					end

					if var_236_3.prefab_name ~= "" and arg_233_1.actors_[var_236_3.prefab_name] ~= nil then
						local var_236_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_3.prefab_name].transform, "story_v_out_221061", "221061056", "story_v_out_221061.awb")

						arg_233_1:RecordAudio("221061056", var_236_9)
						arg_233_1:RecordAudio("221061056", var_236_9)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_221061", "221061056", "story_v_out_221061.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_221061", "221061056", "story_v_out_221061.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_10 = math.max(var_236_1, arg_233_1.talkMaxDuration)

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_10 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_0) / var_236_10

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_0 + var_236_10 and arg_233_1.time_ < var_236_0 + var_236_10 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play221061057 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 221061057
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play221061058(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 1.25

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_2 = arg_237_1:GetWordFromCfg(221061057)
				local var_240_3 = arg_237_1:FormatText(var_240_2.content)

				arg_237_1.text_.text = var_240_3

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_4 = 50
				local var_240_5 = utf8.len(var_240_3)
				local var_240_6 = var_240_4 <= 0 and var_240_1 or var_240_1 * (var_240_5 / var_240_4)

				if var_240_6 > 0 and var_240_1 < var_240_6 then
					arg_237_1.talkMaxDuration = var_240_6

					if var_240_6 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_6 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_3
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_7 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_7 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_7

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_7 and arg_237_1.time_ < var_240_0 + var_240_7 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play221061058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 221061058
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play221061059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 0.35

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_2 = arg_241_1:GetWordFromCfg(221061058)
				local var_244_3 = arg_241_1:FormatText(var_244_2.content)

				arg_241_1.text_.text = var_244_3

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_4 = 14
				local var_244_5 = utf8.len(var_244_3)
				local var_244_6 = var_244_4 <= 0 and var_244_1 or var_244_1 * (var_244_5 / var_244_4)

				if var_244_6 > 0 and var_244_1 < var_244_6 then
					arg_241_1.talkMaxDuration = var_244_6

					if var_244_6 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_6 + var_244_0
					end
				end

				arg_241_1.text_.text = var_244_3
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_7 = math.max(var_244_1, arg_241_1.talkMaxDuration)

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_7 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_0) / var_244_7

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_0 + var_244_7 and arg_241_1.time_ < var_244_0 + var_244_7 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play221061059 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 221061059
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play221061060(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.775

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

				local var_248_2 = arg_245_1:GetWordFromCfg(221061059)
				local var_248_3 = arg_245_1:FormatText(var_248_2.content)

				arg_245_1.text_.text = var_248_3

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_4 = 31
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
	Play221061060 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 221061060
		arg_249_1.duration_ = 4.933

		local var_249_0 = {
			ja = 4.933,
			ko = 3.6,
			zh = 3.6
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
				arg_249_0:Play221061061(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.425

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[379].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, true)
				arg_249_1.iconController_:SetSelectedState("hero")

				arg_249_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(221061060)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 17
				local var_252_6 = utf8.len(var_252_4)
				local var_252_7 = var_252_5 <= 0 and var_252_1 or var_252_1 * (var_252_6 / var_252_5)

				if var_252_7 > 0 and var_252_1 < var_252_7 then
					arg_249_1.talkMaxDuration = var_252_7

					if var_252_7 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_7 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_4
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061060", "story_v_out_221061.awb") ~= 0 then
					local var_252_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061060", "story_v_out_221061.awb") / 1000

					if var_252_8 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_0
					end

					if var_252_3.prefab_name ~= "" and arg_249_1.actors_[var_252_3.prefab_name] ~= nil then
						local var_252_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_3.prefab_name].transform, "story_v_out_221061", "221061060", "story_v_out_221061.awb")

						arg_249_1:RecordAudio("221061060", var_252_9)
						arg_249_1:RecordAudio("221061060", var_252_9)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_221061", "221061060", "story_v_out_221061.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_221061", "221061060", "story_v_out_221061.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_10 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_10 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_10

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_10 and arg_249_1.time_ < var_252_0 + var_252_10 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play221061061 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 221061061
		arg_253_1.duration_ = 15.7

		local var_253_0 = {
			ja = 15.7,
			ko = 14.833,
			zh = 14.833
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
				arg_253_0:Play221061062(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = "XH0807"

			if arg_253_1.bgs_[var_256_0] == nil then
				local var_256_1 = Object.Instantiate(arg_253_1.paintGo_)

				var_256_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_256_0)
				var_256_1.name = var_256_0
				var_256_1.transform.parent = arg_253_1.stage_.transform
				var_256_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_253_1.bgs_[var_256_0] = var_256_1
			end

			local var_256_2 = 2

			if var_256_2 < arg_253_1.time_ and arg_253_1.time_ <= var_256_2 + arg_256_0 then
				local var_256_3 = manager.ui.mainCamera.transform.localPosition
				local var_256_4 = Vector3.New(0, 0, 10) + Vector3.New(var_256_3.x, var_256_3.y, 0)
				local var_256_5 = arg_253_1.bgs_.XH0807

				var_256_5.transform.localPosition = var_256_4
				var_256_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_256_6 = var_256_5:GetComponent("SpriteRenderer")

				if var_256_6 and var_256_6.sprite then
					local var_256_7 = (var_256_5.transform.localPosition - var_256_3).z
					local var_256_8 = manager.ui.mainCameraCom_
					local var_256_9 = 2 * var_256_7 * Mathf.Tan(var_256_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_256_10 = var_256_9 * var_256_8.aspect
					local var_256_11 = var_256_6.sprite.bounds.size.x
					local var_256_12 = var_256_6.sprite.bounds.size.y
					local var_256_13 = var_256_10 / var_256_11
					local var_256_14 = var_256_9 / var_256_12
					local var_256_15 = var_256_14 < var_256_13 and var_256_13 or var_256_14

					var_256_5.transform.localScale = Vector3.New(var_256_15, var_256_15, 0)
				end

				for iter_256_0, iter_256_1 in pairs(arg_253_1.bgs_) do
					if iter_256_0 ~= "XH0807" then
						iter_256_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_256_16 = 0

			if var_256_16 < arg_253_1.time_ and arg_253_1.time_ <= var_256_16 + arg_256_0 then
				arg_253_1.mask_.enabled = true
				arg_253_1.mask_.raycastTarget = true

				arg_253_1:SetGaussion(false)
			end

			local var_256_17 = 2

			if var_256_16 <= arg_253_1.time_ and arg_253_1.time_ < var_256_16 + var_256_17 then
				local var_256_18 = (arg_253_1.time_ - var_256_16) / var_256_17
				local var_256_19 = Color.New(0, 0, 0)

				var_256_19.a = Mathf.Lerp(0, 1, var_256_18)
				arg_253_1.mask_.color = var_256_19
			end

			if arg_253_1.time_ >= var_256_16 + var_256_17 and arg_253_1.time_ < var_256_16 + var_256_17 + arg_256_0 then
				local var_256_20 = Color.New(0, 0, 0)

				var_256_20.a = 1
				arg_253_1.mask_.color = var_256_20
			end

			local var_256_21 = 2

			if var_256_21 < arg_253_1.time_ and arg_253_1.time_ <= var_256_21 + arg_256_0 then
				arg_253_1.mask_.enabled = true
				arg_253_1.mask_.raycastTarget = true

				arg_253_1:SetGaussion(false)
			end

			local var_256_22 = 2

			if var_256_21 <= arg_253_1.time_ and arg_253_1.time_ < var_256_21 + var_256_22 then
				local var_256_23 = (arg_253_1.time_ - var_256_21) / var_256_22
				local var_256_24 = Color.New(0, 0, 0)

				var_256_24.a = Mathf.Lerp(1, 0, var_256_23)
				arg_253_1.mask_.color = var_256_24
			end

			if arg_253_1.time_ >= var_256_21 + var_256_22 and arg_253_1.time_ < var_256_21 + var_256_22 + arg_256_0 then
				local var_256_25 = Color.New(0, 0, 0)
				local var_256_26 = 0

				arg_253_1.mask_.enabled = false
				var_256_25.a = var_256_26
				arg_253_1.mask_.color = var_256_25
			end

			if arg_253_1.frameCnt_ <= 1 then
				arg_253_1.dialog_:SetActive(false)
			end

			local var_256_27 = 4
			local var_256_28 = 1.275

			if var_256_27 < arg_253_1.time_ and arg_253_1.time_ <= var_256_27 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0

				arg_253_1.dialog_:SetActive(true)

				local var_256_29 = LeanTween.value(arg_253_1.dialog_, 0, 1, 0.3)

				var_256_29:setOnUpdate(LuaHelper.FloatAction(function(arg_257_0)
					arg_253_1.dialogCg_.alpha = arg_257_0
				end))
				var_256_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_253_1.dialog_)
					var_256_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_253_1.duration_ = arg_253_1.duration_ + 0.3

				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_30 = arg_253_1:FormatText(StoryNameCfg[379].name)

				arg_253_1.leftNameTxt_.text = var_256_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, true)
				arg_253_1.iconController_:SetSelectedState("hero")

				arg_253_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_31 = arg_253_1:GetWordFromCfg(221061061)
				local var_256_32 = arg_253_1:FormatText(var_256_31.content)

				arg_253_1.text_.text = var_256_32

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_33 = 51
				local var_256_34 = utf8.len(var_256_32)
				local var_256_35 = var_256_33 <= 0 and var_256_28 or var_256_28 * (var_256_34 / var_256_33)

				if var_256_35 > 0 and var_256_28 < var_256_35 then
					arg_253_1.talkMaxDuration = var_256_35
					var_256_27 = var_256_27 + 0.3

					if var_256_35 + var_256_27 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_35 + var_256_27
					end
				end

				arg_253_1.text_.text = var_256_32
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061061", "story_v_out_221061.awb") ~= 0 then
					local var_256_36 = manager.audio:GetVoiceLength("story_v_out_221061", "221061061", "story_v_out_221061.awb") / 1000

					if var_256_36 + var_256_27 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_36 + var_256_27
					end

					if var_256_31.prefab_name ~= "" and arg_253_1.actors_[var_256_31.prefab_name] ~= nil then
						local var_256_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_31.prefab_name].transform, "story_v_out_221061", "221061061", "story_v_out_221061.awb")

						arg_253_1:RecordAudio("221061061", var_256_37)
						arg_253_1:RecordAudio("221061061", var_256_37)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_221061", "221061061", "story_v_out_221061.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_221061", "221061061", "story_v_out_221061.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_38 = var_256_27 + 0.3
			local var_256_39 = math.max(var_256_28, arg_253_1.talkMaxDuration)

			if var_256_38 <= arg_253_1.time_ and arg_253_1.time_ < var_256_38 + var_256_39 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_38) / var_256_39

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_38 + var_256_39 and arg_253_1.time_ < var_256_38 + var_256_39 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play221061062 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 221061062
		arg_259_1.duration_ = 3.7

		local var_259_0 = {
			ja = 3.7,
			ko = 3.633,
			zh = 3.633
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
				arg_259_0:Play221061063(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.375

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[379].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, true)
				arg_259_1.iconController_:SetSelectedState("hero")

				arg_259_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(221061062)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 15
				local var_262_6 = utf8.len(var_262_4)
				local var_262_7 = var_262_5 <= 0 and var_262_1 or var_262_1 * (var_262_6 / var_262_5)

				if var_262_7 > 0 and var_262_1 < var_262_7 then
					arg_259_1.talkMaxDuration = var_262_7

					if var_262_7 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_7 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_4
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061062", "story_v_out_221061.awb") ~= 0 then
					local var_262_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061062", "story_v_out_221061.awb") / 1000

					if var_262_8 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_8 + var_262_0
					end

					if var_262_3.prefab_name ~= "" and arg_259_1.actors_[var_262_3.prefab_name] ~= nil then
						local var_262_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_3.prefab_name].transform, "story_v_out_221061", "221061062", "story_v_out_221061.awb")

						arg_259_1:RecordAudio("221061062", var_262_9)
						arg_259_1:RecordAudio("221061062", var_262_9)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_221061", "221061062", "story_v_out_221061.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_221061", "221061062", "story_v_out_221061.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_10 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_10 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_10

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_10 and arg_259_1.time_ < var_262_0 + var_262_10 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play221061063 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 221061063
		arg_263_1.duration_ = 17.066

		local var_263_0 = {
			ja = 17.066,
			ko = 10,
			zh = 10
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
				arg_263_0:Play221061064(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = "XH0808"

			if arg_263_1.bgs_[var_266_0] == nil then
				local var_266_1 = Object.Instantiate(arg_263_1.paintGo_)

				var_266_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_266_0)
				var_266_1.name = var_266_0
				var_266_1.transform.parent = arg_263_1.stage_.transform
				var_266_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_263_1.bgs_[var_266_0] = var_266_1
			end

			local var_266_2 = 2

			if var_266_2 < arg_263_1.time_ and arg_263_1.time_ <= var_266_2 + arg_266_0 then
				local var_266_3 = manager.ui.mainCamera.transform.localPosition
				local var_266_4 = Vector3.New(0, 0, 10) + Vector3.New(var_266_3.x, var_266_3.y, 0)
				local var_266_5 = arg_263_1.bgs_.XH0808

				var_266_5.transform.localPosition = var_266_4
				var_266_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_266_6 = var_266_5:GetComponent("SpriteRenderer")

				if var_266_6 and var_266_6.sprite then
					local var_266_7 = (var_266_5.transform.localPosition - var_266_3).z
					local var_266_8 = manager.ui.mainCameraCom_
					local var_266_9 = 2 * var_266_7 * Mathf.Tan(var_266_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_266_10 = var_266_9 * var_266_8.aspect
					local var_266_11 = var_266_6.sprite.bounds.size.x
					local var_266_12 = var_266_6.sprite.bounds.size.y
					local var_266_13 = var_266_10 / var_266_11
					local var_266_14 = var_266_9 / var_266_12
					local var_266_15 = var_266_14 < var_266_13 and var_266_13 or var_266_14

					var_266_5.transform.localScale = Vector3.New(var_266_15, var_266_15, 0)
				end

				for iter_266_0, iter_266_1 in pairs(arg_263_1.bgs_) do
					if iter_266_0 ~= "XH0808" then
						iter_266_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_266_16 = 0

			if var_266_16 < arg_263_1.time_ and arg_263_1.time_ <= var_266_16 + arg_266_0 then
				arg_263_1.mask_.enabled = true
				arg_263_1.mask_.raycastTarget = true

				arg_263_1:SetGaussion(false)
			end

			local var_266_17 = 2

			if var_266_16 <= arg_263_1.time_ and arg_263_1.time_ < var_266_16 + var_266_17 then
				local var_266_18 = (arg_263_1.time_ - var_266_16) / var_266_17
				local var_266_19 = Color.New(0, 0, 0)

				var_266_19.a = Mathf.Lerp(0, 1, var_266_18)
				arg_263_1.mask_.color = var_266_19
			end

			if arg_263_1.time_ >= var_266_16 + var_266_17 and arg_263_1.time_ < var_266_16 + var_266_17 + arg_266_0 then
				local var_266_20 = Color.New(0, 0, 0)

				var_266_20.a = 1
				arg_263_1.mask_.color = var_266_20
			end

			local var_266_21 = 2

			if var_266_21 < arg_263_1.time_ and arg_263_1.time_ <= var_266_21 + arg_266_0 then
				arg_263_1.mask_.enabled = true
				arg_263_1.mask_.raycastTarget = true

				arg_263_1:SetGaussion(false)
			end

			local var_266_22 = 2

			if var_266_21 <= arg_263_1.time_ and arg_263_1.time_ < var_266_21 + var_266_22 then
				local var_266_23 = (arg_263_1.time_ - var_266_21) / var_266_22
				local var_266_24 = Color.New(0, 0, 0)

				var_266_24.a = Mathf.Lerp(1, 0, var_266_23)
				arg_263_1.mask_.color = var_266_24
			end

			if arg_263_1.time_ >= var_266_21 + var_266_22 and arg_263_1.time_ < var_266_21 + var_266_22 + arg_266_0 then
				local var_266_25 = Color.New(0, 0, 0)
				local var_266_26 = 0

				arg_263_1.mask_.enabled = false
				var_266_25.a = var_266_26
				arg_263_1.mask_.color = var_266_25
			end

			if arg_263_1.frameCnt_ <= 1 then
				arg_263_1.dialog_:SetActive(false)
			end

			local var_266_27 = 4
			local var_266_28 = 0.6

			if var_266_27 < arg_263_1.time_ and arg_263_1.time_ <= var_266_27 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0

				arg_263_1.dialog_:SetActive(true)

				local var_266_29 = LeanTween.value(arg_263_1.dialog_, 0, 1, 0.3)

				var_266_29:setOnUpdate(LuaHelper.FloatAction(function(arg_267_0)
					arg_263_1.dialogCg_.alpha = arg_267_0
				end))
				var_266_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_263_1.dialog_)
					var_266_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_263_1.duration_ = arg_263_1.duration_ + 0.3

				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_30 = arg_263_1:FormatText(StoryNameCfg[379].name)

				arg_263_1.leftNameTxt_.text = var_266_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, true)
				arg_263_1.iconController_:SetSelectedState("hero")

				arg_263_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_31 = arg_263_1:GetWordFromCfg(221061063)
				local var_266_32 = arg_263_1:FormatText(var_266_31.content)

				arg_263_1.text_.text = var_266_32

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_33 = 24
				local var_266_34 = utf8.len(var_266_32)
				local var_266_35 = var_266_33 <= 0 and var_266_28 or var_266_28 * (var_266_34 / var_266_33)

				if var_266_35 > 0 and var_266_28 < var_266_35 then
					arg_263_1.talkMaxDuration = var_266_35
					var_266_27 = var_266_27 + 0.3

					if var_266_35 + var_266_27 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_35 + var_266_27
					end
				end

				arg_263_1.text_.text = var_266_32
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061063", "story_v_out_221061.awb") ~= 0 then
					local var_266_36 = manager.audio:GetVoiceLength("story_v_out_221061", "221061063", "story_v_out_221061.awb") / 1000

					if var_266_36 + var_266_27 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_36 + var_266_27
					end

					if var_266_31.prefab_name ~= "" and arg_263_1.actors_[var_266_31.prefab_name] ~= nil then
						local var_266_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_31.prefab_name].transform, "story_v_out_221061", "221061063", "story_v_out_221061.awb")

						arg_263_1:RecordAudio("221061063", var_266_37)
						arg_263_1:RecordAudio("221061063", var_266_37)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_221061", "221061063", "story_v_out_221061.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_221061", "221061063", "story_v_out_221061.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_38 = var_266_27 + 0.3
			local var_266_39 = math.max(var_266_28, arg_263_1.talkMaxDuration)

			if var_266_38 <= arg_263_1.time_ and arg_263_1.time_ < var_266_38 + var_266_39 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_38) / var_266_39

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_38 + var_266_39 and arg_263_1.time_ < var_266_38 + var_266_39 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play221061064 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 221061064
		arg_269_1.duration_ = 4.233

		local var_269_0 = {
			ja = 4.233,
			ko = 3,
			zh = 3
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
				arg_269_0:Play221061065(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.25

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[389].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, true)
				arg_269_1.iconController_:SetSelectedState("hero")

				arg_269_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1076")

				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(221061064)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061064", "story_v_out_221061.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061064", "story_v_out_221061.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_221061", "221061064", "story_v_out_221061.awb")

						arg_269_1:RecordAudio("221061064", var_272_9)
						arg_269_1:RecordAudio("221061064", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_221061", "221061064", "story_v_out_221061.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_221061", "221061064", "story_v_out_221061.awb")
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
	Play221061065 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 221061065
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play221061066(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.725

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

				local var_276_2 = arg_273_1:GetWordFromCfg(221061065)
				local var_276_3 = arg_273_1:FormatText(var_276_2.content)

				arg_273_1.text_.text = var_276_3

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_4 = 29
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
	Play221061066 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 221061066
		arg_277_1.duration_ = 3.933

		local var_277_0 = {
			ja = 3.933,
			ko = 3.6,
			zh = 3.6
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
				arg_277_0:Play221061067(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = "STblack"

			if arg_277_1.bgs_[var_280_0] == nil then
				local var_280_1 = Object.Instantiate(arg_277_1.paintGo_)

				var_280_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_280_0)
				var_280_1.name = var_280_0
				var_280_1.transform.parent = arg_277_1.stage_.transform
				var_280_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_277_1.bgs_[var_280_0] = var_280_1
			end

			local var_280_2 = 0

			if var_280_2 < arg_277_1.time_ and arg_277_1.time_ <= var_280_2 + arg_280_0 then
				local var_280_3 = manager.ui.mainCamera.transform.localPosition
				local var_280_4 = Vector3.New(0, 0, 10) + Vector3.New(var_280_3.x, var_280_3.y, 0)
				local var_280_5 = arg_277_1.bgs_.STblack

				var_280_5.transform.localPosition = var_280_4
				var_280_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_280_6 = var_280_5:GetComponent("SpriteRenderer")

				if var_280_6 and var_280_6.sprite then
					local var_280_7 = (var_280_5.transform.localPosition - var_280_3).z
					local var_280_8 = manager.ui.mainCameraCom_
					local var_280_9 = 2 * var_280_7 * Mathf.Tan(var_280_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_280_10 = var_280_9 * var_280_8.aspect
					local var_280_11 = var_280_6.sprite.bounds.size.x
					local var_280_12 = var_280_6.sprite.bounds.size.y
					local var_280_13 = var_280_10 / var_280_11
					local var_280_14 = var_280_9 / var_280_12
					local var_280_15 = var_280_14 < var_280_13 and var_280_13 or var_280_14

					var_280_5.transform.localScale = Vector3.New(var_280_15, var_280_15, 0)
				end

				for iter_280_0, iter_280_1 in pairs(arg_277_1.bgs_) do
					if iter_280_0 ~= "STblack" then
						iter_280_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_280_16 = 0

			if var_280_16 < arg_277_1.time_ and arg_277_1.time_ <= var_280_16 + arg_280_0 then
				arg_277_1.mask_.enabled = true
				arg_277_1.mask_.raycastTarget = true

				arg_277_1:SetGaussion(false)
			end

			local var_280_17 = 2

			if var_280_16 <= arg_277_1.time_ and arg_277_1.time_ < var_280_16 + var_280_17 then
				local var_280_18 = (arg_277_1.time_ - var_280_16) / var_280_17
				local var_280_19 = Color.New(0, 0, 0)

				var_280_19.a = Mathf.Lerp(1, 0, var_280_18)
				arg_277_1.mask_.color = var_280_19
			end

			if arg_277_1.time_ >= var_280_16 + var_280_17 and arg_277_1.time_ < var_280_16 + var_280_17 + arg_280_0 then
				local var_280_20 = Color.New(0, 0, 0)
				local var_280_21 = 0

				arg_277_1.mask_.enabled = false
				var_280_20.a = var_280_21
				arg_277_1.mask_.color = var_280_20
			end

			if arg_277_1.frameCnt_ <= 1 then
				arg_277_1.dialog_:SetActive(false)
			end

			local var_280_22 = 2
			local var_280_23 = 0.1

			if var_280_22 < arg_277_1.time_ and arg_277_1.time_ <= var_280_22 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0

				arg_277_1.dialog_:SetActive(true)

				local var_280_24 = LeanTween.value(arg_277_1.dialog_, 0, 1, 0.3)

				var_280_24:setOnUpdate(LuaHelper.FloatAction(function(arg_281_0)
					arg_277_1.dialogCg_.alpha = arg_281_0
				end))
				var_280_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_277_1.dialog_)
					var_280_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_277_1.duration_ = arg_277_1.duration_ + 0.3

				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_25 = arg_277_1:FormatText(StoryNameCfg[379].name)

				arg_277_1.leftNameTxt_.text = var_280_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, true)
				arg_277_1.iconController_:SetSelectedState("hero")

				arg_277_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_26 = arg_277_1:GetWordFromCfg(221061066)
				local var_280_27 = arg_277_1:FormatText(var_280_26.content)

				arg_277_1.text_.text = var_280_27

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_28 = 4
				local var_280_29 = utf8.len(var_280_27)
				local var_280_30 = var_280_28 <= 0 and var_280_23 or var_280_23 * (var_280_29 / var_280_28)

				if var_280_30 > 0 and var_280_23 < var_280_30 then
					arg_277_1.talkMaxDuration = var_280_30
					var_280_22 = var_280_22 + 0.3

					if var_280_30 + var_280_22 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_30 + var_280_22
					end
				end

				arg_277_1.text_.text = var_280_27
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061066", "story_v_out_221061.awb") ~= 0 then
					local var_280_31 = manager.audio:GetVoiceLength("story_v_out_221061", "221061066", "story_v_out_221061.awb") / 1000

					if var_280_31 + var_280_22 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_31 + var_280_22
					end

					if var_280_26.prefab_name ~= "" and arg_277_1.actors_[var_280_26.prefab_name] ~= nil then
						local var_280_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_26.prefab_name].transform, "story_v_out_221061", "221061066", "story_v_out_221061.awb")

						arg_277_1:RecordAudio("221061066", var_280_32)
						arg_277_1:RecordAudio("221061066", var_280_32)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_221061", "221061066", "story_v_out_221061.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_221061", "221061066", "story_v_out_221061.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_33 = var_280_22 + 0.3
			local var_280_34 = math.max(var_280_23, arg_277_1.talkMaxDuration)

			if var_280_33 <= arg_277_1.time_ and arg_277_1.time_ < var_280_33 + var_280_34 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_33) / var_280_34

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_33 + var_280_34 and arg_277_1.time_ < var_280_33 + var_280_34 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play221061067 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 221061067
		arg_283_1.duration_ = 8.016666666666

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play221061068(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = "XH0404"

			if arg_283_1.bgs_[var_286_0] == nil then
				local var_286_1 = Object.Instantiate(arg_283_1.paintGo_)

				var_286_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_286_0)
				var_286_1.name = var_286_0
				var_286_1.transform.parent = arg_283_1.stage_.transform
				var_286_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_283_1.bgs_[var_286_0] = var_286_1
			end

			local var_286_2 = 0

			if var_286_2 < arg_283_1.time_ and arg_283_1.time_ <= var_286_2 + arg_286_0 then
				local var_286_3 = manager.ui.mainCamera.transform.localPosition
				local var_286_4 = Vector3.New(0, 0, 10) + Vector3.New(var_286_3.x, var_286_3.y, 0)
				local var_286_5 = arg_283_1.bgs_.XH0404

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
					if iter_286_0 ~= "XH0404" then
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

			local var_286_17 = 4

			if var_286_16 <= arg_283_1.time_ and arg_283_1.time_ < var_286_16 + var_286_17 then
				local var_286_18 = (arg_283_1.time_ - var_286_16) / var_286_17
				local var_286_19 = Color.New(0, 0, 0)

				var_286_19.a = Mathf.Lerp(1, 0, var_286_18)
				arg_283_1.mask_.color = var_286_19
			end

			if arg_283_1.time_ >= var_286_16 + var_286_17 and arg_283_1.time_ < var_286_16 + var_286_17 + arg_286_0 then
				local var_286_20 = Color.New(0, 0, 0)
				local var_286_21 = 0

				arg_283_1.mask_.enabled = false
				var_286_20.a = var_286_21
				arg_283_1.mask_.color = var_286_20
			end

			local var_286_22 = arg_283_1.bgs_.XH0404.transform
			local var_286_23 = 0

			if var_286_23 < arg_283_1.time_ and arg_283_1.time_ <= var_286_23 + arg_286_0 then
				arg_283_1.var_.moveOldPosXH0404 = var_286_22.localPosition
			end

			local var_286_24 = 0.001

			if var_286_23 <= arg_283_1.time_ and arg_283_1.time_ < var_286_23 + var_286_24 then
				local var_286_25 = (arg_283_1.time_ - var_286_23) / var_286_24
				local var_286_26 = Vector3.New(0.05, 1, 8.5)

				var_286_22.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPosXH0404, var_286_26, var_286_25)
			end

			if arg_283_1.time_ >= var_286_23 + var_286_24 and arg_283_1.time_ < var_286_23 + var_286_24 + arg_286_0 then
				var_286_22.localPosition = Vector3.New(0.05, 1, 8.5)
			end

			local var_286_27 = arg_283_1.bgs_.XH0404.transform
			local var_286_28 = 0.0166666666666682

			if var_286_28 < arg_283_1.time_ and arg_283_1.time_ <= var_286_28 + arg_286_0 then
				arg_283_1.var_.moveOldPosXH0404 = var_286_27.localPosition
			end

			local var_286_29 = 8

			if var_286_28 <= arg_283_1.time_ and arg_283_1.time_ < var_286_28 + var_286_29 then
				local var_286_30 = (arg_283_1.time_ - var_286_28) / var_286_29
				local var_286_31 = Vector3.New(0, 1, 10)

				var_286_27.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPosXH0404, var_286_31, var_286_30)
			end

			if arg_283_1.time_ >= var_286_28 + var_286_29 and arg_283_1.time_ < var_286_28 + var_286_29 + arg_286_0 then
				var_286_27.localPosition = Vector3.New(0, 1, 10)
			end

			if arg_283_1.frameCnt_ <= 1 then
				arg_283_1.dialog_:SetActive(false)
			end

			local var_286_32 = 4
			local var_286_33 = 0.225

			if var_286_32 < arg_283_1.time_ and arg_283_1.time_ <= var_286_32 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0

				arg_283_1.dialog_:SetActive(true)

				local var_286_34 = LeanTween.value(arg_283_1.dialog_, 0, 1, 0.3)

				var_286_34:setOnUpdate(LuaHelper.FloatAction(function(arg_287_0)
					arg_283_1.dialogCg_.alpha = arg_287_0
				end))
				var_286_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_283_1.dialog_)
					var_286_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_283_1.duration_ = arg_283_1.duration_ + 0.3

				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_35 = arg_283_1:FormatText(StoryNameCfg[379].name)

				arg_283_1.leftNameTxt_.text = var_286_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_36 = arg_283_1:GetWordFromCfg(221061067)
				local var_286_37 = arg_283_1:FormatText(var_286_36.content)

				arg_283_1.text_.text = var_286_37

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_38 = 9
				local var_286_39 = utf8.len(var_286_37)
				local var_286_40 = var_286_38 <= 0 and var_286_33 or var_286_33 * (var_286_39 / var_286_38)

				if var_286_40 > 0 and var_286_33 < var_286_40 then
					arg_283_1.talkMaxDuration = var_286_40
					var_286_32 = var_286_32 + 0.3

					if var_286_40 + var_286_32 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_40 + var_286_32
					end
				end

				arg_283_1.text_.text = var_286_37
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061067", "story_v_out_221061.awb") ~= 0 then
					local var_286_41 = manager.audio:GetVoiceLength("story_v_out_221061", "221061067", "story_v_out_221061.awb") / 1000

					if var_286_41 + var_286_32 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_41 + var_286_32
					end

					if var_286_36.prefab_name ~= "" and arg_283_1.actors_[var_286_36.prefab_name] ~= nil then
						local var_286_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_36.prefab_name].transform, "story_v_out_221061", "221061067", "story_v_out_221061.awb")

						arg_283_1:RecordAudio("221061067", var_286_42)
						arg_283_1:RecordAudio("221061067", var_286_42)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_221061", "221061067", "story_v_out_221061.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_221061", "221061067", "story_v_out_221061.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_43 = var_286_32 + 0.3
			local var_286_44 = math.max(var_286_33, arg_283_1.talkMaxDuration)

			if var_286_43 <= arg_283_1.time_ and arg_283_1.time_ < var_286_43 + var_286_44 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_43) / var_286_44

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_43 + var_286_44 and arg_283_1.time_ < var_286_43 + var_286_44 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play221061068 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 221061068
		arg_289_1.duration_ = 3.233

		local var_289_0 = {
			ja = 2.733,
			ko = 3.233,
			zh = 3.233
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
				arg_289_0:Play221061069(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.2

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[389].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(221061068)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061068", "story_v_out_221061.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061068", "story_v_out_221061.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_221061", "221061068", "story_v_out_221061.awb")

						arg_289_1:RecordAudio("221061068", var_292_9)
						arg_289_1:RecordAudio("221061068", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_221061", "221061068", "story_v_out_221061.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_221061", "221061068", "story_v_out_221061.awb")
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
	Play221061069 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 221061069
		arg_293_1.duration_ = 6.533

		local var_293_0 = {
			ja = 6.533,
			ko = 5.733,
			zh = 5.733
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play221061070(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 0.5

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[379].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(221061069)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061069", "story_v_out_221061.awb") ~= 0 then
					local var_296_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061069", "story_v_out_221061.awb") / 1000

					if var_296_8 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_8 + var_296_0
					end

					if var_296_3.prefab_name ~= "" and arg_293_1.actors_[var_296_3.prefab_name] ~= nil then
						local var_296_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_3.prefab_name].transform, "story_v_out_221061", "221061069", "story_v_out_221061.awb")

						arg_293_1:RecordAudio("221061069", var_296_9)
						arg_293_1:RecordAudio("221061069", var_296_9)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_221061", "221061069", "story_v_out_221061.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_221061", "221061069", "story_v_out_221061.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_10 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_10 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_10

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_10 and arg_293_1.time_ < var_296_0 + var_296_10 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play221061070 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 221061070
		arg_297_1.duration_ = 10.7

		local var_297_0 = {
			ja = 10.7,
			ko = 5.9,
			zh = 5.9
		}
		local var_297_1 = manager.audio:GetLocalizationFlag()

		if var_297_0[var_297_1] ~= nil then
			arg_297_1.duration_ = var_297_0[var_297_1]
		end

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play221061071(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.775

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[379].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(221061070)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061070", "story_v_out_221061.awb") ~= 0 then
					local var_300_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061070", "story_v_out_221061.awb") / 1000

					if var_300_8 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_8 + var_300_0
					end

					if var_300_3.prefab_name ~= "" and arg_297_1.actors_[var_300_3.prefab_name] ~= nil then
						local var_300_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_3.prefab_name].transform, "story_v_out_221061", "221061070", "story_v_out_221061.awb")

						arg_297_1:RecordAudio("221061070", var_300_9)
						arg_297_1:RecordAudio("221061070", var_300_9)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_221061", "221061070", "story_v_out_221061.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_221061", "221061070", "story_v_out_221061.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_10 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_10 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_10

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_10 and arg_297_1.time_ < var_300_0 + var_300_10 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play221061071 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 221061071
		arg_301_1.duration_ = 14.5

		local var_301_0 = {
			ja = 14.5,
			ko = 9.366,
			zh = 9.366
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
				arg_301_0:Play221061072(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 1.125

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[379].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(221061071)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 45
				local var_304_6 = utf8.len(var_304_4)
				local var_304_7 = var_304_5 <= 0 and var_304_1 or var_304_1 * (var_304_6 / var_304_5)

				if var_304_7 > 0 and var_304_1 < var_304_7 then
					arg_301_1.talkMaxDuration = var_304_7

					if var_304_7 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_7 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_4
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061071", "story_v_out_221061.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061071", "story_v_out_221061.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_out_221061", "221061071", "story_v_out_221061.awb")

						arg_301_1:RecordAudio("221061071", var_304_9)
						arg_301_1:RecordAudio("221061071", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_221061", "221061071", "story_v_out_221061.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_221061", "221061071", "story_v_out_221061.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_10 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_10 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_10

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_10 and arg_301_1.time_ < var_304_0 + var_304_10 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play221061072 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 221061072
		arg_305_1.duration_ = 4.333

		local var_305_0 = {
			ja = 4.333,
			ko = 3.7,
			zh = 3.7
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
				arg_305_0:Play221061073(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.125

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[389].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(221061072)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 5
				local var_308_6 = utf8.len(var_308_4)
				local var_308_7 = var_308_5 <= 0 and var_308_1 or var_308_1 * (var_308_6 / var_308_5)

				if var_308_7 > 0 and var_308_1 < var_308_7 then
					arg_305_1.talkMaxDuration = var_308_7

					if var_308_7 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_7 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_4
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061072", "story_v_out_221061.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061072", "story_v_out_221061.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_221061", "221061072", "story_v_out_221061.awb")

						arg_305_1:RecordAudio("221061072", var_308_9)
						arg_305_1:RecordAudio("221061072", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_221061", "221061072", "story_v_out_221061.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_221061", "221061072", "story_v_out_221061.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_10 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_10 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_10

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_10 and arg_305_1.time_ < var_308_0 + var_308_10 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play221061073 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 221061073
		arg_309_1.duration_ = 1

		local var_309_0 = {
			ja = 0.999999999999,
			ko = 1,
			zh = 1
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
				arg_309_0:Play221061074(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0
			local var_312_1 = 0.05

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_2 = arg_309_1:FormatText(StoryNameCfg[379].name)

				arg_309_1.leftNameTxt_.text = var_312_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_3 = arg_309_1:GetWordFromCfg(221061073)
				local var_312_4 = arg_309_1:FormatText(var_312_3.content)

				arg_309_1.text_.text = var_312_4

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061073", "story_v_out_221061.awb") ~= 0 then
					local var_312_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061073", "story_v_out_221061.awb") / 1000

					if var_312_8 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_8 + var_312_0
					end

					if var_312_3.prefab_name ~= "" and arg_309_1.actors_[var_312_3.prefab_name] ~= nil then
						local var_312_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_3.prefab_name].transform, "story_v_out_221061", "221061073", "story_v_out_221061.awb")

						arg_309_1:RecordAudio("221061073", var_312_9)
						arg_309_1:RecordAudio("221061073", var_312_9)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_221061", "221061073", "story_v_out_221061.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_221061", "221061073", "story_v_out_221061.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_10 = math.max(var_312_1, arg_309_1.talkMaxDuration)

			if var_312_0 <= arg_309_1.time_ and arg_309_1.time_ < var_312_0 + var_312_10 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_0) / var_312_10

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_0 + var_312_10 and arg_309_1.time_ < var_312_0 + var_312_10 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play221061074 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 221061074
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play221061075(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.675

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

				local var_316_2 = arg_313_1:GetWordFromCfg(221061074)
				local var_316_3 = arg_313_1:FormatText(var_316_2.content)

				arg_313_1.text_.text = var_316_3

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_4 = 27
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
	Play221061075 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 221061075
		arg_317_1.duration_ = 4.066

		local var_317_0 = {
			ja = 4.066,
			ko = 3.833,
			zh = 3.833
		}
		local var_317_1 = manager.audio:GetLocalizationFlag()

		if var_317_0[var_317_1] ~= nil then
			arg_317_1.duration_ = var_317_0[var_317_1]
		end

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play221061076(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0
			local var_320_1 = 0.3

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_2 = arg_317_1:FormatText(StoryNameCfg[389].name)

				arg_317_1.leftNameTxt_.text = var_320_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_3 = arg_317_1:GetWordFromCfg(221061075)
				local var_320_4 = arg_317_1:FormatText(var_320_3.content)

				arg_317_1.text_.text = var_320_4

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_5 = 12
				local var_320_6 = utf8.len(var_320_4)
				local var_320_7 = var_320_5 <= 0 and var_320_1 or var_320_1 * (var_320_6 / var_320_5)

				if var_320_7 > 0 and var_320_1 < var_320_7 then
					arg_317_1.talkMaxDuration = var_320_7

					if var_320_7 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_7 + var_320_0
					end
				end

				arg_317_1.text_.text = var_320_4
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061075", "story_v_out_221061.awb") ~= 0 then
					local var_320_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061075", "story_v_out_221061.awb") / 1000

					if var_320_8 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_8 + var_320_0
					end

					if var_320_3.prefab_name ~= "" and arg_317_1.actors_[var_320_3.prefab_name] ~= nil then
						local var_320_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_3.prefab_name].transform, "story_v_out_221061", "221061075", "story_v_out_221061.awb")

						arg_317_1:RecordAudio("221061075", var_320_9)
						arg_317_1:RecordAudio("221061075", var_320_9)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_221061", "221061075", "story_v_out_221061.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_221061", "221061075", "story_v_out_221061.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_10 = math.max(var_320_1, arg_317_1.talkMaxDuration)

			if var_320_0 <= arg_317_1.time_ and arg_317_1.time_ < var_320_0 + var_320_10 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_0) / var_320_10

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_0 + var_320_10 and arg_317_1.time_ < var_320_0 + var_320_10 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play221061076 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 221061076
		arg_321_1.duration_ = 11.566

		local var_321_0 = {
			ja = 11.566,
			ko = 8.766,
			zh = 8.766
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
				arg_321_0:Play221061077(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 0.975

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_2 = arg_321_1:FormatText(StoryNameCfg[379].name)

				arg_321_1.leftNameTxt_.text = var_324_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_3 = arg_321_1:GetWordFromCfg(221061076)
				local var_324_4 = arg_321_1:FormatText(var_324_3.content)

				arg_321_1.text_.text = var_324_4

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_5 = 39
				local var_324_6 = utf8.len(var_324_4)
				local var_324_7 = var_324_5 <= 0 and var_324_1 or var_324_1 * (var_324_6 / var_324_5)

				if var_324_7 > 0 and var_324_1 < var_324_7 then
					arg_321_1.talkMaxDuration = var_324_7

					if var_324_7 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_7 + var_324_0
					end
				end

				arg_321_1.text_.text = var_324_4
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061076", "story_v_out_221061.awb") ~= 0 then
					local var_324_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061076", "story_v_out_221061.awb") / 1000

					if var_324_8 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_8 + var_324_0
					end

					if var_324_3.prefab_name ~= "" and arg_321_1.actors_[var_324_3.prefab_name] ~= nil then
						local var_324_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_3.prefab_name].transform, "story_v_out_221061", "221061076", "story_v_out_221061.awb")

						arg_321_1:RecordAudio("221061076", var_324_9)
						arg_321_1:RecordAudio("221061076", var_324_9)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_221061", "221061076", "story_v_out_221061.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_221061", "221061076", "story_v_out_221061.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_10 = math.max(var_324_1, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_10 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_0) / var_324_10

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_10 and arg_321_1.time_ < var_324_0 + var_324_10 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play221061077 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 221061077
		arg_325_1.duration_ = 6.566

		local var_325_0 = {
			ja = 6.566,
			ko = 4.766,
			zh = 4.766
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
				arg_325_0:Play221061078(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 0.55

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_2 = arg_325_1:FormatText(StoryNameCfg[379].name)

				arg_325_1.leftNameTxt_.text = var_328_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_3 = arg_325_1:GetWordFromCfg(221061077)
				local var_328_4 = arg_325_1:FormatText(var_328_3.content)

				arg_325_1.text_.text = var_328_4

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_5 = 22
				local var_328_6 = utf8.len(var_328_4)
				local var_328_7 = var_328_5 <= 0 and var_328_1 or var_328_1 * (var_328_6 / var_328_5)

				if var_328_7 > 0 and var_328_1 < var_328_7 then
					arg_325_1.talkMaxDuration = var_328_7

					if var_328_7 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_7 + var_328_0
					end
				end

				arg_325_1.text_.text = var_328_4
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061077", "story_v_out_221061.awb") ~= 0 then
					local var_328_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061077", "story_v_out_221061.awb") / 1000

					if var_328_8 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_0
					end

					if var_328_3.prefab_name ~= "" and arg_325_1.actors_[var_328_3.prefab_name] ~= nil then
						local var_328_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_3.prefab_name].transform, "story_v_out_221061", "221061077", "story_v_out_221061.awb")

						arg_325_1:RecordAudio("221061077", var_328_9)
						arg_325_1:RecordAudio("221061077", var_328_9)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_221061", "221061077", "story_v_out_221061.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_221061", "221061077", "story_v_out_221061.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_10 = math.max(var_328_1, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_10 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_0) / var_328_10

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_10 and arg_325_1.time_ < var_328_0 + var_328_10 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play221061078 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 221061078
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play221061079(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 1.8

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, false)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_2 = arg_329_1:GetWordFromCfg(221061078)
				local var_332_3 = arg_329_1:FormatText(var_332_2.content)

				arg_329_1.text_.text = var_332_3

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_4 = 71
				local var_332_5 = utf8.len(var_332_3)
				local var_332_6 = var_332_4 <= 0 and var_332_1 or var_332_1 * (var_332_5 / var_332_4)

				if var_332_6 > 0 and var_332_1 < var_332_6 then
					arg_329_1.talkMaxDuration = var_332_6

					if var_332_6 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_6 + var_332_0
					end
				end

				arg_329_1.text_.text = var_332_3
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_7 = math.max(var_332_1, arg_329_1.talkMaxDuration)

			if var_332_0 <= arg_329_1.time_ and arg_329_1.time_ < var_332_0 + var_332_7 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_0) / var_332_7

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_0 + var_332_7 and arg_329_1.time_ < var_332_0 + var_332_7 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play221061079 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 221061079
		arg_333_1.duration_ = 10.3

		local var_333_0 = {
			ja = 9.366,
			ko = 10.3,
			zh = 10.3
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
				arg_333_0:Play221061080(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 2

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				local var_336_1 = manager.ui.mainCamera.transform.localPosition
				local var_336_2 = Vector3.New(0, 0, 10) + Vector3.New(var_336_1.x, var_336_1.y, 0)
				local var_336_3 = arg_333_1.bgs_.ST39

				var_336_3.transform.localPosition = var_336_2
				var_336_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_336_4 = var_336_3:GetComponent("SpriteRenderer")

				if var_336_4 and var_336_4.sprite then
					local var_336_5 = (var_336_3.transform.localPosition - var_336_1).z
					local var_336_6 = manager.ui.mainCameraCom_
					local var_336_7 = 2 * var_336_5 * Mathf.Tan(var_336_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_336_8 = var_336_7 * var_336_6.aspect
					local var_336_9 = var_336_4.sprite.bounds.size.x
					local var_336_10 = var_336_4.sprite.bounds.size.y
					local var_336_11 = var_336_8 / var_336_9
					local var_336_12 = var_336_7 / var_336_10
					local var_336_13 = var_336_12 < var_336_11 and var_336_11 or var_336_12

					var_336_3.transform.localScale = Vector3.New(var_336_13, var_336_13, 0)
				end

				for iter_336_0, iter_336_1 in pairs(arg_333_1.bgs_) do
					if iter_336_0 ~= "ST39" then
						iter_336_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_336_14 = 0

			if var_336_14 < arg_333_1.time_ and arg_333_1.time_ <= var_336_14 + arg_336_0 then
				arg_333_1.mask_.enabled = true
				arg_333_1.mask_.raycastTarget = true

				arg_333_1:SetGaussion(false)
			end

			local var_336_15 = 2

			if var_336_14 <= arg_333_1.time_ and arg_333_1.time_ < var_336_14 + var_336_15 then
				local var_336_16 = (arg_333_1.time_ - var_336_14) / var_336_15
				local var_336_17 = Color.New(0, 0, 0)

				var_336_17.a = Mathf.Lerp(0, 1, var_336_16)
				arg_333_1.mask_.color = var_336_17
			end

			if arg_333_1.time_ >= var_336_14 + var_336_15 and arg_333_1.time_ < var_336_14 + var_336_15 + arg_336_0 then
				local var_336_18 = Color.New(0, 0, 0)

				var_336_18.a = 1
				arg_333_1.mask_.color = var_336_18
			end

			local var_336_19 = 2

			if var_336_19 < arg_333_1.time_ and arg_333_1.time_ <= var_336_19 + arg_336_0 then
				arg_333_1.mask_.enabled = true
				arg_333_1.mask_.raycastTarget = true

				arg_333_1:SetGaussion(false)
			end

			local var_336_20 = 2

			if var_336_19 <= arg_333_1.time_ and arg_333_1.time_ < var_336_19 + var_336_20 then
				local var_336_21 = (arg_333_1.time_ - var_336_19) / var_336_20
				local var_336_22 = Color.New(0, 0, 0)

				var_336_22.a = Mathf.Lerp(1, 0, var_336_21)
				arg_333_1.mask_.color = var_336_22
			end

			if arg_333_1.time_ >= var_336_19 + var_336_20 and arg_333_1.time_ < var_336_19 + var_336_20 + arg_336_0 then
				local var_336_23 = Color.New(0, 0, 0)
				local var_336_24 = 0

				arg_333_1.mask_.enabled = false
				var_336_23.a = var_336_24
				arg_333_1.mask_.color = var_336_23
			end

			local var_336_25 = arg_333_1.actors_["1072ui_story"].transform
			local var_336_26 = 4

			if var_336_26 < arg_333_1.time_ and arg_333_1.time_ <= var_336_26 + arg_336_0 then
				arg_333_1.var_.moveOldPos1072ui_story = var_336_25.localPosition
			end

			local var_336_27 = 0.001

			if var_336_26 <= arg_333_1.time_ and arg_333_1.time_ < var_336_26 + var_336_27 then
				local var_336_28 = (arg_333_1.time_ - var_336_26) / var_336_27
				local var_336_29 = Vector3.New(-0.7, -0.71, -6)

				var_336_25.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1072ui_story, var_336_29, var_336_28)

				local var_336_30 = manager.ui.mainCamera.transform.position - var_336_25.position

				var_336_25.forward = Vector3.New(var_336_30.x, var_336_30.y, var_336_30.z)

				local var_336_31 = var_336_25.localEulerAngles

				var_336_31.z = 0
				var_336_31.x = 0
				var_336_25.localEulerAngles = var_336_31
			end

			if arg_333_1.time_ >= var_336_26 + var_336_27 and arg_333_1.time_ < var_336_26 + var_336_27 + arg_336_0 then
				var_336_25.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_336_32 = manager.ui.mainCamera.transform.position - var_336_25.position

				var_336_25.forward = Vector3.New(var_336_32.x, var_336_32.y, var_336_32.z)

				local var_336_33 = var_336_25.localEulerAngles

				var_336_33.z = 0
				var_336_33.x = 0
				var_336_25.localEulerAngles = var_336_33
			end

			local var_336_34 = arg_333_1.actors_["1072ui_story"]
			local var_336_35 = 4

			if var_336_35 < arg_333_1.time_ and arg_333_1.time_ <= var_336_35 + arg_336_0 and arg_333_1.var_.characterEffect1072ui_story == nil then
				arg_333_1.var_.characterEffect1072ui_story = var_336_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_36 = 0.200000002980232

			if var_336_35 <= arg_333_1.time_ and arg_333_1.time_ < var_336_35 + var_336_36 then
				local var_336_37 = (arg_333_1.time_ - var_336_35) / var_336_36

				if arg_333_1.var_.characterEffect1072ui_story then
					arg_333_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_35 + var_336_36 and arg_333_1.time_ < var_336_35 + var_336_36 + arg_336_0 and arg_333_1.var_.characterEffect1072ui_story then
				arg_333_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_336_38 = 4

			if var_336_38 < arg_333_1.time_ and arg_333_1.time_ <= var_336_38 + arg_336_0 then
				arg_333_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_336_39 = 4

			if var_336_39 < arg_333_1.time_ and arg_333_1.time_ <= var_336_39 + arg_336_0 then
				arg_333_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_333_1.frameCnt_ <= 1 then
				arg_333_1.dialog_:SetActive(false)
			end

			local var_336_40 = 4
			local var_336_41 = 0.8

			if var_336_40 < arg_333_1.time_ and arg_333_1.time_ <= var_336_40 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0

				arg_333_1.dialog_:SetActive(true)

				local var_336_42 = LeanTween.value(arg_333_1.dialog_, 0, 1, 0.3)

				var_336_42:setOnUpdate(LuaHelper.FloatAction(function(arg_337_0)
					arg_333_1.dialogCg_.alpha = arg_337_0
				end))
				var_336_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_333_1.dialog_)
					var_336_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_333_1.duration_ = arg_333_1.duration_ + 0.3

				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_43 = arg_333_1:FormatText(StoryNameCfg[379].name)

				arg_333_1.leftNameTxt_.text = var_336_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_44 = arg_333_1:GetWordFromCfg(221061079)
				local var_336_45 = arg_333_1:FormatText(var_336_44.content)

				arg_333_1.text_.text = var_336_45

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_46 = 32
				local var_336_47 = utf8.len(var_336_45)
				local var_336_48 = var_336_46 <= 0 and var_336_41 or var_336_41 * (var_336_47 / var_336_46)

				if var_336_48 > 0 and var_336_41 < var_336_48 then
					arg_333_1.talkMaxDuration = var_336_48
					var_336_40 = var_336_40 + 0.3

					if var_336_48 + var_336_40 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_48 + var_336_40
					end
				end

				arg_333_1.text_.text = var_336_45
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061079", "story_v_out_221061.awb") ~= 0 then
					local var_336_49 = manager.audio:GetVoiceLength("story_v_out_221061", "221061079", "story_v_out_221061.awb") / 1000

					if var_336_49 + var_336_40 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_49 + var_336_40
					end

					if var_336_44.prefab_name ~= "" and arg_333_1.actors_[var_336_44.prefab_name] ~= nil then
						local var_336_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_44.prefab_name].transform, "story_v_out_221061", "221061079", "story_v_out_221061.awb")

						arg_333_1:RecordAudio("221061079", var_336_50)
						arg_333_1:RecordAudio("221061079", var_336_50)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_221061", "221061079", "story_v_out_221061.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_221061", "221061079", "story_v_out_221061.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_51 = var_336_40 + 0.3
			local var_336_52 = math.max(var_336_41, arg_333_1.talkMaxDuration)

			if var_336_51 <= arg_333_1.time_ and arg_333_1.time_ < var_336_51 + var_336_52 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_51) / var_336_52

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_51 + var_336_52 and arg_333_1.time_ < var_336_51 + var_336_52 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play221061080 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 221061080
		arg_339_1.duration_ = 5.866

		local var_339_0 = {
			ja = 5.866,
			ko = 3.466,
			zh = 3.466
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
				arg_339_0:Play221061081(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1076ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1076ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(0.7, -1.06, -6.2)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1076ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["1076ui_story"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and arg_339_1.var_.characterEffect1076ui_story == nil then
				arg_339_1.var_.characterEffect1076ui_story = var_342_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_11 = 0.200000002980232

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.characterEffect1076ui_story then
					arg_339_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and arg_339_1.var_.characterEffect1076ui_story then
				arg_339_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_342_13 = 0

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action4_1")
			end

			local var_342_14 = 0

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				arg_339_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_342_15 = arg_339_1.actors_["1072ui_story"]
			local var_342_16 = 0

			if var_342_16 < arg_339_1.time_ and arg_339_1.time_ <= var_342_16 + arg_342_0 and arg_339_1.var_.characterEffect1072ui_story == nil then
				arg_339_1.var_.characterEffect1072ui_story = var_342_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_17 = 0.200000002980232

			if var_342_16 <= arg_339_1.time_ and arg_339_1.time_ < var_342_16 + var_342_17 then
				local var_342_18 = (arg_339_1.time_ - var_342_16) / var_342_17

				if arg_339_1.var_.characterEffect1072ui_story then
					local var_342_19 = Mathf.Lerp(0, 0.5, var_342_18)

					arg_339_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_339_1.var_.characterEffect1072ui_story.fillRatio = var_342_19
				end
			end

			if arg_339_1.time_ >= var_342_16 + var_342_17 and arg_339_1.time_ < var_342_16 + var_342_17 + arg_342_0 and arg_339_1.var_.characterEffect1072ui_story then
				local var_342_20 = 0.5

				arg_339_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_339_1.var_.characterEffect1072ui_story.fillRatio = var_342_20
			end

			local var_342_21 = 0
			local var_342_22 = 0.45

			if var_342_21 < arg_339_1.time_ and arg_339_1.time_ <= var_342_21 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_23 = arg_339_1:FormatText(StoryNameCfg[389].name)

				arg_339_1.leftNameTxt_.text = var_342_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_24 = arg_339_1:GetWordFromCfg(221061080)
				local var_342_25 = arg_339_1:FormatText(var_342_24.content)

				arg_339_1.text_.text = var_342_25

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_26 = 18
				local var_342_27 = utf8.len(var_342_25)
				local var_342_28 = var_342_26 <= 0 and var_342_22 or var_342_22 * (var_342_27 / var_342_26)

				if var_342_28 > 0 and var_342_22 < var_342_28 then
					arg_339_1.talkMaxDuration = var_342_28

					if var_342_28 + var_342_21 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_28 + var_342_21
					end
				end

				arg_339_1.text_.text = var_342_25
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061080", "story_v_out_221061.awb") ~= 0 then
					local var_342_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061080", "story_v_out_221061.awb") / 1000

					if var_342_29 + var_342_21 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_29 + var_342_21
					end

					if var_342_24.prefab_name ~= "" and arg_339_1.actors_[var_342_24.prefab_name] ~= nil then
						local var_342_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_24.prefab_name].transform, "story_v_out_221061", "221061080", "story_v_out_221061.awb")

						arg_339_1:RecordAudio("221061080", var_342_30)
						arg_339_1:RecordAudio("221061080", var_342_30)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_221061", "221061080", "story_v_out_221061.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_221061", "221061080", "story_v_out_221061.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_31 = math.max(var_342_22, arg_339_1.talkMaxDuration)

			if var_342_21 <= arg_339_1.time_ and arg_339_1.time_ < var_342_21 + var_342_31 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_21) / var_342_31

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_21 + var_342_31 and arg_339_1.time_ < var_342_21 + var_342_31 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play221061081 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 221061081
		arg_343_1.duration_ = 7.2

		local var_343_0 = {
			ja = 7.2,
			ko = 6,
			zh = 6
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
				arg_343_0:Play221061082(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1072ui_story"].transform
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1.var_.moveOldPos1072ui_story = var_346_0.localPosition
			end

			local var_346_2 = 0.001

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2
				local var_346_4 = Vector3.New(-0.7, -0.71, -6)

				var_346_0.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1072ui_story, var_346_4, var_346_3)

				local var_346_5 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_5.x, var_346_5.y, var_346_5.z)

				local var_346_6 = var_346_0.localEulerAngles

				var_346_6.z = 0
				var_346_6.x = 0
				var_346_0.localEulerAngles = var_346_6
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 then
				var_346_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_346_7 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_7.x, var_346_7.y, var_346_7.z)

				local var_346_8 = var_346_0.localEulerAngles

				var_346_8.z = 0
				var_346_8.x = 0
				var_346_0.localEulerAngles = var_346_8
			end

			local var_346_9 = arg_343_1.actors_["1072ui_story"]
			local var_346_10 = 0

			if var_346_10 < arg_343_1.time_ and arg_343_1.time_ <= var_346_10 + arg_346_0 and arg_343_1.var_.characterEffect1072ui_story == nil then
				arg_343_1.var_.characterEffect1072ui_story = var_346_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_11 = 0.200000002980232

			if var_346_10 <= arg_343_1.time_ and arg_343_1.time_ < var_346_10 + var_346_11 then
				local var_346_12 = (arg_343_1.time_ - var_346_10) / var_346_11

				if arg_343_1.var_.characterEffect1072ui_story then
					arg_343_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_10 + var_346_11 and arg_343_1.time_ < var_346_10 + var_346_11 + arg_346_0 and arg_343_1.var_.characterEffect1072ui_story then
				arg_343_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_346_13 = 0

			if var_346_13 < arg_343_1.time_ and arg_343_1.time_ <= var_346_13 + arg_346_0 then
				arg_343_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_346_14 = 0

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 then
				arg_343_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_346_15 = arg_343_1.actors_["1076ui_story"]
			local var_346_16 = 0

			if var_346_16 < arg_343_1.time_ and arg_343_1.time_ <= var_346_16 + arg_346_0 and arg_343_1.var_.characterEffect1076ui_story == nil then
				arg_343_1.var_.characterEffect1076ui_story = var_346_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_17 = 0.200000002980232

			if var_346_16 <= arg_343_1.time_ and arg_343_1.time_ < var_346_16 + var_346_17 then
				local var_346_18 = (arg_343_1.time_ - var_346_16) / var_346_17

				if arg_343_1.var_.characterEffect1076ui_story then
					local var_346_19 = Mathf.Lerp(0, 0.5, var_346_18)

					arg_343_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1076ui_story.fillRatio = var_346_19
				end
			end

			if arg_343_1.time_ >= var_346_16 + var_346_17 and arg_343_1.time_ < var_346_16 + var_346_17 + arg_346_0 and arg_343_1.var_.characterEffect1076ui_story then
				local var_346_20 = 0.5

				arg_343_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1076ui_story.fillRatio = var_346_20
			end

			local var_346_21 = 0
			local var_346_22 = 0.55

			if var_346_21 < arg_343_1.time_ and arg_343_1.time_ <= var_346_21 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_23 = arg_343_1:FormatText(StoryNameCfg[379].name)

				arg_343_1.leftNameTxt_.text = var_346_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_24 = arg_343_1:GetWordFromCfg(221061081)
				local var_346_25 = arg_343_1:FormatText(var_346_24.content)

				arg_343_1.text_.text = var_346_25

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_26 = 22
				local var_346_27 = utf8.len(var_346_25)
				local var_346_28 = var_346_26 <= 0 and var_346_22 or var_346_22 * (var_346_27 / var_346_26)

				if var_346_28 > 0 and var_346_22 < var_346_28 then
					arg_343_1.talkMaxDuration = var_346_28

					if var_346_28 + var_346_21 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_28 + var_346_21
					end
				end

				arg_343_1.text_.text = var_346_25
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061081", "story_v_out_221061.awb") ~= 0 then
					local var_346_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061081", "story_v_out_221061.awb") / 1000

					if var_346_29 + var_346_21 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_29 + var_346_21
					end

					if var_346_24.prefab_name ~= "" and arg_343_1.actors_[var_346_24.prefab_name] ~= nil then
						local var_346_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_24.prefab_name].transform, "story_v_out_221061", "221061081", "story_v_out_221061.awb")

						arg_343_1:RecordAudio("221061081", var_346_30)
						arg_343_1:RecordAudio("221061081", var_346_30)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_221061", "221061081", "story_v_out_221061.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_221061", "221061081", "story_v_out_221061.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_31 = math.max(var_346_22, arg_343_1.talkMaxDuration)

			if var_346_21 <= arg_343_1.time_ and arg_343_1.time_ < var_346_21 + var_346_31 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_21) / var_346_31

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_21 + var_346_31 and arg_343_1.time_ < var_346_21 + var_346_31 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play221061082 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 221061082
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play221061083(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1072ui_story"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos1072ui_story = var_350_0.localPosition
			end

			local var_350_2 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2
				local var_350_4 = Vector3.New(0, 100, 0)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1072ui_story, var_350_4, var_350_3)

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

			local var_350_9 = arg_347_1.actors_["1072ui_story"]
			local var_350_10 = 0

			if var_350_10 < arg_347_1.time_ and arg_347_1.time_ <= var_350_10 + arg_350_0 and arg_347_1.var_.characterEffect1072ui_story == nil then
				arg_347_1.var_.characterEffect1072ui_story = var_350_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_11 = 0.200000002980232

			if var_350_10 <= arg_347_1.time_ and arg_347_1.time_ < var_350_10 + var_350_11 then
				local var_350_12 = (arg_347_1.time_ - var_350_10) / var_350_11

				if arg_347_1.var_.characterEffect1072ui_story then
					local var_350_13 = Mathf.Lerp(0, 0.5, var_350_12)

					arg_347_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_347_1.var_.characterEffect1072ui_story.fillRatio = var_350_13
				end
			end

			if arg_347_1.time_ >= var_350_10 + var_350_11 and arg_347_1.time_ < var_350_10 + var_350_11 + arg_350_0 and arg_347_1.var_.characterEffect1072ui_story then
				local var_350_14 = 0.5

				arg_347_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_347_1.var_.characterEffect1072ui_story.fillRatio = var_350_14
			end

			local var_350_15 = arg_347_1.actors_["1076ui_story"].transform
			local var_350_16 = 0

			if var_350_16 < arg_347_1.time_ and arg_347_1.time_ <= var_350_16 + arg_350_0 then
				arg_347_1.var_.moveOldPos1076ui_story = var_350_15.localPosition
			end

			local var_350_17 = 0.001

			if var_350_16 <= arg_347_1.time_ and arg_347_1.time_ < var_350_16 + var_350_17 then
				local var_350_18 = (arg_347_1.time_ - var_350_16) / var_350_17
				local var_350_19 = Vector3.New(0, 100, 0)

				var_350_15.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1076ui_story, var_350_19, var_350_18)

				local var_350_20 = manager.ui.mainCamera.transform.position - var_350_15.position

				var_350_15.forward = Vector3.New(var_350_20.x, var_350_20.y, var_350_20.z)

				local var_350_21 = var_350_15.localEulerAngles

				var_350_21.z = 0
				var_350_21.x = 0
				var_350_15.localEulerAngles = var_350_21
			end

			if arg_347_1.time_ >= var_350_16 + var_350_17 and arg_347_1.time_ < var_350_16 + var_350_17 + arg_350_0 then
				var_350_15.localPosition = Vector3.New(0, 100, 0)

				local var_350_22 = manager.ui.mainCamera.transform.position - var_350_15.position

				var_350_15.forward = Vector3.New(var_350_22.x, var_350_22.y, var_350_22.z)

				local var_350_23 = var_350_15.localEulerAngles

				var_350_23.z = 0
				var_350_23.x = 0
				var_350_15.localEulerAngles = var_350_23
			end

			local var_350_24 = arg_347_1.actors_["1076ui_story"]
			local var_350_25 = 0

			if var_350_25 < arg_347_1.time_ and arg_347_1.time_ <= var_350_25 + arg_350_0 and arg_347_1.var_.characterEffect1076ui_story == nil then
				arg_347_1.var_.characterEffect1076ui_story = var_350_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_26 = 0.200000002980232

			if var_350_25 <= arg_347_1.time_ and arg_347_1.time_ < var_350_25 + var_350_26 then
				local var_350_27 = (arg_347_1.time_ - var_350_25) / var_350_26

				if arg_347_1.var_.characterEffect1076ui_story then
					local var_350_28 = Mathf.Lerp(0, 0.5, var_350_27)

					arg_347_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_347_1.var_.characterEffect1076ui_story.fillRatio = var_350_28
				end
			end

			if arg_347_1.time_ >= var_350_25 + var_350_26 and arg_347_1.time_ < var_350_25 + var_350_26 + arg_350_0 and arg_347_1.var_.characterEffect1076ui_story then
				local var_350_29 = 0.5

				arg_347_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_347_1.var_.characterEffect1076ui_story.fillRatio = var_350_29
			end

			local var_350_30 = 0
			local var_350_31 = 0.925

			if var_350_30 < arg_347_1.time_ and arg_347_1.time_ <= var_350_30 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, false)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_32 = arg_347_1:GetWordFromCfg(221061082)
				local var_350_33 = arg_347_1:FormatText(var_350_32.content)

				arg_347_1.text_.text = var_350_33

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_34 = 37
				local var_350_35 = utf8.len(var_350_33)
				local var_350_36 = var_350_34 <= 0 and var_350_31 or var_350_31 * (var_350_35 / var_350_34)

				if var_350_36 > 0 and var_350_31 < var_350_36 then
					arg_347_1.talkMaxDuration = var_350_36

					if var_350_36 + var_350_30 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_36 + var_350_30
					end
				end

				arg_347_1.text_.text = var_350_33
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_37 = math.max(var_350_31, arg_347_1.talkMaxDuration)

			if var_350_30 <= arg_347_1.time_ and arg_347_1.time_ < var_350_30 + var_350_37 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_30) / var_350_37

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_30 + var_350_37 and arg_347_1.time_ < var_350_30 + var_350_37 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play221061083 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 221061083
		arg_351_1.duration_ = 9

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play221061084(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = "ST31a"

			if arg_351_1.bgs_[var_354_0] == nil then
				local var_354_1 = Object.Instantiate(arg_351_1.paintGo_)

				var_354_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_354_0)
				var_354_1.name = var_354_0
				var_354_1.transform.parent = arg_351_1.stage_.transform
				var_354_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_351_1.bgs_[var_354_0] = var_354_1
			end

			local var_354_2 = 2

			if var_354_2 < arg_351_1.time_ and arg_351_1.time_ <= var_354_2 + arg_354_0 then
				local var_354_3 = manager.ui.mainCamera.transform.localPosition
				local var_354_4 = Vector3.New(0, 0, 10) + Vector3.New(var_354_3.x, var_354_3.y, 0)
				local var_354_5 = arg_351_1.bgs_.ST31a

				var_354_5.transform.localPosition = var_354_4
				var_354_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_354_6 = var_354_5:GetComponent("SpriteRenderer")

				if var_354_6 and var_354_6.sprite then
					local var_354_7 = (var_354_5.transform.localPosition - var_354_3).z
					local var_354_8 = manager.ui.mainCameraCom_
					local var_354_9 = 2 * var_354_7 * Mathf.Tan(var_354_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_354_10 = var_354_9 * var_354_8.aspect
					local var_354_11 = var_354_6.sprite.bounds.size.x
					local var_354_12 = var_354_6.sprite.bounds.size.y
					local var_354_13 = var_354_10 / var_354_11
					local var_354_14 = var_354_9 / var_354_12
					local var_354_15 = var_354_14 < var_354_13 and var_354_13 or var_354_14

					var_354_5.transform.localScale = Vector3.New(var_354_15, var_354_15, 0)
				end

				for iter_354_0, iter_354_1 in pairs(arg_351_1.bgs_) do
					if iter_354_0 ~= "ST31a" then
						iter_354_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_354_16 = 0

			if var_354_16 < arg_351_1.time_ and arg_351_1.time_ <= var_354_16 + arg_354_0 then
				arg_351_1.mask_.enabled = true
				arg_351_1.mask_.raycastTarget = true

				arg_351_1:SetGaussion(false)
			end

			local var_354_17 = 2

			if var_354_16 <= arg_351_1.time_ and arg_351_1.time_ < var_354_16 + var_354_17 then
				local var_354_18 = (arg_351_1.time_ - var_354_16) / var_354_17
				local var_354_19 = Color.New(0, 0, 0)

				var_354_19.a = Mathf.Lerp(0, 1, var_354_18)
				arg_351_1.mask_.color = var_354_19
			end

			if arg_351_1.time_ >= var_354_16 + var_354_17 and arg_351_1.time_ < var_354_16 + var_354_17 + arg_354_0 then
				local var_354_20 = Color.New(0, 0, 0)

				var_354_20.a = 1
				arg_351_1.mask_.color = var_354_20
			end

			local var_354_21 = 2

			if var_354_21 < arg_351_1.time_ and arg_351_1.time_ <= var_354_21 + arg_354_0 then
				arg_351_1.mask_.enabled = true
				arg_351_1.mask_.raycastTarget = true

				arg_351_1:SetGaussion(false)
			end

			local var_354_22 = 2

			if var_354_21 <= arg_351_1.time_ and arg_351_1.time_ < var_354_21 + var_354_22 then
				local var_354_23 = (arg_351_1.time_ - var_354_21) / var_354_22
				local var_354_24 = Color.New(0, 0, 0)

				var_354_24.a = Mathf.Lerp(1, 0, var_354_23)
				arg_351_1.mask_.color = var_354_24
			end

			if arg_351_1.time_ >= var_354_21 + var_354_22 and arg_351_1.time_ < var_354_21 + var_354_22 + arg_354_0 then
				local var_354_25 = Color.New(0, 0, 0)
				local var_354_26 = 0

				arg_351_1.mask_.enabled = false
				var_354_25.a = var_354_26
				arg_351_1.mask_.color = var_354_25
			end

			local var_354_27 = 1.53333333333333
			local var_354_28 = 1

			if var_354_27 < arg_351_1.time_ and arg_351_1.time_ <= var_354_27 + arg_354_0 then
				local var_354_29 = "play"
				local var_354_30 = "effect"

				arg_351_1:AudioAction(var_354_29, var_354_30, "se_story_side_1096", "se_story_1096_crowd_loop", "")
			end

			local var_354_31 = 0.8
			local var_354_32 = 1

			if var_354_31 < arg_351_1.time_ and arg_351_1.time_ <= var_354_31 + arg_354_0 then
				local var_354_33 = "play"
				local var_354_34 = "music"

				arg_351_1:AudioAction(var_354_33, var_354_34, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")
			end

			local var_354_35 = 0
			local var_354_36 = 0.6

			if var_354_35 < arg_351_1.time_ and arg_351_1.time_ <= var_354_35 + arg_354_0 then
				local var_354_37 = "play"
				local var_354_38 = "music"

				arg_351_1:AudioAction(var_354_37, var_354_38, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_351_1.frameCnt_ <= 1 then
				arg_351_1.dialog_:SetActive(false)
			end

			local var_354_39 = 4
			local var_354_40 = 1

			if var_354_39 < arg_351_1.time_ and arg_351_1.time_ <= var_354_39 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0

				arg_351_1.dialog_:SetActive(true)

				local var_354_41 = LeanTween.value(arg_351_1.dialog_, 0, 1, 0.3)

				var_354_41:setOnUpdate(LuaHelper.FloatAction(function(arg_355_0)
					arg_351_1.dialogCg_.alpha = arg_355_0
				end))
				var_354_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_351_1.dialog_)
					var_354_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_351_1.duration_ = arg_351_1.duration_ + 0.3

				SetActive(arg_351_1.leftNameGo_, false)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_42 = arg_351_1:GetWordFromCfg(221061083)
				local var_354_43 = arg_351_1:FormatText(var_354_42.content)

				arg_351_1.text_.text = var_354_43

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_44 = 40
				local var_354_45 = utf8.len(var_354_43)
				local var_354_46 = var_354_44 <= 0 and var_354_40 or var_354_40 * (var_354_45 / var_354_44)

				if var_354_46 > 0 and var_354_40 < var_354_46 then
					arg_351_1.talkMaxDuration = var_354_46
					var_354_39 = var_354_39 + 0.3

					if var_354_46 + var_354_39 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_46 + var_354_39
					end
				end

				arg_351_1.text_.text = var_354_43
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_47 = var_354_39 + 0.3
			local var_354_48 = math.max(var_354_40, arg_351_1.talkMaxDuration)

			if var_354_47 <= arg_351_1.time_ and arg_351_1.time_ < var_354_47 + var_354_48 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_47) / var_354_48

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_47 + var_354_48 and arg_351_1.time_ < var_354_47 + var_354_48 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play221061084 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 221061084
		arg_357_1.duration_ = 5

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play221061085(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 0.725

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, false)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_2 = arg_357_1:GetWordFromCfg(221061084)
				local var_360_3 = arg_357_1:FormatText(var_360_2.content)

				arg_357_1.text_.text = var_360_3

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_4 = 29
				local var_360_5 = utf8.len(var_360_3)
				local var_360_6 = var_360_4 <= 0 and var_360_1 or var_360_1 * (var_360_5 / var_360_4)

				if var_360_6 > 0 and var_360_1 < var_360_6 then
					arg_357_1.talkMaxDuration = var_360_6

					if var_360_6 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_6 + var_360_0
					end
				end

				arg_357_1.text_.text = var_360_3
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)
				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_7 = math.max(var_360_1, arg_357_1.talkMaxDuration)

			if var_360_0 <= arg_357_1.time_ and arg_357_1.time_ < var_360_0 + var_360_7 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_0) / var_360_7

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_0 + var_360_7 and arg_357_1.time_ < var_360_0 + var_360_7 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play221061085 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 221061085
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play221061086(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 1.1

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, false)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_2 = arg_361_1:GetWordFromCfg(221061085)
				local var_364_3 = arg_361_1:FormatText(var_364_2.content)

				arg_361_1.text_.text = var_364_3

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_4 = 44
				local var_364_5 = utf8.len(var_364_3)
				local var_364_6 = var_364_4 <= 0 and var_364_1 or var_364_1 * (var_364_5 / var_364_4)

				if var_364_6 > 0 and var_364_1 < var_364_6 then
					arg_361_1.talkMaxDuration = var_364_6

					if var_364_6 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_6 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_3
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_7 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_7 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_7

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_7 and arg_361_1.time_ < var_364_0 + var_364_7 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play221061086 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 221061086
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play221061087(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.725

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, false)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_2 = arg_365_1:GetWordFromCfg(221061086)
				local var_368_3 = arg_365_1:FormatText(var_368_2.content)

				arg_365_1.text_.text = var_368_3

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_4 = 29
				local var_368_5 = utf8.len(var_368_3)
				local var_368_6 = var_368_4 <= 0 and var_368_1 or var_368_1 * (var_368_5 / var_368_4)

				if var_368_6 > 0 and var_368_1 < var_368_6 then
					arg_365_1.talkMaxDuration = var_368_6

					if var_368_6 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_6 + var_368_0
					end
				end

				arg_365_1.text_.text = var_368_3
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_7 = math.max(var_368_1, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_7 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_0) / var_368_7

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_7 and arg_365_1.time_ < var_368_0 + var_368_7 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play221061087 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 221061087
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play221061088(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.9

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, false)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_2 = arg_369_1:GetWordFromCfg(221061087)
				local var_372_3 = arg_369_1:FormatText(var_372_2.content)

				arg_369_1.text_.text = var_372_3

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_4 = 36
				local var_372_5 = utf8.len(var_372_3)
				local var_372_6 = var_372_4 <= 0 and var_372_1 or var_372_1 * (var_372_5 / var_372_4)

				if var_372_6 > 0 and var_372_1 < var_372_6 then
					arg_369_1.talkMaxDuration = var_372_6

					if var_372_6 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_6 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_3
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_7 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_7 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_7

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_7 and arg_369_1.time_ < var_372_0 + var_372_7 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play221061088 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 221061088
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play221061089(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.875

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, false)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_2 = arg_373_1:GetWordFromCfg(221061088)
				local var_376_3 = arg_373_1:FormatText(var_376_2.content)

				arg_373_1.text_.text = var_376_3

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_4 = 35
				local var_376_5 = utf8.len(var_376_3)
				local var_376_6 = var_376_4 <= 0 and var_376_1 or var_376_1 * (var_376_5 / var_376_4)

				if var_376_6 > 0 and var_376_1 < var_376_6 then
					arg_373_1.talkMaxDuration = var_376_6

					if var_376_6 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_6 + var_376_0
					end
				end

				arg_373_1.text_.text = var_376_3
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_7 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_7 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_7

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_7 and arg_373_1.time_ < var_376_0 + var_376_7 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play221061089 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 221061089
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play221061090(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 0.8

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_2 = arg_377_1:GetWordFromCfg(221061089)
				local var_380_3 = arg_377_1:FormatText(var_380_2.content)

				arg_377_1.text_.text = var_380_3

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_4 = 32
				local var_380_5 = utf8.len(var_380_3)
				local var_380_6 = var_380_4 <= 0 and var_380_1 or var_380_1 * (var_380_5 / var_380_4)

				if var_380_6 > 0 and var_380_1 < var_380_6 then
					arg_377_1.talkMaxDuration = var_380_6

					if var_380_6 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_6 + var_380_0
					end
				end

				arg_377_1.text_.text = var_380_3
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_7 = math.max(var_380_1, arg_377_1.talkMaxDuration)

			if var_380_0 <= arg_377_1.time_ and arg_377_1.time_ < var_380_0 + var_380_7 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_0) / var_380_7

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_0 + var_380_7 and arg_377_1.time_ < var_380_0 + var_380_7 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play221061090 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 221061090
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play221061091(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.1

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, false)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_2 = arg_381_1:GetWordFromCfg(221061090)
				local var_384_3 = arg_381_1:FormatText(var_384_2.content)

				arg_381_1.text_.text = var_384_3

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_4 = 4
				local var_384_5 = utf8.len(var_384_3)
				local var_384_6 = var_384_4 <= 0 and var_384_1 or var_384_1 * (var_384_5 / var_384_4)

				if var_384_6 > 0 and var_384_1 < var_384_6 then
					arg_381_1.talkMaxDuration = var_384_6

					if var_384_6 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_6 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_3
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_7 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_7 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_7

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_7 and arg_381_1.time_ < var_384_0 + var_384_7 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play221061091 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 221061091
		arg_385_1.duration_ = 2.366

		local var_385_0 = {
			ja = 2.366,
			ko = 1.266,
			zh = 1.266
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
				arg_385_0:Play221061092(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1072ui_story"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos1072ui_story = var_388_0.localPosition
			end

			local var_388_2 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2
				local var_388_4 = Vector3.New(0, -0.71, -6)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1072ui_story, var_388_4, var_388_3)

				local var_388_5 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_5.x, var_388_5.y, var_388_5.z)

				local var_388_6 = var_388_0.localEulerAngles

				var_388_6.z = 0
				var_388_6.x = 0
				var_388_0.localEulerAngles = var_388_6
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_388_7 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_7.x, var_388_7.y, var_388_7.z)

				local var_388_8 = var_388_0.localEulerAngles

				var_388_8.z = 0
				var_388_8.x = 0
				var_388_0.localEulerAngles = var_388_8
			end

			local var_388_9 = arg_385_1.actors_["1072ui_story"]
			local var_388_10 = 0

			if var_388_10 < arg_385_1.time_ and arg_385_1.time_ <= var_388_10 + arg_388_0 and arg_385_1.var_.characterEffect1072ui_story == nil then
				arg_385_1.var_.characterEffect1072ui_story = var_388_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_11 = 0.200000002980232

			if var_388_10 <= arg_385_1.time_ and arg_385_1.time_ < var_388_10 + var_388_11 then
				local var_388_12 = (arg_385_1.time_ - var_388_10) / var_388_11

				if arg_385_1.var_.characterEffect1072ui_story then
					arg_385_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_385_1.time_ >= var_388_10 + var_388_11 and arg_385_1.time_ < var_388_10 + var_388_11 + arg_388_0 and arg_385_1.var_.characterEffect1072ui_story then
				arg_385_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_388_13 = 0

			if var_388_13 < arg_385_1.time_ and arg_385_1.time_ <= var_388_13 + arg_388_0 then
				arg_385_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_388_14 = 0

			if var_388_14 < arg_385_1.time_ and arg_385_1.time_ <= var_388_14 + arg_388_0 then
				arg_385_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_388_15 = 0
			local var_388_16 = 0.075

			if var_388_15 < arg_385_1.time_ and arg_385_1.time_ <= var_388_15 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_17 = arg_385_1:FormatText(StoryNameCfg[379].name)

				arg_385_1.leftNameTxt_.text = var_388_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_18 = arg_385_1:GetWordFromCfg(221061091)
				local var_388_19 = arg_385_1:FormatText(var_388_18.content)

				arg_385_1.text_.text = var_388_19

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_20 = 3
				local var_388_21 = utf8.len(var_388_19)
				local var_388_22 = var_388_20 <= 0 and var_388_16 or var_388_16 * (var_388_21 / var_388_20)

				if var_388_22 > 0 and var_388_16 < var_388_22 then
					arg_385_1.talkMaxDuration = var_388_22

					if var_388_22 + var_388_15 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_22 + var_388_15
					end
				end

				arg_385_1.text_.text = var_388_19
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061091", "story_v_out_221061.awb") ~= 0 then
					local var_388_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061091", "story_v_out_221061.awb") / 1000

					if var_388_23 + var_388_15 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_23 + var_388_15
					end

					if var_388_18.prefab_name ~= "" and arg_385_1.actors_[var_388_18.prefab_name] ~= nil then
						local var_388_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_18.prefab_name].transform, "story_v_out_221061", "221061091", "story_v_out_221061.awb")

						arg_385_1:RecordAudio("221061091", var_388_24)
						arg_385_1:RecordAudio("221061091", var_388_24)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_221061", "221061091", "story_v_out_221061.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_221061", "221061091", "story_v_out_221061.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_25 = math.max(var_388_16, arg_385_1.talkMaxDuration)

			if var_388_15 <= arg_385_1.time_ and arg_385_1.time_ < var_388_15 + var_388_25 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_15) / var_388_25

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_15 + var_388_25 and arg_385_1.time_ < var_388_15 + var_388_25 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play221061092 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 221061092
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play221061093(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1072ui_story"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos1072ui_story = var_392_0.localPosition
			end

			local var_392_2 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2
				local var_392_4 = Vector3.New(0, 100, 0)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1072ui_story, var_392_4, var_392_3)

				local var_392_5 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_5.x, var_392_5.y, var_392_5.z)

				local var_392_6 = var_392_0.localEulerAngles

				var_392_6.z = 0
				var_392_6.x = 0
				var_392_0.localEulerAngles = var_392_6
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(0, 100, 0)

				local var_392_7 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_7.x, var_392_7.y, var_392_7.z)

				local var_392_8 = var_392_0.localEulerAngles

				var_392_8.z = 0
				var_392_8.x = 0
				var_392_0.localEulerAngles = var_392_8
			end

			local var_392_9 = arg_389_1.actors_["1072ui_story"]
			local var_392_10 = 0

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 and arg_389_1.var_.characterEffect1072ui_story == nil then
				arg_389_1.var_.characterEffect1072ui_story = var_392_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_11 = 0.200000002980232

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_11 then
				local var_392_12 = (arg_389_1.time_ - var_392_10) / var_392_11

				if arg_389_1.var_.characterEffect1072ui_story then
					local var_392_13 = Mathf.Lerp(0, 0.5, var_392_12)

					arg_389_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_389_1.var_.characterEffect1072ui_story.fillRatio = var_392_13
				end
			end

			if arg_389_1.time_ >= var_392_10 + var_392_11 and arg_389_1.time_ < var_392_10 + var_392_11 + arg_392_0 and arg_389_1.var_.characterEffect1072ui_story then
				local var_392_14 = 0.5

				arg_389_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_389_1.var_.characterEffect1072ui_story.fillRatio = var_392_14
			end

			local var_392_15 = 0
			local var_392_16 = 1.675

			if var_392_15 < arg_389_1.time_ and arg_389_1.time_ <= var_392_15 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, false)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_17 = arg_389_1:GetWordFromCfg(221061092)
				local var_392_18 = arg_389_1:FormatText(var_392_17.content)

				arg_389_1.text_.text = var_392_18

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_19 = 67
				local var_392_20 = utf8.len(var_392_18)
				local var_392_21 = var_392_19 <= 0 and var_392_16 or var_392_16 * (var_392_20 / var_392_19)

				if var_392_21 > 0 and var_392_16 < var_392_21 then
					arg_389_1.talkMaxDuration = var_392_21

					if var_392_21 + var_392_15 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_21 + var_392_15
					end
				end

				arg_389_1.text_.text = var_392_18
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_22 = math.max(var_392_16, arg_389_1.talkMaxDuration)

			if var_392_15 <= arg_389_1.time_ and arg_389_1.time_ < var_392_15 + var_392_22 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_15) / var_392_22

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_15 + var_392_22 and arg_389_1.time_ < var_392_15 + var_392_22 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play221061093 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 221061093
		arg_393_1.duration_ = 14.033

		local var_393_0 = {
			ja = 14.033,
			ko = 8.766,
			zh = 8.766
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
				arg_393_0:Play221061094(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1072ui_story"].transform
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 then
				arg_393_1.var_.moveOldPos1072ui_story = var_396_0.localPosition
			end

			local var_396_2 = 0.001

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2
				local var_396_4 = Vector3.New(0, -0.71, -6)

				var_396_0.localPosition = Vector3.Lerp(arg_393_1.var_.moveOldPos1072ui_story, var_396_4, var_396_3)

				local var_396_5 = manager.ui.mainCamera.transform.position - var_396_0.position

				var_396_0.forward = Vector3.New(var_396_5.x, var_396_5.y, var_396_5.z)

				local var_396_6 = var_396_0.localEulerAngles

				var_396_6.z = 0
				var_396_6.x = 0
				var_396_0.localEulerAngles = var_396_6
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 then
				var_396_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_396_7 = manager.ui.mainCamera.transform.position - var_396_0.position

				var_396_0.forward = Vector3.New(var_396_7.x, var_396_7.y, var_396_7.z)

				local var_396_8 = var_396_0.localEulerAngles

				var_396_8.z = 0
				var_396_8.x = 0
				var_396_0.localEulerAngles = var_396_8
			end

			local var_396_9 = arg_393_1.actors_["1072ui_story"]
			local var_396_10 = 0

			if var_396_10 < arg_393_1.time_ and arg_393_1.time_ <= var_396_10 + arg_396_0 and arg_393_1.var_.characterEffect1072ui_story == nil then
				arg_393_1.var_.characterEffect1072ui_story = var_396_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_11 = 0.200000002980232

			if var_396_10 <= arg_393_1.time_ and arg_393_1.time_ < var_396_10 + var_396_11 then
				local var_396_12 = (arg_393_1.time_ - var_396_10) / var_396_11

				if arg_393_1.var_.characterEffect1072ui_story then
					arg_393_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_393_1.time_ >= var_396_10 + var_396_11 and arg_393_1.time_ < var_396_10 + var_396_11 + arg_396_0 and arg_393_1.var_.characterEffect1072ui_story then
				arg_393_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_396_13 = 0

			if var_396_13 < arg_393_1.time_ and arg_393_1.time_ <= var_396_13 + arg_396_0 then
				arg_393_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_396_14 = 0

			if var_396_14 < arg_393_1.time_ and arg_393_1.time_ <= var_396_14 + arg_396_0 then
				arg_393_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_396_15 = 0
			local var_396_16 = 1.2

			if var_396_15 < arg_393_1.time_ and arg_393_1.time_ <= var_396_15 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_17 = arg_393_1:FormatText(StoryNameCfg[379].name)

				arg_393_1.leftNameTxt_.text = var_396_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_18 = arg_393_1:GetWordFromCfg(221061093)
				local var_396_19 = arg_393_1:FormatText(var_396_18.content)

				arg_393_1.text_.text = var_396_19

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_20 = 48
				local var_396_21 = utf8.len(var_396_19)
				local var_396_22 = var_396_20 <= 0 and var_396_16 or var_396_16 * (var_396_21 / var_396_20)

				if var_396_22 > 0 and var_396_16 < var_396_22 then
					arg_393_1.talkMaxDuration = var_396_22

					if var_396_22 + var_396_15 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_22 + var_396_15
					end
				end

				arg_393_1.text_.text = var_396_19
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061093", "story_v_out_221061.awb") ~= 0 then
					local var_396_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061093", "story_v_out_221061.awb") / 1000

					if var_396_23 + var_396_15 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_23 + var_396_15
					end

					if var_396_18.prefab_name ~= "" and arg_393_1.actors_[var_396_18.prefab_name] ~= nil then
						local var_396_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_18.prefab_name].transform, "story_v_out_221061", "221061093", "story_v_out_221061.awb")

						arg_393_1:RecordAudio("221061093", var_396_24)
						arg_393_1:RecordAudio("221061093", var_396_24)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_221061", "221061093", "story_v_out_221061.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_221061", "221061093", "story_v_out_221061.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_25 = math.max(var_396_16, arg_393_1.talkMaxDuration)

			if var_396_15 <= arg_393_1.time_ and arg_393_1.time_ < var_396_15 + var_396_25 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_15) / var_396_25

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_15 + var_396_25 and arg_393_1.time_ < var_396_15 + var_396_25 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play221061094 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 221061094
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play221061095(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1072ui_story"].transform
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 then
				arg_397_1.var_.moveOldPos1072ui_story = var_400_0.localPosition
			end

			local var_400_2 = 0.001

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2
				local var_400_4 = Vector3.New(0, 100, 0)

				var_400_0.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos1072ui_story, var_400_4, var_400_3)

				local var_400_5 = manager.ui.mainCamera.transform.position - var_400_0.position

				var_400_0.forward = Vector3.New(var_400_5.x, var_400_5.y, var_400_5.z)

				local var_400_6 = var_400_0.localEulerAngles

				var_400_6.z = 0
				var_400_6.x = 0
				var_400_0.localEulerAngles = var_400_6
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 then
				var_400_0.localPosition = Vector3.New(0, 100, 0)

				local var_400_7 = manager.ui.mainCamera.transform.position - var_400_0.position

				var_400_0.forward = Vector3.New(var_400_7.x, var_400_7.y, var_400_7.z)

				local var_400_8 = var_400_0.localEulerAngles

				var_400_8.z = 0
				var_400_8.x = 0
				var_400_0.localEulerAngles = var_400_8
			end

			local var_400_9 = arg_397_1.actors_["1072ui_story"]
			local var_400_10 = 0

			if var_400_10 < arg_397_1.time_ and arg_397_1.time_ <= var_400_10 + arg_400_0 and arg_397_1.var_.characterEffect1072ui_story == nil then
				arg_397_1.var_.characterEffect1072ui_story = var_400_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_11 = 0.200000002980232

			if var_400_10 <= arg_397_1.time_ and arg_397_1.time_ < var_400_10 + var_400_11 then
				local var_400_12 = (arg_397_1.time_ - var_400_10) / var_400_11

				if arg_397_1.var_.characterEffect1072ui_story then
					local var_400_13 = Mathf.Lerp(0, 0.5, var_400_12)

					arg_397_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_397_1.var_.characterEffect1072ui_story.fillRatio = var_400_13
				end
			end

			if arg_397_1.time_ >= var_400_10 + var_400_11 and arg_397_1.time_ < var_400_10 + var_400_11 + arg_400_0 and arg_397_1.var_.characterEffect1072ui_story then
				local var_400_14 = 0.5

				arg_397_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_397_1.var_.characterEffect1072ui_story.fillRatio = var_400_14
			end

			local var_400_15 = 0
			local var_400_16 = 1.025

			if var_400_15 < arg_397_1.time_ and arg_397_1.time_ <= var_400_15 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, false)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_17 = arg_397_1:GetWordFromCfg(221061094)
				local var_400_18 = arg_397_1:FormatText(var_400_17.content)

				arg_397_1.text_.text = var_400_18

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_19 = 41
				local var_400_20 = utf8.len(var_400_18)
				local var_400_21 = var_400_19 <= 0 and var_400_16 or var_400_16 * (var_400_20 / var_400_19)

				if var_400_21 > 0 and var_400_16 < var_400_21 then
					arg_397_1.talkMaxDuration = var_400_21

					if var_400_21 + var_400_15 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_21 + var_400_15
					end
				end

				arg_397_1.text_.text = var_400_18
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_22 = math.max(var_400_16, arg_397_1.talkMaxDuration)

			if var_400_15 <= arg_397_1.time_ and arg_397_1.time_ < var_400_15 + var_400_22 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_15) / var_400_22

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_15 + var_400_22 and arg_397_1.time_ < var_400_15 + var_400_22 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play221061095 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 221061095
		arg_401_1.duration_ = 7.9

		local var_401_0 = {
			ja = 7.9,
			ko = 5.533,
			zh = 5.533
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
				arg_401_0:Play221061096(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1072ui_story"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos1072ui_story = var_404_0.localPosition
			end

			local var_404_2 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2
				local var_404_4 = Vector3.New(-0.7, -0.71, -6)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1072ui_story, var_404_4, var_404_3)

				local var_404_5 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_5.x, var_404_5.y, var_404_5.z)

				local var_404_6 = var_404_0.localEulerAngles

				var_404_6.z = 0
				var_404_6.x = 0
				var_404_0.localEulerAngles = var_404_6
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_404_7 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_7.x, var_404_7.y, var_404_7.z)

				local var_404_8 = var_404_0.localEulerAngles

				var_404_8.z = 0
				var_404_8.x = 0
				var_404_0.localEulerAngles = var_404_8
			end

			local var_404_9 = arg_401_1.actors_["1072ui_story"]
			local var_404_10 = 0

			if var_404_10 < arg_401_1.time_ and arg_401_1.time_ <= var_404_10 + arg_404_0 and arg_401_1.var_.characterEffect1072ui_story == nil then
				arg_401_1.var_.characterEffect1072ui_story = var_404_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_11 = 0.200000002980232

			if var_404_10 <= arg_401_1.time_ and arg_401_1.time_ < var_404_10 + var_404_11 then
				local var_404_12 = (arg_401_1.time_ - var_404_10) / var_404_11

				if arg_401_1.var_.characterEffect1072ui_story then
					arg_401_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_10 + var_404_11 and arg_401_1.time_ < var_404_10 + var_404_11 + arg_404_0 and arg_401_1.var_.characterEffect1072ui_story then
				arg_401_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_404_13 = 0

			if var_404_13 < arg_401_1.time_ and arg_401_1.time_ <= var_404_13 + arg_404_0 then
				arg_401_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_404_14 = 0

			if var_404_14 < arg_401_1.time_ and arg_401_1.time_ <= var_404_14 + arg_404_0 then
				arg_401_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_404_15 = arg_401_1.actors_["1076ui_story"].transform
			local var_404_16 = 0

			if var_404_16 < arg_401_1.time_ and arg_401_1.time_ <= var_404_16 + arg_404_0 then
				arg_401_1.var_.moveOldPos1076ui_story = var_404_15.localPosition
			end

			local var_404_17 = 0.001

			if var_404_16 <= arg_401_1.time_ and arg_401_1.time_ < var_404_16 + var_404_17 then
				local var_404_18 = (arg_401_1.time_ - var_404_16) / var_404_17
				local var_404_19 = Vector3.New(0.7, -1.06, -6.2)

				var_404_15.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1076ui_story, var_404_19, var_404_18)

				local var_404_20 = manager.ui.mainCamera.transform.position - var_404_15.position

				var_404_15.forward = Vector3.New(var_404_20.x, var_404_20.y, var_404_20.z)

				local var_404_21 = var_404_15.localEulerAngles

				var_404_21.z = 0
				var_404_21.x = 0
				var_404_15.localEulerAngles = var_404_21
			end

			if arg_401_1.time_ >= var_404_16 + var_404_17 and arg_401_1.time_ < var_404_16 + var_404_17 + arg_404_0 then
				var_404_15.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_404_22 = manager.ui.mainCamera.transform.position - var_404_15.position

				var_404_15.forward = Vector3.New(var_404_22.x, var_404_22.y, var_404_22.z)

				local var_404_23 = var_404_15.localEulerAngles

				var_404_23.z = 0
				var_404_23.x = 0
				var_404_15.localEulerAngles = var_404_23
			end

			local var_404_24 = arg_401_1.actors_["1076ui_story"]
			local var_404_25 = 0

			if var_404_25 < arg_401_1.time_ and arg_401_1.time_ <= var_404_25 + arg_404_0 and arg_401_1.var_.characterEffect1076ui_story == nil then
				arg_401_1.var_.characterEffect1076ui_story = var_404_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_26 = 0.0166666666666667

			if var_404_25 <= arg_401_1.time_ and arg_401_1.time_ < var_404_25 + var_404_26 then
				local var_404_27 = (arg_401_1.time_ - var_404_25) / var_404_26

				if arg_401_1.var_.characterEffect1076ui_story then
					local var_404_28 = Mathf.Lerp(0, 0.5, var_404_27)

					arg_401_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_401_1.var_.characterEffect1076ui_story.fillRatio = var_404_28
				end
			end

			if arg_401_1.time_ >= var_404_25 + var_404_26 and arg_401_1.time_ < var_404_25 + var_404_26 + arg_404_0 and arg_401_1.var_.characterEffect1076ui_story then
				local var_404_29 = 0.5

				arg_401_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_401_1.var_.characterEffect1076ui_story.fillRatio = var_404_29
			end

			local var_404_30 = 0

			if var_404_30 < arg_401_1.time_ and arg_401_1.time_ <= var_404_30 + arg_404_0 then
				arg_401_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_404_31 = 0
			local var_404_32 = 0.775

			if var_404_31 < arg_401_1.time_ and arg_401_1.time_ <= var_404_31 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_33 = arg_401_1:FormatText(StoryNameCfg[379].name)

				arg_401_1.leftNameTxt_.text = var_404_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_34 = arg_401_1:GetWordFromCfg(221061095)
				local var_404_35 = arg_401_1:FormatText(var_404_34.content)

				arg_401_1.text_.text = var_404_35

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_36 = 31
				local var_404_37 = utf8.len(var_404_35)
				local var_404_38 = var_404_36 <= 0 and var_404_32 or var_404_32 * (var_404_37 / var_404_36)

				if var_404_38 > 0 and var_404_32 < var_404_38 then
					arg_401_1.talkMaxDuration = var_404_38

					if var_404_38 + var_404_31 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_38 + var_404_31
					end
				end

				arg_401_1.text_.text = var_404_35
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061095", "story_v_out_221061.awb") ~= 0 then
					local var_404_39 = manager.audio:GetVoiceLength("story_v_out_221061", "221061095", "story_v_out_221061.awb") / 1000

					if var_404_39 + var_404_31 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_39 + var_404_31
					end

					if var_404_34.prefab_name ~= "" and arg_401_1.actors_[var_404_34.prefab_name] ~= nil then
						local var_404_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_34.prefab_name].transform, "story_v_out_221061", "221061095", "story_v_out_221061.awb")

						arg_401_1:RecordAudio("221061095", var_404_40)
						arg_401_1:RecordAudio("221061095", var_404_40)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_221061", "221061095", "story_v_out_221061.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_221061", "221061095", "story_v_out_221061.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_41 = math.max(var_404_32, arg_401_1.talkMaxDuration)

			if var_404_31 <= arg_401_1.time_ and arg_401_1.time_ < var_404_31 + var_404_41 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_31) / var_404_41

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_31 + var_404_41 and arg_401_1.time_ < var_404_31 + var_404_41 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play221061096 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 221061096
		arg_405_1.duration_ = 7.666

		local var_405_0 = {
			ja = 7.666,
			ko = 7.233,
			zh = 7.233
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
				arg_405_0:Play221061097(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1072ui_story"].transform
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1.var_.moveOldPos1072ui_story = var_408_0.localPosition
			end

			local var_408_2 = 0.001

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2
				local var_408_4 = Vector3.New(-0.7, -0.71, -6)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos1072ui_story, var_408_4, var_408_3)

				local var_408_5 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_5.x, var_408_5.y, var_408_5.z)

				local var_408_6 = var_408_0.localEulerAngles

				var_408_6.z = 0
				var_408_6.x = 0
				var_408_0.localEulerAngles = var_408_6
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_408_7 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_7.x, var_408_7.y, var_408_7.z)

				local var_408_8 = var_408_0.localEulerAngles

				var_408_8.z = 0
				var_408_8.x = 0
				var_408_0.localEulerAngles = var_408_8
			end

			local var_408_9 = 0

			if var_408_9 < arg_405_1.time_ and arg_405_1.time_ <= var_408_9 + arg_408_0 then
				arg_405_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_1")
			end

			local var_408_10 = 0

			if var_408_10 < arg_405_1.time_ and arg_405_1.time_ <= var_408_10 + arg_408_0 then
				arg_405_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_408_11 = 0
			local var_408_12 = 0.825

			if var_408_11 < arg_405_1.time_ and arg_405_1.time_ <= var_408_11 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_13 = arg_405_1:FormatText(StoryNameCfg[379].name)

				arg_405_1.leftNameTxt_.text = var_408_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_14 = arg_405_1:GetWordFromCfg(221061096)
				local var_408_15 = arg_405_1:FormatText(var_408_14.content)

				arg_405_1.text_.text = var_408_15

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_16 = 33
				local var_408_17 = utf8.len(var_408_15)
				local var_408_18 = var_408_16 <= 0 and var_408_12 or var_408_12 * (var_408_17 / var_408_16)

				if var_408_18 > 0 and var_408_12 < var_408_18 then
					arg_405_1.talkMaxDuration = var_408_18

					if var_408_18 + var_408_11 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_18 + var_408_11
					end
				end

				arg_405_1.text_.text = var_408_15
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061096", "story_v_out_221061.awb") ~= 0 then
					local var_408_19 = manager.audio:GetVoiceLength("story_v_out_221061", "221061096", "story_v_out_221061.awb") / 1000

					if var_408_19 + var_408_11 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_19 + var_408_11
					end

					if var_408_14.prefab_name ~= "" and arg_405_1.actors_[var_408_14.prefab_name] ~= nil then
						local var_408_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_14.prefab_name].transform, "story_v_out_221061", "221061096", "story_v_out_221061.awb")

						arg_405_1:RecordAudio("221061096", var_408_20)
						arg_405_1:RecordAudio("221061096", var_408_20)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_221061", "221061096", "story_v_out_221061.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_221061", "221061096", "story_v_out_221061.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_21 = math.max(var_408_12, arg_405_1.talkMaxDuration)

			if var_408_11 <= arg_405_1.time_ and arg_405_1.time_ < var_408_11 + var_408_21 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_11) / var_408_21

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_11 + var_408_21 and arg_405_1.time_ < var_408_11 + var_408_21 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play221061097 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 221061097
		arg_409_1.duration_ = 3.2

		local var_409_0 = {
			ja = 2.733,
			ko = 3.2,
			zh = 3.2
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
				arg_409_0:Play221061098(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1076ui_story"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos1076ui_story = var_412_0.localPosition
			end

			local var_412_2 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2
				local var_412_4 = Vector3.New(0.7, -1.06, -6.2)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos1076ui_story, var_412_4, var_412_3)

				local var_412_5 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_5.x, var_412_5.y, var_412_5.z)

				local var_412_6 = var_412_0.localEulerAngles

				var_412_6.z = 0
				var_412_6.x = 0
				var_412_0.localEulerAngles = var_412_6
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_412_7 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_7.x, var_412_7.y, var_412_7.z)

				local var_412_8 = var_412_0.localEulerAngles

				var_412_8.z = 0
				var_412_8.x = 0
				var_412_0.localEulerAngles = var_412_8
			end

			local var_412_9 = arg_409_1.actors_["1076ui_story"]
			local var_412_10 = 0

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 and arg_409_1.var_.characterEffect1076ui_story == nil then
				arg_409_1.var_.characterEffect1076ui_story = var_412_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_11 = 0.200000002980232

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_11 then
				local var_412_12 = (arg_409_1.time_ - var_412_10) / var_412_11

				if arg_409_1.var_.characterEffect1076ui_story then
					arg_409_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_10 + var_412_11 and arg_409_1.time_ < var_412_10 + var_412_11 + arg_412_0 and arg_409_1.var_.characterEffect1076ui_story then
				arg_409_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_412_13 = 0

			if var_412_13 < arg_409_1.time_ and arg_409_1.time_ <= var_412_13 + arg_412_0 then
				arg_409_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action5_1")
			end

			local var_412_14 = 0

			if var_412_14 < arg_409_1.time_ and arg_409_1.time_ <= var_412_14 + arg_412_0 then
				arg_409_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_412_15 = arg_409_1.actors_["1072ui_story"]
			local var_412_16 = 0

			if var_412_16 < arg_409_1.time_ and arg_409_1.time_ <= var_412_16 + arg_412_0 and arg_409_1.var_.characterEffect1072ui_story == nil then
				arg_409_1.var_.characterEffect1072ui_story = var_412_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_17 = 0.200000002980232

			if var_412_16 <= arg_409_1.time_ and arg_409_1.time_ < var_412_16 + var_412_17 then
				local var_412_18 = (arg_409_1.time_ - var_412_16) / var_412_17

				if arg_409_1.var_.characterEffect1072ui_story then
					local var_412_19 = Mathf.Lerp(0, 0.5, var_412_18)

					arg_409_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_409_1.var_.characterEffect1072ui_story.fillRatio = var_412_19
				end
			end

			if arg_409_1.time_ >= var_412_16 + var_412_17 and arg_409_1.time_ < var_412_16 + var_412_17 + arg_412_0 and arg_409_1.var_.characterEffect1072ui_story then
				local var_412_20 = 0.5

				arg_409_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_409_1.var_.characterEffect1072ui_story.fillRatio = var_412_20
			end

			local var_412_21 = 0
			local var_412_22 = 0.3

			if var_412_21 < arg_409_1.time_ and arg_409_1.time_ <= var_412_21 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_23 = arg_409_1:FormatText(StoryNameCfg[389].name)

				arg_409_1.leftNameTxt_.text = var_412_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_24 = arg_409_1:GetWordFromCfg(221061097)
				local var_412_25 = arg_409_1:FormatText(var_412_24.content)

				arg_409_1.text_.text = var_412_25

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_26 = 12
				local var_412_27 = utf8.len(var_412_25)
				local var_412_28 = var_412_26 <= 0 and var_412_22 or var_412_22 * (var_412_27 / var_412_26)

				if var_412_28 > 0 and var_412_22 < var_412_28 then
					arg_409_1.talkMaxDuration = var_412_28

					if var_412_28 + var_412_21 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_28 + var_412_21
					end
				end

				arg_409_1.text_.text = var_412_25
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061097", "story_v_out_221061.awb") ~= 0 then
					local var_412_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061097", "story_v_out_221061.awb") / 1000

					if var_412_29 + var_412_21 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_29 + var_412_21
					end

					if var_412_24.prefab_name ~= "" and arg_409_1.actors_[var_412_24.prefab_name] ~= nil then
						local var_412_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_24.prefab_name].transform, "story_v_out_221061", "221061097", "story_v_out_221061.awb")

						arg_409_1:RecordAudio("221061097", var_412_30)
						arg_409_1:RecordAudio("221061097", var_412_30)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_221061", "221061097", "story_v_out_221061.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_221061", "221061097", "story_v_out_221061.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_31 = math.max(var_412_22, arg_409_1.talkMaxDuration)

			if var_412_21 <= arg_409_1.time_ and arg_409_1.time_ < var_412_21 + var_412_31 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_21) / var_412_31

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_21 + var_412_31 and arg_409_1.time_ < var_412_21 + var_412_31 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play221061098 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 221061098
		arg_413_1.duration_ = 11.5

		local var_413_0 = {
			ja = 11.5,
			ko = 7.5,
			zh = 7.5
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
				arg_413_0:Play221061099(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1076ui_story"].transform
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.var_.moveOldPos1076ui_story = var_416_0.localPosition
			end

			local var_416_2 = 0.001

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2
				local var_416_4 = Vector3.New(0.7, -1.06, -6.2)

				var_416_0.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1076ui_story, var_416_4, var_416_3)

				local var_416_5 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_5.x, var_416_5.y, var_416_5.z)

				local var_416_6 = var_416_0.localEulerAngles

				var_416_6.z = 0
				var_416_6.x = 0
				var_416_0.localEulerAngles = var_416_6
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 then
				var_416_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_416_7 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_7.x, var_416_7.y, var_416_7.z)

				local var_416_8 = var_416_0.localEulerAngles

				var_416_8.z = 0
				var_416_8.x = 0
				var_416_0.localEulerAngles = var_416_8
			end

			local var_416_9 = arg_413_1.actors_["1076ui_story"]
			local var_416_10 = 0

			if var_416_10 < arg_413_1.time_ and arg_413_1.time_ <= var_416_10 + arg_416_0 and arg_413_1.var_.characterEffect1076ui_story == nil then
				arg_413_1.var_.characterEffect1076ui_story = var_416_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_11 = 0.200000002980232

			if var_416_10 <= arg_413_1.time_ and arg_413_1.time_ < var_416_10 + var_416_11 then
				local var_416_12 = (arg_413_1.time_ - var_416_10) / var_416_11

				if arg_413_1.var_.characterEffect1076ui_story then
					arg_413_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_10 + var_416_11 and arg_413_1.time_ < var_416_10 + var_416_11 + arg_416_0 and arg_413_1.var_.characterEffect1076ui_story then
				arg_413_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_416_13 = 0

			if var_416_13 < arg_413_1.time_ and arg_413_1.time_ <= var_416_13 + arg_416_0 then
				arg_413_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action5_2")
			end

			local var_416_14 = 0

			if var_416_14 < arg_413_1.time_ and arg_413_1.time_ <= var_416_14 + arg_416_0 then
				arg_413_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_416_15 = 0
			local var_416_16 = 0.8

			if var_416_15 < arg_413_1.time_ and arg_413_1.time_ <= var_416_15 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_17 = arg_413_1:FormatText(StoryNameCfg[389].name)

				arg_413_1.leftNameTxt_.text = var_416_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_18 = arg_413_1:GetWordFromCfg(221061098)
				local var_416_19 = arg_413_1:FormatText(var_416_18.content)

				arg_413_1.text_.text = var_416_19

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_20 = 32
				local var_416_21 = utf8.len(var_416_19)
				local var_416_22 = var_416_20 <= 0 and var_416_16 or var_416_16 * (var_416_21 / var_416_20)

				if var_416_22 > 0 and var_416_16 < var_416_22 then
					arg_413_1.talkMaxDuration = var_416_22

					if var_416_22 + var_416_15 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_22 + var_416_15
					end
				end

				arg_413_1.text_.text = var_416_19
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061098", "story_v_out_221061.awb") ~= 0 then
					local var_416_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061098", "story_v_out_221061.awb") / 1000

					if var_416_23 + var_416_15 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_23 + var_416_15
					end

					if var_416_18.prefab_name ~= "" and arg_413_1.actors_[var_416_18.prefab_name] ~= nil then
						local var_416_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_18.prefab_name].transform, "story_v_out_221061", "221061098", "story_v_out_221061.awb")

						arg_413_1:RecordAudio("221061098", var_416_24)
						arg_413_1:RecordAudio("221061098", var_416_24)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_221061", "221061098", "story_v_out_221061.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_221061", "221061098", "story_v_out_221061.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_25 = math.max(var_416_16, arg_413_1.talkMaxDuration)

			if var_416_15 <= arg_413_1.time_ and arg_413_1.time_ < var_416_15 + var_416_25 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_15) / var_416_25

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_15 + var_416_25 and arg_413_1.time_ < var_416_15 + var_416_25 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play221061099 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 221061099
		arg_417_1.duration_ = 9.133

		local var_417_0 = {
			ja = 8.933,
			ko = 9.133,
			zh = 9.133
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
				arg_417_0:Play221061100(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1072ui_story"].transform
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				arg_417_1.var_.moveOldPos1072ui_story = var_420_0.localPosition
			end

			local var_420_2 = 0.001

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2
				local var_420_4 = Vector3.New(-0.7, -0.71, -6)

				var_420_0.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1072ui_story, var_420_4, var_420_3)

				local var_420_5 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_5.x, var_420_5.y, var_420_5.z)

				local var_420_6 = var_420_0.localEulerAngles

				var_420_6.z = 0
				var_420_6.x = 0
				var_420_0.localEulerAngles = var_420_6
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 then
				var_420_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_420_7 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_7.x, var_420_7.y, var_420_7.z)

				local var_420_8 = var_420_0.localEulerAngles

				var_420_8.z = 0
				var_420_8.x = 0
				var_420_0.localEulerAngles = var_420_8
			end

			local var_420_9 = arg_417_1.actors_["1072ui_story"]
			local var_420_10 = 0

			if var_420_10 < arg_417_1.time_ and arg_417_1.time_ <= var_420_10 + arg_420_0 and arg_417_1.var_.characterEffect1072ui_story == nil then
				arg_417_1.var_.characterEffect1072ui_story = var_420_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_11 = 0.200000002980232

			if var_420_10 <= arg_417_1.time_ and arg_417_1.time_ < var_420_10 + var_420_11 then
				local var_420_12 = (arg_417_1.time_ - var_420_10) / var_420_11

				if arg_417_1.var_.characterEffect1072ui_story then
					arg_417_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_10 + var_420_11 and arg_417_1.time_ < var_420_10 + var_420_11 + arg_420_0 and arg_417_1.var_.characterEffect1072ui_story then
				arg_417_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_420_13 = 0

			if var_420_13 < arg_417_1.time_ and arg_417_1.time_ <= var_420_13 + arg_420_0 then
				arg_417_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_2")
			end

			local var_420_14 = 0

			if var_420_14 < arg_417_1.time_ and arg_417_1.time_ <= var_420_14 + arg_420_0 then
				arg_417_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_420_15 = arg_417_1.actors_["1076ui_story"]
			local var_420_16 = 0

			if var_420_16 < arg_417_1.time_ and arg_417_1.time_ <= var_420_16 + arg_420_0 and arg_417_1.var_.characterEffect1076ui_story == nil then
				arg_417_1.var_.characterEffect1076ui_story = var_420_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_17 = 0.200000002980232

			if var_420_16 <= arg_417_1.time_ and arg_417_1.time_ < var_420_16 + var_420_17 then
				local var_420_18 = (arg_417_1.time_ - var_420_16) / var_420_17

				if arg_417_1.var_.characterEffect1076ui_story then
					local var_420_19 = Mathf.Lerp(0, 0.5, var_420_18)

					arg_417_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1076ui_story.fillRatio = var_420_19
				end
			end

			if arg_417_1.time_ >= var_420_16 + var_420_17 and arg_417_1.time_ < var_420_16 + var_420_17 + arg_420_0 and arg_417_1.var_.characterEffect1076ui_story then
				local var_420_20 = 0.5

				arg_417_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1076ui_story.fillRatio = var_420_20
			end

			local var_420_21 = 0
			local var_420_22 = 1.2

			if var_420_21 < arg_417_1.time_ and arg_417_1.time_ <= var_420_21 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_23 = arg_417_1:FormatText(StoryNameCfg[379].name)

				arg_417_1.leftNameTxt_.text = var_420_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_24 = arg_417_1:GetWordFromCfg(221061099)
				local var_420_25 = arg_417_1:FormatText(var_420_24.content)

				arg_417_1.text_.text = var_420_25

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_26 = 48
				local var_420_27 = utf8.len(var_420_25)
				local var_420_28 = var_420_26 <= 0 and var_420_22 or var_420_22 * (var_420_27 / var_420_26)

				if var_420_28 > 0 and var_420_22 < var_420_28 then
					arg_417_1.talkMaxDuration = var_420_28

					if var_420_28 + var_420_21 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_28 + var_420_21
					end
				end

				arg_417_1.text_.text = var_420_25
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061099", "story_v_out_221061.awb") ~= 0 then
					local var_420_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061099", "story_v_out_221061.awb") / 1000

					if var_420_29 + var_420_21 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_29 + var_420_21
					end

					if var_420_24.prefab_name ~= "" and arg_417_1.actors_[var_420_24.prefab_name] ~= nil then
						local var_420_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_24.prefab_name].transform, "story_v_out_221061", "221061099", "story_v_out_221061.awb")

						arg_417_1:RecordAudio("221061099", var_420_30)
						arg_417_1:RecordAudio("221061099", var_420_30)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_221061", "221061099", "story_v_out_221061.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_221061", "221061099", "story_v_out_221061.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_31 = math.max(var_420_22, arg_417_1.talkMaxDuration)

			if var_420_21 <= arg_417_1.time_ and arg_417_1.time_ < var_420_21 + var_420_31 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_21) / var_420_31

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_21 + var_420_31 and arg_417_1.time_ < var_420_21 + var_420_31 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play221061100 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 221061100
		arg_421_1.duration_ = 5.8

		local var_421_0 = {
			ja = 5.8,
			ko = 5.6,
			zh = 5.6
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
				arg_421_0:Play221061101(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1072ui_story"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos1072ui_story = var_424_0.localPosition
			end

			local var_424_2 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2
				local var_424_4 = Vector3.New(-0.7, -0.71, -6)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos1072ui_story, var_424_4, var_424_3)

				local var_424_5 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_5.x, var_424_5.y, var_424_5.z)

				local var_424_6 = var_424_0.localEulerAngles

				var_424_6.z = 0
				var_424_6.x = 0
				var_424_0.localEulerAngles = var_424_6
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 then
				var_424_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_424_7 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_7.x, var_424_7.y, var_424_7.z)

				local var_424_8 = var_424_0.localEulerAngles

				var_424_8.z = 0
				var_424_8.x = 0
				var_424_0.localEulerAngles = var_424_8
			end

			local var_424_9 = 0

			if var_424_9 < arg_421_1.time_ and arg_421_1.time_ <= var_424_9 + arg_424_0 then
				arg_421_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action2_1")
			end

			local var_424_10 = 0

			if var_424_10 < arg_421_1.time_ and arg_421_1.time_ <= var_424_10 + arg_424_0 then
				arg_421_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_424_11 = 0
			local var_424_12 = 0.725

			if var_424_11 < arg_421_1.time_ and arg_421_1.time_ <= var_424_11 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_13 = arg_421_1:FormatText(StoryNameCfg[379].name)

				arg_421_1.leftNameTxt_.text = var_424_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_14 = arg_421_1:GetWordFromCfg(221061100)
				local var_424_15 = arg_421_1:FormatText(var_424_14.content)

				arg_421_1.text_.text = var_424_15

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_16 = 29
				local var_424_17 = utf8.len(var_424_15)
				local var_424_18 = var_424_16 <= 0 and var_424_12 or var_424_12 * (var_424_17 / var_424_16)

				if var_424_18 > 0 and var_424_12 < var_424_18 then
					arg_421_1.talkMaxDuration = var_424_18

					if var_424_18 + var_424_11 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_18 + var_424_11
					end
				end

				arg_421_1.text_.text = var_424_15
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061100", "story_v_out_221061.awb") ~= 0 then
					local var_424_19 = manager.audio:GetVoiceLength("story_v_out_221061", "221061100", "story_v_out_221061.awb") / 1000

					if var_424_19 + var_424_11 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_19 + var_424_11
					end

					if var_424_14.prefab_name ~= "" and arg_421_1.actors_[var_424_14.prefab_name] ~= nil then
						local var_424_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_14.prefab_name].transform, "story_v_out_221061", "221061100", "story_v_out_221061.awb")

						arg_421_1:RecordAudio("221061100", var_424_20)
						arg_421_1:RecordAudio("221061100", var_424_20)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_221061", "221061100", "story_v_out_221061.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_221061", "221061100", "story_v_out_221061.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_21 = math.max(var_424_12, arg_421_1.talkMaxDuration)

			if var_424_11 <= arg_421_1.time_ and arg_421_1.time_ < var_424_11 + var_424_21 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_11) / var_424_21

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_11 + var_424_21 and arg_421_1.time_ < var_424_11 + var_424_21 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play221061101 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 221061101
		arg_425_1.duration_ = 5

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play221061102(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1072ui_story"].transform
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 then
				arg_425_1.var_.moveOldPos1072ui_story = var_428_0.localPosition
			end

			local var_428_2 = 0.001

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2
				local var_428_4 = Vector3.New(0, 100, 0)

				var_428_0.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos1072ui_story, var_428_4, var_428_3)

				local var_428_5 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_5.x, var_428_5.y, var_428_5.z)

				local var_428_6 = var_428_0.localEulerAngles

				var_428_6.z = 0
				var_428_6.x = 0
				var_428_0.localEulerAngles = var_428_6
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 then
				var_428_0.localPosition = Vector3.New(0, 100, 0)

				local var_428_7 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_7.x, var_428_7.y, var_428_7.z)

				local var_428_8 = var_428_0.localEulerAngles

				var_428_8.z = 0
				var_428_8.x = 0
				var_428_0.localEulerAngles = var_428_8
			end

			local var_428_9 = arg_425_1.actors_["1072ui_story"]
			local var_428_10 = 0

			if var_428_10 < arg_425_1.time_ and arg_425_1.time_ <= var_428_10 + arg_428_0 and arg_425_1.var_.characterEffect1072ui_story == nil then
				arg_425_1.var_.characterEffect1072ui_story = var_428_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_11 = 0.200000002980232

			if var_428_10 <= arg_425_1.time_ and arg_425_1.time_ < var_428_10 + var_428_11 then
				local var_428_12 = (arg_425_1.time_ - var_428_10) / var_428_11

				if arg_425_1.var_.characterEffect1072ui_story then
					local var_428_13 = Mathf.Lerp(0, 0.5, var_428_12)

					arg_425_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_425_1.var_.characterEffect1072ui_story.fillRatio = var_428_13
				end
			end

			if arg_425_1.time_ >= var_428_10 + var_428_11 and arg_425_1.time_ < var_428_10 + var_428_11 + arg_428_0 and arg_425_1.var_.characterEffect1072ui_story then
				local var_428_14 = 0.5

				arg_425_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_425_1.var_.characterEffect1072ui_story.fillRatio = var_428_14
			end

			local var_428_15 = arg_425_1.actors_["1076ui_story"].transform
			local var_428_16 = 0

			if var_428_16 < arg_425_1.time_ and arg_425_1.time_ <= var_428_16 + arg_428_0 then
				arg_425_1.var_.moveOldPos1076ui_story = var_428_15.localPosition
			end

			local var_428_17 = 0.001

			if var_428_16 <= arg_425_1.time_ and arg_425_1.time_ < var_428_16 + var_428_17 then
				local var_428_18 = (arg_425_1.time_ - var_428_16) / var_428_17
				local var_428_19 = Vector3.New(0, 100, 0)

				var_428_15.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos1076ui_story, var_428_19, var_428_18)

				local var_428_20 = manager.ui.mainCamera.transform.position - var_428_15.position

				var_428_15.forward = Vector3.New(var_428_20.x, var_428_20.y, var_428_20.z)

				local var_428_21 = var_428_15.localEulerAngles

				var_428_21.z = 0
				var_428_21.x = 0
				var_428_15.localEulerAngles = var_428_21
			end

			if arg_425_1.time_ >= var_428_16 + var_428_17 and arg_425_1.time_ < var_428_16 + var_428_17 + arg_428_0 then
				var_428_15.localPosition = Vector3.New(0, 100, 0)

				local var_428_22 = manager.ui.mainCamera.transform.position - var_428_15.position

				var_428_15.forward = Vector3.New(var_428_22.x, var_428_22.y, var_428_22.z)

				local var_428_23 = var_428_15.localEulerAngles

				var_428_23.z = 0
				var_428_23.x = 0
				var_428_15.localEulerAngles = var_428_23
			end

			local var_428_24 = arg_425_1.actors_["1076ui_story"]
			local var_428_25 = 0

			if var_428_25 < arg_425_1.time_ and arg_425_1.time_ <= var_428_25 + arg_428_0 and arg_425_1.var_.characterEffect1076ui_story == nil then
				arg_425_1.var_.characterEffect1076ui_story = var_428_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_26 = 0.200000002980232

			if var_428_25 <= arg_425_1.time_ and arg_425_1.time_ < var_428_25 + var_428_26 then
				local var_428_27 = (arg_425_1.time_ - var_428_25) / var_428_26

				if arg_425_1.var_.characterEffect1076ui_story then
					local var_428_28 = Mathf.Lerp(0, 0.5, var_428_27)

					arg_425_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_425_1.var_.characterEffect1076ui_story.fillRatio = var_428_28
				end
			end

			if arg_425_1.time_ >= var_428_25 + var_428_26 and arg_425_1.time_ < var_428_25 + var_428_26 + arg_428_0 and arg_425_1.var_.characterEffect1076ui_story then
				local var_428_29 = 0.5

				arg_425_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_425_1.var_.characterEffect1076ui_story.fillRatio = var_428_29
			end

			local var_428_30 = 0
			local var_428_31 = 1.2

			if var_428_30 < arg_425_1.time_ and arg_425_1.time_ <= var_428_30 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, false)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_32 = arg_425_1:GetWordFromCfg(221061101)
				local var_428_33 = arg_425_1:FormatText(var_428_32.content)

				arg_425_1.text_.text = var_428_33

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_34 = 48
				local var_428_35 = utf8.len(var_428_33)
				local var_428_36 = var_428_34 <= 0 and var_428_31 or var_428_31 * (var_428_35 / var_428_34)

				if var_428_36 > 0 and var_428_31 < var_428_36 then
					arg_425_1.talkMaxDuration = var_428_36

					if var_428_36 + var_428_30 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_36 + var_428_30
					end
				end

				arg_425_1.text_.text = var_428_33
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_37 = math.max(var_428_31, arg_425_1.talkMaxDuration)

			if var_428_30 <= arg_425_1.time_ and arg_425_1.time_ < var_428_30 + var_428_37 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_30) / var_428_37

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_30 + var_428_37 and arg_425_1.time_ < var_428_30 + var_428_37 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play221061102 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 221061102
		arg_429_1.duration_ = 11.766

		local var_429_0 = {
			ja = 11.766,
			ko = 9.566,
			zh = 9.566
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
				arg_429_0:Play221061103(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1076ui_story"].transform
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 then
				arg_429_1.var_.moveOldPos1076ui_story = var_432_0.localPosition
			end

			local var_432_2 = 0.001

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2
				local var_432_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_432_0.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1076ui_story, var_432_4, var_432_3)

				local var_432_5 = manager.ui.mainCamera.transform.position - var_432_0.position

				var_432_0.forward = Vector3.New(var_432_5.x, var_432_5.y, var_432_5.z)

				local var_432_6 = var_432_0.localEulerAngles

				var_432_6.z = 0
				var_432_6.x = 0
				var_432_0.localEulerAngles = var_432_6
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 then
				var_432_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_432_7 = manager.ui.mainCamera.transform.position - var_432_0.position

				var_432_0.forward = Vector3.New(var_432_7.x, var_432_7.y, var_432_7.z)

				local var_432_8 = var_432_0.localEulerAngles

				var_432_8.z = 0
				var_432_8.x = 0
				var_432_0.localEulerAngles = var_432_8
			end

			local var_432_9 = arg_429_1.actors_["1076ui_story"]
			local var_432_10 = 0

			if var_432_10 < arg_429_1.time_ and arg_429_1.time_ <= var_432_10 + arg_432_0 and arg_429_1.var_.characterEffect1076ui_story == nil then
				arg_429_1.var_.characterEffect1076ui_story = var_432_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_11 = 0.200000002980232

			if var_432_10 <= arg_429_1.time_ and arg_429_1.time_ < var_432_10 + var_432_11 then
				local var_432_12 = (arg_429_1.time_ - var_432_10) / var_432_11

				if arg_429_1.var_.characterEffect1076ui_story then
					arg_429_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_10 + var_432_11 and arg_429_1.time_ < var_432_10 + var_432_11 + arg_432_0 and arg_429_1.var_.characterEffect1076ui_story then
				arg_429_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_432_13 = 0

			if var_432_13 < arg_429_1.time_ and arg_429_1.time_ <= var_432_13 + arg_432_0 then
				arg_429_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_432_14 = 0

			if var_432_14 < arg_429_1.time_ and arg_429_1.time_ <= var_432_14 + arg_432_0 then
				arg_429_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_432_15 = 0
			local var_432_16 = 0.725

			if var_432_15 < arg_429_1.time_ and arg_429_1.time_ <= var_432_15 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_17 = arg_429_1:FormatText(StoryNameCfg[389].name)

				arg_429_1.leftNameTxt_.text = var_432_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_18 = arg_429_1:GetWordFromCfg(221061102)
				local var_432_19 = arg_429_1:FormatText(var_432_18.content)

				arg_429_1.text_.text = var_432_19

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_20 = 29
				local var_432_21 = utf8.len(var_432_19)
				local var_432_22 = var_432_20 <= 0 and var_432_16 or var_432_16 * (var_432_21 / var_432_20)

				if var_432_22 > 0 and var_432_16 < var_432_22 then
					arg_429_1.talkMaxDuration = var_432_22

					if var_432_22 + var_432_15 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_22 + var_432_15
					end
				end

				arg_429_1.text_.text = var_432_19
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061102", "story_v_out_221061.awb") ~= 0 then
					local var_432_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061102", "story_v_out_221061.awb") / 1000

					if var_432_23 + var_432_15 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_23 + var_432_15
					end

					if var_432_18.prefab_name ~= "" and arg_429_1.actors_[var_432_18.prefab_name] ~= nil then
						local var_432_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_18.prefab_name].transform, "story_v_out_221061", "221061102", "story_v_out_221061.awb")

						arg_429_1:RecordAudio("221061102", var_432_24)
						arg_429_1:RecordAudio("221061102", var_432_24)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_221061", "221061102", "story_v_out_221061.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_221061", "221061102", "story_v_out_221061.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_25 = math.max(var_432_16, arg_429_1.talkMaxDuration)

			if var_432_15 <= arg_429_1.time_ and arg_429_1.time_ < var_432_15 + var_432_25 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_15) / var_432_25

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_15 + var_432_25 and arg_429_1.time_ < var_432_15 + var_432_25 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play221061103 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 221061103
		arg_433_1.duration_ = 2.9

		local var_433_0 = {
			ja = 2.766,
			ko = 2.9,
			zh = 2.9
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
				arg_433_0:Play221061104(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1072ui_story"].transform
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.var_.moveOldPos1072ui_story = var_436_0.localPosition
			end

			local var_436_2 = 0.001

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2
				local var_436_4 = Vector3.New(0.7, -0.71, -6)

				var_436_0.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos1072ui_story, var_436_4, var_436_3)

				local var_436_5 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_5.x, var_436_5.y, var_436_5.z)

				local var_436_6 = var_436_0.localEulerAngles

				var_436_6.z = 0
				var_436_6.x = 0
				var_436_0.localEulerAngles = var_436_6
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 then
				var_436_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_436_7 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_7.x, var_436_7.y, var_436_7.z)

				local var_436_8 = var_436_0.localEulerAngles

				var_436_8.z = 0
				var_436_8.x = 0
				var_436_0.localEulerAngles = var_436_8
			end

			local var_436_9 = arg_433_1.actors_["1072ui_story"]
			local var_436_10 = 0

			if var_436_10 < arg_433_1.time_ and arg_433_1.time_ <= var_436_10 + arg_436_0 and arg_433_1.var_.characterEffect1072ui_story == nil then
				arg_433_1.var_.characterEffect1072ui_story = var_436_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_11 = 0.200000002980232

			if var_436_10 <= arg_433_1.time_ and arg_433_1.time_ < var_436_10 + var_436_11 then
				local var_436_12 = (arg_433_1.time_ - var_436_10) / var_436_11

				if arg_433_1.var_.characterEffect1072ui_story then
					arg_433_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_433_1.time_ >= var_436_10 + var_436_11 and arg_433_1.time_ < var_436_10 + var_436_11 + arg_436_0 and arg_433_1.var_.characterEffect1072ui_story then
				arg_433_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_436_13 = 0

			if var_436_13 < arg_433_1.time_ and arg_433_1.time_ <= var_436_13 + arg_436_0 then
				arg_433_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_436_14 = 0

			if var_436_14 < arg_433_1.time_ and arg_433_1.time_ <= var_436_14 + arg_436_0 then
				arg_433_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_436_15 = arg_433_1.actors_["1076ui_story"]
			local var_436_16 = 0

			if var_436_16 < arg_433_1.time_ and arg_433_1.time_ <= var_436_16 + arg_436_0 and arg_433_1.var_.characterEffect1076ui_story == nil then
				arg_433_1.var_.characterEffect1076ui_story = var_436_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_17 = 0.200000002980232

			if var_436_16 <= arg_433_1.time_ and arg_433_1.time_ < var_436_16 + var_436_17 then
				local var_436_18 = (arg_433_1.time_ - var_436_16) / var_436_17

				if arg_433_1.var_.characterEffect1076ui_story then
					local var_436_19 = Mathf.Lerp(0, 0.5, var_436_18)

					arg_433_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_433_1.var_.characterEffect1076ui_story.fillRatio = var_436_19
				end
			end

			if arg_433_1.time_ >= var_436_16 + var_436_17 and arg_433_1.time_ < var_436_16 + var_436_17 + arg_436_0 and arg_433_1.var_.characterEffect1076ui_story then
				local var_436_20 = 0.5

				arg_433_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_433_1.var_.characterEffect1076ui_story.fillRatio = var_436_20
			end

			local var_436_21 = 0
			local var_436_22 = 0.2

			if var_436_21 < arg_433_1.time_ and arg_433_1.time_ <= var_436_21 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_23 = arg_433_1:FormatText(StoryNameCfg[379].name)

				arg_433_1.leftNameTxt_.text = var_436_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_24 = arg_433_1:GetWordFromCfg(221061103)
				local var_436_25 = arg_433_1:FormatText(var_436_24.content)

				arg_433_1.text_.text = var_436_25

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_26 = 8
				local var_436_27 = utf8.len(var_436_25)
				local var_436_28 = var_436_26 <= 0 and var_436_22 or var_436_22 * (var_436_27 / var_436_26)

				if var_436_28 > 0 and var_436_22 < var_436_28 then
					arg_433_1.talkMaxDuration = var_436_28

					if var_436_28 + var_436_21 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_28 + var_436_21
					end
				end

				arg_433_1.text_.text = var_436_25
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061103", "story_v_out_221061.awb") ~= 0 then
					local var_436_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061103", "story_v_out_221061.awb") / 1000

					if var_436_29 + var_436_21 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_29 + var_436_21
					end

					if var_436_24.prefab_name ~= "" and arg_433_1.actors_[var_436_24.prefab_name] ~= nil then
						local var_436_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_24.prefab_name].transform, "story_v_out_221061", "221061103", "story_v_out_221061.awb")

						arg_433_1:RecordAudio("221061103", var_436_30)
						arg_433_1:RecordAudio("221061103", var_436_30)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_221061", "221061103", "story_v_out_221061.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_221061", "221061103", "story_v_out_221061.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_31 = math.max(var_436_22, arg_433_1.talkMaxDuration)

			if var_436_21 <= arg_433_1.time_ and arg_433_1.time_ < var_436_21 + var_436_31 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_21) / var_436_31

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_21 + var_436_31 and arg_433_1.time_ < var_436_21 + var_436_31 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play221061104 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 221061104
		arg_437_1.duration_ = 8.8

		local var_437_0 = {
			ja = 8.8,
			ko = 4.366,
			zh = 4.366
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
				arg_437_0:Play221061105(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1076ui_story"].transform
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 then
				arg_437_1.var_.moveOldPos1076ui_story = var_440_0.localPosition
			end

			local var_440_2 = 0.001

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2
				local var_440_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_440_0.localPosition = Vector3.Lerp(arg_437_1.var_.moveOldPos1076ui_story, var_440_4, var_440_3)

				local var_440_5 = manager.ui.mainCamera.transform.position - var_440_0.position

				var_440_0.forward = Vector3.New(var_440_5.x, var_440_5.y, var_440_5.z)

				local var_440_6 = var_440_0.localEulerAngles

				var_440_6.z = 0
				var_440_6.x = 0
				var_440_0.localEulerAngles = var_440_6
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 then
				var_440_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_440_7 = manager.ui.mainCamera.transform.position - var_440_0.position

				var_440_0.forward = Vector3.New(var_440_7.x, var_440_7.y, var_440_7.z)

				local var_440_8 = var_440_0.localEulerAngles

				var_440_8.z = 0
				var_440_8.x = 0
				var_440_0.localEulerAngles = var_440_8
			end

			local var_440_9 = arg_437_1.actors_["1076ui_story"]
			local var_440_10 = 0

			if var_440_10 < arg_437_1.time_ and arg_437_1.time_ <= var_440_10 + arg_440_0 and arg_437_1.var_.characterEffect1076ui_story == nil then
				arg_437_1.var_.characterEffect1076ui_story = var_440_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_11 = 0.200000002980232

			if var_440_10 <= arg_437_1.time_ and arg_437_1.time_ < var_440_10 + var_440_11 then
				local var_440_12 = (arg_437_1.time_ - var_440_10) / var_440_11

				if arg_437_1.var_.characterEffect1076ui_story then
					arg_437_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_437_1.time_ >= var_440_10 + var_440_11 and arg_437_1.time_ < var_440_10 + var_440_11 + arg_440_0 and arg_437_1.var_.characterEffect1076ui_story then
				arg_437_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_440_13 = 0

			if var_440_13 < arg_437_1.time_ and arg_437_1.time_ <= var_440_13 + arg_440_0 then
				arg_437_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_440_14 = arg_437_1.actors_["1072ui_story"]
			local var_440_15 = 0

			if var_440_15 < arg_437_1.time_ and arg_437_1.time_ <= var_440_15 + arg_440_0 and arg_437_1.var_.characterEffect1072ui_story == nil then
				arg_437_1.var_.characterEffect1072ui_story = var_440_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_16 = 0.200000002980232

			if var_440_15 <= arg_437_1.time_ and arg_437_1.time_ < var_440_15 + var_440_16 then
				local var_440_17 = (arg_437_1.time_ - var_440_15) / var_440_16

				if arg_437_1.var_.characterEffect1072ui_story then
					local var_440_18 = Mathf.Lerp(0, 0.5, var_440_17)

					arg_437_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_437_1.var_.characterEffect1072ui_story.fillRatio = var_440_18
				end
			end

			if arg_437_1.time_ >= var_440_15 + var_440_16 and arg_437_1.time_ < var_440_15 + var_440_16 + arg_440_0 and arg_437_1.var_.characterEffect1072ui_story then
				local var_440_19 = 0.5

				arg_437_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_437_1.var_.characterEffect1072ui_story.fillRatio = var_440_19
			end

			local var_440_20 = 0
			local var_440_21 = 0.55

			if var_440_20 < arg_437_1.time_ and arg_437_1.time_ <= var_440_20 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_22 = arg_437_1:FormatText(StoryNameCfg[389].name)

				arg_437_1.leftNameTxt_.text = var_440_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_23 = arg_437_1:GetWordFromCfg(221061104)
				local var_440_24 = arg_437_1:FormatText(var_440_23.content)

				arg_437_1.text_.text = var_440_24

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_25 = 22
				local var_440_26 = utf8.len(var_440_24)
				local var_440_27 = var_440_25 <= 0 and var_440_21 or var_440_21 * (var_440_26 / var_440_25)

				if var_440_27 > 0 and var_440_21 < var_440_27 then
					arg_437_1.talkMaxDuration = var_440_27

					if var_440_27 + var_440_20 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_27 + var_440_20
					end
				end

				arg_437_1.text_.text = var_440_24
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061104", "story_v_out_221061.awb") ~= 0 then
					local var_440_28 = manager.audio:GetVoiceLength("story_v_out_221061", "221061104", "story_v_out_221061.awb") / 1000

					if var_440_28 + var_440_20 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_28 + var_440_20
					end

					if var_440_23.prefab_name ~= "" and arg_437_1.actors_[var_440_23.prefab_name] ~= nil then
						local var_440_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_23.prefab_name].transform, "story_v_out_221061", "221061104", "story_v_out_221061.awb")

						arg_437_1:RecordAudio("221061104", var_440_29)
						arg_437_1:RecordAudio("221061104", var_440_29)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_221061", "221061104", "story_v_out_221061.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_221061", "221061104", "story_v_out_221061.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_30 = math.max(var_440_21, arg_437_1.talkMaxDuration)

			if var_440_20 <= arg_437_1.time_ and arg_437_1.time_ < var_440_20 + var_440_30 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_20) / var_440_30

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_20 + var_440_30 and arg_437_1.time_ < var_440_20 + var_440_30 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play221061105 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 221061105
		arg_441_1.duration_ = 4.1

		local var_441_0 = {
			ja = 4.1,
			ko = 2.3,
			zh = 2.3
		}
		local var_441_1 = manager.audio:GetLocalizationFlag()

		if var_441_0[var_441_1] ~= nil then
			arg_441_1.duration_ = var_441_0[var_441_1]
		end

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play221061106(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 0
			local var_444_1 = 0.15

			if var_444_0 < arg_441_1.time_ and arg_441_1.time_ <= var_444_0 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_2 = arg_441_1:FormatText(StoryNameCfg[389].name)

				arg_441_1.leftNameTxt_.text = var_444_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_3 = arg_441_1:GetWordFromCfg(221061105)
				local var_444_4 = arg_441_1:FormatText(var_444_3.content)

				arg_441_1.text_.text = var_444_4

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_5 = 6
				local var_444_6 = utf8.len(var_444_4)
				local var_444_7 = var_444_5 <= 0 and var_444_1 or var_444_1 * (var_444_6 / var_444_5)

				if var_444_7 > 0 and var_444_1 < var_444_7 then
					arg_441_1.talkMaxDuration = var_444_7

					if var_444_7 + var_444_0 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_7 + var_444_0
					end
				end

				arg_441_1.text_.text = var_444_4
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061105", "story_v_out_221061.awb") ~= 0 then
					local var_444_8 = manager.audio:GetVoiceLength("story_v_out_221061", "221061105", "story_v_out_221061.awb") / 1000

					if var_444_8 + var_444_0 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_8 + var_444_0
					end

					if var_444_3.prefab_name ~= "" and arg_441_1.actors_[var_444_3.prefab_name] ~= nil then
						local var_444_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_3.prefab_name].transform, "story_v_out_221061", "221061105", "story_v_out_221061.awb")

						arg_441_1:RecordAudio("221061105", var_444_9)
						arg_441_1:RecordAudio("221061105", var_444_9)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_out_221061", "221061105", "story_v_out_221061.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_out_221061", "221061105", "story_v_out_221061.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_10 = math.max(var_444_1, arg_441_1.talkMaxDuration)

			if var_444_0 <= arg_441_1.time_ and arg_441_1.time_ < var_444_0 + var_444_10 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_0) / var_444_10

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_0 + var_444_10 and arg_441_1.time_ < var_444_0 + var_444_10 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play221061106 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 221061106
		arg_445_1.duration_ = 9.133

		local var_445_0 = {
			ja = 7.033,
			ko = 9.133,
			zh = 9.133
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
				arg_445_0:Play221061107(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1072ui_story"].transform
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 then
				arg_445_1.var_.moveOldPos1072ui_story = var_448_0.localPosition
			end

			local var_448_2 = 0.001

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2
				local var_448_4 = Vector3.New(0.7, -0.71, -6)

				var_448_0.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos1072ui_story, var_448_4, var_448_3)

				local var_448_5 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_5.x, var_448_5.y, var_448_5.z)

				local var_448_6 = var_448_0.localEulerAngles

				var_448_6.z = 0
				var_448_6.x = 0
				var_448_0.localEulerAngles = var_448_6
			end

			if arg_445_1.time_ >= var_448_1 + var_448_2 and arg_445_1.time_ < var_448_1 + var_448_2 + arg_448_0 then
				var_448_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_448_7 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_7.x, var_448_7.y, var_448_7.z)

				local var_448_8 = var_448_0.localEulerAngles

				var_448_8.z = 0
				var_448_8.x = 0
				var_448_0.localEulerAngles = var_448_8
			end

			local var_448_9 = arg_445_1.actors_["1072ui_story"]
			local var_448_10 = 0

			if var_448_10 < arg_445_1.time_ and arg_445_1.time_ <= var_448_10 + arg_448_0 and arg_445_1.var_.characterEffect1072ui_story == nil then
				arg_445_1.var_.characterEffect1072ui_story = var_448_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_11 = 0.200000002980232

			if var_448_10 <= arg_445_1.time_ and arg_445_1.time_ < var_448_10 + var_448_11 then
				local var_448_12 = (arg_445_1.time_ - var_448_10) / var_448_11

				if arg_445_1.var_.characterEffect1072ui_story then
					arg_445_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_445_1.time_ >= var_448_10 + var_448_11 and arg_445_1.time_ < var_448_10 + var_448_11 + arg_448_0 and arg_445_1.var_.characterEffect1072ui_story then
				arg_445_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_448_13 = 0

			if var_448_13 < arg_445_1.time_ and arg_445_1.time_ <= var_448_13 + arg_448_0 then
				arg_445_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action7_1")
			end

			local var_448_14 = 0

			if var_448_14 < arg_445_1.time_ and arg_445_1.time_ <= var_448_14 + arg_448_0 then
				arg_445_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_448_15 = arg_445_1.actors_["1076ui_story"]
			local var_448_16 = 0

			if var_448_16 < arg_445_1.time_ and arg_445_1.time_ <= var_448_16 + arg_448_0 and arg_445_1.var_.characterEffect1076ui_story == nil then
				arg_445_1.var_.characterEffect1076ui_story = var_448_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_17 = 0.200000002980232

			if var_448_16 <= arg_445_1.time_ and arg_445_1.time_ < var_448_16 + var_448_17 then
				local var_448_18 = (arg_445_1.time_ - var_448_16) / var_448_17

				if arg_445_1.var_.characterEffect1076ui_story then
					local var_448_19 = Mathf.Lerp(0, 0.5, var_448_18)

					arg_445_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_445_1.var_.characterEffect1076ui_story.fillRatio = var_448_19
				end
			end

			if arg_445_1.time_ >= var_448_16 + var_448_17 and arg_445_1.time_ < var_448_16 + var_448_17 + arg_448_0 and arg_445_1.var_.characterEffect1076ui_story then
				local var_448_20 = 0.5

				arg_445_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_445_1.var_.characterEffect1076ui_story.fillRatio = var_448_20
			end

			local var_448_21 = 0
			local var_448_22 = 0.8

			if var_448_21 < arg_445_1.time_ and arg_445_1.time_ <= var_448_21 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_23 = arg_445_1:FormatText(StoryNameCfg[379].name)

				arg_445_1.leftNameTxt_.text = var_448_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_24 = arg_445_1:GetWordFromCfg(221061106)
				local var_448_25 = arg_445_1:FormatText(var_448_24.content)

				arg_445_1.text_.text = var_448_25

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_26 = 32
				local var_448_27 = utf8.len(var_448_25)
				local var_448_28 = var_448_26 <= 0 and var_448_22 or var_448_22 * (var_448_27 / var_448_26)

				if var_448_28 > 0 and var_448_22 < var_448_28 then
					arg_445_1.talkMaxDuration = var_448_28

					if var_448_28 + var_448_21 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_28 + var_448_21
					end
				end

				arg_445_1.text_.text = var_448_25
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061106", "story_v_out_221061.awb") ~= 0 then
					local var_448_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061106", "story_v_out_221061.awb") / 1000

					if var_448_29 + var_448_21 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_29 + var_448_21
					end

					if var_448_24.prefab_name ~= "" and arg_445_1.actors_[var_448_24.prefab_name] ~= nil then
						local var_448_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_24.prefab_name].transform, "story_v_out_221061", "221061106", "story_v_out_221061.awb")

						arg_445_1:RecordAudio("221061106", var_448_30)
						arg_445_1:RecordAudio("221061106", var_448_30)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_221061", "221061106", "story_v_out_221061.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_221061", "221061106", "story_v_out_221061.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_31 = math.max(var_448_22, arg_445_1.talkMaxDuration)

			if var_448_21 <= arg_445_1.time_ and arg_445_1.time_ < var_448_21 + var_448_31 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_21) / var_448_31

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_21 + var_448_31 and arg_445_1.time_ < var_448_21 + var_448_31 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play221061107 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 221061107
		arg_449_1.duration_ = 5

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play221061108(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["1072ui_story"]
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 and arg_449_1.var_.characterEffect1072ui_story == nil then
				arg_449_1.var_.characterEffect1072ui_story = var_452_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_2 = 0.200000002980232

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_2 then
				local var_452_3 = (arg_449_1.time_ - var_452_1) / var_452_2

				if arg_449_1.var_.characterEffect1072ui_story then
					local var_452_4 = Mathf.Lerp(0, 0.5, var_452_3)

					arg_449_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_449_1.var_.characterEffect1072ui_story.fillRatio = var_452_4
				end
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 and arg_449_1.var_.characterEffect1072ui_story then
				local var_452_5 = 0.5

				arg_449_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_449_1.var_.characterEffect1072ui_story.fillRatio = var_452_5
			end

			local var_452_6 = arg_449_1.actors_["1076ui_story"].transform
			local var_452_7 = 0

			if var_452_7 < arg_449_1.time_ and arg_449_1.time_ <= var_452_7 + arg_452_0 then
				arg_449_1.var_.moveOldPos1076ui_story = var_452_6.localPosition
			end

			local var_452_8 = 0.001

			if var_452_7 <= arg_449_1.time_ and arg_449_1.time_ < var_452_7 + var_452_8 then
				local var_452_9 = (arg_449_1.time_ - var_452_7) / var_452_8
				local var_452_10 = Vector3.New(0, 100, 0)

				var_452_6.localPosition = Vector3.Lerp(arg_449_1.var_.moveOldPos1076ui_story, var_452_10, var_452_9)

				local var_452_11 = manager.ui.mainCamera.transform.position - var_452_6.position

				var_452_6.forward = Vector3.New(var_452_11.x, var_452_11.y, var_452_11.z)

				local var_452_12 = var_452_6.localEulerAngles

				var_452_12.z = 0
				var_452_12.x = 0
				var_452_6.localEulerAngles = var_452_12
			end

			if arg_449_1.time_ >= var_452_7 + var_452_8 and arg_449_1.time_ < var_452_7 + var_452_8 + arg_452_0 then
				var_452_6.localPosition = Vector3.New(0, 100, 0)

				local var_452_13 = manager.ui.mainCamera.transform.position - var_452_6.position

				var_452_6.forward = Vector3.New(var_452_13.x, var_452_13.y, var_452_13.z)

				local var_452_14 = var_452_6.localEulerAngles

				var_452_14.z = 0
				var_452_14.x = 0
				var_452_6.localEulerAngles = var_452_14
			end

			local var_452_15 = arg_449_1.actors_["1072ui_story"].transform
			local var_452_16 = 0

			if var_452_16 < arg_449_1.time_ and arg_449_1.time_ <= var_452_16 + arg_452_0 then
				arg_449_1.var_.moveOldPos1072ui_story = var_452_15.localPosition
			end

			local var_452_17 = 0.001

			if var_452_16 <= arg_449_1.time_ and arg_449_1.time_ < var_452_16 + var_452_17 then
				local var_452_18 = (arg_449_1.time_ - var_452_16) / var_452_17
				local var_452_19 = Vector3.New(0, 100, 0)

				var_452_15.localPosition = Vector3.Lerp(arg_449_1.var_.moveOldPos1072ui_story, var_452_19, var_452_18)

				local var_452_20 = manager.ui.mainCamera.transform.position - var_452_15.position

				var_452_15.forward = Vector3.New(var_452_20.x, var_452_20.y, var_452_20.z)

				local var_452_21 = var_452_15.localEulerAngles

				var_452_21.z = 0
				var_452_21.x = 0
				var_452_15.localEulerAngles = var_452_21
			end

			if arg_449_1.time_ >= var_452_16 + var_452_17 and arg_449_1.time_ < var_452_16 + var_452_17 + arg_452_0 then
				var_452_15.localPosition = Vector3.New(0, 100, 0)

				local var_452_22 = manager.ui.mainCamera.transform.position - var_452_15.position

				var_452_15.forward = Vector3.New(var_452_22.x, var_452_22.y, var_452_22.z)

				local var_452_23 = var_452_15.localEulerAngles

				var_452_23.z = 0
				var_452_23.x = 0
				var_452_15.localEulerAngles = var_452_23
			end

			local var_452_24 = 0
			local var_452_25 = 0.633333333333333

			if var_452_24 < arg_449_1.time_ and arg_449_1.time_ <= var_452_24 + arg_452_0 then
				local var_452_26 = "play"
				local var_452_27 = "effect"

				arg_449_1:AudioAction(var_452_26, var_452_27, "se_story_221_00", "se_story_221_00_firework", "")
			end

			local var_452_28 = 0
			local var_452_29 = 0.7

			if var_452_28 < arg_449_1.time_ and arg_449_1.time_ <= var_452_28 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, false)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_30 = arg_449_1:GetWordFromCfg(221061107)
				local var_452_31 = arg_449_1:FormatText(var_452_30.content)

				arg_449_1.text_.text = var_452_31

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_32 = 28
				local var_452_33 = utf8.len(var_452_31)
				local var_452_34 = var_452_32 <= 0 and var_452_29 or var_452_29 * (var_452_33 / var_452_32)

				if var_452_34 > 0 and var_452_29 < var_452_34 then
					arg_449_1.talkMaxDuration = var_452_34

					if var_452_34 + var_452_28 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_34 + var_452_28
					end
				end

				arg_449_1.text_.text = var_452_31
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_35 = math.max(var_452_29, arg_449_1.talkMaxDuration)

			if var_452_28 <= arg_449_1.time_ and arg_449_1.time_ < var_452_28 + var_452_35 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_28) / var_452_35

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_28 + var_452_35 and arg_449_1.time_ < var_452_28 + var_452_35 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play221061108 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 221061108
		arg_453_1.duration_ = 6.133

		local var_453_0 = {
			ja = 6.133,
			ko = 3.6,
			zh = 3.6
		}
		local var_453_1 = manager.audio:GetLocalizationFlag()

		if var_453_0[var_453_1] ~= nil then
			arg_453_1.duration_ = var_453_0[var_453_1]
		end

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play221061109(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["1072ui_story"].transform
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 then
				arg_453_1.var_.moveOldPos1072ui_story = var_456_0.localPosition
			end

			local var_456_2 = 0.001

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2
				local var_456_4 = Vector3.New(0, -0.71, -6)

				var_456_0.localPosition = Vector3.Lerp(arg_453_1.var_.moveOldPos1072ui_story, var_456_4, var_456_3)

				local var_456_5 = manager.ui.mainCamera.transform.position - var_456_0.position

				var_456_0.forward = Vector3.New(var_456_5.x, var_456_5.y, var_456_5.z)

				local var_456_6 = var_456_0.localEulerAngles

				var_456_6.z = 0
				var_456_6.x = 0
				var_456_0.localEulerAngles = var_456_6
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 then
				var_456_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_456_7 = manager.ui.mainCamera.transform.position - var_456_0.position

				var_456_0.forward = Vector3.New(var_456_7.x, var_456_7.y, var_456_7.z)

				local var_456_8 = var_456_0.localEulerAngles

				var_456_8.z = 0
				var_456_8.x = 0
				var_456_0.localEulerAngles = var_456_8
			end

			local var_456_9 = arg_453_1.actors_["1072ui_story"]
			local var_456_10 = 0

			if var_456_10 < arg_453_1.time_ and arg_453_1.time_ <= var_456_10 + arg_456_0 and arg_453_1.var_.characterEffect1072ui_story == nil then
				arg_453_1.var_.characterEffect1072ui_story = var_456_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_11 = 0.200000002980232

			if var_456_10 <= arg_453_1.time_ and arg_453_1.time_ < var_456_10 + var_456_11 then
				local var_456_12 = (arg_453_1.time_ - var_456_10) / var_456_11

				if arg_453_1.var_.characterEffect1072ui_story then
					arg_453_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_453_1.time_ >= var_456_10 + var_456_11 and arg_453_1.time_ < var_456_10 + var_456_11 + arg_456_0 and arg_453_1.var_.characterEffect1072ui_story then
				arg_453_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_456_13 = 0

			if var_456_13 < arg_453_1.time_ and arg_453_1.time_ <= var_456_13 + arg_456_0 then
				arg_453_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_456_14 = 0

			if var_456_14 < arg_453_1.time_ and arg_453_1.time_ <= var_456_14 + arg_456_0 then
				arg_453_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_456_15 = 0
			local var_456_16 = 0.275

			if var_456_15 < arg_453_1.time_ and arg_453_1.time_ <= var_456_15 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_17 = arg_453_1:FormatText(StoryNameCfg[379].name)

				arg_453_1.leftNameTxt_.text = var_456_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_18 = arg_453_1:GetWordFromCfg(221061108)
				local var_456_19 = arg_453_1:FormatText(var_456_18.content)

				arg_453_1.text_.text = var_456_19

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_20 = 11
				local var_456_21 = utf8.len(var_456_19)
				local var_456_22 = var_456_20 <= 0 and var_456_16 or var_456_16 * (var_456_21 / var_456_20)

				if var_456_22 > 0 and var_456_16 < var_456_22 then
					arg_453_1.talkMaxDuration = var_456_22

					if var_456_22 + var_456_15 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_22 + var_456_15
					end
				end

				arg_453_1.text_.text = var_456_19
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061108", "story_v_out_221061.awb") ~= 0 then
					local var_456_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061108", "story_v_out_221061.awb") / 1000

					if var_456_23 + var_456_15 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_23 + var_456_15
					end

					if var_456_18.prefab_name ~= "" and arg_453_1.actors_[var_456_18.prefab_name] ~= nil then
						local var_456_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_18.prefab_name].transform, "story_v_out_221061", "221061108", "story_v_out_221061.awb")

						arg_453_1:RecordAudio("221061108", var_456_24)
						arg_453_1:RecordAudio("221061108", var_456_24)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_out_221061", "221061108", "story_v_out_221061.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_out_221061", "221061108", "story_v_out_221061.awb")
				end

				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_25 = math.max(var_456_16, arg_453_1.talkMaxDuration)

			if var_456_15 <= arg_453_1.time_ and arg_453_1.time_ < var_456_15 + var_456_25 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_15) / var_456_25

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_15 + var_456_25 and arg_453_1.time_ < var_456_15 + var_456_25 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play221061109 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 221061109
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play221061110(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1072ui_story"]
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 and arg_457_1.var_.characterEffect1072ui_story == nil then
				arg_457_1.var_.characterEffect1072ui_story = var_460_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_2 = 0.200000002980232

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2

				if arg_457_1.var_.characterEffect1072ui_story then
					local var_460_4 = Mathf.Lerp(0, 0.5, var_460_3)

					arg_457_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_457_1.var_.characterEffect1072ui_story.fillRatio = var_460_4
				end
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 and arg_457_1.var_.characterEffect1072ui_story then
				local var_460_5 = 0.5

				arg_457_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_457_1.var_.characterEffect1072ui_story.fillRatio = var_460_5
			end

			local var_460_6 = arg_457_1.actors_["1072ui_story"].transform
			local var_460_7 = 0

			if var_460_7 < arg_457_1.time_ and arg_457_1.time_ <= var_460_7 + arg_460_0 then
				arg_457_1.var_.moveOldPos1072ui_story = var_460_6.localPosition
			end

			local var_460_8 = 0.001

			if var_460_7 <= arg_457_1.time_ and arg_457_1.time_ < var_460_7 + var_460_8 then
				local var_460_9 = (arg_457_1.time_ - var_460_7) / var_460_8
				local var_460_10 = Vector3.New(0, 100, 0)

				var_460_6.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos1072ui_story, var_460_10, var_460_9)

				local var_460_11 = manager.ui.mainCamera.transform.position - var_460_6.position

				var_460_6.forward = Vector3.New(var_460_11.x, var_460_11.y, var_460_11.z)

				local var_460_12 = var_460_6.localEulerAngles

				var_460_12.z = 0
				var_460_12.x = 0
				var_460_6.localEulerAngles = var_460_12
			end

			if arg_457_1.time_ >= var_460_7 + var_460_8 and arg_457_1.time_ < var_460_7 + var_460_8 + arg_460_0 then
				var_460_6.localPosition = Vector3.New(0, 100, 0)

				local var_460_13 = manager.ui.mainCamera.transform.position - var_460_6.position

				var_460_6.forward = Vector3.New(var_460_13.x, var_460_13.y, var_460_13.z)

				local var_460_14 = var_460_6.localEulerAngles

				var_460_14.z = 0
				var_460_14.x = 0
				var_460_6.localEulerAngles = var_460_14
			end

			local var_460_15 = 0
			local var_460_16 = 1.125

			if var_460_15 < arg_457_1.time_ and arg_457_1.time_ <= var_460_15 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, false)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_17 = arg_457_1:GetWordFromCfg(221061109)
				local var_460_18 = arg_457_1:FormatText(var_460_17.content)

				arg_457_1.text_.text = var_460_18

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_19 = 45
				local var_460_20 = utf8.len(var_460_18)
				local var_460_21 = var_460_19 <= 0 and var_460_16 or var_460_16 * (var_460_20 / var_460_19)

				if var_460_21 > 0 and var_460_16 < var_460_21 then
					arg_457_1.talkMaxDuration = var_460_21

					if var_460_21 + var_460_15 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_21 + var_460_15
					end
				end

				arg_457_1.text_.text = var_460_18
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_22 = math.max(var_460_16, arg_457_1.talkMaxDuration)

			if var_460_15 <= arg_457_1.time_ and arg_457_1.time_ < var_460_15 + var_460_22 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_15) / var_460_22

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_15 + var_460_22 and arg_457_1.time_ < var_460_15 + var_460_22 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play221061110 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 221061110
		arg_461_1.duration_ = 10

		local var_461_0 = {
			ja = 9.033,
			ko = 10,
			zh = 10
		}
		local var_461_1 = manager.audio:GetLocalizationFlag()

		if var_461_0[var_461_1] ~= nil then
			arg_461_1.duration_ = var_461_0[var_461_1]
		end

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play221061111(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1072ui_story"].transform
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 then
				arg_461_1.var_.moveOldPos1072ui_story = var_464_0.localPosition
			end

			local var_464_2 = 0.001

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2
				local var_464_4 = Vector3.New(0, -0.71, -6)

				var_464_0.localPosition = Vector3.Lerp(arg_461_1.var_.moveOldPos1072ui_story, var_464_4, var_464_3)

				local var_464_5 = manager.ui.mainCamera.transform.position - var_464_0.position

				var_464_0.forward = Vector3.New(var_464_5.x, var_464_5.y, var_464_5.z)

				local var_464_6 = var_464_0.localEulerAngles

				var_464_6.z = 0
				var_464_6.x = 0
				var_464_0.localEulerAngles = var_464_6
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 then
				var_464_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_464_7 = manager.ui.mainCamera.transform.position - var_464_0.position

				var_464_0.forward = Vector3.New(var_464_7.x, var_464_7.y, var_464_7.z)

				local var_464_8 = var_464_0.localEulerAngles

				var_464_8.z = 0
				var_464_8.x = 0
				var_464_0.localEulerAngles = var_464_8
			end

			local var_464_9 = arg_461_1.actors_["1072ui_story"]
			local var_464_10 = 0

			if var_464_10 < arg_461_1.time_ and arg_461_1.time_ <= var_464_10 + arg_464_0 and arg_461_1.var_.characterEffect1072ui_story == nil then
				arg_461_1.var_.characterEffect1072ui_story = var_464_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_11 = 0.200000002980232

			if var_464_10 <= arg_461_1.time_ and arg_461_1.time_ < var_464_10 + var_464_11 then
				local var_464_12 = (arg_461_1.time_ - var_464_10) / var_464_11

				if arg_461_1.var_.characterEffect1072ui_story then
					arg_461_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_461_1.time_ >= var_464_10 + var_464_11 and arg_461_1.time_ < var_464_10 + var_464_11 + arg_464_0 and arg_461_1.var_.characterEffect1072ui_story then
				arg_461_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_464_13 = 0

			if var_464_13 < arg_461_1.time_ and arg_461_1.time_ <= var_464_13 + arg_464_0 then
				arg_461_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_464_14 = 0

			if var_464_14 < arg_461_1.time_ and arg_461_1.time_ <= var_464_14 + arg_464_0 then
				arg_461_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_464_15 = 0
			local var_464_16 = 0.95

			if var_464_15 < arg_461_1.time_ and arg_461_1.time_ <= var_464_15 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_17 = arg_461_1:FormatText(StoryNameCfg[379].name)

				arg_461_1.leftNameTxt_.text = var_464_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_18 = arg_461_1:GetWordFromCfg(221061110)
				local var_464_19 = arg_461_1:FormatText(var_464_18.content)

				arg_461_1.text_.text = var_464_19

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_20 = 38
				local var_464_21 = utf8.len(var_464_19)
				local var_464_22 = var_464_20 <= 0 and var_464_16 or var_464_16 * (var_464_21 / var_464_20)

				if var_464_22 > 0 and var_464_16 < var_464_22 then
					arg_461_1.talkMaxDuration = var_464_22

					if var_464_22 + var_464_15 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_22 + var_464_15
					end
				end

				arg_461_1.text_.text = var_464_19
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061110", "story_v_out_221061.awb") ~= 0 then
					local var_464_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061110", "story_v_out_221061.awb") / 1000

					if var_464_23 + var_464_15 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_23 + var_464_15
					end

					if var_464_18.prefab_name ~= "" and arg_461_1.actors_[var_464_18.prefab_name] ~= nil then
						local var_464_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_18.prefab_name].transform, "story_v_out_221061", "221061110", "story_v_out_221061.awb")

						arg_461_1:RecordAudio("221061110", var_464_24)
						arg_461_1:RecordAudio("221061110", var_464_24)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_221061", "221061110", "story_v_out_221061.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_221061", "221061110", "story_v_out_221061.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_25 = math.max(var_464_16, arg_461_1.talkMaxDuration)

			if var_464_15 <= arg_461_1.time_ and arg_461_1.time_ < var_464_15 + var_464_25 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_15) / var_464_25

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_15 + var_464_25 and arg_461_1.time_ < var_464_15 + var_464_25 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play221061111 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 221061111
		arg_465_1.duration_ = 3.933

		local var_465_0 = {
			ja = 3.833,
			ko = 3.933,
			zh = 3.933
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
				arg_465_0:Play221061112(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = 0

			if var_468_0 < arg_465_1.time_ and arg_465_1.time_ <= var_468_0 + arg_468_0 then
				arg_465_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_1")
			end

			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 then
				arg_465_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_468_2 = 0
			local var_468_3 = 0.375

			if var_468_2 < arg_465_1.time_ and arg_465_1.time_ <= var_468_2 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_4 = arg_465_1:FormatText(StoryNameCfg[379].name)

				arg_465_1.leftNameTxt_.text = var_468_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_5 = arg_465_1:GetWordFromCfg(221061111)
				local var_468_6 = arg_465_1:FormatText(var_468_5.content)

				arg_465_1.text_.text = var_468_6

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_7 = 15
				local var_468_8 = utf8.len(var_468_6)
				local var_468_9 = var_468_7 <= 0 and var_468_3 or var_468_3 * (var_468_8 / var_468_7)

				if var_468_9 > 0 and var_468_3 < var_468_9 then
					arg_465_1.talkMaxDuration = var_468_9

					if var_468_9 + var_468_2 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_9 + var_468_2
					end
				end

				arg_465_1.text_.text = var_468_6
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061111", "story_v_out_221061.awb") ~= 0 then
					local var_468_10 = manager.audio:GetVoiceLength("story_v_out_221061", "221061111", "story_v_out_221061.awb") / 1000

					if var_468_10 + var_468_2 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_10 + var_468_2
					end

					if var_468_5.prefab_name ~= "" and arg_465_1.actors_[var_468_5.prefab_name] ~= nil then
						local var_468_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_5.prefab_name].transform, "story_v_out_221061", "221061111", "story_v_out_221061.awb")

						arg_465_1:RecordAudio("221061111", var_468_11)
						arg_465_1:RecordAudio("221061111", var_468_11)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_221061", "221061111", "story_v_out_221061.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_221061", "221061111", "story_v_out_221061.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_12 = math.max(var_468_3, arg_465_1.talkMaxDuration)

			if var_468_2 <= arg_465_1.time_ and arg_465_1.time_ < var_468_2 + var_468_12 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_2) / var_468_12

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_2 + var_468_12 and arg_465_1.time_ < var_468_2 + var_468_12 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play221061112 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 221061112
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play221061113(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1072ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect1072ui_story == nil then
				arg_469_1.var_.characterEffect1072ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.200000002980232

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect1072ui_story then
					local var_472_4 = Mathf.Lerp(0, 0.5, var_472_3)

					arg_469_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_469_1.var_.characterEffect1072ui_story.fillRatio = var_472_4
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect1072ui_story then
				local var_472_5 = 0.5

				arg_469_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_469_1.var_.characterEffect1072ui_story.fillRatio = var_472_5
			end

			local var_472_6 = arg_469_1.actors_["1072ui_story"].transform
			local var_472_7 = 0

			if var_472_7 < arg_469_1.time_ and arg_469_1.time_ <= var_472_7 + arg_472_0 then
				arg_469_1.var_.moveOldPos1072ui_story = var_472_6.localPosition
			end

			local var_472_8 = 0.001

			if var_472_7 <= arg_469_1.time_ and arg_469_1.time_ < var_472_7 + var_472_8 then
				local var_472_9 = (arg_469_1.time_ - var_472_7) / var_472_8
				local var_472_10 = Vector3.New(0, 100, 0)

				var_472_6.localPosition = Vector3.Lerp(arg_469_1.var_.moveOldPos1072ui_story, var_472_10, var_472_9)

				local var_472_11 = manager.ui.mainCamera.transform.position - var_472_6.position

				var_472_6.forward = Vector3.New(var_472_11.x, var_472_11.y, var_472_11.z)

				local var_472_12 = var_472_6.localEulerAngles

				var_472_12.z = 0
				var_472_12.x = 0
				var_472_6.localEulerAngles = var_472_12
			end

			if arg_469_1.time_ >= var_472_7 + var_472_8 and arg_469_1.time_ < var_472_7 + var_472_8 + arg_472_0 then
				var_472_6.localPosition = Vector3.New(0, 100, 0)

				local var_472_13 = manager.ui.mainCamera.transform.position - var_472_6.position

				var_472_6.forward = Vector3.New(var_472_13.x, var_472_13.y, var_472_13.z)

				local var_472_14 = var_472_6.localEulerAngles

				var_472_14.z = 0
				var_472_14.x = 0
				var_472_6.localEulerAngles = var_472_14
			end

			local var_472_15 = 0
			local var_472_16 = 1

			if var_472_15 < arg_469_1.time_ and arg_469_1.time_ <= var_472_15 + arg_472_0 then
				local var_472_17 = "play"
				local var_472_18 = "effect"

				arg_469_1:AudioAction(var_472_17, var_472_18, "se_story_221_00", "se_story_221_00_firework_loop", "")
			end

			local var_472_19 = 0
			local var_472_20 = 1.2

			if var_472_19 < arg_469_1.time_ and arg_469_1.time_ <= var_472_19 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, false)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_21 = arg_469_1:GetWordFromCfg(221061112)
				local var_472_22 = arg_469_1:FormatText(var_472_21.content)

				arg_469_1.text_.text = var_472_22

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_23 = 48
				local var_472_24 = utf8.len(var_472_22)
				local var_472_25 = var_472_23 <= 0 and var_472_20 or var_472_20 * (var_472_24 / var_472_23)

				if var_472_25 > 0 and var_472_20 < var_472_25 then
					arg_469_1.talkMaxDuration = var_472_25

					if var_472_25 + var_472_19 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_25 + var_472_19
					end
				end

				arg_469_1.text_.text = var_472_22
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_26 = math.max(var_472_20, arg_469_1.talkMaxDuration)

			if var_472_19 <= arg_469_1.time_ and arg_469_1.time_ < var_472_19 + var_472_26 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_19) / var_472_26

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_19 + var_472_26 and arg_469_1.time_ < var_472_19 + var_472_26 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play221061113 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 221061113
		arg_473_1.duration_ = 7.333

		local var_473_0 = {
			ja = 7.333,
			ko = 5.933,
			zh = 5.933
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
				arg_473_0:Play221061114(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["1072ui_story"].transform
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 then
				arg_473_1.var_.moveOldPos1072ui_story = var_476_0.localPosition
			end

			local var_476_2 = 0.001

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2
				local var_476_4 = Vector3.New(-0.7, -0.71, -6)

				var_476_0.localPosition = Vector3.Lerp(arg_473_1.var_.moveOldPos1072ui_story, var_476_4, var_476_3)

				local var_476_5 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_5.x, var_476_5.y, var_476_5.z)

				local var_476_6 = var_476_0.localEulerAngles

				var_476_6.z = 0
				var_476_6.x = 0
				var_476_0.localEulerAngles = var_476_6
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 then
				var_476_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_476_7 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_7.x, var_476_7.y, var_476_7.z)

				local var_476_8 = var_476_0.localEulerAngles

				var_476_8.z = 0
				var_476_8.x = 0
				var_476_0.localEulerAngles = var_476_8
			end

			local var_476_9 = arg_473_1.actors_["1072ui_story"]
			local var_476_10 = 0

			if var_476_10 < arg_473_1.time_ and arg_473_1.time_ <= var_476_10 + arg_476_0 and arg_473_1.var_.characterEffect1072ui_story == nil then
				arg_473_1.var_.characterEffect1072ui_story = var_476_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_11 = 0.200000002980232

			if var_476_10 <= arg_473_1.time_ and arg_473_1.time_ < var_476_10 + var_476_11 then
				local var_476_12 = (arg_473_1.time_ - var_476_10) / var_476_11

				if arg_473_1.var_.characterEffect1072ui_story then
					arg_473_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_473_1.time_ >= var_476_10 + var_476_11 and arg_473_1.time_ < var_476_10 + var_476_11 + arg_476_0 and arg_473_1.var_.characterEffect1072ui_story then
				arg_473_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_476_13 = 0

			if var_476_13 < arg_473_1.time_ and arg_473_1.time_ <= var_476_13 + arg_476_0 then
				arg_473_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_476_14 = 0

			if var_476_14 < arg_473_1.time_ and arg_473_1.time_ <= var_476_14 + arg_476_0 then
				arg_473_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_476_15 = 0
			local var_476_16 = 0.75

			if var_476_15 < arg_473_1.time_ and arg_473_1.time_ <= var_476_15 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_17 = arg_473_1:FormatText(StoryNameCfg[379].name)

				arg_473_1.leftNameTxt_.text = var_476_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_18 = arg_473_1:GetWordFromCfg(221061113)
				local var_476_19 = arg_473_1:FormatText(var_476_18.content)

				arg_473_1.text_.text = var_476_19

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_20 = 30
				local var_476_21 = utf8.len(var_476_19)
				local var_476_22 = var_476_20 <= 0 and var_476_16 or var_476_16 * (var_476_21 / var_476_20)

				if var_476_22 > 0 and var_476_16 < var_476_22 then
					arg_473_1.talkMaxDuration = var_476_22

					if var_476_22 + var_476_15 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_22 + var_476_15
					end
				end

				arg_473_1.text_.text = var_476_19
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061113", "story_v_out_221061.awb") ~= 0 then
					local var_476_23 = manager.audio:GetVoiceLength("story_v_out_221061", "221061113", "story_v_out_221061.awb") / 1000

					if var_476_23 + var_476_15 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_23 + var_476_15
					end

					if var_476_18.prefab_name ~= "" and arg_473_1.actors_[var_476_18.prefab_name] ~= nil then
						local var_476_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_18.prefab_name].transform, "story_v_out_221061", "221061113", "story_v_out_221061.awb")

						arg_473_1:RecordAudio("221061113", var_476_24)
						arg_473_1:RecordAudio("221061113", var_476_24)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_221061", "221061113", "story_v_out_221061.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_221061", "221061113", "story_v_out_221061.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_25 = math.max(var_476_16, arg_473_1.talkMaxDuration)

			if var_476_15 <= arg_473_1.time_ and arg_473_1.time_ < var_476_15 + var_476_25 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_15) / var_476_25

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_15 + var_476_25 and arg_473_1.time_ < var_476_15 + var_476_25 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play221061114 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 221061114
		arg_477_1.duration_ = 11.766

		local var_477_0 = {
			ja = 11.766,
			ko = 9.566,
			zh = 9.566
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
				arg_477_0:Play221061115(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1076ui_story"].transform
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.var_.moveOldPos1076ui_story = var_480_0.localPosition
			end

			local var_480_2 = 0.001

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2
				local var_480_4 = Vector3.New(0.7, -1.06, -6.2)

				var_480_0.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1076ui_story, var_480_4, var_480_3)

				local var_480_5 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_5.x, var_480_5.y, var_480_5.z)

				local var_480_6 = var_480_0.localEulerAngles

				var_480_6.z = 0
				var_480_6.x = 0
				var_480_0.localEulerAngles = var_480_6
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 then
				var_480_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_480_7 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_7.x, var_480_7.y, var_480_7.z)

				local var_480_8 = var_480_0.localEulerAngles

				var_480_8.z = 0
				var_480_8.x = 0
				var_480_0.localEulerAngles = var_480_8
			end

			local var_480_9 = arg_477_1.actors_["1076ui_story"]
			local var_480_10 = 0

			if var_480_10 < arg_477_1.time_ and arg_477_1.time_ <= var_480_10 + arg_480_0 and arg_477_1.var_.characterEffect1076ui_story == nil then
				arg_477_1.var_.characterEffect1076ui_story = var_480_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_11 = 0.200000002980232

			if var_480_10 <= arg_477_1.time_ and arg_477_1.time_ < var_480_10 + var_480_11 then
				local var_480_12 = (arg_477_1.time_ - var_480_10) / var_480_11

				if arg_477_1.var_.characterEffect1076ui_story then
					arg_477_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_477_1.time_ >= var_480_10 + var_480_11 and arg_477_1.time_ < var_480_10 + var_480_11 + arg_480_0 and arg_477_1.var_.characterEffect1076ui_story then
				arg_477_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_480_13 = 0

			if var_480_13 < arg_477_1.time_ and arg_477_1.time_ <= var_480_13 + arg_480_0 then
				arg_477_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action7_1")
			end

			local var_480_14 = 0

			if var_480_14 < arg_477_1.time_ and arg_477_1.time_ <= var_480_14 + arg_480_0 then
				arg_477_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_480_15 = arg_477_1.actors_["1072ui_story"]
			local var_480_16 = 0

			if var_480_16 < arg_477_1.time_ and arg_477_1.time_ <= var_480_16 + arg_480_0 and arg_477_1.var_.characterEffect1072ui_story == nil then
				arg_477_1.var_.characterEffect1072ui_story = var_480_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_17 = 0.200000002980232

			if var_480_16 <= arg_477_1.time_ and arg_477_1.time_ < var_480_16 + var_480_17 then
				local var_480_18 = (arg_477_1.time_ - var_480_16) / var_480_17

				if arg_477_1.var_.characterEffect1072ui_story then
					local var_480_19 = Mathf.Lerp(0, 0.5, var_480_18)

					arg_477_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_477_1.var_.characterEffect1072ui_story.fillRatio = var_480_19
				end
			end

			if arg_477_1.time_ >= var_480_16 + var_480_17 and arg_477_1.time_ < var_480_16 + var_480_17 + arg_480_0 and arg_477_1.var_.characterEffect1072ui_story then
				local var_480_20 = 0.5

				arg_477_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_477_1.var_.characterEffect1072ui_story.fillRatio = var_480_20
			end

			local var_480_21 = 0
			local var_480_22 = 0.725

			if var_480_21 < arg_477_1.time_ and arg_477_1.time_ <= var_480_21 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_23 = arg_477_1:FormatText(StoryNameCfg[389].name)

				arg_477_1.leftNameTxt_.text = var_480_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_24 = arg_477_1:GetWordFromCfg(221061114)
				local var_480_25 = arg_477_1:FormatText(var_480_24.content)

				arg_477_1.text_.text = var_480_25

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_26 = 29
				local var_480_27 = utf8.len(var_480_25)
				local var_480_28 = var_480_26 <= 0 and var_480_22 or var_480_22 * (var_480_27 / var_480_26)

				if var_480_28 > 0 and var_480_22 < var_480_28 then
					arg_477_1.talkMaxDuration = var_480_28

					if var_480_28 + var_480_21 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_28 + var_480_21
					end
				end

				arg_477_1.text_.text = var_480_25
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061114", "story_v_out_221061.awb") ~= 0 then
					local var_480_29 = manager.audio:GetVoiceLength("story_v_out_221061", "221061114", "story_v_out_221061.awb") / 1000

					if var_480_29 + var_480_21 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_29 + var_480_21
					end

					if var_480_24.prefab_name ~= "" and arg_477_1.actors_[var_480_24.prefab_name] ~= nil then
						local var_480_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_24.prefab_name].transform, "story_v_out_221061", "221061114", "story_v_out_221061.awb")

						arg_477_1:RecordAudio("221061114", var_480_30)
						arg_477_1:RecordAudio("221061114", var_480_30)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_221061", "221061114", "story_v_out_221061.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_221061", "221061114", "story_v_out_221061.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_31 = math.max(var_480_22, arg_477_1.talkMaxDuration)

			if var_480_21 <= arg_477_1.time_ and arg_477_1.time_ < var_480_21 + var_480_31 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_21) / var_480_31

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_21 + var_480_31 and arg_477_1.time_ < var_480_21 + var_480_31 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play221061115 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 221061115
		arg_481_1.duration_ = 10.066

		local var_481_0 = {
			ja = 8.7,
			ko = 10.066,
			zh = 10.066
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
				arg_481_0:Play221061116(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["1076ui_story"]
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 and arg_481_1.var_.characterEffect1076ui_story == nil then
				arg_481_1.var_.characterEffect1076ui_story = var_484_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_2 = 0.200000002980232

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2

				if arg_481_1.var_.characterEffect1076ui_story then
					local var_484_4 = Mathf.Lerp(0, 0.5, var_484_3)

					arg_481_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_481_1.var_.characterEffect1076ui_story.fillRatio = var_484_4
				end
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 and arg_481_1.var_.characterEffect1076ui_story then
				local var_484_5 = 0.5

				arg_481_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_481_1.var_.characterEffect1076ui_story.fillRatio = var_484_5
			end

			local var_484_6 = 0
			local var_484_7 = 0.933333333333333

			if var_484_6 < arg_481_1.time_ and arg_481_1.time_ <= var_484_6 + arg_484_0 then
				local var_484_8 = "stop"
				local var_484_9 = "effect"

				arg_481_1:AudioAction(var_484_8, var_484_9, "se_story_221_00", "se_story_221_00_firework_loop", "")
			end

			local var_484_10 = 0
			local var_484_11 = 0.825

			if var_484_10 < arg_481_1.time_ and arg_481_1.time_ <= var_484_10 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, false)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_12 = arg_481_1:GetWordFromCfg(221061115)
				local var_484_13 = arg_481_1:FormatText(var_484_12.content)

				arg_481_1.text_.text = var_484_13

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_14 = 33
				local var_484_15 = utf8.len(var_484_13)
				local var_484_16 = var_484_14 <= 0 and var_484_11 or var_484_11 * (var_484_15 / var_484_14)

				if var_484_16 > 0 and var_484_11 < var_484_16 then
					arg_481_1.talkMaxDuration = var_484_16

					if var_484_16 + var_484_10 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_16 + var_484_10
					end
				end

				arg_481_1.text_.text = var_484_13
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_221061", "221061115", "story_v_out_221061.awb") ~= 0 then
					local var_484_17 = manager.audio:GetVoiceLength("story_v_out_221061", "221061115", "story_v_out_221061.awb") / 1000

					if var_484_17 + var_484_10 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_17 + var_484_10
					end

					if var_484_12.prefab_name ~= "" and arg_481_1.actors_[var_484_12.prefab_name] ~= nil then
						local var_484_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_12.prefab_name].transform, "story_v_out_221061", "221061115", "story_v_out_221061.awb")

						arg_481_1:RecordAudio("221061115", var_484_18)
						arg_481_1:RecordAudio("221061115", var_484_18)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_221061", "221061115", "story_v_out_221061.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_221061", "221061115", "story_v_out_221061.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_19 = math.max(var_484_11, arg_481_1.talkMaxDuration)

			if var_484_10 <= arg_481_1.time_ and arg_481_1.time_ < var_484_10 + var_484_19 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_10) / var_484_19

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_10 + var_484_19 and arg_481_1.time_ < var_484_10 + var_484_19 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play221061116 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 221061116
		arg_485_1.duration_ = 4.799999999999

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
			arg_485_1.auto_ = false
		end

		function arg_485_1.playNext_(arg_487_0)
			arg_485_1.onStoryFinished_()
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 2

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				local var_488_1 = manager.ui.mainCamera.transform.localPosition
				local var_488_2 = Vector3.New(0, 0, 10) + Vector3.New(var_488_1.x, var_488_1.y, 0)
				local var_488_3 = arg_485_1.bgs_.STblack

				var_488_3.transform.localPosition = var_488_2
				var_488_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_488_4 = var_488_3:GetComponent("SpriteRenderer")

				if var_488_4 and var_488_4.sprite then
					local var_488_5 = (var_488_3.transform.localPosition - var_488_1).z
					local var_488_6 = manager.ui.mainCameraCom_
					local var_488_7 = 2 * var_488_5 * Mathf.Tan(var_488_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_488_8 = var_488_7 * var_488_6.aspect
					local var_488_9 = var_488_4.sprite.bounds.size.x
					local var_488_10 = var_488_4.sprite.bounds.size.y
					local var_488_11 = var_488_8 / var_488_9
					local var_488_12 = var_488_7 / var_488_10
					local var_488_13 = var_488_12 < var_488_11 and var_488_11 or var_488_12

					var_488_3.transform.localScale = Vector3.New(var_488_13, var_488_13, 0)
				end

				for iter_488_0, iter_488_1 in pairs(arg_485_1.bgs_) do
					if iter_488_0 ~= "STblack" then
						iter_488_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_488_14 = 0

			if var_488_14 < arg_485_1.time_ and arg_485_1.time_ <= var_488_14 + arg_488_0 then
				arg_485_1.mask_.enabled = true
				arg_485_1.mask_.raycastTarget = true

				arg_485_1:SetGaussion(false)
			end

			local var_488_15 = 2

			if var_488_14 <= arg_485_1.time_ and arg_485_1.time_ < var_488_14 + var_488_15 then
				local var_488_16 = (arg_485_1.time_ - var_488_14) / var_488_15
				local var_488_17 = Color.New(0, 0, 0)

				var_488_17.a = Mathf.Lerp(0, 1, var_488_16)
				arg_485_1.mask_.color = var_488_17
			end

			if arg_485_1.time_ >= var_488_14 + var_488_15 and arg_485_1.time_ < var_488_14 + var_488_15 + arg_488_0 then
				local var_488_18 = Color.New(0, 0, 0)

				var_488_18.a = 1
				arg_485_1.mask_.color = var_488_18
			end

			local var_488_19 = 2

			if var_488_19 < arg_485_1.time_ and arg_485_1.time_ <= var_488_19 + arg_488_0 then
				arg_485_1.mask_.enabled = true
				arg_485_1.mask_.raycastTarget = true

				arg_485_1:SetGaussion(false)
			end

			local var_488_20 = 2

			if var_488_19 <= arg_485_1.time_ and arg_485_1.time_ < var_488_19 + var_488_20 then
				local var_488_21 = (arg_485_1.time_ - var_488_19) / var_488_20
				local var_488_22 = Color.New(0, 0, 0)

				var_488_22.a = Mathf.Lerp(1, 0, var_488_21)
				arg_485_1.mask_.color = var_488_22
			end

			if arg_485_1.time_ >= var_488_19 + var_488_20 and arg_485_1.time_ < var_488_19 + var_488_20 + arg_488_0 then
				local var_488_23 = Color.New(0, 0, 0)
				local var_488_24 = 0

				arg_485_1.mask_.enabled = false
				var_488_23.a = var_488_24
				arg_485_1.mask_.color = var_488_23
			end

			local var_488_25 = 0

			if var_488_25 < arg_485_1.time_ and arg_485_1.time_ <= var_488_25 + arg_488_0 then
				arg_485_1.fswbg_:SetActive(true)
				arg_485_1.dialog_:SetActive(false)

				arg_485_1.fswtw_.percent = 0

				local var_488_26 = arg_485_1:GetWordFromCfg(221061116)
				local var_488_27 = arg_485_1:FormatText(var_488_26.content)

				arg_485_1.fswt_.text = var_488_27

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.fswt_)

				arg_485_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_485_1.fswtw_:SetDirty()

				arg_485_1.typewritterCharCountI18N = 0

				SetActive(arg_485_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_485_1:ShowNextGo(false)
			end

			local var_488_28 = 2

			if var_488_28 < arg_485_1.time_ and arg_485_1.time_ <= var_488_28 + arg_488_0 then
				arg_485_1.var_.oldValueTypewriter = arg_485_1.fswtw_.percent

				arg_485_1:ShowNextGo(false)
			end

			local var_488_29 = 18
			local var_488_30 = 1.2
			local var_488_31 = arg_485_1:GetWordFromCfg(221061116)
			local var_488_32 = arg_485_1:FormatText(var_488_31.content)
			local var_488_33, var_488_34 = arg_485_1:GetPercentByPara(var_488_32, 1)

			if var_488_28 < arg_485_1.time_ and arg_485_1.time_ <= var_488_28 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0

				local var_488_35 = var_488_29 <= 0 and var_488_30 or var_488_30 * ((var_488_34 - arg_485_1.typewritterCharCountI18N) / var_488_29)

				if var_488_35 > 0 and var_488_30 < var_488_35 then
					arg_485_1.talkMaxDuration = var_488_35

					if var_488_35 + var_488_28 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_35 + var_488_28
					end
				end
			end

			local var_488_36 = 1.2
			local var_488_37 = math.max(var_488_36, arg_485_1.talkMaxDuration)

			if var_488_28 <= arg_485_1.time_ and arg_485_1.time_ < var_488_28 + var_488_37 then
				local var_488_38 = (arg_485_1.time_ - var_488_28) / var_488_37

				arg_485_1.fswtw_.percent = Mathf.Lerp(arg_485_1.var_.oldValueTypewriter, var_488_33, var_488_38)
				arg_485_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_485_1.fswtw_:SetDirty()
			end

			if arg_485_1.time_ >= var_488_28 + var_488_37 and arg_485_1.time_ < var_488_28 + var_488_37 + arg_488_0 then
				arg_485_1.fswtw_.percent = var_488_33

				arg_485_1.fswtw_:SetDirty()
				arg_485_1:ShowNextGo(true)

				arg_485_1.typewritterCharCountI18N = var_488_34
			end

			local var_488_39 = arg_485_1.actors_["1072ui_story"].transform
			local var_488_40 = 1.966

			if var_488_40 < arg_485_1.time_ and arg_485_1.time_ <= var_488_40 + arg_488_0 then
				arg_485_1.var_.moveOldPos1072ui_story = var_488_39.localPosition
			end

			local var_488_41 = 0.001

			if var_488_40 <= arg_485_1.time_ and arg_485_1.time_ < var_488_40 + var_488_41 then
				local var_488_42 = (arg_485_1.time_ - var_488_40) / var_488_41
				local var_488_43 = Vector3.New(0, 100, 0)

				var_488_39.localPosition = Vector3.Lerp(arg_485_1.var_.moveOldPos1072ui_story, var_488_43, var_488_42)

				local var_488_44 = manager.ui.mainCamera.transform.position - var_488_39.position

				var_488_39.forward = Vector3.New(var_488_44.x, var_488_44.y, var_488_44.z)

				local var_488_45 = var_488_39.localEulerAngles

				var_488_45.z = 0
				var_488_45.x = 0
				var_488_39.localEulerAngles = var_488_45
			end

			if arg_485_1.time_ >= var_488_40 + var_488_41 and arg_485_1.time_ < var_488_40 + var_488_41 + arg_488_0 then
				var_488_39.localPosition = Vector3.New(0, 100, 0)

				local var_488_46 = manager.ui.mainCamera.transform.position - var_488_39.position

				var_488_39.forward = Vector3.New(var_488_46.x, var_488_46.y, var_488_46.z)

				local var_488_47 = var_488_39.localEulerAngles

				var_488_47.z = 0
				var_488_47.x = 0
				var_488_39.localEulerAngles = var_488_47
			end

			local var_488_48 = arg_485_1.actors_["1076ui_story"].transform
			local var_488_49 = 1.966

			if var_488_49 < arg_485_1.time_ and arg_485_1.time_ <= var_488_49 + arg_488_0 then
				arg_485_1.var_.moveOldPos1076ui_story = var_488_48.localPosition
			end

			local var_488_50 = 0.001

			if var_488_49 <= arg_485_1.time_ and arg_485_1.time_ < var_488_49 + var_488_50 then
				local var_488_51 = (arg_485_1.time_ - var_488_49) / var_488_50
				local var_488_52 = Vector3.New(0, 100, 0)

				var_488_48.localPosition = Vector3.Lerp(arg_485_1.var_.moveOldPos1076ui_story, var_488_52, var_488_51)

				local var_488_53 = manager.ui.mainCamera.transform.position - var_488_48.position

				var_488_48.forward = Vector3.New(var_488_53.x, var_488_53.y, var_488_53.z)

				local var_488_54 = var_488_48.localEulerAngles

				var_488_54.z = 0
				var_488_54.x = 0
				var_488_48.localEulerAngles = var_488_54
			end

			if arg_485_1.time_ >= var_488_49 + var_488_50 and arg_485_1.time_ < var_488_49 + var_488_50 + arg_488_0 then
				var_488_48.localPosition = Vector3.New(0, 100, 0)

				local var_488_55 = manager.ui.mainCamera.transform.position - var_488_48.position

				var_488_48.forward = Vector3.New(var_488_55.x, var_488_55.y, var_488_55.z)

				local var_488_56 = var_488_48.localEulerAngles

				var_488_56.z = 0
				var_488_56.x = 0
				var_488_48.localEulerAngles = var_488_56
			end

			local var_488_57 = 2

			if var_488_57 < arg_485_1.time_ and arg_485_1.time_ <= var_488_57 + arg_488_0 then
				local var_488_58 = arg_485_1.fswbg_.transform:Find("textbox/adapt/content") or arg_485_1.fswbg_.transform:Find("textbox/content")
				local var_488_59 = var_488_58:GetComponent("Text")
				local var_488_60 = var_488_58:GetComponent("RectTransform")

				var_488_59.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_488_60.offsetMin = Vector2.New(0, 0)
				var_488_60.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST39",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0801",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0802",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0804",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0805",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0807",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0808",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0404",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31a"
	},
	voices = {
		"story_v_out_221061.awb"
	}
}
