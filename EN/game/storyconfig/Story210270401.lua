return {
	Play1102704001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1102704001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play1102704002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "B13"

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
				local var_4_5 = arg_1_1.bgs_.B13

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
					if iter_4_0 ~= "B13" then
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

			local var_4_26 = 1.73333333333333
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_side_daily01", "bgm_side_daily01", "bgm_side_daily01.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.875

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

				local var_4_33 = arg_1_1:GetWordFromCfg(1102704001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 75
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
	Play1102704002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 1102704002
		arg_7_1.duration_ = 9.8

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play1102704003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1027ui_story"

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

			local var_10_4 = arg_7_1.actors_["1027ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1027ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -0.81, -5.8)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1027ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -0.81, -5.8)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["1027ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1027ui_story == nil then
				arg_7_1.var_.characterEffect1027ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect1027ui_story then
					arg_7_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1027ui_story then
				arg_7_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = 0
			local var_10_20 = 1.175

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[56].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(1102704002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 47
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704002", "story_v_side_new_1102704.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704002", "story_v_side_new_1102704.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_side_new_1102704", "1102704002", "story_v_side_new_1102704.awb")

						arg_7_1:RecordAudio("1102704002", var_10_28)
						arg_7_1:RecordAudio("1102704002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704002", "story_v_side_new_1102704.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704002", "story_v_side_new_1102704.awb")
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
	Play1102704003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 1102704003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play1102704004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1027ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1027ui_story == nil then
				arg_11_1.var_.characterEffect1027ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1027ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1027ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1027ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1027ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.725

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[7].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(1102704003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 29
				local var_14_12 = utf8.len(var_14_10)
				local var_14_13 = var_14_11 <= 0 and var_14_7 or var_14_7 * (var_14_12 / var_14_11)

				if var_14_13 > 0 and var_14_7 < var_14_13 then
					arg_11_1.talkMaxDuration = var_14_13

					if var_14_13 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_10
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_14 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_14 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_14

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_14 and arg_11_1.time_ < var_14_6 + var_14_14 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 1102704004
		arg_15_1.duration_ = 12.1

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play1102704005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1027ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1027ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(-0.7, -0.81, -5.8)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1027ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-0.7, -0.81, -5.8)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["1027ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1027ui_story == nil then
				arg_15_1.var_.characterEffect1027ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1027ui_story then
					local var_18_13 = Mathf.Lerp(0, 0.5, var_18_12)

					arg_15_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1027ui_story.fillRatio = var_18_13
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1027ui_story then
				local var_18_14 = 0.5

				arg_15_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1027ui_story.fillRatio = var_18_14
			end

			local var_18_15 = "1039ui_story"

			if arg_15_1.actors_[var_18_15] == nil then
				local var_18_16 = Object.Instantiate(Asset.Load("Char/" .. var_18_15), arg_15_1.stage_.transform)

				var_18_16.name = var_18_15
				var_18_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_15] = var_18_16

				local var_18_17 = var_18_16:GetComponentInChildren(typeof(CharacterEffect))

				var_18_17.enabled = true

				local var_18_18 = GameObjectTools.GetOrAddComponent(var_18_16, typeof(DynamicBoneHelper))

				if var_18_18 then
					var_18_18:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_17.transform, false)

				arg_15_1.var_[var_18_15 .. "Animator"] = var_18_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_15 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_15 .. "LipSync"] = var_18_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_19 = arg_15_1.actors_["1039ui_story"].transform
			local var_18_20 = 0

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 then
				arg_15_1.var_.moveOldPos1039ui_story = var_18_19.localPosition
			end

			local var_18_21 = 0.001

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_21 then
				local var_18_22 = (arg_15_1.time_ - var_18_20) / var_18_21
				local var_18_23 = Vector3.New(0.7, -1.01, -5.9)

				var_18_19.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1039ui_story, var_18_23, var_18_22)

				local var_18_24 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_24.x, var_18_24.y, var_18_24.z)

				local var_18_25 = var_18_19.localEulerAngles

				var_18_25.z = 0
				var_18_25.x = 0
				var_18_19.localEulerAngles = var_18_25
			end

			if arg_15_1.time_ >= var_18_20 + var_18_21 and arg_15_1.time_ < var_18_20 + var_18_21 + arg_18_0 then
				var_18_19.localPosition = Vector3.New(0.7, -1.01, -5.9)

				local var_18_26 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_26.x, var_18_26.y, var_18_26.z)

				local var_18_27 = var_18_19.localEulerAngles

				var_18_27.z = 0
				var_18_27.x = 0
				var_18_19.localEulerAngles = var_18_27
			end

			local var_18_28 = arg_15_1.actors_["1039ui_story"]
			local var_18_29 = 0

			if var_18_29 < arg_15_1.time_ and arg_15_1.time_ <= var_18_29 + arg_18_0 and arg_15_1.var_.characterEffect1039ui_story == nil then
				arg_15_1.var_.characterEffect1039ui_story = var_18_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_30 = 0.200000002980232

			if var_18_29 <= arg_15_1.time_ and arg_15_1.time_ < var_18_29 + var_18_30 then
				local var_18_31 = (arg_15_1.time_ - var_18_29) / var_18_30

				if arg_15_1.var_.characterEffect1039ui_story then
					arg_15_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_29 + var_18_30 and arg_15_1.time_ < var_18_29 + var_18_30 + arg_18_0 and arg_15_1.var_.characterEffect1039ui_story then
				arg_15_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_18_32 = 0

			if var_18_32 < arg_15_1.time_ and arg_15_1.time_ <= var_18_32 + arg_18_0 then
				arg_15_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action4_1")
			end

			local var_18_33 = 0

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				arg_15_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_34 = 0
			local var_18_35 = 1.475

			if var_18_34 < arg_15_1.time_ and arg_15_1.time_ <= var_18_34 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_36 = arg_15_1:FormatText(StoryNameCfg[9].name)

				arg_15_1.leftNameTxt_.text = var_18_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_37 = arg_15_1:GetWordFromCfg(1102704004)
				local var_18_38 = arg_15_1:FormatText(var_18_37.content)

				arg_15_1.text_.text = var_18_38

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_39 = 58
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704004", "story_v_side_new_1102704.awb") ~= 0 then
					local var_18_42 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704004", "story_v_side_new_1102704.awb") / 1000

					if var_18_42 + var_18_34 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_42 + var_18_34
					end

					if var_18_37.prefab_name ~= "" and arg_15_1.actors_[var_18_37.prefab_name] ~= nil then
						local var_18_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_37.prefab_name].transform, "story_v_side_new_1102704", "1102704004", "story_v_side_new_1102704.awb")

						arg_15_1:RecordAudio("1102704004", var_18_43)
						arg_15_1:RecordAudio("1102704004", var_18_43)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704004", "story_v_side_new_1102704.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704004", "story_v_side_new_1102704.awb")
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
	Play1102704005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 1102704005
		arg_19_1.duration_ = 10.2

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play1102704006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1027ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1027ui_story == nil then
				arg_19_1.var_.characterEffect1027ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1027ui_story then
					arg_19_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1027ui_story then
				arg_19_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_22_4 = 0

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_2")
			end

			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_6 = arg_19_1.actors_["1039ui_story"]
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 and arg_19_1.var_.characterEffect1039ui_story == nil then
				arg_19_1.var_.characterEffect1039ui_story = var_22_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_8 = 0.200000002980232

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8

				if arg_19_1.var_.characterEffect1039ui_story then
					local var_22_10 = Mathf.Lerp(0, 0.5, var_22_9)

					arg_19_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1039ui_story.fillRatio = var_22_10
				end
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 and arg_19_1.var_.characterEffect1039ui_story then
				local var_22_11 = 0.5

				arg_19_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1039ui_story.fillRatio = var_22_11
			end

			local var_22_12 = 0
			local var_22_13 = 1.15

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_14 = arg_19_1:FormatText(StoryNameCfg[56].name)

				arg_19_1.leftNameTxt_.text = var_22_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(1102704005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 46
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704005", "story_v_side_new_1102704.awb") ~= 0 then
					local var_22_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704005", "story_v_side_new_1102704.awb") / 1000

					if var_22_20 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_12
					end

					if var_22_15.prefab_name ~= "" and arg_19_1.actors_[var_22_15.prefab_name] ~= nil then
						local var_22_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_15.prefab_name].transform, "story_v_side_new_1102704", "1102704005", "story_v_side_new_1102704.awb")

						arg_19_1:RecordAudio("1102704005", var_22_21)
						arg_19_1:RecordAudio("1102704005", var_22_21)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704005", "story_v_side_new_1102704.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704005", "story_v_side_new_1102704.awb")
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
	Play1102704006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 1102704006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play1102704007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1027ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1027ui_story == nil then
				arg_23_1.var_.characterEffect1027ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1027ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1027ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1027ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1027ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 1.15

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[7].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(1102704006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 46
				local var_26_12 = utf8.len(var_26_10)
				local var_26_13 = var_26_11 <= 0 and var_26_7 or var_26_7 * (var_26_12 / var_26_11)

				if var_26_13 > 0 and var_26_7 < var_26_13 then
					arg_23_1.talkMaxDuration = var_26_13

					if var_26_13 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_10
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_14 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_14 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_14

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_14 and arg_23_1.time_ < var_26_6 + var_26_14 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 1102704007
		arg_27_1.duration_ = 9.666

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play1102704008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1039ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1039ui_story == nil then
				arg_27_1.var_.characterEffect1039ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1039ui_story then
					arg_27_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1039ui_story then
				arg_27_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_30_4 = 0

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action445")
			end

			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_6 = 0
			local var_30_7 = 1.175

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[9].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(1102704007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 47
				local var_30_12 = utf8.len(var_30_10)
				local var_30_13 = var_30_11 <= 0 and var_30_7 or var_30_7 * (var_30_12 / var_30_11)

				if var_30_13 > 0 and var_30_7 < var_30_13 then
					arg_27_1.talkMaxDuration = var_30_13

					if var_30_13 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_13 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_10
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704007", "story_v_side_new_1102704.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704007", "story_v_side_new_1102704.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_side_new_1102704", "1102704007", "story_v_side_new_1102704.awb")

						arg_27_1:RecordAudio("1102704007", var_30_15)
						arg_27_1:RecordAudio("1102704007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704007", "story_v_side_new_1102704.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704007", "story_v_side_new_1102704.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_16 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_16 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_16

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_16 and arg_27_1.time_ < var_30_6 + var_30_16 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 1102704008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play1102704009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1039ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1039ui_story == nil then
				arg_31_1.var_.characterEffect1039ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1039ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1039ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1039ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1039ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.75

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[7].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(1102704008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 30
				local var_34_12 = utf8.len(var_34_10)
				local var_34_13 = var_34_11 <= 0 and var_34_7 or var_34_7 * (var_34_12 / var_34_11)

				if var_34_13 > 0 and var_34_7 < var_34_13 then
					arg_31_1.talkMaxDuration = var_34_13

					if var_34_13 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_10
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_14 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_14 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_14

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_14 and arg_31_1.time_ < var_34_6 + var_34_14 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 1102704009
		arg_35_1.duration_ = 9.833

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play1102704010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1027ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1027ui_story == nil then
				arg_35_1.var_.characterEffect1027ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1027ui_story then
					arg_35_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1027ui_story then
				arg_35_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_38_4 = 0

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action1_1")
			end

			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_6 = 0
			local var_38_7 = 1.25

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[56].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(1102704009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 50
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704009", "story_v_side_new_1102704.awb") ~= 0 then
					local var_38_14 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704009", "story_v_side_new_1102704.awb") / 1000

					if var_38_14 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_14 + var_38_6
					end

					if var_38_9.prefab_name ~= "" and arg_35_1.actors_[var_38_9.prefab_name] ~= nil then
						local var_38_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_9.prefab_name].transform, "story_v_side_new_1102704", "1102704009", "story_v_side_new_1102704.awb")

						arg_35_1:RecordAudio("1102704009", var_38_15)
						arg_35_1:RecordAudio("1102704009", var_38_15)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704009", "story_v_side_new_1102704.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704009", "story_v_side_new_1102704.awb")
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
	Play1102704010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 1102704010
		arg_39_1.duration_ = 12.333

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play1102704011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1039ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1039ui_story == nil then
				arg_39_1.var_.characterEffect1039ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1039ui_story then
					arg_39_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1039ui_story then
				arg_39_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action456")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_42_6 = arg_39_1.actors_["1027ui_story"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.characterEffect1027ui_story == nil then
				arg_39_1.var_.characterEffect1027ui_story = var_42_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_8 = 0.200000002980232

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.characterEffect1027ui_story then
					local var_42_10 = Mathf.Lerp(0, 0.5, var_42_9)

					arg_39_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1027ui_story.fillRatio = var_42_10
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.characterEffect1027ui_story then
				local var_42_11 = 0.5

				arg_39_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1027ui_story.fillRatio = var_42_11
			end

			local var_42_12 = 0
			local var_42_13 = 1.25

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[9].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(1102704010)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 50
				local var_42_18 = utf8.len(var_42_16)
				local var_42_19 = var_42_17 <= 0 and var_42_13 or var_42_13 * (var_42_18 / var_42_17)

				if var_42_19 > 0 and var_42_13 < var_42_19 then
					arg_39_1.talkMaxDuration = var_42_19

					if var_42_19 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_12
					end
				end

				arg_39_1.text_.text = var_42_16
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704010", "story_v_side_new_1102704.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704010", "story_v_side_new_1102704.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_side_new_1102704", "1102704010", "story_v_side_new_1102704.awb")

						arg_39_1:RecordAudio("1102704010", var_42_21)
						arg_39_1:RecordAudio("1102704010", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704010", "story_v_side_new_1102704.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704010", "story_v_side_new_1102704.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_22 = math.max(var_42_13, arg_39_1.talkMaxDuration)

			if var_42_12 <= arg_39_1.time_ and arg_39_1.time_ < var_42_12 + var_42_22 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_12) / var_42_22

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_12 + var_42_22 and arg_39_1.time_ < var_42_12 + var_42_22 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 1102704011
		arg_43_1.duration_ = 9.1

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play1102704012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_46_1 = 0
			local var_46_2 = 1.175

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_3 = arg_43_1:FormatText(StoryNameCfg[9].name)

				arg_43_1.leftNameTxt_.text = var_46_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_4 = arg_43_1:GetWordFromCfg(1102704011)
				local var_46_5 = arg_43_1:FormatText(var_46_4.content)

				arg_43_1.text_.text = var_46_5

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_6 = 47
				local var_46_7 = utf8.len(var_46_5)
				local var_46_8 = var_46_6 <= 0 and var_46_2 or var_46_2 * (var_46_7 / var_46_6)

				if var_46_8 > 0 and var_46_2 < var_46_8 then
					arg_43_1.talkMaxDuration = var_46_8

					if var_46_8 + var_46_1 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_1
					end
				end

				arg_43_1.text_.text = var_46_5
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704011", "story_v_side_new_1102704.awb") ~= 0 then
					local var_46_9 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704011", "story_v_side_new_1102704.awb") / 1000

					if var_46_9 + var_46_1 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_9 + var_46_1
					end

					if var_46_4.prefab_name ~= "" and arg_43_1.actors_[var_46_4.prefab_name] ~= nil then
						local var_46_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_4.prefab_name].transform, "story_v_side_new_1102704", "1102704011", "story_v_side_new_1102704.awb")

						arg_43_1:RecordAudio("1102704011", var_46_10)
						arg_43_1:RecordAudio("1102704011", var_46_10)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704011", "story_v_side_new_1102704.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704011", "story_v_side_new_1102704.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_11 = math.max(var_46_2, arg_43_1.talkMaxDuration)

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_11 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_1) / var_46_11

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_1 + var_46_11 and arg_43_1.time_ < var_46_1 + var_46_11 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 1102704012
		arg_47_1.duration_ = 9.5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play1102704013(arg_47_1)
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
					arg_47_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1027ui_story then
				arg_47_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action6_1")
			end

			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_6 = arg_47_1.actors_["1039ui_story"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.characterEffect1039ui_story == nil then
				arg_47_1.var_.characterEffect1039ui_story = var_50_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_8 = 0.200000002980232

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.characterEffect1039ui_story then
					local var_50_10 = Mathf.Lerp(0, 0.5, var_50_9)

					arg_47_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1039ui_story.fillRatio = var_50_10
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.characterEffect1039ui_story then
				local var_50_11 = 0.5

				arg_47_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1039ui_story.fillRatio = var_50_11
			end

			local var_50_12 = 0
			local var_50_13 = 0.825

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_14 = arg_47_1:FormatText(StoryNameCfg[56].name)

				arg_47_1.leftNameTxt_.text = var_50_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(1102704012)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 33
				local var_50_18 = utf8.len(var_50_16)
				local var_50_19 = var_50_17 <= 0 and var_50_13 or var_50_13 * (var_50_18 / var_50_17)

				if var_50_19 > 0 and var_50_13 < var_50_19 then
					arg_47_1.talkMaxDuration = var_50_19

					if var_50_19 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_19 + var_50_12
					end
				end

				arg_47_1.text_.text = var_50_16
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704012", "story_v_side_new_1102704.awb") ~= 0 then
					local var_50_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704012", "story_v_side_new_1102704.awb") / 1000

					if var_50_20 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_12
					end

					if var_50_15.prefab_name ~= "" and arg_47_1.actors_[var_50_15.prefab_name] ~= nil then
						local var_50_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_15.prefab_name].transform, "story_v_side_new_1102704", "1102704012", "story_v_side_new_1102704.awb")

						arg_47_1:RecordAudio("1102704012", var_50_21)
						arg_47_1:RecordAudio("1102704012", var_50_21)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704012", "story_v_side_new_1102704.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704012", "story_v_side_new_1102704.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_22 = math.max(var_50_13, arg_47_1.talkMaxDuration)

			if var_50_12 <= arg_47_1.time_ and arg_47_1.time_ < var_50_12 + var_50_22 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_12) / var_50_22

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_12 + var_50_22 and arg_47_1.time_ < var_50_12 + var_50_22 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 1102704013
		arg_51_1.duration_ = 8.7

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play1102704014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1039ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1039ui_story == nil then
				arg_51_1.var_.characterEffect1039ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1039ui_story then
					arg_51_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1039ui_story then
				arg_51_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_54_4 = 0

			if var_54_4 < arg_51_1.time_ and arg_51_1.time_ <= var_54_4 + arg_54_0 then
				arg_51_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action6_2")
			end

			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 then
				arg_51_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_54_6 = arg_51_1.actors_["1027ui_story"]
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 and arg_51_1.var_.characterEffect1027ui_story == nil then
				arg_51_1.var_.characterEffect1027ui_story = var_54_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_8 = 0.200000002980232

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_8 then
				local var_54_9 = (arg_51_1.time_ - var_54_7) / var_54_8

				if arg_51_1.var_.characterEffect1027ui_story then
					local var_54_10 = Mathf.Lerp(0, 0.5, var_54_9)

					arg_51_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1027ui_story.fillRatio = var_54_10
				end
			end

			if arg_51_1.time_ >= var_54_7 + var_54_8 and arg_51_1.time_ < var_54_7 + var_54_8 + arg_54_0 and arg_51_1.var_.characterEffect1027ui_story then
				local var_54_11 = 0.5

				arg_51_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1027ui_story.fillRatio = var_54_11
			end

			local var_54_12 = 0
			local var_54_13 = 0.875

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_14 = arg_51_1:FormatText(StoryNameCfg[9].name)

				arg_51_1.leftNameTxt_.text = var_54_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_15 = arg_51_1:GetWordFromCfg(1102704013)
				local var_54_16 = arg_51_1:FormatText(var_54_15.content)

				arg_51_1.text_.text = var_54_16

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_17 = 35
				local var_54_18 = utf8.len(var_54_16)
				local var_54_19 = var_54_17 <= 0 and var_54_13 or var_54_13 * (var_54_18 / var_54_17)

				if var_54_19 > 0 and var_54_13 < var_54_19 then
					arg_51_1.talkMaxDuration = var_54_19

					if var_54_19 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_12
					end
				end

				arg_51_1.text_.text = var_54_16
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704013", "story_v_side_new_1102704.awb") ~= 0 then
					local var_54_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704013", "story_v_side_new_1102704.awb") / 1000

					if var_54_20 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_20 + var_54_12
					end

					if var_54_15.prefab_name ~= "" and arg_51_1.actors_[var_54_15.prefab_name] ~= nil then
						local var_54_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_15.prefab_name].transform, "story_v_side_new_1102704", "1102704013", "story_v_side_new_1102704.awb")

						arg_51_1:RecordAudio("1102704013", var_54_21)
						arg_51_1:RecordAudio("1102704013", var_54_21)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704013", "story_v_side_new_1102704.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704013", "story_v_side_new_1102704.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_22 = math.max(var_54_13, arg_51_1.talkMaxDuration)

			if var_54_12 <= arg_51_1.time_ and arg_51_1.time_ < var_54_12 + var_54_22 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_12) / var_54_22

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_12 + var_54_22 and arg_51_1.time_ < var_54_12 + var_54_22 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 1102704014
		arg_55_1.duration_ = 6.766

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play1102704015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1027ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1027ui_story == nil then
				arg_55_1.var_.characterEffect1027ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1027ui_story then
					arg_55_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1027ui_story then
				arg_55_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_58_4 = 0

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action6_2")
			end

			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_58_6 = arg_55_1.actors_["1039ui_story"]
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 and arg_55_1.var_.characterEffect1039ui_story == nil then
				arg_55_1.var_.characterEffect1039ui_story = var_58_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_8 = 0.200000002980232

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8

				if arg_55_1.var_.characterEffect1039ui_story then
					local var_58_10 = Mathf.Lerp(0, 0.5, var_58_9)

					arg_55_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1039ui_story.fillRatio = var_58_10
				end
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 and arg_55_1.var_.characterEffect1039ui_story then
				local var_58_11 = 0.5

				arg_55_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1039ui_story.fillRatio = var_58_11
			end

			local var_58_12 = 0
			local var_58_13 = 0.825

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_14 = arg_55_1:FormatText(StoryNameCfg[56].name)

				arg_55_1.leftNameTxt_.text = var_58_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(1102704014)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 33
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_13 or var_58_13 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_13 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_12
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704014", "story_v_side_new_1102704.awb") ~= 0 then
					local var_58_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704014", "story_v_side_new_1102704.awb") / 1000

					if var_58_20 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_12
					end

					if var_58_15.prefab_name ~= "" and arg_55_1.actors_[var_58_15.prefab_name] ~= nil then
						local var_58_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_15.prefab_name].transform, "story_v_side_new_1102704", "1102704014", "story_v_side_new_1102704.awb")

						arg_55_1:RecordAudio("1102704014", var_58_21)
						arg_55_1:RecordAudio("1102704014", var_58_21)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704014", "story_v_side_new_1102704.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704014", "story_v_side_new_1102704.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_22 = math.max(var_58_13, arg_55_1.talkMaxDuration)

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_22 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_12) / var_58_22

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_12 + var_58_22 and arg_55_1.time_ < var_58_12 + var_58_22 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 1102704015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play1102704016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.425

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(1102704015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 17
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_8 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_8 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_8

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_8 and arg_59_1.time_ < var_62_0 + var_62_8 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 1102704016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play1102704017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1027ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1027ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, 100, 0)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1027ui_story, var_66_4, var_66_3)

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

			local var_66_9 = arg_63_1.actors_["1027ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect1027ui_story == nil then
				arg_63_1.var_.characterEffect1027ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.034000001847744

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1027ui_story then
					local var_66_13 = Mathf.Lerp(0, 0.5, var_66_12)

					arg_63_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1027ui_story.fillRatio = var_66_13
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect1027ui_story then
				local var_66_14 = 0.5

				arg_63_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1027ui_story.fillRatio = var_66_14
			end

			local var_66_15 = arg_63_1.actors_["1039ui_story"].transform
			local var_66_16 = 0

			if var_66_16 < arg_63_1.time_ and arg_63_1.time_ <= var_66_16 + arg_66_0 then
				arg_63_1.var_.moveOldPos1039ui_story = var_66_15.localPosition
			end

			local var_66_17 = 0.001

			if var_66_16 <= arg_63_1.time_ and arg_63_1.time_ < var_66_16 + var_66_17 then
				local var_66_18 = (arg_63_1.time_ - var_66_16) / var_66_17
				local var_66_19 = Vector3.New(0, 100, 0)

				var_66_15.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1039ui_story, var_66_19, var_66_18)

				local var_66_20 = manager.ui.mainCamera.transform.position - var_66_15.position

				var_66_15.forward = Vector3.New(var_66_20.x, var_66_20.y, var_66_20.z)

				local var_66_21 = var_66_15.localEulerAngles

				var_66_21.z = 0
				var_66_21.x = 0
				var_66_15.localEulerAngles = var_66_21
			end

			if arg_63_1.time_ >= var_66_16 + var_66_17 and arg_63_1.time_ < var_66_16 + var_66_17 + arg_66_0 then
				var_66_15.localPosition = Vector3.New(0, 100, 0)

				local var_66_22 = manager.ui.mainCamera.transform.position - var_66_15.position

				var_66_15.forward = Vector3.New(var_66_22.x, var_66_22.y, var_66_22.z)

				local var_66_23 = var_66_15.localEulerAngles

				var_66_23.z = 0
				var_66_23.x = 0
				var_66_15.localEulerAngles = var_66_23
			end

			local var_66_24 = arg_63_1.actors_["1039ui_story"]
			local var_66_25 = 0

			if var_66_25 < arg_63_1.time_ and arg_63_1.time_ <= var_66_25 + arg_66_0 and arg_63_1.var_.characterEffect1039ui_story == nil then
				arg_63_1.var_.characterEffect1039ui_story = var_66_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_26 = 0.034000001847744

			if var_66_25 <= arg_63_1.time_ and arg_63_1.time_ < var_66_25 + var_66_26 then
				local var_66_27 = (arg_63_1.time_ - var_66_25) / var_66_26

				if arg_63_1.var_.characterEffect1039ui_story then
					local var_66_28 = Mathf.Lerp(0, 0.5, var_66_27)

					arg_63_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1039ui_story.fillRatio = var_66_28
				end
			end

			if arg_63_1.time_ >= var_66_25 + var_66_26 and arg_63_1.time_ < var_66_25 + var_66_26 + arg_66_0 and arg_63_1.var_.characterEffect1039ui_story then
				local var_66_29 = 0.5

				arg_63_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1039ui_story.fillRatio = var_66_29
			end

			local var_66_30 = 0
			local var_66_31 = 0.75

			if var_66_30 < arg_63_1.time_ and arg_63_1.time_ <= var_66_30 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_32 = arg_63_1:GetWordFromCfg(1102704016)
				local var_66_33 = arg_63_1:FormatText(var_66_32.content)

				arg_63_1.text_.text = var_66_33

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_34 = 30
				local var_66_35 = utf8.len(var_66_33)
				local var_66_36 = var_66_34 <= 0 and var_66_31 or var_66_31 * (var_66_35 / var_66_34)

				if var_66_36 > 0 and var_66_31 < var_66_36 then
					arg_63_1.talkMaxDuration = var_66_36

					if var_66_36 + var_66_30 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_36 + var_66_30
					end
				end

				arg_63_1.text_.text = var_66_33
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_37 = math.max(var_66_31, arg_63_1.talkMaxDuration)

			if var_66_30 <= arg_63_1.time_ and arg_63_1.time_ < var_66_30 + var_66_37 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_30) / var_66_37

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_30 + var_66_37 and arg_63_1.time_ < var_66_30 + var_66_37 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 1102704017
		arg_67_1.duration_ = 6.366

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play1102704018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "1148ui_story"

			if arg_67_1.actors_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(Asset.Load("Char/" .. var_70_0), arg_67_1.stage_.transform)

				var_70_1.name = var_70_0
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.actors_[var_70_0] = var_70_1

				local var_70_2 = var_70_1:GetComponentInChildren(typeof(CharacterEffect))

				var_70_2.enabled = true

				local var_70_3 = GameObjectTools.GetOrAddComponent(var_70_1, typeof(DynamicBoneHelper))

				if var_70_3 then
					var_70_3:EnableDynamicBone(false)
				end

				arg_67_1:ShowWeapon(var_70_2.transform, false)

				arg_67_1.var_[var_70_0 .. "Animator"] = var_70_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_67_1.var_[var_70_0 .. "Animator"].applyRootMotion = true
				arg_67_1.var_[var_70_0 .. "LipSync"] = var_70_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_70_4 = arg_67_1.actors_["1148ui_story"].transform
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1.var_.moveOldPos1148ui_story = var_70_4.localPosition
			end

			local var_70_6 = 0.001

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6
				local var_70_8 = Vector3.New(-0.7, -0.8, -6.2)

				var_70_4.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1148ui_story, var_70_8, var_70_7)

				local var_70_9 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_9.x, var_70_9.y, var_70_9.z)

				local var_70_10 = var_70_4.localEulerAngles

				var_70_10.z = 0
				var_70_10.x = 0
				var_70_4.localEulerAngles = var_70_10
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 then
				var_70_4.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_70_11 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_11.x, var_70_11.y, var_70_11.z)

				local var_70_12 = var_70_4.localEulerAngles

				var_70_12.z = 0
				var_70_12.x = 0
				var_70_4.localEulerAngles = var_70_12
			end

			local var_70_13 = arg_67_1.actors_["1148ui_story"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 and arg_67_1.var_.characterEffect1148ui_story == nil then
				arg_67_1.var_.characterEffect1148ui_story = var_70_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_15 = 0.200000002980232

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15

				if arg_67_1.var_.characterEffect1148ui_story then
					arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 and arg_67_1.var_.characterEffect1148ui_story then
				arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_70_17 = 0

			if var_70_17 < arg_67_1.time_ and arg_67_1.time_ <= var_70_17 + arg_70_0 then
				arg_67_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action6_1")
			end

			local var_70_18 = 0

			if var_70_18 < arg_67_1.time_ and arg_67_1.time_ <= var_70_18 + arg_70_0 then
				arg_67_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_70_19 = 0
			local var_70_20 = 0.775

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_21 = arg_67_1:FormatText(StoryNameCfg[8].name)

				arg_67_1.leftNameTxt_.text = var_70_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_22 = arg_67_1:GetWordFromCfg(1102704017)
				local var_70_23 = arg_67_1:FormatText(var_70_22.content)

				arg_67_1.text_.text = var_70_23

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_24 = 31
				local var_70_25 = utf8.len(var_70_23)
				local var_70_26 = var_70_24 <= 0 and var_70_20 or var_70_20 * (var_70_25 / var_70_24)

				if var_70_26 > 0 and var_70_20 < var_70_26 then
					arg_67_1.talkMaxDuration = var_70_26

					if var_70_26 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_26 + var_70_19
					end
				end

				arg_67_1.text_.text = var_70_23
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704017", "story_v_side_new_1102704.awb") ~= 0 then
					local var_70_27 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704017", "story_v_side_new_1102704.awb") / 1000

					if var_70_27 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_19
					end

					if var_70_22.prefab_name ~= "" and arg_67_1.actors_[var_70_22.prefab_name] ~= nil then
						local var_70_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_22.prefab_name].transform, "story_v_side_new_1102704", "1102704017", "story_v_side_new_1102704.awb")

						arg_67_1:RecordAudio("1102704017", var_70_28)
						arg_67_1:RecordAudio("1102704017", var_70_28)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704017", "story_v_side_new_1102704.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704017", "story_v_side_new_1102704.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_29 = math.max(var_70_20, arg_67_1.talkMaxDuration)

			if var_70_19 <= arg_67_1.time_ and arg_67_1.time_ < var_70_19 + var_70_29 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_19) / var_70_29

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_19 + var_70_29 and arg_67_1.time_ < var_70_19 + var_70_29 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 1102704018
		arg_71_1.duration_ = 3.466

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play1102704019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1027ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1027ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0.7, -0.81, -5.8)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1027ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["1027ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect1027ui_story == nil then
				arg_71_1.var_.characterEffect1027ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect1027ui_story then
					arg_71_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect1027ui_story then
				arg_71_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_74_13 = 0

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action4_1")
			end

			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_74_15 = arg_71_1.actors_["1148ui_story"]
			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 and arg_71_1.var_.characterEffect1148ui_story == nil then
				arg_71_1.var_.characterEffect1148ui_story = var_74_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_17 = 0.200000002980232

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / var_74_17

				if arg_71_1.var_.characterEffect1148ui_story then
					local var_74_19 = Mathf.Lerp(0, 0.5, var_74_18)

					arg_71_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1148ui_story.fillRatio = var_74_19
				end
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 and arg_71_1.var_.characterEffect1148ui_story then
				local var_74_20 = 0.5

				arg_71_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1148ui_story.fillRatio = var_74_20
			end

			local var_74_21 = 0
			local var_74_22 = 0.4

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_23 = arg_71_1:FormatText(StoryNameCfg[56].name)

				arg_71_1.leftNameTxt_.text = var_74_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_24 = arg_71_1:GetWordFromCfg(1102704018)
				local var_74_25 = arg_71_1:FormatText(var_74_24.content)

				arg_71_1.text_.text = var_74_25

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_26 = 16
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704018", "story_v_side_new_1102704.awb") ~= 0 then
					local var_74_29 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704018", "story_v_side_new_1102704.awb") / 1000

					if var_74_29 + var_74_21 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_29 + var_74_21
					end

					if var_74_24.prefab_name ~= "" and arg_71_1.actors_[var_74_24.prefab_name] ~= nil then
						local var_74_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_24.prefab_name].transform, "story_v_side_new_1102704", "1102704018", "story_v_side_new_1102704.awb")

						arg_71_1:RecordAudio("1102704018", var_74_30)
						arg_71_1:RecordAudio("1102704018", var_74_30)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704018", "story_v_side_new_1102704.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704018", "story_v_side_new_1102704.awb")
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
	Play1102704019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 1102704019
		arg_75_1.duration_ = 5.4

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play1102704020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1148ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1148ui_story == nil then
				arg_75_1.var_.characterEffect1148ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1148ui_story then
					arg_75_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1148ui_story then
				arg_75_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_78_4 = 0

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action462")
			end

			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 then
				arg_75_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_6 = arg_75_1.actors_["1027ui_story"]
			local var_78_7 = 0

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 and arg_75_1.var_.characterEffect1027ui_story == nil then
				arg_75_1.var_.characterEffect1027ui_story = var_78_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_8 = 0.200000002980232

			if var_78_7 <= arg_75_1.time_ and arg_75_1.time_ < var_78_7 + var_78_8 then
				local var_78_9 = (arg_75_1.time_ - var_78_7) / var_78_8

				if arg_75_1.var_.characterEffect1027ui_story then
					local var_78_10 = Mathf.Lerp(0, 0.5, var_78_9)

					arg_75_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1027ui_story.fillRatio = var_78_10
				end
			end

			if arg_75_1.time_ >= var_78_7 + var_78_8 and arg_75_1.time_ < var_78_7 + var_78_8 + arg_78_0 and arg_75_1.var_.characterEffect1027ui_story then
				local var_78_11 = 0.5

				arg_75_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1027ui_story.fillRatio = var_78_11
			end

			local var_78_12 = 0
			local var_78_13 = 0.6

			if var_78_12 < arg_75_1.time_ and arg_75_1.time_ <= var_78_12 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_14 = arg_75_1:FormatText(StoryNameCfg[8].name)

				arg_75_1.leftNameTxt_.text = var_78_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_15 = arg_75_1:GetWordFromCfg(1102704019)
				local var_78_16 = arg_75_1:FormatText(var_78_15.content)

				arg_75_1.text_.text = var_78_16

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_17 = 24
				local var_78_18 = utf8.len(var_78_16)
				local var_78_19 = var_78_17 <= 0 and var_78_13 or var_78_13 * (var_78_18 / var_78_17)

				if var_78_19 > 0 and var_78_13 < var_78_19 then
					arg_75_1.talkMaxDuration = var_78_19

					if var_78_19 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_19 + var_78_12
					end
				end

				arg_75_1.text_.text = var_78_16
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704019", "story_v_side_new_1102704.awb") ~= 0 then
					local var_78_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704019", "story_v_side_new_1102704.awb") / 1000

					if var_78_20 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_20 + var_78_12
					end

					if var_78_15.prefab_name ~= "" and arg_75_1.actors_[var_78_15.prefab_name] ~= nil then
						local var_78_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_15.prefab_name].transform, "story_v_side_new_1102704", "1102704019", "story_v_side_new_1102704.awb")

						arg_75_1:RecordAudio("1102704019", var_78_21)
						arg_75_1:RecordAudio("1102704019", var_78_21)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704019", "story_v_side_new_1102704.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704019", "story_v_side_new_1102704.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_22 = math.max(var_78_13, arg_75_1.talkMaxDuration)

			if var_78_12 <= arg_75_1.time_ and arg_75_1.time_ < var_78_12 + var_78_22 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_12) / var_78_22

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_12 + var_78_22 and arg_75_1.time_ < var_78_12 + var_78_22 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 1102704020
		arg_79_1.duration_ = 3.666

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play1102704021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1027ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1027ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1027ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, 100, 0)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["1027ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect1027ui_story == nil then
				arg_79_1.var_.characterEffect1027ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect1027ui_story then
					local var_82_13 = Mathf.Lerp(0, 0.5, var_82_12)

					arg_79_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1027ui_story.fillRatio = var_82_13
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect1027ui_story then
				local var_82_14 = 0.5

				arg_79_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1027ui_story.fillRatio = var_82_14
			end

			local var_82_15 = arg_79_1.actors_["1039ui_story"].transform
			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 then
				arg_79_1.var_.moveOldPos1039ui_story = var_82_15.localPosition
			end

			local var_82_17 = 0.001

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_17 then
				local var_82_18 = (arg_79_1.time_ - var_82_16) / var_82_17
				local var_82_19 = Vector3.New(0.7, -1.01, -5.9)

				var_82_15.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1039ui_story, var_82_19, var_82_18)

				local var_82_20 = manager.ui.mainCamera.transform.position - var_82_15.position

				var_82_15.forward = Vector3.New(var_82_20.x, var_82_20.y, var_82_20.z)

				local var_82_21 = var_82_15.localEulerAngles

				var_82_21.z = 0
				var_82_21.x = 0
				var_82_15.localEulerAngles = var_82_21
			end

			if arg_79_1.time_ >= var_82_16 + var_82_17 and arg_79_1.time_ < var_82_16 + var_82_17 + arg_82_0 then
				var_82_15.localPosition = Vector3.New(0.7, -1.01, -5.9)

				local var_82_22 = manager.ui.mainCamera.transform.position - var_82_15.position

				var_82_15.forward = Vector3.New(var_82_22.x, var_82_22.y, var_82_22.z)

				local var_82_23 = var_82_15.localEulerAngles

				var_82_23.z = 0
				var_82_23.x = 0
				var_82_15.localEulerAngles = var_82_23
			end

			local var_82_24 = arg_79_1.actors_["1039ui_story"]
			local var_82_25 = 0

			if var_82_25 < arg_79_1.time_ and arg_79_1.time_ <= var_82_25 + arg_82_0 and arg_79_1.var_.characterEffect1039ui_story == nil then
				arg_79_1.var_.characterEffect1039ui_story = var_82_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_26 = 0.200000002980232

			if var_82_25 <= arg_79_1.time_ and arg_79_1.time_ < var_82_25 + var_82_26 then
				local var_82_27 = (arg_79_1.time_ - var_82_25) / var_82_26

				if arg_79_1.var_.characterEffect1039ui_story then
					arg_79_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_25 + var_82_26 and arg_79_1.time_ < var_82_25 + var_82_26 + arg_82_0 and arg_79_1.var_.characterEffect1039ui_story then
				arg_79_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_82_28 = 0

			if var_82_28 < arg_79_1.time_ and arg_79_1.time_ <= var_82_28 + arg_82_0 then
				arg_79_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action1_1")
			end

			local var_82_29 = 0

			if var_82_29 < arg_79_1.time_ and arg_79_1.time_ <= var_82_29 + arg_82_0 then
				arg_79_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_30 = arg_79_1.actors_["1148ui_story"]
			local var_82_31 = 0

			if var_82_31 < arg_79_1.time_ and arg_79_1.time_ <= var_82_31 + arg_82_0 and arg_79_1.var_.characterEffect1148ui_story == nil then
				arg_79_1.var_.characterEffect1148ui_story = var_82_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_32 = 0.200000002980232

			if var_82_31 <= arg_79_1.time_ and arg_79_1.time_ < var_82_31 + var_82_32 then
				local var_82_33 = (arg_79_1.time_ - var_82_31) / var_82_32

				if arg_79_1.var_.characterEffect1148ui_story then
					local var_82_34 = Mathf.Lerp(0, 0.5, var_82_33)

					arg_79_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1148ui_story.fillRatio = var_82_34
				end
			end

			if arg_79_1.time_ >= var_82_31 + var_82_32 and arg_79_1.time_ < var_82_31 + var_82_32 + arg_82_0 and arg_79_1.var_.characterEffect1148ui_story then
				local var_82_35 = 0.5

				arg_79_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1148ui_story.fillRatio = var_82_35
			end

			local var_82_36 = 0
			local var_82_37 = 0.45

			if var_82_36 < arg_79_1.time_ and arg_79_1.time_ <= var_82_36 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_38 = arg_79_1:FormatText(StoryNameCfg[9].name)

				arg_79_1.leftNameTxt_.text = var_82_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_39 = arg_79_1:GetWordFromCfg(1102704020)
				local var_82_40 = arg_79_1:FormatText(var_82_39.content)

				arg_79_1.text_.text = var_82_40

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_41 = 18
				local var_82_42 = utf8.len(var_82_40)
				local var_82_43 = var_82_41 <= 0 and var_82_37 or var_82_37 * (var_82_42 / var_82_41)

				if var_82_43 > 0 and var_82_37 < var_82_43 then
					arg_79_1.talkMaxDuration = var_82_43

					if var_82_43 + var_82_36 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_43 + var_82_36
					end
				end

				arg_79_1.text_.text = var_82_40
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704020", "story_v_side_new_1102704.awb") ~= 0 then
					local var_82_44 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704020", "story_v_side_new_1102704.awb") / 1000

					if var_82_44 + var_82_36 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_44 + var_82_36
					end

					if var_82_39.prefab_name ~= "" and arg_79_1.actors_[var_82_39.prefab_name] ~= nil then
						local var_82_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_39.prefab_name].transform, "story_v_side_new_1102704", "1102704020", "story_v_side_new_1102704.awb")

						arg_79_1:RecordAudio("1102704020", var_82_45)
						arg_79_1:RecordAudio("1102704020", var_82_45)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704020", "story_v_side_new_1102704.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704020", "story_v_side_new_1102704.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_46 = math.max(var_82_37, arg_79_1.talkMaxDuration)

			if var_82_36 <= arg_79_1.time_ and arg_79_1.time_ < var_82_36 + var_82_46 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_36) / var_82_46

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_36 + var_82_46 and arg_79_1.time_ < var_82_36 + var_82_46 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 1102704021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play1102704022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1039ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1039ui_story == nil then
				arg_83_1.var_.characterEffect1039ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1039ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1039ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1039ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1039ui_story.fillRatio = var_86_5
			end

			local var_86_6 = 0
			local var_86_7 = 0.625

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_8 = arg_83_1:FormatText(StoryNameCfg[7].name)

				arg_83_1.leftNameTxt_.text = var_86_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_9 = arg_83_1:GetWordFromCfg(1102704021)
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
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_14 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_14 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_14

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_14 and arg_83_1.time_ < var_86_6 + var_86_14 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 1102704022
		arg_87_1.duration_ = 5.966

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play1102704023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1148ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1148ui_story == nil then
				arg_87_1.var_.characterEffect1148ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1148ui_story then
					arg_87_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1148ui_story then
				arg_87_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_90_4 = 0

			if var_90_4 < arg_87_1.time_ and arg_87_1.time_ <= var_90_4 + arg_90_0 then
				arg_87_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action2_2")
			end

			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 then
				arg_87_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_6 = 0
			local var_90_7 = 0.725

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[8].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(1102704022)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 29
				local var_90_12 = utf8.len(var_90_10)
				local var_90_13 = var_90_11 <= 0 and var_90_7 or var_90_7 * (var_90_12 / var_90_11)

				if var_90_13 > 0 and var_90_7 < var_90_13 then
					arg_87_1.talkMaxDuration = var_90_13

					if var_90_13 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_13 + var_90_6
					end
				end

				arg_87_1.text_.text = var_90_10
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704022", "story_v_side_new_1102704.awb") ~= 0 then
					local var_90_14 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704022", "story_v_side_new_1102704.awb") / 1000

					if var_90_14 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_14 + var_90_6
					end

					if var_90_9.prefab_name ~= "" and arg_87_1.actors_[var_90_9.prefab_name] ~= nil then
						local var_90_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_9.prefab_name].transform, "story_v_side_new_1102704", "1102704022", "story_v_side_new_1102704.awb")

						arg_87_1:RecordAudio("1102704022", var_90_15)
						arg_87_1:RecordAudio("1102704022", var_90_15)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704022", "story_v_side_new_1102704.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704022", "story_v_side_new_1102704.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_16 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_16 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_16

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_16 and arg_87_1.time_ < var_90_6 + var_90_16 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 1102704023
		arg_91_1.duration_ = 4.4

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play1102704024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1027ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1027ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0.7, -0.81, -5.8)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1027ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["1027ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect1027ui_story == nil then
				arg_91_1.var_.characterEffect1027ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect1027ui_story then
					arg_91_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1027ui_story then
				arg_91_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action1_1")
			end

			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_94_15 = arg_91_1.actors_["1039ui_story"].transform
			local var_94_16 = 0

			if var_94_16 < arg_91_1.time_ and arg_91_1.time_ <= var_94_16 + arg_94_0 then
				arg_91_1.var_.moveOldPos1039ui_story = var_94_15.localPosition
			end

			local var_94_17 = 0.001

			if var_94_16 <= arg_91_1.time_ and arg_91_1.time_ < var_94_16 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_16) / var_94_17
				local var_94_19 = Vector3.New(0, 100, 0)

				var_94_15.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1039ui_story, var_94_19, var_94_18)

				local var_94_20 = manager.ui.mainCamera.transform.position - var_94_15.position

				var_94_15.forward = Vector3.New(var_94_20.x, var_94_20.y, var_94_20.z)

				local var_94_21 = var_94_15.localEulerAngles

				var_94_21.z = 0
				var_94_21.x = 0
				var_94_15.localEulerAngles = var_94_21
			end

			if arg_91_1.time_ >= var_94_16 + var_94_17 and arg_91_1.time_ < var_94_16 + var_94_17 + arg_94_0 then
				var_94_15.localPosition = Vector3.New(0, 100, 0)

				local var_94_22 = manager.ui.mainCamera.transform.position - var_94_15.position

				var_94_15.forward = Vector3.New(var_94_22.x, var_94_22.y, var_94_22.z)

				local var_94_23 = var_94_15.localEulerAngles

				var_94_23.z = 0
				var_94_23.x = 0
				var_94_15.localEulerAngles = var_94_23
			end

			local var_94_24 = arg_91_1.actors_["1039ui_story"]
			local var_94_25 = 0

			if var_94_25 < arg_91_1.time_ and arg_91_1.time_ <= var_94_25 + arg_94_0 and arg_91_1.var_.characterEffect1039ui_story == nil then
				arg_91_1.var_.characterEffect1039ui_story = var_94_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_26 = 0.200000002980232

			if var_94_25 <= arg_91_1.time_ and arg_91_1.time_ < var_94_25 + var_94_26 then
				local var_94_27 = (arg_91_1.time_ - var_94_25) / var_94_26

				if arg_91_1.var_.characterEffect1039ui_story then
					local var_94_28 = Mathf.Lerp(0, 0.5, var_94_27)

					arg_91_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1039ui_story.fillRatio = var_94_28
				end
			end

			if arg_91_1.time_ >= var_94_25 + var_94_26 and arg_91_1.time_ < var_94_25 + var_94_26 + arg_94_0 and arg_91_1.var_.characterEffect1039ui_story then
				local var_94_29 = 0.5

				arg_91_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1039ui_story.fillRatio = var_94_29
			end

			local var_94_30 = arg_91_1.actors_["1148ui_story"]
			local var_94_31 = 0

			if var_94_31 < arg_91_1.time_ and arg_91_1.time_ <= var_94_31 + arg_94_0 and arg_91_1.var_.characterEffect1148ui_story == nil then
				arg_91_1.var_.characterEffect1148ui_story = var_94_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_32 = 0.200000002980232

			if var_94_31 <= arg_91_1.time_ and arg_91_1.time_ < var_94_31 + var_94_32 then
				local var_94_33 = (arg_91_1.time_ - var_94_31) / var_94_32

				if arg_91_1.var_.characterEffect1148ui_story then
					local var_94_34 = Mathf.Lerp(0, 0.5, var_94_33)

					arg_91_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1148ui_story.fillRatio = var_94_34
				end
			end

			if arg_91_1.time_ >= var_94_31 + var_94_32 and arg_91_1.time_ < var_94_31 + var_94_32 + arg_94_0 and arg_91_1.var_.characterEffect1148ui_story then
				local var_94_35 = 0.5

				arg_91_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1148ui_story.fillRatio = var_94_35
			end

			local var_94_36 = 0
			local var_94_37 = 0.55

			if var_94_36 < arg_91_1.time_ and arg_91_1.time_ <= var_94_36 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_38 = arg_91_1:FormatText(StoryNameCfg[56].name)

				arg_91_1.leftNameTxt_.text = var_94_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_39 = arg_91_1:GetWordFromCfg(1102704023)
				local var_94_40 = arg_91_1:FormatText(var_94_39.content)

				arg_91_1.text_.text = var_94_40

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_41 = 22
				local var_94_42 = utf8.len(var_94_40)
				local var_94_43 = var_94_41 <= 0 and var_94_37 or var_94_37 * (var_94_42 / var_94_41)

				if var_94_43 > 0 and var_94_37 < var_94_43 then
					arg_91_1.talkMaxDuration = var_94_43

					if var_94_43 + var_94_36 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_43 + var_94_36
					end
				end

				arg_91_1.text_.text = var_94_40
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704023", "story_v_side_new_1102704.awb") ~= 0 then
					local var_94_44 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704023", "story_v_side_new_1102704.awb") / 1000

					if var_94_44 + var_94_36 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_44 + var_94_36
					end

					if var_94_39.prefab_name ~= "" and arg_91_1.actors_[var_94_39.prefab_name] ~= nil then
						local var_94_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_39.prefab_name].transform, "story_v_side_new_1102704", "1102704023", "story_v_side_new_1102704.awb")

						arg_91_1:RecordAudio("1102704023", var_94_45)
						arg_91_1:RecordAudio("1102704023", var_94_45)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704023", "story_v_side_new_1102704.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704023", "story_v_side_new_1102704.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_46 = math.max(var_94_37, arg_91_1.talkMaxDuration)

			if var_94_36 <= arg_91_1.time_ and arg_91_1.time_ < var_94_36 + var_94_46 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_36) / var_94_46

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_36 + var_94_46 and arg_91_1.time_ < var_94_36 + var_94_46 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 1102704024
		arg_95_1.duration_ = 4.666

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play1102704025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1148ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1148ui_story == nil then
				arg_95_1.var_.characterEffect1148ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1148ui_story then
					arg_95_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1148ui_story then
				arg_95_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_98_4 = 0

			if var_98_4 < arg_95_1.time_ and arg_95_1.time_ <= var_98_4 + arg_98_0 then
				arg_95_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action7_1")
			end

			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 then
				arg_95_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_98_6 = arg_95_1.actors_["1027ui_story"]
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 and arg_95_1.var_.characterEffect1027ui_story == nil then
				arg_95_1.var_.characterEffect1027ui_story = var_98_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_8 = 0.200000002980232

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_8 then
				local var_98_9 = (arg_95_1.time_ - var_98_7) / var_98_8

				if arg_95_1.var_.characterEffect1027ui_story then
					local var_98_10 = Mathf.Lerp(0, 0.5, var_98_9)

					arg_95_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1027ui_story.fillRatio = var_98_10
				end
			end

			if arg_95_1.time_ >= var_98_7 + var_98_8 and arg_95_1.time_ < var_98_7 + var_98_8 + arg_98_0 and arg_95_1.var_.characterEffect1027ui_story then
				local var_98_11 = 0.5

				arg_95_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1027ui_story.fillRatio = var_98_11
			end

			local var_98_12 = 0
			local var_98_13 = 0.45

			if var_98_12 < arg_95_1.time_ and arg_95_1.time_ <= var_98_12 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_14 = arg_95_1:FormatText(StoryNameCfg[8].name)

				arg_95_1.leftNameTxt_.text = var_98_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_15 = arg_95_1:GetWordFromCfg(1102704024)
				local var_98_16 = arg_95_1:FormatText(var_98_15.content)

				arg_95_1.text_.text = var_98_16

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_17 = 18
				local var_98_18 = utf8.len(var_98_16)
				local var_98_19 = var_98_17 <= 0 and var_98_13 or var_98_13 * (var_98_18 / var_98_17)

				if var_98_19 > 0 and var_98_13 < var_98_19 then
					arg_95_1.talkMaxDuration = var_98_19

					if var_98_19 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_19 + var_98_12
					end
				end

				arg_95_1.text_.text = var_98_16
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704024", "story_v_side_new_1102704.awb") ~= 0 then
					local var_98_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704024", "story_v_side_new_1102704.awb") / 1000

					if var_98_20 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_20 + var_98_12
					end

					if var_98_15.prefab_name ~= "" and arg_95_1.actors_[var_98_15.prefab_name] ~= nil then
						local var_98_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_15.prefab_name].transform, "story_v_side_new_1102704", "1102704024", "story_v_side_new_1102704.awb")

						arg_95_1:RecordAudio("1102704024", var_98_21)
						arg_95_1:RecordAudio("1102704024", var_98_21)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704024", "story_v_side_new_1102704.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704024", "story_v_side_new_1102704.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_22 = math.max(var_98_13, arg_95_1.talkMaxDuration)

			if var_98_12 <= arg_95_1.time_ and arg_95_1.time_ < var_98_12 + var_98_22 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_12) / var_98_22

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_12 + var_98_22 and arg_95_1.time_ < var_98_12 + var_98_22 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 1102704025
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play1102704026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1027ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1027ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0, 100, 0)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1027ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, 100, 0)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1027ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1027ui_story == nil then
				arg_99_1.var_.characterEffect1027ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1027ui_story then
					local var_102_13 = Mathf.Lerp(0, 0.5, var_102_12)

					arg_99_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1027ui_story.fillRatio = var_102_13
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1027ui_story then
				local var_102_14 = 0.5

				arg_99_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1027ui_story.fillRatio = var_102_14
			end

			local var_102_15 = arg_99_1.actors_["1148ui_story"].transform
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 then
				arg_99_1.var_.moveOldPos1148ui_story = var_102_15.localPosition
			end

			local var_102_17 = 0.001

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17
				local var_102_19 = Vector3.New(0, 100, 0)

				var_102_15.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1148ui_story, var_102_19, var_102_18)

				local var_102_20 = manager.ui.mainCamera.transform.position - var_102_15.position

				var_102_15.forward = Vector3.New(var_102_20.x, var_102_20.y, var_102_20.z)

				local var_102_21 = var_102_15.localEulerAngles

				var_102_21.z = 0
				var_102_21.x = 0
				var_102_15.localEulerAngles = var_102_21
			end

			if arg_99_1.time_ >= var_102_16 + var_102_17 and arg_99_1.time_ < var_102_16 + var_102_17 + arg_102_0 then
				var_102_15.localPosition = Vector3.New(0, 100, 0)

				local var_102_22 = manager.ui.mainCamera.transform.position - var_102_15.position

				var_102_15.forward = Vector3.New(var_102_22.x, var_102_22.y, var_102_22.z)

				local var_102_23 = var_102_15.localEulerAngles

				var_102_23.z = 0
				var_102_23.x = 0
				var_102_15.localEulerAngles = var_102_23
			end

			local var_102_24 = arg_99_1.actors_["1148ui_story"]
			local var_102_25 = 0

			if var_102_25 < arg_99_1.time_ and arg_99_1.time_ <= var_102_25 + arg_102_0 and arg_99_1.var_.characterEffect1148ui_story == nil then
				arg_99_1.var_.characterEffect1148ui_story = var_102_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_26 = 0.200000002980232

			if var_102_25 <= arg_99_1.time_ and arg_99_1.time_ < var_102_25 + var_102_26 then
				local var_102_27 = (arg_99_1.time_ - var_102_25) / var_102_26

				if arg_99_1.var_.characterEffect1148ui_story then
					local var_102_28 = Mathf.Lerp(0, 0.5, var_102_27)

					arg_99_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1148ui_story.fillRatio = var_102_28
				end
			end

			if arg_99_1.time_ >= var_102_25 + var_102_26 and arg_99_1.time_ < var_102_25 + var_102_26 + arg_102_0 and arg_99_1.var_.characterEffect1148ui_story then
				local var_102_29 = 0.5

				arg_99_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1148ui_story.fillRatio = var_102_29
			end

			local var_102_30 = 0
			local var_102_31 = 0.9

			if var_102_30 < arg_99_1.time_ and arg_99_1.time_ <= var_102_30 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_32 = arg_99_1:GetWordFromCfg(1102704025)
				local var_102_33 = arg_99_1:FormatText(var_102_32.content)

				arg_99_1.text_.text = var_102_33

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_34 = 36
				local var_102_35 = utf8.len(var_102_33)
				local var_102_36 = var_102_34 <= 0 and var_102_31 or var_102_31 * (var_102_35 / var_102_34)

				if var_102_36 > 0 and var_102_31 < var_102_36 then
					arg_99_1.talkMaxDuration = var_102_36

					if var_102_36 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_36 + var_102_30
					end
				end

				arg_99_1.text_.text = var_102_33
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_37 = math.max(var_102_31, arg_99_1.talkMaxDuration)

			if var_102_30 <= arg_99_1.time_ and arg_99_1.time_ < var_102_30 + var_102_37 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_30) / var_102_37

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_30 + var_102_37 and arg_99_1.time_ < var_102_30 + var_102_37 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 1102704026
		arg_103_1.duration_ = 8.999999999999

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play1102704027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = "ST01"

			if arg_103_1.bgs_[var_106_0] == nil then
				local var_106_1 = Object.Instantiate(arg_103_1.paintGo_)

				var_106_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_106_0)
				var_106_1.name = var_106_0
				var_106_1.transform.parent = arg_103_1.stage_.transform
				var_106_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_103_1.bgs_[var_106_0] = var_106_1
			end

			local var_106_2 = 1.999999999999

			if var_106_2 < arg_103_1.time_ and arg_103_1.time_ <= var_106_2 + arg_106_0 then
				local var_106_3 = manager.ui.mainCamera.transform.localPosition
				local var_106_4 = Vector3.New(0, 0, 10) + Vector3.New(var_106_3.x, var_106_3.y, 0)
				local var_106_5 = arg_103_1.bgs_.ST01

				var_106_5.transform.localPosition = var_106_4
				var_106_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_106_6 = var_106_5:GetComponent("SpriteRenderer")

				if var_106_6 and var_106_6.sprite then
					local var_106_7 = (var_106_5.transform.localPosition - var_106_3).z
					local var_106_8 = manager.ui.mainCameraCom_
					local var_106_9 = 2 * var_106_7 * Mathf.Tan(var_106_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_106_10 = var_106_9 * var_106_8.aspect
					local var_106_11 = var_106_6.sprite.bounds.size.x
					local var_106_12 = var_106_6.sprite.bounds.size.y
					local var_106_13 = var_106_10 / var_106_11
					local var_106_14 = var_106_9 / var_106_12
					local var_106_15 = var_106_14 < var_106_13 and var_106_13 or var_106_14

					var_106_5.transform.localScale = Vector3.New(var_106_15, var_106_15, 0)
				end

				for iter_106_0, iter_106_1 in pairs(arg_103_1.bgs_) do
					if iter_106_0 ~= "ST01" then
						iter_106_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_17 = 2

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Color.New(0, 0, 0)

				var_106_19.a = Mathf.Lerp(0, 1, var_106_18)
				arg_103_1.mask_.color = var_106_19
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				local var_106_20 = Color.New(0, 0, 0)

				var_106_20.a = 1
				arg_103_1.mask_.color = var_106_20
			end

			local var_106_21 = 2

			if var_106_21 < arg_103_1.time_ and arg_103_1.time_ <= var_106_21 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_22 = 2

			if var_106_21 <= arg_103_1.time_ and arg_103_1.time_ < var_106_21 + var_106_22 then
				local var_106_23 = (arg_103_1.time_ - var_106_21) / var_106_22
				local var_106_24 = Color.New(0, 0, 0)

				var_106_24.a = Mathf.Lerp(1, 0, var_106_23)
				arg_103_1.mask_.color = var_106_24
			end

			if arg_103_1.time_ >= var_106_21 + var_106_22 and arg_103_1.time_ < var_106_21 + var_106_22 + arg_106_0 then
				local var_106_25 = Color.New(0, 0, 0)
				local var_106_26 = 0

				arg_103_1.mask_.enabled = false
				var_106_25.a = var_106_26
				arg_103_1.mask_.color = var_106_25
			end

			if arg_103_1.frameCnt_ <= 1 then
				arg_103_1.dialog_:SetActive(false)
			end

			local var_106_27 = 3.999999999999
			local var_106_28 = 0.975

			if var_106_27 < arg_103_1.time_ and arg_103_1.time_ <= var_106_27 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0

				arg_103_1.dialog_:SetActive(true)

				local var_106_29 = LeanTween.value(arg_103_1.dialog_, 0, 1, 0.3)

				var_106_29:setOnUpdate(LuaHelper.FloatAction(function(arg_107_0)
					arg_103_1.dialogCg_.alpha = arg_107_0
				end))
				var_106_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_103_1.dialog_)
					var_106_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_103_1.duration_ = arg_103_1.duration_ + 0.3

				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_30 = arg_103_1:GetWordFromCfg(1102704026)
				local var_106_31 = arg_103_1:FormatText(var_106_30.content)

				arg_103_1.text_.text = var_106_31

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_32 = 39
				local var_106_33 = utf8.len(var_106_31)
				local var_106_34 = var_106_32 <= 0 and var_106_28 or var_106_28 * (var_106_33 / var_106_32)

				if var_106_34 > 0 and var_106_28 < var_106_34 then
					arg_103_1.talkMaxDuration = var_106_34
					var_106_27 = var_106_27 + 0.3

					if var_106_34 + var_106_27 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_34 + var_106_27
					end
				end

				arg_103_1.text_.text = var_106_31
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_35 = var_106_27 + 0.3
			local var_106_36 = math.max(var_106_28, arg_103_1.talkMaxDuration)

			if var_106_35 <= arg_103_1.time_ and arg_103_1.time_ < var_106_35 + var_106_36 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_35) / var_106_36

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_35 + var_106_36 and arg_103_1.time_ < var_106_35 + var_106_36 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 1102704027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play1102704028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1.35

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_2 = arg_109_1:GetWordFromCfg(1102704027)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 54
				local var_112_5 = utf8.len(var_112_3)
				local var_112_6 = var_112_4 <= 0 and var_112_1 or var_112_1 * (var_112_5 / var_112_4)

				if var_112_6 > 0 and var_112_1 < var_112_6 then
					arg_109_1.talkMaxDuration = var_112_6

					if var_112_6 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_6 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_3
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_7 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_7 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_7

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_7 and arg_109_1.time_ < var_112_0 + var_112_7 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 1102704028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play1102704029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.175

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_2 = arg_113_1:GetWordFromCfg(1102704028)
				local var_116_3 = arg_113_1:FormatText(var_116_2.content)

				arg_113_1.text_.text = var_116_3

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_4 = 47
				local var_116_5 = utf8.len(var_116_3)
				local var_116_6 = var_116_4 <= 0 and var_116_1 or var_116_1 * (var_116_5 / var_116_4)

				if var_116_6 > 0 and var_116_1 < var_116_6 then
					arg_113_1.talkMaxDuration = var_116_6

					if var_116_6 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_6 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_3
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_7 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_7 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_7

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_7 and arg_113_1.time_ < var_116_0 + var_116_7 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 1102704029
		arg_117_1.duration_ = 6.433

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play1102704030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1027ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1027ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(-0.7, -0.81, -5.8)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1027ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(-0.7, -0.81, -5.8)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["1027ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and arg_117_1.var_.characterEffect1027ui_story == nil then
				arg_117_1.var_.characterEffect1027ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect1027ui_story then
					arg_117_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and arg_117_1.var_.characterEffect1027ui_story then
				arg_117_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_120_13 = 0

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_120_15 = 0
			local var_120_16 = 0.8

			if var_120_15 < arg_117_1.time_ and arg_117_1.time_ <= var_120_15 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_17 = arg_117_1:FormatText(StoryNameCfg[56].name)

				arg_117_1.leftNameTxt_.text = var_120_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_18 = arg_117_1:GetWordFromCfg(1102704029)
				local var_120_19 = arg_117_1:FormatText(var_120_18.content)

				arg_117_1.text_.text = var_120_19

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_20 = 32
				local var_120_21 = utf8.len(var_120_19)
				local var_120_22 = var_120_20 <= 0 and var_120_16 or var_120_16 * (var_120_21 / var_120_20)

				if var_120_22 > 0 and var_120_16 < var_120_22 then
					arg_117_1.talkMaxDuration = var_120_22

					if var_120_22 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_22 + var_120_15
					end
				end

				arg_117_1.text_.text = var_120_19
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704029", "story_v_side_new_1102704.awb") ~= 0 then
					local var_120_23 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704029", "story_v_side_new_1102704.awb") / 1000

					if var_120_23 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_23 + var_120_15
					end

					if var_120_18.prefab_name ~= "" and arg_117_1.actors_[var_120_18.prefab_name] ~= nil then
						local var_120_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_18.prefab_name].transform, "story_v_side_new_1102704", "1102704029", "story_v_side_new_1102704.awb")

						arg_117_1:RecordAudio("1102704029", var_120_24)
						arg_117_1:RecordAudio("1102704029", var_120_24)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704029", "story_v_side_new_1102704.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704029", "story_v_side_new_1102704.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_25 = math.max(var_120_16, arg_117_1.talkMaxDuration)

			if var_120_15 <= arg_117_1.time_ and arg_117_1.time_ < var_120_15 + var_120_25 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_15) / var_120_25

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_15 + var_120_25 and arg_117_1.time_ < var_120_15 + var_120_25 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 1102704030
		arg_121_1.duration_ = 6.333

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play1102704031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = "1084ui_story"

			if arg_121_1.actors_[var_124_0] == nil then
				local var_124_1 = Object.Instantiate(Asset.Load("Char/" .. var_124_0), arg_121_1.stage_.transform)

				var_124_1.name = var_124_0
				var_124_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_121_1.actors_[var_124_0] = var_124_1

				local var_124_2 = var_124_1:GetComponentInChildren(typeof(CharacterEffect))

				var_124_2.enabled = true

				local var_124_3 = GameObjectTools.GetOrAddComponent(var_124_1, typeof(DynamicBoneHelper))

				if var_124_3 then
					var_124_3:EnableDynamicBone(false)
				end

				arg_121_1:ShowWeapon(var_124_2.transform, false)

				arg_121_1.var_[var_124_0 .. "Animator"] = var_124_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_121_1.var_[var_124_0 .. "Animator"].applyRootMotion = true
				arg_121_1.var_[var_124_0 .. "LipSync"] = var_124_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_124_4 = arg_121_1.actors_["1084ui_story"].transform
			local var_124_5 = 0

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 then
				arg_121_1.var_.moveOldPos1084ui_story = var_124_4.localPosition
			end

			local var_124_6 = 0.001

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_6 then
				local var_124_7 = (arg_121_1.time_ - var_124_5) / var_124_6
				local var_124_8 = Vector3.New(0.7, -0.97, -6)

				var_124_4.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1084ui_story, var_124_8, var_124_7)

				local var_124_9 = manager.ui.mainCamera.transform.position - var_124_4.position

				var_124_4.forward = Vector3.New(var_124_9.x, var_124_9.y, var_124_9.z)

				local var_124_10 = var_124_4.localEulerAngles

				var_124_10.z = 0
				var_124_10.x = 0
				var_124_4.localEulerAngles = var_124_10
			end

			if arg_121_1.time_ >= var_124_5 + var_124_6 and arg_121_1.time_ < var_124_5 + var_124_6 + arg_124_0 then
				var_124_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_124_11 = manager.ui.mainCamera.transform.position - var_124_4.position

				var_124_4.forward = Vector3.New(var_124_11.x, var_124_11.y, var_124_11.z)

				local var_124_12 = var_124_4.localEulerAngles

				var_124_12.z = 0
				var_124_12.x = 0
				var_124_4.localEulerAngles = var_124_12
			end

			local var_124_13 = arg_121_1.actors_["1084ui_story"]
			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story == nil then
				arg_121_1.var_.characterEffect1084ui_story = var_124_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_15 = 0.200000002980232

			if var_124_14 <= arg_121_1.time_ and arg_121_1.time_ < var_124_14 + var_124_15 then
				local var_124_16 = (arg_121_1.time_ - var_124_14) / var_124_15

				if arg_121_1.var_.characterEffect1084ui_story then
					arg_121_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_14 + var_124_15 and arg_121_1.time_ < var_124_14 + var_124_15 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story then
				arg_121_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_124_17 = 0

			if var_124_17 < arg_121_1.time_ and arg_121_1.time_ <= var_124_17 + arg_124_0 then
				arg_121_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_124_18 = 0

			if var_124_18 < arg_121_1.time_ and arg_121_1.time_ <= var_124_18 + arg_124_0 then
				arg_121_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_19 = arg_121_1.actors_["1027ui_story"]
			local var_124_20 = 0

			if var_124_20 < arg_121_1.time_ and arg_121_1.time_ <= var_124_20 + arg_124_0 and arg_121_1.var_.characterEffect1027ui_story == nil then
				arg_121_1.var_.characterEffect1027ui_story = var_124_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_21 = 0.200000002980232

			if var_124_20 <= arg_121_1.time_ and arg_121_1.time_ < var_124_20 + var_124_21 then
				local var_124_22 = (arg_121_1.time_ - var_124_20) / var_124_21

				if arg_121_1.var_.characterEffect1027ui_story then
					local var_124_23 = Mathf.Lerp(0, 0.5, var_124_22)

					arg_121_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1027ui_story.fillRatio = var_124_23
				end
			end

			if arg_121_1.time_ >= var_124_20 + var_124_21 and arg_121_1.time_ < var_124_20 + var_124_21 + arg_124_0 and arg_121_1.var_.characterEffect1027ui_story then
				local var_124_24 = 0.5

				arg_121_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1027ui_story.fillRatio = var_124_24
			end

			local var_124_25 = 0
			local var_124_26 = 0.85

			if var_124_25 < arg_121_1.time_ and arg_121_1.time_ <= var_124_25 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_27 = arg_121_1:FormatText(StoryNameCfg[6].name)

				arg_121_1.leftNameTxt_.text = var_124_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_28 = arg_121_1:GetWordFromCfg(1102704030)
				local var_124_29 = arg_121_1:FormatText(var_124_28.content)

				arg_121_1.text_.text = var_124_29

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_30 = 34
				local var_124_31 = utf8.len(var_124_29)
				local var_124_32 = var_124_30 <= 0 and var_124_26 or var_124_26 * (var_124_31 / var_124_30)

				if var_124_32 > 0 and var_124_26 < var_124_32 then
					arg_121_1.talkMaxDuration = var_124_32

					if var_124_32 + var_124_25 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_32 + var_124_25
					end
				end

				arg_121_1.text_.text = var_124_29
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704030", "story_v_side_new_1102704.awb") ~= 0 then
					local var_124_33 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704030", "story_v_side_new_1102704.awb") / 1000

					if var_124_33 + var_124_25 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_33 + var_124_25
					end

					if var_124_28.prefab_name ~= "" and arg_121_1.actors_[var_124_28.prefab_name] ~= nil then
						local var_124_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_28.prefab_name].transform, "story_v_side_new_1102704", "1102704030", "story_v_side_new_1102704.awb")

						arg_121_1:RecordAudio("1102704030", var_124_34)
						arg_121_1:RecordAudio("1102704030", var_124_34)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704030", "story_v_side_new_1102704.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704030", "story_v_side_new_1102704.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_35 = math.max(var_124_26, arg_121_1.talkMaxDuration)

			if var_124_25 <= arg_121_1.time_ and arg_121_1.time_ < var_124_25 + var_124_35 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_25) / var_124_35

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_25 + var_124_35 and arg_121_1.time_ < var_124_25 + var_124_35 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 1102704031
		arg_125_1.duration_ = 3.866

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play1102704032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1027ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1027ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(-0.7, -0.81, -5.8)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1027ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(-0.7, -0.81, -5.8)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = arg_125_1.actors_["1027ui_story"]
			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 and arg_125_1.var_.characterEffect1027ui_story == nil then
				arg_125_1.var_.characterEffect1027ui_story = var_128_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_11 = 0.200000002980232

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_11 then
				local var_128_12 = (arg_125_1.time_ - var_128_10) / var_128_11

				if arg_125_1.var_.characterEffect1027ui_story then
					arg_125_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_10 + var_128_11 and arg_125_1.time_ < var_128_10 + var_128_11 + arg_128_0 and arg_125_1.var_.characterEffect1027ui_story then
				arg_125_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_128_13 = 0

			if var_128_13 < arg_125_1.time_ and arg_125_1.time_ <= var_128_13 + arg_128_0 then
				arg_125_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action424")
			end

			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 then
				arg_125_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_128_15 = arg_125_1.actors_["1084ui_story"]
			local var_128_16 = 0

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story == nil then
				arg_125_1.var_.characterEffect1084ui_story = var_128_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_17 = 0.200000002980232

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_16) / var_128_17

				if arg_125_1.var_.characterEffect1084ui_story then
					local var_128_19 = Mathf.Lerp(0, 0.5, var_128_18)

					arg_125_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1084ui_story.fillRatio = var_128_19
				end
			end

			if arg_125_1.time_ >= var_128_16 + var_128_17 and arg_125_1.time_ < var_128_16 + var_128_17 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story then
				local var_128_20 = 0.5

				arg_125_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1084ui_story.fillRatio = var_128_20
			end

			local var_128_21 = 0
			local var_128_22 = 0.325

			if var_128_21 < arg_125_1.time_ and arg_125_1.time_ <= var_128_21 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_23 = arg_125_1:FormatText(StoryNameCfg[56].name)

				arg_125_1.leftNameTxt_.text = var_128_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_24 = arg_125_1:GetWordFromCfg(1102704031)
				local var_128_25 = arg_125_1:FormatText(var_128_24.content)

				arg_125_1.text_.text = var_128_25

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_26 = 13
				local var_128_27 = utf8.len(var_128_25)
				local var_128_28 = var_128_26 <= 0 and var_128_22 or var_128_22 * (var_128_27 / var_128_26)

				if var_128_28 > 0 and var_128_22 < var_128_28 then
					arg_125_1.talkMaxDuration = var_128_28

					if var_128_28 + var_128_21 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_28 + var_128_21
					end
				end

				arg_125_1.text_.text = var_128_25
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704031", "story_v_side_new_1102704.awb") ~= 0 then
					local var_128_29 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704031", "story_v_side_new_1102704.awb") / 1000

					if var_128_29 + var_128_21 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_29 + var_128_21
					end

					if var_128_24.prefab_name ~= "" and arg_125_1.actors_[var_128_24.prefab_name] ~= nil then
						local var_128_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_24.prefab_name].transform, "story_v_side_new_1102704", "1102704031", "story_v_side_new_1102704.awb")

						arg_125_1:RecordAudio("1102704031", var_128_30)
						arg_125_1:RecordAudio("1102704031", var_128_30)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704031", "story_v_side_new_1102704.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704031", "story_v_side_new_1102704.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_31 = math.max(var_128_22, arg_125_1.talkMaxDuration)

			if var_128_21 <= arg_125_1.time_ and arg_125_1.time_ < var_128_21 + var_128_31 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_21) / var_128_31

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_21 + var_128_31 and arg_125_1.time_ < var_128_21 + var_128_31 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 1102704032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play1102704033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1084ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1084ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, 100, 0)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1084ui_story, var_132_4, var_132_3)

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

			local var_132_9 = arg_129_1.actors_["1084ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1084ui_story == nil then
				arg_129_1.var_.characterEffect1084ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1084ui_story then
					local var_132_13 = Mathf.Lerp(0, 0.5, var_132_12)

					arg_129_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1084ui_story.fillRatio = var_132_13
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect1084ui_story then
				local var_132_14 = 0.5

				arg_129_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1084ui_story.fillRatio = var_132_14
			end

			local var_132_15 = arg_129_1.actors_["1027ui_story"].transform
			local var_132_16 = 0

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 then
				arg_129_1.var_.moveOldPos1027ui_story = var_132_15.localPosition
			end

			local var_132_17 = 0.001

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_17 then
				local var_132_18 = (arg_129_1.time_ - var_132_16) / var_132_17
				local var_132_19 = Vector3.New(0, 100, 0)

				var_132_15.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1027ui_story, var_132_19, var_132_18)

				local var_132_20 = manager.ui.mainCamera.transform.position - var_132_15.position

				var_132_15.forward = Vector3.New(var_132_20.x, var_132_20.y, var_132_20.z)

				local var_132_21 = var_132_15.localEulerAngles

				var_132_21.z = 0
				var_132_21.x = 0
				var_132_15.localEulerAngles = var_132_21
			end

			if arg_129_1.time_ >= var_132_16 + var_132_17 and arg_129_1.time_ < var_132_16 + var_132_17 + arg_132_0 then
				var_132_15.localPosition = Vector3.New(0, 100, 0)

				local var_132_22 = manager.ui.mainCamera.transform.position - var_132_15.position

				var_132_15.forward = Vector3.New(var_132_22.x, var_132_22.y, var_132_22.z)

				local var_132_23 = var_132_15.localEulerAngles

				var_132_23.z = 0
				var_132_23.x = 0
				var_132_15.localEulerAngles = var_132_23
			end

			local var_132_24 = arg_129_1.actors_["1027ui_story"]
			local var_132_25 = 0

			if var_132_25 < arg_129_1.time_ and arg_129_1.time_ <= var_132_25 + arg_132_0 and arg_129_1.var_.characterEffect1027ui_story == nil then
				arg_129_1.var_.characterEffect1027ui_story = var_132_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_26 = 0.200000002980232

			if var_132_25 <= arg_129_1.time_ and arg_129_1.time_ < var_132_25 + var_132_26 then
				local var_132_27 = (arg_129_1.time_ - var_132_25) / var_132_26

				if arg_129_1.var_.characterEffect1027ui_story then
					local var_132_28 = Mathf.Lerp(0, 0.5, var_132_27)

					arg_129_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1027ui_story.fillRatio = var_132_28
				end
			end

			if arg_129_1.time_ >= var_132_25 + var_132_26 and arg_129_1.time_ < var_132_25 + var_132_26 + arg_132_0 and arg_129_1.var_.characterEffect1027ui_story then
				local var_132_29 = 0.5

				arg_129_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1027ui_story.fillRatio = var_132_29
			end

			local var_132_30 = 0
			local var_132_31 = 1.35

			if var_132_30 < arg_129_1.time_ and arg_129_1.time_ <= var_132_30 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_32 = arg_129_1:GetWordFromCfg(1102704032)
				local var_132_33 = arg_129_1:FormatText(var_132_32.content)

				arg_129_1.text_.text = var_132_33

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_34 = 54
				local var_132_35 = utf8.len(var_132_33)
				local var_132_36 = var_132_34 <= 0 and var_132_31 or var_132_31 * (var_132_35 / var_132_34)

				if var_132_36 > 0 and var_132_31 < var_132_36 then
					arg_129_1.talkMaxDuration = var_132_36

					if var_132_36 + var_132_30 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_36 + var_132_30
					end
				end

				arg_129_1.text_.text = var_132_33
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_37 = math.max(var_132_31, arg_129_1.talkMaxDuration)

			if var_132_30 <= arg_129_1.time_ and arg_129_1.time_ < var_132_30 + var_132_37 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_30) / var_132_37

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_30 + var_132_37 and arg_129_1.time_ < var_132_30 + var_132_37 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 1102704033
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play1102704034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 1.075

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_2 = arg_133_1:GetWordFromCfg(1102704033)
				local var_136_3 = arg_133_1:FormatText(var_136_2.content)

				arg_133_1.text_.text = var_136_3

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_4 = 43
				local var_136_5 = utf8.len(var_136_3)
				local var_136_6 = var_136_4 <= 0 and var_136_1 or var_136_1 * (var_136_5 / var_136_4)

				if var_136_6 > 0 and var_136_1 < var_136_6 then
					arg_133_1.talkMaxDuration = var_136_6

					if var_136_6 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_6 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_3
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_7 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_7 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_7

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_7 and arg_133_1.time_ < var_136_0 + var_136_7 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 1102704034
		arg_137_1.duration_ = 7.933

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play1102704035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = "1080ui_story"

			if arg_137_1.actors_[var_140_0] == nil then
				local var_140_1 = Object.Instantiate(Asset.Load("Char/" .. var_140_0), arg_137_1.stage_.transform)

				var_140_1.name = var_140_0
				var_140_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_137_1.actors_[var_140_0] = var_140_1

				local var_140_2 = var_140_1:GetComponentInChildren(typeof(CharacterEffect))

				var_140_2.enabled = true

				local var_140_3 = GameObjectTools.GetOrAddComponent(var_140_1, typeof(DynamicBoneHelper))

				if var_140_3 then
					var_140_3:EnableDynamicBone(false)
				end

				arg_137_1:ShowWeapon(var_140_2.transform, false)

				arg_137_1.var_[var_140_0 .. "Animator"] = var_140_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_137_1.var_[var_140_0 .. "Animator"].applyRootMotion = true
				arg_137_1.var_[var_140_0 .. "LipSync"] = var_140_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_140_4 = arg_137_1.actors_["1080ui_story"].transform
			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 then
				arg_137_1.var_.moveOldPos1080ui_story = var_140_4.localPosition
			end

			local var_140_6 = 0.001

			if var_140_5 <= arg_137_1.time_ and arg_137_1.time_ < var_140_5 + var_140_6 then
				local var_140_7 = (arg_137_1.time_ - var_140_5) / var_140_6
				local var_140_8 = Vector3.New(-0.7, -1.01, -6.05)

				var_140_4.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1080ui_story, var_140_8, var_140_7)

				local var_140_9 = manager.ui.mainCamera.transform.position - var_140_4.position

				var_140_4.forward = Vector3.New(var_140_9.x, var_140_9.y, var_140_9.z)

				local var_140_10 = var_140_4.localEulerAngles

				var_140_10.z = 0
				var_140_10.x = 0
				var_140_4.localEulerAngles = var_140_10
			end

			if arg_137_1.time_ >= var_140_5 + var_140_6 and arg_137_1.time_ < var_140_5 + var_140_6 + arg_140_0 then
				var_140_4.localPosition = Vector3.New(-0.7, -1.01, -6.05)

				local var_140_11 = manager.ui.mainCamera.transform.position - var_140_4.position

				var_140_4.forward = Vector3.New(var_140_11.x, var_140_11.y, var_140_11.z)

				local var_140_12 = var_140_4.localEulerAngles

				var_140_12.z = 0
				var_140_12.x = 0
				var_140_4.localEulerAngles = var_140_12
			end

			local var_140_13 = arg_137_1.actors_["1080ui_story"]
			local var_140_14 = 0

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 and arg_137_1.var_.characterEffect1080ui_story == nil then
				arg_137_1.var_.characterEffect1080ui_story = var_140_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_15 = 0.200000002980232

			if var_140_14 <= arg_137_1.time_ and arg_137_1.time_ < var_140_14 + var_140_15 then
				local var_140_16 = (arg_137_1.time_ - var_140_14) / var_140_15

				if arg_137_1.var_.characterEffect1080ui_story then
					arg_137_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_14 + var_140_15 and arg_137_1.time_ < var_140_14 + var_140_15 + arg_140_0 and arg_137_1.var_.characterEffect1080ui_story then
				arg_137_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_140_17 = 0

			if var_140_17 < arg_137_1.time_ and arg_137_1.time_ <= var_140_17 + arg_140_0 then
				arg_137_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action2_1")
			end

			local var_140_18 = 0

			if var_140_18 < arg_137_1.time_ and arg_137_1.time_ <= var_140_18 + arg_140_0 then
				arg_137_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_19 = 0
			local var_140_20 = 0.625

			if var_140_19 < arg_137_1.time_ and arg_137_1.time_ <= var_140_19 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_21 = arg_137_1:FormatText(StoryNameCfg[55].name)

				arg_137_1.leftNameTxt_.text = var_140_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_22 = arg_137_1:GetWordFromCfg(1102704034)
				local var_140_23 = arg_137_1:FormatText(var_140_22.content)

				arg_137_1.text_.text = var_140_23

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_24 = 25
				local var_140_25 = utf8.len(var_140_23)
				local var_140_26 = var_140_24 <= 0 and var_140_20 or var_140_20 * (var_140_25 / var_140_24)

				if var_140_26 > 0 and var_140_20 < var_140_26 then
					arg_137_1.talkMaxDuration = var_140_26

					if var_140_26 + var_140_19 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_26 + var_140_19
					end
				end

				arg_137_1.text_.text = var_140_23
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704034", "story_v_side_new_1102704.awb") ~= 0 then
					local var_140_27 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704034", "story_v_side_new_1102704.awb") / 1000

					if var_140_27 + var_140_19 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_27 + var_140_19
					end

					if var_140_22.prefab_name ~= "" and arg_137_1.actors_[var_140_22.prefab_name] ~= nil then
						local var_140_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_22.prefab_name].transform, "story_v_side_new_1102704", "1102704034", "story_v_side_new_1102704.awb")

						arg_137_1:RecordAudio("1102704034", var_140_28)
						arg_137_1:RecordAudio("1102704034", var_140_28)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704034", "story_v_side_new_1102704.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704034", "story_v_side_new_1102704.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_29 = math.max(var_140_20, arg_137_1.talkMaxDuration)

			if var_140_19 <= arg_137_1.time_ and arg_137_1.time_ < var_140_19 + var_140_29 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_19) / var_140_29

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_19 + var_140_29 and arg_137_1.time_ < var_140_19 + var_140_29 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 1102704035
		arg_141_1.duration_ = 8.033

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play1102704036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1027ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1027ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0.7, -0.81, -5.8)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1027ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["1027ui_story"]
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 and arg_141_1.var_.characterEffect1027ui_story == nil then
				arg_141_1.var_.characterEffect1027ui_story = var_144_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_11 = 0.200000002980232

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11

				if arg_141_1.var_.characterEffect1027ui_story then
					arg_141_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 and arg_141_1.var_.characterEffect1027ui_story then
				arg_141_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_144_15 = arg_141_1.actors_["1080ui_story"]
			local var_144_16 = 0

			if var_144_16 < arg_141_1.time_ and arg_141_1.time_ <= var_144_16 + arg_144_0 and arg_141_1.var_.characterEffect1080ui_story == nil then
				arg_141_1.var_.characterEffect1080ui_story = var_144_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_17 = 0.200000002980232

			if var_144_16 <= arg_141_1.time_ and arg_141_1.time_ < var_144_16 + var_144_17 then
				local var_144_18 = (arg_141_1.time_ - var_144_16) / var_144_17

				if arg_141_1.var_.characterEffect1080ui_story then
					local var_144_19 = Mathf.Lerp(0, 0.5, var_144_18)

					arg_141_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1080ui_story.fillRatio = var_144_19
				end
			end

			if arg_141_1.time_ >= var_144_16 + var_144_17 and arg_141_1.time_ < var_144_16 + var_144_17 + arg_144_0 and arg_141_1.var_.characterEffect1080ui_story then
				local var_144_20 = 0.5

				arg_141_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1080ui_story.fillRatio = var_144_20
			end

			local var_144_21 = 0
			local var_144_22 = 1

			if var_144_21 < arg_141_1.time_ and arg_141_1.time_ <= var_144_21 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_23 = arg_141_1:FormatText(StoryNameCfg[56].name)

				arg_141_1.leftNameTxt_.text = var_144_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_24 = arg_141_1:GetWordFromCfg(1102704035)
				local var_144_25 = arg_141_1:FormatText(var_144_24.content)

				arg_141_1.text_.text = var_144_25

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_26 = 40
				local var_144_27 = utf8.len(var_144_25)
				local var_144_28 = var_144_26 <= 0 and var_144_22 or var_144_22 * (var_144_27 / var_144_26)

				if var_144_28 > 0 and var_144_22 < var_144_28 then
					arg_141_1.talkMaxDuration = var_144_28

					if var_144_28 + var_144_21 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_28 + var_144_21
					end
				end

				arg_141_1.text_.text = var_144_25
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704035", "story_v_side_new_1102704.awb") ~= 0 then
					local var_144_29 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704035", "story_v_side_new_1102704.awb") / 1000

					if var_144_29 + var_144_21 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_29 + var_144_21
					end

					if var_144_24.prefab_name ~= "" and arg_141_1.actors_[var_144_24.prefab_name] ~= nil then
						local var_144_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_24.prefab_name].transform, "story_v_side_new_1102704", "1102704035", "story_v_side_new_1102704.awb")

						arg_141_1:RecordAudio("1102704035", var_144_30)
						arg_141_1:RecordAudio("1102704035", var_144_30)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704035", "story_v_side_new_1102704.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704035", "story_v_side_new_1102704.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_31 = math.max(var_144_22, arg_141_1.talkMaxDuration)

			if var_144_21 <= arg_141_1.time_ and arg_141_1.time_ < var_144_21 + var_144_31 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_21) / var_144_31

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_21 + var_144_31 and arg_141_1.time_ < var_144_21 + var_144_31 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 1102704036
		arg_145_1.duration_ = 8.766

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play1102704037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1080ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1080ui_story == nil then
				arg_145_1.var_.characterEffect1080ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1080ui_story then
					arg_145_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1080ui_story then
				arg_145_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_148_4 = 0

			if var_148_4 < arg_145_1.time_ and arg_145_1.time_ <= var_148_4 + arg_148_0 then
				arg_145_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action2_2")
			end

			local var_148_5 = 0

			if var_148_5 < arg_145_1.time_ and arg_145_1.time_ <= var_148_5 + arg_148_0 then
				arg_145_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_148_6 = arg_145_1.actors_["1027ui_story"]
			local var_148_7 = 0

			if var_148_7 < arg_145_1.time_ and arg_145_1.time_ <= var_148_7 + arg_148_0 and arg_145_1.var_.characterEffect1027ui_story == nil then
				arg_145_1.var_.characterEffect1027ui_story = var_148_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_8 = 0.200000002980232

			if var_148_7 <= arg_145_1.time_ and arg_145_1.time_ < var_148_7 + var_148_8 then
				local var_148_9 = (arg_145_1.time_ - var_148_7) / var_148_8

				if arg_145_1.var_.characterEffect1027ui_story then
					local var_148_10 = Mathf.Lerp(0, 0.5, var_148_9)

					arg_145_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1027ui_story.fillRatio = var_148_10
				end
			end

			if arg_145_1.time_ >= var_148_7 + var_148_8 and arg_145_1.time_ < var_148_7 + var_148_8 + arg_148_0 and arg_145_1.var_.characterEffect1027ui_story then
				local var_148_11 = 0.5

				arg_145_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1027ui_story.fillRatio = var_148_11
			end

			local var_148_12 = 0
			local var_148_13 = 0.825

			if var_148_12 < arg_145_1.time_ and arg_145_1.time_ <= var_148_12 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_14 = arg_145_1:FormatText(StoryNameCfg[55].name)

				arg_145_1.leftNameTxt_.text = var_148_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_15 = arg_145_1:GetWordFromCfg(1102704036)
				local var_148_16 = arg_145_1:FormatText(var_148_15.content)

				arg_145_1.text_.text = var_148_16

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_17 = 33
				local var_148_18 = utf8.len(var_148_16)
				local var_148_19 = var_148_17 <= 0 and var_148_13 or var_148_13 * (var_148_18 / var_148_17)

				if var_148_19 > 0 and var_148_13 < var_148_19 then
					arg_145_1.talkMaxDuration = var_148_19

					if var_148_19 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_19 + var_148_12
					end
				end

				arg_145_1.text_.text = var_148_16
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704036", "story_v_side_new_1102704.awb") ~= 0 then
					local var_148_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704036", "story_v_side_new_1102704.awb") / 1000

					if var_148_20 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_20 + var_148_12
					end

					if var_148_15.prefab_name ~= "" and arg_145_1.actors_[var_148_15.prefab_name] ~= nil then
						local var_148_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_15.prefab_name].transform, "story_v_side_new_1102704", "1102704036", "story_v_side_new_1102704.awb")

						arg_145_1:RecordAudio("1102704036", var_148_21)
						arg_145_1:RecordAudio("1102704036", var_148_21)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704036", "story_v_side_new_1102704.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704036", "story_v_side_new_1102704.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_22 = math.max(var_148_13, arg_145_1.talkMaxDuration)

			if var_148_12 <= arg_145_1.time_ and arg_145_1.time_ < var_148_12 + var_148_22 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_12) / var_148_22

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_12 + var_148_22 and arg_145_1.time_ < var_148_12 + var_148_22 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 1102704037
		arg_149_1.duration_ = 10.633

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play1102704038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1027ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1027ui_story == nil then
				arg_149_1.var_.characterEffect1027ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1027ui_story then
					arg_149_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1027ui_story then
				arg_149_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_152_4 = 0

			if var_152_4 < arg_149_1.time_ and arg_149_1.time_ <= var_152_4 + arg_152_0 then
				arg_149_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_152_5 = arg_149_1.actors_["1080ui_story"]
			local var_152_6 = 0

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 and arg_149_1.var_.characterEffect1080ui_story == nil then
				arg_149_1.var_.characterEffect1080ui_story = var_152_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_7 = 0.200000002980232

			if var_152_6 <= arg_149_1.time_ and arg_149_1.time_ < var_152_6 + var_152_7 then
				local var_152_8 = (arg_149_1.time_ - var_152_6) / var_152_7

				if arg_149_1.var_.characterEffect1080ui_story then
					local var_152_9 = Mathf.Lerp(0, 0.5, var_152_8)

					arg_149_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1080ui_story.fillRatio = var_152_9
				end
			end

			if arg_149_1.time_ >= var_152_6 + var_152_7 and arg_149_1.time_ < var_152_6 + var_152_7 + arg_152_0 and arg_149_1.var_.characterEffect1080ui_story then
				local var_152_10 = 0.5

				arg_149_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1080ui_story.fillRatio = var_152_10
			end

			local var_152_11 = 0
			local var_152_12 = 0.95

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_13 = arg_149_1:FormatText(StoryNameCfg[56].name)

				arg_149_1.leftNameTxt_.text = var_152_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_14 = arg_149_1:GetWordFromCfg(1102704037)
				local var_152_15 = arg_149_1:FormatText(var_152_14.content)

				arg_149_1.text_.text = var_152_15

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_16 = 38
				local var_152_17 = utf8.len(var_152_15)
				local var_152_18 = var_152_16 <= 0 and var_152_12 or var_152_12 * (var_152_17 / var_152_16)

				if var_152_18 > 0 and var_152_12 < var_152_18 then
					arg_149_1.talkMaxDuration = var_152_18

					if var_152_18 + var_152_11 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_18 + var_152_11
					end
				end

				arg_149_1.text_.text = var_152_15
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704037", "story_v_side_new_1102704.awb") ~= 0 then
					local var_152_19 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704037", "story_v_side_new_1102704.awb") / 1000

					if var_152_19 + var_152_11 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_19 + var_152_11
					end

					if var_152_14.prefab_name ~= "" and arg_149_1.actors_[var_152_14.prefab_name] ~= nil then
						local var_152_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_14.prefab_name].transform, "story_v_side_new_1102704", "1102704037", "story_v_side_new_1102704.awb")

						arg_149_1:RecordAudio("1102704037", var_152_20)
						arg_149_1:RecordAudio("1102704037", var_152_20)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704037", "story_v_side_new_1102704.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704037", "story_v_side_new_1102704.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_21 = math.max(var_152_12, arg_149_1.talkMaxDuration)

			if var_152_11 <= arg_149_1.time_ and arg_149_1.time_ < var_152_11 + var_152_21 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_11) / var_152_21

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_11 + var_152_21 and arg_149_1.time_ < var_152_11 + var_152_21 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 1102704038
		arg_153_1.duration_ = 1.999999999999

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play1102704039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1080ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1080ui_story == nil then
				arg_153_1.var_.characterEffect1080ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1080ui_story then
					arg_153_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1080ui_story then
				arg_153_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_156_4 = 0

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				arg_153_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_156_5 = arg_153_1.actors_["1027ui_story"]
			local var_156_6 = 0

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 and arg_153_1.var_.characterEffect1027ui_story == nil then
				arg_153_1.var_.characterEffect1027ui_story = var_156_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_7 = 0.200000002980232

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_7 then
				local var_156_8 = (arg_153_1.time_ - var_156_6) / var_156_7

				if arg_153_1.var_.characterEffect1027ui_story then
					local var_156_9 = Mathf.Lerp(0, 0.5, var_156_8)

					arg_153_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1027ui_story.fillRatio = var_156_9
				end
			end

			if arg_153_1.time_ >= var_156_6 + var_156_7 and arg_153_1.time_ < var_156_6 + var_156_7 + arg_156_0 and arg_153_1.var_.characterEffect1027ui_story then
				local var_156_10 = 0.5

				arg_153_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1027ui_story.fillRatio = var_156_10
			end

			local var_156_11 = 0
			local var_156_12 = 0.125

			if var_156_11 < arg_153_1.time_ and arg_153_1.time_ <= var_156_11 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_13 = arg_153_1:FormatText(StoryNameCfg[55].name)

				arg_153_1.leftNameTxt_.text = var_156_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_14 = arg_153_1:GetWordFromCfg(1102704038)
				local var_156_15 = arg_153_1:FormatText(var_156_14.content)

				arg_153_1.text_.text = var_156_15

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_16 = 5
				local var_156_17 = utf8.len(var_156_15)
				local var_156_18 = var_156_16 <= 0 and var_156_12 or var_156_12 * (var_156_17 / var_156_16)

				if var_156_18 > 0 and var_156_12 < var_156_18 then
					arg_153_1.talkMaxDuration = var_156_18

					if var_156_18 + var_156_11 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_18 + var_156_11
					end
				end

				arg_153_1.text_.text = var_156_15
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704038", "story_v_side_new_1102704.awb") ~= 0 then
					local var_156_19 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704038", "story_v_side_new_1102704.awb") / 1000

					if var_156_19 + var_156_11 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_19 + var_156_11
					end

					if var_156_14.prefab_name ~= "" and arg_153_1.actors_[var_156_14.prefab_name] ~= nil then
						local var_156_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_14.prefab_name].transform, "story_v_side_new_1102704", "1102704038", "story_v_side_new_1102704.awb")

						arg_153_1:RecordAudio("1102704038", var_156_20)
						arg_153_1:RecordAudio("1102704038", var_156_20)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704038", "story_v_side_new_1102704.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704038", "story_v_side_new_1102704.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_21 = math.max(var_156_12, arg_153_1.talkMaxDuration)

			if var_156_11 <= arg_153_1.time_ and arg_153_1.time_ < var_156_11 + var_156_21 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_11) / var_156_21

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_11 + var_156_21 and arg_153_1.time_ < var_156_11 + var_156_21 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 1102704039
		arg_157_1.duration_ = 10.133

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play1102704040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action1_1")
			end

			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_160_2 = 0
			local var_160_3 = 0.6

			if var_160_2 < arg_157_1.time_ and arg_157_1.time_ <= var_160_2 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_4 = arg_157_1:FormatText(StoryNameCfg[55].name)

				arg_157_1.leftNameTxt_.text = var_160_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_5 = arg_157_1:GetWordFromCfg(1102704039)
				local var_160_6 = arg_157_1:FormatText(var_160_5.content)

				arg_157_1.text_.text = var_160_6

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_7 = 24
				local var_160_8 = utf8.len(var_160_6)
				local var_160_9 = var_160_7 <= 0 and var_160_3 or var_160_3 * (var_160_8 / var_160_7)

				if var_160_9 > 0 and var_160_3 < var_160_9 then
					arg_157_1.talkMaxDuration = var_160_9

					if var_160_9 + var_160_2 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_9 + var_160_2
					end
				end

				arg_157_1.text_.text = var_160_6
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704039", "story_v_side_new_1102704.awb") ~= 0 then
					local var_160_10 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704039", "story_v_side_new_1102704.awb") / 1000

					if var_160_10 + var_160_2 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_10 + var_160_2
					end

					if var_160_5.prefab_name ~= "" and arg_157_1.actors_[var_160_5.prefab_name] ~= nil then
						local var_160_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_5.prefab_name].transform, "story_v_side_new_1102704", "1102704039", "story_v_side_new_1102704.awb")

						arg_157_1:RecordAudio("1102704039", var_160_11)
						arg_157_1:RecordAudio("1102704039", var_160_11)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704039", "story_v_side_new_1102704.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704039", "story_v_side_new_1102704.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_12 = math.max(var_160_3, arg_157_1.talkMaxDuration)

			if var_160_2 <= arg_157_1.time_ and arg_157_1.time_ < var_160_2 + var_160_12 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_2) / var_160_12

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_2 + var_160_12 and arg_157_1.time_ < var_160_2 + var_160_12 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 1102704040
		arg_161_1.duration_ = 3.366

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play1102704041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1027ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1027ui_story == nil then
				arg_161_1.var_.characterEffect1027ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1027ui_story then
					arg_161_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1027ui_story then
				arg_161_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_164_4 = 0

			if var_164_4 < arg_161_1.time_ and arg_161_1.time_ <= var_164_4 + arg_164_0 then
				arg_161_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_2")
			end

			local var_164_5 = 0

			if var_164_5 < arg_161_1.time_ and arg_161_1.time_ <= var_164_5 + arg_164_0 then
				arg_161_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_164_6 = arg_161_1.actors_["1080ui_story"]
			local var_164_7 = 0

			if var_164_7 < arg_161_1.time_ and arg_161_1.time_ <= var_164_7 + arg_164_0 and arg_161_1.var_.characterEffect1080ui_story == nil then
				arg_161_1.var_.characterEffect1080ui_story = var_164_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_8 = 0.200000002980232

			if var_164_7 <= arg_161_1.time_ and arg_161_1.time_ < var_164_7 + var_164_8 then
				local var_164_9 = (arg_161_1.time_ - var_164_7) / var_164_8

				if arg_161_1.var_.characterEffect1080ui_story then
					local var_164_10 = Mathf.Lerp(0, 0.5, var_164_9)

					arg_161_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1080ui_story.fillRatio = var_164_10
				end
			end

			if arg_161_1.time_ >= var_164_7 + var_164_8 and arg_161_1.time_ < var_164_7 + var_164_8 + arg_164_0 and arg_161_1.var_.characterEffect1080ui_story then
				local var_164_11 = 0.5

				arg_161_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1080ui_story.fillRatio = var_164_11
			end

			local var_164_12 = 0
			local var_164_13 = 0.1

			if var_164_12 < arg_161_1.time_ and arg_161_1.time_ <= var_164_12 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_14 = arg_161_1:FormatText(StoryNameCfg[56].name)

				arg_161_1.leftNameTxt_.text = var_164_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_15 = arg_161_1:GetWordFromCfg(1102704040)
				local var_164_16 = arg_161_1:FormatText(var_164_15.content)

				arg_161_1.text_.text = var_164_16

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_17 = 4
				local var_164_18 = utf8.len(var_164_16)
				local var_164_19 = var_164_17 <= 0 and var_164_13 or var_164_13 * (var_164_18 / var_164_17)

				if var_164_19 > 0 and var_164_13 < var_164_19 then
					arg_161_1.talkMaxDuration = var_164_19

					if var_164_19 + var_164_12 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_19 + var_164_12
					end
				end

				arg_161_1.text_.text = var_164_16
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704040", "story_v_side_new_1102704.awb") ~= 0 then
					local var_164_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704040", "story_v_side_new_1102704.awb") / 1000

					if var_164_20 + var_164_12 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_20 + var_164_12
					end

					if var_164_15.prefab_name ~= "" and arg_161_1.actors_[var_164_15.prefab_name] ~= nil then
						local var_164_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_15.prefab_name].transform, "story_v_side_new_1102704", "1102704040", "story_v_side_new_1102704.awb")

						arg_161_1:RecordAudio("1102704040", var_164_21)
						arg_161_1:RecordAudio("1102704040", var_164_21)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704040", "story_v_side_new_1102704.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704040", "story_v_side_new_1102704.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_22 = math.max(var_164_13, arg_161_1.talkMaxDuration)

			if var_164_12 <= arg_161_1.time_ and arg_161_1.time_ < var_164_12 + var_164_22 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_12) / var_164_22

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_12 + var_164_22 and arg_161_1.time_ < var_164_12 + var_164_22 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 1102704041
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play1102704042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1027ui_story"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1027ui_story = var_168_0.localPosition
			end

			local var_168_2 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2
				local var_168_4 = Vector3.New(0, 100, 0)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1027ui_story, var_168_4, var_168_3)

				local var_168_5 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_5.x, var_168_5.y, var_168_5.z)

				local var_168_6 = var_168_0.localEulerAngles

				var_168_6.z = 0
				var_168_6.x = 0
				var_168_0.localEulerAngles = var_168_6
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(0, 100, 0)

				local var_168_7 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_7.x, var_168_7.y, var_168_7.z)

				local var_168_8 = var_168_0.localEulerAngles

				var_168_8.z = 0
				var_168_8.x = 0
				var_168_0.localEulerAngles = var_168_8
			end

			local var_168_9 = arg_165_1.actors_["1027ui_story"]
			local var_168_10 = 0

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 and arg_165_1.var_.characterEffect1027ui_story == nil then
				arg_165_1.var_.characterEffect1027ui_story = var_168_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_11 = 0.200000002980232

			if var_168_10 <= arg_165_1.time_ and arg_165_1.time_ < var_168_10 + var_168_11 then
				local var_168_12 = (arg_165_1.time_ - var_168_10) / var_168_11

				if arg_165_1.var_.characterEffect1027ui_story then
					local var_168_13 = Mathf.Lerp(0, 0.5, var_168_12)

					arg_165_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1027ui_story.fillRatio = var_168_13
				end
			end

			if arg_165_1.time_ >= var_168_10 + var_168_11 and arg_165_1.time_ < var_168_10 + var_168_11 + arg_168_0 and arg_165_1.var_.characterEffect1027ui_story then
				local var_168_14 = 0.5

				arg_165_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1027ui_story.fillRatio = var_168_14
			end

			local var_168_15 = arg_165_1.actors_["1080ui_story"].transform
			local var_168_16 = 0

			if var_168_16 < arg_165_1.time_ and arg_165_1.time_ <= var_168_16 + arg_168_0 then
				arg_165_1.var_.moveOldPos1080ui_story = var_168_15.localPosition
			end

			local var_168_17 = 0.001

			if var_168_16 <= arg_165_1.time_ and arg_165_1.time_ < var_168_16 + var_168_17 then
				local var_168_18 = (arg_165_1.time_ - var_168_16) / var_168_17
				local var_168_19 = Vector3.New(0, 100, 0)

				var_168_15.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1080ui_story, var_168_19, var_168_18)

				local var_168_20 = manager.ui.mainCamera.transform.position - var_168_15.position

				var_168_15.forward = Vector3.New(var_168_20.x, var_168_20.y, var_168_20.z)

				local var_168_21 = var_168_15.localEulerAngles

				var_168_21.z = 0
				var_168_21.x = 0
				var_168_15.localEulerAngles = var_168_21
			end

			if arg_165_1.time_ >= var_168_16 + var_168_17 and arg_165_1.time_ < var_168_16 + var_168_17 + arg_168_0 then
				var_168_15.localPosition = Vector3.New(0, 100, 0)

				local var_168_22 = manager.ui.mainCamera.transform.position - var_168_15.position

				var_168_15.forward = Vector3.New(var_168_22.x, var_168_22.y, var_168_22.z)

				local var_168_23 = var_168_15.localEulerAngles

				var_168_23.z = 0
				var_168_23.x = 0
				var_168_15.localEulerAngles = var_168_23
			end

			local var_168_24 = arg_165_1.actors_["1080ui_story"]
			local var_168_25 = 0

			if var_168_25 < arg_165_1.time_ and arg_165_1.time_ <= var_168_25 + arg_168_0 and arg_165_1.var_.characterEffect1080ui_story == nil then
				arg_165_1.var_.characterEffect1080ui_story = var_168_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_26 = 0.200000002980232

			if var_168_25 <= arg_165_1.time_ and arg_165_1.time_ < var_168_25 + var_168_26 then
				local var_168_27 = (arg_165_1.time_ - var_168_25) / var_168_26

				if arg_165_1.var_.characterEffect1080ui_story then
					local var_168_28 = Mathf.Lerp(0, 0.5, var_168_27)

					arg_165_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1080ui_story.fillRatio = var_168_28
				end
			end

			if arg_165_1.time_ >= var_168_25 + var_168_26 and arg_165_1.time_ < var_168_25 + var_168_26 + arg_168_0 and arg_165_1.var_.characterEffect1080ui_story then
				local var_168_29 = 0.5

				arg_165_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1080ui_story.fillRatio = var_168_29
			end

			local var_168_30 = 0
			local var_168_31 = 1.025

			if var_168_30 < arg_165_1.time_ and arg_165_1.time_ <= var_168_30 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_32 = arg_165_1:GetWordFromCfg(1102704041)
				local var_168_33 = arg_165_1:FormatText(var_168_32.content)

				arg_165_1.text_.text = var_168_33

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_34 = 41
				local var_168_35 = utf8.len(var_168_33)
				local var_168_36 = var_168_34 <= 0 and var_168_31 or var_168_31 * (var_168_35 / var_168_34)

				if var_168_36 > 0 and var_168_31 < var_168_36 then
					arg_165_1.talkMaxDuration = var_168_36

					if var_168_36 + var_168_30 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_36 + var_168_30
					end
				end

				arg_165_1.text_.text = var_168_33
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_37 = math.max(var_168_31, arg_165_1.talkMaxDuration)

			if var_168_30 <= arg_165_1.time_ and arg_165_1.time_ < var_168_30 + var_168_37 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_30) / var_168_37

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_30 + var_168_37 and arg_165_1.time_ < var_168_30 + var_168_37 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 1102704042
		arg_169_1.duration_ = 11.066

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play1102704043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1080ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1080ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(-0.7, -1.01, -6.05)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1080ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(-0.7, -1.01, -6.05)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["1080ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and arg_169_1.var_.characterEffect1080ui_story == nil then
				arg_169_1.var_.characterEffect1080ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect1080ui_story then
					arg_169_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect1080ui_story then
				arg_169_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_172_13 = 0

			if var_172_13 < arg_169_1.time_ and arg_169_1.time_ <= var_172_13 + arg_172_0 then
				arg_169_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action2_1")
			end

			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_172_15 = 0
			local var_172_16 = 1.125

			if var_172_15 < arg_169_1.time_ and arg_169_1.time_ <= var_172_15 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_17 = arg_169_1:FormatText(StoryNameCfg[55].name)

				arg_169_1.leftNameTxt_.text = var_172_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_18 = arg_169_1:GetWordFromCfg(1102704042)
				local var_172_19 = arg_169_1:FormatText(var_172_18.content)

				arg_169_1.text_.text = var_172_19

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_20 = 45
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704042", "story_v_side_new_1102704.awb") ~= 0 then
					local var_172_23 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704042", "story_v_side_new_1102704.awb") / 1000

					if var_172_23 + var_172_15 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_23 + var_172_15
					end

					if var_172_18.prefab_name ~= "" and arg_169_1.actors_[var_172_18.prefab_name] ~= nil then
						local var_172_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_18.prefab_name].transform, "story_v_side_new_1102704", "1102704042", "story_v_side_new_1102704.awb")

						arg_169_1:RecordAudio("1102704042", var_172_24)
						arg_169_1:RecordAudio("1102704042", var_172_24)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704042", "story_v_side_new_1102704.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704042", "story_v_side_new_1102704.awb")
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
	Play1102704043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 1102704043
		arg_173_1.duration_ = 13.133

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play1102704044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1027ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1027ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(0.7, -0.81, -5.8)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1027ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = arg_173_1.actors_["1027ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1027ui_story == nil then
				arg_173_1.var_.characterEffect1027ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.200000002980232

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1027ui_story then
					arg_173_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1027ui_story then
				arg_173_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_176_13 = 0

			if var_176_13 < arg_173_1.time_ and arg_173_1.time_ <= var_176_13 + arg_176_0 then
				arg_173_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action3_1")
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_176_15 = arg_173_1.actors_["1080ui_story"]
			local var_176_16 = 0

			if var_176_16 < arg_173_1.time_ and arg_173_1.time_ <= var_176_16 + arg_176_0 and arg_173_1.var_.characterEffect1080ui_story == nil then
				arg_173_1.var_.characterEffect1080ui_story = var_176_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_17 = 0.200000002980232

			if var_176_16 <= arg_173_1.time_ and arg_173_1.time_ < var_176_16 + var_176_17 then
				local var_176_18 = (arg_173_1.time_ - var_176_16) / var_176_17

				if arg_173_1.var_.characterEffect1080ui_story then
					local var_176_19 = Mathf.Lerp(0, 0.5, var_176_18)

					arg_173_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1080ui_story.fillRatio = var_176_19
				end
			end

			if arg_173_1.time_ >= var_176_16 + var_176_17 and arg_173_1.time_ < var_176_16 + var_176_17 + arg_176_0 and arg_173_1.var_.characterEffect1080ui_story then
				local var_176_20 = 0.5

				arg_173_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1080ui_story.fillRatio = var_176_20
			end

			local var_176_21 = 0
			local var_176_22 = 0.95

			if var_176_21 < arg_173_1.time_ and arg_173_1.time_ <= var_176_21 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_23 = arg_173_1:FormatText(StoryNameCfg[56].name)

				arg_173_1.leftNameTxt_.text = var_176_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_24 = arg_173_1:GetWordFromCfg(1102704043)
				local var_176_25 = arg_173_1:FormatText(var_176_24.content)

				arg_173_1.text_.text = var_176_25

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_26 = 38
				local var_176_27 = utf8.len(var_176_25)
				local var_176_28 = var_176_26 <= 0 and var_176_22 or var_176_22 * (var_176_27 / var_176_26)

				if var_176_28 > 0 and var_176_22 < var_176_28 then
					arg_173_1.talkMaxDuration = var_176_28

					if var_176_28 + var_176_21 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_28 + var_176_21
					end
				end

				arg_173_1.text_.text = var_176_25
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704043", "story_v_side_new_1102704.awb") ~= 0 then
					local var_176_29 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704043", "story_v_side_new_1102704.awb") / 1000

					if var_176_29 + var_176_21 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_29 + var_176_21
					end

					if var_176_24.prefab_name ~= "" and arg_173_1.actors_[var_176_24.prefab_name] ~= nil then
						local var_176_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_24.prefab_name].transform, "story_v_side_new_1102704", "1102704043", "story_v_side_new_1102704.awb")

						arg_173_1:RecordAudio("1102704043", var_176_30)
						arg_173_1:RecordAudio("1102704043", var_176_30)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704043", "story_v_side_new_1102704.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704043", "story_v_side_new_1102704.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_31 = math.max(var_176_22, arg_173_1.talkMaxDuration)

			if var_176_21 <= arg_173_1.time_ and arg_173_1.time_ < var_176_21 + var_176_31 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_21) / var_176_31

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_21 + var_176_31 and arg_173_1.time_ < var_176_21 + var_176_31 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 1102704044
		arg_177_1.duration_ = 7.466

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play1102704045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1080ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1080ui_story == nil then
				arg_177_1.var_.characterEffect1080ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.200000002980232

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1080ui_story then
					arg_177_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1080ui_story then
				arg_177_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_180_4 = 0

			if var_180_4 < arg_177_1.time_ and arg_177_1.time_ <= var_180_4 + arg_180_0 then
				arg_177_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action2_2")
			end

			local var_180_5 = arg_177_1.actors_["1027ui_story"]
			local var_180_6 = 0

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 and arg_177_1.var_.characterEffect1027ui_story == nil then
				arg_177_1.var_.characterEffect1027ui_story = var_180_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_7 = 0.200000002980232

			if var_180_6 <= arg_177_1.time_ and arg_177_1.time_ < var_180_6 + var_180_7 then
				local var_180_8 = (arg_177_1.time_ - var_180_6) / var_180_7

				if arg_177_1.var_.characterEffect1027ui_story then
					local var_180_9 = Mathf.Lerp(0, 0.5, var_180_8)

					arg_177_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1027ui_story.fillRatio = var_180_9
				end
			end

			if arg_177_1.time_ >= var_180_6 + var_180_7 and arg_177_1.time_ < var_180_6 + var_180_7 + arg_180_0 and arg_177_1.var_.characterEffect1027ui_story then
				local var_180_10 = 0.5

				arg_177_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1027ui_story.fillRatio = var_180_10
			end

			local var_180_11 = 0
			local var_180_12 = 0.7

			if var_180_11 < arg_177_1.time_ and arg_177_1.time_ <= var_180_11 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_13 = arg_177_1:FormatText(StoryNameCfg[55].name)

				arg_177_1.leftNameTxt_.text = var_180_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_14 = arg_177_1:GetWordFromCfg(1102704044)
				local var_180_15 = arg_177_1:FormatText(var_180_14.content)

				arg_177_1.text_.text = var_180_15

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_16 = 28
				local var_180_17 = utf8.len(var_180_15)
				local var_180_18 = var_180_16 <= 0 and var_180_12 or var_180_12 * (var_180_17 / var_180_16)

				if var_180_18 > 0 and var_180_12 < var_180_18 then
					arg_177_1.talkMaxDuration = var_180_18

					if var_180_18 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_18 + var_180_11
					end
				end

				arg_177_1.text_.text = var_180_15
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704044", "story_v_side_new_1102704.awb") ~= 0 then
					local var_180_19 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704044", "story_v_side_new_1102704.awb") / 1000

					if var_180_19 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_11
					end

					if var_180_14.prefab_name ~= "" and arg_177_1.actors_[var_180_14.prefab_name] ~= nil then
						local var_180_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_14.prefab_name].transform, "story_v_side_new_1102704", "1102704044", "story_v_side_new_1102704.awb")

						arg_177_1:RecordAudio("1102704044", var_180_20)
						arg_177_1:RecordAudio("1102704044", var_180_20)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704044", "story_v_side_new_1102704.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704044", "story_v_side_new_1102704.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_21 = math.max(var_180_12, arg_177_1.talkMaxDuration)

			if var_180_11 <= arg_177_1.time_ and arg_177_1.time_ < var_180_11 + var_180_21 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_11) / var_180_21

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_11 + var_180_21 and arg_177_1.time_ < var_180_11 + var_180_21 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 1102704045
		arg_181_1.duration_ = 2.7

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play1102704046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1027ui_story"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos1027ui_story = var_184_0.localPosition
			end

			local var_184_2 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2
				local var_184_4 = Vector3.New(0.7, -0.81, -5.8)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1027ui_story, var_184_4, var_184_3)

				local var_184_5 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_5.x, var_184_5.y, var_184_5.z)

				local var_184_6 = var_184_0.localEulerAngles

				var_184_6.z = 0
				var_184_6.x = 0
				var_184_0.localEulerAngles = var_184_6
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_184_7 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_7.x, var_184_7.y, var_184_7.z)

				local var_184_8 = var_184_0.localEulerAngles

				var_184_8.z = 0
				var_184_8.x = 0
				var_184_0.localEulerAngles = var_184_8
			end

			local var_184_9 = arg_181_1.actors_["1027ui_story"]
			local var_184_10 = 0

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 and arg_181_1.var_.characterEffect1027ui_story == nil then
				arg_181_1.var_.characterEffect1027ui_story = var_184_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_11 = 0.200000002980232

			if var_184_10 <= arg_181_1.time_ and arg_181_1.time_ < var_184_10 + var_184_11 then
				local var_184_12 = (arg_181_1.time_ - var_184_10) / var_184_11

				if arg_181_1.var_.characterEffect1027ui_story then
					arg_181_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_10 + var_184_11 and arg_181_1.time_ < var_184_10 + var_184_11 + arg_184_0 and arg_181_1.var_.characterEffect1027ui_story then
				arg_181_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_184_13 = 0

			if var_184_13 < arg_181_1.time_ and arg_181_1.time_ <= var_184_13 + arg_184_0 then
				arg_181_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action3_2")
			end

			local var_184_14 = 0

			if var_184_14 < arg_181_1.time_ and arg_181_1.time_ <= var_184_14 + arg_184_0 then
				arg_181_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_184_15 = arg_181_1.actors_["1080ui_story"]
			local var_184_16 = 0

			if var_184_16 < arg_181_1.time_ and arg_181_1.time_ <= var_184_16 + arg_184_0 and arg_181_1.var_.characterEffect1080ui_story == nil then
				arg_181_1.var_.characterEffect1080ui_story = var_184_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_17 = 0.200000002980232

			if var_184_16 <= arg_181_1.time_ and arg_181_1.time_ < var_184_16 + var_184_17 then
				local var_184_18 = (arg_181_1.time_ - var_184_16) / var_184_17

				if arg_181_1.var_.characterEffect1080ui_story then
					local var_184_19 = Mathf.Lerp(0, 0.5, var_184_18)

					arg_181_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1080ui_story.fillRatio = var_184_19
				end
			end

			if arg_181_1.time_ >= var_184_16 + var_184_17 and arg_181_1.time_ < var_184_16 + var_184_17 + arg_184_0 and arg_181_1.var_.characterEffect1080ui_story then
				local var_184_20 = 0.5

				arg_181_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1080ui_story.fillRatio = var_184_20
			end

			local var_184_21 = 0
			local var_184_22 = 0.1

			if var_184_21 < arg_181_1.time_ and arg_181_1.time_ <= var_184_21 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_23 = arg_181_1:FormatText(StoryNameCfg[56].name)

				arg_181_1.leftNameTxt_.text = var_184_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_24 = arg_181_1:GetWordFromCfg(1102704045)
				local var_184_25 = arg_181_1:FormatText(var_184_24.content)

				arg_181_1.text_.text = var_184_25

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_26 = 4
				local var_184_27 = utf8.len(var_184_25)
				local var_184_28 = var_184_26 <= 0 and var_184_22 or var_184_22 * (var_184_27 / var_184_26)

				if var_184_28 > 0 and var_184_22 < var_184_28 then
					arg_181_1.talkMaxDuration = var_184_28

					if var_184_28 + var_184_21 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_28 + var_184_21
					end
				end

				arg_181_1.text_.text = var_184_25
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704045", "story_v_side_new_1102704.awb") ~= 0 then
					local var_184_29 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704045", "story_v_side_new_1102704.awb") / 1000

					if var_184_29 + var_184_21 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_29 + var_184_21
					end

					if var_184_24.prefab_name ~= "" and arg_181_1.actors_[var_184_24.prefab_name] ~= nil then
						local var_184_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_24.prefab_name].transform, "story_v_side_new_1102704", "1102704045", "story_v_side_new_1102704.awb")

						arg_181_1:RecordAudio("1102704045", var_184_30)
						arg_181_1:RecordAudio("1102704045", var_184_30)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704045", "story_v_side_new_1102704.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704045", "story_v_side_new_1102704.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_31 = math.max(var_184_22, arg_181_1.talkMaxDuration)

			if var_184_21 <= arg_181_1.time_ and arg_181_1.time_ < var_184_21 + var_184_31 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_21) / var_184_31

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_21 + var_184_31 and arg_181_1.time_ < var_184_21 + var_184_31 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 1102704046
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play1102704047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1027ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect1027ui_story == nil then
				arg_185_1.var_.characterEffect1027ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.200000002980232

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect1027ui_story then
					local var_188_4 = Mathf.Lerp(0, 0.5, var_188_3)

					arg_185_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1027ui_story.fillRatio = var_188_4
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect1027ui_story then
				local var_188_5 = 0.5

				arg_185_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1027ui_story.fillRatio = var_188_5
			end

			local var_188_6 = 0
			local var_188_7 = 0.875

			if var_188_6 < arg_185_1.time_ and arg_185_1.time_ <= var_188_6 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_8 = arg_185_1:GetWordFromCfg(1102704046)
				local var_188_9 = arg_185_1:FormatText(var_188_8.content)

				arg_185_1.text_.text = var_188_9

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_10 = 35
				local var_188_11 = utf8.len(var_188_9)
				local var_188_12 = var_188_10 <= 0 and var_188_7 or var_188_7 * (var_188_11 / var_188_10)

				if var_188_12 > 0 and var_188_7 < var_188_12 then
					arg_185_1.talkMaxDuration = var_188_12

					if var_188_12 + var_188_6 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_12 + var_188_6
					end
				end

				arg_185_1.text_.text = var_188_9
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_13 = math.max(var_188_7, arg_185_1.talkMaxDuration)

			if var_188_6 <= arg_185_1.time_ and arg_185_1.time_ < var_188_6 + var_188_13 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_6) / var_188_13

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_6 + var_188_13 and arg_185_1.time_ < var_188_6 + var_188_13 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 1102704047
		arg_189_1.duration_ = 8.7

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play1102704048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1027ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect1027ui_story == nil then
				arg_189_1.var_.characterEffect1027ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.200000002980232

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect1027ui_story then
					arg_189_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect1027ui_story then
				arg_189_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_192_4 = 0

			if var_192_4 < arg_189_1.time_ and arg_189_1.time_ <= var_192_4 + arg_192_0 then
				arg_189_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action1_1")
			end

			local var_192_5 = 0

			if var_192_5 < arg_189_1.time_ and arg_189_1.time_ <= var_192_5 + arg_192_0 then
				arg_189_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_192_6 = 0
			local var_192_7 = 0.925

			if var_192_6 < arg_189_1.time_ and arg_189_1.time_ <= var_192_6 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_8 = arg_189_1:FormatText(StoryNameCfg[56].name)

				arg_189_1.leftNameTxt_.text = var_192_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_9 = arg_189_1:GetWordFromCfg(1102704047)
				local var_192_10 = arg_189_1:FormatText(var_192_9.content)

				arg_189_1.text_.text = var_192_10

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_11 = 37
				local var_192_12 = utf8.len(var_192_10)
				local var_192_13 = var_192_11 <= 0 and var_192_7 or var_192_7 * (var_192_12 / var_192_11)

				if var_192_13 > 0 and var_192_7 < var_192_13 then
					arg_189_1.talkMaxDuration = var_192_13

					if var_192_13 + var_192_6 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_13 + var_192_6
					end
				end

				arg_189_1.text_.text = var_192_10
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704047", "story_v_side_new_1102704.awb") ~= 0 then
					local var_192_14 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704047", "story_v_side_new_1102704.awb") / 1000

					if var_192_14 + var_192_6 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_14 + var_192_6
					end

					if var_192_9.prefab_name ~= "" and arg_189_1.actors_[var_192_9.prefab_name] ~= nil then
						local var_192_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_9.prefab_name].transform, "story_v_side_new_1102704", "1102704047", "story_v_side_new_1102704.awb")

						arg_189_1:RecordAudio("1102704047", var_192_15)
						arg_189_1:RecordAudio("1102704047", var_192_15)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704047", "story_v_side_new_1102704.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704047", "story_v_side_new_1102704.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_16 = math.max(var_192_7, arg_189_1.talkMaxDuration)

			if var_192_6 <= arg_189_1.time_ and arg_189_1.time_ < var_192_6 + var_192_16 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_6) / var_192_16

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_6 + var_192_16 and arg_189_1.time_ < var_192_6 + var_192_16 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 1102704048
		arg_193_1.duration_ = 3.6

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play1102704049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1080ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos1080ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(0, 100, 0)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1080ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0, 100, 0)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["1080ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and arg_193_1.var_.characterEffect1080ui_story == nil then
				arg_193_1.var_.characterEffect1080ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.200000002980232

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect1080ui_story then
					local var_196_13 = Mathf.Lerp(0, 0.5, var_196_12)

					arg_193_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1080ui_story.fillRatio = var_196_13
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and arg_193_1.var_.characterEffect1080ui_story then
				local var_196_14 = 0.5

				arg_193_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1080ui_story.fillRatio = var_196_14
			end

			local var_196_15 = "1019ui_story"

			if arg_193_1.actors_[var_196_15] == nil then
				local var_196_16 = Object.Instantiate(Asset.Load("Char/" .. var_196_15), arg_193_1.stage_.transform)

				var_196_16.name = var_196_15
				var_196_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_193_1.actors_[var_196_15] = var_196_16

				local var_196_17 = var_196_16:GetComponentInChildren(typeof(CharacterEffect))

				var_196_17.enabled = true

				local var_196_18 = GameObjectTools.GetOrAddComponent(var_196_16, typeof(DynamicBoneHelper))

				if var_196_18 then
					var_196_18:EnableDynamicBone(false)
				end

				arg_193_1:ShowWeapon(var_196_17.transform, false)

				arg_193_1.var_[var_196_15 .. "Animator"] = var_196_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_193_1.var_[var_196_15 .. "Animator"].applyRootMotion = true
				arg_193_1.var_[var_196_15 .. "LipSync"] = var_196_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_196_19 = arg_193_1.actors_["1019ui_story"].transform
			local var_196_20 = 0

			if var_196_20 < arg_193_1.time_ and arg_193_1.time_ <= var_196_20 + arg_196_0 then
				arg_193_1.var_.moveOldPos1019ui_story = var_196_19.localPosition
			end

			local var_196_21 = 0.001

			if var_196_20 <= arg_193_1.time_ and arg_193_1.time_ < var_196_20 + var_196_21 then
				local var_196_22 = (arg_193_1.time_ - var_196_20) / var_196_21
				local var_196_23 = Vector3.New(-0.7, -1.08, -5.9)

				var_196_19.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1019ui_story, var_196_23, var_196_22)

				local var_196_24 = manager.ui.mainCamera.transform.position - var_196_19.position

				var_196_19.forward = Vector3.New(var_196_24.x, var_196_24.y, var_196_24.z)

				local var_196_25 = var_196_19.localEulerAngles

				var_196_25.z = 0
				var_196_25.x = 0
				var_196_19.localEulerAngles = var_196_25
			end

			if arg_193_1.time_ >= var_196_20 + var_196_21 and arg_193_1.time_ < var_196_20 + var_196_21 + arg_196_0 then
				var_196_19.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_196_26 = manager.ui.mainCamera.transform.position - var_196_19.position

				var_196_19.forward = Vector3.New(var_196_26.x, var_196_26.y, var_196_26.z)

				local var_196_27 = var_196_19.localEulerAngles

				var_196_27.z = 0
				var_196_27.x = 0
				var_196_19.localEulerAngles = var_196_27
			end

			local var_196_28 = arg_193_1.actors_["1019ui_story"]
			local var_196_29 = 0

			if var_196_29 < arg_193_1.time_ and arg_193_1.time_ <= var_196_29 + arg_196_0 and arg_193_1.var_.characterEffect1019ui_story == nil then
				arg_193_1.var_.characterEffect1019ui_story = var_196_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_30 = 0.200000002980232

			if var_196_29 <= arg_193_1.time_ and arg_193_1.time_ < var_196_29 + var_196_30 then
				local var_196_31 = (arg_193_1.time_ - var_196_29) / var_196_30

				if arg_193_1.var_.characterEffect1019ui_story then
					arg_193_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_29 + var_196_30 and arg_193_1.time_ < var_196_29 + var_196_30 + arg_196_0 and arg_193_1.var_.characterEffect1019ui_story then
				arg_193_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_196_32 = 0

			if var_196_32 < arg_193_1.time_ and arg_193_1.time_ <= var_196_32 + arg_196_0 then
				arg_193_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_196_33 = 0

			if var_196_33 < arg_193_1.time_ and arg_193_1.time_ <= var_196_33 + arg_196_0 then
				arg_193_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_196_34 = arg_193_1.actors_["1027ui_story"]
			local var_196_35 = 0

			if var_196_35 < arg_193_1.time_ and arg_193_1.time_ <= var_196_35 + arg_196_0 and arg_193_1.var_.characterEffect1027ui_story == nil then
				arg_193_1.var_.characterEffect1027ui_story = var_196_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_36 = 0.200000002980232

			if var_196_35 <= arg_193_1.time_ and arg_193_1.time_ < var_196_35 + var_196_36 then
				local var_196_37 = (arg_193_1.time_ - var_196_35) / var_196_36

				if arg_193_1.var_.characterEffect1027ui_story then
					local var_196_38 = Mathf.Lerp(0, 0.5, var_196_37)

					arg_193_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1027ui_story.fillRatio = var_196_38
				end
			end

			if arg_193_1.time_ >= var_196_35 + var_196_36 and arg_193_1.time_ < var_196_35 + var_196_36 + arg_196_0 and arg_193_1.var_.characterEffect1027ui_story then
				local var_196_39 = 0.5

				arg_193_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1027ui_story.fillRatio = var_196_39
			end

			local var_196_40 = 0
			local var_196_41 = 0.4

			if var_196_40 < arg_193_1.time_ and arg_193_1.time_ <= var_196_40 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_42 = arg_193_1:FormatText(StoryNameCfg[13].name)

				arg_193_1.leftNameTxt_.text = var_196_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_43 = arg_193_1:GetWordFromCfg(1102704048)
				local var_196_44 = arg_193_1:FormatText(var_196_43.content)

				arg_193_1.text_.text = var_196_44

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_45 = 16
				local var_196_46 = utf8.len(var_196_44)
				local var_196_47 = var_196_45 <= 0 and var_196_41 or var_196_41 * (var_196_46 / var_196_45)

				if var_196_47 > 0 and var_196_41 < var_196_47 then
					arg_193_1.talkMaxDuration = var_196_47

					if var_196_47 + var_196_40 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_47 + var_196_40
					end
				end

				arg_193_1.text_.text = var_196_44
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704048", "story_v_side_new_1102704.awb") ~= 0 then
					local var_196_48 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704048", "story_v_side_new_1102704.awb") / 1000

					if var_196_48 + var_196_40 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_48 + var_196_40
					end

					if var_196_43.prefab_name ~= "" and arg_193_1.actors_[var_196_43.prefab_name] ~= nil then
						local var_196_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_43.prefab_name].transform, "story_v_side_new_1102704", "1102704048", "story_v_side_new_1102704.awb")

						arg_193_1:RecordAudio("1102704048", var_196_49)
						arg_193_1:RecordAudio("1102704048", var_196_49)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704048", "story_v_side_new_1102704.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704048", "story_v_side_new_1102704.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_50 = math.max(var_196_41, arg_193_1.talkMaxDuration)

			if var_196_40 <= arg_193_1.time_ and arg_193_1.time_ < var_196_40 + var_196_50 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_40) / var_196_50

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_40 + var_196_50 and arg_193_1.time_ < var_196_40 + var_196_50 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 1102704049
		arg_197_1.duration_ = 7.066

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play1102704050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1027ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect1027ui_story == nil then
				arg_197_1.var_.characterEffect1027ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect1027ui_story then
					arg_197_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect1027ui_story then
				arg_197_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_200_4 = 0

			if var_200_4 < arg_197_1.time_ and arg_197_1.time_ <= var_200_4 + arg_200_0 then
				arg_197_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action6_1")
			end

			local var_200_5 = 0

			if var_200_5 < arg_197_1.time_ and arg_197_1.time_ <= var_200_5 + arg_200_0 then
				arg_197_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_200_6 = arg_197_1.actors_["1019ui_story"]
			local var_200_7 = 0

			if var_200_7 < arg_197_1.time_ and arg_197_1.time_ <= var_200_7 + arg_200_0 and arg_197_1.var_.characterEffect1019ui_story == nil then
				arg_197_1.var_.characterEffect1019ui_story = var_200_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_8 = 0.200000002980232

			if var_200_7 <= arg_197_1.time_ and arg_197_1.time_ < var_200_7 + var_200_8 then
				local var_200_9 = (arg_197_1.time_ - var_200_7) / var_200_8

				if arg_197_1.var_.characterEffect1019ui_story then
					local var_200_10 = Mathf.Lerp(0, 0.5, var_200_9)

					arg_197_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1019ui_story.fillRatio = var_200_10
				end
			end

			if arg_197_1.time_ >= var_200_7 + var_200_8 and arg_197_1.time_ < var_200_7 + var_200_8 + arg_200_0 and arg_197_1.var_.characterEffect1019ui_story then
				local var_200_11 = 0.5

				arg_197_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1019ui_story.fillRatio = var_200_11
			end

			local var_200_12 = 0
			local var_200_13 = 0.675

			if var_200_12 < arg_197_1.time_ and arg_197_1.time_ <= var_200_12 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_14 = arg_197_1:FormatText(StoryNameCfg[56].name)

				arg_197_1.leftNameTxt_.text = var_200_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_15 = arg_197_1:GetWordFromCfg(1102704049)
				local var_200_16 = arg_197_1:FormatText(var_200_15.content)

				arg_197_1.text_.text = var_200_16

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_17 = 27
				local var_200_18 = utf8.len(var_200_16)
				local var_200_19 = var_200_17 <= 0 and var_200_13 or var_200_13 * (var_200_18 / var_200_17)

				if var_200_19 > 0 and var_200_13 < var_200_19 then
					arg_197_1.talkMaxDuration = var_200_19

					if var_200_19 + var_200_12 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_19 + var_200_12
					end
				end

				arg_197_1.text_.text = var_200_16
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704049", "story_v_side_new_1102704.awb") ~= 0 then
					local var_200_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704049", "story_v_side_new_1102704.awb") / 1000

					if var_200_20 + var_200_12 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_20 + var_200_12
					end

					if var_200_15.prefab_name ~= "" and arg_197_1.actors_[var_200_15.prefab_name] ~= nil then
						local var_200_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_15.prefab_name].transform, "story_v_side_new_1102704", "1102704049", "story_v_side_new_1102704.awb")

						arg_197_1:RecordAudio("1102704049", var_200_21)
						arg_197_1:RecordAudio("1102704049", var_200_21)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704049", "story_v_side_new_1102704.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704049", "story_v_side_new_1102704.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_22 = math.max(var_200_13, arg_197_1.talkMaxDuration)

			if var_200_12 <= arg_197_1.time_ and arg_197_1.time_ < var_200_12 + var_200_22 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_12) / var_200_22

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_12 + var_200_22 and arg_197_1.time_ < var_200_12 + var_200_22 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 1102704050
		arg_201_1.duration_ = 6.466

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play1102704051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1019ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1019ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, 100, 0)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1019ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, 100, 0)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["1019ui_story"]
			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect1019ui_story == nil then
				arg_201_1.var_.characterEffect1019ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.200000002980232

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect1019ui_story then
					local var_204_13 = Mathf.Lerp(0, 0.5, var_204_12)

					arg_201_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1019ui_story.fillRatio = var_204_13
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and arg_201_1.var_.characterEffect1019ui_story then
				local var_204_14 = 0.5

				arg_201_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1019ui_story.fillRatio = var_204_14
			end

			local var_204_15 = arg_201_1.actors_["1084ui_story"].transform
			local var_204_16 = 0

			if var_204_16 < arg_201_1.time_ and arg_201_1.time_ <= var_204_16 + arg_204_0 then
				arg_201_1.var_.moveOldPos1084ui_story = var_204_15.localPosition
			end

			local var_204_17 = 0.001

			if var_204_16 <= arg_201_1.time_ and arg_201_1.time_ < var_204_16 + var_204_17 then
				local var_204_18 = (arg_201_1.time_ - var_204_16) / var_204_17
				local var_204_19 = Vector3.New(-0.7, -0.97, -6)

				var_204_15.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1084ui_story, var_204_19, var_204_18)

				local var_204_20 = manager.ui.mainCamera.transform.position - var_204_15.position

				var_204_15.forward = Vector3.New(var_204_20.x, var_204_20.y, var_204_20.z)

				local var_204_21 = var_204_15.localEulerAngles

				var_204_21.z = 0
				var_204_21.x = 0
				var_204_15.localEulerAngles = var_204_21
			end

			if arg_201_1.time_ >= var_204_16 + var_204_17 and arg_201_1.time_ < var_204_16 + var_204_17 + arg_204_0 then
				var_204_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_204_22 = manager.ui.mainCamera.transform.position - var_204_15.position

				var_204_15.forward = Vector3.New(var_204_22.x, var_204_22.y, var_204_22.z)

				local var_204_23 = var_204_15.localEulerAngles

				var_204_23.z = 0
				var_204_23.x = 0
				var_204_15.localEulerAngles = var_204_23
			end

			local var_204_24 = arg_201_1.actors_["1084ui_story"]
			local var_204_25 = 0

			if var_204_25 < arg_201_1.time_ and arg_201_1.time_ <= var_204_25 + arg_204_0 and arg_201_1.var_.characterEffect1084ui_story == nil then
				arg_201_1.var_.characterEffect1084ui_story = var_204_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_26 = 0.200000002980232

			if var_204_25 <= arg_201_1.time_ and arg_201_1.time_ < var_204_25 + var_204_26 then
				local var_204_27 = (arg_201_1.time_ - var_204_25) / var_204_26

				if arg_201_1.var_.characterEffect1084ui_story then
					arg_201_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_25 + var_204_26 and arg_201_1.time_ < var_204_25 + var_204_26 + arg_204_0 and arg_201_1.var_.characterEffect1084ui_story then
				arg_201_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_204_28 = 0

			if var_204_28 < arg_201_1.time_ and arg_201_1.time_ <= var_204_28 + arg_204_0 then
				arg_201_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_204_29 = 0

			if var_204_29 < arg_201_1.time_ and arg_201_1.time_ <= var_204_29 + arg_204_0 then
				arg_201_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_204_30 = arg_201_1.actors_["1027ui_story"]
			local var_204_31 = 0

			if var_204_31 < arg_201_1.time_ and arg_201_1.time_ <= var_204_31 + arg_204_0 and arg_201_1.var_.characterEffect1027ui_story == nil then
				arg_201_1.var_.characterEffect1027ui_story = var_204_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_32 = 0.200000002980232

			if var_204_31 <= arg_201_1.time_ and arg_201_1.time_ < var_204_31 + var_204_32 then
				local var_204_33 = (arg_201_1.time_ - var_204_31) / var_204_32

				if arg_201_1.var_.characterEffect1027ui_story then
					local var_204_34 = Mathf.Lerp(0, 0.5, var_204_33)

					arg_201_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1027ui_story.fillRatio = var_204_34
				end
			end

			if arg_201_1.time_ >= var_204_31 + var_204_32 and arg_201_1.time_ < var_204_31 + var_204_32 + arg_204_0 and arg_201_1.var_.characterEffect1027ui_story then
				local var_204_35 = 0.5

				arg_201_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1027ui_story.fillRatio = var_204_35
			end

			local var_204_36 = 0
			local var_204_37 = 0.8

			if var_204_36 < arg_201_1.time_ and arg_201_1.time_ <= var_204_36 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_38 = arg_201_1:FormatText(StoryNameCfg[6].name)

				arg_201_1.leftNameTxt_.text = var_204_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_39 = arg_201_1:GetWordFromCfg(1102704050)
				local var_204_40 = arg_201_1:FormatText(var_204_39.content)

				arg_201_1.text_.text = var_204_40

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_41 = 32
				local var_204_42 = utf8.len(var_204_40)
				local var_204_43 = var_204_41 <= 0 and var_204_37 or var_204_37 * (var_204_42 / var_204_41)

				if var_204_43 > 0 and var_204_37 < var_204_43 then
					arg_201_1.talkMaxDuration = var_204_43

					if var_204_43 + var_204_36 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_43 + var_204_36
					end
				end

				arg_201_1.text_.text = var_204_40
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704050", "story_v_side_new_1102704.awb") ~= 0 then
					local var_204_44 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704050", "story_v_side_new_1102704.awb") / 1000

					if var_204_44 + var_204_36 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_44 + var_204_36
					end

					if var_204_39.prefab_name ~= "" and arg_201_1.actors_[var_204_39.prefab_name] ~= nil then
						local var_204_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_39.prefab_name].transform, "story_v_side_new_1102704", "1102704050", "story_v_side_new_1102704.awb")

						arg_201_1:RecordAudio("1102704050", var_204_45)
						arg_201_1:RecordAudio("1102704050", var_204_45)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704050", "story_v_side_new_1102704.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704050", "story_v_side_new_1102704.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_46 = math.max(var_204_37, arg_201_1.talkMaxDuration)

			if var_204_36 <= arg_201_1.time_ and arg_201_1.time_ < var_204_36 + var_204_46 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_36) / var_204_46

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_36 + var_204_46 and arg_201_1.time_ < var_204_36 + var_204_46 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 1102704051
		arg_205_1.duration_ = 8.233

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play1102704052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_208_2 = 0
			local var_208_3 = 0.975

			if var_208_2 < arg_205_1.time_ and arg_205_1.time_ <= var_208_2 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_4 = arg_205_1:FormatText(StoryNameCfg[6].name)

				arg_205_1.leftNameTxt_.text = var_208_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_5 = arg_205_1:GetWordFromCfg(1102704051)
				local var_208_6 = arg_205_1:FormatText(var_208_5.content)

				arg_205_1.text_.text = var_208_6

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_7 = 39
				local var_208_8 = utf8.len(var_208_6)
				local var_208_9 = var_208_7 <= 0 and var_208_3 or var_208_3 * (var_208_8 / var_208_7)

				if var_208_9 > 0 and var_208_3 < var_208_9 then
					arg_205_1.talkMaxDuration = var_208_9

					if var_208_9 + var_208_2 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_9 + var_208_2
					end
				end

				arg_205_1.text_.text = var_208_6
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704051", "story_v_side_new_1102704.awb") ~= 0 then
					local var_208_10 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704051", "story_v_side_new_1102704.awb") / 1000

					if var_208_10 + var_208_2 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_10 + var_208_2
					end

					if var_208_5.prefab_name ~= "" and arg_205_1.actors_[var_208_5.prefab_name] ~= nil then
						local var_208_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_5.prefab_name].transform, "story_v_side_new_1102704", "1102704051", "story_v_side_new_1102704.awb")

						arg_205_1:RecordAudio("1102704051", var_208_11)
						arg_205_1:RecordAudio("1102704051", var_208_11)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704051", "story_v_side_new_1102704.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704051", "story_v_side_new_1102704.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_12 = math.max(var_208_3, arg_205_1.talkMaxDuration)

			if var_208_2 <= arg_205_1.time_ and arg_205_1.time_ < var_208_2 + var_208_12 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_2) / var_208_12

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_2 + var_208_12 and arg_205_1.time_ < var_208_2 + var_208_12 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 1102704052
		arg_209_1.duration_ = 1.999999999999

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play1102704053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1027ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect1027ui_story == nil then
				arg_209_1.var_.characterEffect1027ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.200000002980232

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1027ui_story then
					arg_209_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1027ui_story then
				arg_209_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_212_4 = 0

			if var_212_4 < arg_209_1.time_ and arg_209_1.time_ <= var_212_4 + arg_212_0 then
				arg_209_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027actionlink/1027action462")
			end

			local var_212_5 = 0

			if var_212_5 < arg_209_1.time_ and arg_209_1.time_ <= var_212_5 + arg_212_0 then
				arg_209_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_212_6 = arg_209_1.actors_["1084ui_story"]
			local var_212_7 = 0

			if var_212_7 < arg_209_1.time_ and arg_209_1.time_ <= var_212_7 + arg_212_0 and arg_209_1.var_.characterEffect1084ui_story == nil then
				arg_209_1.var_.characterEffect1084ui_story = var_212_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_8 = 0.200000002980232

			if var_212_7 <= arg_209_1.time_ and arg_209_1.time_ < var_212_7 + var_212_8 then
				local var_212_9 = (arg_209_1.time_ - var_212_7) / var_212_8

				if arg_209_1.var_.characterEffect1084ui_story then
					local var_212_10 = Mathf.Lerp(0, 0.5, var_212_9)

					arg_209_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1084ui_story.fillRatio = var_212_10
				end
			end

			if arg_209_1.time_ >= var_212_7 + var_212_8 and arg_209_1.time_ < var_212_7 + var_212_8 + arg_212_0 and arg_209_1.var_.characterEffect1084ui_story then
				local var_212_11 = 0.5

				arg_209_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1084ui_story.fillRatio = var_212_11
			end

			local var_212_12 = 0
			local var_212_13 = 0.075

			if var_212_12 < arg_209_1.time_ and arg_209_1.time_ <= var_212_12 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_14 = arg_209_1:FormatText(StoryNameCfg[56].name)

				arg_209_1.leftNameTxt_.text = var_212_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_15 = arg_209_1:GetWordFromCfg(1102704052)
				local var_212_16 = arg_209_1:FormatText(var_212_15.content)

				arg_209_1.text_.text = var_212_16

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_17 = 3
				local var_212_18 = utf8.len(var_212_16)
				local var_212_19 = var_212_17 <= 0 and var_212_13 or var_212_13 * (var_212_18 / var_212_17)

				if var_212_19 > 0 and var_212_13 < var_212_19 then
					arg_209_1.talkMaxDuration = var_212_19

					if var_212_19 + var_212_12 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_19 + var_212_12
					end
				end

				arg_209_1.text_.text = var_212_16
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704052", "story_v_side_new_1102704.awb") ~= 0 then
					local var_212_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704052", "story_v_side_new_1102704.awb") / 1000

					if var_212_20 + var_212_12 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_20 + var_212_12
					end

					if var_212_15.prefab_name ~= "" and arg_209_1.actors_[var_212_15.prefab_name] ~= nil then
						local var_212_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_15.prefab_name].transform, "story_v_side_new_1102704", "1102704052", "story_v_side_new_1102704.awb")

						arg_209_1:RecordAudio("1102704052", var_212_21)
						arg_209_1:RecordAudio("1102704052", var_212_21)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704052", "story_v_side_new_1102704.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704052", "story_v_side_new_1102704.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_22 = math.max(var_212_13, arg_209_1.talkMaxDuration)

			if var_212_12 <= arg_209_1.time_ and arg_209_1.time_ < var_212_12 + var_212_22 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_12) / var_212_22

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_12 + var_212_22 and arg_209_1.time_ < var_212_12 + var_212_22 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 1102704053
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play1102704054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1027ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1027ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, 100, 0)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1027ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, 100, 0)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["1027ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect1027ui_story == nil then
				arg_213_1.var_.characterEffect1027ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect1027ui_story then
					local var_216_13 = Mathf.Lerp(0, 0.5, var_216_12)

					arg_213_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1027ui_story.fillRatio = var_216_13
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect1027ui_story then
				local var_216_14 = 0.5

				arg_213_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1027ui_story.fillRatio = var_216_14
			end

			local var_216_15 = arg_213_1.actors_["1084ui_story"].transform
			local var_216_16 = 0

			if var_216_16 < arg_213_1.time_ and arg_213_1.time_ <= var_216_16 + arg_216_0 then
				arg_213_1.var_.moveOldPos1084ui_story = var_216_15.localPosition
			end

			local var_216_17 = 0.001

			if var_216_16 <= arg_213_1.time_ and arg_213_1.time_ < var_216_16 + var_216_17 then
				local var_216_18 = (arg_213_1.time_ - var_216_16) / var_216_17
				local var_216_19 = Vector3.New(0, 100, 0)

				var_216_15.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1084ui_story, var_216_19, var_216_18)

				local var_216_20 = manager.ui.mainCamera.transform.position - var_216_15.position

				var_216_15.forward = Vector3.New(var_216_20.x, var_216_20.y, var_216_20.z)

				local var_216_21 = var_216_15.localEulerAngles

				var_216_21.z = 0
				var_216_21.x = 0
				var_216_15.localEulerAngles = var_216_21
			end

			if arg_213_1.time_ >= var_216_16 + var_216_17 and arg_213_1.time_ < var_216_16 + var_216_17 + arg_216_0 then
				var_216_15.localPosition = Vector3.New(0, 100, 0)

				local var_216_22 = manager.ui.mainCamera.transform.position - var_216_15.position

				var_216_15.forward = Vector3.New(var_216_22.x, var_216_22.y, var_216_22.z)

				local var_216_23 = var_216_15.localEulerAngles

				var_216_23.z = 0
				var_216_23.x = 0
				var_216_15.localEulerAngles = var_216_23
			end

			local var_216_24 = arg_213_1.actors_["1084ui_story"]
			local var_216_25 = 0

			if var_216_25 < arg_213_1.time_ and arg_213_1.time_ <= var_216_25 + arg_216_0 and arg_213_1.var_.characterEffect1084ui_story == nil then
				arg_213_1.var_.characterEffect1084ui_story = var_216_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_26 = 0.200000002980232

			if var_216_25 <= arg_213_1.time_ and arg_213_1.time_ < var_216_25 + var_216_26 then
				local var_216_27 = (arg_213_1.time_ - var_216_25) / var_216_26

				if arg_213_1.var_.characterEffect1084ui_story then
					local var_216_28 = Mathf.Lerp(0, 0.5, var_216_27)

					arg_213_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1084ui_story.fillRatio = var_216_28
				end
			end

			if arg_213_1.time_ >= var_216_25 + var_216_26 and arg_213_1.time_ < var_216_25 + var_216_26 + arg_216_0 and arg_213_1.var_.characterEffect1084ui_story then
				local var_216_29 = 0.5

				arg_213_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1084ui_story.fillRatio = var_216_29
			end

			local var_216_30 = 0
			local var_216_31 = 1.1

			if var_216_30 < arg_213_1.time_ and arg_213_1.time_ <= var_216_30 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_32 = arg_213_1:GetWordFromCfg(1102704053)
				local var_216_33 = arg_213_1:FormatText(var_216_32.content)

				arg_213_1.text_.text = var_216_33

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_34 = 44
				local var_216_35 = utf8.len(var_216_33)
				local var_216_36 = var_216_34 <= 0 and var_216_31 or var_216_31 * (var_216_35 / var_216_34)

				if var_216_36 > 0 and var_216_31 < var_216_36 then
					arg_213_1.talkMaxDuration = var_216_36

					if var_216_36 + var_216_30 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_36 + var_216_30
					end
				end

				arg_213_1.text_.text = var_216_33
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_37 = math.max(var_216_31, arg_213_1.talkMaxDuration)

			if var_216_30 <= arg_213_1.time_ and arg_213_1.time_ < var_216_30 + var_216_37 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_30) / var_216_37

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_30 + var_216_37 and arg_213_1.time_ < var_216_30 + var_216_37 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 1102704054
		arg_217_1.duration_ = 4

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play1102704055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1039ui_story"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos1039ui_story = var_220_0.localPosition
			end

			local var_220_2 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2
				local var_220_4 = Vector3.New(-0.7, -1.01, -5.9)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1039ui_story, var_220_4, var_220_3)

				local var_220_5 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_5.x, var_220_5.y, var_220_5.z)

				local var_220_6 = var_220_0.localEulerAngles

				var_220_6.z = 0
				var_220_6.x = 0
				var_220_0.localEulerAngles = var_220_6
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_220_7 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_7.x, var_220_7.y, var_220_7.z)

				local var_220_8 = var_220_0.localEulerAngles

				var_220_8.z = 0
				var_220_8.x = 0
				var_220_0.localEulerAngles = var_220_8
			end

			local var_220_9 = arg_217_1.actors_["1039ui_story"]
			local var_220_10 = 0

			if var_220_10 < arg_217_1.time_ and arg_217_1.time_ <= var_220_10 + arg_220_0 and arg_217_1.var_.characterEffect1039ui_story == nil then
				arg_217_1.var_.characterEffect1039ui_story = var_220_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_11 = 0.200000002980232

			if var_220_10 <= arg_217_1.time_ and arg_217_1.time_ < var_220_10 + var_220_11 then
				local var_220_12 = (arg_217_1.time_ - var_220_10) / var_220_11

				if arg_217_1.var_.characterEffect1039ui_story then
					arg_217_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_10 + var_220_11 and arg_217_1.time_ < var_220_10 + var_220_11 + arg_220_0 and arg_217_1.var_.characterEffect1039ui_story then
				arg_217_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_220_13 = 0

			if var_220_13 < arg_217_1.time_ and arg_217_1.time_ <= var_220_13 + arg_220_0 then
				arg_217_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_220_14 = 0

			if var_220_14 < arg_217_1.time_ and arg_217_1.time_ <= var_220_14 + arg_220_0 then
				arg_217_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_220_15 = 0
			local var_220_16 = 0.325

			if var_220_15 < arg_217_1.time_ and arg_217_1.time_ <= var_220_15 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_17 = arg_217_1:FormatText(StoryNameCfg[9].name)

				arg_217_1.leftNameTxt_.text = var_220_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_18 = arg_217_1:GetWordFromCfg(1102704054)
				local var_220_19 = arg_217_1:FormatText(var_220_18.content)

				arg_217_1.text_.text = var_220_19

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_20 = 13
				local var_220_21 = utf8.len(var_220_19)
				local var_220_22 = var_220_20 <= 0 and var_220_16 or var_220_16 * (var_220_21 / var_220_20)

				if var_220_22 > 0 and var_220_16 < var_220_22 then
					arg_217_1.talkMaxDuration = var_220_22

					if var_220_22 + var_220_15 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_22 + var_220_15
					end
				end

				arg_217_1.text_.text = var_220_19
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704054", "story_v_side_new_1102704.awb") ~= 0 then
					local var_220_23 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704054", "story_v_side_new_1102704.awb") / 1000

					if var_220_23 + var_220_15 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_23 + var_220_15
					end

					if var_220_18.prefab_name ~= "" and arg_217_1.actors_[var_220_18.prefab_name] ~= nil then
						local var_220_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_18.prefab_name].transform, "story_v_side_new_1102704", "1102704054", "story_v_side_new_1102704.awb")

						arg_217_1:RecordAudio("1102704054", var_220_24)
						arg_217_1:RecordAudio("1102704054", var_220_24)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704054", "story_v_side_new_1102704.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704054", "story_v_side_new_1102704.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_25 = math.max(var_220_16, arg_217_1.talkMaxDuration)

			if var_220_15 <= arg_217_1.time_ and arg_217_1.time_ < var_220_15 + var_220_25 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_15) / var_220_25

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_15 + var_220_25 and arg_217_1.time_ < var_220_15 + var_220_25 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 1102704055
		arg_221_1.duration_ = 11.7

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play1102704056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1027ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos1027ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(0.7, -0.81, -5.8)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1027ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = arg_221_1.actors_["1027ui_story"]
			local var_224_10 = 0

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 and arg_221_1.var_.characterEffect1027ui_story == nil then
				arg_221_1.var_.characterEffect1027ui_story = var_224_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_11 = 0.200000002980232

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_10) / var_224_11

				if arg_221_1.var_.characterEffect1027ui_story then
					arg_221_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_10 + var_224_11 and arg_221_1.time_ < var_224_10 + var_224_11 + arg_224_0 and arg_221_1.var_.characterEffect1027ui_story then
				arg_221_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_224_13 = 0

			if var_224_13 < arg_221_1.time_ and arg_221_1.time_ <= var_224_13 + arg_224_0 then
				arg_221_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action4_1")
			end

			local var_224_14 = 0

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 then
				arg_221_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_224_15 = arg_221_1.actors_["1039ui_story"]
			local var_224_16 = 0

			if var_224_16 < arg_221_1.time_ and arg_221_1.time_ <= var_224_16 + arg_224_0 and arg_221_1.var_.characterEffect1039ui_story == nil then
				arg_221_1.var_.characterEffect1039ui_story = var_224_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_17 = 0.200000002980232

			if var_224_16 <= arg_221_1.time_ and arg_221_1.time_ < var_224_16 + var_224_17 then
				local var_224_18 = (arg_221_1.time_ - var_224_16) / var_224_17

				if arg_221_1.var_.characterEffect1039ui_story then
					local var_224_19 = Mathf.Lerp(0, 0.5, var_224_18)

					arg_221_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1039ui_story.fillRatio = var_224_19
				end
			end

			if arg_221_1.time_ >= var_224_16 + var_224_17 and arg_221_1.time_ < var_224_16 + var_224_17 + arg_224_0 and arg_221_1.var_.characterEffect1039ui_story then
				local var_224_20 = 0.5

				arg_221_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1039ui_story.fillRatio = var_224_20
			end

			local var_224_21 = 0
			local var_224_22 = 1.2

			if var_224_21 < arg_221_1.time_ and arg_221_1.time_ <= var_224_21 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_23 = arg_221_1:FormatText(StoryNameCfg[56].name)

				arg_221_1.leftNameTxt_.text = var_224_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_24 = arg_221_1:GetWordFromCfg(1102704055)
				local var_224_25 = arg_221_1:FormatText(var_224_24.content)

				arg_221_1.text_.text = var_224_25

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_26 = 48
				local var_224_27 = utf8.len(var_224_25)
				local var_224_28 = var_224_26 <= 0 and var_224_22 or var_224_22 * (var_224_27 / var_224_26)

				if var_224_28 > 0 and var_224_22 < var_224_28 then
					arg_221_1.talkMaxDuration = var_224_28

					if var_224_28 + var_224_21 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_28 + var_224_21
					end
				end

				arg_221_1.text_.text = var_224_25
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704055", "story_v_side_new_1102704.awb") ~= 0 then
					local var_224_29 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704055", "story_v_side_new_1102704.awb") / 1000

					if var_224_29 + var_224_21 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_29 + var_224_21
					end

					if var_224_24.prefab_name ~= "" and arg_221_1.actors_[var_224_24.prefab_name] ~= nil then
						local var_224_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_24.prefab_name].transform, "story_v_side_new_1102704", "1102704055", "story_v_side_new_1102704.awb")

						arg_221_1:RecordAudio("1102704055", var_224_30)
						arg_221_1:RecordAudio("1102704055", var_224_30)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704055", "story_v_side_new_1102704.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704055", "story_v_side_new_1102704.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_31 = math.max(var_224_22, arg_221_1.talkMaxDuration)

			if var_224_21 <= arg_221_1.time_ and arg_221_1.time_ < var_224_21 + var_224_31 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_21) / var_224_31

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_21 + var_224_31 and arg_221_1.time_ < var_224_21 + var_224_31 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 1102704056
		arg_225_1.duration_ = 5.133

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play1102704057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_228_1 = 0
			local var_228_2 = 0.275

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_3 = arg_225_1:FormatText(StoryNameCfg[56].name)

				arg_225_1.leftNameTxt_.text = var_228_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_4 = arg_225_1:GetWordFromCfg(1102704056)
				local var_228_5 = arg_225_1:FormatText(var_228_4.content)

				arg_225_1.text_.text = var_228_5

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_6 = 11
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704056", "story_v_side_new_1102704.awb") ~= 0 then
					local var_228_9 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704056", "story_v_side_new_1102704.awb") / 1000

					if var_228_9 + var_228_1 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_9 + var_228_1
					end

					if var_228_4.prefab_name ~= "" and arg_225_1.actors_[var_228_4.prefab_name] ~= nil then
						local var_228_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_4.prefab_name].transform, "story_v_side_new_1102704", "1102704056", "story_v_side_new_1102704.awb")

						arg_225_1:RecordAudio("1102704056", var_228_10)
						arg_225_1:RecordAudio("1102704056", var_228_10)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704056", "story_v_side_new_1102704.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704056", "story_v_side_new_1102704.awb")
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
	Play1102704057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 1102704057
		arg_229_1.duration_ = 2.133

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play1102704058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1039ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos1039ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0, 100, 0)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1039ui_story, var_232_4, var_232_3)

				local var_232_5 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_5.x, var_232_5.y, var_232_5.z)

				local var_232_6 = var_232_0.localEulerAngles

				var_232_6.z = 0
				var_232_6.x = 0
				var_232_0.localEulerAngles = var_232_6
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(0, 100, 0)

				local var_232_7 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_7.x, var_232_7.y, var_232_7.z)

				local var_232_8 = var_232_0.localEulerAngles

				var_232_8.z = 0
				var_232_8.x = 0
				var_232_0.localEulerAngles = var_232_8
			end

			local var_232_9 = arg_229_1.actors_["1039ui_story"]
			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 and arg_229_1.var_.characterEffect1039ui_story == nil then
				arg_229_1.var_.characterEffect1039ui_story = var_232_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_11 = 0.200000002980232

			if var_232_10 <= arg_229_1.time_ and arg_229_1.time_ < var_232_10 + var_232_11 then
				local var_232_12 = (arg_229_1.time_ - var_232_10) / var_232_11

				if arg_229_1.var_.characterEffect1039ui_story then
					local var_232_13 = Mathf.Lerp(0, 0.5, var_232_12)

					arg_229_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1039ui_story.fillRatio = var_232_13
				end
			end

			if arg_229_1.time_ >= var_232_10 + var_232_11 and arg_229_1.time_ < var_232_10 + var_232_11 + arg_232_0 and arg_229_1.var_.characterEffect1039ui_story then
				local var_232_14 = 0.5

				arg_229_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1039ui_story.fillRatio = var_232_14
			end

			local var_232_15 = arg_229_1.actors_["1080ui_story"].transform
			local var_232_16 = 0

			if var_232_16 < arg_229_1.time_ and arg_229_1.time_ <= var_232_16 + arg_232_0 then
				arg_229_1.var_.moveOldPos1080ui_story = var_232_15.localPosition
			end

			local var_232_17 = 0.001

			if var_232_16 <= arg_229_1.time_ and arg_229_1.time_ < var_232_16 + var_232_17 then
				local var_232_18 = (arg_229_1.time_ - var_232_16) / var_232_17
				local var_232_19 = Vector3.New(-0.7, -1.01, -6.05)

				var_232_15.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1080ui_story, var_232_19, var_232_18)

				local var_232_20 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_20.x, var_232_20.y, var_232_20.z)

				local var_232_21 = var_232_15.localEulerAngles

				var_232_21.z = 0
				var_232_21.x = 0
				var_232_15.localEulerAngles = var_232_21
			end

			if arg_229_1.time_ >= var_232_16 + var_232_17 and arg_229_1.time_ < var_232_16 + var_232_17 + arg_232_0 then
				var_232_15.localPosition = Vector3.New(-0.7, -1.01, -6.05)

				local var_232_22 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_22.x, var_232_22.y, var_232_22.z)

				local var_232_23 = var_232_15.localEulerAngles

				var_232_23.z = 0
				var_232_23.x = 0
				var_232_15.localEulerAngles = var_232_23
			end

			local var_232_24 = arg_229_1.actors_["1080ui_story"]
			local var_232_25 = 0

			if var_232_25 < arg_229_1.time_ and arg_229_1.time_ <= var_232_25 + arg_232_0 and arg_229_1.var_.characterEffect1080ui_story == nil then
				arg_229_1.var_.characterEffect1080ui_story = var_232_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_26 = 0.200000002980232

			if var_232_25 <= arg_229_1.time_ and arg_229_1.time_ < var_232_25 + var_232_26 then
				local var_232_27 = (arg_229_1.time_ - var_232_25) / var_232_26

				if arg_229_1.var_.characterEffect1080ui_story then
					arg_229_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_25 + var_232_26 and arg_229_1.time_ < var_232_25 + var_232_26 + arg_232_0 and arg_229_1.var_.characterEffect1080ui_story then
				arg_229_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_232_28 = 0

			if var_232_28 < arg_229_1.time_ and arg_229_1.time_ <= var_232_28 + arg_232_0 then
				arg_229_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action1_1")
			end

			local var_232_29 = 0

			if var_232_29 < arg_229_1.time_ and arg_229_1.time_ <= var_232_29 + arg_232_0 then
				arg_229_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_232_30 = arg_229_1.actors_["1027ui_story"]
			local var_232_31 = 0

			if var_232_31 < arg_229_1.time_ and arg_229_1.time_ <= var_232_31 + arg_232_0 and arg_229_1.var_.characterEffect1027ui_story == nil then
				arg_229_1.var_.characterEffect1027ui_story = var_232_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_32 = 0.200000002980232

			if var_232_31 <= arg_229_1.time_ and arg_229_1.time_ < var_232_31 + var_232_32 then
				local var_232_33 = (arg_229_1.time_ - var_232_31) / var_232_32

				if arg_229_1.var_.characterEffect1027ui_story then
					local var_232_34 = Mathf.Lerp(0, 0.5, var_232_33)

					arg_229_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1027ui_story.fillRatio = var_232_34
				end
			end

			if arg_229_1.time_ >= var_232_31 + var_232_32 and arg_229_1.time_ < var_232_31 + var_232_32 + arg_232_0 and arg_229_1.var_.characterEffect1027ui_story then
				local var_232_35 = 0.5

				arg_229_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1027ui_story.fillRatio = var_232_35
			end

			local var_232_36 = 0
			local var_232_37 = 0.225

			if var_232_36 < arg_229_1.time_ and arg_229_1.time_ <= var_232_36 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_38 = arg_229_1:FormatText(StoryNameCfg[55].name)

				arg_229_1.leftNameTxt_.text = var_232_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_39 = arg_229_1:GetWordFromCfg(1102704057)
				local var_232_40 = arg_229_1:FormatText(var_232_39.content)

				arg_229_1.text_.text = var_232_40

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_41 = 9
				local var_232_42 = utf8.len(var_232_40)
				local var_232_43 = var_232_41 <= 0 and var_232_37 or var_232_37 * (var_232_42 / var_232_41)

				if var_232_43 > 0 and var_232_37 < var_232_43 then
					arg_229_1.talkMaxDuration = var_232_43

					if var_232_43 + var_232_36 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_43 + var_232_36
					end
				end

				arg_229_1.text_.text = var_232_40
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704057", "story_v_side_new_1102704.awb") ~= 0 then
					local var_232_44 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704057", "story_v_side_new_1102704.awb") / 1000

					if var_232_44 + var_232_36 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_44 + var_232_36
					end

					if var_232_39.prefab_name ~= "" and arg_229_1.actors_[var_232_39.prefab_name] ~= nil then
						local var_232_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_39.prefab_name].transform, "story_v_side_new_1102704", "1102704057", "story_v_side_new_1102704.awb")

						arg_229_1:RecordAudio("1102704057", var_232_45)
						arg_229_1:RecordAudio("1102704057", var_232_45)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704057", "story_v_side_new_1102704.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704057", "story_v_side_new_1102704.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_46 = math.max(var_232_37, arg_229_1.talkMaxDuration)

			if var_232_36 <= arg_229_1.time_ and arg_229_1.time_ < var_232_36 + var_232_46 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_36) / var_232_46

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_36 + var_232_46 and arg_229_1.time_ < var_232_36 + var_232_46 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 1102704058
		arg_233_1.duration_ = 12.666

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play1102704059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1027ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.characterEffect1027ui_story == nil then
				arg_233_1.var_.characterEffect1027ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.200000002980232

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect1027ui_story then
					arg_233_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1027ui_story then
				arg_233_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_236_4 = 0

			if var_236_4 < arg_233_1.time_ and arg_233_1.time_ <= var_236_4 + arg_236_0 then
				arg_233_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action4_2")
			end

			local var_236_5 = 0

			if var_236_5 < arg_233_1.time_ and arg_233_1.time_ <= var_236_5 + arg_236_0 then
				arg_233_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_236_6 = arg_233_1.actors_["1080ui_story"]
			local var_236_7 = 0

			if var_236_7 < arg_233_1.time_ and arg_233_1.time_ <= var_236_7 + arg_236_0 and arg_233_1.var_.characterEffect1080ui_story == nil then
				arg_233_1.var_.characterEffect1080ui_story = var_236_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_8 = 0.200000002980232

			if var_236_7 <= arg_233_1.time_ and arg_233_1.time_ < var_236_7 + var_236_8 then
				local var_236_9 = (arg_233_1.time_ - var_236_7) / var_236_8

				if arg_233_1.var_.characterEffect1080ui_story then
					local var_236_10 = Mathf.Lerp(0, 0.5, var_236_9)

					arg_233_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1080ui_story.fillRatio = var_236_10
				end
			end

			if arg_233_1.time_ >= var_236_7 + var_236_8 and arg_233_1.time_ < var_236_7 + var_236_8 + arg_236_0 and arg_233_1.var_.characterEffect1080ui_story then
				local var_236_11 = 0.5

				arg_233_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1080ui_story.fillRatio = var_236_11
			end

			local var_236_12 = 0
			local var_236_13 = 1.075

			if var_236_12 < arg_233_1.time_ and arg_233_1.time_ <= var_236_12 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_14 = arg_233_1:FormatText(StoryNameCfg[56].name)

				arg_233_1.leftNameTxt_.text = var_236_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_15 = arg_233_1:GetWordFromCfg(1102704058)
				local var_236_16 = arg_233_1:FormatText(var_236_15.content)

				arg_233_1.text_.text = var_236_16

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_17 = 44
				local var_236_18 = utf8.len(var_236_16)
				local var_236_19 = var_236_17 <= 0 and var_236_13 or var_236_13 * (var_236_18 / var_236_17)

				if var_236_19 > 0 and var_236_13 < var_236_19 then
					arg_233_1.talkMaxDuration = var_236_19

					if var_236_19 + var_236_12 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_19 + var_236_12
					end
				end

				arg_233_1.text_.text = var_236_16
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704058", "story_v_side_new_1102704.awb") ~= 0 then
					local var_236_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704058", "story_v_side_new_1102704.awb") / 1000

					if var_236_20 + var_236_12 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_20 + var_236_12
					end

					if var_236_15.prefab_name ~= "" and arg_233_1.actors_[var_236_15.prefab_name] ~= nil then
						local var_236_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_15.prefab_name].transform, "story_v_side_new_1102704", "1102704058", "story_v_side_new_1102704.awb")

						arg_233_1:RecordAudio("1102704058", var_236_21)
						arg_233_1:RecordAudio("1102704058", var_236_21)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704058", "story_v_side_new_1102704.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704058", "story_v_side_new_1102704.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_22 = math.max(var_236_13, arg_233_1.talkMaxDuration)

			if var_236_12 <= arg_233_1.time_ and arg_233_1.time_ < var_236_12 + var_236_22 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_12) / var_236_22

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_12 + var_236_22 and arg_233_1.time_ < var_236_12 + var_236_22 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 1102704059
		arg_237_1.duration_ = 9.033

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play1102704060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1027ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1027ui_story == nil then
				arg_237_1.var_.characterEffect1027ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1027ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1027ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1027ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1027ui_story.fillRatio = var_240_5
			end

			local var_240_6 = 0
			local var_240_7 = 0.925

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_8 = arg_237_1:FormatText(StoryNameCfg[203].name)

				arg_237_1.leftNameTxt_.text = var_240_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, true)
				arg_237_1.iconController_:SetSelectedState("hero")

				arg_237_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10013")

				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_9 = arg_237_1:GetWordFromCfg(1102704059)
				local var_240_10 = arg_237_1:FormatText(var_240_9.content)

				arg_237_1.text_.text = var_240_10

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_11 = 37
				local var_240_12 = utf8.len(var_240_10)
				local var_240_13 = var_240_11 <= 0 and var_240_7 or var_240_7 * (var_240_12 / var_240_11)

				if var_240_13 > 0 and var_240_7 < var_240_13 then
					arg_237_1.talkMaxDuration = var_240_13

					if var_240_13 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_13 + var_240_6
					end
				end

				arg_237_1.text_.text = var_240_10
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704059", "story_v_side_new_1102704.awb") ~= 0 then
					local var_240_14 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704059", "story_v_side_new_1102704.awb") / 1000

					if var_240_14 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_14 + var_240_6
					end

					if var_240_9.prefab_name ~= "" and arg_237_1.actors_[var_240_9.prefab_name] ~= nil then
						local var_240_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_9.prefab_name].transform, "story_v_side_new_1102704", "1102704059", "story_v_side_new_1102704.awb")

						arg_237_1:RecordAudio("1102704059", var_240_15)
						arg_237_1:RecordAudio("1102704059", var_240_15)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704059", "story_v_side_new_1102704.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704059", "story_v_side_new_1102704.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_16 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_16 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_16

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_16 and arg_237_1.time_ < var_240_6 + var_240_16 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 1102704060
		arg_241_1.duration_ = 4.566

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play1102704061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1027ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect1027ui_story == nil then
				arg_241_1.var_.characterEffect1027ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.200000002980232

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect1027ui_story then
					arg_241_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1027ui_story then
				arg_241_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_244_4 = 0

			if var_244_4 < arg_241_1.time_ and arg_241_1.time_ <= var_244_4 + arg_244_0 then
				arg_241_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action1_1")
			end

			local var_244_5 = 0

			if var_244_5 < arg_241_1.time_ and arg_241_1.time_ <= var_244_5 + arg_244_0 then
				arg_241_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_244_6 = 0
			local var_244_7 = 0.475

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_8 = arg_241_1:FormatText(StoryNameCfg[56].name)

				arg_241_1.leftNameTxt_.text = var_244_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_9 = arg_241_1:GetWordFromCfg(1102704060)
				local var_244_10 = arg_241_1:FormatText(var_244_9.content)

				arg_241_1.text_.text = var_244_10

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_11 = 19
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704060", "story_v_side_new_1102704.awb") ~= 0 then
					local var_244_14 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704060", "story_v_side_new_1102704.awb") / 1000

					if var_244_14 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_14 + var_244_6
					end

					if var_244_9.prefab_name ~= "" and arg_241_1.actors_[var_244_9.prefab_name] ~= nil then
						local var_244_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_9.prefab_name].transform, "story_v_side_new_1102704", "1102704060", "story_v_side_new_1102704.awb")

						arg_241_1:RecordAudio("1102704060", var_244_15)
						arg_241_1:RecordAudio("1102704060", var_244_15)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704060", "story_v_side_new_1102704.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704060", "story_v_side_new_1102704.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_16 = math.max(var_244_7, arg_241_1.talkMaxDuration)

			if var_244_6 <= arg_241_1.time_ and arg_241_1.time_ < var_244_6 + var_244_16 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_6) / var_244_16

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_6 + var_244_16 and arg_241_1.time_ < var_244_6 + var_244_16 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 1102704061
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play1102704062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1027ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1027ui_story == nil then
				arg_245_1.var_.characterEffect1027ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1027ui_story then
					local var_248_4 = Mathf.Lerp(0, 0.5, var_248_3)

					arg_245_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1027ui_story.fillRatio = var_248_4
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1027ui_story then
				local var_248_5 = 0.5

				arg_245_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1027ui_story.fillRatio = var_248_5
			end

			local var_248_6 = 0
			local var_248_7 = 0.475

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_8 = arg_245_1:FormatText(StoryNameCfg[7].name)

				arg_245_1.leftNameTxt_.text = var_248_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_9 = arg_245_1:GetWordFromCfg(1102704061)
				local var_248_10 = arg_245_1:FormatText(var_248_9.content)

				arg_245_1.text_.text = var_248_10

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_11 = 19
				local var_248_12 = utf8.len(var_248_10)
				local var_248_13 = var_248_11 <= 0 and var_248_7 or var_248_7 * (var_248_12 / var_248_11)

				if var_248_13 > 0 and var_248_7 < var_248_13 then
					arg_245_1.talkMaxDuration = var_248_13

					if var_248_13 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_13 + var_248_6
					end
				end

				arg_245_1.text_.text = var_248_10
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_14 = math.max(var_248_7, arg_245_1.talkMaxDuration)

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_14 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_6) / var_248_14

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_6 + var_248_14 and arg_245_1.time_ < var_248_6 + var_248_14 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 1102704062
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play1102704063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.875

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[7].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(1102704062)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 35
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
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_8 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_8 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_8

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_8 and arg_249_1.time_ < var_252_0 + var_252_8 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 1102704063
		arg_253_1.duration_ = 5.533

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play1102704064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1080ui_story"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1080ui_story = var_256_0.localPosition
			end

			local var_256_2 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2
				local var_256_4 = Vector3.New(0, 100, 0)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1080ui_story, var_256_4, var_256_3)

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

			local var_256_9 = arg_253_1.actors_["1080ui_story"]
			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 and arg_253_1.var_.characterEffect1080ui_story == nil then
				arg_253_1.var_.characterEffect1080ui_story = var_256_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_11 = 0.200000002980232

			if var_256_10 <= arg_253_1.time_ and arg_253_1.time_ < var_256_10 + var_256_11 then
				local var_256_12 = (arg_253_1.time_ - var_256_10) / var_256_11

				if arg_253_1.var_.characterEffect1080ui_story then
					local var_256_13 = Mathf.Lerp(0, 0.5, var_256_12)

					arg_253_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1080ui_story.fillRatio = var_256_13
				end
			end

			if arg_253_1.time_ >= var_256_10 + var_256_11 and arg_253_1.time_ < var_256_10 + var_256_11 + arg_256_0 and arg_253_1.var_.characterEffect1080ui_story then
				local var_256_14 = 0.5

				arg_253_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1080ui_story.fillRatio = var_256_14
			end

			local var_256_15 = arg_253_1.actors_["1039ui_story"].transform
			local var_256_16 = 0

			if var_256_16 < arg_253_1.time_ and arg_253_1.time_ <= var_256_16 + arg_256_0 then
				arg_253_1.var_.moveOldPos1039ui_story = var_256_15.localPosition
			end

			local var_256_17 = 0.001

			if var_256_16 <= arg_253_1.time_ and arg_253_1.time_ < var_256_16 + var_256_17 then
				local var_256_18 = (arg_253_1.time_ - var_256_16) / var_256_17
				local var_256_19 = Vector3.New(-0.7, -1.01, -5.9)

				var_256_15.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1039ui_story, var_256_19, var_256_18)

				local var_256_20 = manager.ui.mainCamera.transform.position - var_256_15.position

				var_256_15.forward = Vector3.New(var_256_20.x, var_256_20.y, var_256_20.z)

				local var_256_21 = var_256_15.localEulerAngles

				var_256_21.z = 0
				var_256_21.x = 0
				var_256_15.localEulerAngles = var_256_21
			end

			if arg_253_1.time_ >= var_256_16 + var_256_17 and arg_253_1.time_ < var_256_16 + var_256_17 + arg_256_0 then
				var_256_15.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_256_22 = manager.ui.mainCamera.transform.position - var_256_15.position

				var_256_15.forward = Vector3.New(var_256_22.x, var_256_22.y, var_256_22.z)

				local var_256_23 = var_256_15.localEulerAngles

				var_256_23.z = 0
				var_256_23.x = 0
				var_256_15.localEulerAngles = var_256_23
			end

			local var_256_24 = arg_253_1.actors_["1039ui_story"]
			local var_256_25 = 0

			if var_256_25 < arg_253_1.time_ and arg_253_1.time_ <= var_256_25 + arg_256_0 and arg_253_1.var_.characterEffect1039ui_story == nil then
				arg_253_1.var_.characterEffect1039ui_story = var_256_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_26 = 0.200000002980232

			if var_256_25 <= arg_253_1.time_ and arg_253_1.time_ < var_256_25 + var_256_26 then
				local var_256_27 = (arg_253_1.time_ - var_256_25) / var_256_26

				if arg_253_1.var_.characterEffect1039ui_story then
					arg_253_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_25 + var_256_26 and arg_253_1.time_ < var_256_25 + var_256_26 + arg_256_0 and arg_253_1.var_.characterEffect1039ui_story then
				arg_253_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_256_28 = 0

			if var_256_28 < arg_253_1.time_ and arg_253_1.time_ <= var_256_28 + arg_256_0 then
				arg_253_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action1_1")
			end

			local var_256_29 = 0

			if var_256_29 < arg_253_1.time_ and arg_253_1.time_ <= var_256_29 + arg_256_0 then
				arg_253_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_256_30 = 0
			local var_256_31 = 0.85

			if var_256_30 < arg_253_1.time_ and arg_253_1.time_ <= var_256_30 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_32 = arg_253_1:FormatText(StoryNameCfg[9].name)

				arg_253_1.leftNameTxt_.text = var_256_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_33 = arg_253_1:GetWordFromCfg(1102704063)
				local var_256_34 = arg_253_1:FormatText(var_256_33.content)

				arg_253_1.text_.text = var_256_34

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_35 = 34
				local var_256_36 = utf8.len(var_256_34)
				local var_256_37 = var_256_35 <= 0 and var_256_31 or var_256_31 * (var_256_36 / var_256_35)

				if var_256_37 > 0 and var_256_31 < var_256_37 then
					arg_253_1.talkMaxDuration = var_256_37

					if var_256_37 + var_256_30 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_37 + var_256_30
					end
				end

				arg_253_1.text_.text = var_256_34
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704063", "story_v_side_new_1102704.awb") ~= 0 then
					local var_256_38 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704063", "story_v_side_new_1102704.awb") / 1000

					if var_256_38 + var_256_30 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_38 + var_256_30
					end

					if var_256_33.prefab_name ~= "" and arg_253_1.actors_[var_256_33.prefab_name] ~= nil then
						local var_256_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_33.prefab_name].transform, "story_v_side_new_1102704", "1102704063", "story_v_side_new_1102704.awb")

						arg_253_1:RecordAudio("1102704063", var_256_39)
						arg_253_1:RecordAudio("1102704063", var_256_39)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704063", "story_v_side_new_1102704.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704063", "story_v_side_new_1102704.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_40 = math.max(var_256_31, arg_253_1.talkMaxDuration)

			if var_256_30 <= arg_253_1.time_ and arg_253_1.time_ < var_256_30 + var_256_40 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_30) / var_256_40

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_30 + var_256_40 and arg_253_1.time_ < var_256_30 + var_256_40 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 1102704064
		arg_257_1.duration_ = 2.866

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play1102704065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1027ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect1027ui_story == nil then
				arg_257_1.var_.characterEffect1027ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.200000002980232

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect1027ui_story then
					arg_257_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect1027ui_story then
				arg_257_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_260_4 = 0

			if var_260_4 < arg_257_1.time_ and arg_257_1.time_ <= var_260_4 + arg_260_0 then
				arg_257_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_260_5 = 0

			if var_260_5 < arg_257_1.time_ and arg_257_1.time_ <= var_260_5 + arg_260_0 then
				arg_257_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_260_6 = arg_257_1.actors_["1039ui_story"]
			local var_260_7 = 0

			if var_260_7 < arg_257_1.time_ and arg_257_1.time_ <= var_260_7 + arg_260_0 and arg_257_1.var_.characterEffect1039ui_story == nil then
				arg_257_1.var_.characterEffect1039ui_story = var_260_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_8 = 0.200000002980232

			if var_260_7 <= arg_257_1.time_ and arg_257_1.time_ < var_260_7 + var_260_8 then
				local var_260_9 = (arg_257_1.time_ - var_260_7) / var_260_8

				if arg_257_1.var_.characterEffect1039ui_story then
					local var_260_10 = Mathf.Lerp(0, 0.5, var_260_9)

					arg_257_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_257_1.var_.characterEffect1039ui_story.fillRatio = var_260_10
				end
			end

			if arg_257_1.time_ >= var_260_7 + var_260_8 and arg_257_1.time_ < var_260_7 + var_260_8 + arg_260_0 and arg_257_1.var_.characterEffect1039ui_story then
				local var_260_11 = 0.5

				arg_257_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_257_1.var_.characterEffect1039ui_story.fillRatio = var_260_11
			end

			local var_260_12 = 0
			local var_260_13 = 0.35

			if var_260_12 < arg_257_1.time_ and arg_257_1.time_ <= var_260_12 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_14 = arg_257_1:FormatText(StoryNameCfg[56].name)

				arg_257_1.leftNameTxt_.text = var_260_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_15 = arg_257_1:GetWordFromCfg(1102704064)
				local var_260_16 = arg_257_1:FormatText(var_260_15.content)

				arg_257_1.text_.text = var_260_16

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_17 = 14
				local var_260_18 = utf8.len(var_260_16)
				local var_260_19 = var_260_17 <= 0 and var_260_13 or var_260_13 * (var_260_18 / var_260_17)

				if var_260_19 > 0 and var_260_13 < var_260_19 then
					arg_257_1.talkMaxDuration = var_260_19

					if var_260_19 + var_260_12 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_19 + var_260_12
					end
				end

				arg_257_1.text_.text = var_260_16
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704064", "story_v_side_new_1102704.awb") ~= 0 then
					local var_260_20 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704064", "story_v_side_new_1102704.awb") / 1000

					if var_260_20 + var_260_12 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_20 + var_260_12
					end

					if var_260_15.prefab_name ~= "" and arg_257_1.actors_[var_260_15.prefab_name] ~= nil then
						local var_260_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_15.prefab_name].transform, "story_v_side_new_1102704", "1102704064", "story_v_side_new_1102704.awb")

						arg_257_1:RecordAudio("1102704064", var_260_21)
						arg_257_1:RecordAudio("1102704064", var_260_21)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704064", "story_v_side_new_1102704.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704064", "story_v_side_new_1102704.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_22 = math.max(var_260_13, arg_257_1.talkMaxDuration)

			if var_260_12 <= arg_257_1.time_ and arg_257_1.time_ < var_260_12 + var_260_22 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_12) / var_260_22

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_12 + var_260_22 and arg_257_1.time_ < var_260_12 + var_260_22 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 1102704065
		arg_261_1.duration_ = 5.683333333332

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play1102704066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = "STblack"

			if arg_261_1.bgs_[var_264_0] == nil then
				local var_264_1 = Object.Instantiate(arg_261_1.paintGo_)

				var_264_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_264_0)
				var_264_1.name = var_264_0
				var_264_1.transform.parent = arg_261_1.stage_.transform
				var_264_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_261_1.bgs_[var_264_0] = var_264_1
			end

			local var_264_2 = 1.96599999815226

			if var_264_2 < arg_261_1.time_ and arg_261_1.time_ <= var_264_2 + arg_264_0 then
				local var_264_3 = manager.ui.mainCamera.transform.localPosition
				local var_264_4 = Vector3.New(0, 0, 10) + Vector3.New(var_264_3.x, var_264_3.y, 0)
				local var_264_5 = arg_261_1.bgs_.STblack

				var_264_5.transform.localPosition = var_264_4
				var_264_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_264_6 = var_264_5:GetComponent("SpriteRenderer")

				if var_264_6 and var_264_6.sprite then
					local var_264_7 = (var_264_5.transform.localPosition - var_264_3).z
					local var_264_8 = manager.ui.mainCameraCom_
					local var_264_9 = 2 * var_264_7 * Mathf.Tan(var_264_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_264_10 = var_264_9 * var_264_8.aspect
					local var_264_11 = var_264_6.sprite.bounds.size.x
					local var_264_12 = var_264_6.sprite.bounds.size.y
					local var_264_13 = var_264_10 / var_264_11
					local var_264_14 = var_264_9 / var_264_12
					local var_264_15 = var_264_14 < var_264_13 and var_264_13 or var_264_14

					var_264_5.transform.localScale = Vector3.New(var_264_15, var_264_15, 0)
				end

				for iter_264_0, iter_264_1 in pairs(arg_261_1.bgs_) do
					if iter_264_0 ~= "STblack" then
						iter_264_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_264_16 = arg_261_1.actors_["1027ui_story"].transform
			local var_264_17 = 1.96599999815226

			if var_264_17 < arg_261_1.time_ and arg_261_1.time_ <= var_264_17 + arg_264_0 then
				arg_261_1.var_.moveOldPos1027ui_story = var_264_16.localPosition
			end

			local var_264_18 = 0.001

			if var_264_17 <= arg_261_1.time_ and arg_261_1.time_ < var_264_17 + var_264_18 then
				local var_264_19 = (arg_261_1.time_ - var_264_17) / var_264_18
				local var_264_20 = Vector3.New(0, 100, 0)

				var_264_16.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1027ui_story, var_264_20, var_264_19)

				local var_264_21 = manager.ui.mainCamera.transform.position - var_264_16.position

				var_264_16.forward = Vector3.New(var_264_21.x, var_264_21.y, var_264_21.z)

				local var_264_22 = var_264_16.localEulerAngles

				var_264_22.z = 0
				var_264_22.x = 0
				var_264_16.localEulerAngles = var_264_22
			end

			if arg_261_1.time_ >= var_264_17 + var_264_18 and arg_261_1.time_ < var_264_17 + var_264_18 + arg_264_0 then
				var_264_16.localPosition = Vector3.New(0, 100, 0)

				local var_264_23 = manager.ui.mainCamera.transform.position - var_264_16.position

				var_264_16.forward = Vector3.New(var_264_23.x, var_264_23.y, var_264_23.z)

				local var_264_24 = var_264_16.localEulerAngles

				var_264_24.z = 0
				var_264_24.x = 0
				var_264_16.localEulerAngles = var_264_24
			end

			local var_264_25 = arg_261_1.actors_["1027ui_story"]
			local var_264_26 = 1.96599999815226

			if var_264_26 < arg_261_1.time_ and arg_261_1.time_ <= var_264_26 + arg_264_0 and arg_261_1.var_.characterEffect1027ui_story == nil then
				arg_261_1.var_.characterEffect1027ui_story = var_264_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_27 = 0.034000001847744

			if var_264_26 <= arg_261_1.time_ and arg_261_1.time_ < var_264_26 + var_264_27 then
				local var_264_28 = (arg_261_1.time_ - var_264_26) / var_264_27

				if arg_261_1.var_.characterEffect1027ui_story then
					local var_264_29 = Mathf.Lerp(0, 0.5, var_264_28)

					arg_261_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_261_1.var_.characterEffect1027ui_story.fillRatio = var_264_29
				end
			end

			if arg_261_1.time_ >= var_264_26 + var_264_27 and arg_261_1.time_ < var_264_26 + var_264_27 + arg_264_0 and arg_261_1.var_.characterEffect1027ui_story then
				local var_264_30 = 0.5

				arg_261_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_261_1.var_.characterEffect1027ui_story.fillRatio = var_264_30
			end

			local var_264_31 = arg_261_1.actors_["1039ui_story"].transform
			local var_264_32 = 1.96599999815226

			if var_264_32 < arg_261_1.time_ and arg_261_1.time_ <= var_264_32 + arg_264_0 then
				arg_261_1.var_.moveOldPos1039ui_story = var_264_31.localPosition
			end

			local var_264_33 = 0.001

			if var_264_32 <= arg_261_1.time_ and arg_261_1.time_ < var_264_32 + var_264_33 then
				local var_264_34 = (arg_261_1.time_ - var_264_32) / var_264_33
				local var_264_35 = Vector3.New(0, 100, 0)

				var_264_31.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1039ui_story, var_264_35, var_264_34)

				local var_264_36 = manager.ui.mainCamera.transform.position - var_264_31.position

				var_264_31.forward = Vector3.New(var_264_36.x, var_264_36.y, var_264_36.z)

				local var_264_37 = var_264_31.localEulerAngles

				var_264_37.z = 0
				var_264_37.x = 0
				var_264_31.localEulerAngles = var_264_37
			end

			if arg_261_1.time_ >= var_264_32 + var_264_33 and arg_261_1.time_ < var_264_32 + var_264_33 + arg_264_0 then
				var_264_31.localPosition = Vector3.New(0, 100, 0)

				local var_264_38 = manager.ui.mainCamera.transform.position - var_264_31.position

				var_264_31.forward = Vector3.New(var_264_38.x, var_264_38.y, var_264_38.z)

				local var_264_39 = var_264_31.localEulerAngles

				var_264_39.z = 0
				var_264_39.x = 0
				var_264_31.localEulerAngles = var_264_39
			end

			local var_264_40 = arg_261_1.actors_["1039ui_story"]
			local var_264_41 = 1.96599999815226

			if var_264_41 < arg_261_1.time_ and arg_261_1.time_ <= var_264_41 + arg_264_0 and arg_261_1.var_.characterEffect1039ui_story == nil then
				arg_261_1.var_.characterEffect1039ui_story = var_264_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_42 = 0.034000001847744

			if var_264_41 <= arg_261_1.time_ and arg_261_1.time_ < var_264_41 + var_264_42 then
				local var_264_43 = (arg_261_1.time_ - var_264_41) / var_264_42

				if arg_261_1.var_.characterEffect1039ui_story then
					local var_264_44 = Mathf.Lerp(0, 0.5, var_264_43)

					arg_261_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_261_1.var_.characterEffect1039ui_story.fillRatio = var_264_44
				end
			end

			if arg_261_1.time_ >= var_264_41 + var_264_42 and arg_261_1.time_ < var_264_41 + var_264_42 + arg_264_0 and arg_261_1.var_.characterEffect1039ui_story then
				local var_264_45 = 0.5

				arg_261_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_261_1.var_.characterEffect1039ui_story.fillRatio = var_264_45
			end

			local var_264_46 = 0

			if var_264_46 < arg_261_1.time_ and arg_261_1.time_ <= var_264_46 + arg_264_0 then
				arg_261_1.mask_.enabled = true
				arg_261_1.mask_.raycastTarget = true

				arg_261_1:SetGaussion(false)
			end

			local var_264_47 = 2

			if var_264_46 <= arg_261_1.time_ and arg_261_1.time_ < var_264_46 + var_264_47 then
				local var_264_48 = (arg_261_1.time_ - var_264_46) / var_264_47
				local var_264_49 = Color.New(0, 0, 0)

				var_264_49.a = Mathf.Lerp(0, 1, var_264_48)
				arg_261_1.mask_.color = var_264_49
			end

			if arg_261_1.time_ >= var_264_46 + var_264_47 and arg_261_1.time_ < var_264_46 + var_264_47 + arg_264_0 then
				local var_264_50 = Color.New(0, 0, 0)

				var_264_50.a = 1
				arg_261_1.mask_.color = var_264_50
			end

			local var_264_51 = 2

			if var_264_51 < arg_261_1.time_ and arg_261_1.time_ <= var_264_51 + arg_264_0 then
				arg_261_1.mask_.enabled = true
				arg_261_1.mask_.raycastTarget = true

				arg_261_1:SetGaussion(false)
			end

			local var_264_52 = 2

			if var_264_51 <= arg_261_1.time_ and arg_261_1.time_ < var_264_51 + var_264_52 then
				local var_264_53 = (arg_261_1.time_ - var_264_51) / var_264_52
				local var_264_54 = Color.New(0, 0, 0)

				var_264_54.a = Mathf.Lerp(1, 0, var_264_53)
				arg_261_1.mask_.color = var_264_54
			end

			if arg_261_1.time_ >= var_264_51 + var_264_52 and arg_261_1.time_ < var_264_51 + var_264_52 + arg_264_0 then
				local var_264_55 = Color.New(0, 0, 0)
				local var_264_56 = 0

				arg_261_1.mask_.enabled = false
				var_264_55.a = var_264_56
				arg_261_1.mask_.color = var_264_55
			end

			local var_264_57 = 2.01666666666667

			if var_264_57 < arg_261_1.time_ and arg_261_1.time_ <= var_264_57 + arg_264_0 then
				arg_261_1.var_.oldValueTypewriter = arg_261_1.fswtw_.percent

				arg_261_1:ShowNextGo(false)
			end

			local var_264_58 = 55
			local var_264_59 = 3.66666666666667
			local var_264_60 = arg_261_1:GetWordFromCfg(1102704065)
			local var_264_61 = arg_261_1:FormatText(var_264_60.content)
			local var_264_62, var_264_63 = arg_261_1:GetPercentByPara(var_264_61, 1)

			if var_264_57 < arg_261_1.time_ and arg_261_1.time_ <= var_264_57 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0

				local var_264_64 = var_264_58 <= 0 and var_264_59 or var_264_59 * ((var_264_63 - arg_261_1.typewritterCharCountI18N) / var_264_58)

				if var_264_64 > 0 and var_264_59 < var_264_64 then
					arg_261_1.talkMaxDuration = var_264_64

					if var_264_64 + var_264_57 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_64 + var_264_57
					end
				end
			end

			local var_264_65 = 3.66666666666667
			local var_264_66 = math.max(var_264_65, arg_261_1.talkMaxDuration)

			if var_264_57 <= arg_261_1.time_ and arg_261_1.time_ < var_264_57 + var_264_66 then
				local var_264_67 = (arg_261_1.time_ - var_264_57) / var_264_66

				arg_261_1.fswtw_.percent = Mathf.Lerp(arg_261_1.var_.oldValueTypewriter, var_264_62, var_264_67)
				arg_261_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_261_1.fswtw_:SetDirty()
			end

			if arg_261_1.time_ >= var_264_57 + var_264_66 and arg_261_1.time_ < var_264_57 + var_264_66 + arg_264_0 then
				arg_261_1.fswtw_.percent = var_264_62

				arg_261_1.fswtw_:SetDirty()
				arg_261_1:ShowNextGo(true)

				arg_261_1.typewritterCharCountI18N = var_264_63
			end

			local var_264_68 = 2

			if var_264_68 < arg_261_1.time_ and arg_261_1.time_ <= var_264_68 + arg_264_0 then
				arg_261_1.fswbg_:SetActive(true)
				arg_261_1.dialog_:SetActive(false)

				arg_261_1.fswtw_.percent = 0

				local var_264_69 = arg_261_1:GetWordFromCfg(1102704065)
				local var_264_70 = arg_261_1:FormatText(var_264_69.content)

				arg_261_1.fswt_.text = var_264_70

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.fswt_)

				arg_261_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_261_1.fswtw_:SetDirty()

				arg_261_1.typewritterCharCountI18N = 0

				SetActive(arg_261_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_261_1:ShowNextGo(false)
			end

			local var_264_71 = 2

			if var_264_71 < arg_261_1.time_ and arg_261_1.time_ <= var_264_71 + arg_264_0 then
				local var_264_72 = arg_261_1.fswbg_.transform:Find("textbox/adapt/content") or arg_261_1.fswbg_.transform:Find("textbox/content")
				local var_264_73 = var_264_72:GetComponent("Text")
				local var_264_74 = var_264_72:GetComponent("RectTransform")

				var_264_73.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_264_74.offsetMin = Vector2.New(0, 0)
				var_264_74.offsetMax = Vector2.New(0, 0)
			end

			local var_264_75 = 1.96599999815226
			local var_264_76 = 1

			if var_264_75 < arg_261_1.time_ and arg_261_1.time_ <= var_264_75 + arg_264_0 then
				local var_264_77 = "play"
				local var_264_78 = "effect"

				arg_261_1:AudioAction(var_264_77, var_264_78, "se_story_side_1027", "se_story_side_1027_treat", "")
			end
		end
	end,
	Play1102704066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 1102704066
		arg_265_1.duration_ = 2.349999999999

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play1102704067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.fswbg_:SetActive(true)
				arg_265_1.dialog_:SetActive(false)

				arg_265_1.fswtw_.percent = 0

				local var_268_1 = arg_265_1:GetWordFromCfg(1102704066)
				local var_268_2 = arg_265_1:FormatText(var_268_1.content)

				arg_265_1.fswt_.text = var_268_2

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.fswt_)

				arg_265_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_265_1.fswtw_:SetDirty()

				arg_265_1.typewritterCharCountI18N = 0

				SetActive(arg_265_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_265_1:ShowNextGo(false)
			end

			local var_268_3 = 0.0166666666666666

			if var_268_3 < arg_265_1.time_ and arg_265_1.time_ <= var_268_3 + arg_268_0 then
				arg_265_1.var_.oldValueTypewriter = arg_265_1.fswtw_.percent

				arg_265_1:ShowNextGo(false)
			end

			local var_268_4 = 35
			local var_268_5 = 2.33333333333333
			local var_268_6 = arg_265_1:GetWordFromCfg(1102704066)
			local var_268_7 = arg_265_1:FormatText(var_268_6.content)
			local var_268_8, var_268_9 = arg_265_1:GetPercentByPara(var_268_7, 1)

			if var_268_3 < arg_265_1.time_ and arg_265_1.time_ <= var_268_3 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0

				local var_268_10 = var_268_4 <= 0 and var_268_5 or var_268_5 * ((var_268_9 - arg_265_1.typewritterCharCountI18N) / var_268_4)

				if var_268_10 > 0 and var_268_5 < var_268_10 then
					arg_265_1.talkMaxDuration = var_268_10

					if var_268_10 + var_268_3 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_10 + var_268_3
					end
				end
			end

			local var_268_11 = 2.33333333333333
			local var_268_12 = math.max(var_268_11, arg_265_1.talkMaxDuration)

			if var_268_3 <= arg_265_1.time_ and arg_265_1.time_ < var_268_3 + var_268_12 then
				local var_268_13 = (arg_265_1.time_ - var_268_3) / var_268_12

				arg_265_1.fswtw_.percent = Mathf.Lerp(arg_265_1.var_.oldValueTypewriter, var_268_8, var_268_13)
				arg_265_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_265_1.fswtw_:SetDirty()
			end

			if arg_265_1.time_ >= var_268_3 + var_268_12 and arg_265_1.time_ < var_268_3 + var_268_12 + arg_268_0 then
				arg_265_1.fswtw_.percent = var_268_8

				arg_265_1.fswtw_:SetDirty()
				arg_265_1:ShowNextGo(true)

				arg_265_1.typewritterCharCountI18N = var_268_9
			end
		end
	end,
	Play1102704067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 1102704067
		arg_269_1.duration_ = 6.566666666666

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play1102704068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = "R2701"

			if arg_269_1.bgs_[var_272_0] == nil then
				local var_272_1 = Object.Instantiate(arg_269_1.paintGo_)

				var_272_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_272_0)
				var_272_1.name = var_272_0
				var_272_1.transform.parent = arg_269_1.stage_.transform
				var_272_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_269_1.bgs_[var_272_0] = var_272_1
			end

			local var_272_2 = 0

			if var_272_2 < arg_269_1.time_ and arg_269_1.time_ <= var_272_2 + arg_272_0 then
				local var_272_3 = manager.ui.mainCamera.transform.localPosition
				local var_272_4 = Vector3.New(0, 0, 10) + Vector3.New(var_272_3.x, var_272_3.y, 0)
				local var_272_5 = arg_269_1.bgs_.R2701

				var_272_5.transform.localPosition = var_272_4
				var_272_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_272_6 = var_272_5:GetComponent("SpriteRenderer")

				if var_272_6 and var_272_6.sprite then
					local var_272_7 = (var_272_5.transform.localPosition - var_272_3).z
					local var_272_8 = manager.ui.mainCameraCom_
					local var_272_9 = 2 * var_272_7 * Mathf.Tan(var_272_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_272_10 = var_272_9 * var_272_8.aspect
					local var_272_11 = var_272_6.sprite.bounds.size.x
					local var_272_12 = var_272_6.sprite.bounds.size.y
					local var_272_13 = var_272_10 / var_272_11
					local var_272_14 = var_272_9 / var_272_12
					local var_272_15 = var_272_14 < var_272_13 and var_272_13 or var_272_14

					var_272_5.transform.localScale = Vector3.New(var_272_15, var_272_15, 0)
				end

				for iter_272_0, iter_272_1 in pairs(arg_269_1.bgs_) do
					if iter_272_0 ~= "R2701" then
						iter_272_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_272_16 = 0

			if var_272_16 < arg_269_1.time_ and arg_269_1.time_ <= var_272_16 + arg_272_0 then
				arg_269_1.mask_.enabled = true
				arg_269_1.mask_.raycastTarget = true

				arg_269_1:SetGaussion(false)
			end

			local var_272_17 = 2

			if var_272_16 <= arg_269_1.time_ and arg_269_1.time_ < var_272_16 + var_272_17 then
				local var_272_18 = (arg_269_1.time_ - var_272_16) / var_272_17
				local var_272_19 = Color.New(0, 0, 0)

				var_272_19.a = Mathf.Lerp(1, 0, var_272_18)
				arg_269_1.mask_.color = var_272_19
			end

			if arg_269_1.time_ >= var_272_16 + var_272_17 and arg_269_1.time_ < var_272_16 + var_272_17 + arg_272_0 then
				local var_272_20 = Color.New(0, 0, 0)
				local var_272_21 = 0

				arg_269_1.mask_.enabled = false
				var_272_20.a = var_272_21
				arg_269_1.mask_.color = var_272_20
			end

			local var_272_22 = 0

			if var_272_22 < arg_269_1.time_ and arg_269_1.time_ <= var_272_22 + arg_272_0 then
				arg_269_1.fswbg_:SetActive(false)
				arg_269_1.dialog_:SetActive(false)
				arg_269_1:ShowNextGo(false)
			end

			local var_272_23 = arg_269_1.bgs_.R2701.transform
			local var_272_24 = 0

			if var_272_24 < arg_269_1.time_ and arg_269_1.time_ <= var_272_24 + arg_272_0 then
				arg_269_1.var_.moveOldPosR2701 = var_272_23.localPosition
			end

			local var_272_25 = 0.001

			if var_272_24 <= arg_269_1.time_ and arg_269_1.time_ < var_272_24 + var_272_25 then
				local var_272_26 = (arg_269_1.time_ - var_272_24) / var_272_25
				local var_272_27 = Vector3.New(-3.8, -0.2, 1.5)

				var_272_23.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPosR2701, var_272_27, var_272_26)
			end

			if arg_269_1.time_ >= var_272_24 + var_272_25 and arg_269_1.time_ < var_272_24 + var_272_25 + arg_272_0 then
				var_272_23.localPosition = Vector3.New(-3.8, -0.2, 1.5)
			end

			local var_272_28 = arg_269_1.bgs_.R2701.transform
			local var_272_29 = 0.0166666666666667

			if var_272_29 < arg_269_1.time_ and arg_269_1.time_ <= var_272_29 + arg_272_0 then
				arg_269_1.var_.moveOldPosR2701 = var_272_28.localPosition
			end

			local var_272_30 = 6

			if var_272_29 <= arg_269_1.time_ and arg_269_1.time_ < var_272_29 + var_272_30 then
				local var_272_31 = (arg_269_1.time_ - var_272_29) / var_272_30
				local var_272_32 = Vector3.New(-3.8, -0.2, 2.5)

				var_272_28.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPosR2701, var_272_32, var_272_31)
			end

			if arg_269_1.time_ >= var_272_29 + var_272_30 and arg_269_1.time_ < var_272_29 + var_272_30 + arg_272_0 then
				var_272_28.localPosition = Vector3.New(-3.8, -0.2, 2.5)
			end

			local var_272_33 = 2.03400000184674

			if var_272_33 < arg_269_1.time_ and arg_269_1.time_ <= var_272_33 + arg_272_0 then
				arg_269_1.allBtn_.enabled = false
			end

			local var_272_34 = 3.98266666481992

			if arg_269_1.time_ >= var_272_33 + var_272_34 and arg_269_1.time_ < var_272_33 + var_272_34 + arg_272_0 then
				arg_269_1.allBtn_.enabled = true
			end

			if arg_269_1.frameCnt_ <= 1 then
				arg_269_1.dialog_:SetActive(false)
			end

			local var_272_35 = 1.75
			local var_272_36 = 0.25

			if var_272_35 < arg_269_1.time_ and arg_269_1.time_ <= var_272_35 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0

				arg_269_1.dialog_:SetActive(true)

				local var_272_37 = LeanTween.value(arg_269_1.dialog_, 0, 1, 0.3)

				var_272_37:setOnUpdate(LuaHelper.FloatAction(function(arg_273_0)
					arg_269_1.dialogCg_.alpha = arg_273_0
				end))
				var_272_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_269_1.dialog_)
					var_272_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_269_1.duration_ = arg_269_1.duration_ + 0.3

				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_38 = arg_269_1:FormatText(StoryNameCfg[56].name)

				arg_269_1.leftNameTxt_.text = var_272_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_39 = arg_269_1:GetWordFromCfg(1102704067)
				local var_272_40 = arg_269_1:FormatText(var_272_39.content)

				arg_269_1.text_.text = var_272_40

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_41 = 10
				local var_272_42 = utf8.len(var_272_40)
				local var_272_43 = var_272_41 <= 0 and var_272_36 or var_272_36 * (var_272_42 / var_272_41)

				if var_272_43 > 0 and var_272_36 < var_272_43 then
					arg_269_1.talkMaxDuration = var_272_43
					var_272_35 = var_272_35 + 0.3

					if var_272_43 + var_272_35 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_43 + var_272_35
					end
				end

				arg_269_1.text_.text = var_272_40
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704067", "story_v_side_new_1102704.awb") ~= 0 then
					local var_272_44 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704067", "story_v_side_new_1102704.awb") / 1000

					if var_272_44 + var_272_35 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_44 + var_272_35
					end

					if var_272_39.prefab_name ~= "" and arg_269_1.actors_[var_272_39.prefab_name] ~= nil then
						local var_272_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_39.prefab_name].transform, "story_v_side_new_1102704", "1102704067", "story_v_side_new_1102704.awb")

						arg_269_1:RecordAudio("1102704067", var_272_45)
						arg_269_1:RecordAudio("1102704067", var_272_45)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704067", "story_v_side_new_1102704.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704067", "story_v_side_new_1102704.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_46 = var_272_35 + 0.3
			local var_272_47 = math.max(var_272_36, arg_269_1.talkMaxDuration)

			if var_272_46 <= arg_269_1.time_ and arg_269_1.time_ < var_272_46 + var_272_47 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_46) / var_272_47

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_46 + var_272_47 and arg_269_1.time_ < var_272_46 + var_272_47 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 1102704068
		arg_275_1.duration_ = 9.066

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play1102704069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0
			local var_278_1 = 0.675

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_2 = arg_275_1:FormatText(StoryNameCfg[55].name)

				arg_275_1.leftNameTxt_.text = var_278_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, true)
				arg_275_1.iconController_:SetSelectedState("hero")

				arg_275_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1080")

				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_3 = arg_275_1:GetWordFromCfg(1102704068)
				local var_278_4 = arg_275_1:FormatText(var_278_3.content)

				arg_275_1.text_.text = var_278_4

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_5 = 27
				local var_278_6 = utf8.len(var_278_4)
				local var_278_7 = var_278_5 <= 0 and var_278_1 or var_278_1 * (var_278_6 / var_278_5)

				if var_278_7 > 0 and var_278_1 < var_278_7 then
					arg_275_1.talkMaxDuration = var_278_7

					if var_278_7 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_7 + var_278_0
					end
				end

				arg_275_1.text_.text = var_278_4
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704068", "story_v_side_new_1102704.awb") ~= 0 then
					local var_278_8 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704068", "story_v_side_new_1102704.awb") / 1000

					if var_278_8 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_8 + var_278_0
					end

					if var_278_3.prefab_name ~= "" and arg_275_1.actors_[var_278_3.prefab_name] ~= nil then
						local var_278_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_3.prefab_name].transform, "story_v_side_new_1102704", "1102704068", "story_v_side_new_1102704.awb")

						arg_275_1:RecordAudio("1102704068", var_278_9)
						arg_275_1:RecordAudio("1102704068", var_278_9)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704068", "story_v_side_new_1102704.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704068", "story_v_side_new_1102704.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_10 = math.max(var_278_1, arg_275_1.talkMaxDuration)

			if var_278_0 <= arg_275_1.time_ and arg_275_1.time_ < var_278_0 + var_278_10 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_0) / var_278_10

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_0 + var_278_10 and arg_275_1.time_ < var_278_0 + var_278_10 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 1102704069
		arg_279_1.duration_ = 5.933

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play1102704070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 0.8

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_2 = arg_279_1:FormatText(StoryNameCfg[56].name)

				arg_279_1.leftNameTxt_.text = var_282_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_3 = arg_279_1:GetWordFromCfg(1102704069)
				local var_282_4 = arg_279_1:FormatText(var_282_3.content)

				arg_279_1.text_.text = var_282_4

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_5 = 32
				local var_282_6 = utf8.len(var_282_4)
				local var_282_7 = var_282_5 <= 0 and var_282_1 or var_282_1 * (var_282_6 / var_282_5)

				if var_282_7 > 0 and var_282_1 < var_282_7 then
					arg_279_1.talkMaxDuration = var_282_7

					if var_282_7 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_7 + var_282_0
					end
				end

				arg_279_1.text_.text = var_282_4
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704069", "story_v_side_new_1102704.awb") ~= 0 then
					local var_282_8 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704069", "story_v_side_new_1102704.awb") / 1000

					if var_282_8 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_8 + var_282_0
					end

					if var_282_3.prefab_name ~= "" and arg_279_1.actors_[var_282_3.prefab_name] ~= nil then
						local var_282_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_3.prefab_name].transform, "story_v_side_new_1102704", "1102704069", "story_v_side_new_1102704.awb")

						arg_279_1:RecordAudio("1102704069", var_282_9)
						arg_279_1:RecordAudio("1102704069", var_282_9)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704069", "story_v_side_new_1102704.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704069", "story_v_side_new_1102704.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_10 = math.max(var_282_1, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_10 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_0) / var_282_10

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_10 and arg_279_1.time_ < var_282_0 + var_282_10 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 1102704070
		arg_283_1.duration_ = 3.5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play1102704071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0
			local var_286_1 = 0.35

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_2 = arg_283_1:FormatText(StoryNameCfg[56].name)

				arg_283_1.leftNameTxt_.text = var_286_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_3 = arg_283_1:GetWordFromCfg(1102704070)
				local var_286_4 = arg_283_1:FormatText(var_286_3.content)

				arg_283_1.text_.text = var_286_4

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_5 = 14
				local var_286_6 = utf8.len(var_286_4)
				local var_286_7 = var_286_5 <= 0 and var_286_1 or var_286_1 * (var_286_6 / var_286_5)

				if var_286_7 > 0 and var_286_1 < var_286_7 then
					arg_283_1.talkMaxDuration = var_286_7

					if var_286_7 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_7 + var_286_0
					end
				end

				arg_283_1.text_.text = var_286_4
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704070", "story_v_side_new_1102704.awb") ~= 0 then
					local var_286_8 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704070", "story_v_side_new_1102704.awb") / 1000

					if var_286_8 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_8 + var_286_0
					end

					if var_286_3.prefab_name ~= "" and arg_283_1.actors_[var_286_3.prefab_name] ~= nil then
						local var_286_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_3.prefab_name].transform, "story_v_side_new_1102704", "1102704070", "story_v_side_new_1102704.awb")

						arg_283_1:RecordAudio("1102704070", var_286_9)
						arg_283_1:RecordAudio("1102704070", var_286_9)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704070", "story_v_side_new_1102704.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704070", "story_v_side_new_1102704.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_10 = math.max(var_286_1, arg_283_1.talkMaxDuration)

			if var_286_0 <= arg_283_1.time_ and arg_283_1.time_ < var_286_0 + var_286_10 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_0) / var_286_10

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_0 + var_286_10 and arg_283_1.time_ < var_286_0 + var_286_10 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 1102704071
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play1102704072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = "1127ui_story"

			if arg_287_1.actors_[var_290_0] == nil then
				local var_290_1 = Object.Instantiate(Asset.Load("Char/" .. var_290_0), arg_287_1.stage_.transform)

				var_290_1.name = var_290_0
				var_290_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_287_1.actors_[var_290_0] = var_290_1

				local var_290_2 = var_290_1:GetComponentInChildren(typeof(CharacterEffect))

				var_290_2.enabled = true

				local var_290_3 = GameObjectTools.GetOrAddComponent(var_290_1, typeof(DynamicBoneHelper))

				if var_290_3 then
					var_290_3:EnableDynamicBone(false)
				end

				arg_287_1:ShowWeapon(var_290_2.transform, false)

				arg_287_1.var_[var_290_0 .. "Animator"] = var_290_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_287_1.var_[var_290_0 .. "Animator"].applyRootMotion = true
				arg_287_1.var_[var_290_0 .. "LipSync"] = var_290_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_290_4 = arg_287_1.actors_["1127ui_story"]
			local var_290_5 = 0

			if var_290_5 < arg_287_1.time_ and arg_287_1.time_ <= var_290_5 + arg_290_0 and arg_287_1.var_.characterEffect1127ui_story == nil then
				arg_287_1.var_.characterEffect1127ui_story = var_290_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_6 = 0.200000002980232

			if var_290_5 <= arg_287_1.time_ and arg_287_1.time_ < var_290_5 + var_290_6 then
				local var_290_7 = (arg_287_1.time_ - var_290_5) / var_290_6

				if arg_287_1.var_.characterEffect1127ui_story then
					local var_290_8 = Mathf.Lerp(0, 0.5, var_290_7)

					arg_287_1.var_.characterEffect1127ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1127ui_story.fillRatio = var_290_8
				end
			end

			if arg_287_1.time_ >= var_290_5 + var_290_6 and arg_287_1.time_ < var_290_5 + var_290_6 + arg_290_0 and arg_287_1.var_.characterEffect1127ui_story then
				local var_290_9 = 0.5

				arg_287_1.var_.characterEffect1127ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1127ui_story.fillRatio = var_290_9
			end

			local var_290_10 = 0
			local var_290_11 = 0.4

			if var_290_10 < arg_287_1.time_ and arg_287_1.time_ <= var_290_10 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_12 = arg_287_1:FormatText(StoryNameCfg[7].name)

				arg_287_1.leftNameTxt_.text = var_290_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_13 = arg_287_1:GetWordFromCfg(1102704071)
				local var_290_14 = arg_287_1:FormatText(var_290_13.content)

				arg_287_1.text_.text = var_290_14

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_15 = 16
				local var_290_16 = utf8.len(var_290_14)
				local var_290_17 = var_290_15 <= 0 and var_290_11 or var_290_11 * (var_290_16 / var_290_15)

				if var_290_17 > 0 and var_290_11 < var_290_17 then
					arg_287_1.talkMaxDuration = var_290_17

					if var_290_17 + var_290_10 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_17 + var_290_10
					end
				end

				arg_287_1.text_.text = var_290_14
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_18 = math.max(var_290_11, arg_287_1.talkMaxDuration)

			if var_290_10 <= arg_287_1.time_ and arg_287_1.time_ < var_290_10 + var_290_18 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_10) / var_290_18

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_10 + var_290_18 and arg_287_1.time_ < var_290_10 + var_290_18 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 1102704072
		arg_291_1.duration_ = 9

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play1102704073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 2

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				local var_294_1 = manager.ui.mainCamera.transform.localPosition
				local var_294_2 = Vector3.New(0, 0, 10) + Vector3.New(var_294_1.x, var_294_1.y, 0)
				local var_294_3 = arg_291_1.bgs_.R2701

				var_294_3.transform.localPosition = var_294_2
				var_294_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_294_4 = var_294_3:GetComponent("SpriteRenderer")

				if var_294_4 and var_294_4.sprite then
					local var_294_5 = (var_294_3.transform.localPosition - var_294_1).z
					local var_294_6 = manager.ui.mainCameraCom_
					local var_294_7 = 2 * var_294_5 * Mathf.Tan(var_294_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_294_8 = var_294_7 * var_294_6.aspect
					local var_294_9 = var_294_4.sprite.bounds.size.x
					local var_294_10 = var_294_4.sprite.bounds.size.y
					local var_294_11 = var_294_8 / var_294_9
					local var_294_12 = var_294_7 / var_294_10
					local var_294_13 = var_294_12 < var_294_11 and var_294_11 or var_294_12

					var_294_3.transform.localScale = Vector3.New(var_294_13, var_294_13, 0)
				end

				for iter_294_0, iter_294_1 in pairs(arg_291_1.bgs_) do
					if iter_294_0 ~= "R2701" then
						iter_294_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_294_14 = 2

			if var_294_14 < arg_291_1.time_ and arg_291_1.time_ <= var_294_14 + arg_294_0 then
				arg_291_1.mask_.enabled = true
				arg_291_1.mask_.raycastTarget = true

				arg_291_1:SetGaussion(false)
			end

			local var_294_15 = 2

			if var_294_14 <= arg_291_1.time_ and arg_291_1.time_ < var_294_14 + var_294_15 then
				local var_294_16 = (arg_291_1.time_ - var_294_14) / var_294_15
				local var_294_17 = Color.New(0, 0, 0)

				var_294_17.a = Mathf.Lerp(1, 0, var_294_16)
				arg_291_1.mask_.color = var_294_17
			end

			if arg_291_1.time_ >= var_294_14 + var_294_15 and arg_291_1.time_ < var_294_14 + var_294_15 + arg_294_0 then
				local var_294_18 = Color.New(0, 0, 0)
				local var_294_19 = 0

				arg_291_1.mask_.enabled = false
				var_294_18.a = var_294_19
				arg_291_1.mask_.color = var_294_18
			end

			local var_294_20 = 0

			if var_294_20 < arg_291_1.time_ and arg_291_1.time_ <= var_294_20 + arg_294_0 then
				arg_291_1.mask_.enabled = true
				arg_291_1.mask_.raycastTarget = true

				arg_291_1:SetGaussion(false)
			end

			local var_294_21 = 2

			if var_294_20 <= arg_291_1.time_ and arg_291_1.time_ < var_294_20 + var_294_21 then
				local var_294_22 = (arg_291_1.time_ - var_294_20) / var_294_21
				local var_294_23 = Color.New(0, 0, 0)

				var_294_23.a = Mathf.Lerp(0, 1, var_294_22)
				arg_291_1.mask_.color = var_294_23
			end

			if arg_291_1.time_ >= var_294_20 + var_294_21 and arg_291_1.time_ < var_294_20 + var_294_21 + arg_294_0 then
				local var_294_24 = Color.New(0, 0, 0)

				var_294_24.a = 1
				arg_291_1.mask_.color = var_294_24
			end

			if arg_291_1.frameCnt_ <= 1 then
				arg_291_1.dialog_:SetActive(false)
			end

			local var_294_25 = 4
			local var_294_26 = 0.8

			if var_294_25 < arg_291_1.time_ and arg_291_1.time_ <= var_294_25 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0

				arg_291_1.dialog_:SetActive(true)

				local var_294_27 = LeanTween.value(arg_291_1.dialog_, 0, 1, 0.3)

				var_294_27:setOnUpdate(LuaHelper.FloatAction(function(arg_295_0)
					arg_291_1.dialogCg_.alpha = arg_295_0
				end))
				var_294_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_291_1.dialog_)
					var_294_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_291_1.duration_ = arg_291_1.duration_ + 0.3

				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_28 = arg_291_1:GetWordFromCfg(1102704072)
				local var_294_29 = arg_291_1:FormatText(var_294_28.content)

				arg_291_1.text_.text = var_294_29

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_30 = 32
				local var_294_31 = utf8.len(var_294_29)
				local var_294_32 = var_294_30 <= 0 and var_294_26 or var_294_26 * (var_294_31 / var_294_30)

				if var_294_32 > 0 and var_294_26 < var_294_32 then
					arg_291_1.talkMaxDuration = var_294_32
					var_294_25 = var_294_25 + 0.3

					if var_294_32 + var_294_25 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_32 + var_294_25
					end
				end

				arg_291_1.text_.text = var_294_29
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_33 = var_294_25 + 0.3
			local var_294_34 = math.max(var_294_26, arg_291_1.talkMaxDuration)

			if var_294_33 <= arg_291_1.time_ and arg_291_1.time_ < var_294_33 + var_294_34 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_33) / var_294_34

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_33 + var_294_34 and arg_291_1.time_ < var_294_33 + var_294_34 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 1102704073
		arg_297_1.duration_ = 4

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play1102704074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1080ui_story"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.characterEffect1080ui_story == nil then
				arg_297_1.var_.characterEffect1080ui_story = var_300_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_2 = 0.200000002980232

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.characterEffect1080ui_story then
					arg_297_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.characterEffect1080ui_story then
				arg_297_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_300_4 = 0

			if var_300_4 < arg_297_1.time_ and arg_297_1.time_ <= var_300_4 + arg_300_0 then
				arg_297_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action6_2")
			end

			local var_300_5 = 0

			if var_300_5 < arg_297_1.time_ and arg_297_1.time_ <= var_300_5 + arg_300_0 then
				arg_297_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_300_6 = 0
			local var_300_7 = 0.425

			if var_300_6 < arg_297_1.time_ and arg_297_1.time_ <= var_300_6 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_8 = arg_297_1:FormatText(StoryNameCfg[55].name)

				arg_297_1.leftNameTxt_.text = var_300_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_9 = arg_297_1:GetWordFromCfg(1102704073)
				local var_300_10 = arg_297_1:FormatText(var_300_9.content)

				arg_297_1.text_.text = var_300_10

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_11 = 17
				local var_300_12 = utf8.len(var_300_10)
				local var_300_13 = var_300_11 <= 0 and var_300_7 or var_300_7 * (var_300_12 / var_300_11)

				if var_300_13 > 0 and var_300_7 < var_300_13 then
					arg_297_1.talkMaxDuration = var_300_13

					if var_300_13 + var_300_6 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_13 + var_300_6
					end
				end

				arg_297_1.text_.text = var_300_10
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704073", "story_v_side_new_1102704.awb") ~= 0 then
					local var_300_14 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704073", "story_v_side_new_1102704.awb") / 1000

					if var_300_14 + var_300_6 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_14 + var_300_6
					end

					if var_300_9.prefab_name ~= "" and arg_297_1.actors_[var_300_9.prefab_name] ~= nil then
						local var_300_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_9.prefab_name].transform, "story_v_side_new_1102704", "1102704073", "story_v_side_new_1102704.awb")

						arg_297_1:RecordAudio("1102704073", var_300_15)
						arg_297_1:RecordAudio("1102704073", var_300_15)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704073", "story_v_side_new_1102704.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704073", "story_v_side_new_1102704.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_16 = math.max(var_300_7, arg_297_1.talkMaxDuration)

			if var_300_6 <= arg_297_1.time_ and arg_297_1.time_ < var_300_6 + var_300_16 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_6) / var_300_16

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_6 + var_300_16 and arg_297_1.time_ < var_300_6 + var_300_16 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 1102704074
		arg_301_1.duration_ = 9.8

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play1102704075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 1.05

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[56].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(1102704074)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704074", "story_v_side_new_1102704.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704074", "story_v_side_new_1102704.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_side_new_1102704", "1102704074", "story_v_side_new_1102704.awb")

						arg_301_1:RecordAudio("1102704074", var_304_9)
						arg_301_1:RecordAudio("1102704074", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704074", "story_v_side_new_1102704.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704074", "story_v_side_new_1102704.awb")
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
	Play1102704075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 1102704075
		arg_305_1.duration_ = 12.133

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play1102704076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 1.3

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[56].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(1102704075)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704075", "story_v_side_new_1102704.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704075", "story_v_side_new_1102704.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_side_new_1102704", "1102704075", "story_v_side_new_1102704.awb")

						arg_305_1:RecordAudio("1102704075", var_308_9)
						arg_305_1:RecordAudio("1102704075", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704075", "story_v_side_new_1102704.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704075", "story_v_side_new_1102704.awb")
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
	Play1102704076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 1102704076
		arg_309_1.duration_ = 9.733

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play1102704077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0
			local var_312_1 = 1.075

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_2 = arg_309_1:FormatText(StoryNameCfg[56].name)

				arg_309_1.leftNameTxt_.text = var_312_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_3 = arg_309_1:GetWordFromCfg(1102704076)
				local var_312_4 = arg_309_1:FormatText(var_312_3.content)

				arg_309_1.text_.text = var_312_4

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704076", "story_v_side_new_1102704.awb") ~= 0 then
					local var_312_8 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704076", "story_v_side_new_1102704.awb") / 1000

					if var_312_8 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_8 + var_312_0
					end

					if var_312_3.prefab_name ~= "" and arg_309_1.actors_[var_312_3.prefab_name] ~= nil then
						local var_312_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_3.prefab_name].transform, "story_v_side_new_1102704", "1102704076", "story_v_side_new_1102704.awb")

						arg_309_1:RecordAudio("1102704076", var_312_9)
						arg_309_1:RecordAudio("1102704076", var_312_9)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704076", "story_v_side_new_1102704.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704076", "story_v_side_new_1102704.awb")
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
	Play1102704077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 1102704077
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play1102704078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.225

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_2 = arg_313_1:FormatText(StoryNameCfg[7].name)

				arg_313_1.leftNameTxt_.text = var_316_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_3 = arg_313_1:GetWordFromCfg(1102704077)
				local var_316_4 = arg_313_1:FormatText(var_316_3.content)

				arg_313_1.text_.text = var_316_4

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_5 = 9
				local var_316_6 = utf8.len(var_316_4)
				local var_316_7 = var_316_5 <= 0 and var_316_1 or var_316_1 * (var_316_6 / var_316_5)

				if var_316_7 > 0 and var_316_1 < var_316_7 then
					arg_313_1.talkMaxDuration = var_316_7

					if var_316_7 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_7 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_4
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_8 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_8 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_8

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_8 and arg_313_1.time_ < var_316_0 + var_316_8 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 1102704078
		arg_317_1.duration_ = 4.733

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play1102704079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0
			local var_320_1 = 0.525

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_2 = arg_317_1:FormatText(StoryNameCfg[56].name)

				arg_317_1.leftNameTxt_.text = var_320_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_3 = arg_317_1:GetWordFromCfg(1102704078)
				local var_320_4 = arg_317_1:FormatText(var_320_3.content)

				arg_317_1.text_.text = var_320_4

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704078", "story_v_side_new_1102704.awb") ~= 0 then
					local var_320_8 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704078", "story_v_side_new_1102704.awb") / 1000

					if var_320_8 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_8 + var_320_0
					end

					if var_320_3.prefab_name ~= "" and arg_317_1.actors_[var_320_3.prefab_name] ~= nil then
						local var_320_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_3.prefab_name].transform, "story_v_side_new_1102704", "1102704078", "story_v_side_new_1102704.awb")

						arg_317_1:RecordAudio("1102704078", var_320_9)
						arg_317_1:RecordAudio("1102704078", var_320_9)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704078", "story_v_side_new_1102704.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704078", "story_v_side_new_1102704.awb")
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
	Play1102704079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 1102704079
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play1102704080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 0.175

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_2 = arg_321_1:FormatText(StoryNameCfg[7].name)

				arg_321_1.leftNameTxt_.text = var_324_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_3 = arg_321_1:GetWordFromCfg(1102704079)
				local var_324_4 = arg_321_1:FormatText(var_324_3.content)

				arg_321_1.text_.text = var_324_4

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_5 = 7
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
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_8 = math.max(var_324_1, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_8 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_0) / var_324_8

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_8 and arg_321_1.time_ < var_324_0 + var_324_8 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play1102704080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 1102704080
		arg_325_1.duration_ = 8.433

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play1102704081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 0.9

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_2 = arg_325_1:FormatText(StoryNameCfg[56].name)

				arg_325_1.leftNameTxt_.text = var_328_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_3 = arg_325_1:GetWordFromCfg(1102704080)
				local var_328_4 = arg_325_1:FormatText(var_328_3.content)

				arg_325_1.text_.text = var_328_4

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704080", "story_v_side_new_1102704.awb") ~= 0 then
					local var_328_8 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704080", "story_v_side_new_1102704.awb") / 1000

					if var_328_8 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_0
					end

					if var_328_3.prefab_name ~= "" and arg_325_1.actors_[var_328_3.prefab_name] ~= nil then
						local var_328_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_3.prefab_name].transform, "story_v_side_new_1102704", "1102704080", "story_v_side_new_1102704.awb")

						arg_325_1:RecordAudio("1102704080", var_328_9)
						arg_325_1:RecordAudio("1102704080", var_328_9)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704080", "story_v_side_new_1102704.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704080", "story_v_side_new_1102704.awb")
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
	Play1102704081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 1102704081
		arg_329_1.duration_ = 5.233

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
			arg_329_1.auto_ = false
		end

		function arg_329_1.playNext_(arg_331_0)
			arg_329_1.onStoryFinished_()
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 0.475

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_2 = arg_329_1:FormatText(StoryNameCfg[56].name)

				arg_329_1.leftNameTxt_.text = var_332_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_3 = arg_329_1:GetWordFromCfg(1102704081)
				local var_332_4 = arg_329_1:FormatText(var_332_3.content)

				arg_329_1.text_.text = var_332_4

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_5 = 19
				local var_332_6 = utf8.len(var_332_4)
				local var_332_7 = var_332_5 <= 0 and var_332_1 or var_332_1 * (var_332_6 / var_332_5)

				if var_332_7 > 0 and var_332_1 < var_332_7 then
					arg_329_1.talkMaxDuration = var_332_7

					if var_332_7 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_7 + var_332_0
					end
				end

				arg_329_1.text_.text = var_332_4
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704081", "story_v_side_new_1102704.awb") ~= 0 then
					local var_332_8 = manager.audio:GetVoiceLength("story_v_side_new_1102704", "1102704081", "story_v_side_new_1102704.awb") / 1000

					if var_332_8 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_8 + var_332_0
					end

					if var_332_3.prefab_name ~= "" and arg_329_1.actors_[var_332_3.prefab_name] ~= nil then
						local var_332_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_3.prefab_name].transform, "story_v_side_new_1102704", "1102704081", "story_v_side_new_1102704.awb")

						arg_329_1:RecordAudio("1102704081", var_332_9)
						arg_329_1:RecordAudio("1102704081", var_332_9)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_side_new_1102704", "1102704081", "story_v_side_new_1102704.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_side_new_1102704", "1102704081", "story_v_side_new_1102704.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_10 = math.max(var_332_1, arg_329_1.talkMaxDuration)

			if var_332_0 <= arg_329_1.time_ and arg_329_1.time_ < var_332_0 + var_332_10 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_0) / var_332_10

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_0 + var_332_10 and arg_329_1.time_ < var_332_0 + var_332_10 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R2701"
	},
	voices = {
		"story_v_side_new_1102704.awb"
	}
}
