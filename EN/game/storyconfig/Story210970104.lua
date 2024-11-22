return {
	Play1109704001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1109704001
		arg_1_1.duration_ = 5.233

		local var_1_0 = {
			zh = 3.766666666666,
			ja = 5.233
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
				arg_1_0:Play1109704002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST01"

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
				local var_4_5 = arg_1_1.bgs_.ST01

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
					if iter_4_0 ~= "ST01" then
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

			local var_4_22 = "1097ui_story"

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

			local var_4_26 = arg_1_1.actors_["1097ui_story"].transform
			local var_4_27 = 1.76666666666667

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1097ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -0.54, -6.3)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1097ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1097ui_story"]
			local var_4_36 = 1.76666666666667

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1097ui_story == nil then
				arg_1_1.var_.characterEffect1097ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1097ui_story then
					arg_1_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1097ui_story then
				arg_1_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_4_39 = 1.76666666666667

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_4_40 = 1.76666666666667

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_41 = 0
			local var_4_42 = 0.2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 0.3
			local var_4_46 = 0.9

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.2

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

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[216].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(1109704001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 8
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704001", "story_v_side_new_1109704.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704001", "story_v_side_new_1109704.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_side_new_1109704", "1109704001", "story_v_side_new_1109704.awb")

						arg_1_1:RecordAudio("1109704001", var_4_59)
						arg_1_1:RecordAudio("1109704001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704001", "story_v_side_new_1109704.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704001", "story_v_side_new_1109704.awb")
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
	Play1109704002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 1109704002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play1109704003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1097ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1097ui_story == nil then
				arg_7_1.var_.characterEffect1097ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.200000002980232

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1097ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1097ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1097ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1097ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 0.725

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

				local var_10_8 = arg_7_1:GetWordFromCfg(1109704002)
				local var_10_9 = arg_7_1:FormatText(var_10_8.content)

				arg_7_1.text_.text = var_10_9

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_10 = 29
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
	Play1109704003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 1109704003
		arg_11_1.duration_ = 5.066

		local var_11_0 = {
			zh = 4.4,
			ja = 5.066
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
				arg_11_0:Play1109704004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1097ui_story"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1097ui_story = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1097ui_story, var_14_4, var_14_3)

				local var_14_5 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_5.x, var_14_5.y, var_14_5.z)

				local var_14_6 = var_14_0.localEulerAngles

				var_14_6.z = 0
				var_14_6.x = 0
				var_14_0.localEulerAngles = var_14_6
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_14_7 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_7.x, var_14_7.y, var_14_7.z)

				local var_14_8 = var_14_0.localEulerAngles

				var_14_8.z = 0
				var_14_8.x = 0
				var_14_0.localEulerAngles = var_14_8
			end

			local var_14_9 = arg_11_1.actors_["1097ui_story"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect1097ui_story == nil then
				arg_11_1.var_.characterEffect1097ui_story = var_14_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_11 = 0.200000002980232

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.characterEffect1097ui_story then
					local var_14_13 = Mathf.Lerp(0, 0.5, var_14_12)

					arg_11_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1097ui_story.fillRatio = var_14_13
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.characterEffect1097ui_story then
				local var_14_14 = 0.5

				arg_11_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1097ui_story.fillRatio = var_14_14
			end

			local var_14_15 = "1027ui_story"

			if arg_11_1.actors_[var_14_15] == nil then
				local var_14_16 = Object.Instantiate(Asset.Load("Char/" .. var_14_15), arg_11_1.stage_.transform)

				var_14_16.name = var_14_15
				var_14_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_15] = var_14_16

				local var_14_17 = var_14_16:GetComponentInChildren(typeof(CharacterEffect))

				var_14_17.enabled = true

				local var_14_18 = GameObjectTools.GetOrAddComponent(var_14_16, typeof(DynamicBoneHelper))

				if var_14_18 then
					var_14_18:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_17.transform, false)

				arg_11_1.var_[var_14_15 .. "Animator"] = var_14_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_15 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_15 .. "LipSync"] = var_14_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_19 = arg_11_1.actors_["1027ui_story"].transform
			local var_14_20 = 0

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.var_.moveOldPos1027ui_story = var_14_19.localPosition
			end

			local var_14_21 = 0.001

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_21 then
				local var_14_22 = (arg_11_1.time_ - var_14_20) / var_14_21
				local var_14_23 = Vector3.New(0.7, -0.81, -5.8)

				var_14_19.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1027ui_story, var_14_23, var_14_22)

				local var_14_24 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_24.x, var_14_24.y, var_14_24.z)

				local var_14_25 = var_14_19.localEulerAngles

				var_14_25.z = 0
				var_14_25.x = 0
				var_14_19.localEulerAngles = var_14_25
			end

			if arg_11_1.time_ >= var_14_20 + var_14_21 and arg_11_1.time_ < var_14_20 + var_14_21 + arg_14_0 then
				var_14_19.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_14_26 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_26.x, var_14_26.y, var_14_26.z)

				local var_14_27 = var_14_19.localEulerAngles

				var_14_27.z = 0
				var_14_27.x = 0
				var_14_19.localEulerAngles = var_14_27
			end

			local var_14_28 = arg_11_1.actors_["1027ui_story"]
			local var_14_29 = 0

			if var_14_29 < arg_11_1.time_ and arg_11_1.time_ <= var_14_29 + arg_14_0 and arg_11_1.var_.characterEffect1027ui_story == nil then
				arg_11_1.var_.characterEffect1027ui_story = var_14_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_30 = 0.200000002980232

			if var_14_29 <= arg_11_1.time_ and arg_11_1.time_ < var_14_29 + var_14_30 then
				local var_14_31 = (arg_11_1.time_ - var_14_29) / var_14_30

				if arg_11_1.var_.characterEffect1027ui_story then
					arg_11_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_29 + var_14_30 and arg_11_1.time_ < var_14_29 + var_14_30 + arg_14_0 and arg_11_1.var_.characterEffect1027ui_story then
				arg_11_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_14_32 = 0

			if var_14_32 < arg_11_1.time_ and arg_11_1.time_ <= var_14_32 + arg_14_0 then
				arg_11_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_14_33 = 0

			if var_14_33 < arg_11_1.time_ and arg_11_1.time_ <= var_14_33 + arg_14_0 then
				arg_11_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_34 = 0
			local var_14_35 = 0.575

			if var_14_34 < arg_11_1.time_ and arg_11_1.time_ <= var_14_34 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_36 = arg_11_1:FormatText(StoryNameCfg[56].name)

				arg_11_1.leftNameTxt_.text = var_14_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_37 = arg_11_1:GetWordFromCfg(1109704003)
				local var_14_38 = arg_11_1:FormatText(var_14_37.content)

				arg_11_1.text_.text = var_14_38

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_39 = 23
				local var_14_40 = utf8.len(var_14_38)
				local var_14_41 = var_14_39 <= 0 and var_14_35 or var_14_35 * (var_14_40 / var_14_39)

				if var_14_41 > 0 and var_14_35 < var_14_41 then
					arg_11_1.talkMaxDuration = var_14_41

					if var_14_41 + var_14_34 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_41 + var_14_34
					end
				end

				arg_11_1.text_.text = var_14_38
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704003", "story_v_side_new_1109704.awb") ~= 0 then
					local var_14_42 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704003", "story_v_side_new_1109704.awb") / 1000

					if var_14_42 + var_14_34 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_42 + var_14_34
					end

					if var_14_37.prefab_name ~= "" and arg_11_1.actors_[var_14_37.prefab_name] ~= nil then
						local var_14_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_37.prefab_name].transform, "story_v_side_new_1109704", "1109704003", "story_v_side_new_1109704.awb")

						arg_11_1:RecordAudio("1109704003", var_14_43)
						arg_11_1:RecordAudio("1109704003", var_14_43)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704003", "story_v_side_new_1109704.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704003", "story_v_side_new_1109704.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_44 = math.max(var_14_35, arg_11_1.talkMaxDuration)

			if var_14_34 <= arg_11_1.time_ and arg_11_1.time_ < var_14_34 + var_14_44 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_34) / var_14_44

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_34 + var_14_44 and arg_11_1.time_ < var_14_34 + var_14_44 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 1109704004
		arg_15_1.duration_ = 1.999999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play1109704005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1097ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1097ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1097ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["1097ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1097ui_story == nil then
				arg_15_1.var_.characterEffect1097ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1097ui_story then
					arg_15_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1097ui_story then
				arg_15_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action3_1")
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_18_15 = arg_15_1.actors_["1027ui_story"]
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 and arg_15_1.var_.characterEffect1027ui_story == nil then
				arg_15_1.var_.characterEffect1027ui_story = var_18_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_17 = 0.200000002980232

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17

				if arg_15_1.var_.characterEffect1027ui_story then
					local var_18_19 = Mathf.Lerp(0, 0.5, var_18_18)

					arg_15_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1027ui_story.fillRatio = var_18_19
				end
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 and arg_15_1.var_.characterEffect1027ui_story then
				local var_18_20 = 0.5

				arg_15_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1027ui_story.fillRatio = var_18_20
			end

			local var_18_21 = 0
			local var_18_22 = 0.125

			if var_18_21 < arg_15_1.time_ and arg_15_1.time_ <= var_18_21 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_23 = arg_15_1:FormatText(StoryNameCfg[216].name)

				arg_15_1.leftNameTxt_.text = var_18_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_24 = arg_15_1:GetWordFromCfg(1109704004)
				local var_18_25 = arg_15_1:FormatText(var_18_24.content)

				arg_15_1.text_.text = var_18_25

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_26 = 5
				local var_18_27 = utf8.len(var_18_25)
				local var_18_28 = var_18_26 <= 0 and var_18_22 or var_18_22 * (var_18_27 / var_18_26)

				if var_18_28 > 0 and var_18_22 < var_18_28 then
					arg_15_1.talkMaxDuration = var_18_28

					if var_18_28 + var_18_21 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_28 + var_18_21
					end
				end

				arg_15_1.text_.text = var_18_25
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704004", "story_v_side_new_1109704.awb") ~= 0 then
					local var_18_29 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704004", "story_v_side_new_1109704.awb") / 1000

					if var_18_29 + var_18_21 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_29 + var_18_21
					end

					if var_18_24.prefab_name ~= "" and arg_15_1.actors_[var_18_24.prefab_name] ~= nil then
						local var_18_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_24.prefab_name].transform, "story_v_side_new_1109704", "1109704004", "story_v_side_new_1109704.awb")

						arg_15_1:RecordAudio("1109704004", var_18_30)
						arg_15_1:RecordAudio("1109704004", var_18_30)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704004", "story_v_side_new_1109704.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704004", "story_v_side_new_1109704.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_31 = math.max(var_18_22, arg_15_1.talkMaxDuration)

			if var_18_21 <= arg_15_1.time_ and arg_15_1.time_ < var_18_21 + var_18_31 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_21) / var_18_31

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_21 + var_18_31 and arg_15_1.time_ < var_18_21 + var_18_31 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 1109704005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play1109704006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1097ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1097ui_story == nil then
				arg_19_1.var_.characterEffect1097ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1097ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1097ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1097ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1097ui_story.fillRatio = var_22_5
			end

			local var_22_6 = arg_19_1.actors_["1097ui_story"].transform
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 then
				arg_19_1.var_.moveOldPos1097ui_story = var_22_6.localPosition
			end

			local var_22_8 = 0.001

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8
				local var_22_10 = Vector3.New(0, 100, 0)

				var_22_6.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1097ui_story, var_22_10, var_22_9)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_6.position

				var_22_6.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_6.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_6.localEulerAngles = var_22_12
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 then
				var_22_6.localPosition = Vector3.New(0, 100, 0)

				local var_22_13 = manager.ui.mainCamera.transform.position - var_22_6.position

				var_22_6.forward = Vector3.New(var_22_13.x, var_22_13.y, var_22_13.z)

				local var_22_14 = var_22_6.localEulerAngles

				var_22_14.z = 0
				var_22_14.x = 0
				var_22_6.localEulerAngles = var_22_14
			end

			local var_22_15 = arg_19_1.actors_["1027ui_story"].transform
			local var_22_16 = 0

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.var_.moveOldPos1027ui_story = var_22_15.localPosition
			end

			local var_22_17 = 0.001

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_16) / var_22_17
				local var_22_19 = Vector3.New(0, 100, 0)

				var_22_15.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1027ui_story, var_22_19, var_22_18)

				local var_22_20 = manager.ui.mainCamera.transform.position - var_22_15.position

				var_22_15.forward = Vector3.New(var_22_20.x, var_22_20.y, var_22_20.z)

				local var_22_21 = var_22_15.localEulerAngles

				var_22_21.z = 0
				var_22_21.x = 0
				var_22_15.localEulerAngles = var_22_21
			end

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 then
				var_22_15.localPosition = Vector3.New(0, 100, 0)

				local var_22_22 = manager.ui.mainCamera.transform.position - var_22_15.position

				var_22_15.forward = Vector3.New(var_22_22.x, var_22_22.y, var_22_22.z)

				local var_22_23 = var_22_15.localEulerAngles

				var_22_23.z = 0
				var_22_23.x = 0
				var_22_15.localEulerAngles = var_22_23
			end

			local var_22_24 = manager.ui.mainCamera.transform
			local var_22_25 = 0

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 then
				arg_19_1.var_.shakeOldPos = var_22_24.localPosition
			end

			local var_22_26 = 0.6

			if var_22_25 <= arg_19_1.time_ and arg_19_1.time_ < var_22_25 + var_22_26 then
				local var_22_27 = (arg_19_1.time_ - var_22_25) / 0.066
				local var_22_28, var_22_29 = math.modf(var_22_27)

				var_22_24.localPosition = Vector3.New(var_22_29 * 0.13, var_22_29 * 0.13, var_22_29 * 0.13) + arg_19_1.var_.shakeOldPos
			end

			if arg_19_1.time_ >= var_22_25 + var_22_26 and arg_19_1.time_ < var_22_25 + var_22_26 + arg_22_0 then
				var_22_24.localPosition = arg_19_1.var_.shakeOldPos
			end

			local var_22_30 = 0

			if var_22_30 < arg_19_1.time_ and arg_19_1.time_ <= var_22_30 + arg_22_0 then
				arg_19_1.allBtn_.enabled = false
			end

			local var_22_31 = 0.6

			if arg_19_1.time_ >= var_22_30 + var_22_31 and arg_19_1.time_ < var_22_30 + var_22_31 + arg_22_0 then
				arg_19_1.allBtn_.enabled = true
			end

			local var_22_32 = 0
			local var_22_33 = 1.125

			if var_22_32 < arg_19_1.time_ and arg_19_1.time_ <= var_22_32 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_34 = arg_19_1:GetWordFromCfg(1109704005)
				local var_22_35 = arg_19_1:FormatText(var_22_34.content)

				arg_19_1.text_.text = var_22_35

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_36 = 45
				local var_22_37 = utf8.len(var_22_35)
				local var_22_38 = var_22_36 <= 0 and var_22_33 or var_22_33 * (var_22_37 / var_22_36)

				if var_22_38 > 0 and var_22_33 < var_22_38 then
					arg_19_1.talkMaxDuration = var_22_38

					if var_22_38 + var_22_32 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_38 + var_22_32
					end
				end

				arg_19_1.text_.text = var_22_35
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_39 = math.max(var_22_33, arg_19_1.talkMaxDuration)

			if var_22_32 <= arg_19_1.time_ and arg_19_1.time_ < var_22_32 + var_22_39 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_32) / var_22_39

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_32 + var_22_39 and arg_19_1.time_ < var_22_32 + var_22_39 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 1109704006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play1109704007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.55

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[7].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(1109704006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 22
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
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_8 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_8 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_8

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_8 and arg_23_1.time_ < var_26_0 + var_26_8 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 1109704007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play1109704008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1.125

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(1109704007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 45
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 1109704008
		arg_31_1.duration_ = 2.933

		local var_31_0 = {
			zh = 2.933,
			ja = 2.333
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
				arg_31_0:Play1109704009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1027ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1027ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0.7, -0.81, -5.8)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1027ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1027ui_story"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1027ui_story == nil then
				arg_31_1.var_.characterEffect1027ui_story = var_34_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_11 = 0.200000002980232

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.characterEffect1027ui_story then
					arg_31_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.characterEffect1027ui_story then
				arg_31_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action6_1")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_34_15 = 0
			local var_34_16 = 0.175

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_17 = arg_31_1:FormatText(StoryNameCfg[56].name)

				arg_31_1.leftNameTxt_.text = var_34_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_18 = arg_31_1:GetWordFromCfg(1109704008)
				local var_34_19 = arg_31_1:FormatText(var_34_18.content)

				arg_31_1.text_.text = var_34_19

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_20 = 7
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704008", "story_v_side_new_1109704.awb") ~= 0 then
					local var_34_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704008", "story_v_side_new_1109704.awb") / 1000

					if var_34_23 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_23 + var_34_15
					end

					if var_34_18.prefab_name ~= "" and arg_31_1.actors_[var_34_18.prefab_name] ~= nil then
						local var_34_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_18.prefab_name].transform, "story_v_side_new_1109704", "1109704008", "story_v_side_new_1109704.awb")

						arg_31_1:RecordAudio("1109704008", var_34_24)
						arg_31_1:RecordAudio("1109704008", var_34_24)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704008", "story_v_side_new_1109704.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704008", "story_v_side_new_1109704.awb")
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
	Play1109704009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 1109704009
		arg_35_1.duration_ = 6.3

		local var_35_0 = {
			zh = 5.233,
			ja = 6.3
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
				arg_35_0:Play1109704010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1097ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1097ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1097ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1097ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1097ui_story == nil then
				arg_35_1.var_.characterEffect1097ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1097ui_story then
					arg_35_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1097ui_story then
				arg_35_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_38_15 = arg_35_1.actors_["1027ui_story"]
			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 and arg_35_1.var_.characterEffect1027ui_story == nil then
				arg_35_1.var_.characterEffect1027ui_story = var_38_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_17 = 0.200000002980232

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17

				if arg_35_1.var_.characterEffect1027ui_story then
					local var_38_19 = Mathf.Lerp(0, 0.5, var_38_18)

					arg_35_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1027ui_story.fillRatio = var_38_19
				end
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 and arg_35_1.var_.characterEffect1027ui_story then
				local var_38_20 = 0.5

				arg_35_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1027ui_story.fillRatio = var_38_20
			end

			local var_38_21 = 0
			local var_38_22 = 0.725

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_23 = arg_35_1:FormatText(StoryNameCfg[216].name)

				arg_35_1.leftNameTxt_.text = var_38_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_24 = arg_35_1:GetWordFromCfg(1109704009)
				local var_38_25 = arg_35_1:FormatText(var_38_24.content)

				arg_35_1.text_.text = var_38_25

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_26 = 29
				local var_38_27 = utf8.len(var_38_25)
				local var_38_28 = var_38_26 <= 0 and var_38_22 or var_38_22 * (var_38_27 / var_38_26)

				if var_38_28 > 0 and var_38_22 < var_38_28 then
					arg_35_1.talkMaxDuration = var_38_28

					if var_38_28 + var_38_21 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_28 + var_38_21
					end
				end

				arg_35_1.text_.text = var_38_25
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704009", "story_v_side_new_1109704.awb") ~= 0 then
					local var_38_29 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704009", "story_v_side_new_1109704.awb") / 1000

					if var_38_29 + var_38_21 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_29 + var_38_21
					end

					if var_38_24.prefab_name ~= "" and arg_35_1.actors_[var_38_24.prefab_name] ~= nil then
						local var_38_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_24.prefab_name].transform, "story_v_side_new_1109704", "1109704009", "story_v_side_new_1109704.awb")

						arg_35_1:RecordAudio("1109704009", var_38_30)
						arg_35_1:RecordAudio("1109704009", var_38_30)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704009", "story_v_side_new_1109704.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704009", "story_v_side_new_1109704.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_31 = math.max(var_38_22, arg_35_1.talkMaxDuration)

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_31 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_21) / var_38_31

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_21 + var_38_31 and arg_35_1.time_ < var_38_21 + var_38_31 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 1109704010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play1109704011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1097ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1097ui_story == nil then
				arg_39_1.var_.characterEffect1097ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1097ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1097ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1097ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1097ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 1.075

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(1109704010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 43
				local var_42_12 = utf8.len(var_42_10)
				local var_42_13 = var_42_11 <= 0 and var_42_7 or var_42_7 * (var_42_12 / var_42_11)

				if var_42_13 > 0 and var_42_7 < var_42_13 then
					arg_39_1.talkMaxDuration = var_42_13

					if var_42_13 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_10
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_14 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_14 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_14

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_14 and arg_39_1.time_ < var_42_6 + var_42_14 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 1109704011
		arg_43_1.duration_ = 1.999999999999

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play1109704012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1097ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1097ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1097ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1097ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1097ui_story == nil then
				arg_43_1.var_.characterEffect1097ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1097ui_story then
					arg_43_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1097ui_story then
				arg_43_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_46_13 = arg_43_1.actors_["1027ui_story"].transform
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1.var_.moveOldPos1027ui_story = var_46_13.localPosition
			end

			local var_46_15 = 0.001

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15
				local var_46_17 = Vector3.New(0.7, -0.81, -5.8)

				var_46_13.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1027ui_story, var_46_17, var_46_16)

				local var_46_18 = manager.ui.mainCamera.transform.position - var_46_13.position

				var_46_13.forward = Vector3.New(var_46_18.x, var_46_18.y, var_46_18.z)

				local var_46_19 = var_46_13.localEulerAngles

				var_46_19.z = 0
				var_46_19.x = 0
				var_46_13.localEulerAngles = var_46_19
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 then
				var_46_13.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_46_20 = manager.ui.mainCamera.transform.position - var_46_13.position

				var_46_13.forward = Vector3.New(var_46_20.x, var_46_20.y, var_46_20.z)

				local var_46_21 = var_46_13.localEulerAngles

				var_46_21.z = 0
				var_46_21.x = 0
				var_46_13.localEulerAngles = var_46_21
			end

			local var_46_22 = arg_43_1.actors_["1027ui_story"]
			local var_46_23 = 0

			if var_46_23 < arg_43_1.time_ and arg_43_1.time_ <= var_46_23 + arg_46_0 and arg_43_1.var_.characterEffect1027ui_story == nil then
				arg_43_1.var_.characterEffect1027ui_story = var_46_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_24 = 0.200000002980232

			if var_46_23 <= arg_43_1.time_ and arg_43_1.time_ < var_46_23 + var_46_24 then
				local var_46_25 = (arg_43_1.time_ - var_46_23) / var_46_24

				if arg_43_1.var_.characterEffect1027ui_story then
					arg_43_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_23 + var_46_24 and arg_43_1.time_ < var_46_23 + var_46_24 + arg_46_0 and arg_43_1.var_.characterEffect1027ui_story then
				arg_43_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_46_26 = 0

			if var_46_26 < arg_43_1.time_ and arg_43_1.time_ <= var_46_26 + arg_46_0 then
				arg_43_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action6_2")
			end

			local var_46_27 = 0

			if var_46_27 < arg_43_1.time_ and arg_43_1.time_ <= var_46_27 + arg_46_0 then
				arg_43_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_46_28 = 0
			local var_46_29 = 0.05

			if var_46_28 < arg_43_1.time_ and arg_43_1.time_ <= var_46_28 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_30 = arg_43_1:FormatText(StoryNameCfg[951].name)

				arg_43_1.leftNameTxt_.text = var_46_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_31 = arg_43_1:GetWordFromCfg(1109704011)
				local var_46_32 = arg_43_1:FormatText(var_46_31.content)

				arg_43_1.text_.text = var_46_32

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_33 = 2
				local var_46_34 = utf8.len(var_46_32)
				local var_46_35 = var_46_33 <= 0 and var_46_29 or var_46_29 * (var_46_34 / var_46_33)

				if var_46_35 > 0 and var_46_29 < var_46_35 then
					arg_43_1.talkMaxDuration = var_46_35

					if var_46_35 + var_46_28 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_35 + var_46_28
					end
				end

				arg_43_1.text_.text = var_46_32
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704011", "story_v_side_new_1109704.awb") ~= 0 then
					local var_46_36 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704011", "story_v_side_new_1109704.awb") / 1000

					if var_46_36 + var_46_28 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_36 + var_46_28
					end

					if var_46_31.prefab_name ~= "" and arg_43_1.actors_[var_46_31.prefab_name] ~= nil then
						local var_46_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_31.prefab_name].transform, "story_v_side_new_1109704", "1109704011", "story_v_side_new_1109704.awb")

						arg_43_1:RecordAudio("1109704011", var_46_37)
						arg_43_1:RecordAudio("1109704011", var_46_37)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704011", "story_v_side_new_1109704.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704011", "story_v_side_new_1109704.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_38 = math.max(var_46_29, arg_43_1.talkMaxDuration)

			if var_46_28 <= arg_43_1.time_ and arg_43_1.time_ < var_46_28 + var_46_38 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_28) / var_46_38

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_28 + var_46_38 and arg_43_1.time_ < var_46_28 + var_46_38 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 1109704012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play1109704013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1027ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1027ui_story == nil then
				arg_47_1.var_.characterEffect1027ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1027ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1027ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1027ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1027ui_story.fillRatio = var_50_5
			end

			local var_50_6 = arg_47_1.actors_["1097ui_story"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.characterEffect1097ui_story == nil then
				arg_47_1.var_.characterEffect1097ui_story = var_50_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_8 = 0.200000002980232

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.characterEffect1097ui_story then
					local var_50_10 = Mathf.Lerp(0, 0.5, var_50_9)

					arg_47_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1097ui_story.fillRatio = var_50_10
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.characterEffect1097ui_story then
				local var_50_11 = 0.5

				arg_47_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1097ui_story.fillRatio = var_50_11
			end

			local var_50_12 = 0
			local var_50_13 = 1.225

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_14 = arg_47_1:GetWordFromCfg(1109704012)
				local var_50_15 = arg_47_1:FormatText(var_50_14.content)

				arg_47_1.text_.text = var_50_15

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_16 = 49
				local var_50_17 = utf8.len(var_50_15)
				local var_50_18 = var_50_16 <= 0 and var_50_13 or var_50_13 * (var_50_17 / var_50_16)

				if var_50_18 > 0 and var_50_13 < var_50_18 then
					arg_47_1.talkMaxDuration = var_50_18

					if var_50_18 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_18 + var_50_12
					end
				end

				arg_47_1.text_.text = var_50_15
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_19 = math.max(var_50_13, arg_47_1.talkMaxDuration)

			if var_50_12 <= arg_47_1.time_ and arg_47_1.time_ < var_50_12 + var_50_19 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_12) / var_50_19

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_12 + var_50_19 and arg_47_1.time_ < var_50_12 + var_50_19 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 1109704013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play1109704014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.425

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[7].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(1109704013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 17
				local var_54_6 = utf8.len(var_54_4)
				local var_54_7 = var_54_5 <= 0 and var_54_1 or var_54_1 * (var_54_6 / var_54_5)

				if var_54_7 > 0 and var_54_1 < var_54_7 then
					arg_51_1.talkMaxDuration = var_54_7

					if var_54_7 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_7 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_4
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_8 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_8 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_8

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_8 and arg_51_1.time_ < var_54_0 + var_54_8 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 1109704014
		arg_55_1.duration_ = 8.9

		local var_55_0 = {
			zh = 6.366,
			ja = 8.9
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
				arg_55_0:Play1109704015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1097ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1097ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1097ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1097ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1097ui_story == nil then
				arg_55_1.var_.characterEffect1097ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1097ui_story then
					arg_55_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1097ui_story then
				arg_55_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_2")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_58_15 = 0
			local var_58_16 = 0.625

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_17 = arg_55_1:FormatText(StoryNameCfg[216].name)

				arg_55_1.leftNameTxt_.text = var_58_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_18 = arg_55_1:GetWordFromCfg(1109704014)
				local var_58_19 = arg_55_1:FormatText(var_58_18.content)

				arg_55_1.text_.text = var_58_19

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_20 = 25
				local var_58_21 = utf8.len(var_58_19)
				local var_58_22 = var_58_20 <= 0 and var_58_16 or var_58_16 * (var_58_21 / var_58_20)

				if var_58_22 > 0 and var_58_16 < var_58_22 then
					arg_55_1.talkMaxDuration = var_58_22

					if var_58_22 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_22 + var_58_15
					end
				end

				arg_55_1.text_.text = var_58_19
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704014", "story_v_side_new_1109704.awb") ~= 0 then
					local var_58_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704014", "story_v_side_new_1109704.awb") / 1000

					if var_58_23 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_23 + var_58_15
					end

					if var_58_18.prefab_name ~= "" and arg_55_1.actors_[var_58_18.prefab_name] ~= nil then
						local var_58_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_18.prefab_name].transform, "story_v_side_new_1109704", "1109704014", "story_v_side_new_1109704.awb")

						arg_55_1:RecordAudio("1109704014", var_58_24)
						arg_55_1:RecordAudio("1109704014", var_58_24)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704014", "story_v_side_new_1109704.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704014", "story_v_side_new_1109704.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_25 = math.max(var_58_16, arg_55_1.talkMaxDuration)

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_25 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_15) / var_58_25

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_15 + var_58_25 and arg_55_1.time_ < var_58_15 + var_58_25 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 1109704015
		arg_59_1.duration_ = 3.4

		local var_59_0 = {
			zh = 3.033,
			ja = 3.4
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
				arg_59_0:Play1109704016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1027ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1027ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(0.7, -0.81, -5.8)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1027ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = arg_59_1.actors_["1027ui_story"]
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect1027ui_story == nil then
				arg_59_1.var_.characterEffect1027ui_story = var_62_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_11 = 0.200000002980232

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11

				if arg_59_1.var_.characterEffect1027ui_story then
					arg_59_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect1027ui_story then
				arg_59_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_62_13 = 0

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action1_1")
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_15 = arg_59_1.actors_["1097ui_story"]
			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 and arg_59_1.var_.characterEffect1097ui_story == nil then
				arg_59_1.var_.characterEffect1097ui_story = var_62_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_17 = 0.200000002980232

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_17 then
				local var_62_18 = (arg_59_1.time_ - var_62_16) / var_62_17

				if arg_59_1.var_.characterEffect1097ui_story then
					local var_62_19 = Mathf.Lerp(0, 0.5, var_62_18)

					arg_59_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1097ui_story.fillRatio = var_62_19
				end
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 and arg_59_1.var_.characterEffect1097ui_story then
				local var_62_20 = 0.5

				arg_59_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1097ui_story.fillRatio = var_62_20
			end

			local var_62_21 = 0
			local var_62_22 = 0.3

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_23 = arg_59_1:FormatText(StoryNameCfg[56].name)

				arg_59_1.leftNameTxt_.text = var_62_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_24 = arg_59_1:GetWordFromCfg(1109704015)
				local var_62_25 = arg_59_1:FormatText(var_62_24.content)

				arg_59_1.text_.text = var_62_25

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_26 = 12
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704015", "story_v_side_new_1109704.awb") ~= 0 then
					local var_62_29 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704015", "story_v_side_new_1109704.awb") / 1000

					if var_62_29 + var_62_21 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_29 + var_62_21
					end

					if var_62_24.prefab_name ~= "" and arg_59_1.actors_[var_62_24.prefab_name] ~= nil then
						local var_62_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_24.prefab_name].transform, "story_v_side_new_1109704", "1109704015", "story_v_side_new_1109704.awb")

						arg_59_1:RecordAudio("1109704015", var_62_30)
						arg_59_1:RecordAudio("1109704015", var_62_30)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704015", "story_v_side_new_1109704.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704015", "story_v_side_new_1109704.awb")
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
	Play1109704016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 1109704016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play1109704017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1027ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1027ui_story == nil then
				arg_63_1.var_.characterEffect1027ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1027ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1027ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1027ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1027ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0
			local var_66_7 = 1.275

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[7].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(1109704016)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 51
				local var_66_12 = utf8.len(var_66_10)
				local var_66_13 = var_66_11 <= 0 and var_66_7 or var_66_7 * (var_66_12 / var_66_11)

				if var_66_13 > 0 and var_66_7 < var_66_13 then
					arg_63_1.talkMaxDuration = var_66_13

					if var_66_13 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_13 + var_66_6
					end
				end

				arg_63_1.text_.text = var_66_10
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_14 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_14 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_14

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_14 and arg_63_1.time_ < var_66_6 + var_66_14 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 1109704017
		arg_67_1.duration_ = 9.4

		local var_67_0 = {
			zh = 2.733,
			ja = 9.4
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
				arg_67_0:Play1109704018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1027ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1027ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0.7, -0.81, -5.8)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1027ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["1027ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1027ui_story == nil then
				arg_67_1.var_.characterEffect1027ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect1027ui_story then
					arg_67_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect1027ui_story then
				arg_67_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_15 = 0
			local var_70_16 = 0.275

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_17 = arg_67_1:FormatText(StoryNameCfg[56].name)

				arg_67_1.leftNameTxt_.text = var_70_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_18 = arg_67_1:GetWordFromCfg(1109704017)
				local var_70_19 = arg_67_1:FormatText(var_70_18.content)

				arg_67_1.text_.text = var_70_19

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_20 = 11
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704017", "story_v_side_new_1109704.awb") ~= 0 then
					local var_70_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704017", "story_v_side_new_1109704.awb") / 1000

					if var_70_23 + var_70_15 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_23 + var_70_15
					end

					if var_70_18.prefab_name ~= "" and arg_67_1.actors_[var_70_18.prefab_name] ~= nil then
						local var_70_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_18.prefab_name].transform, "story_v_side_new_1109704", "1109704017", "story_v_side_new_1109704.awb")

						arg_67_1:RecordAudio("1109704017", var_70_24)
						arg_67_1:RecordAudio("1109704017", var_70_24)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704017", "story_v_side_new_1109704.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704017", "story_v_side_new_1109704.awb")
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
	Play1109704018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 1109704018
		arg_71_1.duration_ = 5.2

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play1109704019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1097ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1097ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1097ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["1097ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect1097ui_story == nil then
				arg_71_1.var_.characterEffect1097ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect1097ui_story then
					arg_71_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect1097ui_story then
				arg_71_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_74_13 = 0

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_74_15 = arg_71_1.actors_["1027ui_story"]
			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 and arg_71_1.var_.characterEffect1027ui_story == nil then
				arg_71_1.var_.characterEffect1027ui_story = var_74_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_17 = 0.200000002980232

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / var_74_17

				if arg_71_1.var_.characterEffect1027ui_story then
					local var_74_19 = Mathf.Lerp(0, 0.5, var_74_18)

					arg_71_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1027ui_story.fillRatio = var_74_19
				end
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 and arg_71_1.var_.characterEffect1027ui_story then
				local var_74_20 = 0.5

				arg_71_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1027ui_story.fillRatio = var_74_20
			end

			local var_74_21 = 0
			local var_74_22 = 0.45

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_23 = arg_71_1:FormatText(StoryNameCfg[216].name)

				arg_71_1.leftNameTxt_.text = var_74_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_24 = arg_71_1:GetWordFromCfg(1109704018)
				local var_74_25 = arg_71_1:FormatText(var_74_24.content)

				arg_71_1.text_.text = var_74_25

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_26 = 18
				local var_74_27 = utf8.len(var_74_25)
				local var_74_28 = var_74_26 <= 0 and var_74_22 or var_74_22 * (var_74_27 / var_74_26)

				if var_74_28 > 0 and var_74_22 < var_74_28 then
					arg_71_1.talkMaxDuration = var_74_28

					if var_74_28 + var_74_21 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_28 + var_74_21
					end
				end

				arg_71_1.text_.text = var_74_25
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704018", "story_v_side_new_1109704.awb") ~= 0 then
					local var_74_29 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704018", "story_v_side_new_1109704.awb") / 1000

					if var_74_29 + var_74_21 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_29 + var_74_21
					end

					if var_74_24.prefab_name ~= "" and arg_71_1.actors_[var_74_24.prefab_name] ~= nil then
						local var_74_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_24.prefab_name].transform, "story_v_side_new_1109704", "1109704018", "story_v_side_new_1109704.awb")

						arg_71_1:RecordAudio("1109704018", var_74_30)
						arg_71_1:RecordAudio("1109704018", var_74_30)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704018", "story_v_side_new_1109704.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704018", "story_v_side_new_1109704.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_31 = math.max(var_74_22, arg_71_1.talkMaxDuration)

			if var_74_21 <= arg_71_1.time_ and arg_71_1.time_ < var_74_21 + var_74_31 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_21) / var_74_31

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_21 + var_74_31 and arg_71_1.time_ < var_74_21 + var_74_31 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 1109704019
		arg_75_1.duration_ = 6.466

		local var_75_0 = {
			zh = 5.133,
			ja = 6.466
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
				arg_75_0:Play1109704020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = "1080ui_story"

			if arg_75_1.actors_[var_78_0] == nil then
				local var_78_1 = Object.Instantiate(Asset.Load("Char/" .. var_78_0), arg_75_1.stage_.transform)

				var_78_1.name = var_78_0
				var_78_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_75_1.actors_[var_78_0] = var_78_1

				local var_78_2 = var_78_1:GetComponentInChildren(typeof(CharacterEffect))

				var_78_2.enabled = true

				local var_78_3 = GameObjectTools.GetOrAddComponent(var_78_1, typeof(DynamicBoneHelper))

				if var_78_3 then
					var_78_3:EnableDynamicBone(false)
				end

				arg_75_1:ShowWeapon(var_78_2.transform, false)

				arg_75_1.var_[var_78_0 .. "Animator"] = var_78_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_75_1.var_[var_78_0 .. "Animator"].applyRootMotion = true
				arg_75_1.var_[var_78_0 .. "LipSync"] = var_78_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_78_4 = arg_75_1.actors_["1080ui_story"].transform
			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 then
				arg_75_1.var_.moveOldPos1080ui_story = var_78_4.localPosition
			end

			local var_78_6 = 0.001

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6
				local var_78_8 = Vector3.New(0.7, -1.01, -6.05)

				var_78_4.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1080ui_story, var_78_8, var_78_7)

				local var_78_9 = manager.ui.mainCamera.transform.position - var_78_4.position

				var_78_4.forward = Vector3.New(var_78_9.x, var_78_9.y, var_78_9.z)

				local var_78_10 = var_78_4.localEulerAngles

				var_78_10.z = 0
				var_78_10.x = 0
				var_78_4.localEulerAngles = var_78_10
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 then
				var_78_4.localPosition = Vector3.New(0.7, -1.01, -6.05)

				local var_78_11 = manager.ui.mainCamera.transform.position - var_78_4.position

				var_78_4.forward = Vector3.New(var_78_11.x, var_78_11.y, var_78_11.z)

				local var_78_12 = var_78_4.localEulerAngles

				var_78_12.z = 0
				var_78_12.x = 0
				var_78_4.localEulerAngles = var_78_12
			end

			local var_78_13 = arg_75_1.actors_["1080ui_story"]
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 and arg_75_1.var_.characterEffect1080ui_story == nil then
				arg_75_1.var_.characterEffect1080ui_story = var_78_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_15 = 0.200000002980232

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15

				if arg_75_1.var_.characterEffect1080ui_story then
					arg_75_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 and arg_75_1.var_.characterEffect1080ui_story then
				arg_75_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_78_17 = 0

			if var_78_17 < arg_75_1.time_ and arg_75_1.time_ <= var_78_17 + arg_78_0 then
				arg_75_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action1_1")
			end

			local var_78_18 = 0

			if var_78_18 < arg_75_1.time_ and arg_75_1.time_ <= var_78_18 + arg_78_0 then
				arg_75_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_19 = arg_75_1.actors_["1027ui_story"].transform
			local var_78_20 = 0

			if var_78_20 < arg_75_1.time_ and arg_75_1.time_ <= var_78_20 + arg_78_0 then
				arg_75_1.var_.moveOldPos1027ui_story = var_78_19.localPosition
			end

			local var_78_21 = 0.001

			if var_78_20 <= arg_75_1.time_ and arg_75_1.time_ < var_78_20 + var_78_21 then
				local var_78_22 = (arg_75_1.time_ - var_78_20) / var_78_21
				local var_78_23 = Vector3.New(0, 100, 0)

				var_78_19.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1027ui_story, var_78_23, var_78_22)

				local var_78_24 = manager.ui.mainCamera.transform.position - var_78_19.position

				var_78_19.forward = Vector3.New(var_78_24.x, var_78_24.y, var_78_24.z)

				local var_78_25 = var_78_19.localEulerAngles

				var_78_25.z = 0
				var_78_25.x = 0
				var_78_19.localEulerAngles = var_78_25
			end

			if arg_75_1.time_ >= var_78_20 + var_78_21 and arg_75_1.time_ < var_78_20 + var_78_21 + arg_78_0 then
				var_78_19.localPosition = Vector3.New(0, 100, 0)

				local var_78_26 = manager.ui.mainCamera.transform.position - var_78_19.position

				var_78_19.forward = Vector3.New(var_78_26.x, var_78_26.y, var_78_26.z)

				local var_78_27 = var_78_19.localEulerAngles

				var_78_27.z = 0
				var_78_27.x = 0
				var_78_19.localEulerAngles = var_78_27
			end

			local var_78_28 = arg_75_1.actors_["1027ui_story"]
			local var_78_29 = 0

			if var_78_29 < arg_75_1.time_ and arg_75_1.time_ <= var_78_29 + arg_78_0 and arg_75_1.var_.characterEffect1027ui_story == nil then
				arg_75_1.var_.characterEffect1027ui_story = var_78_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_30 = 0.200000002980232

			if var_78_29 <= arg_75_1.time_ and arg_75_1.time_ < var_78_29 + var_78_30 then
				local var_78_31 = (arg_75_1.time_ - var_78_29) / var_78_30

				if arg_75_1.var_.characterEffect1027ui_story then
					local var_78_32 = Mathf.Lerp(0, 0.5, var_78_31)

					arg_75_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1027ui_story.fillRatio = var_78_32
				end
			end

			if arg_75_1.time_ >= var_78_29 + var_78_30 and arg_75_1.time_ < var_78_29 + var_78_30 + arg_78_0 and arg_75_1.var_.characterEffect1027ui_story then
				local var_78_33 = 0.5

				arg_75_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1027ui_story.fillRatio = var_78_33
			end

			local var_78_34 = arg_75_1.actors_["1097ui_story"]
			local var_78_35 = 0

			if var_78_35 < arg_75_1.time_ and arg_75_1.time_ <= var_78_35 + arg_78_0 and arg_75_1.var_.characterEffect1097ui_story == nil then
				arg_75_1.var_.characterEffect1097ui_story = var_78_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_36 = 0.200000002980232

			if var_78_35 <= arg_75_1.time_ and arg_75_1.time_ < var_78_35 + var_78_36 then
				local var_78_37 = (arg_75_1.time_ - var_78_35) / var_78_36

				if arg_75_1.var_.characterEffect1097ui_story then
					local var_78_38 = Mathf.Lerp(0, 0.5, var_78_37)

					arg_75_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1097ui_story.fillRatio = var_78_38
				end
			end

			if arg_75_1.time_ >= var_78_35 + var_78_36 and arg_75_1.time_ < var_78_35 + var_78_36 + arg_78_0 and arg_75_1.var_.characterEffect1097ui_story then
				local var_78_39 = 0.5

				arg_75_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1097ui_story.fillRatio = var_78_39
			end

			local var_78_40 = 0
			local var_78_41 = 0.45

			if var_78_40 < arg_75_1.time_ and arg_75_1.time_ <= var_78_40 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_42 = arg_75_1:FormatText(StoryNameCfg[55].name)

				arg_75_1.leftNameTxt_.text = var_78_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_43 = arg_75_1:GetWordFromCfg(1109704019)
				local var_78_44 = arg_75_1:FormatText(var_78_43.content)

				arg_75_1.text_.text = var_78_44

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_45 = 18
				local var_78_46 = utf8.len(var_78_44)
				local var_78_47 = var_78_45 <= 0 and var_78_41 or var_78_41 * (var_78_46 / var_78_45)

				if var_78_47 > 0 and var_78_41 < var_78_47 then
					arg_75_1.talkMaxDuration = var_78_47

					if var_78_47 + var_78_40 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_47 + var_78_40
					end
				end

				arg_75_1.text_.text = var_78_44
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704019", "story_v_side_new_1109704.awb") ~= 0 then
					local var_78_48 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704019", "story_v_side_new_1109704.awb") / 1000

					if var_78_48 + var_78_40 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_48 + var_78_40
					end

					if var_78_43.prefab_name ~= "" and arg_75_1.actors_[var_78_43.prefab_name] ~= nil then
						local var_78_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_43.prefab_name].transform, "story_v_side_new_1109704", "1109704019", "story_v_side_new_1109704.awb")

						arg_75_1:RecordAudio("1109704019", var_78_49)
						arg_75_1:RecordAudio("1109704019", var_78_49)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704019", "story_v_side_new_1109704.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704019", "story_v_side_new_1109704.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_50 = math.max(var_78_41, arg_75_1.talkMaxDuration)

			if var_78_40 <= arg_75_1.time_ and arg_75_1.time_ < var_78_40 + var_78_50 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_40) / var_78_50

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_40 + var_78_50 and arg_75_1.time_ < var_78_40 + var_78_50 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 1109704020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play1109704021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1080ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1080ui_story == nil then
				arg_79_1.var_.characterEffect1080ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1080ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1080ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1080ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1080ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0
			local var_82_7 = 1.15

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_8 = arg_79_1:GetWordFromCfg(1109704020)
				local var_82_9 = arg_79_1:FormatText(var_82_8.content)

				arg_79_1.text_.text = var_82_9

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_10 = 46
				local var_82_11 = utf8.len(var_82_9)
				local var_82_12 = var_82_10 <= 0 and var_82_7 or var_82_7 * (var_82_11 / var_82_10)

				if var_82_12 > 0 and var_82_7 < var_82_12 then
					arg_79_1.talkMaxDuration = var_82_12

					if var_82_12 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_12 + var_82_6
					end
				end

				arg_79_1.text_.text = var_82_9
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_13 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_13 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_13

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_13 and arg_79_1.time_ < var_82_6 + var_82_13 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 1109704021
		arg_83_1.duration_ = 6.433

		local var_83_0 = {
			zh = 4.033,
			ja = 6.433
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
				arg_83_0:Play1109704022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1097ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1097ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1097ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1097ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1097ui_story == nil then
				arg_83_1.var_.characterEffect1097ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1097ui_story then
					arg_83_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1097ui_story then
				arg_83_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_2")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_86_15 = 0
			local var_86_16 = 0.35

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[216].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(1109704021)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 14
				local var_86_21 = utf8.len(var_86_19)
				local var_86_22 = var_86_20 <= 0 and var_86_16 or var_86_16 * (var_86_21 / var_86_20)

				if var_86_22 > 0 and var_86_16 < var_86_22 then
					arg_83_1.talkMaxDuration = var_86_22

					if var_86_22 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_19
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704021", "story_v_side_new_1109704.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704021", "story_v_side_new_1109704.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_side_new_1109704", "1109704021", "story_v_side_new_1109704.awb")

						arg_83_1:RecordAudio("1109704021", var_86_24)
						arg_83_1:RecordAudio("1109704021", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704021", "story_v_side_new_1109704.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704021", "story_v_side_new_1109704.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_25 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_25 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_25

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_25 and arg_83_1.time_ < var_86_15 + var_86_25 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 1109704022
		arg_87_1.duration_ = 1.999999999999

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play1109704023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1080ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1080ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0.7, -1.01, -6.05)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1080ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0.7, -1.01, -6.05)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1080ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect1080ui_story == nil then
				arg_87_1.var_.characterEffect1080ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect1080ui_story then
					arg_87_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect1080ui_story then
				arg_87_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action1_1")
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_90_15 = arg_87_1.actors_["1097ui_story"]
			local var_90_16 = 0

			if var_90_16 < arg_87_1.time_ and arg_87_1.time_ <= var_90_16 + arg_90_0 and arg_87_1.var_.characterEffect1097ui_story == nil then
				arg_87_1.var_.characterEffect1097ui_story = var_90_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_17 = 0.200000002980232

			if var_90_16 <= arg_87_1.time_ and arg_87_1.time_ < var_90_16 + var_90_17 then
				local var_90_18 = (arg_87_1.time_ - var_90_16) / var_90_17

				if arg_87_1.var_.characterEffect1097ui_story then
					local var_90_19 = Mathf.Lerp(0, 0.5, var_90_18)

					arg_87_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1097ui_story.fillRatio = var_90_19
				end
			end

			if arg_87_1.time_ >= var_90_16 + var_90_17 and arg_87_1.time_ < var_90_16 + var_90_17 + arg_90_0 and arg_87_1.var_.characterEffect1097ui_story then
				local var_90_20 = 0.5

				arg_87_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1097ui_story.fillRatio = var_90_20
			end

			local var_90_21 = 0
			local var_90_22 = 0.075

			if var_90_21 < arg_87_1.time_ and arg_87_1.time_ <= var_90_21 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_23 = arg_87_1:FormatText(StoryNameCfg[55].name)

				arg_87_1.leftNameTxt_.text = var_90_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_24 = arg_87_1:GetWordFromCfg(1109704022)
				local var_90_25 = arg_87_1:FormatText(var_90_24.content)

				arg_87_1.text_.text = var_90_25

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_26 = 3
				local var_90_27 = utf8.len(var_90_25)
				local var_90_28 = var_90_26 <= 0 and var_90_22 or var_90_22 * (var_90_27 / var_90_26)

				if var_90_28 > 0 and var_90_22 < var_90_28 then
					arg_87_1.talkMaxDuration = var_90_28

					if var_90_28 + var_90_21 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_28 + var_90_21
					end
				end

				arg_87_1.text_.text = var_90_25
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704022", "story_v_side_new_1109704.awb") ~= 0 then
					local var_90_29 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704022", "story_v_side_new_1109704.awb") / 1000

					if var_90_29 + var_90_21 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_29 + var_90_21
					end

					if var_90_24.prefab_name ~= "" and arg_87_1.actors_[var_90_24.prefab_name] ~= nil then
						local var_90_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_24.prefab_name].transform, "story_v_side_new_1109704", "1109704022", "story_v_side_new_1109704.awb")

						arg_87_1:RecordAudio("1109704022", var_90_30)
						arg_87_1:RecordAudio("1109704022", var_90_30)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704022", "story_v_side_new_1109704.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704022", "story_v_side_new_1109704.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_31 = math.max(var_90_22, arg_87_1.talkMaxDuration)

			if var_90_21 <= arg_87_1.time_ and arg_87_1.time_ < var_90_21 + var_90_31 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_21) / var_90_31

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_21 + var_90_31 and arg_87_1.time_ < var_90_21 + var_90_31 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 1109704023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play1109704024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1080ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1080ui_story == nil then
				arg_91_1.var_.characterEffect1080ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1080ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1080ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1080ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1080ui_story.fillRatio = var_94_5
			end

			local var_94_6 = 0
			local var_94_7 = 0.65

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_8 = arg_91_1:GetWordFromCfg(1109704023)
				local var_94_9 = arg_91_1:FormatText(var_94_8.content)

				arg_91_1.text_.text = var_94_9

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_10 = 26
				local var_94_11 = utf8.len(var_94_9)
				local var_94_12 = var_94_10 <= 0 and var_94_7 or var_94_7 * (var_94_11 / var_94_10)

				if var_94_12 > 0 and var_94_7 < var_94_12 then
					arg_91_1.talkMaxDuration = var_94_12

					if var_94_12 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_12 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_9
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_13 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_13 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_13

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_13 and arg_91_1.time_ < var_94_6 + var_94_13 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 1109704024
		arg_95_1.duration_ = 9

		local var_95_0 = {
			zh = 6.6,
			ja = 9
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
				arg_95_0:Play1109704025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1027ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1027ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0.7, -0.81, -5.8)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1027ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["1027ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect1027ui_story == nil then
				arg_95_1.var_.characterEffect1027ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect1027ui_story then
					arg_95_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect1027ui_story then
				arg_95_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action1_1")
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_15 = arg_95_1.actors_["1080ui_story"].transform
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				arg_95_1.var_.moveOldPos1080ui_story = var_98_15.localPosition
			end

			local var_98_17 = 0.001

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17
				local var_98_19 = Vector3.New(0, 100, 0)

				var_98_15.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1080ui_story, var_98_19, var_98_18)

				local var_98_20 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_20.x, var_98_20.y, var_98_20.z)

				local var_98_21 = var_98_15.localEulerAngles

				var_98_21.z = 0
				var_98_21.x = 0
				var_98_15.localEulerAngles = var_98_21
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 then
				var_98_15.localPosition = Vector3.New(0, 100, 0)

				local var_98_22 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_22.x, var_98_22.y, var_98_22.z)

				local var_98_23 = var_98_15.localEulerAngles

				var_98_23.z = 0
				var_98_23.x = 0
				var_98_15.localEulerAngles = var_98_23
			end

			local var_98_24 = arg_95_1.actors_["1080ui_story"]
			local var_98_25 = 0

			if var_98_25 < arg_95_1.time_ and arg_95_1.time_ <= var_98_25 + arg_98_0 and arg_95_1.var_.characterEffect1080ui_story == nil then
				arg_95_1.var_.characterEffect1080ui_story = var_98_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_26 = 0.200000002980232

			if var_98_25 <= arg_95_1.time_ and arg_95_1.time_ < var_98_25 + var_98_26 then
				local var_98_27 = (arg_95_1.time_ - var_98_25) / var_98_26

				if arg_95_1.var_.characterEffect1080ui_story then
					local var_98_28 = Mathf.Lerp(0, 0.5, var_98_27)

					arg_95_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1080ui_story.fillRatio = var_98_28
				end
			end

			if arg_95_1.time_ >= var_98_25 + var_98_26 and arg_95_1.time_ < var_98_25 + var_98_26 + arg_98_0 and arg_95_1.var_.characterEffect1080ui_story then
				local var_98_29 = 0.5

				arg_95_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1080ui_story.fillRatio = var_98_29
			end

			local var_98_30 = 0
			local var_98_31 = 0.85

			if var_98_30 < arg_95_1.time_ and arg_95_1.time_ <= var_98_30 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_32 = arg_95_1:FormatText(StoryNameCfg[56].name)

				arg_95_1.leftNameTxt_.text = var_98_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_33 = arg_95_1:GetWordFromCfg(1109704024)
				local var_98_34 = arg_95_1:FormatText(var_98_33.content)

				arg_95_1.text_.text = var_98_34

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_35 = 34
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704024", "story_v_side_new_1109704.awb") ~= 0 then
					local var_98_38 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704024", "story_v_side_new_1109704.awb") / 1000

					if var_98_38 + var_98_30 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_38 + var_98_30
					end

					if var_98_33.prefab_name ~= "" and arg_95_1.actors_[var_98_33.prefab_name] ~= nil then
						local var_98_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_33.prefab_name].transform, "story_v_side_new_1109704", "1109704024", "story_v_side_new_1109704.awb")

						arg_95_1:RecordAudio("1109704024", var_98_39)
						arg_95_1:RecordAudio("1109704024", var_98_39)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704024", "story_v_side_new_1109704.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704024", "story_v_side_new_1109704.awb")
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
	Play1109704025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 1109704025
		arg_99_1.duration_ = 7.7

		local var_99_0 = {
			zh = 6.533,
			ja = 7.7
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
				arg_99_0:Play1109704026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1080ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1080ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0.7, -1.01, -6.05)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1080ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0.7, -1.01, -6.05)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1080ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1080ui_story == nil then
				arg_99_1.var_.characterEffect1080ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1080ui_story then
					arg_99_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1080ui_story then
				arg_99_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action1_1")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_15 = arg_99_1.actors_["1027ui_story"]
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 and arg_99_1.var_.characterEffect1027ui_story == nil then
				arg_99_1.var_.characterEffect1027ui_story = var_102_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_17 = 0.200000002980232

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17

				if arg_99_1.var_.characterEffect1027ui_story then
					local var_102_19 = Mathf.Lerp(0, 0.5, var_102_18)

					arg_99_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1027ui_story.fillRatio = var_102_19
				end
			end

			if arg_99_1.time_ >= var_102_16 + var_102_17 and arg_99_1.time_ < var_102_16 + var_102_17 + arg_102_0 and arg_99_1.var_.characterEffect1027ui_story then
				local var_102_20 = 0.5

				arg_99_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1027ui_story.fillRatio = var_102_20
			end

			local var_102_21 = arg_99_1.actors_["1027ui_story"].transform
			local var_102_22 = 0

			if var_102_22 < arg_99_1.time_ and arg_99_1.time_ <= var_102_22 + arg_102_0 then
				arg_99_1.var_.moveOldPos1027ui_story = var_102_21.localPosition
			end

			local var_102_23 = 0.001

			if var_102_22 <= arg_99_1.time_ and arg_99_1.time_ < var_102_22 + var_102_23 then
				local var_102_24 = (arg_99_1.time_ - var_102_22) / var_102_23
				local var_102_25 = Vector3.New(0, 100, 0)

				var_102_21.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1027ui_story, var_102_25, var_102_24)

				local var_102_26 = manager.ui.mainCamera.transform.position - var_102_21.position

				var_102_21.forward = Vector3.New(var_102_26.x, var_102_26.y, var_102_26.z)

				local var_102_27 = var_102_21.localEulerAngles

				var_102_27.z = 0
				var_102_27.x = 0
				var_102_21.localEulerAngles = var_102_27
			end

			if arg_99_1.time_ >= var_102_22 + var_102_23 and arg_99_1.time_ < var_102_22 + var_102_23 + arg_102_0 then
				var_102_21.localPosition = Vector3.New(0, 100, 0)

				local var_102_28 = manager.ui.mainCamera.transform.position - var_102_21.position

				var_102_21.forward = Vector3.New(var_102_28.x, var_102_28.y, var_102_28.z)

				local var_102_29 = var_102_21.localEulerAngles

				var_102_29.z = 0
				var_102_29.x = 0
				var_102_21.localEulerAngles = var_102_29
			end

			local var_102_30 = 0
			local var_102_31 = 0.6

			if var_102_30 < arg_99_1.time_ and arg_99_1.time_ <= var_102_30 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_32 = arg_99_1:FormatText(StoryNameCfg[55].name)

				arg_99_1.leftNameTxt_.text = var_102_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_33 = arg_99_1:GetWordFromCfg(1109704025)
				local var_102_34 = arg_99_1:FormatText(var_102_33.content)

				arg_99_1.text_.text = var_102_34

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_35 = 24
				local var_102_36 = utf8.len(var_102_34)
				local var_102_37 = var_102_35 <= 0 and var_102_31 or var_102_31 * (var_102_36 / var_102_35)

				if var_102_37 > 0 and var_102_31 < var_102_37 then
					arg_99_1.talkMaxDuration = var_102_37

					if var_102_37 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_37 + var_102_30
					end
				end

				arg_99_1.text_.text = var_102_34
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704025", "story_v_side_new_1109704.awb") ~= 0 then
					local var_102_38 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704025", "story_v_side_new_1109704.awb") / 1000

					if var_102_38 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_38 + var_102_30
					end

					if var_102_33.prefab_name ~= "" and arg_99_1.actors_[var_102_33.prefab_name] ~= nil then
						local var_102_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_33.prefab_name].transform, "story_v_side_new_1109704", "1109704025", "story_v_side_new_1109704.awb")

						arg_99_1:RecordAudio("1109704025", var_102_39)
						arg_99_1:RecordAudio("1109704025", var_102_39)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704025", "story_v_side_new_1109704.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704025", "story_v_side_new_1109704.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_40 = math.max(var_102_31, arg_99_1.talkMaxDuration)

			if var_102_30 <= arg_99_1.time_ and arg_99_1.time_ < var_102_30 + var_102_40 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_30) / var_102_40

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_30 + var_102_40 and arg_99_1.time_ < var_102_30 + var_102_40 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 1109704026
		arg_103_1.duration_ = 5.7

		local var_103_0 = {
			zh = 5.333,
			ja = 5.7
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
				arg_103_0:Play1109704027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1027ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1027ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0.7, -0.81, -5.8)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1027ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["1027ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect1027ui_story == nil then
				arg_103_1.var_.characterEffect1027ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect1027ui_story then
					arg_103_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect1027ui_story then
				arg_103_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_106_15 = arg_103_1.actors_["1080ui_story"].transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.moveOldPos1080ui_story = var_106_15.localPosition
			end

			local var_106_17 = 0.001

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Vector3.New(0, 100, 0)

				var_106_15.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1080ui_story, var_106_19, var_106_18)

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

			local var_106_24 = arg_103_1.actors_["1080ui_story"]
			local var_106_25 = 0

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 and arg_103_1.var_.characterEffect1080ui_story == nil then
				arg_103_1.var_.characterEffect1080ui_story = var_106_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_26 = 0.200000002980232

			if var_106_25 <= arg_103_1.time_ and arg_103_1.time_ < var_106_25 + var_106_26 then
				local var_106_27 = (arg_103_1.time_ - var_106_25) / var_106_26

				if arg_103_1.var_.characterEffect1080ui_story then
					local var_106_28 = Mathf.Lerp(0, 0.5, var_106_27)

					arg_103_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1080ui_story.fillRatio = var_106_28
				end
			end

			if arg_103_1.time_ >= var_106_25 + var_106_26 and arg_103_1.time_ < var_106_25 + var_106_26 + arg_106_0 and arg_103_1.var_.characterEffect1080ui_story then
				local var_106_29 = 0.5

				arg_103_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1080ui_story.fillRatio = var_106_29
			end

			local var_106_30 = 0
			local var_106_31 = 0.475

			if var_106_30 < arg_103_1.time_ and arg_103_1.time_ <= var_106_30 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_32 = arg_103_1:FormatText(StoryNameCfg[56].name)

				arg_103_1.leftNameTxt_.text = var_106_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_33 = arg_103_1:GetWordFromCfg(1109704026)
				local var_106_34 = arg_103_1:FormatText(var_106_33.content)

				arg_103_1.text_.text = var_106_34

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_35 = 19
				local var_106_36 = utf8.len(var_106_34)
				local var_106_37 = var_106_35 <= 0 and var_106_31 or var_106_31 * (var_106_36 / var_106_35)

				if var_106_37 > 0 and var_106_31 < var_106_37 then
					arg_103_1.talkMaxDuration = var_106_37

					if var_106_37 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_37 + var_106_30
					end
				end

				arg_103_1.text_.text = var_106_34
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704026", "story_v_side_new_1109704.awb") ~= 0 then
					local var_106_38 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704026", "story_v_side_new_1109704.awb") / 1000

					if var_106_38 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_38 + var_106_30
					end

					if var_106_33.prefab_name ~= "" and arg_103_1.actors_[var_106_33.prefab_name] ~= nil then
						local var_106_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_33.prefab_name].transform, "story_v_side_new_1109704", "1109704026", "story_v_side_new_1109704.awb")

						arg_103_1:RecordAudio("1109704026", var_106_39)
						arg_103_1:RecordAudio("1109704026", var_106_39)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704026", "story_v_side_new_1109704.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704026", "story_v_side_new_1109704.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_40 = math.max(var_106_31, arg_103_1.talkMaxDuration)

			if var_106_30 <= arg_103_1.time_ and arg_103_1.time_ < var_106_30 + var_106_40 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_30) / var_106_40

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_30 + var_106_40 and arg_103_1.time_ < var_106_30 + var_106_40 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 1109704027
		arg_107_1.duration_ = 5.1

		local var_107_0 = {
			zh = 3.733,
			ja = 5.1
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
				arg_107_0:Play1109704028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1097ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1097ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1097ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["1097ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1097ui_story == nil then
				arg_107_1.var_.characterEffect1097ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect1097ui_story then
					arg_107_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect1097ui_story then
				arg_107_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_110_13 = 0

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				arg_107_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_15 = arg_107_1.actors_["1080ui_story"].transform
			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.var_.moveOldPos1080ui_story = var_110_15.localPosition
			end

			local var_110_17 = 0.001

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17
				local var_110_19 = Vector3.New(0.7, -1.01, -6.05)

				var_110_15.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1080ui_story, var_110_19, var_110_18)

				local var_110_20 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_20.x, var_110_20.y, var_110_20.z)

				local var_110_21 = var_110_15.localEulerAngles

				var_110_21.z = 0
				var_110_21.x = 0
				var_110_15.localEulerAngles = var_110_21
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				var_110_15.localPosition = Vector3.New(0.7, -1.01, -6.05)

				local var_110_22 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_22.x, var_110_22.y, var_110_22.z)

				local var_110_23 = var_110_15.localEulerAngles

				var_110_23.z = 0
				var_110_23.x = 0
				var_110_15.localEulerAngles = var_110_23
			end

			local var_110_24 = arg_107_1.actors_["1080ui_story"]
			local var_110_25 = 0

			if var_110_25 < arg_107_1.time_ and arg_107_1.time_ <= var_110_25 + arg_110_0 and arg_107_1.var_.characterEffect1080ui_story == nil then
				arg_107_1.var_.characterEffect1080ui_story = var_110_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_26 = 0.200000002980232

			if var_110_25 <= arg_107_1.time_ and arg_107_1.time_ < var_110_25 + var_110_26 then
				local var_110_27 = (arg_107_1.time_ - var_110_25) / var_110_26

				if arg_107_1.var_.characterEffect1080ui_story then
					local var_110_28 = Mathf.Lerp(0, 0.5, var_110_27)

					arg_107_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1080ui_story.fillRatio = var_110_28
				end
			end

			if arg_107_1.time_ >= var_110_25 + var_110_26 and arg_107_1.time_ < var_110_25 + var_110_26 + arg_110_0 and arg_107_1.var_.characterEffect1080ui_story then
				local var_110_29 = 0.5

				arg_107_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1080ui_story.fillRatio = var_110_29
			end

			local var_110_30 = arg_107_1.actors_["1027ui_story"].transform
			local var_110_31 = 0

			if var_110_31 < arg_107_1.time_ and arg_107_1.time_ <= var_110_31 + arg_110_0 then
				arg_107_1.var_.moveOldPos1027ui_story = var_110_30.localPosition
			end

			local var_110_32 = 0.001

			if var_110_31 <= arg_107_1.time_ and arg_107_1.time_ < var_110_31 + var_110_32 then
				local var_110_33 = (arg_107_1.time_ - var_110_31) / var_110_32
				local var_110_34 = Vector3.New(0, 100, 0)

				var_110_30.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1027ui_story, var_110_34, var_110_33)

				local var_110_35 = manager.ui.mainCamera.transform.position - var_110_30.position

				var_110_30.forward = Vector3.New(var_110_35.x, var_110_35.y, var_110_35.z)

				local var_110_36 = var_110_30.localEulerAngles

				var_110_36.z = 0
				var_110_36.x = 0
				var_110_30.localEulerAngles = var_110_36
			end

			if arg_107_1.time_ >= var_110_31 + var_110_32 and arg_107_1.time_ < var_110_31 + var_110_32 + arg_110_0 then
				var_110_30.localPosition = Vector3.New(0, 100, 0)

				local var_110_37 = manager.ui.mainCamera.transform.position - var_110_30.position

				var_110_30.forward = Vector3.New(var_110_37.x, var_110_37.y, var_110_37.z)

				local var_110_38 = var_110_30.localEulerAngles

				var_110_38.z = 0
				var_110_38.x = 0
				var_110_30.localEulerAngles = var_110_38
			end

			local var_110_39 = arg_107_1.actors_["1027ui_story"]
			local var_110_40 = 0

			if var_110_40 < arg_107_1.time_ and arg_107_1.time_ <= var_110_40 + arg_110_0 and arg_107_1.var_.characterEffect1027ui_story == nil then
				arg_107_1.var_.characterEffect1027ui_story = var_110_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_41 = 0.200000002980232

			if var_110_40 <= arg_107_1.time_ and arg_107_1.time_ < var_110_40 + var_110_41 then
				local var_110_42 = (arg_107_1.time_ - var_110_40) / var_110_41

				if arg_107_1.var_.characterEffect1027ui_story then
					local var_110_43 = Mathf.Lerp(0, 0.5, var_110_42)

					arg_107_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1027ui_story.fillRatio = var_110_43
				end
			end

			if arg_107_1.time_ >= var_110_40 + var_110_41 and arg_107_1.time_ < var_110_40 + var_110_41 + arg_110_0 and arg_107_1.var_.characterEffect1027ui_story then
				local var_110_44 = 0.5

				arg_107_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1027ui_story.fillRatio = var_110_44
			end

			local var_110_45 = 0
			local var_110_46 = 0.375

			if var_110_45 < arg_107_1.time_ and arg_107_1.time_ <= var_110_45 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_47 = arg_107_1:FormatText(StoryNameCfg[216].name)

				arg_107_1.leftNameTxt_.text = var_110_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_48 = arg_107_1:GetWordFromCfg(1109704027)
				local var_110_49 = arg_107_1:FormatText(var_110_48.content)

				arg_107_1.text_.text = var_110_49

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_50 = 15
				local var_110_51 = utf8.len(var_110_49)
				local var_110_52 = var_110_50 <= 0 and var_110_46 or var_110_46 * (var_110_51 / var_110_50)

				if var_110_52 > 0 and var_110_46 < var_110_52 then
					arg_107_1.talkMaxDuration = var_110_52

					if var_110_52 + var_110_45 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_52 + var_110_45
					end
				end

				arg_107_1.text_.text = var_110_49
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704027", "story_v_side_new_1109704.awb") ~= 0 then
					local var_110_53 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704027", "story_v_side_new_1109704.awb") / 1000

					if var_110_53 + var_110_45 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_53 + var_110_45
					end

					if var_110_48.prefab_name ~= "" and arg_107_1.actors_[var_110_48.prefab_name] ~= nil then
						local var_110_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_48.prefab_name].transform, "story_v_side_new_1109704", "1109704027", "story_v_side_new_1109704.awb")

						arg_107_1:RecordAudio("1109704027", var_110_54)
						arg_107_1:RecordAudio("1109704027", var_110_54)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704027", "story_v_side_new_1109704.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704027", "story_v_side_new_1109704.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_55 = math.max(var_110_46, arg_107_1.talkMaxDuration)

			if var_110_45 <= arg_107_1.time_ and arg_107_1.time_ < var_110_45 + var_110_55 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_45) / var_110_55

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_45 + var_110_55 and arg_107_1.time_ < var_110_45 + var_110_55 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 1109704028
		arg_111_1.duration_ = 5.4

		local var_111_0 = {
			zh = 5.4,
			ja = 4.366
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
				arg_111_0:Play1109704029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_114_2 = 0
			local var_114_3 = 0.575

			if var_114_2 < arg_111_1.time_ and arg_111_1.time_ <= var_114_2 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_4 = arg_111_1:FormatText(StoryNameCfg[216].name)

				arg_111_1.leftNameTxt_.text = var_114_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_5 = arg_111_1:GetWordFromCfg(1109704028)
				local var_114_6 = arg_111_1:FormatText(var_114_5.content)

				arg_111_1.text_.text = var_114_6

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_7 = 23
				local var_114_8 = utf8.len(var_114_6)
				local var_114_9 = var_114_7 <= 0 and var_114_3 or var_114_3 * (var_114_8 / var_114_7)

				if var_114_9 > 0 and var_114_3 < var_114_9 then
					arg_111_1.talkMaxDuration = var_114_9

					if var_114_9 + var_114_2 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_9 + var_114_2
					end
				end

				arg_111_1.text_.text = var_114_6
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704028", "story_v_side_new_1109704.awb") ~= 0 then
					local var_114_10 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704028", "story_v_side_new_1109704.awb") / 1000

					if var_114_10 + var_114_2 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_10 + var_114_2
					end

					if var_114_5.prefab_name ~= "" and arg_111_1.actors_[var_114_5.prefab_name] ~= nil then
						local var_114_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_5.prefab_name].transform, "story_v_side_new_1109704", "1109704028", "story_v_side_new_1109704.awb")

						arg_111_1:RecordAudio("1109704028", var_114_11)
						arg_111_1:RecordAudio("1109704028", var_114_11)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704028", "story_v_side_new_1109704.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704028", "story_v_side_new_1109704.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_12 = math.max(var_114_3, arg_111_1.talkMaxDuration)

			if var_114_2 <= arg_111_1.time_ and arg_111_1.time_ < var_114_2 + var_114_12 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_2) / var_114_12

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_2 + var_114_12 and arg_111_1.time_ < var_114_2 + var_114_12 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 1109704029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play1109704030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1097ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1097ui_story == nil then
				arg_115_1.var_.characterEffect1097ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.200000002980232

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1097ui_story then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1097ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1097ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1097ui_story.fillRatio = var_118_5
			end

			local var_118_6 = 0
			local var_118_7 = 0.25

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_8 = arg_115_1:FormatText(StoryNameCfg[7].name)

				arg_115_1.leftNameTxt_.text = var_118_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_9 = arg_115_1:GetWordFromCfg(1109704029)
				local var_118_10 = arg_115_1:FormatText(var_118_9.content)

				arg_115_1.text_.text = var_118_10

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_11 = 10
				local var_118_12 = utf8.len(var_118_10)
				local var_118_13 = var_118_11 <= 0 and var_118_7 or var_118_7 * (var_118_12 / var_118_11)

				if var_118_13 > 0 and var_118_7 < var_118_13 then
					arg_115_1.talkMaxDuration = var_118_13

					if var_118_13 + var_118_6 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_13 + var_118_6
					end
				end

				arg_115_1.text_.text = var_118_10
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_14 = math.max(var_118_7, arg_115_1.talkMaxDuration)

			if var_118_6 <= arg_115_1.time_ and arg_115_1.time_ < var_118_6 + var_118_14 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_6) / var_118_14

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_6 + var_118_14 and arg_115_1.time_ < var_118_6 + var_118_14 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 1109704030
		arg_119_1.duration_ = 4.266

		local var_119_0 = {
			zh = 3.666,
			ja = 4.266
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
				arg_119_0:Play1109704031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1097ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1097ui_story == nil then
				arg_119_1.var_.characterEffect1097ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.200000002980232

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1097ui_story then
					arg_119_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1097ui_story then
				arg_119_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_122_4 = 0

			if var_122_4 < arg_119_1.time_ and arg_119_1.time_ <= var_122_4 + arg_122_0 then
				arg_119_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 then
				arg_119_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_122_6 = 0
			local var_122_7 = 0.575

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_8 = arg_119_1:FormatText(StoryNameCfg[216].name)

				arg_119_1.leftNameTxt_.text = var_122_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_9 = arg_119_1:GetWordFromCfg(1109704030)
				local var_122_10 = arg_119_1:FormatText(var_122_9.content)

				arg_119_1.text_.text = var_122_10

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_11 = 23
				local var_122_12 = utf8.len(var_122_10)
				local var_122_13 = var_122_11 <= 0 and var_122_7 or var_122_7 * (var_122_12 / var_122_11)

				if var_122_13 > 0 and var_122_7 < var_122_13 then
					arg_119_1.talkMaxDuration = var_122_13

					if var_122_13 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_13 + var_122_6
					end
				end

				arg_119_1.text_.text = var_122_10
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704030", "story_v_side_new_1109704.awb") ~= 0 then
					local var_122_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704030", "story_v_side_new_1109704.awb") / 1000

					if var_122_14 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_14 + var_122_6
					end

					if var_122_9.prefab_name ~= "" and arg_119_1.actors_[var_122_9.prefab_name] ~= nil then
						local var_122_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_9.prefab_name].transform, "story_v_side_new_1109704", "1109704030", "story_v_side_new_1109704.awb")

						arg_119_1:RecordAudio("1109704030", var_122_15)
						arg_119_1:RecordAudio("1109704030", var_122_15)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704030", "story_v_side_new_1109704.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704030", "story_v_side_new_1109704.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_16 = math.max(var_122_7, arg_119_1.talkMaxDuration)

			if var_122_6 <= arg_119_1.time_ and arg_119_1.time_ < var_122_6 + var_122_16 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_6) / var_122_16

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_6 + var_122_16 and arg_119_1.time_ < var_122_6 + var_122_16 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 1109704031
		arg_123_1.duration_ = 7.8

		local var_123_0 = {
			zh = 6.666,
			ja = 7.8
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
				arg_123_0:Play1109704032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1027ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1027ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0.7, -0.81, -5.8)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1027ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["1027ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect1027ui_story == nil then
				arg_123_1.var_.characterEffect1027ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect1027ui_story then
					arg_123_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect1027ui_story then
				arg_123_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action4_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_126_15 = arg_123_1.actors_["1080ui_story"].transform
			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.var_.moveOldPos1080ui_story = var_126_15.localPosition
			end

			local var_126_17 = 0.001

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17
				local var_126_19 = Vector3.New(0, 100, 0)

				var_126_15.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1080ui_story, var_126_19, var_126_18)

				local var_126_20 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_20.x, var_126_20.y, var_126_20.z)

				local var_126_21 = var_126_15.localEulerAngles

				var_126_21.z = 0
				var_126_21.x = 0
				var_126_15.localEulerAngles = var_126_21
			end

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 then
				var_126_15.localPosition = Vector3.New(0, 100, 0)

				local var_126_22 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_22.x, var_126_22.y, var_126_22.z)

				local var_126_23 = var_126_15.localEulerAngles

				var_126_23.z = 0
				var_126_23.x = 0
				var_126_15.localEulerAngles = var_126_23
			end

			local var_126_24 = arg_123_1.actors_["1080ui_story"]
			local var_126_25 = 0

			if var_126_25 < arg_123_1.time_ and arg_123_1.time_ <= var_126_25 + arg_126_0 and arg_123_1.var_.characterEffect1080ui_story == nil then
				arg_123_1.var_.characterEffect1080ui_story = var_126_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_26 = 0.200000002980232

			if var_126_25 <= arg_123_1.time_ and arg_123_1.time_ < var_126_25 + var_126_26 then
				local var_126_27 = (arg_123_1.time_ - var_126_25) / var_126_26

				if arg_123_1.var_.characterEffect1080ui_story then
					local var_126_28 = Mathf.Lerp(0, 0.5, var_126_27)

					arg_123_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1080ui_story.fillRatio = var_126_28
				end
			end

			if arg_123_1.time_ >= var_126_25 + var_126_26 and arg_123_1.time_ < var_126_25 + var_126_26 + arg_126_0 and arg_123_1.var_.characterEffect1080ui_story then
				local var_126_29 = 0.5

				arg_123_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1080ui_story.fillRatio = var_126_29
			end

			local var_126_30 = arg_123_1.actors_["1097ui_story"]
			local var_126_31 = 0

			if var_126_31 < arg_123_1.time_ and arg_123_1.time_ <= var_126_31 + arg_126_0 and arg_123_1.var_.characterEffect1097ui_story == nil then
				arg_123_1.var_.characterEffect1097ui_story = var_126_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_32 = 0.200000002980232

			if var_126_31 <= arg_123_1.time_ and arg_123_1.time_ < var_126_31 + var_126_32 then
				local var_126_33 = (arg_123_1.time_ - var_126_31) / var_126_32

				if arg_123_1.var_.characterEffect1097ui_story then
					local var_126_34 = Mathf.Lerp(0, 0.5, var_126_33)

					arg_123_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1097ui_story.fillRatio = var_126_34
				end
			end

			if arg_123_1.time_ >= var_126_31 + var_126_32 and arg_123_1.time_ < var_126_31 + var_126_32 + arg_126_0 and arg_123_1.var_.characterEffect1097ui_story then
				local var_126_35 = 0.5

				arg_123_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1097ui_story.fillRatio = var_126_35
			end

			local var_126_36 = 0
			local var_126_37 = 0.6

			if var_126_36 < arg_123_1.time_ and arg_123_1.time_ <= var_126_36 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_38 = arg_123_1:FormatText(StoryNameCfg[56].name)

				arg_123_1.leftNameTxt_.text = var_126_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_39 = arg_123_1:GetWordFromCfg(1109704031)
				local var_126_40 = arg_123_1:FormatText(var_126_39.content)

				arg_123_1.text_.text = var_126_40

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_41 = 24
				local var_126_42 = utf8.len(var_126_40)
				local var_126_43 = var_126_41 <= 0 and var_126_37 or var_126_37 * (var_126_42 / var_126_41)

				if var_126_43 > 0 and var_126_37 < var_126_43 then
					arg_123_1.talkMaxDuration = var_126_43

					if var_126_43 + var_126_36 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_43 + var_126_36
					end
				end

				arg_123_1.text_.text = var_126_40
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704031", "story_v_side_new_1109704.awb") ~= 0 then
					local var_126_44 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704031", "story_v_side_new_1109704.awb") / 1000

					if var_126_44 + var_126_36 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_44 + var_126_36
					end

					if var_126_39.prefab_name ~= "" and arg_123_1.actors_[var_126_39.prefab_name] ~= nil then
						local var_126_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_39.prefab_name].transform, "story_v_side_new_1109704", "1109704031", "story_v_side_new_1109704.awb")

						arg_123_1:RecordAudio("1109704031", var_126_45)
						arg_123_1:RecordAudio("1109704031", var_126_45)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704031", "story_v_side_new_1109704.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704031", "story_v_side_new_1109704.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_46 = math.max(var_126_37, arg_123_1.talkMaxDuration)

			if var_126_36 <= arg_123_1.time_ and arg_123_1.time_ < var_126_36 + var_126_46 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_36) / var_126_46

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_36 + var_126_46 and arg_123_1.time_ < var_126_36 + var_126_46 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 1109704032
		arg_127_1.duration_ = 8.833

		local var_127_0 = {
			zh = 4.9,
			ja = 8.833
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
				arg_127_0:Play1109704033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1097ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1097ui_story == nil then
				arg_127_1.var_.characterEffect1097ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1097ui_story then
					arg_127_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1097ui_story then
				arg_127_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_130_4 = 0

			if var_130_4 < arg_127_1.time_ and arg_127_1.time_ <= var_130_4 + arg_130_0 then
				arg_127_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 then
				arg_127_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_130_6 = arg_127_1.actors_["1027ui_story"]
			local var_130_7 = 0

			if var_130_7 < arg_127_1.time_ and arg_127_1.time_ <= var_130_7 + arg_130_0 and arg_127_1.var_.characterEffect1027ui_story == nil then
				arg_127_1.var_.characterEffect1027ui_story = var_130_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_8 = 0.200000002980232

			if var_130_7 <= arg_127_1.time_ and arg_127_1.time_ < var_130_7 + var_130_8 then
				local var_130_9 = (arg_127_1.time_ - var_130_7) / var_130_8

				if arg_127_1.var_.characterEffect1027ui_story then
					local var_130_10 = Mathf.Lerp(0, 0.5, var_130_9)

					arg_127_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1027ui_story.fillRatio = var_130_10
				end
			end

			if arg_127_1.time_ >= var_130_7 + var_130_8 and arg_127_1.time_ < var_130_7 + var_130_8 + arg_130_0 and arg_127_1.var_.characterEffect1027ui_story then
				local var_130_11 = 0.5

				arg_127_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1027ui_story.fillRatio = var_130_11
			end

			local var_130_12 = 0
			local var_130_13 = 0.55

			if var_130_12 < arg_127_1.time_ and arg_127_1.time_ <= var_130_12 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_14 = arg_127_1:FormatText(StoryNameCfg[216].name)

				arg_127_1.leftNameTxt_.text = var_130_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_15 = arg_127_1:GetWordFromCfg(1109704032)
				local var_130_16 = arg_127_1:FormatText(var_130_15.content)

				arg_127_1.text_.text = var_130_16

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_17 = 22
				local var_130_18 = utf8.len(var_130_16)
				local var_130_19 = var_130_17 <= 0 and var_130_13 or var_130_13 * (var_130_18 / var_130_17)

				if var_130_19 > 0 and var_130_13 < var_130_19 then
					arg_127_1.talkMaxDuration = var_130_19

					if var_130_19 + var_130_12 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_19 + var_130_12
					end
				end

				arg_127_1.text_.text = var_130_16
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704032", "story_v_side_new_1109704.awb") ~= 0 then
					local var_130_20 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704032", "story_v_side_new_1109704.awb") / 1000

					if var_130_20 + var_130_12 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_20 + var_130_12
					end

					if var_130_15.prefab_name ~= "" and arg_127_1.actors_[var_130_15.prefab_name] ~= nil then
						local var_130_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_15.prefab_name].transform, "story_v_side_new_1109704", "1109704032", "story_v_side_new_1109704.awb")

						arg_127_1:RecordAudio("1109704032", var_130_21)
						arg_127_1:RecordAudio("1109704032", var_130_21)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704032", "story_v_side_new_1109704.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704032", "story_v_side_new_1109704.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_22 = math.max(var_130_13, arg_127_1.talkMaxDuration)

			if var_130_12 <= arg_127_1.time_ and arg_127_1.time_ < var_130_12 + var_130_22 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_12) / var_130_22

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_12 + var_130_22 and arg_127_1.time_ < var_130_12 + var_130_22 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 1109704033
		arg_131_1.duration_ = 5.6

		local var_131_0 = {
			zh = 5.6,
			ja = 5.333
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
				arg_131_0:Play1109704034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1027ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1027ui_story == nil then
				arg_131_1.var_.characterEffect1027ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.200000002980232

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1027ui_story then
					arg_131_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1027ui_story then
				arg_131_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_134_4 = 0

			if var_134_4 < arg_131_1.time_ and arg_131_1.time_ <= var_134_4 + arg_134_0 then
				arg_131_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action4_2")
			end

			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_134_6 = arg_131_1.actors_["1097ui_story"]
			local var_134_7 = 0

			if var_134_7 < arg_131_1.time_ and arg_131_1.time_ <= var_134_7 + arg_134_0 and arg_131_1.var_.characterEffect1097ui_story == nil then
				arg_131_1.var_.characterEffect1097ui_story = var_134_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_8 = 0.200000002980232

			if var_134_7 <= arg_131_1.time_ and arg_131_1.time_ < var_134_7 + var_134_8 then
				local var_134_9 = (arg_131_1.time_ - var_134_7) / var_134_8

				if arg_131_1.var_.characterEffect1097ui_story then
					local var_134_10 = Mathf.Lerp(0, 0.5, var_134_9)

					arg_131_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1097ui_story.fillRatio = var_134_10
				end
			end

			if arg_131_1.time_ >= var_134_7 + var_134_8 and arg_131_1.time_ < var_134_7 + var_134_8 + arg_134_0 and arg_131_1.var_.characterEffect1097ui_story then
				local var_134_11 = 0.5

				arg_131_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1097ui_story.fillRatio = var_134_11
			end

			local var_134_12 = 0
			local var_134_13 = 0.55

			if var_134_12 < arg_131_1.time_ and arg_131_1.time_ <= var_134_12 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_14 = arg_131_1:FormatText(StoryNameCfg[56].name)

				arg_131_1.leftNameTxt_.text = var_134_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_15 = arg_131_1:GetWordFromCfg(1109704033)
				local var_134_16 = arg_131_1:FormatText(var_134_15.content)

				arg_131_1.text_.text = var_134_16

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_17 = 22
				local var_134_18 = utf8.len(var_134_16)
				local var_134_19 = var_134_17 <= 0 and var_134_13 or var_134_13 * (var_134_18 / var_134_17)

				if var_134_19 > 0 and var_134_13 < var_134_19 then
					arg_131_1.talkMaxDuration = var_134_19

					if var_134_19 + var_134_12 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_19 + var_134_12
					end
				end

				arg_131_1.text_.text = var_134_16
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704033", "story_v_side_new_1109704.awb") ~= 0 then
					local var_134_20 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704033", "story_v_side_new_1109704.awb") / 1000

					if var_134_20 + var_134_12 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_20 + var_134_12
					end

					if var_134_15.prefab_name ~= "" and arg_131_1.actors_[var_134_15.prefab_name] ~= nil then
						local var_134_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_15.prefab_name].transform, "story_v_side_new_1109704", "1109704033", "story_v_side_new_1109704.awb")

						arg_131_1:RecordAudio("1109704033", var_134_21)
						arg_131_1:RecordAudio("1109704033", var_134_21)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704033", "story_v_side_new_1109704.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704033", "story_v_side_new_1109704.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_22 = math.max(var_134_13, arg_131_1.talkMaxDuration)

			if var_134_12 <= arg_131_1.time_ and arg_131_1.time_ < var_134_12 + var_134_22 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_12) / var_134_22

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_12 + var_134_22 and arg_131_1.time_ < var_134_12 + var_134_22 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 1109704034
		arg_135_1.duration_ = 7.233

		local var_135_0 = {
			zh = 7.233,
			ja = 5.966
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
				arg_135_0:Play1109704035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1097ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1097ui_story == nil then
				arg_135_1.var_.characterEffect1097ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.200000002980232

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1097ui_story then
					arg_135_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1097ui_story then
				arg_135_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_138_4 = 0

			if var_138_4 < arg_135_1.time_ and arg_135_1.time_ <= var_138_4 + arg_138_0 then
				arg_135_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_138_6 = arg_135_1.actors_["1027ui_story"]
			local var_138_7 = 0

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 and arg_135_1.var_.characterEffect1027ui_story == nil then
				arg_135_1.var_.characterEffect1027ui_story = var_138_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_8 = 0.200000002980232

			if var_138_7 <= arg_135_1.time_ and arg_135_1.time_ < var_138_7 + var_138_8 then
				local var_138_9 = (arg_135_1.time_ - var_138_7) / var_138_8

				if arg_135_1.var_.characterEffect1027ui_story then
					local var_138_10 = Mathf.Lerp(0, 0.5, var_138_9)

					arg_135_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1027ui_story.fillRatio = var_138_10
				end
			end

			if arg_135_1.time_ >= var_138_7 + var_138_8 and arg_135_1.time_ < var_138_7 + var_138_8 + arg_138_0 and arg_135_1.var_.characterEffect1027ui_story then
				local var_138_11 = 0.5

				arg_135_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1027ui_story.fillRatio = var_138_11
			end

			local var_138_12 = 0
			local var_138_13 = 0.825

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_14 = arg_135_1:FormatText(StoryNameCfg[216].name)

				arg_135_1.leftNameTxt_.text = var_138_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_15 = arg_135_1:GetWordFromCfg(1109704034)
				local var_138_16 = arg_135_1:FormatText(var_138_15.content)

				arg_135_1.text_.text = var_138_16

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_17 = 33
				local var_138_18 = utf8.len(var_138_16)
				local var_138_19 = var_138_17 <= 0 and var_138_13 or var_138_13 * (var_138_18 / var_138_17)

				if var_138_19 > 0 and var_138_13 < var_138_19 then
					arg_135_1.talkMaxDuration = var_138_19

					if var_138_19 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_19 + var_138_12
					end
				end

				arg_135_1.text_.text = var_138_16
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704034", "story_v_side_new_1109704.awb") ~= 0 then
					local var_138_20 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704034", "story_v_side_new_1109704.awb") / 1000

					if var_138_20 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_12
					end

					if var_138_15.prefab_name ~= "" and arg_135_1.actors_[var_138_15.prefab_name] ~= nil then
						local var_138_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_15.prefab_name].transform, "story_v_side_new_1109704", "1109704034", "story_v_side_new_1109704.awb")

						arg_135_1:RecordAudio("1109704034", var_138_21)
						arg_135_1:RecordAudio("1109704034", var_138_21)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704034", "story_v_side_new_1109704.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704034", "story_v_side_new_1109704.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_22 = math.max(var_138_13, arg_135_1.talkMaxDuration)

			if var_138_12 <= arg_135_1.time_ and arg_135_1.time_ < var_138_12 + var_138_22 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_12) / var_138_22

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_12 + var_138_22 and arg_135_1.time_ < var_138_12 + var_138_22 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 1109704035
		arg_139_1.duration_ = 3.1

		local var_139_0 = {
			zh = 2.566,
			ja = 3.1
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
				arg_139_0:Play1109704036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1027ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1027ui_story == nil then
				arg_139_1.var_.characterEffect1027ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.200000002980232

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1027ui_story then
					arg_139_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1027ui_story then
				arg_139_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_142_4 = 0

			if var_142_4 < arg_139_1.time_ and arg_139_1.time_ <= var_142_4 + arg_142_0 then
				arg_139_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action1_1")
			end

			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 then
				arg_139_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_142_6 = arg_139_1.actors_["1097ui_story"]
			local var_142_7 = 0

			if var_142_7 < arg_139_1.time_ and arg_139_1.time_ <= var_142_7 + arg_142_0 and arg_139_1.var_.characterEffect1097ui_story == nil then
				arg_139_1.var_.characterEffect1097ui_story = var_142_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_8 = 0.200000002980232

			if var_142_7 <= arg_139_1.time_ and arg_139_1.time_ < var_142_7 + var_142_8 then
				local var_142_9 = (arg_139_1.time_ - var_142_7) / var_142_8

				if arg_139_1.var_.characterEffect1097ui_story then
					local var_142_10 = Mathf.Lerp(0, 0.5, var_142_9)

					arg_139_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1097ui_story.fillRatio = var_142_10
				end
			end

			if arg_139_1.time_ >= var_142_7 + var_142_8 and arg_139_1.time_ < var_142_7 + var_142_8 + arg_142_0 and arg_139_1.var_.characterEffect1097ui_story then
				local var_142_11 = 0.5

				arg_139_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1097ui_story.fillRatio = var_142_11
			end

			local var_142_12 = 0
			local var_142_13 = 0.125

			if var_142_12 < arg_139_1.time_ and arg_139_1.time_ <= var_142_12 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_14 = arg_139_1:FormatText(StoryNameCfg[56].name)

				arg_139_1.leftNameTxt_.text = var_142_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_15 = arg_139_1:GetWordFromCfg(1109704035)
				local var_142_16 = arg_139_1:FormatText(var_142_15.content)

				arg_139_1.text_.text = var_142_16

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_17 = 5
				local var_142_18 = utf8.len(var_142_16)
				local var_142_19 = var_142_17 <= 0 and var_142_13 or var_142_13 * (var_142_18 / var_142_17)

				if var_142_19 > 0 and var_142_13 < var_142_19 then
					arg_139_1.talkMaxDuration = var_142_19

					if var_142_19 + var_142_12 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_19 + var_142_12
					end
				end

				arg_139_1.text_.text = var_142_16
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704035", "story_v_side_new_1109704.awb") ~= 0 then
					local var_142_20 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704035", "story_v_side_new_1109704.awb") / 1000

					if var_142_20 + var_142_12 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_20 + var_142_12
					end

					if var_142_15.prefab_name ~= "" and arg_139_1.actors_[var_142_15.prefab_name] ~= nil then
						local var_142_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_15.prefab_name].transform, "story_v_side_new_1109704", "1109704035", "story_v_side_new_1109704.awb")

						arg_139_1:RecordAudio("1109704035", var_142_21)
						arg_139_1:RecordAudio("1109704035", var_142_21)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704035", "story_v_side_new_1109704.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704035", "story_v_side_new_1109704.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_22 = math.max(var_142_13, arg_139_1.talkMaxDuration)

			if var_142_12 <= arg_139_1.time_ and arg_139_1.time_ < var_142_12 + var_142_22 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_12) / var_142_22

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_12 + var_142_22 and arg_139_1.time_ < var_142_12 + var_142_22 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 1109704036
		arg_143_1.duration_ = 5

		local var_143_0 = {
			zh = 5,
			ja = 3.066
		}
		local var_143_1 = manager.audio:GetLocalizationFlag()

		if var_143_0[var_143_1] ~= nil then
			arg_143_1.duration_ = var_143_0[var_143_1]
		end

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play1109704037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1097ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1097ui_story == nil then
				arg_143_1.var_.characterEffect1097ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1097ui_story then
					arg_143_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1097ui_story then
				arg_143_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_146_4 = 0

			if var_146_4 < arg_143_1.time_ and arg_143_1.time_ <= var_146_4 + arg_146_0 then
				arg_143_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_146_5 = 0

			if var_146_5 < arg_143_1.time_ and arg_143_1.time_ <= var_146_5 + arg_146_0 then
				arg_143_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_146_6 = arg_143_1.actors_["1027ui_story"]
			local var_146_7 = 0

			if var_146_7 < arg_143_1.time_ and arg_143_1.time_ <= var_146_7 + arg_146_0 and arg_143_1.var_.characterEffect1027ui_story == nil then
				arg_143_1.var_.characterEffect1027ui_story = var_146_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_8 = 0.200000002980232

			if var_146_7 <= arg_143_1.time_ and arg_143_1.time_ < var_146_7 + var_146_8 then
				local var_146_9 = (arg_143_1.time_ - var_146_7) / var_146_8

				if arg_143_1.var_.characterEffect1027ui_story then
					local var_146_10 = Mathf.Lerp(0, 0.5, var_146_9)

					arg_143_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1027ui_story.fillRatio = var_146_10
				end
			end

			if arg_143_1.time_ >= var_146_7 + var_146_8 and arg_143_1.time_ < var_146_7 + var_146_8 + arg_146_0 and arg_143_1.var_.characterEffect1027ui_story then
				local var_146_11 = 0.5

				arg_143_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1027ui_story.fillRatio = var_146_11
			end

			local var_146_12 = 0
			local var_146_13 = 0.4

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_14 = arg_143_1:FormatText(StoryNameCfg[216].name)

				arg_143_1.leftNameTxt_.text = var_146_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_15 = arg_143_1:GetWordFromCfg(1109704036)
				local var_146_16 = arg_143_1:FormatText(var_146_15.content)

				arg_143_1.text_.text = var_146_16

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_17 = 16
				local var_146_18 = utf8.len(var_146_16)
				local var_146_19 = var_146_17 <= 0 and var_146_13 or var_146_13 * (var_146_18 / var_146_17)

				if var_146_19 > 0 and var_146_13 < var_146_19 then
					arg_143_1.talkMaxDuration = var_146_19

					if var_146_19 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_19 + var_146_12
					end
				end

				arg_143_1.text_.text = var_146_16
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704036", "story_v_side_new_1109704.awb") ~= 0 then
					local var_146_20 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704036", "story_v_side_new_1109704.awb") / 1000

					if var_146_20 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_12
					end

					if var_146_15.prefab_name ~= "" and arg_143_1.actors_[var_146_15.prefab_name] ~= nil then
						local var_146_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_15.prefab_name].transform, "story_v_side_new_1109704", "1109704036", "story_v_side_new_1109704.awb")

						arg_143_1:RecordAudio("1109704036", var_146_21)
						arg_143_1:RecordAudio("1109704036", var_146_21)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704036", "story_v_side_new_1109704.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704036", "story_v_side_new_1109704.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_22 = math.max(var_146_13, arg_143_1.talkMaxDuration)

			if var_146_12 <= arg_143_1.time_ and arg_143_1.time_ < var_146_12 + var_146_22 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_12) / var_146_22

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_12 + var_146_22 and arg_143_1.time_ < var_146_12 + var_146_22 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 1109704037
		arg_147_1.duration_ = 4.2

		local var_147_0 = {
			zh = 2.966,
			ja = 4.2
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
				arg_147_0:Play1109704038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1027ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1027ui_story == nil then
				arg_147_1.var_.characterEffect1027ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.200000002980232

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1027ui_story then
					arg_147_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1027ui_story then
				arg_147_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_150_4 = 0

			if var_150_4 < arg_147_1.time_ and arg_147_1.time_ <= var_150_4 + arg_150_0 then
				arg_147_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_150_5 = 0

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 then
				arg_147_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_150_6 = arg_147_1.actors_["1097ui_story"]
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 and arg_147_1.var_.characterEffect1097ui_story == nil then
				arg_147_1.var_.characterEffect1097ui_story = var_150_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_8 = 0.200000002980232

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_8 then
				local var_150_9 = (arg_147_1.time_ - var_150_7) / var_150_8

				if arg_147_1.var_.characterEffect1097ui_story then
					local var_150_10 = Mathf.Lerp(0, 0.5, var_150_9)

					arg_147_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1097ui_story.fillRatio = var_150_10
				end
			end

			if arg_147_1.time_ >= var_150_7 + var_150_8 and arg_147_1.time_ < var_150_7 + var_150_8 + arg_150_0 and arg_147_1.var_.characterEffect1097ui_story then
				local var_150_11 = 0.5

				arg_147_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1097ui_story.fillRatio = var_150_11
			end

			local var_150_12 = 0
			local var_150_13 = 0.3

			if var_150_12 < arg_147_1.time_ and arg_147_1.time_ <= var_150_12 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_14 = arg_147_1:FormatText(StoryNameCfg[56].name)

				arg_147_1.leftNameTxt_.text = var_150_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_15 = arg_147_1:GetWordFromCfg(1109704037)
				local var_150_16 = arg_147_1:FormatText(var_150_15.content)

				arg_147_1.text_.text = var_150_16

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_17 = 12
				local var_150_18 = utf8.len(var_150_16)
				local var_150_19 = var_150_17 <= 0 and var_150_13 or var_150_13 * (var_150_18 / var_150_17)

				if var_150_19 > 0 and var_150_13 < var_150_19 then
					arg_147_1.talkMaxDuration = var_150_19

					if var_150_19 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_19 + var_150_12
					end
				end

				arg_147_1.text_.text = var_150_16
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704037", "story_v_side_new_1109704.awb") ~= 0 then
					local var_150_20 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704037", "story_v_side_new_1109704.awb") / 1000

					if var_150_20 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_20 + var_150_12
					end

					if var_150_15.prefab_name ~= "" and arg_147_1.actors_[var_150_15.prefab_name] ~= nil then
						local var_150_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_15.prefab_name].transform, "story_v_side_new_1109704", "1109704037", "story_v_side_new_1109704.awb")

						arg_147_1:RecordAudio("1109704037", var_150_21)
						arg_147_1:RecordAudio("1109704037", var_150_21)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704037", "story_v_side_new_1109704.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704037", "story_v_side_new_1109704.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_22 = math.max(var_150_13, arg_147_1.talkMaxDuration)

			if var_150_12 <= arg_147_1.time_ and arg_147_1.time_ < var_150_12 + var_150_22 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_12) / var_150_22

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_12 + var_150_22 and arg_147_1.time_ < var_150_12 + var_150_22 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 1109704038
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play1109704039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1027ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1027ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(0, 100, 0)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1027ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(0, 100, 0)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["1027ui_story"]
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 and arg_151_1.var_.characterEffect1027ui_story == nil then
				arg_151_1.var_.characterEffect1027ui_story = var_154_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_11 = 0.200000002980232

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11

				if arg_151_1.var_.characterEffect1027ui_story then
					local var_154_13 = Mathf.Lerp(0, 0.5, var_154_12)

					arg_151_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1027ui_story.fillRatio = var_154_13
				end
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 and arg_151_1.var_.characterEffect1027ui_story then
				local var_154_14 = 0.5

				arg_151_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1027ui_story.fillRatio = var_154_14
			end

			local var_154_15 = arg_151_1.actors_["1097ui_story"].transform
			local var_154_16 = 0

			if var_154_16 < arg_151_1.time_ and arg_151_1.time_ <= var_154_16 + arg_154_0 then
				arg_151_1.var_.moveOldPos1097ui_story = var_154_15.localPosition
			end

			local var_154_17 = 0.001

			if var_154_16 <= arg_151_1.time_ and arg_151_1.time_ < var_154_16 + var_154_17 then
				local var_154_18 = (arg_151_1.time_ - var_154_16) / var_154_17
				local var_154_19 = Vector3.New(0, 100, 0)

				var_154_15.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1097ui_story, var_154_19, var_154_18)

				local var_154_20 = manager.ui.mainCamera.transform.position - var_154_15.position

				var_154_15.forward = Vector3.New(var_154_20.x, var_154_20.y, var_154_20.z)

				local var_154_21 = var_154_15.localEulerAngles

				var_154_21.z = 0
				var_154_21.x = 0
				var_154_15.localEulerAngles = var_154_21
			end

			if arg_151_1.time_ >= var_154_16 + var_154_17 and arg_151_1.time_ < var_154_16 + var_154_17 + arg_154_0 then
				var_154_15.localPosition = Vector3.New(0, 100, 0)

				local var_154_22 = manager.ui.mainCamera.transform.position - var_154_15.position

				var_154_15.forward = Vector3.New(var_154_22.x, var_154_22.y, var_154_22.z)

				local var_154_23 = var_154_15.localEulerAngles

				var_154_23.z = 0
				var_154_23.x = 0
				var_154_15.localEulerAngles = var_154_23
			end

			local var_154_24 = arg_151_1.actors_["1097ui_story"]
			local var_154_25 = 0

			if var_154_25 < arg_151_1.time_ and arg_151_1.time_ <= var_154_25 + arg_154_0 and arg_151_1.var_.characterEffect1097ui_story == nil then
				arg_151_1.var_.characterEffect1097ui_story = var_154_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_26 = 0.200000002980232

			if var_154_25 <= arg_151_1.time_ and arg_151_1.time_ < var_154_25 + var_154_26 then
				local var_154_27 = (arg_151_1.time_ - var_154_25) / var_154_26

				if arg_151_1.var_.characterEffect1097ui_story then
					local var_154_28 = Mathf.Lerp(0, 0.5, var_154_27)

					arg_151_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1097ui_story.fillRatio = var_154_28
				end
			end

			if arg_151_1.time_ >= var_154_25 + var_154_26 and arg_151_1.time_ < var_154_25 + var_154_26 + arg_154_0 and arg_151_1.var_.characterEffect1097ui_story then
				local var_154_29 = 0.5

				arg_151_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1097ui_story.fillRatio = var_154_29
			end

			local var_154_30 = 0
			local var_154_31 = 0.9

			if var_154_30 < arg_151_1.time_ and arg_151_1.time_ <= var_154_30 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_32 = arg_151_1:GetWordFromCfg(1109704038)
				local var_154_33 = arg_151_1:FormatText(var_154_32.content)

				arg_151_1.text_.text = var_154_33

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_34 = 29
				local var_154_35 = utf8.len(var_154_33)
				local var_154_36 = var_154_34 <= 0 and var_154_31 or var_154_31 * (var_154_35 / var_154_34)

				if var_154_36 > 0 and var_154_31 < var_154_36 then
					arg_151_1.talkMaxDuration = var_154_36

					if var_154_36 + var_154_30 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_36 + var_154_30
					end
				end

				arg_151_1.text_.text = var_154_33
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_37 = math.max(var_154_31, arg_151_1.talkMaxDuration)

			if var_154_30 <= arg_151_1.time_ and arg_151_1.time_ < var_154_30 + var_154_37 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_30) / var_154_37

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_30 + var_154_37 and arg_151_1.time_ < var_154_30 + var_154_37 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 1109704039
		arg_155_1.duration_ = 7.6

		local var_155_0 = {
			zh = 7.6,
			ja = 7.1
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
				arg_155_0:Play1109704040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1097ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1097ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(0, -0.54, -6.3)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1097ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = arg_155_1.actors_["1097ui_story"]
			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 and arg_155_1.var_.characterEffect1097ui_story == nil then
				arg_155_1.var_.characterEffect1097ui_story = var_158_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_11 = 0.200000002980232

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_11 then
				local var_158_12 = (arg_155_1.time_ - var_158_10) / var_158_11

				if arg_155_1.var_.characterEffect1097ui_story then
					arg_155_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_10 + var_158_11 and arg_155_1.time_ < var_158_10 + var_158_11 + arg_158_0 and arg_155_1.var_.characterEffect1097ui_story then
				arg_155_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_158_13 = 0

			if var_158_13 < arg_155_1.time_ and arg_155_1.time_ <= var_158_13 + arg_158_0 then
				arg_155_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				arg_155_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_158_15 = 0
			local var_158_16 = 0.95

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_17 = arg_155_1:FormatText(StoryNameCfg[216].name)

				arg_155_1.leftNameTxt_.text = var_158_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_18 = arg_155_1:GetWordFromCfg(1109704039)
				local var_158_19 = arg_155_1:FormatText(var_158_18.content)

				arg_155_1.text_.text = var_158_19

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_20 = 38
				local var_158_21 = utf8.len(var_158_19)
				local var_158_22 = var_158_20 <= 0 and var_158_16 or var_158_16 * (var_158_21 / var_158_20)

				if var_158_22 > 0 and var_158_16 < var_158_22 then
					arg_155_1.talkMaxDuration = var_158_22

					if var_158_22 + var_158_15 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_22 + var_158_15
					end
				end

				arg_155_1.text_.text = var_158_19
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704039", "story_v_side_new_1109704.awb") ~= 0 then
					local var_158_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704039", "story_v_side_new_1109704.awb") / 1000

					if var_158_23 + var_158_15 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_23 + var_158_15
					end

					if var_158_18.prefab_name ~= "" and arg_155_1.actors_[var_158_18.prefab_name] ~= nil then
						local var_158_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_18.prefab_name].transform, "story_v_side_new_1109704", "1109704039", "story_v_side_new_1109704.awb")

						arg_155_1:RecordAudio("1109704039", var_158_24)
						arg_155_1:RecordAudio("1109704039", var_158_24)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704039", "story_v_side_new_1109704.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704039", "story_v_side_new_1109704.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_25 = math.max(var_158_16, arg_155_1.talkMaxDuration)

			if var_158_15 <= arg_155_1.time_ and arg_155_1.time_ < var_158_15 + var_158_25 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_15) / var_158_25

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_15 + var_158_25 and arg_155_1.time_ < var_158_15 + var_158_25 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 1109704040
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play1109704041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1097ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1097ui_story == nil then
				arg_159_1.var_.characterEffect1097ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.200000002980232

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1097ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1097ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1097ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1097ui_story.fillRatio = var_162_5
			end

			local var_162_6 = 0
			local var_162_7 = 0.225

			if var_162_6 < arg_159_1.time_ and arg_159_1.time_ <= var_162_6 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_8 = arg_159_1:FormatText(StoryNameCfg[7].name)

				arg_159_1.leftNameTxt_.text = var_162_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_9 = arg_159_1:GetWordFromCfg(1109704040)
				local var_162_10 = arg_159_1:FormatText(var_162_9.content)

				arg_159_1.text_.text = var_162_10

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_11 = 9
				local var_162_12 = utf8.len(var_162_10)
				local var_162_13 = var_162_11 <= 0 and var_162_7 or var_162_7 * (var_162_12 / var_162_11)

				if var_162_13 > 0 and var_162_7 < var_162_13 then
					arg_159_1.talkMaxDuration = var_162_13

					if var_162_13 + var_162_6 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_13 + var_162_6
					end
				end

				arg_159_1.text_.text = var_162_10
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_14 = math.max(var_162_7, arg_159_1.talkMaxDuration)

			if var_162_6 <= arg_159_1.time_ and arg_159_1.time_ < var_162_6 + var_162_14 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_6) / var_162_14

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_6 + var_162_14 and arg_159_1.time_ < var_162_6 + var_162_14 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 1109704041
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play1109704042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1.025

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

				local var_166_2 = arg_163_1:GetWordFromCfg(1109704041)
				local var_166_3 = arg_163_1:FormatText(var_166_2.content)

				arg_163_1.text_.text = var_166_3

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_4 = 41
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
	Play1109704042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 1109704042
		arg_167_1.duration_ = 3.7

		local var_167_0 = {
			zh = 3.7,
			ja = 3.533
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
				arg_167_0:Play1109704043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1097ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1097ui_story == nil then
				arg_167_1.var_.characterEffect1097ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1097ui_story then
					arg_167_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1097ui_story then
				arg_167_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_170_4 = 0

			if var_170_4 < arg_167_1.time_ and arg_167_1.time_ <= var_170_4 + arg_170_0 then
				arg_167_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_170_5 = 0

			if var_170_5 < arg_167_1.time_ and arg_167_1.time_ <= var_170_5 + arg_170_0 then
				arg_167_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_170_6 = 0
			local var_170_7 = 0.65

			if var_170_6 < arg_167_1.time_ and arg_167_1.time_ <= var_170_6 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_8 = arg_167_1:FormatText(StoryNameCfg[216].name)

				arg_167_1.leftNameTxt_.text = var_170_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_9 = arg_167_1:GetWordFromCfg(1109704042)
				local var_170_10 = arg_167_1:FormatText(var_170_9.content)

				arg_167_1.text_.text = var_170_10

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_11 = 26
				local var_170_12 = utf8.len(var_170_10)
				local var_170_13 = var_170_11 <= 0 and var_170_7 or var_170_7 * (var_170_12 / var_170_11)

				if var_170_13 > 0 and var_170_7 < var_170_13 then
					arg_167_1.talkMaxDuration = var_170_13

					if var_170_13 + var_170_6 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_13 + var_170_6
					end
				end

				arg_167_1.text_.text = var_170_10
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704042", "story_v_side_new_1109704.awb") ~= 0 then
					local var_170_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704042", "story_v_side_new_1109704.awb") / 1000

					if var_170_14 + var_170_6 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_14 + var_170_6
					end

					if var_170_9.prefab_name ~= "" and arg_167_1.actors_[var_170_9.prefab_name] ~= nil then
						local var_170_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_9.prefab_name].transform, "story_v_side_new_1109704", "1109704042", "story_v_side_new_1109704.awb")

						arg_167_1:RecordAudio("1109704042", var_170_15)
						arg_167_1:RecordAudio("1109704042", var_170_15)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704042", "story_v_side_new_1109704.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704042", "story_v_side_new_1109704.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_16 = math.max(var_170_7, arg_167_1.talkMaxDuration)

			if var_170_6 <= arg_167_1.time_ and arg_167_1.time_ < var_170_6 + var_170_16 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_6) / var_170_16

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_6 + var_170_16 and arg_167_1.time_ < var_170_6 + var_170_16 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 1109704043
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play1109704044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1097ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect1097ui_story == nil then
				arg_171_1.var_.characterEffect1097ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.200000002980232

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect1097ui_story then
					local var_174_4 = Mathf.Lerp(0, 0.5, var_174_3)

					arg_171_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1097ui_story.fillRatio = var_174_4
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect1097ui_story then
				local var_174_5 = 0.5

				arg_171_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1097ui_story.fillRatio = var_174_5
			end

			local var_174_6 = 0
			local var_174_7 = 0.4

			if var_174_6 < arg_171_1.time_ and arg_171_1.time_ <= var_174_6 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_8 = arg_171_1:FormatText(StoryNameCfg[7].name)

				arg_171_1.leftNameTxt_.text = var_174_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_9 = arg_171_1:GetWordFromCfg(1109704043)
				local var_174_10 = arg_171_1:FormatText(var_174_9.content)

				arg_171_1.text_.text = var_174_10

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_11 = 16
				local var_174_12 = utf8.len(var_174_10)
				local var_174_13 = var_174_11 <= 0 and var_174_7 or var_174_7 * (var_174_12 / var_174_11)

				if var_174_13 > 0 and var_174_7 < var_174_13 then
					arg_171_1.talkMaxDuration = var_174_13

					if var_174_13 + var_174_6 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_13 + var_174_6
					end
				end

				arg_171_1.text_.text = var_174_10
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_14 = math.max(var_174_7, arg_171_1.talkMaxDuration)

			if var_174_6 <= arg_171_1.time_ and arg_171_1.time_ < var_174_6 + var_174_14 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_6) / var_174_14

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_6 + var_174_14 and arg_171_1.time_ < var_174_6 + var_174_14 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 1109704044
		arg_175_1.duration_ = 5.133

		local var_175_0 = {
			zh = 4.433,
			ja = 5.133
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
				arg_175_0:Play1109704045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1097ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1097ui_story == nil then
				arg_175_1.var_.characterEffect1097ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1097ui_story then
					arg_175_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1097ui_story then
				arg_175_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_178_4 = 0

			if var_178_4 < arg_175_1.time_ and arg_175_1.time_ <= var_178_4 + arg_178_0 then
				arg_175_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_178_5 = 0

			if var_178_5 < arg_175_1.time_ and arg_175_1.time_ <= var_178_5 + arg_178_0 then
				arg_175_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_178_6 = 0
			local var_178_7 = 0.475

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_8 = arg_175_1:FormatText(StoryNameCfg[216].name)

				arg_175_1.leftNameTxt_.text = var_178_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_9 = arg_175_1:GetWordFromCfg(1109704044)
				local var_178_10 = arg_175_1:FormatText(var_178_9.content)

				arg_175_1.text_.text = var_178_10

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_11 = 19
				local var_178_12 = utf8.len(var_178_10)
				local var_178_13 = var_178_11 <= 0 and var_178_7 or var_178_7 * (var_178_12 / var_178_11)

				if var_178_13 > 0 and var_178_7 < var_178_13 then
					arg_175_1.talkMaxDuration = var_178_13

					if var_178_13 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_13 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_10
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704044", "story_v_side_new_1109704.awb") ~= 0 then
					local var_178_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704044", "story_v_side_new_1109704.awb") / 1000

					if var_178_14 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_14 + var_178_6
					end

					if var_178_9.prefab_name ~= "" and arg_175_1.actors_[var_178_9.prefab_name] ~= nil then
						local var_178_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_9.prefab_name].transform, "story_v_side_new_1109704", "1109704044", "story_v_side_new_1109704.awb")

						arg_175_1:RecordAudio("1109704044", var_178_15)
						arg_175_1:RecordAudio("1109704044", var_178_15)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704044", "story_v_side_new_1109704.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704044", "story_v_side_new_1109704.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_16 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_16 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_16

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_16 and arg_175_1.time_ < var_178_6 + var_178_16 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 1109704045
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play1109704046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1097ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1097ui_story == nil then
				arg_179_1.var_.characterEffect1097ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1097ui_story then
					local var_182_4 = Mathf.Lerp(0, 0.5, var_182_3)

					arg_179_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1097ui_story.fillRatio = var_182_4
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1097ui_story then
				local var_182_5 = 0.5

				arg_179_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1097ui_story.fillRatio = var_182_5
			end

			local var_182_6 = 0
			local var_182_7 = 1.05

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_8 = arg_179_1:FormatText(StoryNameCfg[7].name)

				arg_179_1.leftNameTxt_.text = var_182_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_9 = arg_179_1:GetWordFromCfg(1109704045)
				local var_182_10 = arg_179_1:FormatText(var_182_9.content)

				arg_179_1.text_.text = var_182_10

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_11 = 42
				local var_182_12 = utf8.len(var_182_10)
				local var_182_13 = var_182_11 <= 0 and var_182_7 or var_182_7 * (var_182_12 / var_182_11)

				if var_182_13 > 0 and var_182_7 < var_182_13 then
					arg_179_1.talkMaxDuration = var_182_13

					if var_182_13 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_13 + var_182_6
					end
				end

				arg_179_1.text_.text = var_182_10
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_14 = math.max(var_182_7, arg_179_1.talkMaxDuration)

			if var_182_6 <= arg_179_1.time_ and arg_179_1.time_ < var_182_6 + var_182_14 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_6) / var_182_14

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_6 + var_182_14 and arg_179_1.time_ < var_182_6 + var_182_14 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 1109704046
		arg_183_1.duration_ = 9.966

		local var_183_0 = {
			zh = 2.766,
			ja = 9.966
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
				arg_183_0:Play1109704047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1097ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1097ui_story == nil then
				arg_183_1.var_.characterEffect1097ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1097ui_story then
					arg_183_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1097ui_story then
				arg_183_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_186_4 = 0

			if var_186_4 < arg_183_1.time_ and arg_183_1.time_ <= var_186_4 + arg_186_0 then
				arg_183_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_186_5 = 0

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 then
				arg_183_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_186_6 = 0
			local var_186_7 = 0.3

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_8 = arg_183_1:FormatText(StoryNameCfg[216].name)

				arg_183_1.leftNameTxt_.text = var_186_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_9 = arg_183_1:GetWordFromCfg(1109704046)
				local var_186_10 = arg_183_1:FormatText(var_186_9.content)

				arg_183_1.text_.text = var_186_10

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_11 = 12
				local var_186_12 = utf8.len(var_186_10)
				local var_186_13 = var_186_11 <= 0 and var_186_7 or var_186_7 * (var_186_12 / var_186_11)

				if var_186_13 > 0 and var_186_7 < var_186_13 then
					arg_183_1.talkMaxDuration = var_186_13

					if var_186_13 + var_186_6 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_13 + var_186_6
					end
				end

				arg_183_1.text_.text = var_186_10
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704046", "story_v_side_new_1109704.awb") ~= 0 then
					local var_186_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704046", "story_v_side_new_1109704.awb") / 1000

					if var_186_14 + var_186_6 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_14 + var_186_6
					end

					if var_186_9.prefab_name ~= "" and arg_183_1.actors_[var_186_9.prefab_name] ~= nil then
						local var_186_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_9.prefab_name].transform, "story_v_side_new_1109704", "1109704046", "story_v_side_new_1109704.awb")

						arg_183_1:RecordAudio("1109704046", var_186_15)
						arg_183_1:RecordAudio("1109704046", var_186_15)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704046", "story_v_side_new_1109704.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704046", "story_v_side_new_1109704.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_16 = math.max(var_186_7, arg_183_1.talkMaxDuration)

			if var_186_6 <= arg_183_1.time_ and arg_183_1.time_ < var_186_6 + var_186_16 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_6) / var_186_16

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_6 + var_186_16 and arg_183_1.time_ < var_186_6 + var_186_16 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 1109704047
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play1109704048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1097ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1097ui_story == nil then
				arg_187_1.var_.characterEffect1097ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.200000002980232

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1097ui_story then
					local var_190_4 = Mathf.Lerp(0, 0.5, var_190_3)

					arg_187_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1097ui_story.fillRatio = var_190_4
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1097ui_story then
				local var_190_5 = 0.5

				arg_187_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1097ui_story.fillRatio = var_190_5
			end

			local var_190_6 = 0
			local var_190_7 = 0.9

			if var_190_6 < arg_187_1.time_ and arg_187_1.time_ <= var_190_6 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_8 = arg_187_1:GetWordFromCfg(1109704047)
				local var_190_9 = arg_187_1:FormatText(var_190_8.content)

				arg_187_1.text_.text = var_190_9

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_10 = 36
				local var_190_11 = utf8.len(var_190_9)
				local var_190_12 = var_190_10 <= 0 and var_190_7 or var_190_7 * (var_190_11 / var_190_10)

				if var_190_12 > 0 and var_190_7 < var_190_12 then
					arg_187_1.talkMaxDuration = var_190_12

					if var_190_12 + var_190_6 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_12 + var_190_6
					end
				end

				arg_187_1.text_.text = var_190_9
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_13 = math.max(var_190_7, arg_187_1.talkMaxDuration)

			if var_190_6 <= arg_187_1.time_ and arg_187_1.time_ < var_190_6 + var_190_13 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_6) / var_190_13

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_6 + var_190_13 and arg_187_1.time_ < var_190_6 + var_190_13 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 1109704048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play1109704049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.725

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(1109704048)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 29
				local var_194_6 = utf8.len(var_194_4)
				local var_194_7 = var_194_5 <= 0 and var_194_1 or var_194_1 * (var_194_6 / var_194_5)

				if var_194_7 > 0 and var_194_1 < var_194_7 then
					arg_191_1.talkMaxDuration = var_194_7

					if var_194_7 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_7 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_4
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_8 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_8 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_8

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_8 and arg_191_1.time_ < var_194_0 + var_194_8 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 1109704049
		arg_195_1.duration_ = 4.033

		local var_195_0 = {
			zh = 4.033,
			ja = 4
		}
		local var_195_1 = manager.audio:GetLocalizationFlag()

		if var_195_0[var_195_1] ~= nil then
			arg_195_1.duration_ = var_195_0[var_195_1]
		end

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play1109704050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1097ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1097ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(0, -0.54, -6.3)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1097ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = arg_195_1.actors_["1097ui_story"]
			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 and arg_195_1.var_.characterEffect1097ui_story == nil then
				arg_195_1.var_.characterEffect1097ui_story = var_198_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_11 = 0.200000002980232

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_10) / var_198_11

				if arg_195_1.var_.characterEffect1097ui_story then
					arg_195_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 and arg_195_1.var_.characterEffect1097ui_story then
				arg_195_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_198_13 = 0

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_2")
			end

			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 then
				arg_195_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_198_15 = 0
			local var_198_16 = 0.3

			if var_198_15 < arg_195_1.time_ and arg_195_1.time_ <= var_198_15 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_17 = arg_195_1:FormatText(StoryNameCfg[216].name)

				arg_195_1.leftNameTxt_.text = var_198_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_18 = arg_195_1:GetWordFromCfg(1109704049)
				local var_198_19 = arg_195_1:FormatText(var_198_18.content)

				arg_195_1.text_.text = var_198_19

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_20 = 12
				local var_198_21 = utf8.len(var_198_19)
				local var_198_22 = var_198_20 <= 0 and var_198_16 or var_198_16 * (var_198_21 / var_198_20)

				if var_198_22 > 0 and var_198_16 < var_198_22 then
					arg_195_1.talkMaxDuration = var_198_22

					if var_198_22 + var_198_15 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_22 + var_198_15
					end
				end

				arg_195_1.text_.text = var_198_19
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704049", "story_v_side_new_1109704.awb") ~= 0 then
					local var_198_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704049", "story_v_side_new_1109704.awb") / 1000

					if var_198_23 + var_198_15 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_23 + var_198_15
					end

					if var_198_18.prefab_name ~= "" and arg_195_1.actors_[var_198_18.prefab_name] ~= nil then
						local var_198_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_18.prefab_name].transform, "story_v_side_new_1109704", "1109704049", "story_v_side_new_1109704.awb")

						arg_195_1:RecordAudio("1109704049", var_198_24)
						arg_195_1:RecordAudio("1109704049", var_198_24)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704049", "story_v_side_new_1109704.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704049", "story_v_side_new_1109704.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_25 = math.max(var_198_16, arg_195_1.talkMaxDuration)

			if var_198_15 <= arg_195_1.time_ and arg_195_1.time_ < var_198_15 + var_198_25 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_15) / var_198_25

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_15 + var_198_25 and arg_195_1.time_ < var_198_15 + var_198_25 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 1109704050
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play1109704051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1097ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect1097ui_story == nil then
				arg_199_1.var_.characterEffect1097ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.200000002980232

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect1097ui_story then
					local var_202_4 = Mathf.Lerp(0, 0.5, var_202_3)

					arg_199_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1097ui_story.fillRatio = var_202_4
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect1097ui_story then
				local var_202_5 = 0.5

				arg_199_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1097ui_story.fillRatio = var_202_5
			end

			local var_202_6 = 0
			local var_202_7 = 0.625

			if var_202_6 < arg_199_1.time_ and arg_199_1.time_ <= var_202_6 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_8 = arg_199_1:GetWordFromCfg(1109704050)
				local var_202_9 = arg_199_1:FormatText(var_202_8.content)

				arg_199_1.text_.text = var_202_9

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_10 = 25
				local var_202_11 = utf8.len(var_202_9)
				local var_202_12 = var_202_10 <= 0 and var_202_7 or var_202_7 * (var_202_11 / var_202_10)

				if var_202_12 > 0 and var_202_7 < var_202_12 then
					arg_199_1.talkMaxDuration = var_202_12

					if var_202_12 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_12 + var_202_6
					end
				end

				arg_199_1.text_.text = var_202_9
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_13 = math.max(var_202_7, arg_199_1.talkMaxDuration)

			if var_202_6 <= arg_199_1.time_ and arg_199_1.time_ < var_202_6 + var_202_13 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_6) / var_202_13

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_6 + var_202_13 and arg_199_1.time_ < var_202_6 + var_202_13 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 1109704051
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play1109704052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.55

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

				local var_206_2 = arg_203_1:GetWordFromCfg(1109704051)
				local var_206_3 = arg_203_1:FormatText(var_206_2.content)

				arg_203_1.text_.text = var_206_3

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_4 = 22
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
	Play1109704052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 1109704052
		arg_207_1.duration_ = 7.133

		local var_207_0 = {
			zh = 2.933,
			ja = 7.133
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
				arg_207_0:Play1109704053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1097ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1097ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1097ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["1027ui_story"].transform
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 then
				arg_207_1.var_.moveOldPos1027ui_story = var_210_9.localPosition
			end

			local var_210_11 = 0.001

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11
				local var_210_13 = Vector3.New(0.7, -0.81, -5.8)

				var_210_9.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1027ui_story, var_210_13, var_210_12)

				local var_210_14 = manager.ui.mainCamera.transform.position - var_210_9.position

				var_210_9.forward = Vector3.New(var_210_14.x, var_210_14.y, var_210_14.z)

				local var_210_15 = var_210_9.localEulerAngles

				var_210_15.z = 0
				var_210_15.x = 0
				var_210_9.localEulerAngles = var_210_15
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 then
				var_210_9.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_210_16 = manager.ui.mainCamera.transform.position - var_210_9.position

				var_210_9.forward = Vector3.New(var_210_16.x, var_210_16.y, var_210_16.z)

				local var_210_17 = var_210_9.localEulerAngles

				var_210_17.z = 0
				var_210_17.x = 0
				var_210_9.localEulerAngles = var_210_17
			end

			local var_210_18 = arg_207_1.actors_["1027ui_story"]
			local var_210_19 = 0

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 and arg_207_1.var_.characterEffect1027ui_story == nil then
				arg_207_1.var_.characterEffect1027ui_story = var_210_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_20 = 0.200000002980232

			if var_210_19 <= arg_207_1.time_ and arg_207_1.time_ < var_210_19 + var_210_20 then
				local var_210_21 = (arg_207_1.time_ - var_210_19) / var_210_20

				if arg_207_1.var_.characterEffect1027ui_story then
					arg_207_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_19 + var_210_20 and arg_207_1.time_ < var_210_19 + var_210_20 + arg_210_0 and arg_207_1.var_.characterEffect1027ui_story then
				arg_207_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_210_22 = 0

			if var_210_22 < arg_207_1.time_ and arg_207_1.time_ <= var_210_22 + arg_210_0 then
				arg_207_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action1_1")
			end

			local var_210_23 = 0

			if var_210_23 < arg_207_1.time_ and arg_207_1.time_ <= var_210_23 + arg_210_0 then
				arg_207_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_210_24 = 0
			local var_210_25 = 0.375

			if var_210_24 < arg_207_1.time_ and arg_207_1.time_ <= var_210_24 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_26 = arg_207_1:FormatText(StoryNameCfg[56].name)

				arg_207_1.leftNameTxt_.text = var_210_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_27 = arg_207_1:GetWordFromCfg(1109704052)
				local var_210_28 = arg_207_1:FormatText(var_210_27.content)

				arg_207_1.text_.text = var_210_28

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_29 = 15
				local var_210_30 = utf8.len(var_210_28)
				local var_210_31 = var_210_29 <= 0 and var_210_25 or var_210_25 * (var_210_30 / var_210_29)

				if var_210_31 > 0 and var_210_25 < var_210_31 then
					arg_207_1.talkMaxDuration = var_210_31

					if var_210_31 + var_210_24 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_31 + var_210_24
					end
				end

				arg_207_1.text_.text = var_210_28
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704052", "story_v_side_new_1109704.awb") ~= 0 then
					local var_210_32 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704052", "story_v_side_new_1109704.awb") / 1000

					if var_210_32 + var_210_24 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_32 + var_210_24
					end

					if var_210_27.prefab_name ~= "" and arg_207_1.actors_[var_210_27.prefab_name] ~= nil then
						local var_210_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_27.prefab_name].transform, "story_v_side_new_1109704", "1109704052", "story_v_side_new_1109704.awb")

						arg_207_1:RecordAudio("1109704052", var_210_33)
						arg_207_1:RecordAudio("1109704052", var_210_33)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704052", "story_v_side_new_1109704.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704052", "story_v_side_new_1109704.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_34 = math.max(var_210_25, arg_207_1.talkMaxDuration)

			if var_210_24 <= arg_207_1.time_ and arg_207_1.time_ < var_210_24 + var_210_34 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_24) / var_210_34

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_24 + var_210_34 and arg_207_1.time_ < var_210_24 + var_210_34 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 1109704053
		arg_211_1.duration_ = 6.2

		local var_211_0 = {
			zh = 3.7,
			ja = 6.2
		}
		local var_211_1 = manager.audio:GetLocalizationFlag()

		if var_211_0[var_211_1] ~= nil then
			arg_211_1.duration_ = var_211_0[var_211_1]
		end

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play1109704054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1097ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect1097ui_story == nil then
				arg_211_1.var_.characterEffect1097ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect1097ui_story then
					arg_211_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1097ui_story then
				arg_211_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_214_4 = 0

			if var_214_4 < arg_211_1.time_ and arg_211_1.time_ <= var_214_4 + arg_214_0 then
				arg_211_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_214_5 = 0

			if var_214_5 < arg_211_1.time_ and arg_211_1.time_ <= var_214_5 + arg_214_0 then
				arg_211_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_214_6 = arg_211_1.actors_["1027ui_story"]
			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 and arg_211_1.var_.characterEffect1027ui_story == nil then
				arg_211_1.var_.characterEffect1027ui_story = var_214_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_8 = 0.200000002980232

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_8 then
				local var_214_9 = (arg_211_1.time_ - var_214_7) / var_214_8

				if arg_211_1.var_.characterEffect1027ui_story then
					local var_214_10 = Mathf.Lerp(0, 0.5, var_214_9)

					arg_211_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1027ui_story.fillRatio = var_214_10
				end
			end

			if arg_211_1.time_ >= var_214_7 + var_214_8 and arg_211_1.time_ < var_214_7 + var_214_8 + arg_214_0 and arg_211_1.var_.characterEffect1027ui_story then
				local var_214_11 = 0.5

				arg_211_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1027ui_story.fillRatio = var_214_11
			end

			local var_214_12 = 0
			local var_214_13 = 0.425

			if var_214_12 < arg_211_1.time_ and arg_211_1.time_ <= var_214_12 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_14 = arg_211_1:FormatText(StoryNameCfg[216].name)

				arg_211_1.leftNameTxt_.text = var_214_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_15 = arg_211_1:GetWordFromCfg(1109704053)
				local var_214_16 = arg_211_1:FormatText(var_214_15.content)

				arg_211_1.text_.text = var_214_16

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_17 = 17
				local var_214_18 = utf8.len(var_214_16)
				local var_214_19 = var_214_17 <= 0 and var_214_13 or var_214_13 * (var_214_18 / var_214_17)

				if var_214_19 > 0 and var_214_13 < var_214_19 then
					arg_211_1.talkMaxDuration = var_214_19

					if var_214_19 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_12
					end
				end

				arg_211_1.text_.text = var_214_16
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704053", "story_v_side_new_1109704.awb") ~= 0 then
					local var_214_20 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704053", "story_v_side_new_1109704.awb") / 1000

					if var_214_20 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_20 + var_214_12
					end

					if var_214_15.prefab_name ~= "" and arg_211_1.actors_[var_214_15.prefab_name] ~= nil then
						local var_214_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_15.prefab_name].transform, "story_v_side_new_1109704", "1109704053", "story_v_side_new_1109704.awb")

						arg_211_1:RecordAudio("1109704053", var_214_21)
						arg_211_1:RecordAudio("1109704053", var_214_21)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704053", "story_v_side_new_1109704.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704053", "story_v_side_new_1109704.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_22 = math.max(var_214_13, arg_211_1.talkMaxDuration)

			if var_214_12 <= arg_211_1.time_ and arg_211_1.time_ < var_214_12 + var_214_22 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_12) / var_214_22

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_12 + var_214_22 and arg_211_1.time_ < var_214_12 + var_214_22 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 1109704054
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play1109704055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1097ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1097ui_story == nil then
				arg_215_1.var_.characterEffect1097ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.200000002980232

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1097ui_story then
					local var_218_4 = Mathf.Lerp(0, 0.5, var_218_3)

					arg_215_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1097ui_story.fillRatio = var_218_4
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1097ui_story then
				local var_218_5 = 0.5

				arg_215_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1097ui_story.fillRatio = var_218_5
			end

			local var_218_6 = 0
			local var_218_7 = 0.375

			if var_218_6 < arg_215_1.time_ and arg_215_1.time_ <= var_218_6 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_8 = arg_215_1:FormatText(StoryNameCfg[7].name)

				arg_215_1.leftNameTxt_.text = var_218_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_9 = arg_215_1:GetWordFromCfg(1109704054)
				local var_218_10 = arg_215_1:FormatText(var_218_9.content)

				arg_215_1.text_.text = var_218_10

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_11 = 15
				local var_218_12 = utf8.len(var_218_10)
				local var_218_13 = var_218_11 <= 0 and var_218_7 or var_218_7 * (var_218_12 / var_218_11)

				if var_218_13 > 0 and var_218_7 < var_218_13 then
					arg_215_1.talkMaxDuration = var_218_13

					if var_218_13 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_13 + var_218_6
					end
				end

				arg_215_1.text_.text = var_218_10
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_14 = math.max(var_218_7, arg_215_1.talkMaxDuration)

			if var_218_6 <= arg_215_1.time_ and arg_215_1.time_ < var_218_6 + var_218_14 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_6) / var_218_14

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_6 + var_218_14 and arg_215_1.time_ < var_218_6 + var_218_14 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 1109704055
		arg_219_1.duration_ = 4.8

		local var_219_0 = {
			zh = 4.8,
			ja = 4.633
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
				arg_219_0:Play1109704056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1027ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1027ui_story == nil then
				arg_219_1.var_.characterEffect1027ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.200000002980232

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1027ui_story then
					arg_219_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1027ui_story then
				arg_219_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_222_4 = 0

			if var_222_4 < arg_219_1.time_ and arg_219_1.time_ <= var_222_4 + arg_222_0 then
				arg_219_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_222_5 = 0

			if var_222_5 < arg_219_1.time_ and arg_219_1.time_ <= var_222_5 + arg_222_0 then
				arg_219_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_222_6 = 0
			local var_222_7 = 0.525

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_8 = arg_219_1:FormatText(StoryNameCfg[56].name)

				arg_219_1.leftNameTxt_.text = var_222_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_9 = arg_219_1:GetWordFromCfg(1109704055)
				local var_222_10 = arg_219_1:FormatText(var_222_9.content)

				arg_219_1.text_.text = var_222_10

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_11 = 21
				local var_222_12 = utf8.len(var_222_10)
				local var_222_13 = var_222_11 <= 0 and var_222_7 or var_222_7 * (var_222_12 / var_222_11)

				if var_222_13 > 0 and var_222_7 < var_222_13 then
					arg_219_1.talkMaxDuration = var_222_13

					if var_222_13 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_13 + var_222_6
					end
				end

				arg_219_1.text_.text = var_222_10
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704055", "story_v_side_new_1109704.awb") ~= 0 then
					local var_222_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704055", "story_v_side_new_1109704.awb") / 1000

					if var_222_14 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_14 + var_222_6
					end

					if var_222_9.prefab_name ~= "" and arg_219_1.actors_[var_222_9.prefab_name] ~= nil then
						local var_222_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_9.prefab_name].transform, "story_v_side_new_1109704", "1109704055", "story_v_side_new_1109704.awb")

						arg_219_1:RecordAudio("1109704055", var_222_15)
						arg_219_1:RecordAudio("1109704055", var_222_15)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704055", "story_v_side_new_1109704.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704055", "story_v_side_new_1109704.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_16 = math.max(var_222_7, arg_219_1.talkMaxDuration)

			if var_222_6 <= arg_219_1.time_ and arg_219_1.time_ < var_222_6 + var_222_16 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_6) / var_222_16

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_6 + var_222_16 and arg_219_1.time_ < var_222_6 + var_222_16 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 1109704056
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play1109704057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1027ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1027ui_story == nil then
				arg_223_1.var_.characterEffect1027ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1027ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1027ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1027ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1027ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0
			local var_226_7 = 0.3

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[7].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(1109704056)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 12
				local var_226_12 = utf8.len(var_226_10)
				local var_226_13 = var_226_11 <= 0 and var_226_7 or var_226_7 * (var_226_12 / var_226_11)

				if var_226_13 > 0 and var_226_7 < var_226_13 then
					arg_223_1.talkMaxDuration = var_226_13

					if var_226_13 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_13 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_10
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_14 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_14 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_14

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_14 and arg_223_1.time_ < var_226_6 + var_226_14 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 1109704057
		arg_227_1.duration_ = 1.999999999999

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play1109704058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1027ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1027ui_story == nil then
				arg_227_1.var_.characterEffect1027ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.200000002980232

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1027ui_story then
					arg_227_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1027ui_story then
				arg_227_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_230_4 = 0

			if var_230_4 < arg_227_1.time_ and arg_227_1.time_ <= var_230_4 + arg_230_0 then
				arg_227_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_2")
			end

			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 then
				arg_227_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_230_6 = 0
			local var_230_7 = 0.1

			if var_230_6 < arg_227_1.time_ and arg_227_1.time_ <= var_230_6 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_8 = arg_227_1:FormatText(StoryNameCfg[56].name)

				arg_227_1.leftNameTxt_.text = var_230_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_9 = arg_227_1:GetWordFromCfg(1109704057)
				local var_230_10 = arg_227_1:FormatText(var_230_9.content)

				arg_227_1.text_.text = var_230_10

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_11 = 4
				local var_230_12 = utf8.len(var_230_10)
				local var_230_13 = var_230_11 <= 0 and var_230_7 or var_230_7 * (var_230_12 / var_230_11)

				if var_230_13 > 0 and var_230_7 < var_230_13 then
					arg_227_1.talkMaxDuration = var_230_13

					if var_230_13 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_13 + var_230_6
					end
				end

				arg_227_1.text_.text = var_230_10
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704057", "story_v_side_new_1109704.awb") ~= 0 then
					local var_230_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704057", "story_v_side_new_1109704.awb") / 1000

					if var_230_14 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_14 + var_230_6
					end

					if var_230_9.prefab_name ~= "" and arg_227_1.actors_[var_230_9.prefab_name] ~= nil then
						local var_230_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_9.prefab_name].transform, "story_v_side_new_1109704", "1109704057", "story_v_side_new_1109704.awb")

						arg_227_1:RecordAudio("1109704057", var_230_15)
						arg_227_1:RecordAudio("1109704057", var_230_15)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704057", "story_v_side_new_1109704.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704057", "story_v_side_new_1109704.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_16 = math.max(var_230_7, arg_227_1.talkMaxDuration)

			if var_230_6 <= arg_227_1.time_ and arg_227_1.time_ < var_230_6 + var_230_16 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_6) / var_230_16

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_6 + var_230_16 and arg_227_1.time_ < var_230_6 + var_230_16 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 1109704058
		arg_231_1.duration_ = 6.933

		local var_231_0 = {
			zh = 5.7,
			ja = 6.933
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
				arg_231_0:Play1109704059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1097ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1097ui_story == nil then
				arg_231_1.var_.characterEffect1097ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1097ui_story then
					arg_231_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1097ui_story then
				arg_231_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_234_4 = 0

			if var_234_4 < arg_231_1.time_ and arg_231_1.time_ <= var_234_4 + arg_234_0 then
				arg_231_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_234_5 = 0

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 then
				arg_231_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_234_6 = arg_231_1.actors_["1027ui_story"]
			local var_234_7 = 0

			if var_234_7 < arg_231_1.time_ and arg_231_1.time_ <= var_234_7 + arg_234_0 and arg_231_1.var_.characterEffect1027ui_story == nil then
				arg_231_1.var_.characterEffect1027ui_story = var_234_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_8 = 0.200000002980232

			if var_234_7 <= arg_231_1.time_ and arg_231_1.time_ < var_234_7 + var_234_8 then
				local var_234_9 = (arg_231_1.time_ - var_234_7) / var_234_8

				if arg_231_1.var_.characterEffect1027ui_story then
					local var_234_10 = Mathf.Lerp(0, 0.5, var_234_9)

					arg_231_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1027ui_story.fillRatio = var_234_10
				end
			end

			if arg_231_1.time_ >= var_234_7 + var_234_8 and arg_231_1.time_ < var_234_7 + var_234_8 + arg_234_0 and arg_231_1.var_.characterEffect1027ui_story then
				local var_234_11 = 0.5

				arg_231_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1027ui_story.fillRatio = var_234_11
			end

			local var_234_12 = 0
			local var_234_13 = 0.775

			if var_234_12 < arg_231_1.time_ and arg_231_1.time_ <= var_234_12 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_14 = arg_231_1:FormatText(StoryNameCfg[216].name)

				arg_231_1.leftNameTxt_.text = var_234_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_15 = arg_231_1:GetWordFromCfg(1109704058)
				local var_234_16 = arg_231_1:FormatText(var_234_15.content)

				arg_231_1.text_.text = var_234_16

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_17 = 31
				local var_234_18 = utf8.len(var_234_16)
				local var_234_19 = var_234_17 <= 0 and var_234_13 or var_234_13 * (var_234_18 / var_234_17)

				if var_234_19 > 0 and var_234_13 < var_234_19 then
					arg_231_1.talkMaxDuration = var_234_19

					if var_234_19 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_19 + var_234_12
					end
				end

				arg_231_1.text_.text = var_234_16
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704058", "story_v_side_new_1109704.awb") ~= 0 then
					local var_234_20 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704058", "story_v_side_new_1109704.awb") / 1000

					if var_234_20 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_12
					end

					if var_234_15.prefab_name ~= "" and arg_231_1.actors_[var_234_15.prefab_name] ~= nil then
						local var_234_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_15.prefab_name].transform, "story_v_side_new_1109704", "1109704058", "story_v_side_new_1109704.awb")

						arg_231_1:RecordAudio("1109704058", var_234_21)
						arg_231_1:RecordAudio("1109704058", var_234_21)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704058", "story_v_side_new_1109704.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704058", "story_v_side_new_1109704.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_22 = math.max(var_234_13, arg_231_1.talkMaxDuration)

			if var_234_12 <= arg_231_1.time_ and arg_231_1.time_ < var_234_12 + var_234_22 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_12) / var_234_22

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_12 + var_234_22 and arg_231_1.time_ < var_234_12 + var_234_22 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 1109704059
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play1109704060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1097ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1097ui_story == nil then
				arg_235_1.var_.characterEffect1097ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.200000002980232

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1097ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1097ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1097ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1097ui_story.fillRatio = var_238_5
			end

			local var_238_6 = 0
			local var_238_7 = 0.55

			if var_238_6 < arg_235_1.time_ and arg_235_1.time_ <= var_238_6 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_8 = arg_235_1:FormatText(StoryNameCfg[7].name)

				arg_235_1.leftNameTxt_.text = var_238_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_9 = arg_235_1:GetWordFromCfg(1109704059)
				local var_238_10 = arg_235_1:FormatText(var_238_9.content)

				arg_235_1.text_.text = var_238_10

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_11 = 22
				local var_238_12 = utf8.len(var_238_10)
				local var_238_13 = var_238_11 <= 0 and var_238_7 or var_238_7 * (var_238_12 / var_238_11)

				if var_238_13 > 0 and var_238_7 < var_238_13 then
					arg_235_1.talkMaxDuration = var_238_13

					if var_238_13 + var_238_6 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_13 + var_238_6
					end
				end

				arg_235_1.text_.text = var_238_10
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_14 = math.max(var_238_7, arg_235_1.talkMaxDuration)

			if var_238_6 <= arg_235_1.time_ and arg_235_1.time_ < var_238_6 + var_238_14 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_6) / var_238_14

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_6 + var_238_14 and arg_235_1.time_ < var_238_6 + var_238_14 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 1109704060
		arg_239_1.duration_ = 5.1

		local var_239_0 = {
			zh = 3.5,
			ja = 5.1
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
				arg_239_0:Play1109704061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1097ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1097ui_story == nil then
				arg_239_1.var_.characterEffect1097ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.200000002980232

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1097ui_story then
					arg_239_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1097ui_story then
				arg_239_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_242_4 = 0

			if var_242_4 < arg_239_1.time_ and arg_239_1.time_ <= var_242_4 + arg_242_0 then
				arg_239_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_242_5 = 0

			if var_242_5 < arg_239_1.time_ and arg_239_1.time_ <= var_242_5 + arg_242_0 then
				arg_239_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_242_6 = 0
			local var_242_7 = 0.575

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_8 = arg_239_1:FormatText(StoryNameCfg[216].name)

				arg_239_1.leftNameTxt_.text = var_242_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_9 = arg_239_1:GetWordFromCfg(1109704060)
				local var_242_10 = arg_239_1:FormatText(var_242_9.content)

				arg_239_1.text_.text = var_242_10

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_11 = 23
				local var_242_12 = utf8.len(var_242_10)
				local var_242_13 = var_242_11 <= 0 and var_242_7 or var_242_7 * (var_242_12 / var_242_11)

				if var_242_13 > 0 and var_242_7 < var_242_13 then
					arg_239_1.talkMaxDuration = var_242_13

					if var_242_13 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_13 + var_242_6
					end
				end

				arg_239_1.text_.text = var_242_10
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704060", "story_v_side_new_1109704.awb") ~= 0 then
					local var_242_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704060", "story_v_side_new_1109704.awb") / 1000

					if var_242_14 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_14 + var_242_6
					end

					if var_242_9.prefab_name ~= "" and arg_239_1.actors_[var_242_9.prefab_name] ~= nil then
						local var_242_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_9.prefab_name].transform, "story_v_side_new_1109704", "1109704060", "story_v_side_new_1109704.awb")

						arg_239_1:RecordAudio("1109704060", var_242_15)
						arg_239_1:RecordAudio("1109704060", var_242_15)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704060", "story_v_side_new_1109704.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704060", "story_v_side_new_1109704.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_16 = math.max(var_242_7, arg_239_1.talkMaxDuration)

			if var_242_6 <= arg_239_1.time_ and arg_239_1.time_ < var_242_6 + var_242_16 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_6) / var_242_16

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_6 + var_242_16 and arg_239_1.time_ < var_242_6 + var_242_16 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 1109704061
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play1109704062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1097ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect1097ui_story == nil then
				arg_243_1.var_.characterEffect1097ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.200000002980232

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect1097ui_story then
					local var_246_4 = Mathf.Lerp(0, 0.5, var_246_3)

					arg_243_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1097ui_story.fillRatio = var_246_4
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect1097ui_story then
				local var_246_5 = 0.5

				arg_243_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1097ui_story.fillRatio = var_246_5
			end

			local var_246_6 = 0
			local var_246_7 = 0.7

			if var_246_6 < arg_243_1.time_ and arg_243_1.time_ <= var_246_6 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_8 = arg_243_1:FormatText(StoryNameCfg[7].name)

				arg_243_1.leftNameTxt_.text = var_246_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_9 = arg_243_1:GetWordFromCfg(1109704061)
				local var_246_10 = arg_243_1:FormatText(var_246_9.content)

				arg_243_1.text_.text = var_246_10

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_11 = 28
				local var_246_12 = utf8.len(var_246_10)
				local var_246_13 = var_246_11 <= 0 and var_246_7 or var_246_7 * (var_246_12 / var_246_11)

				if var_246_13 > 0 and var_246_7 < var_246_13 then
					arg_243_1.talkMaxDuration = var_246_13

					if var_246_13 + var_246_6 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_13 + var_246_6
					end
				end

				arg_243_1.text_.text = var_246_10
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_14 = math.max(var_246_7, arg_243_1.talkMaxDuration)

			if var_246_6 <= arg_243_1.time_ and arg_243_1.time_ < var_246_6 + var_246_14 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_6) / var_246_14

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_6 + var_246_14 and arg_243_1.time_ < var_246_6 + var_246_14 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 1109704062
		arg_247_1.duration_ = 2.833

		local var_247_0 = {
			zh = 1.999999999999,
			ja = 2.833
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
				arg_247_0:Play1109704063(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1097ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1097ui_story == nil then
				arg_247_1.var_.characterEffect1097ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.200000002980232

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1097ui_story then
					arg_247_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1097ui_story then
				arg_247_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_250_4 = 0

			if var_250_4 < arg_247_1.time_ and arg_247_1.time_ <= var_250_4 + arg_250_0 then
				arg_247_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_250_5 = 0

			if var_250_5 < arg_247_1.time_ and arg_247_1.time_ <= var_250_5 + arg_250_0 then
				arg_247_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_250_6 = 0
			local var_250_7 = 0.1

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_8 = arg_247_1:FormatText(StoryNameCfg[216].name)

				arg_247_1.leftNameTxt_.text = var_250_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_9 = arg_247_1:GetWordFromCfg(1109704062)
				local var_250_10 = arg_247_1:FormatText(var_250_9.content)

				arg_247_1.text_.text = var_250_10

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_11 = 4
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704062", "story_v_side_new_1109704.awb") ~= 0 then
					local var_250_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704062", "story_v_side_new_1109704.awb") / 1000

					if var_250_14 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_14 + var_250_6
					end

					if var_250_9.prefab_name ~= "" and arg_247_1.actors_[var_250_9.prefab_name] ~= nil then
						local var_250_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_9.prefab_name].transform, "story_v_side_new_1109704", "1109704062", "story_v_side_new_1109704.awb")

						arg_247_1:RecordAudio("1109704062", var_250_15)
						arg_247_1:RecordAudio("1109704062", var_250_15)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704062", "story_v_side_new_1109704.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704062", "story_v_side_new_1109704.awb")
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
	Play1109704063 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 1109704063
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play1109704064(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1097ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect1097ui_story == nil then
				arg_251_1.var_.characterEffect1097ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.200000002980232

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect1097ui_story then
					local var_254_4 = Mathf.Lerp(0, 0.5, var_254_3)

					arg_251_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1097ui_story.fillRatio = var_254_4
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect1097ui_story then
				local var_254_5 = 0.5

				arg_251_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1097ui_story.fillRatio = var_254_5
			end

			local var_254_6 = 0
			local var_254_7 = 0.95

			if var_254_6 < arg_251_1.time_ and arg_251_1.time_ <= var_254_6 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_8 = arg_251_1:GetWordFromCfg(1109704063)
				local var_254_9 = arg_251_1:FormatText(var_254_8.content)

				arg_251_1.text_.text = var_254_9

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_10 = 38
				local var_254_11 = utf8.len(var_254_9)
				local var_254_12 = var_254_10 <= 0 and var_254_7 or var_254_7 * (var_254_11 / var_254_10)

				if var_254_12 > 0 and var_254_7 < var_254_12 then
					arg_251_1.talkMaxDuration = var_254_12

					if var_254_12 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_12 + var_254_6
					end
				end

				arg_251_1.text_.text = var_254_9
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_13 = math.max(var_254_7, arg_251_1.talkMaxDuration)

			if var_254_6 <= arg_251_1.time_ and arg_251_1.time_ < var_254_6 + var_254_13 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_6) / var_254_13

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_6 + var_254_13 and arg_251_1.time_ < var_254_6 + var_254_13 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704064 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 1109704064
		arg_255_1.duration_ = 7

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play1109704065(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = "STwhite"

			if arg_255_1.bgs_[var_258_0] == nil then
				local var_258_1 = Object.Instantiate(arg_255_1.paintGo_)

				var_258_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_258_0)
				var_258_1.name = var_258_0
				var_258_1.transform.parent = arg_255_1.stage_.transform
				var_258_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_255_1.bgs_[var_258_0] = var_258_1
			end

			local var_258_2 = 0

			if var_258_2 < arg_255_1.time_ and arg_255_1.time_ <= var_258_2 + arg_258_0 then
				local var_258_3 = manager.ui.mainCamera.transform.localPosition
				local var_258_4 = Vector3.New(0, 0, 10) + Vector3.New(var_258_3.x, var_258_3.y, 0)
				local var_258_5 = arg_255_1.bgs_.STwhite

				var_258_5.transform.localPosition = var_258_4
				var_258_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_258_6 = var_258_5:GetComponent("SpriteRenderer")

				if var_258_6 and var_258_6.sprite then
					local var_258_7 = (var_258_5.transform.localPosition - var_258_3).z
					local var_258_8 = manager.ui.mainCameraCom_
					local var_258_9 = 2 * var_258_7 * Mathf.Tan(var_258_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_258_10 = var_258_9 * var_258_8.aspect
					local var_258_11 = var_258_6.sprite.bounds.size.x
					local var_258_12 = var_258_6.sprite.bounds.size.y
					local var_258_13 = var_258_10 / var_258_11
					local var_258_14 = var_258_9 / var_258_12
					local var_258_15 = var_258_14 < var_258_13 and var_258_13 or var_258_14

					var_258_5.transform.localScale = Vector3.New(var_258_15, var_258_15, 0)
				end

				for iter_258_0, iter_258_1 in pairs(arg_255_1.bgs_) do
					if iter_258_0 ~= "STwhite" then
						iter_258_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_258_16 = 2

			if var_258_16 < arg_255_1.time_ and arg_255_1.time_ <= var_258_16 + arg_258_0 then
				arg_255_1.allBtn_.enabled = false
			end

			local var_258_17 = 0.3

			if arg_255_1.time_ >= var_258_16 + var_258_17 and arg_255_1.time_ < var_258_16 + var_258_17 + arg_258_0 then
				arg_255_1.allBtn_.enabled = true
			end

			local var_258_18 = 0

			if var_258_18 < arg_255_1.time_ and arg_255_1.time_ <= var_258_18 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_19 = 2

			if var_258_18 <= arg_255_1.time_ and arg_255_1.time_ < var_258_18 + var_258_19 then
				local var_258_20 = (arg_255_1.time_ - var_258_18) / var_258_19
				local var_258_21 = Color.New(1, 1, 1)

				var_258_21.a = Mathf.Lerp(1, 0, var_258_20)
				arg_255_1.mask_.color = var_258_21
			end

			if arg_255_1.time_ >= var_258_18 + var_258_19 and arg_255_1.time_ < var_258_18 + var_258_19 + arg_258_0 then
				local var_258_22 = Color.New(1, 1, 1)
				local var_258_23 = 0

				arg_255_1.mask_.enabled = false
				var_258_22.a = var_258_23
				arg_255_1.mask_.color = var_258_22
			end

			local var_258_24 = arg_255_1.actors_["1097ui_story"].transform
			local var_258_25 = 0

			if var_258_25 < arg_255_1.time_ and arg_255_1.time_ <= var_258_25 + arg_258_0 then
				arg_255_1.var_.moveOldPos1097ui_story = var_258_24.localPosition
			end

			local var_258_26 = 0.001

			if var_258_25 <= arg_255_1.time_ and arg_255_1.time_ < var_258_25 + var_258_26 then
				local var_258_27 = (arg_255_1.time_ - var_258_25) / var_258_26
				local var_258_28 = Vector3.New(0, 100, 0)

				var_258_24.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1097ui_story, var_258_28, var_258_27)

				local var_258_29 = manager.ui.mainCamera.transform.position - var_258_24.position

				var_258_24.forward = Vector3.New(var_258_29.x, var_258_29.y, var_258_29.z)

				local var_258_30 = var_258_24.localEulerAngles

				var_258_30.z = 0
				var_258_30.x = 0
				var_258_24.localEulerAngles = var_258_30
			end

			if arg_255_1.time_ >= var_258_25 + var_258_26 and arg_255_1.time_ < var_258_25 + var_258_26 + arg_258_0 then
				var_258_24.localPosition = Vector3.New(0, 100, 0)

				local var_258_31 = manager.ui.mainCamera.transform.position - var_258_24.position

				var_258_24.forward = Vector3.New(var_258_31.x, var_258_31.y, var_258_31.z)

				local var_258_32 = var_258_24.localEulerAngles

				var_258_32.z = 0
				var_258_32.x = 0
				var_258_24.localEulerAngles = var_258_32
			end

			local var_258_33 = arg_255_1.actors_["1097ui_story"]
			local var_258_34 = 0

			if var_258_34 < arg_255_1.time_ and arg_255_1.time_ <= var_258_34 + arg_258_0 and arg_255_1.var_.characterEffect1097ui_story == nil then
				arg_255_1.var_.characterEffect1097ui_story = var_258_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_35 = 0.034000001847744

			if var_258_34 <= arg_255_1.time_ and arg_255_1.time_ < var_258_34 + var_258_35 then
				local var_258_36 = (arg_255_1.time_ - var_258_34) / var_258_35

				if arg_255_1.var_.characterEffect1097ui_story then
					local var_258_37 = Mathf.Lerp(0, 0.5, var_258_36)

					arg_255_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1097ui_story.fillRatio = var_258_37
				end
			end

			if arg_255_1.time_ >= var_258_34 + var_258_35 and arg_255_1.time_ < var_258_34 + var_258_35 + arg_258_0 and arg_255_1.var_.characterEffect1097ui_story then
				local var_258_38 = 0.5

				arg_255_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1097ui_story.fillRatio = var_258_38
			end

			local var_258_39 = arg_255_1.actors_["1027ui_story"].transform
			local var_258_40 = 0

			if var_258_40 < arg_255_1.time_ and arg_255_1.time_ <= var_258_40 + arg_258_0 then
				arg_255_1.var_.moveOldPos1027ui_story = var_258_39.localPosition
			end

			local var_258_41 = 0.001

			if var_258_40 <= arg_255_1.time_ and arg_255_1.time_ < var_258_40 + var_258_41 then
				local var_258_42 = (arg_255_1.time_ - var_258_40) / var_258_41
				local var_258_43 = Vector3.New(0, 100, 0)

				var_258_39.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1027ui_story, var_258_43, var_258_42)

				local var_258_44 = manager.ui.mainCamera.transform.position - var_258_39.position

				var_258_39.forward = Vector3.New(var_258_44.x, var_258_44.y, var_258_44.z)

				local var_258_45 = var_258_39.localEulerAngles

				var_258_45.z = 0
				var_258_45.x = 0
				var_258_39.localEulerAngles = var_258_45
			end

			if arg_255_1.time_ >= var_258_40 + var_258_41 and arg_255_1.time_ < var_258_40 + var_258_41 + arg_258_0 then
				var_258_39.localPosition = Vector3.New(0, 100, 0)

				local var_258_46 = manager.ui.mainCamera.transform.position - var_258_39.position

				var_258_39.forward = Vector3.New(var_258_46.x, var_258_46.y, var_258_46.z)

				local var_258_47 = var_258_39.localEulerAngles

				var_258_47.z = 0
				var_258_47.x = 0
				var_258_39.localEulerAngles = var_258_47
			end

			if arg_255_1.frameCnt_ <= 1 then
				arg_255_1.dialog_:SetActive(false)
			end

			local var_258_48 = 2
			local var_258_49 = 0.875

			if var_258_48 < arg_255_1.time_ and arg_255_1.time_ <= var_258_48 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0

				arg_255_1.dialog_:SetActive(true)

				local var_258_50 = LeanTween.value(arg_255_1.dialog_, 0, 1, 0.3)

				var_258_50:setOnUpdate(LuaHelper.FloatAction(function(arg_259_0)
					arg_255_1.dialogCg_.alpha = arg_259_0
				end))
				var_258_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_255_1.dialog_)
					var_258_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_255_1.duration_ = arg_255_1.duration_ + 0.3

				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_51 = arg_255_1:GetWordFromCfg(1109704064)
				local var_258_52 = arg_255_1:FormatText(var_258_51.content)

				arg_255_1.text_.text = var_258_52

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_53 = 35
				local var_258_54 = utf8.len(var_258_52)
				local var_258_55 = var_258_53 <= 0 and var_258_49 or var_258_49 * (var_258_54 / var_258_53)

				if var_258_55 > 0 and var_258_49 < var_258_55 then
					arg_255_1.talkMaxDuration = var_258_55
					var_258_48 = var_258_48 + 0.3

					if var_258_55 + var_258_48 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_55 + var_258_48
					end
				end

				arg_255_1.text_.text = var_258_52
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_56 = var_258_48 + 0.3
			local var_258_57 = math.max(var_258_49, arg_255_1.talkMaxDuration)

			if var_258_56 <= arg_255_1.time_ and arg_255_1.time_ < var_258_56 + var_258_57 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_56) / var_258_57

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_56 + var_258_57 and arg_255_1.time_ < var_258_56 + var_258_57 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 1109704065
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play1109704066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 1.35

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_2 = arg_261_1:GetWordFromCfg(1109704065)
				local var_264_3 = arg_261_1:FormatText(var_264_2.content)

				arg_261_1.text_.text = var_264_3

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_4 = 54
				local var_264_5 = utf8.len(var_264_3)
				local var_264_6 = var_264_4 <= 0 and var_264_1 or var_264_1 * (var_264_5 / var_264_4)

				if var_264_6 > 0 and var_264_1 < var_264_6 then
					arg_261_1.talkMaxDuration = var_264_6

					if var_264_6 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_6 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_3
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_7 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_7 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_7

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_7 and arg_261_1.time_ < var_264_0 + var_264_7 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 1109704066
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play1109704067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 1.175

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, false)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_2 = arg_265_1:GetWordFromCfg(1109704066)
				local var_268_3 = arg_265_1:FormatText(var_268_2.content)

				arg_265_1.text_.text = var_268_3

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_4 = 47
				local var_268_5 = utf8.len(var_268_3)
				local var_268_6 = var_268_4 <= 0 and var_268_1 or var_268_1 * (var_268_5 / var_268_4)

				if var_268_6 > 0 and var_268_1 < var_268_6 then
					arg_265_1.talkMaxDuration = var_268_6

					if var_268_6 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_6 + var_268_0
					end
				end

				arg_265_1.text_.text = var_268_3
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_7 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_7 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_7

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_7 and arg_265_1.time_ < var_268_0 + var_268_7 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 1109704067
		arg_269_1.duration_ = 8.4

		local var_269_0 = {
			zh = 6.133,
			ja = 8.4
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
				arg_269_0:Play1109704068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.6

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[56].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, true)
				arg_269_1.iconController_:SetSelectedState("hero")

				arg_269_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1027")

				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(1109704067)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704067", "story_v_side_new_1109704.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704067", "story_v_side_new_1109704.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_side_new_1109704", "1109704067", "story_v_side_new_1109704.awb")

						arg_269_1:RecordAudio("1109704067", var_272_9)
						arg_269_1:RecordAudio("1109704067", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704067", "story_v_side_new_1109704.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704067", "story_v_side_new_1109704.awb")
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
	Play1109704068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 1109704068
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play1109704069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 1.175

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

				local var_276_2 = arg_273_1:GetWordFromCfg(1109704068)
				local var_276_3 = arg_273_1:FormatText(var_276_2.content)

				arg_273_1.text_.text = var_276_3

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_4 = 47
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
	Play1109704069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 1109704069
		arg_277_1.duration_ = 9

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play1109704070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = "ST60"

			if arg_277_1.bgs_[var_280_0] == nil then
				local var_280_1 = Object.Instantiate(arg_277_1.paintGo_)

				var_280_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_280_0)
				var_280_1.name = var_280_0
				var_280_1.transform.parent = arg_277_1.stage_.transform
				var_280_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_277_1.bgs_[var_280_0] = var_280_1
			end

			local var_280_2 = 1.999999999999

			if var_280_2 < arg_277_1.time_ and arg_277_1.time_ <= var_280_2 + arg_280_0 then
				local var_280_3 = manager.ui.mainCamera.transform.localPosition
				local var_280_4 = Vector3.New(0, 0, 10) + Vector3.New(var_280_3.x, var_280_3.y, 0)
				local var_280_5 = arg_277_1.bgs_.ST60

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
					if iter_280_0 ~= "ST60" then
						iter_280_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_280_16 = 3.999999999999

			if var_280_16 < arg_277_1.time_ and arg_277_1.time_ <= var_280_16 + arg_280_0 then
				arg_277_1.allBtn_.enabled = false
			end

			local var_280_17 = 0.3

			if arg_277_1.time_ >= var_280_16 + var_280_17 and arg_277_1.time_ < var_280_16 + var_280_17 + arg_280_0 then
				arg_277_1.allBtn_.enabled = true
			end

			local var_280_18 = 0

			if var_280_18 < arg_277_1.time_ and arg_277_1.time_ <= var_280_18 + arg_280_0 then
				arg_277_1.mask_.enabled = true
				arg_277_1.mask_.raycastTarget = true

				arg_277_1:SetGaussion(false)
			end

			local var_280_19 = 2

			if var_280_18 <= arg_277_1.time_ and arg_277_1.time_ < var_280_18 + var_280_19 then
				local var_280_20 = (arg_277_1.time_ - var_280_18) / var_280_19
				local var_280_21 = Color.New(1, 1, 1)

				var_280_21.a = Mathf.Lerp(0, 1, var_280_20)
				arg_277_1.mask_.color = var_280_21
			end

			if arg_277_1.time_ >= var_280_18 + var_280_19 and arg_277_1.time_ < var_280_18 + var_280_19 + arg_280_0 then
				local var_280_22 = Color.New(1, 1, 1)

				var_280_22.a = 1
				arg_277_1.mask_.color = var_280_22
			end

			local var_280_23 = 2

			if var_280_23 < arg_277_1.time_ and arg_277_1.time_ <= var_280_23 + arg_280_0 then
				arg_277_1.mask_.enabled = true
				arg_277_1.mask_.raycastTarget = true

				arg_277_1:SetGaussion(false)
			end

			local var_280_24 = 2

			if var_280_23 <= arg_277_1.time_ and arg_277_1.time_ < var_280_23 + var_280_24 then
				local var_280_25 = (arg_277_1.time_ - var_280_23) / var_280_24
				local var_280_26 = Color.New(1, 1, 1)

				var_280_26.a = Mathf.Lerp(1, 0, var_280_25)
				arg_277_1.mask_.color = var_280_26
			end

			if arg_277_1.time_ >= var_280_23 + var_280_24 and arg_277_1.time_ < var_280_23 + var_280_24 + arg_280_0 then
				local var_280_27 = Color.New(1, 1, 1)
				local var_280_28 = 0

				arg_277_1.mask_.enabled = false
				var_280_27.a = var_280_28
				arg_277_1.mask_.color = var_280_27
			end

			if arg_277_1.frameCnt_ <= 1 then
				arg_277_1.dialog_:SetActive(false)
			end

			local var_280_29 = 4
			local var_280_30 = 0.325

			if var_280_29 < arg_277_1.time_ and arg_277_1.time_ <= var_280_29 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0

				arg_277_1.dialog_:SetActive(true)

				local var_280_31 = LeanTween.value(arg_277_1.dialog_, 0, 1, 0.3)

				var_280_31:setOnUpdate(LuaHelper.FloatAction(function(arg_281_0)
					arg_277_1.dialogCg_.alpha = arg_281_0
				end))
				var_280_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_277_1.dialog_)
					var_280_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_277_1.duration_ = arg_277_1.duration_ + 0.3

				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_32 = arg_277_1:FormatText(StoryNameCfg[7].name)

				arg_277_1.leftNameTxt_.text = var_280_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_33 = arg_277_1:GetWordFromCfg(1109704069)
				local var_280_34 = arg_277_1:FormatText(var_280_33.content)

				arg_277_1.text_.text = var_280_34

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_35 = 13
				local var_280_36 = utf8.len(var_280_34)
				local var_280_37 = var_280_35 <= 0 and var_280_30 or var_280_30 * (var_280_36 / var_280_35)

				if var_280_37 > 0 and var_280_30 < var_280_37 then
					arg_277_1.talkMaxDuration = var_280_37
					var_280_29 = var_280_29 + 0.3

					if var_280_37 + var_280_29 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_37 + var_280_29
					end
				end

				arg_277_1.text_.text = var_280_34
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_38 = var_280_29 + 0.3
			local var_280_39 = math.max(var_280_30, arg_277_1.talkMaxDuration)

			if var_280_38 <= arg_277_1.time_ and arg_277_1.time_ < var_280_38 + var_280_39 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_38) / var_280_39

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_38 + var_280_39 and arg_277_1.time_ < var_280_38 + var_280_39 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 1109704070
		arg_283_1.duration_ = 5.2

		local var_283_0 = {
			zh = 3.9,
			ja = 5.2
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
				arg_283_0:Play1109704071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1097ui_story"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos1097ui_story = var_286_0.localPosition
			end

			local var_286_2 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2
				local var_286_4 = Vector3.New(0, -0.54, -6.3)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1097ui_story, var_286_4, var_286_3)

				local var_286_5 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_5.x, var_286_5.y, var_286_5.z)

				local var_286_6 = var_286_0.localEulerAngles

				var_286_6.z = 0
				var_286_6.x = 0
				var_286_0.localEulerAngles = var_286_6
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_286_7 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_7.x, var_286_7.y, var_286_7.z)

				local var_286_8 = var_286_0.localEulerAngles

				var_286_8.z = 0
				var_286_8.x = 0
				var_286_0.localEulerAngles = var_286_8
			end

			local var_286_9 = arg_283_1.actors_["1097ui_story"]
			local var_286_10 = 0

			if var_286_10 < arg_283_1.time_ and arg_283_1.time_ <= var_286_10 + arg_286_0 and arg_283_1.var_.characterEffect1097ui_story == nil then
				arg_283_1.var_.characterEffect1097ui_story = var_286_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_11 = 0.200000002980232

			if var_286_10 <= arg_283_1.time_ and arg_283_1.time_ < var_286_10 + var_286_11 then
				local var_286_12 = (arg_283_1.time_ - var_286_10) / var_286_11

				if arg_283_1.var_.characterEffect1097ui_story then
					arg_283_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_10 + var_286_11 and arg_283_1.time_ < var_286_10 + var_286_11 + arg_286_0 and arg_283_1.var_.characterEffect1097ui_story then
				arg_283_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_286_13 = 0

			if var_286_13 < arg_283_1.time_ and arg_283_1.time_ <= var_286_13 + arg_286_0 then
				arg_283_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_286_14 = 0

			if var_286_14 < arg_283_1.time_ and arg_283_1.time_ <= var_286_14 + arg_286_0 then
				arg_283_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_286_15 = 0
			local var_286_16 = 0.3

			if var_286_15 < arg_283_1.time_ and arg_283_1.time_ <= var_286_15 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_17 = arg_283_1:FormatText(StoryNameCfg[216].name)

				arg_283_1.leftNameTxt_.text = var_286_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_18 = arg_283_1:GetWordFromCfg(1109704070)
				local var_286_19 = arg_283_1:FormatText(var_286_18.content)

				arg_283_1.text_.text = var_286_19

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_20 = 12
				local var_286_21 = utf8.len(var_286_19)
				local var_286_22 = var_286_20 <= 0 and var_286_16 or var_286_16 * (var_286_21 / var_286_20)

				if var_286_22 > 0 and var_286_16 < var_286_22 then
					arg_283_1.talkMaxDuration = var_286_22

					if var_286_22 + var_286_15 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_22 + var_286_15
					end
				end

				arg_283_1.text_.text = var_286_19
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704070", "story_v_side_new_1109704.awb") ~= 0 then
					local var_286_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704070", "story_v_side_new_1109704.awb") / 1000

					if var_286_23 + var_286_15 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_23 + var_286_15
					end

					if var_286_18.prefab_name ~= "" and arg_283_1.actors_[var_286_18.prefab_name] ~= nil then
						local var_286_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_18.prefab_name].transform, "story_v_side_new_1109704", "1109704070", "story_v_side_new_1109704.awb")

						arg_283_1:RecordAudio("1109704070", var_286_24)
						arg_283_1:RecordAudio("1109704070", var_286_24)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704070", "story_v_side_new_1109704.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704070", "story_v_side_new_1109704.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_25 = math.max(var_286_16, arg_283_1.talkMaxDuration)

			if var_286_15 <= arg_283_1.time_ and arg_283_1.time_ < var_286_15 + var_286_25 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_15) / var_286_25

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_15 + var_286_25 and arg_283_1.time_ < var_286_15 + var_286_25 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 1109704071
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play1109704072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1097ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1097ui_story == nil then
				arg_287_1.var_.characterEffect1097ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.200000002980232

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1097ui_story then
					local var_290_4 = Mathf.Lerp(0, 0.5, var_290_3)

					arg_287_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1097ui_story.fillRatio = var_290_4
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1097ui_story then
				local var_290_5 = 0.5

				arg_287_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1097ui_story.fillRatio = var_290_5
			end

			local var_290_6 = 0
			local var_290_7 = 0.85

			if var_290_6 < arg_287_1.time_ and arg_287_1.time_ <= var_290_6 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_8 = arg_287_1:FormatText(StoryNameCfg[7].name)

				arg_287_1.leftNameTxt_.text = var_290_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_9 = arg_287_1:GetWordFromCfg(1109704071)
				local var_290_10 = arg_287_1:FormatText(var_290_9.content)

				arg_287_1.text_.text = var_290_10

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_11 = 34
				local var_290_12 = utf8.len(var_290_10)
				local var_290_13 = var_290_11 <= 0 and var_290_7 or var_290_7 * (var_290_12 / var_290_11)

				if var_290_13 > 0 and var_290_7 < var_290_13 then
					arg_287_1.talkMaxDuration = var_290_13

					if var_290_13 + var_290_6 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_13 + var_290_6
					end
				end

				arg_287_1.text_.text = var_290_10
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_14 = math.max(var_290_7, arg_287_1.talkMaxDuration)

			if var_290_6 <= arg_287_1.time_ and arg_287_1.time_ < var_290_6 + var_290_14 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_6) / var_290_14

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_6 + var_290_14 and arg_287_1.time_ < var_290_6 + var_290_14 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 1109704072
		arg_291_1.duration_ = 6.433

		local var_291_0 = {
			zh = 4.2,
			ja = 6.433
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
				arg_291_0:Play1109704073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1097ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1097ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0, -0.54, -6.3)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1097ui_story, var_294_4, var_294_3)

				local var_294_5 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_5.x, var_294_5.y, var_294_5.z)

				local var_294_6 = var_294_0.localEulerAngles

				var_294_6.z = 0
				var_294_6.x = 0
				var_294_0.localEulerAngles = var_294_6
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_294_7 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_7.x, var_294_7.y, var_294_7.z)

				local var_294_8 = var_294_0.localEulerAngles

				var_294_8.z = 0
				var_294_8.x = 0
				var_294_0.localEulerAngles = var_294_8
			end

			local var_294_9 = arg_291_1.actors_["1097ui_story"]
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 and arg_291_1.var_.characterEffect1097ui_story == nil then
				arg_291_1.var_.characterEffect1097ui_story = var_294_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_11 = 0.200000002980232

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11

				if arg_291_1.var_.characterEffect1097ui_story then
					arg_291_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 and arg_291_1.var_.characterEffect1097ui_story then
				arg_291_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_294_13 = 0

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_294_14 = 0

			if var_294_14 < arg_291_1.time_ and arg_291_1.time_ <= var_294_14 + arg_294_0 then
				arg_291_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_294_15 = 0
			local var_294_16 = 0.3

			if var_294_15 < arg_291_1.time_ and arg_291_1.time_ <= var_294_15 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_17 = arg_291_1:FormatText(StoryNameCfg[216].name)

				arg_291_1.leftNameTxt_.text = var_294_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_18 = arg_291_1:GetWordFromCfg(1109704072)
				local var_294_19 = arg_291_1:FormatText(var_294_18.content)

				arg_291_1.text_.text = var_294_19

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_20 = 12
				local var_294_21 = utf8.len(var_294_19)
				local var_294_22 = var_294_20 <= 0 and var_294_16 or var_294_16 * (var_294_21 / var_294_20)

				if var_294_22 > 0 and var_294_16 < var_294_22 then
					arg_291_1.talkMaxDuration = var_294_22

					if var_294_22 + var_294_15 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_22 + var_294_15
					end
				end

				arg_291_1.text_.text = var_294_19
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704072", "story_v_side_new_1109704.awb") ~= 0 then
					local var_294_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704072", "story_v_side_new_1109704.awb") / 1000

					if var_294_23 + var_294_15 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_23 + var_294_15
					end

					if var_294_18.prefab_name ~= "" and arg_291_1.actors_[var_294_18.prefab_name] ~= nil then
						local var_294_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_18.prefab_name].transform, "story_v_side_new_1109704", "1109704072", "story_v_side_new_1109704.awb")

						arg_291_1:RecordAudio("1109704072", var_294_24)
						arg_291_1:RecordAudio("1109704072", var_294_24)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704072", "story_v_side_new_1109704.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704072", "story_v_side_new_1109704.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_25 = math.max(var_294_16, arg_291_1.talkMaxDuration)

			if var_294_15 <= arg_291_1.time_ and arg_291_1.time_ < var_294_15 + var_294_25 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_15) / var_294_25

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_15 + var_294_25 and arg_291_1.time_ < var_294_15 + var_294_25 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 1109704073
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play1109704074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1097ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1097ui_story == nil then
				arg_295_1.var_.characterEffect1097ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.200000002980232

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1097ui_story then
					local var_298_4 = Mathf.Lerp(0, 0.5, var_298_3)

					arg_295_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1097ui_story.fillRatio = var_298_4
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1097ui_story then
				local var_298_5 = 0.5

				arg_295_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1097ui_story.fillRatio = var_298_5
			end

			local var_298_6 = 0
			local var_298_7 = 0.725

			if var_298_6 < arg_295_1.time_ and arg_295_1.time_ <= var_298_6 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_8 = arg_295_1:FormatText(StoryNameCfg[7].name)

				arg_295_1.leftNameTxt_.text = var_298_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_9 = arg_295_1:GetWordFromCfg(1109704073)
				local var_298_10 = arg_295_1:FormatText(var_298_9.content)

				arg_295_1.text_.text = var_298_10

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_11 = 29
				local var_298_12 = utf8.len(var_298_10)
				local var_298_13 = var_298_11 <= 0 and var_298_7 or var_298_7 * (var_298_12 / var_298_11)

				if var_298_13 > 0 and var_298_7 < var_298_13 then
					arg_295_1.talkMaxDuration = var_298_13

					if var_298_13 + var_298_6 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_13 + var_298_6
					end
				end

				arg_295_1.text_.text = var_298_10
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_14 = math.max(var_298_7, arg_295_1.talkMaxDuration)

			if var_298_6 <= arg_295_1.time_ and arg_295_1.time_ < var_298_6 + var_298_14 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_6) / var_298_14

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_6 + var_298_14 and arg_295_1.time_ < var_298_6 + var_298_14 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 1109704074
		arg_299_1.duration_ = 4.066

		local var_299_0 = {
			zh = 4.066,
			ja = 2.933
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
				arg_299_0:Play1109704075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1097ui_story"].transform
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.var_.moveOldPos1097ui_story = var_302_0.localPosition
			end

			local var_302_2 = 0.001

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2
				local var_302_4 = Vector3.New(0, -0.54, -6.3)

				var_302_0.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1097ui_story, var_302_4, var_302_3)

				local var_302_5 = manager.ui.mainCamera.transform.position - var_302_0.position

				var_302_0.forward = Vector3.New(var_302_5.x, var_302_5.y, var_302_5.z)

				local var_302_6 = var_302_0.localEulerAngles

				var_302_6.z = 0
				var_302_6.x = 0
				var_302_0.localEulerAngles = var_302_6
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 then
				var_302_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_302_7 = manager.ui.mainCamera.transform.position - var_302_0.position

				var_302_0.forward = Vector3.New(var_302_7.x, var_302_7.y, var_302_7.z)

				local var_302_8 = var_302_0.localEulerAngles

				var_302_8.z = 0
				var_302_8.x = 0
				var_302_0.localEulerAngles = var_302_8
			end

			local var_302_9 = arg_299_1.actors_["1097ui_story"]
			local var_302_10 = 0

			if var_302_10 < arg_299_1.time_ and arg_299_1.time_ <= var_302_10 + arg_302_0 and arg_299_1.var_.characterEffect1097ui_story == nil then
				arg_299_1.var_.characterEffect1097ui_story = var_302_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_11 = 0.200000002980232

			if var_302_10 <= arg_299_1.time_ and arg_299_1.time_ < var_302_10 + var_302_11 then
				local var_302_12 = (arg_299_1.time_ - var_302_10) / var_302_11

				if arg_299_1.var_.characterEffect1097ui_story then
					arg_299_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_10 + var_302_11 and arg_299_1.time_ < var_302_10 + var_302_11 + arg_302_0 and arg_299_1.var_.characterEffect1097ui_story then
				arg_299_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_302_13 = 0

			if var_302_13 < arg_299_1.time_ and arg_299_1.time_ <= var_302_13 + arg_302_0 then
				arg_299_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_302_14 = 0

			if var_302_14 < arg_299_1.time_ and arg_299_1.time_ <= var_302_14 + arg_302_0 then
				arg_299_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_302_15 = 0
			local var_302_16 = 0.3

			if var_302_15 < arg_299_1.time_ and arg_299_1.time_ <= var_302_15 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_17 = arg_299_1:FormatText(StoryNameCfg[216].name)

				arg_299_1.leftNameTxt_.text = var_302_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_18 = arg_299_1:GetWordFromCfg(1109704074)
				local var_302_19 = arg_299_1:FormatText(var_302_18.content)

				arg_299_1.text_.text = var_302_19

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_20 = 12
				local var_302_21 = utf8.len(var_302_19)
				local var_302_22 = var_302_20 <= 0 and var_302_16 or var_302_16 * (var_302_21 / var_302_20)

				if var_302_22 > 0 and var_302_16 < var_302_22 then
					arg_299_1.talkMaxDuration = var_302_22

					if var_302_22 + var_302_15 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_22 + var_302_15
					end
				end

				arg_299_1.text_.text = var_302_19
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704074", "story_v_side_new_1109704.awb") ~= 0 then
					local var_302_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704074", "story_v_side_new_1109704.awb") / 1000

					if var_302_23 + var_302_15 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_23 + var_302_15
					end

					if var_302_18.prefab_name ~= "" and arg_299_1.actors_[var_302_18.prefab_name] ~= nil then
						local var_302_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_18.prefab_name].transform, "story_v_side_new_1109704", "1109704074", "story_v_side_new_1109704.awb")

						arg_299_1:RecordAudio("1109704074", var_302_24)
						arg_299_1:RecordAudio("1109704074", var_302_24)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704074", "story_v_side_new_1109704.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704074", "story_v_side_new_1109704.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_25 = math.max(var_302_16, arg_299_1.talkMaxDuration)

			if var_302_15 <= arg_299_1.time_ and arg_299_1.time_ < var_302_15 + var_302_25 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_15) / var_302_25

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_15 + var_302_25 and arg_299_1.time_ < var_302_15 + var_302_25 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 1109704075
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play1109704076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1097ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect1097ui_story == nil then
				arg_303_1.var_.characterEffect1097ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.200000002980232

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect1097ui_story then
					local var_306_4 = Mathf.Lerp(0, 0.5, var_306_3)

					arg_303_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1097ui_story.fillRatio = var_306_4
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect1097ui_story then
				local var_306_5 = 0.5

				arg_303_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1097ui_story.fillRatio = var_306_5
			end

			local var_306_6 = 0
			local var_306_7 = 0.825

			if var_306_6 < arg_303_1.time_ and arg_303_1.time_ <= var_306_6 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_8 = arg_303_1:FormatText(StoryNameCfg[7].name)

				arg_303_1.leftNameTxt_.text = var_306_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_9 = arg_303_1:GetWordFromCfg(1109704075)
				local var_306_10 = arg_303_1:FormatText(var_306_9.content)

				arg_303_1.text_.text = var_306_10

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_11 = 33
				local var_306_12 = utf8.len(var_306_10)
				local var_306_13 = var_306_11 <= 0 and var_306_7 or var_306_7 * (var_306_12 / var_306_11)

				if var_306_13 > 0 and var_306_7 < var_306_13 then
					arg_303_1.talkMaxDuration = var_306_13

					if var_306_13 + var_306_6 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_13 + var_306_6
					end
				end

				arg_303_1.text_.text = var_306_10
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_14 = math.max(var_306_7, arg_303_1.talkMaxDuration)

			if var_306_6 <= arg_303_1.time_ and arg_303_1.time_ < var_306_6 + var_306_14 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_6) / var_306_14

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_6 + var_306_14 and arg_303_1.time_ < var_306_6 + var_306_14 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 1109704076
		arg_307_1.duration_ = 1.999999999999

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play1109704077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1097ui_story"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos1097ui_story = var_310_0.localPosition
			end

			local var_310_2 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2
				local var_310_4 = Vector3.New(0, -0.54, -6.3)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1097ui_story, var_310_4, var_310_3)

				local var_310_5 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_5.x, var_310_5.y, var_310_5.z)

				local var_310_6 = var_310_0.localEulerAngles

				var_310_6.z = 0
				var_310_6.x = 0
				var_310_0.localEulerAngles = var_310_6
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_310_7 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_7.x, var_310_7.y, var_310_7.z)

				local var_310_8 = var_310_0.localEulerAngles

				var_310_8.z = 0
				var_310_8.x = 0
				var_310_0.localEulerAngles = var_310_8
			end

			local var_310_9 = arg_307_1.actors_["1097ui_story"]
			local var_310_10 = 0

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 and arg_307_1.var_.characterEffect1097ui_story == nil then
				arg_307_1.var_.characterEffect1097ui_story = var_310_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_11 = 0.200000002980232

			if var_310_10 <= arg_307_1.time_ and arg_307_1.time_ < var_310_10 + var_310_11 then
				local var_310_12 = (arg_307_1.time_ - var_310_10) / var_310_11

				if arg_307_1.var_.characterEffect1097ui_story then
					arg_307_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_10 + var_310_11 and arg_307_1.time_ < var_310_10 + var_310_11 + arg_310_0 and arg_307_1.var_.characterEffect1097ui_story then
				arg_307_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_310_13 = 0

			if var_310_13 < arg_307_1.time_ and arg_307_1.time_ <= var_310_13 + arg_310_0 then
				arg_307_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_310_14 = 0

			if var_310_14 < arg_307_1.time_ and arg_307_1.time_ <= var_310_14 + arg_310_0 then
				arg_307_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_310_15 = 0
			local var_310_16 = 0.05

			if var_310_15 < arg_307_1.time_ and arg_307_1.time_ <= var_310_15 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_17 = arg_307_1:FormatText(StoryNameCfg[216].name)

				arg_307_1.leftNameTxt_.text = var_310_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_18 = arg_307_1:GetWordFromCfg(1109704076)
				local var_310_19 = arg_307_1:FormatText(var_310_18.content)

				arg_307_1.text_.text = var_310_19

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_20 = 2
				local var_310_21 = utf8.len(var_310_19)
				local var_310_22 = var_310_20 <= 0 and var_310_16 or var_310_16 * (var_310_21 / var_310_20)

				if var_310_22 > 0 and var_310_16 < var_310_22 then
					arg_307_1.talkMaxDuration = var_310_22

					if var_310_22 + var_310_15 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_22 + var_310_15
					end
				end

				arg_307_1.text_.text = var_310_19
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704076", "story_v_side_new_1109704.awb") ~= 0 then
					local var_310_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704076", "story_v_side_new_1109704.awb") / 1000

					if var_310_23 + var_310_15 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_23 + var_310_15
					end

					if var_310_18.prefab_name ~= "" and arg_307_1.actors_[var_310_18.prefab_name] ~= nil then
						local var_310_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_18.prefab_name].transform, "story_v_side_new_1109704", "1109704076", "story_v_side_new_1109704.awb")

						arg_307_1:RecordAudio("1109704076", var_310_24)
						arg_307_1:RecordAudio("1109704076", var_310_24)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704076", "story_v_side_new_1109704.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704076", "story_v_side_new_1109704.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_25 = math.max(var_310_16, arg_307_1.talkMaxDuration)

			if var_310_15 <= arg_307_1.time_ and arg_307_1.time_ < var_310_15 + var_310_25 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_15) / var_310_25

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_15 + var_310_25 and arg_307_1.time_ < var_310_15 + var_310_25 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 1109704077
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play1109704078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1097ui_story"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 and arg_311_1.var_.characterEffect1097ui_story == nil then
				arg_311_1.var_.characterEffect1097ui_story = var_314_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_2 = 0.200000002980232

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2

				if arg_311_1.var_.characterEffect1097ui_story then
					local var_314_4 = Mathf.Lerp(0, 0.5, var_314_3)

					arg_311_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1097ui_story.fillRatio = var_314_4
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 and arg_311_1.var_.characterEffect1097ui_story then
				local var_314_5 = 0.5

				arg_311_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1097ui_story.fillRatio = var_314_5
			end

			local var_314_6 = 0
			local var_314_7 = 1.1

			if var_314_6 < arg_311_1.time_ and arg_311_1.time_ <= var_314_6 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_8 = arg_311_1:GetWordFromCfg(1109704077)
				local var_314_9 = arg_311_1:FormatText(var_314_8.content)

				arg_311_1.text_.text = var_314_9

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_10 = 44
				local var_314_11 = utf8.len(var_314_9)
				local var_314_12 = var_314_10 <= 0 and var_314_7 or var_314_7 * (var_314_11 / var_314_10)

				if var_314_12 > 0 and var_314_7 < var_314_12 then
					arg_311_1.talkMaxDuration = var_314_12

					if var_314_12 + var_314_6 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_12 + var_314_6
					end
				end

				arg_311_1.text_.text = var_314_9
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_13 = math.max(var_314_7, arg_311_1.talkMaxDuration)

			if var_314_6 <= arg_311_1.time_ and arg_311_1.time_ < var_314_6 + var_314_13 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_6) / var_314_13

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_6 + var_314_13 and arg_311_1.time_ < var_314_6 + var_314_13 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 1109704078
		arg_315_1.duration_ = 2.533

		local var_315_0 = {
			zh = 1.999999999999,
			ja = 2.533
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
				arg_315_0:Play1109704079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1097ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.characterEffect1097ui_story == nil then
				arg_315_1.var_.characterEffect1097ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.200000002980232

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect1097ui_story then
					arg_315_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect1097ui_story then
				arg_315_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_318_4 = 0

			if var_318_4 < arg_315_1.time_ and arg_315_1.time_ <= var_318_4 + arg_318_0 then
				arg_315_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_318_5 = 0

			if var_318_5 < arg_315_1.time_ and arg_315_1.time_ <= var_318_5 + arg_318_0 then
				arg_315_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_318_6 = 0
			local var_318_7 = 0.125

			if var_318_6 < arg_315_1.time_ and arg_315_1.time_ <= var_318_6 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_8 = arg_315_1:FormatText(StoryNameCfg[216].name)

				arg_315_1.leftNameTxt_.text = var_318_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_9 = arg_315_1:GetWordFromCfg(1109704078)
				local var_318_10 = arg_315_1:FormatText(var_318_9.content)

				arg_315_1.text_.text = var_318_10

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_11 = 5
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704078", "story_v_side_new_1109704.awb") ~= 0 then
					local var_318_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704078", "story_v_side_new_1109704.awb") / 1000

					if var_318_14 + var_318_6 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_14 + var_318_6
					end

					if var_318_9.prefab_name ~= "" and arg_315_1.actors_[var_318_9.prefab_name] ~= nil then
						local var_318_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_9.prefab_name].transform, "story_v_side_new_1109704", "1109704078", "story_v_side_new_1109704.awb")

						arg_315_1:RecordAudio("1109704078", var_318_15)
						arg_315_1:RecordAudio("1109704078", var_318_15)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704078", "story_v_side_new_1109704.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704078", "story_v_side_new_1109704.awb")
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
	Play1109704079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 1109704079
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play1109704080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1097ui_story"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.characterEffect1097ui_story == nil then
				arg_319_1.var_.characterEffect1097ui_story = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.200000002980232

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect1097ui_story then
					local var_322_4 = Mathf.Lerp(0, 0.5, var_322_3)

					arg_319_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1097ui_story.fillRatio = var_322_4
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1097ui_story then
				local var_322_5 = 0.5

				arg_319_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1097ui_story.fillRatio = var_322_5
			end

			local var_322_6 = 0
			local var_322_7 = 0.7

			if var_322_6 < arg_319_1.time_ and arg_319_1.time_ <= var_322_6 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_8 = arg_319_1:FormatText(StoryNameCfg[7].name)

				arg_319_1.leftNameTxt_.text = var_322_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_9 = arg_319_1:GetWordFromCfg(1109704079)
				local var_322_10 = arg_319_1:FormatText(var_322_9.content)

				arg_319_1.text_.text = var_322_10

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_11 = 28
				local var_322_12 = utf8.len(var_322_10)
				local var_322_13 = var_322_11 <= 0 and var_322_7 or var_322_7 * (var_322_12 / var_322_11)

				if var_322_13 > 0 and var_322_7 < var_322_13 then
					arg_319_1.talkMaxDuration = var_322_13

					if var_322_13 + var_322_6 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_13 + var_322_6
					end
				end

				arg_319_1.text_.text = var_322_10
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_14 = math.max(var_322_7, arg_319_1.talkMaxDuration)

			if var_322_6 <= arg_319_1.time_ and arg_319_1.time_ < var_322_6 + var_322_14 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_6) / var_322_14

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_6 + var_322_14 and arg_319_1.time_ < var_322_6 + var_322_14 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 1109704080
		arg_323_1.duration_ = 6.3

		local var_323_0 = {
			zh = 6.3,
			ja = 6.2
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
				arg_323_0:Play1109704081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1097ui_story"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos1097ui_story = var_326_0.localPosition
			end

			local var_326_2 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2
				local var_326_4 = Vector3.New(0, -0.54, -6.3)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1097ui_story, var_326_4, var_326_3)

				local var_326_5 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_5.x, var_326_5.y, var_326_5.z)

				local var_326_6 = var_326_0.localEulerAngles

				var_326_6.z = 0
				var_326_6.x = 0
				var_326_0.localEulerAngles = var_326_6
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_326_7 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_7.x, var_326_7.y, var_326_7.z)

				local var_326_8 = var_326_0.localEulerAngles

				var_326_8.z = 0
				var_326_8.x = 0
				var_326_0.localEulerAngles = var_326_8
			end

			local var_326_9 = arg_323_1.actors_["1097ui_story"]
			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 and arg_323_1.var_.characterEffect1097ui_story == nil then
				arg_323_1.var_.characterEffect1097ui_story = var_326_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_11 = 0.200000002980232

			if var_326_10 <= arg_323_1.time_ and arg_323_1.time_ < var_326_10 + var_326_11 then
				local var_326_12 = (arg_323_1.time_ - var_326_10) / var_326_11

				if arg_323_1.var_.characterEffect1097ui_story then
					arg_323_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_10 + var_326_11 and arg_323_1.time_ < var_326_10 + var_326_11 + arg_326_0 and arg_323_1.var_.characterEffect1097ui_story then
				arg_323_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_326_13 = 0

			if var_326_13 < arg_323_1.time_ and arg_323_1.time_ <= var_326_13 + arg_326_0 then
				arg_323_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_326_14 = 0

			if var_326_14 < arg_323_1.time_ and arg_323_1.time_ <= var_326_14 + arg_326_0 then
				arg_323_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_326_15 = 0
			local var_326_16 = 0.525

			if var_326_15 < arg_323_1.time_ and arg_323_1.time_ <= var_326_15 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_17 = arg_323_1:FormatText(StoryNameCfg[216].name)

				arg_323_1.leftNameTxt_.text = var_326_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_18 = arg_323_1:GetWordFromCfg(1109704080)
				local var_326_19 = arg_323_1:FormatText(var_326_18.content)

				arg_323_1.text_.text = var_326_19

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_20 = 21
				local var_326_21 = utf8.len(var_326_19)
				local var_326_22 = var_326_20 <= 0 and var_326_16 or var_326_16 * (var_326_21 / var_326_20)

				if var_326_22 > 0 and var_326_16 < var_326_22 then
					arg_323_1.talkMaxDuration = var_326_22

					if var_326_22 + var_326_15 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_22 + var_326_15
					end
				end

				arg_323_1.text_.text = var_326_19
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704080", "story_v_side_new_1109704.awb") ~= 0 then
					local var_326_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704080", "story_v_side_new_1109704.awb") / 1000

					if var_326_23 + var_326_15 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_23 + var_326_15
					end

					if var_326_18.prefab_name ~= "" and arg_323_1.actors_[var_326_18.prefab_name] ~= nil then
						local var_326_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_18.prefab_name].transform, "story_v_side_new_1109704", "1109704080", "story_v_side_new_1109704.awb")

						arg_323_1:RecordAudio("1109704080", var_326_24)
						arg_323_1:RecordAudio("1109704080", var_326_24)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704080", "story_v_side_new_1109704.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704080", "story_v_side_new_1109704.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_25 = math.max(var_326_16, arg_323_1.talkMaxDuration)

			if var_326_15 <= arg_323_1.time_ and arg_323_1.time_ < var_326_15 + var_326_25 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_15) / var_326_25

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_15 + var_326_25 and arg_323_1.time_ < var_326_15 + var_326_25 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 1109704081
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play1109704082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1097ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1097ui_story == nil then
				arg_327_1.var_.characterEffect1097ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1097ui_story then
					local var_330_4 = Mathf.Lerp(0, 0.5, var_330_3)

					arg_327_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_327_1.var_.characterEffect1097ui_story.fillRatio = var_330_4
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1097ui_story then
				local var_330_5 = 0.5

				arg_327_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_327_1.var_.characterEffect1097ui_story.fillRatio = var_330_5
			end

			local var_330_6 = 0
			local var_330_7 = 0.075

			if var_330_6 < arg_327_1.time_ and arg_327_1.time_ <= var_330_6 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_8 = arg_327_1:FormatText(StoryNameCfg[7].name)

				arg_327_1.leftNameTxt_.text = var_330_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_9 = arg_327_1:GetWordFromCfg(1109704081)
				local var_330_10 = arg_327_1:FormatText(var_330_9.content)

				arg_327_1.text_.text = var_330_10

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_11 = 3
				local var_330_12 = utf8.len(var_330_10)
				local var_330_13 = var_330_11 <= 0 and var_330_7 or var_330_7 * (var_330_12 / var_330_11)

				if var_330_13 > 0 and var_330_7 < var_330_13 then
					arg_327_1.talkMaxDuration = var_330_13

					if var_330_13 + var_330_6 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_13 + var_330_6
					end
				end

				arg_327_1.text_.text = var_330_10
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_14 = math.max(var_330_7, arg_327_1.talkMaxDuration)

			if var_330_6 <= arg_327_1.time_ and arg_327_1.time_ < var_330_6 + var_330_14 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_6) / var_330_14

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_6 + var_330_14 and arg_327_1.time_ < var_330_6 + var_330_14 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 1109704082
		arg_331_1.duration_ = 8.933

		local var_331_0 = {
			zh = 8.933,
			ja = 8.466
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
				arg_331_0:Play1109704083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1097ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1097ui_story == nil then
				arg_331_1.var_.characterEffect1097ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.200000002980232

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1097ui_story then
					arg_331_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1097ui_story then
				arg_331_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_334_4 = 0

			if var_334_4 < arg_331_1.time_ and arg_331_1.time_ <= var_334_4 + arg_334_0 then
				arg_331_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_334_5 = 0

			if var_334_5 < arg_331_1.time_ and arg_331_1.time_ <= var_334_5 + arg_334_0 then
				arg_331_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_334_6 = 0
			local var_334_7 = 0.65

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_8 = arg_331_1:FormatText(StoryNameCfg[216].name)

				arg_331_1.leftNameTxt_.text = var_334_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_9 = arg_331_1:GetWordFromCfg(1109704082)
				local var_334_10 = arg_331_1:FormatText(var_334_9.content)

				arg_331_1.text_.text = var_334_10

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_11 = 26
				local var_334_12 = utf8.len(var_334_10)
				local var_334_13 = var_334_11 <= 0 and var_334_7 or var_334_7 * (var_334_12 / var_334_11)

				if var_334_13 > 0 and var_334_7 < var_334_13 then
					arg_331_1.talkMaxDuration = var_334_13

					if var_334_13 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_13 + var_334_6
					end
				end

				arg_331_1.text_.text = var_334_10
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704082", "story_v_side_new_1109704.awb") ~= 0 then
					local var_334_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704082", "story_v_side_new_1109704.awb") / 1000

					if var_334_14 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_14 + var_334_6
					end

					if var_334_9.prefab_name ~= "" and arg_331_1.actors_[var_334_9.prefab_name] ~= nil then
						local var_334_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_9.prefab_name].transform, "story_v_side_new_1109704", "1109704082", "story_v_side_new_1109704.awb")

						arg_331_1:RecordAudio("1109704082", var_334_15)
						arg_331_1:RecordAudio("1109704082", var_334_15)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704082", "story_v_side_new_1109704.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704082", "story_v_side_new_1109704.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_16 = math.max(var_334_7, arg_331_1.talkMaxDuration)

			if var_334_6 <= arg_331_1.time_ and arg_331_1.time_ < var_334_6 + var_334_16 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_6) / var_334_16

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_6 + var_334_16 and arg_331_1.time_ < var_334_6 + var_334_16 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 1109704083
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play1109704084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1097ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect1097ui_story == nil then
				arg_335_1.var_.characterEffect1097ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.200000002980232

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect1097ui_story then
					local var_338_4 = Mathf.Lerp(0, 0.5, var_338_3)

					arg_335_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_335_1.var_.characterEffect1097ui_story.fillRatio = var_338_4
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect1097ui_story then
				local var_338_5 = 0.5

				arg_335_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_335_1.var_.characterEffect1097ui_story.fillRatio = var_338_5
			end

			local var_338_6 = 0
			local var_338_7 = 1.375

			if var_338_6 < arg_335_1.time_ and arg_335_1.time_ <= var_338_6 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_8 = arg_335_1:FormatText(StoryNameCfg[7].name)

				arg_335_1.leftNameTxt_.text = var_338_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_9 = arg_335_1:GetWordFromCfg(1109704083)
				local var_338_10 = arg_335_1:FormatText(var_338_9.content)

				arg_335_1.text_.text = var_338_10

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_11 = 55
				local var_338_12 = utf8.len(var_338_10)
				local var_338_13 = var_338_11 <= 0 and var_338_7 or var_338_7 * (var_338_12 / var_338_11)

				if var_338_13 > 0 and var_338_7 < var_338_13 then
					arg_335_1.talkMaxDuration = var_338_13

					if var_338_13 + var_338_6 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_13 + var_338_6
					end
				end

				arg_335_1.text_.text = var_338_10
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_14 = math.max(var_338_7, arg_335_1.talkMaxDuration)

			if var_338_6 <= arg_335_1.time_ and arg_335_1.time_ < var_338_6 + var_338_14 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_6) / var_338_14

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_6 + var_338_14 and arg_335_1.time_ < var_338_6 + var_338_14 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 1109704084
		arg_339_1.duration_ = 2.7

		local var_339_0 = {
			zh = 1.999999999999,
			ja = 2.7
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
				arg_339_0:Play1109704085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1097ui_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and arg_339_1.var_.characterEffect1097ui_story == nil then
				arg_339_1.var_.characterEffect1097ui_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.200000002980232

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect1097ui_story then
					arg_339_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect1097ui_story then
				arg_339_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_342_4 = 0

			if var_342_4 < arg_339_1.time_ and arg_339_1.time_ <= var_342_4 + arg_342_0 then
				arg_339_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_342_5 = 0

			if var_342_5 < arg_339_1.time_ and arg_339_1.time_ <= var_342_5 + arg_342_0 then
				arg_339_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_342_6 = 0
			local var_342_7 = 0.1

			if var_342_6 < arg_339_1.time_ and arg_339_1.time_ <= var_342_6 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_8 = arg_339_1:FormatText(StoryNameCfg[216].name)

				arg_339_1.leftNameTxt_.text = var_342_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_9 = arg_339_1:GetWordFromCfg(1109704084)
				local var_342_10 = arg_339_1:FormatText(var_342_9.content)

				arg_339_1.text_.text = var_342_10

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_11 = 4
				local var_342_12 = utf8.len(var_342_10)
				local var_342_13 = var_342_11 <= 0 and var_342_7 or var_342_7 * (var_342_12 / var_342_11)

				if var_342_13 > 0 and var_342_7 < var_342_13 then
					arg_339_1.talkMaxDuration = var_342_13

					if var_342_13 + var_342_6 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_13 + var_342_6
					end
				end

				arg_339_1.text_.text = var_342_10
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704084", "story_v_side_new_1109704.awb") ~= 0 then
					local var_342_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704084", "story_v_side_new_1109704.awb") / 1000

					if var_342_14 + var_342_6 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_14 + var_342_6
					end

					if var_342_9.prefab_name ~= "" and arg_339_1.actors_[var_342_9.prefab_name] ~= nil then
						local var_342_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_9.prefab_name].transform, "story_v_side_new_1109704", "1109704084", "story_v_side_new_1109704.awb")

						arg_339_1:RecordAudio("1109704084", var_342_15)
						arg_339_1:RecordAudio("1109704084", var_342_15)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704084", "story_v_side_new_1109704.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704084", "story_v_side_new_1109704.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_16 = math.max(var_342_7, arg_339_1.talkMaxDuration)

			if var_342_6 <= arg_339_1.time_ and arg_339_1.time_ < var_342_6 + var_342_16 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_6) / var_342_16

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_6 + var_342_16 and arg_339_1.time_ < var_342_6 + var_342_16 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 1109704085
		arg_343_1.duration_ = 12.365999999999

		local var_343_0 = {
			zh = 8.965999999999,
			ja = 12.365999999999
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
				arg_343_0:Play1109704086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 2.00000000298023

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				local var_346_1 = manager.ui.mainCamera.transform.localPosition
				local var_346_2 = Vector3.New(0, 0, 10) + Vector3.New(var_346_1.x, var_346_1.y, 0)
				local var_346_3 = arg_343_1.bgs_.ST60

				var_346_3.transform.localPosition = var_346_2
				var_346_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_346_4 = var_346_3:GetComponent("SpriteRenderer")

				if var_346_4 and var_346_4.sprite then
					local var_346_5 = (var_346_3.transform.localPosition - var_346_1).z
					local var_346_6 = manager.ui.mainCameraCom_
					local var_346_7 = 2 * var_346_5 * Mathf.Tan(var_346_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_346_8 = var_346_7 * var_346_6.aspect
					local var_346_9 = var_346_4.sprite.bounds.size.x
					local var_346_10 = var_346_4.sprite.bounds.size.y
					local var_346_11 = var_346_8 / var_346_9
					local var_346_12 = var_346_7 / var_346_10
					local var_346_13 = var_346_12 < var_346_11 and var_346_11 or var_346_12

					var_346_3.transform.localScale = Vector3.New(var_346_13, var_346_13, 0)
				end

				for iter_346_0, iter_346_1 in pairs(arg_343_1.bgs_) do
					if iter_346_0 ~= "ST60" then
						iter_346_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_346_14 = 3.999999999999

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 then
				arg_343_1.allBtn_.enabled = false
			end

			local var_346_15 = 0.3

			if arg_343_1.time_ >= var_346_14 + var_346_15 and arg_343_1.time_ < var_346_14 + var_346_15 + arg_346_0 then
				arg_343_1.allBtn_.enabled = true
			end

			local var_346_16 = 0

			if var_346_16 < arg_343_1.time_ and arg_343_1.time_ <= var_346_16 + arg_346_0 then
				arg_343_1.mask_.enabled = true
				arg_343_1.mask_.raycastTarget = true

				arg_343_1:SetGaussion(false)
			end

			local var_346_17 = 2

			if var_346_16 <= arg_343_1.time_ and arg_343_1.time_ < var_346_16 + var_346_17 then
				local var_346_18 = (arg_343_1.time_ - var_346_16) / var_346_17
				local var_346_19 = Color.New(1, 1, 1)

				var_346_19.a = Mathf.Lerp(0, 1, var_346_18)
				arg_343_1.mask_.color = var_346_19
			end

			if arg_343_1.time_ >= var_346_16 + var_346_17 and arg_343_1.time_ < var_346_16 + var_346_17 + arg_346_0 then
				local var_346_20 = Color.New(1, 1, 1)

				var_346_20.a = 1
				arg_343_1.mask_.color = var_346_20
			end

			local var_346_21 = 2

			if var_346_21 < arg_343_1.time_ and arg_343_1.time_ <= var_346_21 + arg_346_0 then
				arg_343_1.mask_.enabled = true
				arg_343_1.mask_.raycastTarget = true

				arg_343_1:SetGaussion(false)
			end

			local var_346_22 = 2

			if var_346_21 <= arg_343_1.time_ and arg_343_1.time_ < var_346_21 + var_346_22 then
				local var_346_23 = (arg_343_1.time_ - var_346_21) / var_346_22
				local var_346_24 = Color.New(1, 1, 1)

				var_346_24.a = Mathf.Lerp(1, 0, var_346_23)
				arg_343_1.mask_.color = var_346_24
			end

			if arg_343_1.time_ >= var_346_21 + var_346_22 and arg_343_1.time_ < var_346_21 + var_346_22 + arg_346_0 then
				local var_346_25 = Color.New(1, 1, 1)
				local var_346_26 = 0

				arg_343_1.mask_.enabled = false
				var_346_25.a = var_346_26
				arg_343_1.mask_.color = var_346_25
			end

			local var_346_27 = arg_343_1.actors_["1097ui_story"].transform
			local var_346_28 = 3.8

			if var_346_28 < arg_343_1.time_ and arg_343_1.time_ <= var_346_28 + arg_346_0 then
				arg_343_1.var_.moveOldPos1097ui_story = var_346_27.localPosition
			end

			local var_346_29 = 0.001

			if var_346_28 <= arg_343_1.time_ and arg_343_1.time_ < var_346_28 + var_346_29 then
				local var_346_30 = (arg_343_1.time_ - var_346_28) / var_346_29
				local var_346_31 = Vector3.New(0, -0.54, -6.3)

				var_346_27.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1097ui_story, var_346_31, var_346_30)

				local var_346_32 = manager.ui.mainCamera.transform.position - var_346_27.position

				var_346_27.forward = Vector3.New(var_346_32.x, var_346_32.y, var_346_32.z)

				local var_346_33 = var_346_27.localEulerAngles

				var_346_33.z = 0
				var_346_33.x = 0
				var_346_27.localEulerAngles = var_346_33
			end

			if arg_343_1.time_ >= var_346_28 + var_346_29 and arg_343_1.time_ < var_346_28 + var_346_29 + arg_346_0 then
				var_346_27.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_346_34 = manager.ui.mainCamera.transform.position - var_346_27.position

				var_346_27.forward = Vector3.New(var_346_34.x, var_346_34.y, var_346_34.z)

				local var_346_35 = var_346_27.localEulerAngles

				var_346_35.z = 0
				var_346_35.x = 0
				var_346_27.localEulerAngles = var_346_35
			end

			local var_346_36 = arg_343_1.actors_["1097ui_story"]
			local var_346_37 = 3.8

			if var_346_37 < arg_343_1.time_ and arg_343_1.time_ <= var_346_37 + arg_346_0 and arg_343_1.var_.characterEffect1097ui_story == nil then
				arg_343_1.var_.characterEffect1097ui_story = var_346_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_38 = 0.200000002980232

			if var_346_37 <= arg_343_1.time_ and arg_343_1.time_ < var_346_37 + var_346_38 then
				local var_346_39 = (arg_343_1.time_ - var_346_37) / var_346_38

				if arg_343_1.var_.characterEffect1097ui_story then
					arg_343_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_37 + var_346_38 and arg_343_1.time_ < var_346_37 + var_346_38 + arg_346_0 and arg_343_1.var_.characterEffect1097ui_story then
				arg_343_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_346_40 = 3.8

			if var_346_40 < arg_343_1.time_ and arg_343_1.time_ <= var_346_40 + arg_346_0 then
				arg_343_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_346_41 = 3.8

			if var_346_41 < arg_343_1.time_ and arg_343_1.time_ <= var_346_41 + arg_346_0 then
				arg_343_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_346_42 = arg_343_1.actors_["1097ui_story"].transform
			local var_346_43 = 1.96599999815226

			if var_346_43 < arg_343_1.time_ and arg_343_1.time_ <= var_346_43 + arg_346_0 then
				arg_343_1.var_.moveOldPos1097ui_story = var_346_42.localPosition
			end

			local var_346_44 = 0.001

			if var_346_43 <= arg_343_1.time_ and arg_343_1.time_ < var_346_43 + var_346_44 then
				local var_346_45 = (arg_343_1.time_ - var_346_43) / var_346_44
				local var_346_46 = Vector3.New(0, 100, 0)

				var_346_42.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1097ui_story, var_346_46, var_346_45)

				local var_346_47 = manager.ui.mainCamera.transform.position - var_346_42.position

				var_346_42.forward = Vector3.New(var_346_47.x, var_346_47.y, var_346_47.z)

				local var_346_48 = var_346_42.localEulerAngles

				var_346_48.z = 0
				var_346_48.x = 0
				var_346_42.localEulerAngles = var_346_48
			end

			if arg_343_1.time_ >= var_346_43 + var_346_44 and arg_343_1.time_ < var_346_43 + var_346_44 + arg_346_0 then
				var_346_42.localPosition = Vector3.New(0, 100, 0)

				local var_346_49 = manager.ui.mainCamera.transform.position - var_346_42.position

				var_346_42.forward = Vector3.New(var_346_49.x, var_346_49.y, var_346_49.z)

				local var_346_50 = var_346_42.localEulerAngles

				var_346_50.z = 0
				var_346_50.x = 0
				var_346_42.localEulerAngles = var_346_50
			end

			if arg_343_1.frameCnt_ <= 1 then
				arg_343_1.dialog_:SetActive(false)
			end

			local var_346_51 = 3.999999999999
			local var_346_52 = 0.375

			if var_346_51 < arg_343_1.time_ and arg_343_1.time_ <= var_346_51 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0

				arg_343_1.dialog_:SetActive(true)

				local var_346_53 = LeanTween.value(arg_343_1.dialog_, 0, 1, 0.3)

				var_346_53:setOnUpdate(LuaHelper.FloatAction(function(arg_347_0)
					arg_343_1.dialogCg_.alpha = arg_347_0
				end))
				var_346_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_343_1.dialog_)
					var_346_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_343_1.duration_ = arg_343_1.duration_ + 0.3

				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_54 = arg_343_1:FormatText(StoryNameCfg[216].name)

				arg_343_1.leftNameTxt_.text = var_346_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_55 = arg_343_1:GetWordFromCfg(1109704085)
				local var_346_56 = arg_343_1:FormatText(var_346_55.content)

				arg_343_1.text_.text = var_346_56

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_57 = 15
				local var_346_58 = utf8.len(var_346_56)
				local var_346_59 = var_346_57 <= 0 and var_346_52 or var_346_52 * (var_346_58 / var_346_57)

				if var_346_59 > 0 and var_346_52 < var_346_59 then
					arg_343_1.talkMaxDuration = var_346_59
					var_346_51 = var_346_51 + 0.3

					if var_346_59 + var_346_51 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_59 + var_346_51
					end
				end

				arg_343_1.text_.text = var_346_56
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704085", "story_v_side_new_1109704.awb") ~= 0 then
					local var_346_60 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704085", "story_v_side_new_1109704.awb") / 1000

					if var_346_60 + var_346_51 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_60 + var_346_51
					end

					if var_346_55.prefab_name ~= "" and arg_343_1.actors_[var_346_55.prefab_name] ~= nil then
						local var_346_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_55.prefab_name].transform, "story_v_side_new_1109704", "1109704085", "story_v_side_new_1109704.awb")

						arg_343_1:RecordAudio("1109704085", var_346_61)
						arg_343_1:RecordAudio("1109704085", var_346_61)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704085", "story_v_side_new_1109704.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704085", "story_v_side_new_1109704.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_62 = var_346_51 + 0.3
			local var_346_63 = math.max(var_346_52, arg_343_1.talkMaxDuration)

			if var_346_62 <= arg_343_1.time_ and arg_343_1.time_ < var_346_62 + var_346_63 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_62) / var_346_63

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_62 + var_346_63 and arg_343_1.time_ < var_346_62 + var_346_63 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 1109704086
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play1109704087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1097ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect1097ui_story == nil then
				arg_349_1.var_.characterEffect1097ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.200000002980232

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1097ui_story then
					local var_352_4 = Mathf.Lerp(0, 0.5, var_352_3)

					arg_349_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_349_1.var_.characterEffect1097ui_story.fillRatio = var_352_4
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1097ui_story then
				local var_352_5 = 0.5

				arg_349_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_349_1.var_.characterEffect1097ui_story.fillRatio = var_352_5
			end

			local var_352_6 = 0
			local var_352_7 = 0.425

			if var_352_6 < arg_349_1.time_ and arg_349_1.time_ <= var_352_6 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_8 = arg_349_1:FormatText(StoryNameCfg[7].name)

				arg_349_1.leftNameTxt_.text = var_352_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_9 = arg_349_1:GetWordFromCfg(1109704086)
				local var_352_10 = arg_349_1:FormatText(var_352_9.content)

				arg_349_1.text_.text = var_352_10

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_11 = 17
				local var_352_12 = utf8.len(var_352_10)
				local var_352_13 = var_352_11 <= 0 and var_352_7 or var_352_7 * (var_352_12 / var_352_11)

				if var_352_13 > 0 and var_352_7 < var_352_13 then
					arg_349_1.talkMaxDuration = var_352_13

					if var_352_13 + var_352_6 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_13 + var_352_6
					end
				end

				arg_349_1.text_.text = var_352_10
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_14 = math.max(var_352_7, arg_349_1.talkMaxDuration)

			if var_352_6 <= arg_349_1.time_ and arg_349_1.time_ < var_352_6 + var_352_14 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_6) / var_352_14

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_6 + var_352_14 and arg_349_1.time_ < var_352_6 + var_352_14 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 1109704087
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play1109704088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 1.6

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, false)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_2 = arg_353_1:GetWordFromCfg(1109704087)
				local var_356_3 = arg_353_1:FormatText(var_356_2.content)

				arg_353_1.text_.text = var_356_3

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_4 = 64
				local var_356_5 = utf8.len(var_356_3)
				local var_356_6 = var_356_4 <= 0 and var_356_1 or var_356_1 * (var_356_5 / var_356_4)

				if var_356_6 > 0 and var_356_1 < var_356_6 then
					arg_353_1.talkMaxDuration = var_356_6

					if var_356_6 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_6 + var_356_0
					end
				end

				arg_353_1.text_.text = var_356_3
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_7 = math.max(var_356_1, arg_353_1.talkMaxDuration)

			if var_356_0 <= arg_353_1.time_ and arg_353_1.time_ < var_356_0 + var_356_7 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_0) / var_356_7

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_0 + var_356_7 and arg_353_1.time_ < var_356_0 + var_356_7 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 1109704088
		arg_357_1.duration_ = 4.3

		local var_357_0 = {
			zh = 4.3,
			ja = 3.566
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
				arg_357_0:Play1109704089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["1097ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect1097ui_story == nil then
				arg_357_1.var_.characterEffect1097ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.200000002980232

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect1097ui_story then
					arg_357_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect1097ui_story then
				arg_357_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_360_4 = 0

			if var_360_4 < arg_357_1.time_ and arg_357_1.time_ <= var_360_4 + arg_360_0 then
				arg_357_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_360_5 = 0

			if var_360_5 < arg_357_1.time_ and arg_357_1.time_ <= var_360_5 + arg_360_0 then
				arg_357_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_360_6 = 0
			local var_360_7 = 0.575

			if var_360_6 < arg_357_1.time_ and arg_357_1.time_ <= var_360_6 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_8 = arg_357_1:FormatText(StoryNameCfg[216].name)

				arg_357_1.leftNameTxt_.text = var_360_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_9 = arg_357_1:GetWordFromCfg(1109704088)
				local var_360_10 = arg_357_1:FormatText(var_360_9.content)

				arg_357_1.text_.text = var_360_10

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_11 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704088", "story_v_side_new_1109704.awb") ~= 0 then
					local var_360_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704088", "story_v_side_new_1109704.awb") / 1000

					if var_360_14 + var_360_6 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_14 + var_360_6
					end

					if var_360_9.prefab_name ~= "" and arg_357_1.actors_[var_360_9.prefab_name] ~= nil then
						local var_360_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_9.prefab_name].transform, "story_v_side_new_1109704", "1109704088", "story_v_side_new_1109704.awb")

						arg_357_1:RecordAudio("1109704088", var_360_15)
						arg_357_1:RecordAudio("1109704088", var_360_15)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704088", "story_v_side_new_1109704.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704088", "story_v_side_new_1109704.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_16 = math.max(var_360_7, arg_357_1.talkMaxDuration)

			if var_360_6 <= arg_357_1.time_ and arg_357_1.time_ < var_360_6 + var_360_16 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_6) / var_360_16

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_6 + var_360_16 and arg_357_1.time_ < var_360_6 + var_360_16 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 1109704089
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play1109704090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1097ui_story"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.characterEffect1097ui_story == nil then
				arg_361_1.var_.characterEffect1097ui_story = var_364_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_2 = 0.200000002980232

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.characterEffect1097ui_story then
					local var_364_4 = Mathf.Lerp(0, 0.5, var_364_3)

					arg_361_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_361_1.var_.characterEffect1097ui_story.fillRatio = var_364_4
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect1097ui_story then
				local var_364_5 = 0.5

				arg_361_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_361_1.var_.characterEffect1097ui_story.fillRatio = var_364_5
			end

			local var_364_6 = 0
			local var_364_7 = 0.6

			if var_364_6 < arg_361_1.time_ and arg_361_1.time_ <= var_364_6 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_8 = arg_361_1:FormatText(StoryNameCfg[7].name)

				arg_361_1.leftNameTxt_.text = var_364_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_9 = arg_361_1:GetWordFromCfg(1109704089)
				local var_364_10 = arg_361_1:FormatText(var_364_9.content)

				arg_361_1.text_.text = var_364_10

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_11 = 24
				local var_364_12 = utf8.len(var_364_10)
				local var_364_13 = var_364_11 <= 0 and var_364_7 or var_364_7 * (var_364_12 / var_364_11)

				if var_364_13 > 0 and var_364_7 < var_364_13 then
					arg_361_1.talkMaxDuration = var_364_13

					if var_364_13 + var_364_6 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_13 + var_364_6
					end
				end

				arg_361_1.text_.text = var_364_10
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_14 = math.max(var_364_7, arg_361_1.talkMaxDuration)

			if var_364_6 <= arg_361_1.time_ and arg_361_1.time_ < var_364_6 + var_364_14 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_6) / var_364_14

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_6 + var_364_14 and arg_361_1.time_ < var_364_6 + var_364_14 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 1109704090
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play1109704091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.3

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

				local var_368_2 = arg_365_1:GetWordFromCfg(1109704090)
				local var_368_3 = arg_365_1:FormatText(var_368_2.content)

				arg_365_1.text_.text = var_368_3

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_4 = 12
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
	Play1109704091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 1109704091
		arg_369_1.duration_ = 4.333

		local var_369_0 = {
			zh = 4.333,
			ja = 2.933
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
				arg_369_0:Play1109704092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["1097ui_story"]
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 and arg_369_1.var_.characterEffect1097ui_story == nil then
				arg_369_1.var_.characterEffect1097ui_story = var_372_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_2 = 0.200000002980232

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2

				if arg_369_1.var_.characterEffect1097ui_story then
					arg_369_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 and arg_369_1.var_.characterEffect1097ui_story then
				arg_369_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_372_4 = 0

			if var_372_4 < arg_369_1.time_ and arg_369_1.time_ <= var_372_4 + arg_372_0 then
				arg_369_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_2")
			end

			local var_372_5 = 0

			if var_372_5 < arg_369_1.time_ and arg_369_1.time_ <= var_372_5 + arg_372_0 then
				arg_369_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_372_6 = 0
			local var_372_7 = 0.575

			if var_372_6 < arg_369_1.time_ and arg_369_1.time_ <= var_372_6 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_8 = arg_369_1:FormatText(StoryNameCfg[216].name)

				arg_369_1.leftNameTxt_.text = var_372_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_9 = arg_369_1:GetWordFromCfg(1109704091)
				local var_372_10 = arg_369_1:FormatText(var_372_9.content)

				arg_369_1.text_.text = var_372_10

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_11 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704091", "story_v_side_new_1109704.awb") ~= 0 then
					local var_372_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704091", "story_v_side_new_1109704.awb") / 1000

					if var_372_14 + var_372_6 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_14 + var_372_6
					end

					if var_372_9.prefab_name ~= "" and arg_369_1.actors_[var_372_9.prefab_name] ~= nil then
						local var_372_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_9.prefab_name].transform, "story_v_side_new_1109704", "1109704091", "story_v_side_new_1109704.awb")

						arg_369_1:RecordAudio("1109704091", var_372_15)
						arg_369_1:RecordAudio("1109704091", var_372_15)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704091", "story_v_side_new_1109704.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704091", "story_v_side_new_1109704.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_16 = math.max(var_372_7, arg_369_1.talkMaxDuration)

			if var_372_6 <= arg_369_1.time_ and arg_369_1.time_ < var_372_6 + var_372_16 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_6) / var_372_16

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_6 + var_372_16 and arg_369_1.time_ < var_372_6 + var_372_16 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 1109704092
		arg_373_1.duration_ = 9.066

		local var_373_0 = {
			zh = 7.433,
			ja = 9.066
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
				arg_373_0:Play1109704093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_376_2 = 0
			local var_376_3 = 0.9

			if var_376_2 < arg_373_1.time_ and arg_373_1.time_ <= var_376_2 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_4 = arg_373_1:FormatText(StoryNameCfg[216].name)

				arg_373_1.leftNameTxt_.text = var_376_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_5 = arg_373_1:GetWordFromCfg(1109704092)
				local var_376_6 = arg_373_1:FormatText(var_376_5.content)

				arg_373_1.text_.text = var_376_6

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_7 = 36
				local var_376_8 = utf8.len(var_376_6)
				local var_376_9 = var_376_7 <= 0 and var_376_3 or var_376_3 * (var_376_8 / var_376_7)

				if var_376_9 > 0 and var_376_3 < var_376_9 then
					arg_373_1.talkMaxDuration = var_376_9

					if var_376_9 + var_376_2 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_9 + var_376_2
					end
				end

				arg_373_1.text_.text = var_376_6
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704092", "story_v_side_new_1109704.awb") ~= 0 then
					local var_376_10 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704092", "story_v_side_new_1109704.awb") / 1000

					if var_376_10 + var_376_2 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_10 + var_376_2
					end

					if var_376_5.prefab_name ~= "" and arg_373_1.actors_[var_376_5.prefab_name] ~= nil then
						local var_376_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_5.prefab_name].transform, "story_v_side_new_1109704", "1109704092", "story_v_side_new_1109704.awb")

						arg_373_1:RecordAudio("1109704092", var_376_11)
						arg_373_1:RecordAudio("1109704092", var_376_11)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704092", "story_v_side_new_1109704.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704092", "story_v_side_new_1109704.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_12 = math.max(var_376_3, arg_373_1.talkMaxDuration)

			if var_376_2 <= arg_373_1.time_ and arg_373_1.time_ < var_376_2 + var_376_12 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_2) / var_376_12

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_2 + var_376_12 and arg_373_1.time_ < var_376_2 + var_376_12 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 1109704093
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play1109704094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1097ui_story"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.characterEffect1097ui_story == nil then
				arg_377_1.var_.characterEffect1097ui_story = var_380_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_2 = 0.200000002980232

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.characterEffect1097ui_story then
					local var_380_4 = Mathf.Lerp(0, 0.5, var_380_3)

					arg_377_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1097ui_story.fillRatio = var_380_4
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect1097ui_story then
				local var_380_5 = 0.5

				arg_377_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1097ui_story.fillRatio = var_380_5
			end

			local var_380_6 = 0
			local var_380_7 = 1.15

			if var_380_6 < arg_377_1.time_ and arg_377_1.time_ <= var_380_6 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_8 = arg_377_1:GetWordFromCfg(1109704093)
				local var_380_9 = arg_377_1:FormatText(var_380_8.content)

				arg_377_1.text_.text = var_380_9

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_10 = 46
				local var_380_11 = utf8.len(var_380_9)
				local var_380_12 = var_380_10 <= 0 and var_380_7 or var_380_7 * (var_380_11 / var_380_10)

				if var_380_12 > 0 and var_380_7 < var_380_12 then
					arg_377_1.talkMaxDuration = var_380_12

					if var_380_12 + var_380_6 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_12 + var_380_6
					end
				end

				arg_377_1.text_.text = var_380_9
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_13 = math.max(var_380_7, arg_377_1.talkMaxDuration)

			if var_380_6 <= arg_377_1.time_ and arg_377_1.time_ < var_380_6 + var_380_13 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_6) / var_380_13

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_6 + var_380_13 and arg_377_1.time_ < var_380_6 + var_380_13 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 1109704094
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play1109704095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.15

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_2 = arg_381_1:FormatText(StoryNameCfg[7].name)

				arg_381_1.leftNameTxt_.text = var_384_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_3 = arg_381_1:GetWordFromCfg(1109704094)
				local var_384_4 = arg_381_1:FormatText(var_384_3.content)

				arg_381_1.text_.text = var_384_4

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_5 = 6
				local var_384_6 = utf8.len(var_384_4)
				local var_384_7 = var_384_5 <= 0 and var_384_1 or var_384_1 * (var_384_6 / var_384_5)

				if var_384_7 > 0 and var_384_1 < var_384_7 then
					arg_381_1.talkMaxDuration = var_384_7

					if var_384_7 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_7 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_4
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_8 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_8 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_8

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_8 and arg_381_1.time_ < var_384_0 + var_384_8 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 1109704095
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play1109704096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 0.975

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_2 = arg_385_1:GetWordFromCfg(1109704095)
				local var_388_3 = arg_385_1:FormatText(var_388_2.content)

				arg_385_1.text_.text = var_388_3

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_4 = 39
				local var_388_5 = utf8.len(var_388_3)
				local var_388_6 = var_388_4 <= 0 and var_388_1 or var_388_1 * (var_388_5 / var_388_4)

				if var_388_6 > 0 and var_388_1 < var_388_6 then
					arg_385_1.talkMaxDuration = var_388_6

					if var_388_6 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_6 + var_388_0
					end
				end

				arg_385_1.text_.text = var_388_3
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_7 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_7 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_7

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_7 and arg_385_1.time_ < var_388_0 + var_388_7 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 1109704096
		arg_389_1.duration_ = 4.233

		local var_389_0 = {
			zh = 3.733,
			ja = 4.233
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
				arg_389_0:Play1109704097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1097ui_story"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.characterEffect1097ui_story == nil then
				arg_389_1.var_.characterEffect1097ui_story = var_392_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_2 = 0.200000002980232

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.characterEffect1097ui_story then
					arg_389_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect1097ui_story then
				arg_389_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_392_4 = 0

			if var_392_4 < arg_389_1.time_ and arg_389_1.time_ <= var_392_4 + arg_392_0 then
				arg_389_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_392_5 = 0

			if var_392_5 < arg_389_1.time_ and arg_389_1.time_ <= var_392_5 + arg_392_0 then
				arg_389_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_392_6 = 0
			local var_392_7 = 0.65

			if var_392_6 < arg_389_1.time_ and arg_389_1.time_ <= var_392_6 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_8 = arg_389_1:FormatText(StoryNameCfg[216].name)

				arg_389_1.leftNameTxt_.text = var_392_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_9 = arg_389_1:GetWordFromCfg(1109704096)
				local var_392_10 = arg_389_1:FormatText(var_392_9.content)

				arg_389_1.text_.text = var_392_10

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_11 = 26
				local var_392_12 = utf8.len(var_392_10)
				local var_392_13 = var_392_11 <= 0 and var_392_7 or var_392_7 * (var_392_12 / var_392_11)

				if var_392_13 > 0 and var_392_7 < var_392_13 then
					arg_389_1.talkMaxDuration = var_392_13

					if var_392_13 + var_392_6 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_13 + var_392_6
					end
				end

				arg_389_1.text_.text = var_392_10
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704096", "story_v_side_new_1109704.awb") ~= 0 then
					local var_392_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704096", "story_v_side_new_1109704.awb") / 1000

					if var_392_14 + var_392_6 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_14 + var_392_6
					end

					if var_392_9.prefab_name ~= "" and arg_389_1.actors_[var_392_9.prefab_name] ~= nil then
						local var_392_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_9.prefab_name].transform, "story_v_side_new_1109704", "1109704096", "story_v_side_new_1109704.awb")

						arg_389_1:RecordAudio("1109704096", var_392_15)
						arg_389_1:RecordAudio("1109704096", var_392_15)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704096", "story_v_side_new_1109704.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704096", "story_v_side_new_1109704.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_16 = math.max(var_392_7, arg_389_1.talkMaxDuration)

			if var_392_6 <= arg_389_1.time_ and arg_389_1.time_ < var_392_6 + var_392_16 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_6) / var_392_16

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_6 + var_392_16 and arg_389_1.time_ < var_392_6 + var_392_16 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 1109704097
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play1109704098(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1097ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect1097ui_story == nil then
				arg_393_1.var_.characterEffect1097ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.200000002980232

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect1097ui_story then
					local var_396_4 = Mathf.Lerp(0, 0.5, var_396_3)

					arg_393_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1097ui_story.fillRatio = var_396_4
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect1097ui_story then
				local var_396_5 = 0.5

				arg_393_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1097ui_story.fillRatio = var_396_5
			end

			local var_396_6 = 0
			local var_396_7 = 0.825

			if var_396_6 < arg_393_1.time_ and arg_393_1.time_ <= var_396_6 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, false)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_8 = arg_393_1:GetWordFromCfg(1109704097)
				local var_396_9 = arg_393_1:FormatText(var_396_8.content)

				arg_393_1.text_.text = var_396_9

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_10 = 33
				local var_396_11 = utf8.len(var_396_9)
				local var_396_12 = var_396_10 <= 0 and var_396_7 or var_396_7 * (var_396_11 / var_396_10)

				if var_396_12 > 0 and var_396_7 < var_396_12 then
					arg_393_1.talkMaxDuration = var_396_12

					if var_396_12 + var_396_6 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_12 + var_396_6
					end
				end

				arg_393_1.text_.text = var_396_9
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_13 = math.max(var_396_7, arg_393_1.talkMaxDuration)

			if var_396_6 <= arg_393_1.time_ and arg_393_1.time_ < var_396_6 + var_396_13 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_6) / var_396_13

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_6 + var_396_13 and arg_393_1.time_ < var_396_6 + var_396_13 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 1109704098
		arg_397_1.duration_ = 10.033

		local var_397_0 = {
			zh = 10.033,
			ja = 7.966
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
				arg_397_0:Play1109704099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1097ui_story"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.characterEffect1097ui_story == nil then
				arg_397_1.var_.characterEffect1097ui_story = var_400_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_2 = 0.200000002980232

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.characterEffect1097ui_story then
					arg_397_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.characterEffect1097ui_story then
				arg_397_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_400_4 = 0

			if var_400_4 < arg_397_1.time_ and arg_397_1.time_ <= var_400_4 + arg_400_0 then
				arg_397_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_2")
			end

			local var_400_5 = 0

			if var_400_5 < arg_397_1.time_ and arg_397_1.time_ <= var_400_5 + arg_400_0 then
				arg_397_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_400_6 = 0
			local var_400_7 = 1.225

			if var_400_6 < arg_397_1.time_ and arg_397_1.time_ <= var_400_6 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_8 = arg_397_1:FormatText(StoryNameCfg[216].name)

				arg_397_1.leftNameTxt_.text = var_400_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_9 = arg_397_1:GetWordFromCfg(1109704098)
				local var_400_10 = arg_397_1:FormatText(var_400_9.content)

				arg_397_1.text_.text = var_400_10

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_11 = 49
				local var_400_12 = utf8.len(var_400_10)
				local var_400_13 = var_400_11 <= 0 and var_400_7 or var_400_7 * (var_400_12 / var_400_11)

				if var_400_13 > 0 and var_400_7 < var_400_13 then
					arg_397_1.talkMaxDuration = var_400_13

					if var_400_13 + var_400_6 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_13 + var_400_6
					end
				end

				arg_397_1.text_.text = var_400_10
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704098", "story_v_side_new_1109704.awb") ~= 0 then
					local var_400_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704098", "story_v_side_new_1109704.awb") / 1000

					if var_400_14 + var_400_6 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_14 + var_400_6
					end

					if var_400_9.prefab_name ~= "" and arg_397_1.actors_[var_400_9.prefab_name] ~= nil then
						local var_400_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_9.prefab_name].transform, "story_v_side_new_1109704", "1109704098", "story_v_side_new_1109704.awb")

						arg_397_1:RecordAudio("1109704098", var_400_15)
						arg_397_1:RecordAudio("1109704098", var_400_15)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704098", "story_v_side_new_1109704.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704098", "story_v_side_new_1109704.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_16 = math.max(var_400_7, arg_397_1.talkMaxDuration)

			if var_400_6 <= arg_397_1.time_ and arg_397_1.time_ < var_400_6 + var_400_16 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_6) / var_400_16

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_6 + var_400_16 and arg_397_1.time_ < var_400_6 + var_400_16 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704099 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 1109704099
		arg_401_1.duration_ = 9.166

		local var_401_0 = {
			zh = 9.166,
			ja = 7.733
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
				arg_401_0:Play1109704100(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_404_2 = 0
			local var_404_3 = 1.025

			if var_404_2 < arg_401_1.time_ and arg_401_1.time_ <= var_404_2 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_4 = arg_401_1:FormatText(StoryNameCfg[216].name)

				arg_401_1.leftNameTxt_.text = var_404_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_5 = arg_401_1:GetWordFromCfg(1109704099)
				local var_404_6 = arg_401_1:FormatText(var_404_5.content)

				arg_401_1.text_.text = var_404_6

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_7 = 35
				local var_404_8 = utf8.len(var_404_6)
				local var_404_9 = var_404_7 <= 0 and var_404_3 or var_404_3 * (var_404_8 / var_404_7)

				if var_404_9 > 0 and var_404_3 < var_404_9 then
					arg_401_1.talkMaxDuration = var_404_9

					if var_404_9 + var_404_2 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_9 + var_404_2
					end
				end

				arg_401_1.text_.text = var_404_6
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704099", "story_v_side_new_1109704.awb") ~= 0 then
					local var_404_10 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704099", "story_v_side_new_1109704.awb") / 1000

					if var_404_10 + var_404_2 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_10 + var_404_2
					end

					if var_404_5.prefab_name ~= "" and arg_401_1.actors_[var_404_5.prefab_name] ~= nil then
						local var_404_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_5.prefab_name].transform, "story_v_side_new_1109704", "1109704099", "story_v_side_new_1109704.awb")

						arg_401_1:RecordAudio("1109704099", var_404_11)
						arg_401_1:RecordAudio("1109704099", var_404_11)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704099", "story_v_side_new_1109704.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704099", "story_v_side_new_1109704.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_12 = math.max(var_404_3, arg_401_1.talkMaxDuration)

			if var_404_2 <= arg_401_1.time_ and arg_401_1.time_ < var_404_2 + var_404_12 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_2) / var_404_12

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_2 + var_404_12 and arg_401_1.time_ < var_404_2 + var_404_12 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704100 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 1109704100
		arg_405_1.duration_ = 7.9

		local var_405_0 = {
			zh = 7.9,
			ja = 5.933
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
				arg_405_0:Play1109704101(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_408_2 = 0
			local var_408_3 = 1.1

			if var_408_2 < arg_405_1.time_ and arg_405_1.time_ <= var_408_2 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_4 = arg_405_1:FormatText(StoryNameCfg[216].name)

				arg_405_1.leftNameTxt_.text = var_408_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_5 = arg_405_1:GetWordFromCfg(1109704100)
				local var_408_6 = arg_405_1:FormatText(var_408_5.content)

				arg_405_1.text_.text = var_408_6

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_7 = 44
				local var_408_8 = utf8.len(var_408_6)
				local var_408_9 = var_408_7 <= 0 and var_408_3 or var_408_3 * (var_408_8 / var_408_7)

				if var_408_9 > 0 and var_408_3 < var_408_9 then
					arg_405_1.talkMaxDuration = var_408_9

					if var_408_9 + var_408_2 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_9 + var_408_2
					end
				end

				arg_405_1.text_.text = var_408_6
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704100", "story_v_side_new_1109704.awb") ~= 0 then
					local var_408_10 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704100", "story_v_side_new_1109704.awb") / 1000

					if var_408_10 + var_408_2 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_10 + var_408_2
					end

					if var_408_5.prefab_name ~= "" and arg_405_1.actors_[var_408_5.prefab_name] ~= nil then
						local var_408_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_5.prefab_name].transform, "story_v_side_new_1109704", "1109704100", "story_v_side_new_1109704.awb")

						arg_405_1:RecordAudio("1109704100", var_408_11)
						arg_405_1:RecordAudio("1109704100", var_408_11)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704100", "story_v_side_new_1109704.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704100", "story_v_side_new_1109704.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_12 = math.max(var_408_3, arg_405_1.talkMaxDuration)

			if var_408_2 <= arg_405_1.time_ and arg_405_1.time_ < var_408_2 + var_408_12 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_2) / var_408_12

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_2 + var_408_12 and arg_405_1.time_ < var_408_2 + var_408_12 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704101 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 1109704101
		arg_409_1.duration_ = 5

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play1109704102(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1097ui_story"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 and arg_409_1.var_.characterEffect1097ui_story == nil then
				arg_409_1.var_.characterEffect1097ui_story = var_412_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_2 = 0.200000002980232

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2

				if arg_409_1.var_.characterEffect1097ui_story then
					local var_412_4 = Mathf.Lerp(0, 0.5, var_412_3)

					arg_409_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_409_1.var_.characterEffect1097ui_story.fillRatio = var_412_4
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 and arg_409_1.var_.characterEffect1097ui_story then
				local var_412_5 = 0.5

				arg_409_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_409_1.var_.characterEffect1097ui_story.fillRatio = var_412_5
			end

			local var_412_6 = 0
			local var_412_7 = 0.05

			if var_412_6 < arg_409_1.time_ and arg_409_1.time_ <= var_412_6 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_8 = arg_409_1:FormatText(StoryNameCfg[7].name)

				arg_409_1.leftNameTxt_.text = var_412_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_9 = arg_409_1:GetWordFromCfg(1109704101)
				local var_412_10 = arg_409_1:FormatText(var_412_9.content)

				arg_409_1.text_.text = var_412_10

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_11 = 2
				local var_412_12 = utf8.len(var_412_10)
				local var_412_13 = var_412_11 <= 0 and var_412_7 or var_412_7 * (var_412_12 / var_412_11)

				if var_412_13 > 0 and var_412_7 < var_412_13 then
					arg_409_1.talkMaxDuration = var_412_13

					if var_412_13 + var_412_6 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_13 + var_412_6
					end
				end

				arg_409_1.text_.text = var_412_10
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)
				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_14 = math.max(var_412_7, arg_409_1.talkMaxDuration)

			if var_412_6 <= arg_409_1.time_ and arg_409_1.time_ < var_412_6 + var_412_14 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_6) / var_412_14

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_6 + var_412_14 and arg_409_1.time_ < var_412_6 + var_412_14 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704102 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 1109704102
		arg_413_1.duration_ = 7.233332999999

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play1109704103(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = 0.5

			if var_416_0 < arg_413_1.time_ and arg_413_1.time_ <= var_416_0 + arg_416_0 then
				local var_416_1 = manager.ui.mainCamera.transform.localPosition
				local var_416_2 = Vector3.New(0, 0, 10) + Vector3.New(var_416_1.x, var_416_1.y, 0)
				local var_416_3 = arg_413_1.bgs_.STwhite

				var_416_3.transform.localPosition = var_416_2
				var_416_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_416_4 = var_416_3:GetComponent("SpriteRenderer")

				if var_416_4 and var_416_4.sprite then
					local var_416_5 = (var_416_3.transform.localPosition - var_416_1).z
					local var_416_6 = manager.ui.mainCameraCom_
					local var_416_7 = 2 * var_416_5 * Mathf.Tan(var_416_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_416_8 = var_416_7 * var_416_6.aspect
					local var_416_9 = var_416_4.sprite.bounds.size.x
					local var_416_10 = var_416_4.sprite.bounds.size.y
					local var_416_11 = var_416_8 / var_416_9
					local var_416_12 = var_416_7 / var_416_10
					local var_416_13 = var_416_12 < var_416_11 and var_416_11 or var_416_12

					var_416_3.transform.localScale = Vector3.New(var_416_13, var_416_13, 0)
				end

				for iter_416_0, iter_416_1 in pairs(arg_413_1.bgs_) do
					if iter_416_0 ~= "STwhite" then
						iter_416_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_416_14 = 2.233332999999

			if var_416_14 < arg_413_1.time_ and arg_413_1.time_ <= var_416_14 + arg_416_0 then
				arg_413_1.allBtn_.enabled = false
			end

			local var_416_15 = 0.3

			if arg_413_1.time_ >= var_416_14 + var_416_15 and arg_413_1.time_ < var_416_14 + var_416_15 + arg_416_0 then
				arg_413_1.allBtn_.enabled = true
			end

			local var_416_16 = 0.5

			if var_416_16 < arg_413_1.time_ and arg_413_1.time_ <= var_416_16 + arg_416_0 then
				arg_413_1.mask_.enabled = true
				arg_413_1.mask_.raycastTarget = true

				arg_413_1:SetGaussion(false)
			end

			local var_416_17 = 2.033333

			if var_416_16 <= arg_413_1.time_ and arg_413_1.time_ < var_416_16 + var_416_17 then
				local var_416_18 = (arg_413_1.time_ - var_416_16) / var_416_17
				local var_416_19 = Color.New(1, 1, 1)

				var_416_19.a = Mathf.Lerp(1, 0, var_416_18)
				arg_413_1.mask_.color = var_416_19
			end

			if arg_413_1.time_ >= var_416_16 + var_416_17 and arg_413_1.time_ < var_416_16 + var_416_17 + arg_416_0 then
				local var_416_20 = Color.New(1, 1, 1)
				local var_416_21 = 0

				arg_413_1.mask_.enabled = false
				var_416_20.a = var_416_21
				arg_413_1.mask_.color = var_416_20
			end

			local var_416_22 = arg_413_1.actors_["1097ui_story"].transform
			local var_416_23 = 0.5

			if var_416_23 < arg_413_1.time_ and arg_413_1.time_ <= var_416_23 + arg_416_0 then
				arg_413_1.var_.moveOldPos1097ui_story = var_416_22.localPosition
			end

			local var_416_24 = 0.001

			if var_416_23 <= arg_413_1.time_ and arg_413_1.time_ < var_416_23 + var_416_24 then
				local var_416_25 = (arg_413_1.time_ - var_416_23) / var_416_24
				local var_416_26 = Vector3.New(0, 100, 0)

				var_416_22.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1097ui_story, var_416_26, var_416_25)

				local var_416_27 = manager.ui.mainCamera.transform.position - var_416_22.position

				var_416_22.forward = Vector3.New(var_416_27.x, var_416_27.y, var_416_27.z)

				local var_416_28 = var_416_22.localEulerAngles

				var_416_28.z = 0
				var_416_28.x = 0
				var_416_22.localEulerAngles = var_416_28
			end

			if arg_413_1.time_ >= var_416_23 + var_416_24 and arg_413_1.time_ < var_416_23 + var_416_24 + arg_416_0 then
				var_416_22.localPosition = Vector3.New(0, 100, 0)

				local var_416_29 = manager.ui.mainCamera.transform.position - var_416_22.position

				var_416_22.forward = Vector3.New(var_416_29.x, var_416_29.y, var_416_29.z)

				local var_416_30 = var_416_22.localEulerAngles

				var_416_30.z = 0
				var_416_30.x = 0
				var_416_22.localEulerAngles = var_416_30
			end

			local var_416_31 = arg_413_1.actors_["1097ui_story"]
			local var_416_32 = 0.5

			if var_416_32 < arg_413_1.time_ and arg_413_1.time_ <= var_416_32 + arg_416_0 and arg_413_1.var_.characterEffect1097ui_story == nil then
				arg_413_1.var_.characterEffect1097ui_story = var_416_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_33 = 0.034000001847744

			if var_416_32 <= arg_413_1.time_ and arg_413_1.time_ < var_416_32 + var_416_33 then
				local var_416_34 = (arg_413_1.time_ - var_416_32) / var_416_33

				if arg_413_1.var_.characterEffect1097ui_story then
					local var_416_35 = Mathf.Lerp(0, 0.5, var_416_34)

					arg_413_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_413_1.var_.characterEffect1097ui_story.fillRatio = var_416_35
				end
			end

			if arg_413_1.time_ >= var_416_32 + var_416_33 and arg_413_1.time_ < var_416_32 + var_416_33 + arg_416_0 and arg_413_1.var_.characterEffect1097ui_story then
				local var_416_36 = 0.5

				arg_413_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_413_1.var_.characterEffect1097ui_story.fillRatio = var_416_36
			end

			if arg_413_1.frameCnt_ <= 1 then
				arg_413_1.dialog_:SetActive(false)
			end

			local var_416_37 = 2.233332999999
			local var_416_38 = 0.625

			if var_416_37 < arg_413_1.time_ and arg_413_1.time_ <= var_416_37 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0

				arg_413_1.dialog_:SetActive(true)

				local var_416_39 = LeanTween.value(arg_413_1.dialog_, 0, 1, 0.3)

				var_416_39:setOnUpdate(LuaHelper.FloatAction(function(arg_417_0)
					arg_413_1.dialogCg_.alpha = arg_417_0
				end))
				var_416_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_413_1.dialog_)
					var_416_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_413_1.duration_ = arg_413_1.duration_ + 0.3

				SetActive(arg_413_1.leftNameGo_, false)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_40 = arg_413_1:GetWordFromCfg(1109704102)
				local var_416_41 = arg_413_1:FormatText(var_416_40.content)

				arg_413_1.text_.text = var_416_41

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_42 = 25
				local var_416_43 = utf8.len(var_416_41)
				local var_416_44 = var_416_42 <= 0 and var_416_38 or var_416_38 * (var_416_43 / var_416_42)

				if var_416_44 > 0 and var_416_38 < var_416_44 then
					arg_413_1.talkMaxDuration = var_416_44
					var_416_37 = var_416_37 + 0.3

					if var_416_44 + var_416_37 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_44 + var_416_37
					end
				end

				arg_413_1.text_.text = var_416_41
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_45 = var_416_37 + 0.3
			local var_416_46 = math.max(var_416_38, arg_413_1.talkMaxDuration)

			if var_416_45 <= arg_413_1.time_ and arg_413_1.time_ < var_416_45 + var_416_46 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_45) / var_416_46

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_45 + var_416_46 and arg_413_1.time_ < var_416_45 + var_416_46 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704103 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 1109704103
		arg_419_1.duration_ = 9.00000000298023

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play1109704104(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = "R9701"

			if arg_419_1.bgs_[var_422_0] == nil then
				local var_422_1 = Object.Instantiate(arg_419_1.paintGo_)

				var_422_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_422_0)
				var_422_1.name = var_422_0
				var_422_1.transform.parent = arg_419_1.stage_.transform
				var_422_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_419_1.bgs_[var_422_0] = var_422_1
			end

			local var_422_2 = 1.83333333333333

			if var_422_2 < arg_419_1.time_ and arg_419_1.time_ <= var_422_2 + arg_422_0 then
				local var_422_3 = manager.ui.mainCamera.transform.localPosition
				local var_422_4 = Vector3.New(0, 0, 10) + Vector3.New(var_422_3.x, var_422_3.y, 0)
				local var_422_5 = arg_419_1.bgs_.R9701

				var_422_5.transform.localPosition = var_422_4
				var_422_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_422_6 = var_422_5:GetComponent("SpriteRenderer")

				if var_422_6 and var_422_6.sprite then
					local var_422_7 = (var_422_5.transform.localPosition - var_422_3).z
					local var_422_8 = manager.ui.mainCameraCom_
					local var_422_9 = 2 * var_422_7 * Mathf.Tan(var_422_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_422_10 = var_422_9 * var_422_8.aspect
					local var_422_11 = var_422_6.sprite.bounds.size.x
					local var_422_12 = var_422_6.sprite.bounds.size.y
					local var_422_13 = var_422_10 / var_422_11
					local var_422_14 = var_422_9 / var_422_12
					local var_422_15 = var_422_14 < var_422_13 and var_422_13 or var_422_14

					var_422_5.transform.localScale = Vector3.New(var_422_15, var_422_15, 0)
				end

				for iter_422_0, iter_422_1 in pairs(arg_419_1.bgs_) do
					if iter_422_0 ~= "R9701" then
						iter_422_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_422_16 = 4

			if var_422_16 < arg_419_1.time_ and arg_419_1.time_ <= var_422_16 + arg_422_0 then
				arg_419_1.allBtn_.enabled = false
			end

			local var_422_17 = 0.3

			if arg_419_1.time_ >= var_422_16 + var_422_17 and arg_419_1.time_ < var_422_16 + var_422_17 + arg_422_0 then
				arg_419_1.allBtn_.enabled = true
			end

			local var_422_18 = 0

			if var_422_18 < arg_419_1.time_ and arg_419_1.time_ <= var_422_18 + arg_422_0 then
				arg_419_1.mask_.enabled = true
				arg_419_1.mask_.raycastTarget = true

				arg_419_1:SetGaussion(false)
			end

			local var_422_19 = 2

			if var_422_18 <= arg_419_1.time_ and arg_419_1.time_ < var_422_18 + var_422_19 then
				local var_422_20 = (arg_419_1.time_ - var_422_18) / var_422_19
				local var_422_21 = Color.New(0, 0, 0)

				var_422_21.a = Mathf.Lerp(0, 1, var_422_20)
				arg_419_1.mask_.color = var_422_21
			end

			if arg_419_1.time_ >= var_422_18 + var_422_19 and arg_419_1.time_ < var_422_18 + var_422_19 + arg_422_0 then
				local var_422_22 = Color.New(0, 0, 0)

				var_422_22.a = 1
				arg_419_1.mask_.color = var_422_22
			end

			local var_422_23 = 2

			if var_422_23 < arg_419_1.time_ and arg_419_1.time_ <= var_422_23 + arg_422_0 then
				arg_419_1.mask_.enabled = true
				arg_419_1.mask_.raycastTarget = true

				arg_419_1:SetGaussion(false)
			end

			local var_422_24 = 2

			if var_422_23 <= arg_419_1.time_ and arg_419_1.time_ < var_422_23 + var_422_24 then
				local var_422_25 = (arg_419_1.time_ - var_422_23) / var_422_24
				local var_422_26 = Color.New(0, 0, 0)

				var_422_26.a = Mathf.Lerp(1, 0, var_422_25)
				arg_419_1.mask_.color = var_422_26
			end

			if arg_419_1.time_ >= var_422_23 + var_422_24 and arg_419_1.time_ < var_422_23 + var_422_24 + arg_422_0 then
				local var_422_27 = Color.New(0, 0, 0)
				local var_422_28 = 0

				arg_419_1.mask_.enabled = false
				var_422_27.a = var_422_28
				arg_419_1.mask_.color = var_422_27
			end

			local var_422_29 = arg_419_1.actors_["1097ui_story"].transform
			local var_422_30 = 1.96599999815226

			if var_422_30 < arg_419_1.time_ and arg_419_1.time_ <= var_422_30 + arg_422_0 then
				arg_419_1.var_.moveOldPos1097ui_story = var_422_29.localPosition
			end

			local var_422_31 = 0.001

			if var_422_30 <= arg_419_1.time_ and arg_419_1.time_ < var_422_30 + var_422_31 then
				local var_422_32 = (arg_419_1.time_ - var_422_30) / var_422_31
				local var_422_33 = Vector3.New(0, 100, 0)

				var_422_29.localPosition = Vector3.Lerp(arg_419_1.var_.moveOldPos1097ui_story, var_422_33, var_422_32)

				local var_422_34 = manager.ui.mainCamera.transform.position - var_422_29.position

				var_422_29.forward = Vector3.New(var_422_34.x, var_422_34.y, var_422_34.z)

				local var_422_35 = var_422_29.localEulerAngles

				var_422_35.z = 0
				var_422_35.x = 0
				var_422_29.localEulerAngles = var_422_35
			end

			if arg_419_1.time_ >= var_422_30 + var_422_31 and arg_419_1.time_ < var_422_30 + var_422_31 + arg_422_0 then
				var_422_29.localPosition = Vector3.New(0, 100, 0)

				local var_422_36 = manager.ui.mainCamera.transform.position - var_422_29.position

				var_422_29.forward = Vector3.New(var_422_36.x, var_422_36.y, var_422_36.z)

				local var_422_37 = var_422_29.localEulerAngles

				var_422_37.z = 0
				var_422_37.x = 0
				var_422_29.localEulerAngles = var_422_37
			end

			local var_422_38 = arg_419_1.actors_["1097ui_story"]
			local var_422_39 = 1.96599999815226

			if var_422_39 < arg_419_1.time_ and arg_419_1.time_ <= var_422_39 + arg_422_0 and arg_419_1.var_.characterEffect1097ui_story == nil then
				arg_419_1.var_.characterEffect1097ui_story = var_422_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_40 = 0.034000001847744

			if var_422_39 <= arg_419_1.time_ and arg_419_1.time_ < var_422_39 + var_422_40 then
				local var_422_41 = (arg_419_1.time_ - var_422_39) / var_422_40

				if arg_419_1.var_.characterEffect1097ui_story then
					local var_422_42 = Mathf.Lerp(0, 0.5, var_422_41)

					arg_419_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_419_1.var_.characterEffect1097ui_story.fillRatio = var_422_42
				end
			end

			if arg_419_1.time_ >= var_422_39 + var_422_40 and arg_419_1.time_ < var_422_39 + var_422_40 + arg_422_0 and arg_419_1.var_.characterEffect1097ui_story then
				local var_422_43 = 0.5

				arg_419_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_419_1.var_.characterEffect1097ui_story.fillRatio = var_422_43
			end

			local var_422_44 = arg_419_1.bgs_.R9701.transform
			local var_422_45 = 2

			if var_422_45 < arg_419_1.time_ and arg_419_1.time_ <= var_422_45 + arg_422_0 then
				arg_419_1.var_.moveOldPosR9701 = var_422_44.localPosition
			end

			local var_422_46 = 0.001

			if var_422_45 <= arg_419_1.time_ and arg_419_1.time_ < var_422_45 + var_422_46 then
				local var_422_47 = (arg_419_1.time_ - var_422_45) / var_422_46
				local var_422_48 = Vector3.New(-1, 0.7, 3.6)

				var_422_44.localPosition = Vector3.Lerp(arg_419_1.var_.moveOldPosR9701, var_422_48, var_422_47)
			end

			if arg_419_1.time_ >= var_422_45 + var_422_46 and arg_419_1.time_ < var_422_45 + var_422_46 + arg_422_0 then
				var_422_44.localPosition = Vector3.New(-1, 0.7, 3.6)
			end

			local var_422_49 = arg_419_1.bgs_.R9701.transform
			local var_422_50 = 2.01666666666667

			if var_422_50 < arg_419_1.time_ and arg_419_1.time_ <= var_422_50 + arg_422_0 then
				arg_419_1.var_.moveOldPosR9701 = var_422_49.localPosition
			end

			local var_422_51 = 3.6

			if var_422_50 <= arg_419_1.time_ and arg_419_1.time_ < var_422_50 + var_422_51 then
				local var_422_52 = (arg_419_1.time_ - var_422_50) / var_422_51
				local var_422_53 = Vector3.New(-1, 0.2, 3.6)

				var_422_49.localPosition = Vector3.Lerp(arg_419_1.var_.moveOldPosR9701, var_422_53, var_422_52)
			end

			if arg_419_1.time_ >= var_422_50 + var_422_51 and arg_419_1.time_ < var_422_50 + var_422_51 + arg_422_0 then
				var_422_49.localPosition = Vector3.New(-1, 0.2, 3.6)
			end

			local var_422_54 = 4

			if var_422_54 < arg_419_1.time_ and arg_419_1.time_ <= var_422_54 + arg_422_0 then
				arg_419_1.allBtn_.enabled = false
			end

			local var_422_55 = 1.61666666666667

			if arg_419_1.time_ >= var_422_54 + var_422_55 and arg_419_1.time_ < var_422_54 + var_422_55 + arg_422_0 then
				arg_419_1.allBtn_.enabled = true
			end

			if arg_419_1.frameCnt_ <= 1 then
				arg_419_1.dialog_:SetActive(false)
			end

			local var_422_56 = 4.00000000298023
			local var_422_57 = 0.225

			if var_422_56 < arg_419_1.time_ and arg_419_1.time_ <= var_422_56 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0

				arg_419_1.dialog_:SetActive(true)

				local var_422_58 = LeanTween.value(arg_419_1.dialog_, 0, 1, 0.3)

				var_422_58:setOnUpdate(LuaHelper.FloatAction(function(arg_423_0)
					arg_419_1.dialogCg_.alpha = arg_423_0
				end))
				var_422_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_419_1.dialog_)
					var_422_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_419_1.duration_ = arg_419_1.duration_ + 0.3

				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_59 = arg_419_1:FormatText(StoryNameCfg[7].name)

				arg_419_1.leftNameTxt_.text = var_422_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_60 = arg_419_1:GetWordFromCfg(1109704103)
				local var_422_61 = arg_419_1:FormatText(var_422_60.content)

				arg_419_1.text_.text = var_422_61

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_62 = 9
				local var_422_63 = utf8.len(var_422_61)
				local var_422_64 = var_422_62 <= 0 and var_422_57 or var_422_57 * (var_422_63 / var_422_62)

				if var_422_64 > 0 and var_422_57 < var_422_64 then
					arg_419_1.talkMaxDuration = var_422_64
					var_422_56 = var_422_56 + 0.3

					if var_422_64 + var_422_56 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_64 + var_422_56
					end
				end

				arg_419_1.text_.text = var_422_61
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)
				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_65 = var_422_56 + 0.3
			local var_422_66 = math.max(var_422_57, arg_419_1.talkMaxDuration)

			if var_422_65 <= arg_419_1.time_ and arg_419_1.time_ < var_422_65 + var_422_66 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_65) / var_422_66

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_65 + var_422_66 and arg_419_1.time_ < var_422_65 + var_422_66 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704104 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 1109704104
		arg_425_1.duration_ = 4.4

		local var_425_0 = {
			zh = 4.4,
			ja = 4.366
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
				arg_425_0:Play1109704105(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0
			local var_428_1 = 0.575

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_2 = arg_425_1:FormatText(StoryNameCfg[216].name)

				arg_425_1.leftNameTxt_.text = var_428_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_3 = arg_425_1:GetWordFromCfg(1109704104)
				local var_428_4 = arg_425_1:FormatText(var_428_3.content)

				arg_425_1.text_.text = var_428_4

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_5 = 23
				local var_428_6 = utf8.len(var_428_4)
				local var_428_7 = var_428_5 <= 0 and var_428_1 or var_428_1 * (var_428_6 / var_428_5)

				if var_428_7 > 0 and var_428_1 < var_428_7 then
					arg_425_1.talkMaxDuration = var_428_7

					if var_428_7 + var_428_0 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_7 + var_428_0
					end
				end

				arg_425_1.text_.text = var_428_4
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704104", "story_v_side_new_1109704.awb") ~= 0 then
					local var_428_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704104", "story_v_side_new_1109704.awb") / 1000

					if var_428_8 + var_428_0 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_8 + var_428_0
					end

					if var_428_3.prefab_name ~= "" and arg_425_1.actors_[var_428_3.prefab_name] ~= nil then
						local var_428_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_3.prefab_name].transform, "story_v_side_new_1109704", "1109704104", "story_v_side_new_1109704.awb")

						arg_425_1:RecordAudio("1109704104", var_428_9)
						arg_425_1:RecordAudio("1109704104", var_428_9)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704104", "story_v_side_new_1109704.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704104", "story_v_side_new_1109704.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_10 = math.max(var_428_1, arg_425_1.talkMaxDuration)

			if var_428_0 <= arg_425_1.time_ and arg_425_1.time_ < var_428_0 + var_428_10 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_0) / var_428_10

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_0 + var_428_10 and arg_425_1.time_ < var_428_0 + var_428_10 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704105 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 1109704105
		arg_429_1.duration_ = 5

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play1109704106(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1097ui_story"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.characterEffect1097ui_story == nil then
				arg_429_1.var_.characterEffect1097ui_story = var_432_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_2 = 0.200000002980232

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.characterEffect1097ui_story then
					local var_432_4 = Mathf.Lerp(0, 0.5, var_432_3)

					arg_429_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_429_1.var_.characterEffect1097ui_story.fillRatio = var_432_4
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.characterEffect1097ui_story then
				local var_432_5 = 0.5

				arg_429_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_429_1.var_.characterEffect1097ui_story.fillRatio = var_432_5
			end

			local var_432_6 = 0
			local var_432_7 = 0.8

			if var_432_6 < arg_429_1.time_ and arg_429_1.time_ <= var_432_6 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_8 = arg_429_1:FormatText(StoryNameCfg[7].name)

				arg_429_1.leftNameTxt_.text = var_432_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_9 = arg_429_1:GetWordFromCfg(1109704105)
				local var_432_10 = arg_429_1:FormatText(var_432_9.content)

				arg_429_1.text_.text = var_432_10

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_11 = 32
				local var_432_12 = utf8.len(var_432_10)
				local var_432_13 = var_432_11 <= 0 and var_432_7 or var_432_7 * (var_432_12 / var_432_11)

				if var_432_13 > 0 and var_432_7 < var_432_13 then
					arg_429_1.talkMaxDuration = var_432_13

					if var_432_13 + var_432_6 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_13 + var_432_6
					end
				end

				arg_429_1.text_.text = var_432_10
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_14 = math.max(var_432_7, arg_429_1.talkMaxDuration)

			if var_432_6 <= arg_429_1.time_ and arg_429_1.time_ < var_432_6 + var_432_14 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_6) / var_432_14

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_6 + var_432_14 and arg_429_1.time_ < var_432_6 + var_432_14 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704106 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 1109704106
		arg_433_1.duration_ = 4.133

		local var_433_0 = {
			zh = 3.466,
			ja = 4.133
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
				arg_433_0:Play1109704107(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = 0
			local var_436_1 = 0.475

			if var_436_0 < arg_433_1.time_ and arg_433_1.time_ <= var_436_0 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_2 = arg_433_1:FormatText(StoryNameCfg[216].name)

				arg_433_1.leftNameTxt_.text = var_436_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_3 = arg_433_1:GetWordFromCfg(1109704106)
				local var_436_4 = arg_433_1:FormatText(var_436_3.content)

				arg_433_1.text_.text = var_436_4

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_5 = 19
				local var_436_6 = utf8.len(var_436_4)
				local var_436_7 = var_436_5 <= 0 and var_436_1 or var_436_1 * (var_436_6 / var_436_5)

				if var_436_7 > 0 and var_436_1 < var_436_7 then
					arg_433_1.talkMaxDuration = var_436_7

					if var_436_7 + var_436_0 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_7 + var_436_0
					end
				end

				arg_433_1.text_.text = var_436_4
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704106", "story_v_side_new_1109704.awb") ~= 0 then
					local var_436_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704106", "story_v_side_new_1109704.awb") / 1000

					if var_436_8 + var_436_0 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_8 + var_436_0
					end

					if var_436_3.prefab_name ~= "" and arg_433_1.actors_[var_436_3.prefab_name] ~= nil then
						local var_436_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_3.prefab_name].transform, "story_v_side_new_1109704", "1109704106", "story_v_side_new_1109704.awb")

						arg_433_1:RecordAudio("1109704106", var_436_9)
						arg_433_1:RecordAudio("1109704106", var_436_9)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704106", "story_v_side_new_1109704.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704106", "story_v_side_new_1109704.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_10 = math.max(var_436_1, arg_433_1.talkMaxDuration)

			if var_436_0 <= arg_433_1.time_ and arg_433_1.time_ < var_436_0 + var_436_10 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_0) / var_436_10

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_0 + var_436_10 and arg_433_1.time_ < var_436_0 + var_436_10 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704107 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 1109704107
		arg_437_1.duration_ = 5

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play1109704108(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0
			local var_440_1 = 0.65

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_2 = arg_437_1:FormatText(StoryNameCfg[7].name)

				arg_437_1.leftNameTxt_.text = var_440_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_3 = arg_437_1:GetWordFromCfg(1109704107)
				local var_440_4 = arg_437_1:FormatText(var_440_3.content)

				arg_437_1.text_.text = var_440_4

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_5 = 26
				local var_440_6 = utf8.len(var_440_4)
				local var_440_7 = var_440_5 <= 0 and var_440_1 or var_440_1 * (var_440_6 / var_440_5)

				if var_440_7 > 0 and var_440_1 < var_440_7 then
					arg_437_1.talkMaxDuration = var_440_7

					if var_440_7 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_7 + var_440_0
					end
				end

				arg_437_1.text_.text = var_440_4
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)
				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_8 = math.max(var_440_1, arg_437_1.talkMaxDuration)

			if var_440_0 <= arg_437_1.time_ and arg_437_1.time_ < var_440_0 + var_440_8 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_0) / var_440_8

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_0 + var_440_8 and arg_437_1.time_ < var_440_0 + var_440_8 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704108 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 1109704108
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play1109704109(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 0
			local var_444_1 = 0.675

			if var_444_0 < arg_441_1.time_ and arg_441_1.time_ <= var_444_0 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, false)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_2 = arg_441_1:GetWordFromCfg(1109704108)
				local var_444_3 = arg_441_1:FormatText(var_444_2.content)

				arg_441_1.text_.text = var_444_3

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_4 = 27
				local var_444_5 = utf8.len(var_444_3)
				local var_444_6 = var_444_4 <= 0 and var_444_1 or var_444_1 * (var_444_5 / var_444_4)

				if var_444_6 > 0 and var_444_1 < var_444_6 then
					arg_441_1.talkMaxDuration = var_444_6

					if var_444_6 + var_444_0 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_6 + var_444_0
					end
				end

				arg_441_1.text_.text = var_444_3
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)
				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_7 = math.max(var_444_1, arg_441_1.talkMaxDuration)

			if var_444_0 <= arg_441_1.time_ and arg_441_1.time_ < var_444_0 + var_444_7 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_0) / var_444_7

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_0 + var_444_7 and arg_441_1.time_ < var_444_0 + var_444_7 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704109 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 1109704109
		arg_445_1.duration_ = 3.4

		local var_445_0 = {
			zh = 1.2,
			ja = 3.4
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
				arg_445_0:Play1109704110(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = 0
			local var_448_1 = 0.05

			if var_448_0 < arg_445_1.time_ and arg_445_1.time_ <= var_448_0 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_2 = arg_445_1:FormatText(StoryNameCfg[216].name)

				arg_445_1.leftNameTxt_.text = var_448_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_3 = arg_445_1:GetWordFromCfg(1109704109)
				local var_448_4 = arg_445_1:FormatText(var_448_3.content)

				arg_445_1.text_.text = var_448_4

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_5 = 2
				local var_448_6 = utf8.len(var_448_4)
				local var_448_7 = var_448_5 <= 0 and var_448_1 or var_448_1 * (var_448_6 / var_448_5)

				if var_448_7 > 0 and var_448_1 < var_448_7 then
					arg_445_1.talkMaxDuration = var_448_7

					if var_448_7 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_7 + var_448_0
					end
				end

				arg_445_1.text_.text = var_448_4
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704109", "story_v_side_new_1109704.awb") ~= 0 then
					local var_448_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704109", "story_v_side_new_1109704.awb") / 1000

					if var_448_8 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_8 + var_448_0
					end

					if var_448_3.prefab_name ~= "" and arg_445_1.actors_[var_448_3.prefab_name] ~= nil then
						local var_448_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_3.prefab_name].transform, "story_v_side_new_1109704", "1109704109", "story_v_side_new_1109704.awb")

						arg_445_1:RecordAudio("1109704109", var_448_9)
						arg_445_1:RecordAudio("1109704109", var_448_9)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704109", "story_v_side_new_1109704.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704109", "story_v_side_new_1109704.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_10 = math.max(var_448_1, arg_445_1.talkMaxDuration)

			if var_448_0 <= arg_445_1.time_ and arg_445_1.time_ < var_448_0 + var_448_10 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_0) / var_448_10

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_0 + var_448_10 and arg_445_1.time_ < var_448_0 + var_448_10 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704110 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 1109704110
		arg_449_1.duration_ = 5

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play1109704111(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["1097ui_story"]
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 and arg_449_1.var_.characterEffect1097ui_story == nil then
				arg_449_1.var_.characterEffect1097ui_story = var_452_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_2 = 0.200000002980232

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_2 then
				local var_452_3 = (arg_449_1.time_ - var_452_1) / var_452_2

				if arg_449_1.var_.characterEffect1097ui_story then
					local var_452_4 = Mathf.Lerp(0, 0.5, var_452_3)

					arg_449_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_449_1.var_.characterEffect1097ui_story.fillRatio = var_452_4
				end
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 and arg_449_1.var_.characterEffect1097ui_story then
				local var_452_5 = 0.5

				arg_449_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_449_1.var_.characterEffect1097ui_story.fillRatio = var_452_5
			end

			local var_452_6 = 0
			local var_452_7 = 0.175

			if var_452_6 < arg_449_1.time_ and arg_449_1.time_ <= var_452_6 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_8 = arg_449_1:FormatText(StoryNameCfg[7].name)

				arg_449_1.leftNameTxt_.text = var_452_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_9 = arg_449_1:GetWordFromCfg(1109704110)
				local var_452_10 = arg_449_1:FormatText(var_452_9.content)

				arg_449_1.text_.text = var_452_10

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_11 = 7
				local var_452_12 = utf8.len(var_452_10)
				local var_452_13 = var_452_11 <= 0 and var_452_7 or var_452_7 * (var_452_12 / var_452_11)

				if var_452_13 > 0 and var_452_7 < var_452_13 then
					arg_449_1.talkMaxDuration = var_452_13

					if var_452_13 + var_452_6 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_13 + var_452_6
					end
				end

				arg_449_1.text_.text = var_452_10
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_14 = math.max(var_452_7, arg_449_1.talkMaxDuration)

			if var_452_6 <= arg_449_1.time_ and arg_449_1.time_ < var_452_6 + var_452_14 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_6) / var_452_14

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_6 + var_452_14 and arg_449_1.time_ < var_452_6 + var_452_14 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704111 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 1109704111
		arg_453_1.duration_ = 2.600000666666

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play1109704112(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.bgs_.R9701.transform
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 then
				arg_453_1.var_.moveOldPosR9701 = var_456_0.localPosition
			end

			local var_456_2 = 0.001

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2
				local var_456_4 = Vector3.New(-1.5, -1.5, 1)

				var_456_0.localPosition = Vector3.Lerp(arg_453_1.var_.moveOldPosR9701, var_456_4, var_456_3)
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 then
				var_456_0.localPosition = Vector3.New(-1.5, -1.5, 1)
			end

			local var_456_5 = arg_453_1.bgs_.R9701.transform
			local var_456_6 = 0.0166666666666666

			if var_456_6 < arg_453_1.time_ and arg_453_1.time_ <= var_456_6 + arg_456_0 then
				arg_453_1.var_.moveOldPosR9701 = var_456_5.localPosition
			end

			local var_456_7 = 2.583334

			if var_456_6 <= arg_453_1.time_ and arg_453_1.time_ < var_456_6 + var_456_7 then
				local var_456_8 = (arg_453_1.time_ - var_456_6) / var_456_7
				local var_456_9 = Vector3.New(-1.5, -1.5, 0.5)

				var_456_5.localPosition = Vector3.Lerp(arg_453_1.var_.moveOldPosR9701, var_456_9, var_456_8)
			end

			if arg_453_1.time_ >= var_456_6 + var_456_7 and arg_453_1.time_ < var_456_6 + var_456_7 + arg_456_0 then
				var_456_5.localPosition = Vector3.New(-1.5, -1.5, 0.5)
			end

			local var_456_10 = 0

			if var_456_10 < arg_453_1.time_ and arg_453_1.time_ <= var_456_10 + arg_456_0 then
				arg_453_1.mask_.enabled = true
				arg_453_1.mask_.raycastTarget = true

				arg_453_1:SetGaussion(false)
			end

			local var_456_11 = 0.5

			if var_456_10 <= arg_453_1.time_ and arg_453_1.time_ < var_456_10 + var_456_11 then
				local var_456_12 = (arg_453_1.time_ - var_456_10) / var_456_11
				local var_456_13 = Color.New(0, 0, 0)

				var_456_13.a = Mathf.Lerp(0, 1, var_456_12)
				arg_453_1.mask_.color = var_456_13
			end

			if arg_453_1.time_ >= var_456_10 + var_456_11 and arg_453_1.time_ < var_456_10 + var_456_11 + arg_456_0 then
				local var_456_14 = Color.New(0, 0, 0)

				var_456_14.a = 1
				arg_453_1.mask_.color = var_456_14
			end

			local var_456_15 = 0.5

			if var_456_15 < arg_453_1.time_ and arg_453_1.time_ <= var_456_15 + arg_456_0 then
				arg_453_1.mask_.enabled = true
				arg_453_1.mask_.raycastTarget = true

				arg_453_1:SetGaussion(false)
			end

			local var_456_16 = 0.5

			if var_456_15 <= arg_453_1.time_ and arg_453_1.time_ < var_456_15 + var_456_16 then
				local var_456_17 = (arg_453_1.time_ - var_456_15) / var_456_16
				local var_456_18 = Color.New(0, 0, 0)

				var_456_18.a = Mathf.Lerp(1, 0, var_456_17)
				arg_453_1.mask_.color = var_456_18
			end

			if arg_453_1.time_ >= var_456_15 + var_456_16 and arg_453_1.time_ < var_456_15 + var_456_16 + arg_456_0 then
				local var_456_19 = Color.New(0, 0, 0)
				local var_456_20 = 0

				arg_453_1.mask_.enabled = false
				var_456_19.a = var_456_20
				arg_453_1.mask_.color = var_456_19
			end

			local var_456_21 = 1

			if var_456_21 < arg_453_1.time_ and arg_453_1.time_ <= var_456_21 + arg_456_0 then
				arg_453_1.allBtn_.enabled = false
			end

			local var_456_22 = 1.60000066666667

			if arg_453_1.time_ >= var_456_21 + var_456_22 and arg_453_1.time_ < var_456_21 + var_456_22 + arg_456_0 then
				arg_453_1.allBtn_.enabled = true
			end

			local var_456_23 = 0.9
			local var_456_24 = 0.1

			if var_456_23 < arg_453_1.time_ and arg_453_1.time_ <= var_456_23 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_25 = arg_453_1:FormatText(StoryNameCfg[216].name)

				arg_453_1.leftNameTxt_.text = var_456_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_26 = arg_453_1:GetWordFromCfg(1109704111)
				local var_456_27 = arg_453_1:FormatText(var_456_26.content)

				arg_453_1.text_.text = var_456_27

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_28 = 4
				local var_456_29 = utf8.len(var_456_27)
				local var_456_30 = var_456_28 <= 0 and var_456_24 or var_456_24 * (var_456_29 / var_456_28)

				if var_456_30 > 0 and var_456_24 < var_456_30 then
					arg_453_1.talkMaxDuration = var_456_30

					if var_456_30 + var_456_23 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_30 + var_456_23
					end
				end

				arg_453_1.text_.text = var_456_27
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704111", "story_v_side_new_1109704.awb") ~= 0 then
					local var_456_31 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704111", "story_v_side_new_1109704.awb") / 1000

					if var_456_31 + var_456_23 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_31 + var_456_23
					end

					if var_456_26.prefab_name ~= "" and arg_453_1.actors_[var_456_26.prefab_name] ~= nil then
						local var_456_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_26.prefab_name].transform, "story_v_side_new_1109704", "1109704111", "story_v_side_new_1109704.awb")

						arg_453_1:RecordAudio("1109704111", var_456_32)
						arg_453_1:RecordAudio("1109704111", var_456_32)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704111", "story_v_side_new_1109704.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704111", "story_v_side_new_1109704.awb")
				end

				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_33 = math.max(var_456_24, arg_453_1.talkMaxDuration)

			if var_456_23 <= arg_453_1.time_ and arg_453_1.time_ < var_456_23 + var_456_33 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_23) / var_456_33

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_23 + var_456_33 and arg_453_1.time_ < var_456_23 + var_456_33 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704112 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 1109704112
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play1109704113(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = 0
			local var_460_1 = 0.9

			if var_460_0 < arg_457_1.time_ and arg_457_1.time_ <= var_460_0 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, false)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_2 = arg_457_1:GetWordFromCfg(1109704112)
				local var_460_3 = arg_457_1:FormatText(var_460_2.content)

				arg_457_1.text_.text = var_460_3

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_4 = 36
				local var_460_5 = utf8.len(var_460_3)
				local var_460_6 = var_460_4 <= 0 and var_460_1 or var_460_1 * (var_460_5 / var_460_4)

				if var_460_6 > 0 and var_460_1 < var_460_6 then
					arg_457_1.talkMaxDuration = var_460_6

					if var_460_6 + var_460_0 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_6 + var_460_0
					end
				end

				arg_457_1.text_.text = var_460_3
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_7 = math.max(var_460_1, arg_457_1.talkMaxDuration)

			if var_460_0 <= arg_457_1.time_ and arg_457_1.time_ < var_460_0 + var_460_7 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_0) / var_460_7

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_0 + var_460_7 and arg_457_1.time_ < var_460_0 + var_460_7 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704113 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 1109704113
		arg_461_1.duration_ = 5

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play1109704114(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = 0
			local var_464_1 = 0.15

			if var_464_0 < arg_461_1.time_ and arg_461_1.time_ <= var_464_0 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_2 = arg_461_1:FormatText(StoryNameCfg[7].name)

				arg_461_1.leftNameTxt_.text = var_464_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_3 = arg_461_1:GetWordFromCfg(1109704113)
				local var_464_4 = arg_461_1:FormatText(var_464_3.content)

				arg_461_1.text_.text = var_464_4

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_5 = 6
				local var_464_6 = utf8.len(var_464_4)
				local var_464_7 = var_464_5 <= 0 and var_464_1 or var_464_1 * (var_464_6 / var_464_5)

				if var_464_7 > 0 and var_464_1 < var_464_7 then
					arg_461_1.talkMaxDuration = var_464_7

					if var_464_7 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_7 + var_464_0
					end
				end

				arg_461_1.text_.text = var_464_4
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)
				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_8 = math.max(var_464_1, arg_461_1.talkMaxDuration)

			if var_464_0 <= arg_461_1.time_ and arg_461_1.time_ < var_464_0 + var_464_8 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_0) / var_464_8

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_0 + var_464_8 and arg_461_1.time_ < var_464_0 + var_464_8 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704114 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 1109704114
		arg_465_1.duration_ = 5

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play1109704115(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = 0
			local var_468_1 = 0.75

			if var_468_0 < arg_465_1.time_ and arg_465_1.time_ <= var_468_0 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, false)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_2 = arg_465_1:GetWordFromCfg(1109704114)
				local var_468_3 = arg_465_1:FormatText(var_468_2.content)

				arg_465_1.text_.text = var_468_3

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_4 = 30
				local var_468_5 = utf8.len(var_468_3)
				local var_468_6 = var_468_4 <= 0 and var_468_1 or var_468_1 * (var_468_5 / var_468_4)

				if var_468_6 > 0 and var_468_1 < var_468_6 then
					arg_465_1.talkMaxDuration = var_468_6

					if var_468_6 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_6 + var_468_0
					end
				end

				arg_465_1.text_.text = var_468_3
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)
				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_7 = math.max(var_468_1, arg_465_1.talkMaxDuration)

			if var_468_0 <= arg_465_1.time_ and arg_465_1.time_ < var_468_0 + var_468_7 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_0) / var_468_7

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_0 + var_468_7 and arg_465_1.time_ < var_468_0 + var_468_7 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704115 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 1109704115
		arg_469_1.duration_ = 3.966

		local var_469_0 = {
			zh = 3.966,
			ja = 2.533
		}
		local var_469_1 = manager.audio:GetLocalizationFlag()

		if var_469_0[var_469_1] ~= nil then
			arg_469_1.duration_ = var_469_0[var_469_1]
		end

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play1109704116(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = 0
			local var_472_1 = 0.525

			if var_472_0 < arg_469_1.time_ and arg_469_1.time_ <= var_472_0 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_2 = arg_469_1:FormatText(StoryNameCfg[216].name)

				arg_469_1.leftNameTxt_.text = var_472_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_3 = arg_469_1:GetWordFromCfg(1109704115)
				local var_472_4 = arg_469_1:FormatText(var_472_3.content)

				arg_469_1.text_.text = var_472_4

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_5 = 21
				local var_472_6 = utf8.len(var_472_4)
				local var_472_7 = var_472_5 <= 0 and var_472_1 or var_472_1 * (var_472_6 / var_472_5)

				if var_472_7 > 0 and var_472_1 < var_472_7 then
					arg_469_1.talkMaxDuration = var_472_7

					if var_472_7 + var_472_0 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_7 + var_472_0
					end
				end

				arg_469_1.text_.text = var_472_4
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704115", "story_v_side_new_1109704.awb") ~= 0 then
					local var_472_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704115", "story_v_side_new_1109704.awb") / 1000

					if var_472_8 + var_472_0 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_8 + var_472_0
					end

					if var_472_3.prefab_name ~= "" and arg_469_1.actors_[var_472_3.prefab_name] ~= nil then
						local var_472_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_3.prefab_name].transform, "story_v_side_new_1109704", "1109704115", "story_v_side_new_1109704.awb")

						arg_469_1:RecordAudio("1109704115", var_472_9)
						arg_469_1:RecordAudio("1109704115", var_472_9)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704115", "story_v_side_new_1109704.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704115", "story_v_side_new_1109704.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_10 = math.max(var_472_1, arg_469_1.talkMaxDuration)

			if var_472_0 <= arg_469_1.time_ and arg_469_1.time_ < var_472_0 + var_472_10 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_0) / var_472_10

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_0 + var_472_10 and arg_469_1.time_ < var_472_0 + var_472_10 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704116 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 1109704116
		arg_473_1.duration_ = 5

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play1109704117(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["1097ui_story"]
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 and arg_473_1.var_.characterEffect1097ui_story == nil then
				arg_473_1.var_.characterEffect1097ui_story = var_476_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_2 = 0.200000002980232

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2

				if arg_473_1.var_.characterEffect1097ui_story then
					local var_476_4 = Mathf.Lerp(0, 0.5, var_476_3)

					arg_473_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_473_1.var_.characterEffect1097ui_story.fillRatio = var_476_4
				end
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 and arg_473_1.var_.characterEffect1097ui_story then
				local var_476_5 = 0.5

				arg_473_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_473_1.var_.characterEffect1097ui_story.fillRatio = var_476_5
			end

			local var_476_6 = 0
			local var_476_7 = 0.125

			if var_476_6 < arg_473_1.time_ and arg_473_1.time_ <= var_476_6 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_8 = arg_473_1:FormatText(StoryNameCfg[7].name)

				arg_473_1.leftNameTxt_.text = var_476_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_9 = arg_473_1:GetWordFromCfg(1109704116)
				local var_476_10 = arg_473_1:FormatText(var_476_9.content)

				arg_473_1.text_.text = var_476_10

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_11 = 5
				local var_476_12 = utf8.len(var_476_10)
				local var_476_13 = var_476_11 <= 0 and var_476_7 or var_476_7 * (var_476_12 / var_476_11)

				if var_476_13 > 0 and var_476_7 < var_476_13 then
					arg_473_1.talkMaxDuration = var_476_13

					if var_476_13 + var_476_6 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_13 + var_476_6
					end
				end

				arg_473_1.text_.text = var_476_10
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)
				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_14 = math.max(var_476_7, arg_473_1.talkMaxDuration)

			if var_476_6 <= arg_473_1.time_ and arg_473_1.time_ < var_476_6 + var_476_14 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_6) / var_476_14

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_6 + var_476_14 and arg_473_1.time_ < var_476_6 + var_476_14 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704117 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 1109704117
		arg_477_1.duration_ = 5

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play1109704118(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0
			local var_480_1 = 0.925

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, false)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_2 = arg_477_1:GetWordFromCfg(1109704117)
				local var_480_3 = arg_477_1:FormatText(var_480_2.content)

				arg_477_1.text_.text = var_480_3

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_4 = 37
				local var_480_5 = utf8.len(var_480_3)
				local var_480_6 = var_480_4 <= 0 and var_480_1 or var_480_1 * (var_480_5 / var_480_4)

				if var_480_6 > 0 and var_480_1 < var_480_6 then
					arg_477_1.talkMaxDuration = var_480_6

					if var_480_6 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_6 + var_480_0
					end
				end

				arg_477_1.text_.text = var_480_3
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)
				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_7 = math.max(var_480_1, arg_477_1.talkMaxDuration)

			if var_480_0 <= arg_477_1.time_ and arg_477_1.time_ < var_480_0 + var_480_7 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_0) / var_480_7

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_0 + var_480_7 and arg_477_1.time_ < var_480_0 + var_480_7 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704118 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 1109704118
		arg_481_1.duration_ = 5

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play1109704119(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 0
			local var_484_1 = 0.55

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, false)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_2 = arg_481_1:GetWordFromCfg(1109704118)
				local var_484_3 = arg_481_1:FormatText(var_484_2.content)

				arg_481_1.text_.text = var_484_3

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_4 = 22
				local var_484_5 = utf8.len(var_484_3)
				local var_484_6 = var_484_4 <= 0 and var_484_1 or var_484_1 * (var_484_5 / var_484_4)

				if var_484_6 > 0 and var_484_1 < var_484_6 then
					arg_481_1.talkMaxDuration = var_484_6

					if var_484_6 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_6 + var_484_0
					end
				end

				arg_481_1.text_.text = var_484_3
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)
				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_7 = math.max(var_484_1, arg_481_1.talkMaxDuration)

			if var_484_0 <= arg_481_1.time_ and arg_481_1.time_ < var_484_0 + var_484_7 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_0) / var_484_7

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_0 + var_484_7 and arg_481_1.time_ < var_484_0 + var_484_7 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704119 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 1109704119
		arg_485_1.duration_ = 9

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play1109704120(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 2

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				local var_488_1 = manager.ui.mainCamera.transform.localPosition
				local var_488_2 = Vector3.New(0, 0, 10) + Vector3.New(var_488_1.x, var_488_1.y, 0)
				local var_488_3 = arg_485_1.bgs_.ST60

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
					if iter_488_0 ~= "ST60" then
						iter_488_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_488_14 = 4

			if var_488_14 < arg_485_1.time_ and arg_485_1.time_ <= var_488_14 + arg_488_0 then
				arg_485_1.allBtn_.enabled = false
			end

			local var_488_15 = 0.3

			if arg_485_1.time_ >= var_488_14 + var_488_15 and arg_485_1.time_ < var_488_14 + var_488_15 + arg_488_0 then
				arg_485_1.allBtn_.enabled = true
			end

			local var_488_16 = 0

			if var_488_16 < arg_485_1.time_ and arg_485_1.time_ <= var_488_16 + arg_488_0 then
				arg_485_1.mask_.enabled = true
				arg_485_1.mask_.raycastTarget = true

				arg_485_1:SetGaussion(false)
			end

			local var_488_17 = 2

			if var_488_16 <= arg_485_1.time_ and arg_485_1.time_ < var_488_16 + var_488_17 then
				local var_488_18 = (arg_485_1.time_ - var_488_16) / var_488_17
				local var_488_19 = Color.New(1, 1, 1)

				var_488_19.a = Mathf.Lerp(0, 1, var_488_18)
				arg_485_1.mask_.color = var_488_19
			end

			if arg_485_1.time_ >= var_488_16 + var_488_17 and arg_485_1.time_ < var_488_16 + var_488_17 + arg_488_0 then
				local var_488_20 = Color.New(1, 1, 1)

				var_488_20.a = 1
				arg_485_1.mask_.color = var_488_20
			end

			local var_488_21 = 2

			if var_488_21 < arg_485_1.time_ and arg_485_1.time_ <= var_488_21 + arg_488_0 then
				arg_485_1.mask_.enabled = true
				arg_485_1.mask_.raycastTarget = true

				arg_485_1:SetGaussion(false)
			end

			local var_488_22 = 2

			if var_488_21 <= arg_485_1.time_ and arg_485_1.time_ < var_488_21 + var_488_22 then
				local var_488_23 = (arg_485_1.time_ - var_488_21) / var_488_22
				local var_488_24 = Color.New(1, 1, 1)

				var_488_24.a = Mathf.Lerp(1, 0, var_488_23)
				arg_485_1.mask_.color = var_488_24
			end

			if arg_485_1.time_ >= var_488_21 + var_488_22 and arg_485_1.time_ < var_488_21 + var_488_22 + arg_488_0 then
				local var_488_25 = Color.New(1, 1, 1)
				local var_488_26 = 0

				arg_485_1.mask_.enabled = false
				var_488_25.a = var_488_26
				arg_485_1.mask_.color = var_488_25
			end

			if arg_485_1.frameCnt_ <= 1 then
				arg_485_1.dialog_:SetActive(false)
			end

			local var_488_27 = 4
			local var_488_28 = 0.6

			if var_488_27 < arg_485_1.time_ and arg_485_1.time_ <= var_488_27 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0

				arg_485_1.dialog_:SetActive(true)

				local var_488_29 = LeanTween.value(arg_485_1.dialog_, 0, 1, 0.3)

				var_488_29:setOnUpdate(LuaHelper.FloatAction(function(arg_489_0)
					arg_485_1.dialogCg_.alpha = arg_489_0
				end))
				var_488_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_485_1.dialog_)
					var_488_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_485_1.duration_ = arg_485_1.duration_ + 0.3

				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_30 = arg_485_1:FormatText(StoryNameCfg[7].name)

				arg_485_1.leftNameTxt_.text = var_488_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_31 = arg_485_1:GetWordFromCfg(1109704119)
				local var_488_32 = arg_485_1:FormatText(var_488_31.content)

				arg_485_1.text_.text = var_488_32

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_33 = 24
				local var_488_34 = utf8.len(var_488_32)
				local var_488_35 = var_488_33 <= 0 and var_488_28 or var_488_28 * (var_488_34 / var_488_33)

				if var_488_35 > 0 and var_488_28 < var_488_35 then
					arg_485_1.talkMaxDuration = var_488_35
					var_488_27 = var_488_27 + 0.3

					if var_488_35 + var_488_27 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_35 + var_488_27
					end
				end

				arg_485_1.text_.text = var_488_32
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)
				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_36 = var_488_27 + 0.3
			local var_488_37 = math.max(var_488_28, arg_485_1.talkMaxDuration)

			if var_488_36 <= arg_485_1.time_ and arg_485_1.time_ < var_488_36 + var_488_37 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_36) / var_488_37

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_36 + var_488_37 and arg_485_1.time_ < var_488_36 + var_488_37 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704120 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 1109704120
		arg_491_1.duration_ = 4.4

		local var_491_0 = {
			zh = 4.366,
			ja = 4.4
		}
		local var_491_1 = manager.audio:GetLocalizationFlag()

		if var_491_0[var_491_1] ~= nil then
			arg_491_1.duration_ = var_491_0[var_491_1]
		end

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play1109704121(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1097ui_story"].transform
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 then
				arg_491_1.var_.moveOldPos1097ui_story = var_494_0.localPosition
			end

			local var_494_2 = 0.001

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2
				local var_494_4 = Vector3.New(0, -0.54, -6.3)

				var_494_0.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPos1097ui_story, var_494_4, var_494_3)

				local var_494_5 = manager.ui.mainCamera.transform.position - var_494_0.position

				var_494_0.forward = Vector3.New(var_494_5.x, var_494_5.y, var_494_5.z)

				local var_494_6 = var_494_0.localEulerAngles

				var_494_6.z = 0
				var_494_6.x = 0
				var_494_0.localEulerAngles = var_494_6
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 then
				var_494_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_494_7 = manager.ui.mainCamera.transform.position - var_494_0.position

				var_494_0.forward = Vector3.New(var_494_7.x, var_494_7.y, var_494_7.z)

				local var_494_8 = var_494_0.localEulerAngles

				var_494_8.z = 0
				var_494_8.x = 0
				var_494_0.localEulerAngles = var_494_8
			end

			local var_494_9 = arg_491_1.actors_["1097ui_story"]
			local var_494_10 = 0

			if var_494_10 < arg_491_1.time_ and arg_491_1.time_ <= var_494_10 + arg_494_0 and arg_491_1.var_.characterEffect1097ui_story == nil then
				arg_491_1.var_.characterEffect1097ui_story = var_494_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_11 = 0.200000002980232

			if var_494_10 <= arg_491_1.time_ and arg_491_1.time_ < var_494_10 + var_494_11 then
				local var_494_12 = (arg_491_1.time_ - var_494_10) / var_494_11

				if arg_491_1.var_.characterEffect1097ui_story then
					arg_491_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_491_1.time_ >= var_494_10 + var_494_11 and arg_491_1.time_ < var_494_10 + var_494_11 + arg_494_0 and arg_491_1.var_.characterEffect1097ui_story then
				arg_491_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_494_13 = 0

			if var_494_13 < arg_491_1.time_ and arg_491_1.time_ <= var_494_13 + arg_494_0 then
				arg_491_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_494_14 = 0

			if var_494_14 < arg_491_1.time_ and arg_491_1.time_ <= var_494_14 + arg_494_0 then
				arg_491_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_494_15 = 0
			local var_494_16 = 0.6

			if var_494_15 < arg_491_1.time_ and arg_491_1.time_ <= var_494_15 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_17 = arg_491_1:FormatText(StoryNameCfg[216].name)

				arg_491_1.leftNameTxt_.text = var_494_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_18 = arg_491_1:GetWordFromCfg(1109704120)
				local var_494_19 = arg_491_1:FormatText(var_494_18.content)

				arg_491_1.text_.text = var_494_19

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_20 = 24
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704120", "story_v_side_new_1109704.awb") ~= 0 then
					local var_494_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704120", "story_v_side_new_1109704.awb") / 1000

					if var_494_23 + var_494_15 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_23 + var_494_15
					end

					if var_494_18.prefab_name ~= "" and arg_491_1.actors_[var_494_18.prefab_name] ~= nil then
						local var_494_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_18.prefab_name].transform, "story_v_side_new_1109704", "1109704120", "story_v_side_new_1109704.awb")

						arg_491_1:RecordAudio("1109704120", var_494_24)
						arg_491_1:RecordAudio("1109704120", var_494_24)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704120", "story_v_side_new_1109704.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704120", "story_v_side_new_1109704.awb")
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
	Play1109704121 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 1109704121
		arg_495_1.duration_ = 5

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play1109704122(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1097ui_story"]
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 and arg_495_1.var_.characterEffect1097ui_story == nil then
				arg_495_1.var_.characterEffect1097ui_story = var_498_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_2 = 0.200000002980232

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2

				if arg_495_1.var_.characterEffect1097ui_story then
					local var_498_4 = Mathf.Lerp(0, 0.5, var_498_3)

					arg_495_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_495_1.var_.characterEffect1097ui_story.fillRatio = var_498_4
				end
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1097ui_story then
				local var_498_5 = 0.5

				arg_495_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_495_1.var_.characterEffect1097ui_story.fillRatio = var_498_5
			end

			local var_498_6 = 0
			local var_498_7 = 0.25

			if var_498_6 < arg_495_1.time_ and arg_495_1.time_ <= var_498_6 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_8 = arg_495_1:FormatText(StoryNameCfg[7].name)

				arg_495_1.leftNameTxt_.text = var_498_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_9 = arg_495_1:GetWordFromCfg(1109704121)
				local var_498_10 = arg_495_1:FormatText(var_498_9.content)

				arg_495_1.text_.text = var_498_10

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_11 = 10
				local var_498_12 = utf8.len(var_498_10)
				local var_498_13 = var_498_11 <= 0 and var_498_7 or var_498_7 * (var_498_12 / var_498_11)

				if var_498_13 > 0 and var_498_7 < var_498_13 then
					arg_495_1.talkMaxDuration = var_498_13

					if var_498_13 + var_498_6 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_13 + var_498_6
					end
				end

				arg_495_1.text_.text = var_498_10
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)
				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_14 = math.max(var_498_7, arg_495_1.talkMaxDuration)

			if var_498_6 <= arg_495_1.time_ and arg_495_1.time_ < var_498_6 + var_498_14 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_6) / var_498_14

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_6 + var_498_14 and arg_495_1.time_ < var_498_6 + var_498_14 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704122 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 1109704122
		arg_499_1.duration_ = 2.833

		local var_499_0 = {
			zh = 2.333,
			ja = 2.833
		}
		local var_499_1 = manager.audio:GetLocalizationFlag()

		if var_499_0[var_499_1] ~= nil then
			arg_499_1.duration_ = var_499_0[var_499_1]
		end

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play1109704123(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = 0
			local var_502_1 = 0.25

			if var_502_0 < arg_499_1.time_ and arg_499_1.time_ <= var_502_0 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_2 = arg_499_1:FormatText(StoryNameCfg[36].name)

				arg_499_1.leftNameTxt_.text = var_502_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, true)
				arg_499_1.iconController_:SetSelectedState("hero")

				arg_499_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2070")

				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_3 = arg_499_1:GetWordFromCfg(1109704122)
				local var_502_4 = arg_499_1:FormatText(var_502_3.content)

				arg_499_1.text_.text = var_502_4

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_5 = 10
				local var_502_6 = utf8.len(var_502_4)
				local var_502_7 = var_502_5 <= 0 and var_502_1 or var_502_1 * (var_502_6 / var_502_5)

				if var_502_7 > 0 and var_502_1 < var_502_7 then
					arg_499_1.talkMaxDuration = var_502_7

					if var_502_7 + var_502_0 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_7 + var_502_0
					end
				end

				arg_499_1.text_.text = var_502_4
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704122", "story_v_side_new_1109704.awb") ~= 0 then
					local var_502_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704122", "story_v_side_new_1109704.awb") / 1000

					if var_502_8 + var_502_0 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_8 + var_502_0
					end

					if var_502_3.prefab_name ~= "" and arg_499_1.actors_[var_502_3.prefab_name] ~= nil then
						local var_502_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_3.prefab_name].transform, "story_v_side_new_1109704", "1109704122", "story_v_side_new_1109704.awb")

						arg_499_1:RecordAudio("1109704122", var_502_9)
						arg_499_1:RecordAudio("1109704122", var_502_9)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704122", "story_v_side_new_1109704.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704122", "story_v_side_new_1109704.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_10 = math.max(var_502_1, arg_499_1.talkMaxDuration)

			if var_502_0 <= arg_499_1.time_ and arg_499_1.time_ < var_502_0 + var_502_10 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_0) / var_502_10

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_0 + var_502_10 and arg_499_1.time_ < var_502_0 + var_502_10 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704123 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 1109704123
		arg_503_1.duration_ = 5

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play1109704124(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0
			local var_506_1 = 1.35

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, false)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_2 = arg_503_1:GetWordFromCfg(1109704123)
				local var_506_3 = arg_503_1:FormatText(var_506_2.content)

				arg_503_1.text_.text = var_506_3

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_4 = 54
				local var_506_5 = utf8.len(var_506_3)
				local var_506_6 = var_506_4 <= 0 and var_506_1 or var_506_1 * (var_506_5 / var_506_4)

				if var_506_6 > 0 and var_506_1 < var_506_6 then
					arg_503_1.talkMaxDuration = var_506_6

					if var_506_6 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_6 + var_506_0
					end
				end

				arg_503_1.text_.text = var_506_3
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)
				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_7 = math.max(var_506_1, arg_503_1.talkMaxDuration)

			if var_506_0 <= arg_503_1.time_ and arg_503_1.time_ < var_506_0 + var_506_7 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_0) / var_506_7

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_0 + var_506_7 and arg_503_1.time_ < var_506_0 + var_506_7 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704124 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 1109704124
		arg_507_1.duration_ = 2.666

		local var_507_0 = {
			zh = 2.633,
			ja = 2.666
		}
		local var_507_1 = manager.audio:GetLocalizationFlag()

		if var_507_0[var_507_1] ~= nil then
			arg_507_1.duration_ = var_507_0[var_507_1]
		end

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play1109704125(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1097ui_story"].transform
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 then
				arg_507_1.var_.moveOldPos1097ui_story = var_510_0.localPosition
			end

			local var_510_2 = 0.001

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2
				local var_510_4 = Vector3.New(0, -0.54, -6.3)

				var_510_0.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos1097ui_story, var_510_4, var_510_3)

				local var_510_5 = manager.ui.mainCamera.transform.position - var_510_0.position

				var_510_0.forward = Vector3.New(var_510_5.x, var_510_5.y, var_510_5.z)

				local var_510_6 = var_510_0.localEulerAngles

				var_510_6.z = 0
				var_510_6.x = 0
				var_510_0.localEulerAngles = var_510_6
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 then
				var_510_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_510_7 = manager.ui.mainCamera.transform.position - var_510_0.position

				var_510_0.forward = Vector3.New(var_510_7.x, var_510_7.y, var_510_7.z)

				local var_510_8 = var_510_0.localEulerAngles

				var_510_8.z = 0
				var_510_8.x = 0
				var_510_0.localEulerAngles = var_510_8
			end

			local var_510_9 = arg_507_1.actors_["1097ui_story"]
			local var_510_10 = 0

			if var_510_10 < arg_507_1.time_ and arg_507_1.time_ <= var_510_10 + arg_510_0 and arg_507_1.var_.characterEffect1097ui_story == nil then
				arg_507_1.var_.characterEffect1097ui_story = var_510_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_11 = 0.200000002980232

			if var_510_10 <= arg_507_1.time_ and arg_507_1.time_ < var_510_10 + var_510_11 then
				local var_510_12 = (arg_507_1.time_ - var_510_10) / var_510_11

				if arg_507_1.var_.characterEffect1097ui_story then
					arg_507_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_507_1.time_ >= var_510_10 + var_510_11 and arg_507_1.time_ < var_510_10 + var_510_11 + arg_510_0 and arg_507_1.var_.characterEffect1097ui_story then
				arg_507_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_510_13 = 0

			if var_510_13 < arg_507_1.time_ and arg_507_1.time_ <= var_510_13 + arg_510_0 then
				arg_507_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_510_14 = 0

			if var_510_14 < arg_507_1.time_ and arg_507_1.time_ <= var_510_14 + arg_510_0 then
				arg_507_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_510_15 = 0
			local var_510_16 = 0.375

			if var_510_15 < arg_507_1.time_ and arg_507_1.time_ <= var_510_15 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_17 = arg_507_1:FormatText(StoryNameCfg[952].name)

				arg_507_1.leftNameTxt_.text = var_510_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_18 = arg_507_1:GetWordFromCfg(1109704124)
				local var_510_19 = arg_507_1:FormatText(var_510_18.content)

				arg_507_1.text_.text = var_510_19

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_20 = 15
				local var_510_21 = utf8.len(var_510_19)
				local var_510_22 = var_510_20 <= 0 and var_510_16 or var_510_16 * (var_510_21 / var_510_20)

				if var_510_22 > 0 and var_510_16 < var_510_22 then
					arg_507_1.talkMaxDuration = var_510_22

					if var_510_22 + var_510_15 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_22 + var_510_15
					end
				end

				arg_507_1.text_.text = var_510_19
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704124", "story_v_side_new_1109704.awb") ~= 0 then
					local var_510_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704124", "story_v_side_new_1109704.awb") / 1000

					if var_510_23 + var_510_15 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_23 + var_510_15
					end

					if var_510_18.prefab_name ~= "" and arg_507_1.actors_[var_510_18.prefab_name] ~= nil then
						local var_510_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_18.prefab_name].transform, "story_v_side_new_1109704", "1109704124", "story_v_side_new_1109704.awb")

						arg_507_1:RecordAudio("1109704124", var_510_24)
						arg_507_1:RecordAudio("1109704124", var_510_24)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704124", "story_v_side_new_1109704.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704124", "story_v_side_new_1109704.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_25 = math.max(var_510_16, arg_507_1.talkMaxDuration)

			if var_510_15 <= arg_507_1.time_ and arg_507_1.time_ < var_510_15 + var_510_25 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_15) / var_510_25

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_15 + var_510_25 and arg_507_1.time_ < var_510_15 + var_510_25 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704125 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 1109704125
		arg_511_1.duration_ = 5

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play1109704126(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1097ui_story"]
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 and arg_511_1.var_.characterEffect1097ui_story == nil then
				arg_511_1.var_.characterEffect1097ui_story = var_514_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_514_2 = 0.200000002980232

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_2 then
				local var_514_3 = (arg_511_1.time_ - var_514_1) / var_514_2

				if arg_511_1.var_.characterEffect1097ui_story then
					local var_514_4 = Mathf.Lerp(0, 0.5, var_514_3)

					arg_511_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_511_1.var_.characterEffect1097ui_story.fillRatio = var_514_4
				end
			end

			if arg_511_1.time_ >= var_514_1 + var_514_2 and arg_511_1.time_ < var_514_1 + var_514_2 + arg_514_0 and arg_511_1.var_.characterEffect1097ui_story then
				local var_514_5 = 0.5

				arg_511_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_511_1.var_.characterEffect1097ui_story.fillRatio = var_514_5
			end

			local var_514_6 = 0
			local var_514_7 = 0.95

			if var_514_6 < arg_511_1.time_ and arg_511_1.time_ <= var_514_6 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, false)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_8 = arg_511_1:GetWordFromCfg(1109704125)
				local var_514_9 = arg_511_1:FormatText(var_514_8.content)

				arg_511_1.text_.text = var_514_9

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_10 = 38
				local var_514_11 = utf8.len(var_514_9)
				local var_514_12 = var_514_10 <= 0 and var_514_7 or var_514_7 * (var_514_11 / var_514_10)

				if var_514_12 > 0 and var_514_7 < var_514_12 then
					arg_511_1.talkMaxDuration = var_514_12

					if var_514_12 + var_514_6 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_12 + var_514_6
					end
				end

				arg_511_1.text_.text = var_514_9
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)
				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_13 = math.max(var_514_7, arg_511_1.talkMaxDuration)

			if var_514_6 <= arg_511_1.time_ and arg_511_1.time_ < var_514_6 + var_514_13 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_6) / var_514_13

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_6 + var_514_13 and arg_511_1.time_ < var_514_6 + var_514_13 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704126 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 1109704126
		arg_515_1.duration_ = 5

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play1109704127(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = 0
			local var_518_1 = 0.725

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

				local var_518_3 = arg_515_1:GetWordFromCfg(1109704126)
				local var_518_4 = arg_515_1:FormatText(var_518_3.content)

				arg_515_1.text_.text = var_518_4

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_5 = 29
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
	Play1109704127 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 1109704127
		arg_519_1.duration_ = 7

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play1109704128(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = 0

			if var_522_0 < arg_519_1.time_ and arg_519_1.time_ <= var_522_0 + arg_522_0 then
				local var_522_1 = manager.ui.mainCamera.transform.localPosition
				local var_522_2 = Vector3.New(0, 0, 10) + Vector3.New(var_522_1.x, var_522_1.y, 0)
				local var_522_3 = arg_519_1.bgs_.ST60

				var_522_3.transform.localPosition = var_522_2
				var_522_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_522_4 = var_522_3:GetComponent("SpriteRenderer")

				if var_522_4 and var_522_4.sprite then
					local var_522_5 = (var_522_3.transform.localPosition - var_522_1).z
					local var_522_6 = manager.ui.mainCameraCom_
					local var_522_7 = 2 * var_522_5 * Mathf.Tan(var_522_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_522_8 = var_522_7 * var_522_6.aspect
					local var_522_9 = var_522_4.sprite.bounds.size.x
					local var_522_10 = var_522_4.sprite.bounds.size.y
					local var_522_11 = var_522_8 / var_522_9
					local var_522_12 = var_522_7 / var_522_10
					local var_522_13 = var_522_12 < var_522_11 and var_522_11 or var_522_12

					var_522_3.transform.localScale = Vector3.New(var_522_13, var_522_13, 0)
				end

				for iter_522_0, iter_522_1 in pairs(arg_519_1.bgs_) do
					if iter_522_0 ~= "ST60" then
						iter_522_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_522_14 = 2

			if var_522_14 < arg_519_1.time_ and arg_519_1.time_ <= var_522_14 + arg_522_0 then
				arg_519_1.allBtn_.enabled = false
			end

			local var_522_15 = 0.3

			if arg_519_1.time_ >= var_522_14 + var_522_15 and arg_519_1.time_ < var_522_14 + var_522_15 + arg_522_0 then
				arg_519_1.allBtn_.enabled = true
			end

			local var_522_16 = 0

			if var_522_16 < arg_519_1.time_ and arg_519_1.time_ <= var_522_16 + arg_522_0 then
				arg_519_1.mask_.enabled = true
				arg_519_1.mask_.raycastTarget = true

				arg_519_1:SetGaussion(false)
			end

			local var_522_17 = 2

			if var_522_16 <= arg_519_1.time_ and arg_519_1.time_ < var_522_16 + var_522_17 then
				local var_522_18 = (arg_519_1.time_ - var_522_16) / var_522_17
				local var_522_19 = Color.New(1, 1, 1)

				var_522_19.a = Mathf.Lerp(1, 0, var_522_18)
				arg_519_1.mask_.color = var_522_19
			end

			if arg_519_1.time_ >= var_522_16 + var_522_17 and arg_519_1.time_ < var_522_16 + var_522_17 + arg_522_0 then
				local var_522_20 = Color.New(1, 1, 1)
				local var_522_21 = 0

				arg_519_1.mask_.enabled = false
				var_522_20.a = var_522_21
				arg_519_1.mask_.color = var_522_20
			end

			local var_522_22 = 0
			local var_522_23 = 0.2

			if var_522_22 < arg_519_1.time_ and arg_519_1.time_ <= var_522_22 + arg_522_0 then
				local var_522_24 = "play"
				local var_522_25 = "music"

				arg_519_1:AudioAction(var_522_24, var_522_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_519_1.frameCnt_ <= 1 then
				arg_519_1.dialog_:SetActive(false)
			end

			local var_522_26 = 2
			local var_522_27 = 0.15

			if var_522_26 < arg_519_1.time_ and arg_519_1.time_ <= var_522_26 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0

				arg_519_1.dialog_:SetActive(true)

				local var_522_28 = LeanTween.value(arg_519_1.dialog_, 0, 1, 0.3)

				var_522_28:setOnUpdate(LuaHelper.FloatAction(function(arg_523_0)
					arg_519_1.dialogCg_.alpha = arg_523_0
				end))
				var_522_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_519_1.dialog_)
					var_522_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_519_1.duration_ = arg_519_1.duration_ + 0.3

				SetActive(arg_519_1.leftNameGo_, false)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_29 = arg_519_1:GetWordFromCfg(1109704127)
				local var_522_30 = arg_519_1:FormatText(var_522_29.content)

				arg_519_1.text_.text = var_522_30

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_31 = 6
				local var_522_32 = utf8.len(var_522_30)
				local var_522_33 = var_522_31 <= 0 and var_522_27 or var_522_27 * (var_522_32 / var_522_31)

				if var_522_33 > 0 and var_522_27 < var_522_33 then
					arg_519_1.talkMaxDuration = var_522_33
					var_522_26 = var_522_26 + 0.3

					if var_522_33 + var_522_26 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_33 + var_522_26
					end
				end

				arg_519_1.text_.text = var_522_30
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)
				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_34 = var_522_26 + 0.3
			local var_522_35 = math.max(var_522_27, arg_519_1.talkMaxDuration)

			if var_522_34 <= arg_519_1.time_ and arg_519_1.time_ < var_522_34 + var_522_35 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_34) / var_522_35

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_34 + var_522_35 and arg_519_1.time_ < var_522_34 + var_522_35 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704128 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 1109704128
		arg_525_1.duration_ = 5

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play1109704129(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = 0
			local var_528_1 = 1.225

			if var_528_0 < arg_525_1.time_ and arg_525_1.time_ <= var_528_0 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, false)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_2 = arg_525_1:GetWordFromCfg(1109704128)
				local var_528_3 = arg_525_1:FormatText(var_528_2.content)

				arg_525_1.text_.text = var_528_3

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_4 = 49
				local var_528_5 = utf8.len(var_528_3)
				local var_528_6 = var_528_4 <= 0 and var_528_1 or var_528_1 * (var_528_5 / var_528_4)

				if var_528_6 > 0 and var_528_1 < var_528_6 then
					arg_525_1.talkMaxDuration = var_528_6

					if var_528_6 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_6 + var_528_0
					end
				end

				arg_525_1.text_.text = var_528_3
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)
				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_7 = math.max(var_528_1, arg_525_1.talkMaxDuration)

			if var_528_0 <= arg_525_1.time_ and arg_525_1.time_ < var_528_0 + var_528_7 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_0) / var_528_7

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_0 + var_528_7 and arg_525_1.time_ < var_528_0 + var_528_7 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704129 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 1109704129
		arg_529_1.duration_ = 5

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play1109704130(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = 0
			local var_532_1 = 0.05

			if var_532_0 < arg_529_1.time_ and arg_529_1.time_ <= var_532_0 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, true)

				local var_532_2 = arg_529_1:FormatText(StoryNameCfg[7].name)

				arg_529_1.leftNameTxt_.text = var_532_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_529_1.leftNameTxt_.transform)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1.leftNameTxt_.text)
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_3 = arg_529_1:GetWordFromCfg(1109704129)
				local var_532_4 = arg_529_1:FormatText(var_532_3.content)

				arg_529_1.text_.text = var_532_4

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_5 = 2
				local var_532_6 = utf8.len(var_532_4)
				local var_532_7 = var_532_5 <= 0 and var_532_1 or var_532_1 * (var_532_6 / var_532_5)

				if var_532_7 > 0 and var_532_1 < var_532_7 then
					arg_529_1.talkMaxDuration = var_532_7

					if var_532_7 + var_532_0 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_7 + var_532_0
					end
				end

				arg_529_1.text_.text = var_532_4
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_8 = math.max(var_532_1, arg_529_1.talkMaxDuration)

			if var_532_0 <= arg_529_1.time_ and arg_529_1.time_ < var_532_0 + var_532_8 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_0) / var_532_8

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_0 + var_532_8 and arg_529_1.time_ < var_532_0 + var_532_8 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704130 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 1109704130
		arg_533_1.duration_ = 1.7

		local var_533_0 = {
			zh = 1.7,
			ja = 1.466
		}
		local var_533_1 = manager.audio:GetLocalizationFlag()

		if var_533_0[var_533_1] ~= nil then
			arg_533_1.duration_ = var_533_0[var_533_1]
		end

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play1109704131(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = arg_533_1.actors_["1097ui_story"].transform
			local var_536_1 = 0

			if var_536_1 < arg_533_1.time_ and arg_533_1.time_ <= var_536_1 + arg_536_0 then
				arg_533_1.var_.moveOldPos1097ui_story = var_536_0.localPosition
			end

			local var_536_2 = 0.001

			if var_536_1 <= arg_533_1.time_ and arg_533_1.time_ < var_536_1 + var_536_2 then
				local var_536_3 = (arg_533_1.time_ - var_536_1) / var_536_2
				local var_536_4 = Vector3.New(0, -0.54, -6.3)

				var_536_0.localPosition = Vector3.Lerp(arg_533_1.var_.moveOldPos1097ui_story, var_536_4, var_536_3)

				local var_536_5 = manager.ui.mainCamera.transform.position - var_536_0.position

				var_536_0.forward = Vector3.New(var_536_5.x, var_536_5.y, var_536_5.z)

				local var_536_6 = var_536_0.localEulerAngles

				var_536_6.z = 0
				var_536_6.x = 0
				var_536_0.localEulerAngles = var_536_6
			end

			if arg_533_1.time_ >= var_536_1 + var_536_2 and arg_533_1.time_ < var_536_1 + var_536_2 + arg_536_0 then
				var_536_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_536_7 = manager.ui.mainCamera.transform.position - var_536_0.position

				var_536_0.forward = Vector3.New(var_536_7.x, var_536_7.y, var_536_7.z)

				local var_536_8 = var_536_0.localEulerAngles

				var_536_8.z = 0
				var_536_8.x = 0
				var_536_0.localEulerAngles = var_536_8
			end

			local var_536_9 = arg_533_1.actors_["1097ui_story"]
			local var_536_10 = 0

			if var_536_10 < arg_533_1.time_ and arg_533_1.time_ <= var_536_10 + arg_536_0 and arg_533_1.var_.characterEffect1097ui_story == nil then
				arg_533_1.var_.characterEffect1097ui_story = var_536_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_536_11 = 0.200000002980232

			if var_536_10 <= arg_533_1.time_ and arg_533_1.time_ < var_536_10 + var_536_11 then
				local var_536_12 = (arg_533_1.time_ - var_536_10) / var_536_11

				if arg_533_1.var_.characterEffect1097ui_story then
					arg_533_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_533_1.time_ >= var_536_10 + var_536_11 and arg_533_1.time_ < var_536_10 + var_536_11 + arg_536_0 and arg_533_1.var_.characterEffect1097ui_story then
				arg_533_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_536_13 = 0

			if var_536_13 < arg_533_1.time_ and arg_533_1.time_ <= var_536_13 + arg_536_0 then
				arg_533_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_536_14 = 0

			if var_536_14 < arg_533_1.time_ and arg_533_1.time_ <= var_536_14 + arg_536_0 then
				arg_533_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_536_15 = 0
			local var_536_16 = 0.35

			if var_536_15 < arg_533_1.time_ and arg_533_1.time_ <= var_536_15 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, true)

				local var_536_17 = arg_533_1:FormatText(StoryNameCfg[216].name)

				arg_533_1.leftNameTxt_.text = var_536_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_533_1.leftNameTxt_.transform)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1.leftNameTxt_.text)
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_18 = arg_533_1:GetWordFromCfg(1109704130)
				local var_536_19 = arg_533_1:FormatText(var_536_18.content)

				arg_533_1.text_.text = var_536_19

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_20 = 14
				local var_536_21 = utf8.len(var_536_19)
				local var_536_22 = var_536_20 <= 0 and var_536_16 or var_536_16 * (var_536_21 / var_536_20)

				if var_536_22 > 0 and var_536_16 < var_536_22 then
					arg_533_1.talkMaxDuration = var_536_22

					if var_536_22 + var_536_15 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_22 + var_536_15
					end
				end

				arg_533_1.text_.text = var_536_19
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704130", "story_v_side_new_1109704.awb") ~= 0 then
					local var_536_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704130", "story_v_side_new_1109704.awb") / 1000

					if var_536_23 + var_536_15 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_23 + var_536_15
					end

					if var_536_18.prefab_name ~= "" and arg_533_1.actors_[var_536_18.prefab_name] ~= nil then
						local var_536_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_533_1.actors_[var_536_18.prefab_name].transform, "story_v_side_new_1109704", "1109704130", "story_v_side_new_1109704.awb")

						arg_533_1:RecordAudio("1109704130", var_536_24)
						arg_533_1:RecordAudio("1109704130", var_536_24)
					else
						arg_533_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704130", "story_v_side_new_1109704.awb")
					end

					arg_533_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704130", "story_v_side_new_1109704.awb")
				end

				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_25 = math.max(var_536_16, arg_533_1.talkMaxDuration)

			if var_536_15 <= arg_533_1.time_ and arg_533_1.time_ < var_536_15 + var_536_25 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_15) / var_536_25

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_15 + var_536_25 and arg_533_1.time_ < var_536_15 + var_536_25 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704131 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 1109704131
		arg_537_1.duration_ = 5

		SetActive(arg_537_1.tipsGo_, false)

		function arg_537_1.onSingleLineFinish_()
			arg_537_1.onSingleLineUpdate_ = nil
			arg_537_1.onSingleLineFinish_ = nil
			arg_537_1.state_ = "waiting"
		end

		function arg_537_1.playNext_(arg_539_0)
			if arg_539_0 == 1 then
				arg_537_0:Play1109704132(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = arg_537_1.actors_["1097ui_story"]
			local var_540_1 = 0

			if var_540_1 < arg_537_1.time_ and arg_537_1.time_ <= var_540_1 + arg_540_0 and arg_537_1.var_.characterEffect1097ui_story == nil then
				arg_537_1.var_.characterEffect1097ui_story = var_540_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_540_2 = 0.200000002980232

			if var_540_1 <= arg_537_1.time_ and arg_537_1.time_ < var_540_1 + var_540_2 then
				local var_540_3 = (arg_537_1.time_ - var_540_1) / var_540_2

				if arg_537_1.var_.characterEffect1097ui_story then
					local var_540_4 = Mathf.Lerp(0, 0.5, var_540_3)

					arg_537_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_537_1.var_.characterEffect1097ui_story.fillRatio = var_540_4
				end
			end

			if arg_537_1.time_ >= var_540_1 + var_540_2 and arg_537_1.time_ < var_540_1 + var_540_2 + arg_540_0 and arg_537_1.var_.characterEffect1097ui_story then
				local var_540_5 = 0.5

				arg_537_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_537_1.var_.characterEffect1097ui_story.fillRatio = var_540_5
			end

			local var_540_6 = 0
			local var_540_7 = 0.6

			if var_540_6 < arg_537_1.time_ and arg_537_1.time_ <= var_540_6 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_8 = arg_537_1:FormatText(StoryNameCfg[7].name)

				arg_537_1.leftNameTxt_.text = var_540_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_9 = arg_537_1:GetWordFromCfg(1109704131)
				local var_540_10 = arg_537_1:FormatText(var_540_9.content)

				arg_537_1.text_.text = var_540_10

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_11 = 24
				local var_540_12 = utf8.len(var_540_10)
				local var_540_13 = var_540_11 <= 0 and var_540_7 or var_540_7 * (var_540_12 / var_540_11)

				if var_540_13 > 0 and var_540_7 < var_540_13 then
					arg_537_1.talkMaxDuration = var_540_13

					if var_540_13 + var_540_6 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_13 + var_540_6
					end
				end

				arg_537_1.text_.text = var_540_10
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)
				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_14 = math.max(var_540_7, arg_537_1.talkMaxDuration)

			if var_540_6 <= arg_537_1.time_ and arg_537_1.time_ < var_540_6 + var_540_14 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_6) / var_540_14

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_6 + var_540_14 and arg_537_1.time_ < var_540_6 + var_540_14 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704132 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 1109704132
		arg_541_1.duration_ = 7

		SetActive(arg_541_1.tipsGo_, false)

		function arg_541_1.onSingleLineFinish_()
			arg_541_1.onSingleLineUpdate_ = nil
			arg_541_1.onSingleLineFinish_ = nil
			arg_541_1.state_ = "waiting"
		end

		function arg_541_1.playNext_(arg_543_0)
			if arg_543_0 == 1 then
				arg_541_0:Play1109704133(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = 0

			if var_544_0 < arg_541_1.time_ and arg_541_1.time_ <= var_544_0 + arg_544_0 then
				local var_544_1 = manager.ui.mainCamera.transform.localPosition
				local var_544_2 = Vector3.New(0, 0, 10) + Vector3.New(var_544_1.x, var_544_1.y, 0)
				local var_544_3 = arg_541_1.bgs_.STwhite

				var_544_3.transform.localPosition = var_544_2
				var_544_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_544_4 = var_544_3:GetComponent("SpriteRenderer")

				if var_544_4 and var_544_4.sprite then
					local var_544_5 = (var_544_3.transform.localPosition - var_544_1).z
					local var_544_6 = manager.ui.mainCameraCom_
					local var_544_7 = 2 * var_544_5 * Mathf.Tan(var_544_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_544_8 = var_544_7 * var_544_6.aspect
					local var_544_9 = var_544_4.sprite.bounds.size.x
					local var_544_10 = var_544_4.sprite.bounds.size.y
					local var_544_11 = var_544_8 / var_544_9
					local var_544_12 = var_544_7 / var_544_10
					local var_544_13 = var_544_12 < var_544_11 and var_544_11 or var_544_12

					var_544_3.transform.localScale = Vector3.New(var_544_13, var_544_13, 0)
				end

				for iter_544_0, iter_544_1 in pairs(arg_541_1.bgs_) do
					if iter_544_0 ~= "STwhite" then
						iter_544_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_544_14 = 2

			if var_544_14 < arg_541_1.time_ and arg_541_1.time_ <= var_544_14 + arg_544_0 then
				arg_541_1.allBtn_.enabled = false
			end

			local var_544_15 = 0.3

			if arg_541_1.time_ >= var_544_14 + var_544_15 and arg_541_1.time_ < var_544_14 + var_544_15 + arg_544_0 then
				arg_541_1.allBtn_.enabled = true
			end

			local var_544_16 = 0

			if var_544_16 < arg_541_1.time_ and arg_541_1.time_ <= var_544_16 + arg_544_0 then
				arg_541_1.mask_.enabled = true
				arg_541_1.mask_.raycastTarget = true

				arg_541_1:SetGaussion(false)
			end

			local var_544_17 = 2

			if var_544_16 <= arg_541_1.time_ and arg_541_1.time_ < var_544_16 + var_544_17 then
				local var_544_18 = (arg_541_1.time_ - var_544_16) / var_544_17
				local var_544_19 = Color.New(1, 1, 1)

				var_544_19.a = Mathf.Lerp(1, 0, var_544_18)
				arg_541_1.mask_.color = var_544_19
			end

			if arg_541_1.time_ >= var_544_16 + var_544_17 and arg_541_1.time_ < var_544_16 + var_544_17 + arg_544_0 then
				local var_544_20 = Color.New(1, 1, 1)
				local var_544_21 = 0

				arg_541_1.mask_.enabled = false
				var_544_20.a = var_544_21
				arg_541_1.mask_.color = var_544_20
			end

			local var_544_22 = arg_541_1.actors_["1097ui_story"].transform
			local var_544_23 = 0

			if var_544_23 < arg_541_1.time_ and arg_541_1.time_ <= var_544_23 + arg_544_0 then
				arg_541_1.var_.moveOldPos1097ui_story = var_544_22.localPosition
			end

			local var_544_24 = 0.001

			if var_544_23 <= arg_541_1.time_ and arg_541_1.time_ < var_544_23 + var_544_24 then
				local var_544_25 = (arg_541_1.time_ - var_544_23) / var_544_24
				local var_544_26 = Vector3.New(0, 100, 0)

				var_544_22.localPosition = Vector3.Lerp(arg_541_1.var_.moveOldPos1097ui_story, var_544_26, var_544_25)

				local var_544_27 = manager.ui.mainCamera.transform.position - var_544_22.position

				var_544_22.forward = Vector3.New(var_544_27.x, var_544_27.y, var_544_27.z)

				local var_544_28 = var_544_22.localEulerAngles

				var_544_28.z = 0
				var_544_28.x = 0
				var_544_22.localEulerAngles = var_544_28
			end

			if arg_541_1.time_ >= var_544_23 + var_544_24 and arg_541_1.time_ < var_544_23 + var_544_24 + arg_544_0 then
				var_544_22.localPosition = Vector3.New(0, 100, 0)

				local var_544_29 = manager.ui.mainCamera.transform.position - var_544_22.position

				var_544_22.forward = Vector3.New(var_544_29.x, var_544_29.y, var_544_29.z)

				local var_544_30 = var_544_22.localEulerAngles

				var_544_30.z = 0
				var_544_30.x = 0
				var_544_22.localEulerAngles = var_544_30
			end

			local var_544_31 = 0
			local var_544_32 = 0.2

			if var_544_31 < arg_541_1.time_ and arg_541_1.time_ <= var_544_31 + arg_544_0 then
				local var_544_33 = "play"
				local var_544_34 = "music"

				arg_541_1:AudioAction(var_544_33, var_544_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_544_35 = 0.3
			local var_544_36 = 0.9

			if var_544_35 < arg_541_1.time_ and arg_541_1.time_ <= var_544_35 + arg_544_0 then
				local var_544_37 = "play"
				local var_544_38 = "music"

				arg_541_1:AudioAction(var_544_37, var_544_38, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			if arg_541_1.frameCnt_ <= 1 then
				arg_541_1.dialog_:SetActive(false)
			end

			local var_544_39 = 2
			local var_544_40 = 0.85

			if var_544_39 < arg_541_1.time_ and arg_541_1.time_ <= var_544_39 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0

				arg_541_1.dialog_:SetActive(true)

				local var_544_41 = LeanTween.value(arg_541_1.dialog_, 0, 1, 0.3)

				var_544_41:setOnUpdate(LuaHelper.FloatAction(function(arg_545_0)
					arg_541_1.dialogCg_.alpha = arg_545_0
				end))
				var_544_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_541_1.dialog_)
					var_544_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_541_1.duration_ = arg_541_1.duration_ + 0.3

				SetActive(arg_541_1.leftNameGo_, false)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_42 = arg_541_1:GetWordFromCfg(1109704132)
				local var_544_43 = arg_541_1:FormatText(var_544_42.content)

				arg_541_1.text_.text = var_544_43

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_44 = 34
				local var_544_45 = utf8.len(var_544_43)
				local var_544_46 = var_544_44 <= 0 and var_544_40 or var_544_40 * (var_544_45 / var_544_44)

				if var_544_46 > 0 and var_544_40 < var_544_46 then
					arg_541_1.talkMaxDuration = var_544_46
					var_544_39 = var_544_39 + 0.3

					if var_544_46 + var_544_39 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_46 + var_544_39
					end
				end

				arg_541_1.text_.text = var_544_43
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)
				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_47 = var_544_39 + 0.3
			local var_544_48 = math.max(var_544_40, arg_541_1.talkMaxDuration)

			if var_544_47 <= arg_541_1.time_ and arg_541_1.time_ < var_544_47 + var_544_48 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_47) / var_544_48

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_47 + var_544_48 and arg_541_1.time_ < var_544_47 + var_544_48 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704133 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 1109704133
		arg_547_1.duration_ = 8.566

		local var_547_0 = {
			zh = 8.566,
			ja = 5.366
		}
		local var_547_1 = manager.audio:GetLocalizationFlag()

		if var_547_0[var_547_1] ~= nil then
			arg_547_1.duration_ = var_547_0[var_547_1]
		end

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play1109704134(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 1.15

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_2 = arg_547_1:FormatText(StoryNameCfg[216].name)

				arg_547_1.leftNameTxt_.text = var_550_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, true)
				arg_547_1.iconController_:SetSelectedState("hero")

				arg_547_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_3 = arg_547_1:GetWordFromCfg(1109704133)
				local var_550_4 = arg_547_1:FormatText(var_550_3.content)

				arg_547_1.text_.text = var_550_4

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_5 = 46
				local var_550_6 = utf8.len(var_550_4)
				local var_550_7 = var_550_5 <= 0 and var_550_1 or var_550_1 * (var_550_6 / var_550_5)

				if var_550_7 > 0 and var_550_1 < var_550_7 then
					arg_547_1.talkMaxDuration = var_550_7

					if var_550_7 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_7 + var_550_0
					end
				end

				arg_547_1.text_.text = var_550_4
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704133", "story_v_side_new_1109704.awb") ~= 0 then
					local var_550_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704133", "story_v_side_new_1109704.awb") / 1000

					if var_550_8 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_8 + var_550_0
					end

					if var_550_3.prefab_name ~= "" and arg_547_1.actors_[var_550_3.prefab_name] ~= nil then
						local var_550_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_3.prefab_name].transform, "story_v_side_new_1109704", "1109704133", "story_v_side_new_1109704.awb")

						arg_547_1:RecordAudio("1109704133", var_550_9)
						arg_547_1:RecordAudio("1109704133", var_550_9)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704133", "story_v_side_new_1109704.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704133", "story_v_side_new_1109704.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_10 = math.max(var_550_1, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_10 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_0) / var_550_10

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_10 and arg_547_1.time_ < var_550_0 + var_550_10 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704134 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 1109704134
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play1109704135(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["1097ui_story"]
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 and arg_551_1.var_.characterEffect1097ui_story == nil then
				arg_551_1.var_.characterEffect1097ui_story = var_554_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_2 = 0.200000002980232

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2

				if arg_551_1.var_.characterEffect1097ui_story then
					local var_554_4 = Mathf.Lerp(0, 0.5, var_554_3)

					arg_551_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_551_1.var_.characterEffect1097ui_story.fillRatio = var_554_4
				end
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 and arg_551_1.var_.characterEffect1097ui_story then
				local var_554_5 = 0.5

				arg_551_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_551_1.var_.characterEffect1097ui_story.fillRatio = var_554_5
			end

			local var_554_6 = 0
			local var_554_7 = 0.05

			if var_554_6 < arg_551_1.time_ and arg_551_1.time_ <= var_554_6 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_8 = arg_551_1:FormatText(StoryNameCfg[7].name)

				arg_551_1.leftNameTxt_.text = var_554_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_9 = arg_551_1:GetWordFromCfg(1109704134)
				local var_554_10 = arg_551_1:FormatText(var_554_9.content)

				arg_551_1.text_.text = var_554_10

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_11 = 2
				local var_554_12 = utf8.len(var_554_10)
				local var_554_13 = var_554_11 <= 0 and var_554_7 or var_554_7 * (var_554_12 / var_554_11)

				if var_554_13 > 0 and var_554_7 < var_554_13 then
					arg_551_1.talkMaxDuration = var_554_13

					if var_554_13 + var_554_6 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_13 + var_554_6
					end
				end

				arg_551_1.text_.text = var_554_10
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_14 = math.max(var_554_7, arg_551_1.talkMaxDuration)

			if var_554_6 <= arg_551_1.time_ and arg_551_1.time_ < var_554_6 + var_554_14 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_6) / var_554_14

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_6 + var_554_14 and arg_551_1.time_ < var_554_6 + var_554_14 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704135 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 1109704135
		arg_555_1.duration_ = 6.3

		local var_555_0 = {
			zh = 6.3,
			ja = 4.566
		}
		local var_555_1 = manager.audio:GetLocalizationFlag()

		if var_555_0[var_555_1] ~= nil then
			arg_555_1.duration_ = var_555_0[var_555_1]
		end

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play1109704136(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0
			local var_558_1 = 0.675

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_2 = arg_555_1:FormatText(StoryNameCfg[216].name)

				arg_555_1.leftNameTxt_.text = var_558_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, true)
				arg_555_1.iconController_:SetSelectedState("hero")

				arg_555_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_3 = arg_555_1:GetWordFromCfg(1109704135)
				local var_558_4 = arg_555_1:FormatText(var_558_3.content)

				arg_555_1.text_.text = var_558_4

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_5 = 27
				local var_558_6 = utf8.len(var_558_4)
				local var_558_7 = var_558_5 <= 0 and var_558_1 or var_558_1 * (var_558_6 / var_558_5)

				if var_558_7 > 0 and var_558_1 < var_558_7 then
					arg_555_1.talkMaxDuration = var_558_7

					if var_558_7 + var_558_0 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_7 + var_558_0
					end
				end

				arg_555_1.text_.text = var_558_4
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704135", "story_v_side_new_1109704.awb") ~= 0 then
					local var_558_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704135", "story_v_side_new_1109704.awb") / 1000

					if var_558_8 + var_558_0 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_8 + var_558_0
					end

					if var_558_3.prefab_name ~= "" and arg_555_1.actors_[var_558_3.prefab_name] ~= nil then
						local var_558_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_555_1.actors_[var_558_3.prefab_name].transform, "story_v_side_new_1109704", "1109704135", "story_v_side_new_1109704.awb")

						arg_555_1:RecordAudio("1109704135", var_558_9)
						arg_555_1:RecordAudio("1109704135", var_558_9)
					else
						arg_555_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704135", "story_v_side_new_1109704.awb")
					end

					arg_555_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704135", "story_v_side_new_1109704.awb")
				end

				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_10 = math.max(var_558_1, arg_555_1.talkMaxDuration)

			if var_558_0 <= arg_555_1.time_ and arg_555_1.time_ < var_558_0 + var_558_10 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_0) / var_558_10

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_0 + var_558_10 and arg_555_1.time_ < var_558_0 + var_558_10 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704136 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 1109704136
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play1109704137(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = arg_559_1.actors_["1097ui_story"]
			local var_562_1 = 0

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 and arg_559_1.var_.characterEffect1097ui_story == nil then
				arg_559_1.var_.characterEffect1097ui_story = var_562_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_562_2 = 0.200000002980232

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_2 then
				local var_562_3 = (arg_559_1.time_ - var_562_1) / var_562_2

				if arg_559_1.var_.characterEffect1097ui_story then
					local var_562_4 = Mathf.Lerp(0, 0.5, var_562_3)

					arg_559_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_559_1.var_.characterEffect1097ui_story.fillRatio = var_562_4
				end
			end

			if arg_559_1.time_ >= var_562_1 + var_562_2 and arg_559_1.time_ < var_562_1 + var_562_2 + arg_562_0 and arg_559_1.var_.characterEffect1097ui_story then
				local var_562_5 = 0.5

				arg_559_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_559_1.var_.characterEffect1097ui_story.fillRatio = var_562_5
			end

			local var_562_6 = 0
			local var_562_7 = 0.825

			if var_562_6 < arg_559_1.time_ and arg_559_1.time_ <= var_562_6 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, false)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_8 = arg_559_1:GetWordFromCfg(1109704136)
				local var_562_9 = arg_559_1:FormatText(var_562_8.content)

				arg_559_1.text_.text = var_562_9

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_10 = 33
				local var_562_11 = utf8.len(var_562_9)
				local var_562_12 = var_562_10 <= 0 and var_562_7 or var_562_7 * (var_562_11 / var_562_10)

				if var_562_12 > 0 and var_562_7 < var_562_12 then
					arg_559_1.talkMaxDuration = var_562_12

					if var_562_12 + var_562_6 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_12 + var_562_6
					end
				end

				arg_559_1.text_.text = var_562_9
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_13 = math.max(var_562_7, arg_559_1.talkMaxDuration)

			if var_562_6 <= arg_559_1.time_ and arg_559_1.time_ < var_562_6 + var_562_13 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_6) / var_562_13

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_6 + var_562_13 and arg_559_1.time_ < var_562_6 + var_562_13 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704137 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 1109704137
		arg_563_1.duration_ = 10.8

		local var_563_0 = {
			zh = 8.7,
			ja = 10.8
		}
		local var_563_1 = manager.audio:GetLocalizationFlag()

		if var_563_0[var_563_1] ~= nil then
			arg_563_1.duration_ = var_563_0[var_563_1]
		end

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play1109704138(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0
			local var_566_1 = 1.2

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_2 = arg_563_1:FormatText(StoryNameCfg[216].name)

				arg_563_1.leftNameTxt_.text = var_566_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, true)
				arg_563_1.iconController_:SetSelectedState("hero")

				arg_563_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_3 = arg_563_1:GetWordFromCfg(1109704137)
				local var_566_4 = arg_563_1:FormatText(var_566_3.content)

				arg_563_1.text_.text = var_566_4

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_5 = 48
				local var_566_6 = utf8.len(var_566_4)
				local var_566_7 = var_566_5 <= 0 and var_566_1 or var_566_1 * (var_566_6 / var_566_5)

				if var_566_7 > 0 and var_566_1 < var_566_7 then
					arg_563_1.talkMaxDuration = var_566_7

					if var_566_7 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_7 + var_566_0
					end
				end

				arg_563_1.text_.text = var_566_4
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704137", "story_v_side_new_1109704.awb") ~= 0 then
					local var_566_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704137", "story_v_side_new_1109704.awb") / 1000

					if var_566_8 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_8 + var_566_0
					end

					if var_566_3.prefab_name ~= "" and arg_563_1.actors_[var_566_3.prefab_name] ~= nil then
						local var_566_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_563_1.actors_[var_566_3.prefab_name].transform, "story_v_side_new_1109704", "1109704137", "story_v_side_new_1109704.awb")

						arg_563_1:RecordAudio("1109704137", var_566_9)
						arg_563_1:RecordAudio("1109704137", var_566_9)
					else
						arg_563_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704137", "story_v_side_new_1109704.awb")
					end

					arg_563_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704137", "story_v_side_new_1109704.awb")
				end

				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_10 = math.max(var_566_1, arg_563_1.talkMaxDuration)

			if var_566_0 <= arg_563_1.time_ and arg_563_1.time_ < var_566_0 + var_566_10 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_0) / var_566_10

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_0 + var_566_10 and arg_563_1.time_ < var_566_0 + var_566_10 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704138 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 1109704138
		arg_567_1.duration_ = 11.366

		local var_567_0 = {
			zh = 8.966,
			ja = 11.366
		}
		local var_567_1 = manager.audio:GetLocalizationFlag()

		if var_567_0[var_567_1] ~= nil then
			arg_567_1.duration_ = var_567_0[var_567_1]
		end

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play1109704139(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0
			local var_570_1 = 0.825

			if var_570_0 < arg_567_1.time_ and arg_567_1.time_ <= var_570_0 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_2 = arg_567_1:FormatText(StoryNameCfg[216].name)

				arg_567_1.leftNameTxt_.text = var_570_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, true)
				arg_567_1.iconController_:SetSelectedState("hero")

				arg_567_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_3 = arg_567_1:GetWordFromCfg(1109704138)
				local var_570_4 = arg_567_1:FormatText(var_570_3.content)

				arg_567_1.text_.text = var_570_4

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704138", "story_v_side_new_1109704.awb") ~= 0 then
					local var_570_8 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704138", "story_v_side_new_1109704.awb") / 1000

					if var_570_8 + var_570_0 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_8 + var_570_0
					end

					if var_570_3.prefab_name ~= "" and arg_567_1.actors_[var_570_3.prefab_name] ~= nil then
						local var_570_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_567_1.actors_[var_570_3.prefab_name].transform, "story_v_side_new_1109704", "1109704138", "story_v_side_new_1109704.awb")

						arg_567_1:RecordAudio("1109704138", var_570_9)
						arg_567_1:RecordAudio("1109704138", var_570_9)
					else
						arg_567_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704138", "story_v_side_new_1109704.awb")
					end

					arg_567_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704138", "story_v_side_new_1109704.awb")
				end

				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_10 = math.max(var_570_1, arg_567_1.talkMaxDuration)

			if var_570_0 <= arg_567_1.time_ and arg_567_1.time_ < var_570_0 + var_570_10 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_0) / var_570_10

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_0 + var_570_10 and arg_567_1.time_ < var_570_0 + var_570_10 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704139 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 1109704139
		arg_571_1.duration_ = 5

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play1109704140(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = 0
			local var_574_1 = 0.6

			if var_574_0 < arg_571_1.time_ and arg_571_1.time_ <= var_574_0 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0

				arg_571_1.dialog_:SetActive(true)

				local var_574_2 = LeanTween.value(arg_571_1.dialog_, 0, 1, 0.3)

				var_574_2:setOnUpdate(LuaHelper.FloatAction(function(arg_575_0)
					arg_571_1.dialogCg_.alpha = arg_575_0
				end))
				var_574_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_571_1.dialog_)
					var_574_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_571_1.duration_ = arg_571_1.duration_ + 0.3

				SetActive(arg_571_1.leftNameGo_, false)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_3 = arg_571_1:GetWordFromCfg(1109704139)
				local var_574_4 = arg_571_1:FormatText(var_574_3.content)

				arg_571_1.text_.text = var_574_4

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_5 = 24
				local var_574_6 = utf8.len(var_574_4)
				local var_574_7 = var_574_5 <= 0 and var_574_1 or var_574_1 * (var_574_6 / var_574_5)

				if var_574_7 > 0 and var_574_1 < var_574_7 then
					arg_571_1.talkMaxDuration = var_574_7
					var_574_0 = var_574_0 + 0.3

					if var_574_7 + var_574_0 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_7 + var_574_0
					end
				end

				arg_571_1.text_.text = var_574_4
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_8 = var_574_0 + 0.3
			local var_574_9 = math.max(var_574_1, arg_571_1.talkMaxDuration)

			if var_574_8 <= arg_571_1.time_ and arg_571_1.time_ < var_574_8 + var_574_9 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_8) / var_574_9

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_8 + var_574_9 and arg_571_1.time_ < var_574_8 + var_574_9 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704140 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 1109704140
		arg_577_1.duration_ = 5

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play1109704141(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = 0
			local var_580_1 = 0.1

			if var_580_0 < arg_577_1.time_ and arg_577_1.time_ <= var_580_0 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, false)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_2 = arg_577_1:GetWordFromCfg(1109704140)
				local var_580_3 = arg_577_1:FormatText(var_580_2.content)

				arg_577_1.text_.text = var_580_3

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_4 = 4
				local var_580_5 = utf8.len(var_580_3)
				local var_580_6 = var_580_4 <= 0 and var_580_1 or var_580_1 * (var_580_5 / var_580_4)

				if var_580_6 > 0 and var_580_1 < var_580_6 then
					arg_577_1.talkMaxDuration = var_580_6

					if var_580_6 + var_580_0 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_6 + var_580_0
					end
				end

				arg_577_1.text_.text = var_580_3
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)
				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_7 = math.max(var_580_1, arg_577_1.talkMaxDuration)

			if var_580_0 <= arg_577_1.time_ and arg_577_1.time_ < var_580_0 + var_580_7 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_0) / var_580_7

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_0 + var_580_7 and arg_577_1.time_ < var_580_0 + var_580_7 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704141 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 1109704141
		arg_581_1.duration_ = 5

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play1109704142(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = 0
			local var_584_1 = 0.05

			if var_584_0 < arg_581_1.time_ and arg_581_1.time_ <= var_584_0 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, false)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_2 = arg_581_1:GetWordFromCfg(1109704141)
				local var_584_3 = arg_581_1:FormatText(var_584_2.content)

				arg_581_1.text_.text = var_584_3

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_4 = 2
				local var_584_5 = utf8.len(var_584_3)
				local var_584_6 = var_584_4 <= 0 and var_584_1 or var_584_1 * (var_584_5 / var_584_4)

				if var_584_6 > 0 and var_584_1 < var_584_6 then
					arg_581_1.talkMaxDuration = var_584_6

					if var_584_6 + var_584_0 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_6 + var_584_0
					end
				end

				arg_581_1.text_.text = var_584_3
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)
				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_7 = math.max(var_584_1, arg_581_1.talkMaxDuration)

			if var_584_0 <= arg_581_1.time_ and arg_581_1.time_ < var_584_0 + var_584_7 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_0) / var_584_7

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_0 + var_584_7 and arg_581_1.time_ < var_584_0 + var_584_7 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704142 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 1109704142
		arg_585_1.duration_ = 8.999999999999

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play1109704143(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = "F01"

			if arg_585_1.bgs_[var_588_0] == nil then
				local var_588_1 = Object.Instantiate(arg_585_1.paintGo_)

				var_588_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_588_0)
				var_588_1.name = var_588_0
				var_588_1.transform.parent = arg_585_1.stage_.transform
				var_588_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_585_1.bgs_[var_588_0] = var_588_1
			end

			local var_588_2 = 1.999999999999

			if var_588_2 < arg_585_1.time_ and arg_585_1.time_ <= var_588_2 + arg_588_0 then
				local var_588_3 = manager.ui.mainCamera.transform.localPosition
				local var_588_4 = Vector3.New(0, 0, 10) + Vector3.New(var_588_3.x, var_588_3.y, 0)
				local var_588_5 = arg_585_1.bgs_.F01

				var_588_5.transform.localPosition = var_588_4
				var_588_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_588_6 = var_588_5:GetComponent("SpriteRenderer")

				if var_588_6 and var_588_6.sprite then
					local var_588_7 = (var_588_5.transform.localPosition - var_588_3).z
					local var_588_8 = manager.ui.mainCameraCom_
					local var_588_9 = 2 * var_588_7 * Mathf.Tan(var_588_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_588_10 = var_588_9 * var_588_8.aspect
					local var_588_11 = var_588_6.sprite.bounds.size.x
					local var_588_12 = var_588_6.sprite.bounds.size.y
					local var_588_13 = var_588_10 / var_588_11
					local var_588_14 = var_588_9 / var_588_12
					local var_588_15 = var_588_14 < var_588_13 and var_588_13 or var_588_14

					var_588_5.transform.localScale = Vector3.New(var_588_15, var_588_15, 0)
				end

				for iter_588_0, iter_588_1 in pairs(arg_585_1.bgs_) do
					if iter_588_0 ~= "F01" then
						iter_588_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_588_16 = 3.999999999999

			if var_588_16 < arg_585_1.time_ and arg_585_1.time_ <= var_588_16 + arg_588_0 then
				arg_585_1.allBtn_.enabled = false
			end

			local var_588_17 = 0.3

			if arg_585_1.time_ >= var_588_16 + var_588_17 and arg_585_1.time_ < var_588_16 + var_588_17 + arg_588_0 then
				arg_585_1.allBtn_.enabled = true
			end

			local var_588_18 = 0

			if var_588_18 < arg_585_1.time_ and arg_585_1.time_ <= var_588_18 + arg_588_0 then
				arg_585_1.mask_.enabled = true
				arg_585_1.mask_.raycastTarget = true

				arg_585_1:SetGaussion(false)
			end

			local var_588_19 = 2

			if var_588_18 <= arg_585_1.time_ and arg_585_1.time_ < var_588_18 + var_588_19 then
				local var_588_20 = (arg_585_1.time_ - var_588_18) / var_588_19
				local var_588_21 = Color.New(1, 1, 1)

				var_588_21.a = Mathf.Lerp(0, 1, var_588_20)
				arg_585_1.mask_.color = var_588_21
			end

			if arg_585_1.time_ >= var_588_18 + var_588_19 and arg_585_1.time_ < var_588_18 + var_588_19 + arg_588_0 then
				local var_588_22 = Color.New(1, 1, 1)

				var_588_22.a = 1
				arg_585_1.mask_.color = var_588_22
			end

			local var_588_23 = 2

			if var_588_23 < arg_585_1.time_ and arg_585_1.time_ <= var_588_23 + arg_588_0 then
				arg_585_1.mask_.enabled = true
				arg_585_1.mask_.raycastTarget = true

				arg_585_1:SetGaussion(false)
			end

			local var_588_24 = 2

			if var_588_23 <= arg_585_1.time_ and arg_585_1.time_ < var_588_23 + var_588_24 then
				local var_588_25 = (arg_585_1.time_ - var_588_23) / var_588_24
				local var_588_26 = Color.New(1, 1, 1)

				var_588_26.a = Mathf.Lerp(1, 0, var_588_25)
				arg_585_1.mask_.color = var_588_26
			end

			if arg_585_1.time_ >= var_588_23 + var_588_24 and arg_585_1.time_ < var_588_23 + var_588_24 + arg_588_0 then
				local var_588_27 = Color.New(1, 1, 1)
				local var_588_28 = 0

				arg_585_1.mask_.enabled = false
				var_588_27.a = var_588_28
				arg_585_1.mask_.color = var_588_27
			end

			if arg_585_1.frameCnt_ <= 1 then
				arg_585_1.dialog_:SetActive(false)
			end

			local var_588_29 = 3.999999999999
			local var_588_30 = 0.15

			if var_588_29 < arg_585_1.time_ and arg_585_1.time_ <= var_588_29 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0

				arg_585_1.dialog_:SetActive(true)

				local var_588_31 = LeanTween.value(arg_585_1.dialog_, 0, 1, 0.3)

				var_588_31:setOnUpdate(LuaHelper.FloatAction(function(arg_589_0)
					arg_585_1.dialogCg_.alpha = arg_589_0
				end))
				var_588_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_585_1.dialog_)
					var_588_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_585_1.duration_ = arg_585_1.duration_ + 0.3

				SetActive(arg_585_1.leftNameGo_, true)

				local var_588_32 = arg_585_1:FormatText(StoryNameCfg[7].name)

				arg_585_1.leftNameTxt_.text = var_588_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_585_1.leftNameTxt_.transform)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1.leftNameTxt_.text)
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_33 = arg_585_1:GetWordFromCfg(1109704142)
				local var_588_34 = arg_585_1:FormatText(var_588_33.content)

				arg_585_1.text_.text = var_588_34

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_35 = 6
				local var_588_36 = utf8.len(var_588_34)
				local var_588_37 = var_588_35 <= 0 and var_588_30 or var_588_30 * (var_588_36 / var_588_35)

				if var_588_37 > 0 and var_588_30 < var_588_37 then
					arg_585_1.talkMaxDuration = var_588_37
					var_588_29 = var_588_29 + 0.3

					if var_588_37 + var_588_29 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_37 + var_588_29
					end
				end

				arg_585_1.text_.text = var_588_34
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)
				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_38 = var_588_29 + 0.3
			local var_588_39 = math.max(var_588_30, arg_585_1.talkMaxDuration)

			if var_588_38 <= arg_585_1.time_ and arg_585_1.time_ < var_588_38 + var_588_39 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_38) / var_588_39

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_38 + var_588_39 and arg_585_1.time_ < var_588_38 + var_588_39 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704143 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 1109704143
		arg_591_1.duration_ = 10.9

		local var_591_0 = {
			zh = 7.433,
			ja = 10.9
		}
		local var_591_1 = manager.audio:GetLocalizationFlag()

		if var_591_0[var_591_1] ~= nil then
			arg_591_1.duration_ = var_591_0[var_591_1]
		end

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play1109704144(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = "1042ui_story"

			if arg_591_1.actors_[var_594_0] == nil then
				local var_594_1 = Object.Instantiate(Asset.Load("Char/" .. var_594_0), arg_591_1.stage_.transform)

				var_594_1.name = var_594_0
				var_594_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_591_1.actors_[var_594_0] = var_594_1

				local var_594_2 = var_594_1:GetComponentInChildren(typeof(CharacterEffect))

				var_594_2.enabled = true

				local var_594_3 = GameObjectTools.GetOrAddComponent(var_594_1, typeof(DynamicBoneHelper))

				if var_594_3 then
					var_594_3:EnableDynamicBone(false)
				end

				arg_591_1:ShowWeapon(var_594_2.transform, false)

				arg_591_1.var_[var_594_0 .. "Animator"] = var_594_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_591_1.var_[var_594_0 .. "Animator"].applyRootMotion = true
				arg_591_1.var_[var_594_0 .. "LipSync"] = var_594_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_594_4 = arg_591_1.actors_["1042ui_story"].transform
			local var_594_5 = 0

			if var_594_5 < arg_591_1.time_ and arg_591_1.time_ <= var_594_5 + arg_594_0 then
				arg_591_1.var_.moveOldPos1042ui_story = var_594_4.localPosition
			end

			local var_594_6 = 0.001

			if var_594_5 <= arg_591_1.time_ and arg_591_1.time_ < var_594_5 + var_594_6 then
				local var_594_7 = (arg_591_1.time_ - var_594_5) / var_594_6
				local var_594_8 = Vector3.New(0, -1.06, -6.2)

				var_594_4.localPosition = Vector3.Lerp(arg_591_1.var_.moveOldPos1042ui_story, var_594_8, var_594_7)

				local var_594_9 = manager.ui.mainCamera.transform.position - var_594_4.position

				var_594_4.forward = Vector3.New(var_594_9.x, var_594_9.y, var_594_9.z)

				local var_594_10 = var_594_4.localEulerAngles

				var_594_10.z = 0
				var_594_10.x = 0
				var_594_4.localEulerAngles = var_594_10
			end

			if arg_591_1.time_ >= var_594_5 + var_594_6 and arg_591_1.time_ < var_594_5 + var_594_6 + arg_594_0 then
				var_594_4.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_594_11 = manager.ui.mainCamera.transform.position - var_594_4.position

				var_594_4.forward = Vector3.New(var_594_11.x, var_594_11.y, var_594_11.z)

				local var_594_12 = var_594_4.localEulerAngles

				var_594_12.z = 0
				var_594_12.x = 0
				var_594_4.localEulerAngles = var_594_12
			end

			local var_594_13 = arg_591_1.actors_["1042ui_story"]
			local var_594_14 = 0

			if var_594_14 < arg_591_1.time_ and arg_591_1.time_ <= var_594_14 + arg_594_0 and arg_591_1.var_.characterEffect1042ui_story == nil then
				arg_591_1.var_.characterEffect1042ui_story = var_594_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_15 = 0.200000002980232

			if var_594_14 <= arg_591_1.time_ and arg_591_1.time_ < var_594_14 + var_594_15 then
				local var_594_16 = (arg_591_1.time_ - var_594_14) / var_594_15

				if arg_591_1.var_.characterEffect1042ui_story then
					arg_591_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_591_1.time_ >= var_594_14 + var_594_15 and arg_591_1.time_ < var_594_14 + var_594_15 + arg_594_0 and arg_591_1.var_.characterEffect1042ui_story then
				arg_591_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_594_17 = 0

			if var_594_17 < arg_591_1.time_ and arg_591_1.time_ <= var_594_17 + arg_594_0 then
				arg_591_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_594_18 = 0

			if var_594_18 < arg_591_1.time_ and arg_591_1.time_ <= var_594_18 + arg_594_0 then
				arg_591_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_594_19 = 0
			local var_594_20 = 0.725

			if var_594_19 < arg_591_1.time_ and arg_591_1.time_ <= var_594_19 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_21 = arg_591_1:FormatText(StoryNameCfg[205].name)

				arg_591_1.leftNameTxt_.text = var_594_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_22 = arg_591_1:GetWordFromCfg(1109704143)
				local var_594_23 = arg_591_1:FormatText(var_594_22.content)

				arg_591_1.text_.text = var_594_23

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_24 = 29
				local var_594_25 = utf8.len(var_594_23)
				local var_594_26 = var_594_24 <= 0 and var_594_20 or var_594_20 * (var_594_25 / var_594_24)

				if var_594_26 > 0 and var_594_20 < var_594_26 then
					arg_591_1.talkMaxDuration = var_594_26

					if var_594_26 + var_594_19 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_26 + var_594_19
					end
				end

				arg_591_1.text_.text = var_594_23
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704143", "story_v_side_new_1109704.awb") ~= 0 then
					local var_594_27 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704143", "story_v_side_new_1109704.awb") / 1000

					if var_594_27 + var_594_19 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_27 + var_594_19
					end

					if var_594_22.prefab_name ~= "" and arg_591_1.actors_[var_594_22.prefab_name] ~= nil then
						local var_594_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_591_1.actors_[var_594_22.prefab_name].transform, "story_v_side_new_1109704", "1109704143", "story_v_side_new_1109704.awb")

						arg_591_1:RecordAudio("1109704143", var_594_28)
						arg_591_1:RecordAudio("1109704143", var_594_28)
					else
						arg_591_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704143", "story_v_side_new_1109704.awb")
					end

					arg_591_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704143", "story_v_side_new_1109704.awb")
				end

				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_29 = math.max(var_594_20, arg_591_1.talkMaxDuration)

			if var_594_19 <= arg_591_1.time_ and arg_591_1.time_ < var_594_19 + var_594_29 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_19) / var_594_29

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_19 + var_594_29 and arg_591_1.time_ < var_594_19 + var_594_29 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704144 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 1109704144
		arg_595_1.duration_ = 5

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play1109704145(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["1042ui_story"]
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 and arg_595_1.var_.characterEffect1042ui_story == nil then
				arg_595_1.var_.characterEffect1042ui_story = var_598_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_2 = 0.200000002980232

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2

				if arg_595_1.var_.characterEffect1042ui_story then
					local var_598_4 = Mathf.Lerp(0, 0.5, var_598_3)

					arg_595_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_595_1.var_.characterEffect1042ui_story.fillRatio = var_598_4
				end
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 and arg_595_1.var_.characterEffect1042ui_story then
				local var_598_5 = 0.5

				arg_595_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_595_1.var_.characterEffect1042ui_story.fillRatio = var_598_5
			end

			local var_598_6 = 0
			local var_598_7 = 0.05

			if var_598_6 < arg_595_1.time_ and arg_595_1.time_ <= var_598_6 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, true)

				local var_598_8 = arg_595_1:FormatText(StoryNameCfg[7].name)

				arg_595_1.leftNameTxt_.text = var_598_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_595_1.leftNameTxt_.transform)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1.leftNameTxt_.text)
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_9 = arg_595_1:GetWordFromCfg(1109704144)
				local var_598_10 = arg_595_1:FormatText(var_598_9.content)

				arg_595_1.text_.text = var_598_10

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_11 = 2
				local var_598_12 = utf8.len(var_598_10)
				local var_598_13 = var_598_11 <= 0 and var_598_7 or var_598_7 * (var_598_12 / var_598_11)

				if var_598_13 > 0 and var_598_7 < var_598_13 then
					arg_595_1.talkMaxDuration = var_598_13

					if var_598_13 + var_598_6 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_13 + var_598_6
					end
				end

				arg_595_1.text_.text = var_598_10
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)
				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_14 = math.max(var_598_7, arg_595_1.talkMaxDuration)

			if var_598_6 <= arg_595_1.time_ and arg_595_1.time_ < var_598_6 + var_598_14 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_6) / var_598_14

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_6 + var_598_14 and arg_595_1.time_ < var_598_6 + var_598_14 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704145 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 1109704145
		arg_599_1.duration_ = 5

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play1109704146(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = 0
			local var_602_1 = 1.275

			if var_602_0 < arg_599_1.time_ and arg_599_1.time_ <= var_602_0 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, false)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_2 = arg_599_1:GetWordFromCfg(1109704145)
				local var_602_3 = arg_599_1:FormatText(var_602_2.content)

				arg_599_1.text_.text = var_602_3

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_4 = 51
				local var_602_5 = utf8.len(var_602_3)
				local var_602_6 = var_602_4 <= 0 and var_602_1 or var_602_1 * (var_602_5 / var_602_4)

				if var_602_6 > 0 and var_602_1 < var_602_6 then
					arg_599_1.talkMaxDuration = var_602_6

					if var_602_6 + var_602_0 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_6 + var_602_0
					end
				end

				arg_599_1.text_.text = var_602_3
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)
				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_7 = math.max(var_602_1, arg_599_1.talkMaxDuration)

			if var_602_0 <= arg_599_1.time_ and arg_599_1.time_ < var_602_0 + var_602_7 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_0) / var_602_7

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_0 + var_602_7 and arg_599_1.time_ < var_602_0 + var_602_7 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704146 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 1109704146
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play1109704147(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 0.75

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_2 = arg_603_1:FormatText(StoryNameCfg[7].name)

				arg_603_1.leftNameTxt_.text = var_606_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_3 = arg_603_1:GetWordFromCfg(1109704146)
				local var_606_4 = arg_603_1:FormatText(var_606_3.content)

				arg_603_1.text_.text = var_606_4

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_5 = 30
				local var_606_6 = utf8.len(var_606_4)
				local var_606_7 = var_606_5 <= 0 and var_606_1 or var_606_1 * (var_606_6 / var_606_5)

				if var_606_7 > 0 and var_606_1 < var_606_7 then
					arg_603_1.talkMaxDuration = var_606_7

					if var_606_7 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_7 + var_606_0
					end
				end

				arg_603_1.text_.text = var_606_4
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_8 = math.max(var_606_1, arg_603_1.talkMaxDuration)

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_8 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_0) / var_606_8

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_0 + var_606_8 and arg_603_1.time_ < var_606_0 + var_606_8 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704147 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 1109704147
		arg_607_1.duration_ = 8.833

		local var_607_0 = {
			zh = 8.8,
			ja = 8.833
		}
		local var_607_1 = manager.audio:GetLocalizationFlag()

		if var_607_0[var_607_1] ~= nil then
			arg_607_1.duration_ = var_607_0[var_607_1]
		end

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play1109704148(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["1042ui_story"].transform
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 then
				arg_607_1.var_.moveOldPos1042ui_story = var_610_0.localPosition
			end

			local var_610_2 = 0.001

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_2 then
				local var_610_3 = (arg_607_1.time_ - var_610_1) / var_610_2
				local var_610_4 = Vector3.New(0, -1.06, -6.2)

				var_610_0.localPosition = Vector3.Lerp(arg_607_1.var_.moveOldPos1042ui_story, var_610_4, var_610_3)

				local var_610_5 = manager.ui.mainCamera.transform.position - var_610_0.position

				var_610_0.forward = Vector3.New(var_610_5.x, var_610_5.y, var_610_5.z)

				local var_610_6 = var_610_0.localEulerAngles

				var_610_6.z = 0
				var_610_6.x = 0
				var_610_0.localEulerAngles = var_610_6
			end

			if arg_607_1.time_ >= var_610_1 + var_610_2 and arg_607_1.time_ < var_610_1 + var_610_2 + arg_610_0 then
				var_610_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_610_7 = manager.ui.mainCamera.transform.position - var_610_0.position

				var_610_0.forward = Vector3.New(var_610_7.x, var_610_7.y, var_610_7.z)

				local var_610_8 = var_610_0.localEulerAngles

				var_610_8.z = 0
				var_610_8.x = 0
				var_610_0.localEulerAngles = var_610_8
			end

			local var_610_9 = arg_607_1.actors_["1042ui_story"]
			local var_610_10 = 0

			if var_610_10 < arg_607_1.time_ and arg_607_1.time_ <= var_610_10 + arg_610_0 and arg_607_1.var_.characterEffect1042ui_story == nil then
				arg_607_1.var_.characterEffect1042ui_story = var_610_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_11 = 0.200000002980232

			if var_610_10 <= arg_607_1.time_ and arg_607_1.time_ < var_610_10 + var_610_11 then
				local var_610_12 = (arg_607_1.time_ - var_610_10) / var_610_11

				if arg_607_1.var_.characterEffect1042ui_story then
					arg_607_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_607_1.time_ >= var_610_10 + var_610_11 and arg_607_1.time_ < var_610_10 + var_610_11 + arg_610_0 and arg_607_1.var_.characterEffect1042ui_story then
				arg_607_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_610_13 = 0

			if var_610_13 < arg_607_1.time_ and arg_607_1.time_ <= var_610_13 + arg_610_0 then
				arg_607_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_610_14 = 0

			if var_610_14 < arg_607_1.time_ and arg_607_1.time_ <= var_610_14 + arg_610_0 then
				arg_607_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_610_15 = 0
			local var_610_16 = 0.975

			if var_610_15 < arg_607_1.time_ and arg_607_1.time_ <= var_610_15 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_17 = arg_607_1:FormatText(StoryNameCfg[205].name)

				arg_607_1.leftNameTxt_.text = var_610_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_18 = arg_607_1:GetWordFromCfg(1109704147)
				local var_610_19 = arg_607_1:FormatText(var_610_18.content)

				arg_607_1.text_.text = var_610_19

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_20 = 39
				local var_610_21 = utf8.len(var_610_19)
				local var_610_22 = var_610_20 <= 0 and var_610_16 or var_610_16 * (var_610_21 / var_610_20)

				if var_610_22 > 0 and var_610_16 < var_610_22 then
					arg_607_1.talkMaxDuration = var_610_22

					if var_610_22 + var_610_15 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_22 + var_610_15
					end
				end

				arg_607_1.text_.text = var_610_19
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704147", "story_v_side_new_1109704.awb") ~= 0 then
					local var_610_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704147", "story_v_side_new_1109704.awb") / 1000

					if var_610_23 + var_610_15 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_23 + var_610_15
					end

					if var_610_18.prefab_name ~= "" and arg_607_1.actors_[var_610_18.prefab_name] ~= nil then
						local var_610_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_18.prefab_name].transform, "story_v_side_new_1109704", "1109704147", "story_v_side_new_1109704.awb")

						arg_607_1:RecordAudio("1109704147", var_610_24)
						arg_607_1:RecordAudio("1109704147", var_610_24)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704147", "story_v_side_new_1109704.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704147", "story_v_side_new_1109704.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_25 = math.max(var_610_16, arg_607_1.talkMaxDuration)

			if var_610_15 <= arg_607_1.time_ and arg_607_1.time_ < var_610_15 + var_610_25 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_15) / var_610_25

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_15 + var_610_25 and arg_607_1.time_ < var_610_15 + var_610_25 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704148 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 1109704148
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play1109704149(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["1042ui_story"]
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 and arg_611_1.var_.characterEffect1042ui_story == nil then
				arg_611_1.var_.characterEffect1042ui_story = var_614_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_614_2 = 0.200000002980232

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_2 then
				local var_614_3 = (arg_611_1.time_ - var_614_1) / var_614_2

				if arg_611_1.var_.characterEffect1042ui_story then
					local var_614_4 = Mathf.Lerp(0, 0.5, var_614_3)

					arg_611_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_611_1.var_.characterEffect1042ui_story.fillRatio = var_614_4
				end
			end

			if arg_611_1.time_ >= var_614_1 + var_614_2 and arg_611_1.time_ < var_614_1 + var_614_2 + arg_614_0 and arg_611_1.var_.characterEffect1042ui_story then
				local var_614_5 = 0.5

				arg_611_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_611_1.var_.characterEffect1042ui_story.fillRatio = var_614_5
			end

			local var_614_6 = 0
			local var_614_7 = 0.075

			if var_614_6 < arg_611_1.time_ and arg_611_1.time_ <= var_614_6 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_8 = arg_611_1:FormatText(StoryNameCfg[7].name)

				arg_611_1.leftNameTxt_.text = var_614_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_9 = arg_611_1:GetWordFromCfg(1109704148)
				local var_614_10 = arg_611_1:FormatText(var_614_9.content)

				arg_611_1.text_.text = var_614_10

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_11 = 3
				local var_614_12 = utf8.len(var_614_10)
				local var_614_13 = var_614_11 <= 0 and var_614_7 or var_614_7 * (var_614_12 / var_614_11)

				if var_614_13 > 0 and var_614_7 < var_614_13 then
					arg_611_1.talkMaxDuration = var_614_13

					if var_614_13 + var_614_6 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_13 + var_614_6
					end
				end

				arg_611_1.text_.text = var_614_10
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_14 = math.max(var_614_7, arg_611_1.talkMaxDuration)

			if var_614_6 <= arg_611_1.time_ and arg_611_1.time_ < var_614_6 + var_614_14 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_6) / var_614_14

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_6 + var_614_14 and arg_611_1.time_ < var_614_6 + var_614_14 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704149 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 1109704149
		arg_615_1.duration_ = 5

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play1109704150(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0
			local var_618_1 = 1.475

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, false)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_2 = arg_615_1:GetWordFromCfg(1109704149)
				local var_618_3 = arg_615_1:FormatText(var_618_2.content)

				arg_615_1.text_.text = var_618_3

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_4 = 59
				local var_618_5 = utf8.len(var_618_3)
				local var_618_6 = var_618_4 <= 0 and var_618_1 or var_618_1 * (var_618_5 / var_618_4)

				if var_618_6 > 0 and var_618_1 < var_618_6 then
					arg_615_1.talkMaxDuration = var_618_6

					if var_618_6 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_6 + var_618_0
					end
				end

				arg_615_1.text_.text = var_618_3
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)
				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_7 = math.max(var_618_1, arg_615_1.talkMaxDuration)

			if var_618_0 <= arg_615_1.time_ and arg_615_1.time_ < var_618_0 + var_618_7 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_0) / var_618_7

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_0 + var_618_7 and arg_615_1.time_ < var_618_0 + var_618_7 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704150 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 1109704150
		arg_619_1.duration_ = 5

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play1109704151(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 0.625

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_2 = arg_619_1:FormatText(StoryNameCfg[7].name)

				arg_619_1.leftNameTxt_.text = var_622_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_3 = arg_619_1:GetWordFromCfg(1109704150)
				local var_622_4 = arg_619_1:FormatText(var_622_3.content)

				arg_619_1.text_.text = var_622_4

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_5 = 25
				local var_622_6 = utf8.len(var_622_4)
				local var_622_7 = var_622_5 <= 0 and var_622_1 or var_622_1 * (var_622_6 / var_622_5)

				if var_622_7 > 0 and var_622_1 < var_622_7 then
					arg_619_1.talkMaxDuration = var_622_7

					if var_622_7 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_7 + var_622_0
					end
				end

				arg_619_1.text_.text = var_622_4
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)
				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_8 = math.max(var_622_1, arg_619_1.talkMaxDuration)

			if var_622_0 <= arg_619_1.time_ and arg_619_1.time_ < var_622_0 + var_622_8 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_0) / var_622_8

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_0 + var_622_8 and arg_619_1.time_ < var_622_0 + var_622_8 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704151 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 1109704151
		arg_623_1.duration_ = 3.5

		local var_623_0 = {
			zh = 3.4,
			ja = 3.5
		}
		local var_623_1 = manager.audio:GetLocalizationFlag()

		if var_623_0[var_623_1] ~= nil then
			arg_623_1.duration_ = var_623_0[var_623_1]
		end

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play1109704152(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = arg_623_1.actors_["1042ui_story"].transform
			local var_626_1 = 0

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 then
				arg_623_1.var_.moveOldPos1042ui_story = var_626_0.localPosition
			end

			local var_626_2 = 0.001

			if var_626_1 <= arg_623_1.time_ and arg_623_1.time_ < var_626_1 + var_626_2 then
				local var_626_3 = (arg_623_1.time_ - var_626_1) / var_626_2
				local var_626_4 = Vector3.New(0, -1.06, -6.2)

				var_626_0.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1042ui_story, var_626_4, var_626_3)

				local var_626_5 = manager.ui.mainCamera.transform.position - var_626_0.position

				var_626_0.forward = Vector3.New(var_626_5.x, var_626_5.y, var_626_5.z)

				local var_626_6 = var_626_0.localEulerAngles

				var_626_6.z = 0
				var_626_6.x = 0
				var_626_0.localEulerAngles = var_626_6
			end

			if arg_623_1.time_ >= var_626_1 + var_626_2 and arg_623_1.time_ < var_626_1 + var_626_2 + arg_626_0 then
				var_626_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_626_7 = manager.ui.mainCamera.transform.position - var_626_0.position

				var_626_0.forward = Vector3.New(var_626_7.x, var_626_7.y, var_626_7.z)

				local var_626_8 = var_626_0.localEulerAngles

				var_626_8.z = 0
				var_626_8.x = 0
				var_626_0.localEulerAngles = var_626_8
			end

			local var_626_9 = arg_623_1.actors_["1042ui_story"]
			local var_626_10 = 0

			if var_626_10 < arg_623_1.time_ and arg_623_1.time_ <= var_626_10 + arg_626_0 and arg_623_1.var_.characterEffect1042ui_story == nil then
				arg_623_1.var_.characterEffect1042ui_story = var_626_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_11 = 0.200000002980232

			if var_626_10 <= arg_623_1.time_ and arg_623_1.time_ < var_626_10 + var_626_11 then
				local var_626_12 = (arg_623_1.time_ - var_626_10) / var_626_11

				if arg_623_1.var_.characterEffect1042ui_story then
					arg_623_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_10 + var_626_11 and arg_623_1.time_ < var_626_10 + var_626_11 + arg_626_0 and arg_623_1.var_.characterEffect1042ui_story then
				arg_623_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_626_13 = 0

			if var_626_13 < arg_623_1.time_ and arg_623_1.time_ <= var_626_13 + arg_626_0 then
				arg_623_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action1_1")
			end

			local var_626_14 = 0

			if var_626_14 < arg_623_1.time_ and arg_623_1.time_ <= var_626_14 + arg_626_0 then
				arg_623_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_626_15 = 0
			local var_626_16 = 0.35

			if var_626_15 < arg_623_1.time_ and arg_623_1.time_ <= var_626_15 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_17 = arg_623_1:FormatText(StoryNameCfg[205].name)

				arg_623_1.leftNameTxt_.text = var_626_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_18 = arg_623_1:GetWordFromCfg(1109704151)
				local var_626_19 = arg_623_1:FormatText(var_626_18.content)

				arg_623_1.text_.text = var_626_19

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_20 = 14
				local var_626_21 = utf8.len(var_626_19)
				local var_626_22 = var_626_20 <= 0 and var_626_16 or var_626_16 * (var_626_21 / var_626_20)

				if var_626_22 > 0 and var_626_16 < var_626_22 then
					arg_623_1.talkMaxDuration = var_626_22

					if var_626_22 + var_626_15 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_22 + var_626_15
					end
				end

				arg_623_1.text_.text = var_626_19
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704151", "story_v_side_new_1109704.awb") ~= 0 then
					local var_626_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704151", "story_v_side_new_1109704.awb") / 1000

					if var_626_23 + var_626_15 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_23 + var_626_15
					end

					if var_626_18.prefab_name ~= "" and arg_623_1.actors_[var_626_18.prefab_name] ~= nil then
						local var_626_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_18.prefab_name].transform, "story_v_side_new_1109704", "1109704151", "story_v_side_new_1109704.awb")

						arg_623_1:RecordAudio("1109704151", var_626_24)
						arg_623_1:RecordAudio("1109704151", var_626_24)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704151", "story_v_side_new_1109704.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704151", "story_v_side_new_1109704.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_25 = math.max(var_626_16, arg_623_1.talkMaxDuration)

			if var_626_15 <= arg_623_1.time_ and arg_623_1.time_ < var_626_15 + var_626_25 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_15) / var_626_25

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_15 + var_626_25 and arg_623_1.time_ < var_626_15 + var_626_25 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704152 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 1109704152
		arg_627_1.duration_ = 10.933

		local var_627_0 = {
			zh = 10.933,
			ja = 8.9
		}
		local var_627_1 = manager.audio:GetLocalizationFlag()

		if var_627_0[var_627_1] ~= nil then
			arg_627_1.duration_ = var_627_0[var_627_1]
		end

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play1109704153(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = 0

			if var_630_0 < arg_627_1.time_ and arg_627_1.time_ <= var_630_0 + arg_630_0 then
				arg_627_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action6_1")
			end

			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 then
				arg_627_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_630_2 = 0
			local var_630_3 = 1.225

			if var_630_2 < arg_627_1.time_ and arg_627_1.time_ <= var_630_2 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_4 = arg_627_1:FormatText(StoryNameCfg[205].name)

				arg_627_1.leftNameTxt_.text = var_630_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_5 = arg_627_1:GetWordFromCfg(1109704152)
				local var_630_6 = arg_627_1:FormatText(var_630_5.content)

				arg_627_1.text_.text = var_630_6

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_7 = 49
				local var_630_8 = utf8.len(var_630_6)
				local var_630_9 = var_630_7 <= 0 and var_630_3 or var_630_3 * (var_630_8 / var_630_7)

				if var_630_9 > 0 and var_630_3 < var_630_9 then
					arg_627_1.talkMaxDuration = var_630_9

					if var_630_9 + var_630_2 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_9 + var_630_2
					end
				end

				arg_627_1.text_.text = var_630_6
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704152", "story_v_side_new_1109704.awb") ~= 0 then
					local var_630_10 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704152", "story_v_side_new_1109704.awb") / 1000

					if var_630_10 + var_630_2 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_10 + var_630_2
					end

					if var_630_5.prefab_name ~= "" and arg_627_1.actors_[var_630_5.prefab_name] ~= nil then
						local var_630_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_5.prefab_name].transform, "story_v_side_new_1109704", "1109704152", "story_v_side_new_1109704.awb")

						arg_627_1:RecordAudio("1109704152", var_630_11)
						arg_627_1:RecordAudio("1109704152", var_630_11)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704152", "story_v_side_new_1109704.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704152", "story_v_side_new_1109704.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_12 = math.max(var_630_3, arg_627_1.talkMaxDuration)

			if var_630_2 <= arg_627_1.time_ and arg_627_1.time_ < var_630_2 + var_630_12 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_2) / var_630_12

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_2 + var_630_12 and arg_627_1.time_ < var_630_2 + var_630_12 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704153 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 1109704153
		arg_631_1.duration_ = 5

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play1109704154(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1042ui_story"]
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 and arg_631_1.var_.characterEffect1042ui_story == nil then
				arg_631_1.var_.characterEffect1042ui_story = var_634_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_2 = 0.200000002980232

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2

				if arg_631_1.var_.characterEffect1042ui_story then
					local var_634_4 = Mathf.Lerp(0, 0.5, var_634_3)

					arg_631_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_631_1.var_.characterEffect1042ui_story.fillRatio = var_634_4
				end
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 and arg_631_1.var_.characterEffect1042ui_story then
				local var_634_5 = 0.5

				arg_631_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_631_1.var_.characterEffect1042ui_story.fillRatio = var_634_5
			end

			local var_634_6 = 0
			local var_634_7 = 0.3

			if var_634_6 < arg_631_1.time_ and arg_631_1.time_ <= var_634_6 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_8 = arg_631_1:FormatText(StoryNameCfg[7].name)

				arg_631_1.leftNameTxt_.text = var_634_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_9 = arg_631_1:GetWordFromCfg(1109704153)
				local var_634_10 = arg_631_1:FormatText(var_634_9.content)

				arg_631_1.text_.text = var_634_10

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_11 = 12
				local var_634_12 = utf8.len(var_634_10)
				local var_634_13 = var_634_11 <= 0 and var_634_7 or var_634_7 * (var_634_12 / var_634_11)

				if var_634_13 > 0 and var_634_7 < var_634_13 then
					arg_631_1.talkMaxDuration = var_634_13

					if var_634_13 + var_634_6 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_13 + var_634_6
					end
				end

				arg_631_1.text_.text = var_634_10
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)
				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_14 = math.max(var_634_7, arg_631_1.talkMaxDuration)

			if var_634_6 <= arg_631_1.time_ and arg_631_1.time_ < var_634_6 + var_634_14 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_6) / var_634_14

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_6 + var_634_14 and arg_631_1.time_ < var_634_6 + var_634_14 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704154 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 1109704154
		arg_635_1.duration_ = 5

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play1109704155(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1042ui_story"].transform
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 then
				arg_635_1.var_.moveOldPos1042ui_story = var_638_0.localPosition
			end

			local var_638_2 = 0.001

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2
				local var_638_4 = Vector3.New(0, 100, 0)

				var_638_0.localPosition = Vector3.Lerp(arg_635_1.var_.moveOldPos1042ui_story, var_638_4, var_638_3)

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

			local var_638_9 = arg_635_1.actors_["1042ui_story"]
			local var_638_10 = 0

			if var_638_10 < arg_635_1.time_ and arg_635_1.time_ <= var_638_10 + arg_638_0 and arg_635_1.var_.characterEffect1042ui_story == nil then
				arg_635_1.var_.characterEffect1042ui_story = var_638_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_11 = 0.200000002980232

			if var_638_10 <= arg_635_1.time_ and arg_635_1.time_ < var_638_10 + var_638_11 then
				local var_638_12 = (arg_635_1.time_ - var_638_10) / var_638_11

				if arg_635_1.var_.characterEffect1042ui_story then
					local var_638_13 = Mathf.Lerp(0, 0.5, var_638_12)

					arg_635_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_635_1.var_.characterEffect1042ui_story.fillRatio = var_638_13
				end
			end

			if arg_635_1.time_ >= var_638_10 + var_638_11 and arg_635_1.time_ < var_638_10 + var_638_11 + arg_638_0 and arg_635_1.var_.characterEffect1042ui_story then
				local var_638_14 = 0.5

				arg_635_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_635_1.var_.characterEffect1042ui_story.fillRatio = var_638_14
			end

			local var_638_15 = 0
			local var_638_16 = 0.6

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

				local var_638_17 = arg_635_1:GetWordFromCfg(1109704154)
				local var_638_18 = arg_635_1:FormatText(var_638_17.content)

				arg_635_1.text_.text = var_638_18

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_19 = 24
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
	Play1109704155 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 1109704155
		arg_639_1.duration_ = 8.933

		local var_639_0 = {
			zh = 8.933,
			ja = 7
		}
		local var_639_1 = manager.audio:GetLocalizationFlag()

		if var_639_0[var_639_1] ~= nil then
			arg_639_1.duration_ = var_639_0[var_639_1]
		end

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play1109704156(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = arg_639_1.actors_["1097ui_story"].transform
			local var_642_1 = 0

			if var_642_1 < arg_639_1.time_ and arg_639_1.time_ <= var_642_1 + arg_642_0 then
				arg_639_1.var_.moveOldPos1097ui_story = var_642_0.localPosition
			end

			local var_642_2 = 0.001

			if var_642_1 <= arg_639_1.time_ and arg_639_1.time_ < var_642_1 + var_642_2 then
				local var_642_3 = (arg_639_1.time_ - var_642_1) / var_642_2
				local var_642_4 = Vector3.New(0, -0.54, -6.3)

				var_642_0.localPosition = Vector3.Lerp(arg_639_1.var_.moveOldPos1097ui_story, var_642_4, var_642_3)

				local var_642_5 = manager.ui.mainCamera.transform.position - var_642_0.position

				var_642_0.forward = Vector3.New(var_642_5.x, var_642_5.y, var_642_5.z)

				local var_642_6 = var_642_0.localEulerAngles

				var_642_6.z = 0
				var_642_6.x = 0
				var_642_0.localEulerAngles = var_642_6
			end

			if arg_639_1.time_ >= var_642_1 + var_642_2 and arg_639_1.time_ < var_642_1 + var_642_2 + arg_642_0 then
				var_642_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_642_7 = manager.ui.mainCamera.transform.position - var_642_0.position

				var_642_0.forward = Vector3.New(var_642_7.x, var_642_7.y, var_642_7.z)

				local var_642_8 = var_642_0.localEulerAngles

				var_642_8.z = 0
				var_642_8.x = 0
				var_642_0.localEulerAngles = var_642_8
			end

			local var_642_9 = arg_639_1.actors_["1097ui_story"]
			local var_642_10 = 0

			if var_642_10 < arg_639_1.time_ and arg_639_1.time_ <= var_642_10 + arg_642_0 and arg_639_1.var_.characterEffect1097ui_story == nil then
				arg_639_1.var_.characterEffect1097ui_story = var_642_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_11 = 0.200000002980232

			if var_642_10 <= arg_639_1.time_ and arg_639_1.time_ < var_642_10 + var_642_11 then
				local var_642_12 = (arg_639_1.time_ - var_642_10) / var_642_11

				if arg_639_1.var_.characterEffect1097ui_story then
					arg_639_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_639_1.time_ >= var_642_10 + var_642_11 and arg_639_1.time_ < var_642_10 + var_642_11 + arg_642_0 and arg_639_1.var_.characterEffect1097ui_story then
				arg_639_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_642_13 = 0

			if var_642_13 < arg_639_1.time_ and arg_639_1.time_ <= var_642_13 + arg_642_0 then
				arg_639_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_642_14 = 0

			if var_642_14 < arg_639_1.time_ and arg_639_1.time_ <= var_642_14 + arg_642_0 then
				arg_639_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_642_15 = 0
			local var_642_16 = 0.775

			if var_642_15 < arg_639_1.time_ and arg_639_1.time_ <= var_642_15 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_17 = arg_639_1:FormatText(StoryNameCfg[216].name)

				arg_639_1.leftNameTxt_.text = var_642_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_18 = arg_639_1:GetWordFromCfg(1109704155)
				local var_642_19 = arg_639_1:FormatText(var_642_18.content)

				arg_639_1.text_.text = var_642_19

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_20 = 31
				local var_642_21 = utf8.len(var_642_19)
				local var_642_22 = var_642_20 <= 0 and var_642_16 or var_642_16 * (var_642_21 / var_642_20)

				if var_642_22 > 0 and var_642_16 < var_642_22 then
					arg_639_1.talkMaxDuration = var_642_22

					if var_642_22 + var_642_15 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_22 + var_642_15
					end
				end

				arg_639_1.text_.text = var_642_19
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704155", "story_v_side_new_1109704.awb") ~= 0 then
					local var_642_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704155", "story_v_side_new_1109704.awb") / 1000

					if var_642_23 + var_642_15 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_23 + var_642_15
					end

					if var_642_18.prefab_name ~= "" and arg_639_1.actors_[var_642_18.prefab_name] ~= nil then
						local var_642_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_639_1.actors_[var_642_18.prefab_name].transform, "story_v_side_new_1109704", "1109704155", "story_v_side_new_1109704.awb")

						arg_639_1:RecordAudio("1109704155", var_642_24)
						arg_639_1:RecordAudio("1109704155", var_642_24)
					else
						arg_639_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704155", "story_v_side_new_1109704.awb")
					end

					arg_639_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704155", "story_v_side_new_1109704.awb")
				end

				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_25 = math.max(var_642_16, arg_639_1.talkMaxDuration)

			if var_642_15 <= arg_639_1.time_ and arg_639_1.time_ < var_642_15 + var_642_25 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_15) / var_642_25

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_15 + var_642_25 and arg_639_1.time_ < var_642_15 + var_642_25 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704156 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 1109704156
		arg_643_1.duration_ = 5

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play1109704157(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["1097ui_story"]
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 and arg_643_1.var_.characterEffect1097ui_story == nil then
				arg_643_1.var_.characterEffect1097ui_story = var_646_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_2 = 0.200000002980232

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2

				if arg_643_1.var_.characterEffect1097ui_story then
					local var_646_4 = Mathf.Lerp(0, 0.5, var_646_3)

					arg_643_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_643_1.var_.characterEffect1097ui_story.fillRatio = var_646_4
				end
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 and arg_643_1.var_.characterEffect1097ui_story then
				local var_646_5 = 0.5

				arg_643_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_643_1.var_.characterEffect1097ui_story.fillRatio = var_646_5
			end

			local var_646_6 = 0
			local var_646_7 = 0.275

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

				local var_646_9 = arg_643_1:GetWordFromCfg(1109704156)
				local var_646_10 = arg_643_1:FormatText(var_646_9.content)

				arg_643_1.text_.text = var_646_10

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_11 = 11
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
	Play1109704157 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 1109704157
		arg_647_1.duration_ = 2.3

		local var_647_0 = {
			zh = 2.3,
			ja = 2
		}
		local var_647_1 = manager.audio:GetLocalizationFlag()

		if var_647_0[var_647_1] ~= nil then
			arg_647_1.duration_ = var_647_0[var_647_1]
		end

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play1109704158(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = arg_647_1.actors_["1097ui_story"]
			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 and arg_647_1.var_.characterEffect1097ui_story == nil then
				arg_647_1.var_.characterEffect1097ui_story = var_650_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_2 = 0.200000002980232

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_2 then
				local var_650_3 = (arg_647_1.time_ - var_650_1) / var_650_2

				if arg_647_1.var_.characterEffect1097ui_story then
					arg_647_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_647_1.time_ >= var_650_1 + var_650_2 and arg_647_1.time_ < var_650_1 + var_650_2 + arg_650_0 and arg_647_1.var_.characterEffect1097ui_story then
				arg_647_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_650_4 = 0

			if var_650_4 < arg_647_1.time_ and arg_647_1.time_ <= var_650_4 + arg_650_0 then
				arg_647_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_650_5 = 0

			if var_650_5 < arg_647_1.time_ and arg_647_1.time_ <= var_650_5 + arg_650_0 then
				arg_647_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_650_6 = 0
			local var_650_7 = 0.425

			if var_650_6 < arg_647_1.time_ and arg_647_1.time_ <= var_650_6 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_8 = arg_647_1:FormatText(StoryNameCfg[216].name)

				arg_647_1.leftNameTxt_.text = var_650_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_9 = arg_647_1:GetWordFromCfg(1109704157)
				local var_650_10 = arg_647_1:FormatText(var_650_9.content)

				arg_647_1.text_.text = var_650_10

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_11 = 17
				local var_650_12 = utf8.len(var_650_10)
				local var_650_13 = var_650_11 <= 0 and var_650_7 or var_650_7 * (var_650_12 / var_650_11)

				if var_650_13 > 0 and var_650_7 < var_650_13 then
					arg_647_1.talkMaxDuration = var_650_13

					if var_650_13 + var_650_6 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_13 + var_650_6
					end
				end

				arg_647_1.text_.text = var_650_10
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704157", "story_v_side_new_1109704.awb") ~= 0 then
					local var_650_14 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704157", "story_v_side_new_1109704.awb") / 1000

					if var_650_14 + var_650_6 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_14 + var_650_6
					end

					if var_650_9.prefab_name ~= "" and arg_647_1.actors_[var_650_9.prefab_name] ~= nil then
						local var_650_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_9.prefab_name].transform, "story_v_side_new_1109704", "1109704157", "story_v_side_new_1109704.awb")

						arg_647_1:RecordAudio("1109704157", var_650_15)
						arg_647_1:RecordAudio("1109704157", var_650_15)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704157", "story_v_side_new_1109704.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704157", "story_v_side_new_1109704.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_16 = math.max(var_650_7, arg_647_1.talkMaxDuration)

			if var_650_6 <= arg_647_1.time_ and arg_647_1.time_ < var_650_6 + var_650_16 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_6) / var_650_16

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_6 + var_650_16 and arg_647_1.time_ < var_650_6 + var_650_16 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704158 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 1109704158
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play1109704159(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = arg_651_1.actors_["1097ui_story"]
			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 and arg_651_1.var_.characterEffect1097ui_story == nil then
				arg_651_1.var_.characterEffect1097ui_story = var_654_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_654_2 = 0.200000002980232

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_2 then
				local var_654_3 = (arg_651_1.time_ - var_654_1) / var_654_2

				if arg_651_1.var_.characterEffect1097ui_story then
					local var_654_4 = Mathf.Lerp(0, 0.5, var_654_3)

					arg_651_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_651_1.var_.characterEffect1097ui_story.fillRatio = var_654_4
				end
			end

			if arg_651_1.time_ >= var_654_1 + var_654_2 and arg_651_1.time_ < var_654_1 + var_654_2 + arg_654_0 and arg_651_1.var_.characterEffect1097ui_story then
				local var_654_5 = 0.5

				arg_651_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_651_1.var_.characterEffect1097ui_story.fillRatio = var_654_5
			end

			local var_654_6 = arg_651_1.actors_["1097ui_story"].transform
			local var_654_7 = 0

			if var_654_7 < arg_651_1.time_ and arg_651_1.time_ <= var_654_7 + arg_654_0 then
				arg_651_1.var_.moveOldPos1097ui_story = var_654_6.localPosition
			end

			local var_654_8 = 0.001

			if var_654_7 <= arg_651_1.time_ and arg_651_1.time_ < var_654_7 + var_654_8 then
				local var_654_9 = (arg_651_1.time_ - var_654_7) / var_654_8
				local var_654_10 = Vector3.New(0, 100, 0)

				var_654_6.localPosition = Vector3.Lerp(arg_651_1.var_.moveOldPos1097ui_story, var_654_10, var_654_9)

				local var_654_11 = manager.ui.mainCamera.transform.position - var_654_6.position

				var_654_6.forward = Vector3.New(var_654_11.x, var_654_11.y, var_654_11.z)

				local var_654_12 = var_654_6.localEulerAngles

				var_654_12.z = 0
				var_654_12.x = 0
				var_654_6.localEulerAngles = var_654_12
			end

			if arg_651_1.time_ >= var_654_7 + var_654_8 and arg_651_1.time_ < var_654_7 + var_654_8 + arg_654_0 then
				var_654_6.localPosition = Vector3.New(0, 100, 0)

				local var_654_13 = manager.ui.mainCamera.transform.position - var_654_6.position

				var_654_6.forward = Vector3.New(var_654_13.x, var_654_13.y, var_654_13.z)

				local var_654_14 = var_654_6.localEulerAngles

				var_654_14.z = 0
				var_654_14.x = 0
				var_654_6.localEulerAngles = var_654_14
			end

			local var_654_15 = manager.ui.mainCamera.transform
			local var_654_16 = 0.4

			if var_654_16 < arg_651_1.time_ and arg_651_1.time_ <= var_654_16 + arg_654_0 then
				arg_651_1.var_.shakeOldPos = var_654_15.localPosition
			end

			local var_654_17 = 0.6

			if var_654_16 <= arg_651_1.time_ and arg_651_1.time_ < var_654_16 + var_654_17 then
				local var_654_18 = (arg_651_1.time_ - var_654_16) / 0.066
				local var_654_19, var_654_20 = math.modf(var_654_18)

				var_654_15.localPosition = Vector3.New(var_654_20 * 0.13, var_654_20 * 0.13, var_654_20 * 0.13) + arg_651_1.var_.shakeOldPos
			end

			if arg_651_1.time_ >= var_654_16 + var_654_17 and arg_651_1.time_ < var_654_16 + var_654_17 + arg_654_0 then
				var_654_15.localPosition = arg_651_1.var_.shakeOldPos
			end

			local var_654_21 = 0

			if var_654_21 < arg_651_1.time_ and arg_651_1.time_ <= var_654_21 + arg_654_0 then
				arg_651_1.allBtn_.enabled = false
			end

			local var_654_22 = 1

			if arg_651_1.time_ >= var_654_21 + var_654_22 and arg_651_1.time_ < var_654_21 + var_654_22 + arg_654_0 then
				arg_651_1.allBtn_.enabled = true
			end

			local var_654_23 = 0
			local var_654_24 = 1.425

			if var_654_23 < arg_651_1.time_ and arg_651_1.time_ <= var_654_23 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, true)

				local var_654_25 = arg_651_1:FormatText(StoryNameCfg[7].name)

				arg_651_1.leftNameTxt_.text = var_654_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_651_1.leftNameTxt_.transform)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1.leftNameTxt_.text)
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_26 = arg_651_1:GetWordFromCfg(1109704158)
				local var_654_27 = arg_651_1:FormatText(var_654_26.content)

				arg_651_1.text_.text = var_654_27

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_28 = 57
				local var_654_29 = utf8.len(var_654_27)
				local var_654_30 = var_654_28 <= 0 and var_654_24 or var_654_24 * (var_654_29 / var_654_28)

				if var_654_30 > 0 and var_654_24 < var_654_30 then
					arg_651_1.talkMaxDuration = var_654_30

					if var_654_30 + var_654_23 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_30 + var_654_23
					end
				end

				arg_651_1.text_.text = var_654_27
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_31 = math.max(var_654_24, arg_651_1.talkMaxDuration)

			if var_654_23 <= arg_651_1.time_ and arg_651_1.time_ < var_654_23 + var_654_31 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_23) / var_654_31

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_23 + var_654_31 and arg_651_1.time_ < var_654_23 + var_654_31 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704159 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 1109704159
		arg_655_1.duration_ = 5

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play1109704160(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = 0
			local var_658_1 = 0.55

			if var_658_0 < arg_655_1.time_ and arg_655_1.time_ <= var_658_0 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, false)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_2 = arg_655_1:GetWordFromCfg(1109704159)
				local var_658_3 = arg_655_1:FormatText(var_658_2.content)

				arg_655_1.text_.text = var_658_3

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_4 = 22
				local var_658_5 = utf8.len(var_658_3)
				local var_658_6 = var_658_4 <= 0 and var_658_1 or var_658_1 * (var_658_5 / var_658_4)

				if var_658_6 > 0 and var_658_1 < var_658_6 then
					arg_655_1.talkMaxDuration = var_658_6

					if var_658_6 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_6 + var_658_0
					end
				end

				arg_655_1.text_.text = var_658_3
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)
				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_7 = math.max(var_658_1, arg_655_1.talkMaxDuration)

			if var_658_0 <= arg_655_1.time_ and arg_655_1.time_ < var_658_0 + var_658_7 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_0) / var_658_7

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_0 + var_658_7 and arg_655_1.time_ < var_658_0 + var_658_7 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704160 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 1109704160
		arg_659_1.duration_ = 6.733

		local var_659_0 = {
			zh = 6.733,
			ja = 6.5
		}
		local var_659_1 = manager.audio:GetLocalizationFlag()

		if var_659_0[var_659_1] ~= nil then
			arg_659_1.duration_ = var_659_0[var_659_1]
		end

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play1109704161(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["1097ui_story"].transform
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 then
				arg_659_1.var_.moveOldPos1097ui_story = var_662_0.localPosition
			end

			local var_662_2 = 0.001

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2
				local var_662_4 = Vector3.New(0, -0.54, -6.3)

				var_662_0.localPosition = Vector3.Lerp(arg_659_1.var_.moveOldPos1097ui_story, var_662_4, var_662_3)

				local var_662_5 = manager.ui.mainCamera.transform.position - var_662_0.position

				var_662_0.forward = Vector3.New(var_662_5.x, var_662_5.y, var_662_5.z)

				local var_662_6 = var_662_0.localEulerAngles

				var_662_6.z = 0
				var_662_6.x = 0
				var_662_0.localEulerAngles = var_662_6
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 then
				var_662_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_662_7 = manager.ui.mainCamera.transform.position - var_662_0.position

				var_662_0.forward = Vector3.New(var_662_7.x, var_662_7.y, var_662_7.z)

				local var_662_8 = var_662_0.localEulerAngles

				var_662_8.z = 0
				var_662_8.x = 0
				var_662_0.localEulerAngles = var_662_8
			end

			local var_662_9 = arg_659_1.actors_["1097ui_story"]
			local var_662_10 = 0

			if var_662_10 < arg_659_1.time_ and arg_659_1.time_ <= var_662_10 + arg_662_0 and arg_659_1.var_.characterEffect1097ui_story == nil then
				arg_659_1.var_.characterEffect1097ui_story = var_662_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_11 = 0.200000002980232

			if var_662_10 <= arg_659_1.time_ and arg_659_1.time_ < var_662_10 + var_662_11 then
				local var_662_12 = (arg_659_1.time_ - var_662_10) / var_662_11

				if arg_659_1.var_.characterEffect1097ui_story then
					arg_659_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_659_1.time_ >= var_662_10 + var_662_11 and arg_659_1.time_ < var_662_10 + var_662_11 + arg_662_0 and arg_659_1.var_.characterEffect1097ui_story then
				arg_659_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_662_13 = 0

			if var_662_13 < arg_659_1.time_ and arg_659_1.time_ <= var_662_13 + arg_662_0 then
				arg_659_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_662_14 = 0

			if var_662_14 < arg_659_1.time_ and arg_659_1.time_ <= var_662_14 + arg_662_0 then
				arg_659_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_662_15 = 0
			local var_662_16 = 0.75

			if var_662_15 < arg_659_1.time_ and arg_659_1.time_ <= var_662_15 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_17 = arg_659_1:FormatText(StoryNameCfg[216].name)

				arg_659_1.leftNameTxt_.text = var_662_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_18 = arg_659_1:GetWordFromCfg(1109704160)
				local var_662_19 = arg_659_1:FormatText(var_662_18.content)

				arg_659_1.text_.text = var_662_19

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_20 = 30
				local var_662_21 = utf8.len(var_662_19)
				local var_662_22 = var_662_20 <= 0 and var_662_16 or var_662_16 * (var_662_21 / var_662_20)

				if var_662_22 > 0 and var_662_16 < var_662_22 then
					arg_659_1.talkMaxDuration = var_662_22

					if var_662_22 + var_662_15 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_22 + var_662_15
					end
				end

				arg_659_1.text_.text = var_662_19
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704160", "story_v_side_new_1109704.awb") ~= 0 then
					local var_662_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704160", "story_v_side_new_1109704.awb") / 1000

					if var_662_23 + var_662_15 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_23 + var_662_15
					end

					if var_662_18.prefab_name ~= "" and arg_659_1.actors_[var_662_18.prefab_name] ~= nil then
						local var_662_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_18.prefab_name].transform, "story_v_side_new_1109704", "1109704160", "story_v_side_new_1109704.awb")

						arg_659_1:RecordAudio("1109704160", var_662_24)
						arg_659_1:RecordAudio("1109704160", var_662_24)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704160", "story_v_side_new_1109704.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704160", "story_v_side_new_1109704.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_25 = math.max(var_662_16, arg_659_1.talkMaxDuration)

			if var_662_15 <= arg_659_1.time_ and arg_659_1.time_ < var_662_15 + var_662_25 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_15) / var_662_25

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_15 + var_662_25 and arg_659_1.time_ < var_662_15 + var_662_25 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704161 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 1109704161
		arg_663_1.duration_ = 5

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play1109704162(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = arg_663_1.actors_["1097ui_story"]
			local var_666_1 = 0

			if var_666_1 < arg_663_1.time_ and arg_663_1.time_ <= var_666_1 + arg_666_0 and arg_663_1.var_.characterEffect1097ui_story == nil then
				arg_663_1.var_.characterEffect1097ui_story = var_666_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_2 = 0.200000002980232

			if var_666_1 <= arg_663_1.time_ and arg_663_1.time_ < var_666_1 + var_666_2 then
				local var_666_3 = (arg_663_1.time_ - var_666_1) / var_666_2

				if arg_663_1.var_.characterEffect1097ui_story then
					local var_666_4 = Mathf.Lerp(0, 0.5, var_666_3)

					arg_663_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_663_1.var_.characterEffect1097ui_story.fillRatio = var_666_4
				end
			end

			if arg_663_1.time_ >= var_666_1 + var_666_2 and arg_663_1.time_ < var_666_1 + var_666_2 + arg_666_0 and arg_663_1.var_.characterEffect1097ui_story then
				local var_666_5 = 0.5

				arg_663_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_663_1.var_.characterEffect1097ui_story.fillRatio = var_666_5
			end

			local var_666_6 = 0
			local var_666_7 = 0.45

			if var_666_6 < arg_663_1.time_ and arg_663_1.time_ <= var_666_6 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_8 = arg_663_1:FormatText(StoryNameCfg[7].name)

				arg_663_1.leftNameTxt_.text = var_666_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_9 = arg_663_1:GetWordFromCfg(1109704161)
				local var_666_10 = arg_663_1:FormatText(var_666_9.content)

				arg_663_1.text_.text = var_666_10

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_11 = 18
				local var_666_12 = utf8.len(var_666_10)
				local var_666_13 = var_666_11 <= 0 and var_666_7 or var_666_7 * (var_666_12 / var_666_11)

				if var_666_13 > 0 and var_666_7 < var_666_13 then
					arg_663_1.talkMaxDuration = var_666_13

					if var_666_13 + var_666_6 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_13 + var_666_6
					end
				end

				arg_663_1.text_.text = var_666_10
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)
				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_14 = math.max(var_666_7, arg_663_1.talkMaxDuration)

			if var_666_6 <= arg_663_1.time_ and arg_663_1.time_ < var_666_6 + var_666_14 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_6) / var_666_14

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_6 + var_666_14 and arg_663_1.time_ < var_666_6 + var_666_14 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704162 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 1109704162
		arg_667_1.duration_ = 5

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play1109704163(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0
			local var_670_1 = 1.075

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, false)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_2 = arg_667_1:GetWordFromCfg(1109704162)
				local var_670_3 = arg_667_1:FormatText(var_670_2.content)

				arg_667_1.text_.text = var_670_3

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_4 = 43
				local var_670_5 = utf8.len(var_670_3)
				local var_670_6 = var_670_4 <= 0 and var_670_1 or var_670_1 * (var_670_5 / var_670_4)

				if var_670_6 > 0 and var_670_1 < var_670_6 then
					arg_667_1.talkMaxDuration = var_670_6

					if var_670_6 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_6 + var_670_0
					end
				end

				arg_667_1.text_.text = var_670_3
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)
				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_7 = math.max(var_670_1, arg_667_1.talkMaxDuration)

			if var_670_0 <= arg_667_1.time_ and arg_667_1.time_ < var_670_0 + var_670_7 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_0) / var_670_7

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_0 + var_670_7 and arg_667_1.time_ < var_670_0 + var_670_7 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704163 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 1109704163
		arg_671_1.duration_ = 5

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play1109704164(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = 0
			local var_674_1 = 0.5

			if var_674_0 < arg_671_1.time_ and arg_671_1.time_ <= var_674_0 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_2 = arg_671_1:FormatText(StoryNameCfg[7].name)

				arg_671_1.leftNameTxt_.text = var_674_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_3 = arg_671_1:GetWordFromCfg(1109704163)
				local var_674_4 = arg_671_1:FormatText(var_674_3.content)

				arg_671_1.text_.text = var_674_4

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_5 = 20
				local var_674_6 = utf8.len(var_674_4)
				local var_674_7 = var_674_5 <= 0 and var_674_1 or var_674_1 * (var_674_6 / var_674_5)

				if var_674_7 > 0 and var_674_1 < var_674_7 then
					arg_671_1.talkMaxDuration = var_674_7

					if var_674_7 + var_674_0 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_7 + var_674_0
					end
				end

				arg_671_1.text_.text = var_674_4
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)
				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_8 = math.max(var_674_1, arg_671_1.talkMaxDuration)

			if var_674_0 <= arg_671_1.time_ and arg_671_1.time_ < var_674_0 + var_674_8 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_0) / var_674_8

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_0 + var_674_8 and arg_671_1.time_ < var_674_0 + var_674_8 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play1109704164 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 1109704164
		arg_675_1.duration_ = 5.1

		local var_675_0 = {
			zh = 1.999999999999,
			ja = 5.1
		}
		local var_675_1 = manager.audio:GetLocalizationFlag()

		if var_675_0[var_675_1] ~= nil then
			arg_675_1.duration_ = var_675_0[var_675_1]
		end

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
			arg_675_1.auto_ = false
		end

		function arg_675_1.playNext_(arg_677_0)
			arg_675_1.onStoryFinished_()
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = arg_675_1.actors_["1097ui_story"].transform
			local var_678_1 = 0

			if var_678_1 < arg_675_1.time_ and arg_675_1.time_ <= var_678_1 + arg_678_0 then
				arg_675_1.var_.moveOldPos1097ui_story = var_678_0.localPosition
			end

			local var_678_2 = 0.001

			if var_678_1 <= arg_675_1.time_ and arg_675_1.time_ < var_678_1 + var_678_2 then
				local var_678_3 = (arg_675_1.time_ - var_678_1) / var_678_2
				local var_678_4 = Vector3.New(0, -0.54, -6.3)

				var_678_0.localPosition = Vector3.Lerp(arg_675_1.var_.moveOldPos1097ui_story, var_678_4, var_678_3)

				local var_678_5 = manager.ui.mainCamera.transform.position - var_678_0.position

				var_678_0.forward = Vector3.New(var_678_5.x, var_678_5.y, var_678_5.z)

				local var_678_6 = var_678_0.localEulerAngles

				var_678_6.z = 0
				var_678_6.x = 0
				var_678_0.localEulerAngles = var_678_6
			end

			if arg_675_1.time_ >= var_678_1 + var_678_2 and arg_675_1.time_ < var_678_1 + var_678_2 + arg_678_0 then
				var_678_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_678_7 = manager.ui.mainCamera.transform.position - var_678_0.position

				var_678_0.forward = Vector3.New(var_678_7.x, var_678_7.y, var_678_7.z)

				local var_678_8 = var_678_0.localEulerAngles

				var_678_8.z = 0
				var_678_8.x = 0
				var_678_0.localEulerAngles = var_678_8
			end

			local var_678_9 = arg_675_1.actors_["1097ui_story"]
			local var_678_10 = 0

			if var_678_10 < arg_675_1.time_ and arg_675_1.time_ <= var_678_10 + arg_678_0 and arg_675_1.var_.characterEffect1097ui_story == nil then
				arg_675_1.var_.characterEffect1097ui_story = var_678_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_11 = 0.200000002980232

			if var_678_10 <= arg_675_1.time_ and arg_675_1.time_ < var_678_10 + var_678_11 then
				local var_678_12 = (arg_675_1.time_ - var_678_10) / var_678_11

				if arg_675_1.var_.characterEffect1097ui_story then
					arg_675_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_675_1.time_ >= var_678_10 + var_678_11 and arg_675_1.time_ < var_678_10 + var_678_11 + arg_678_0 and arg_675_1.var_.characterEffect1097ui_story then
				arg_675_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_678_13 = 0

			if var_678_13 < arg_675_1.time_ and arg_675_1.time_ <= var_678_13 + arg_678_0 then
				arg_675_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_678_14 = 0

			if var_678_14 < arg_675_1.time_ and arg_675_1.time_ <= var_678_14 + arg_678_0 then
				arg_675_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_678_15 = 0
			local var_678_16 = 0.1

			if var_678_15 < arg_675_1.time_ and arg_675_1.time_ <= var_678_15 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_17 = arg_675_1:FormatText(StoryNameCfg[216].name)

				arg_675_1.leftNameTxt_.text = var_678_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_18 = arg_675_1:GetWordFromCfg(1109704164)
				local var_678_19 = arg_675_1:FormatText(var_678_18.content)

				arg_675_1.text_.text = var_678_19

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_20 = 4
				local var_678_21 = utf8.len(var_678_19)
				local var_678_22 = var_678_20 <= 0 and var_678_16 or var_678_16 * (var_678_21 / var_678_20)

				if var_678_22 > 0 and var_678_16 < var_678_22 then
					arg_675_1.talkMaxDuration = var_678_22

					if var_678_22 + var_678_15 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_22 + var_678_15
					end
				end

				arg_675_1.text_.text = var_678_19
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704164", "story_v_side_new_1109704.awb") ~= 0 then
					local var_678_23 = manager.audio:GetVoiceLength("story_v_side_new_1109704", "1109704164", "story_v_side_new_1109704.awb") / 1000

					if var_678_23 + var_678_15 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_23 + var_678_15
					end

					if var_678_18.prefab_name ~= "" and arg_675_1.actors_[var_678_18.prefab_name] ~= nil then
						local var_678_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_675_1.actors_[var_678_18.prefab_name].transform, "story_v_side_new_1109704", "1109704164", "story_v_side_new_1109704.awb")

						arg_675_1:RecordAudio("1109704164", var_678_24)
						arg_675_1:RecordAudio("1109704164", var_678_24)
					else
						arg_675_1:AudioAction("play", "voice", "story_v_side_new_1109704", "1109704164", "story_v_side_new_1109704.awb")
					end

					arg_675_1:RecordHistoryTalkVoice("story_v_side_new_1109704", "1109704164", "story_v_side_new_1109704.awb")
				end

				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_25 = math.max(var_678_16, arg_675_1.talkMaxDuration)

			if var_678_15 <= arg_675_1.time_ and arg_675_1.time_ < var_678_15 + var_678_25 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_15) / var_678_25

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_15 + var_678_25 and arg_675_1.time_ < var_678_15 + var_678_25 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST60",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R9701",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01"
	},
	voices = {
		"story_v_side_new_1109704.awb"
	}
}
