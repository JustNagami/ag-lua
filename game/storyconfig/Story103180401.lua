return {
	Play318041001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 318041001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play318041002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST69"

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
				local var_4_5 = arg_1_1.bgs_.ST69

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
					if iter_4_0 ~= "ST69" then
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
			local var_4_23 = 0.433333333333333

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.26666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.55

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

				local var_4_33 = arg_1_1:GetWordFromCfg(318041001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 22
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
	Play318041002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 318041002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play318041003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.8

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

				local var_10_2 = arg_7_1:GetWordFromCfg(318041002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 32
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
	Play318041003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 318041003
		arg_11_1.duration_ = 4.033

		local var_11_0 = {
			zh = 4.033,
			ja = 2.5
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
				arg_11_0:Play318041004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1050ui_story"

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

			local var_14_4 = arg_11_1.actors_["1050ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1050ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, -1, -6.1)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1050ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -1, -6.1)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1050ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1050ui_story == nil then
				arg_11_1.var_.characterEffect1050ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1050ui_story then
					arg_11_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1050ui_story then
				arg_11_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_14_19 = 0
			local var_14_20 = 0.275

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_21 = arg_11_1:FormatText(StoryNameCfg[74].name)

				arg_11_1.leftNameTxt_.text = var_14_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(318041003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 11
				local var_14_25 = utf8.len(var_14_23)
				local var_14_26 = var_14_24 <= 0 and var_14_20 or var_14_20 * (var_14_25 / var_14_24)

				if var_14_26 > 0 and var_14_20 < var_14_26 then
					arg_11_1.talkMaxDuration = var_14_26

					if var_14_26 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_26 + var_14_19
					end
				end

				arg_11_1.text_.text = var_14_23
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041003", "story_v_out_318041.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_out_318041", "318041003", "story_v_out_318041.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_out_318041", "318041003", "story_v_out_318041.awb")

						arg_11_1:RecordAudio("318041003", var_14_28)
						arg_11_1:RecordAudio("318041003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_318041", "318041003", "story_v_out_318041.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_318041", "318041003", "story_v_out_318041.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_29 = math.max(var_14_20, arg_11_1.talkMaxDuration)

			if var_14_19 <= arg_11_1.time_ and arg_11_1.time_ < var_14_19 + var_14_29 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_19) / var_14_29

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_19 + var_14_29 and arg_11_1.time_ < var_14_19 + var_14_29 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play318041004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 318041004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play318041005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1050ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1050ui_story == nil then
				arg_15_1.var_.characterEffect1050ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1050ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1050ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1050ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1050ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.433333333333333

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				local var_18_8 = "play"
				local var_18_9 = "effect"

				arg_15_1:AudioAction(var_18_8, var_18_9, "se_story_1210", "se_story_1210_walk", "")
			end

			local var_18_10 = 0
			local var_18_11 = 0.35

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_12 = arg_15_1:GetWordFromCfg(318041004)
				local var_18_13 = arg_15_1:FormatText(var_18_12.content)

				arg_15_1.text_.text = var_18_13

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_14 = 14
				local var_18_15 = utf8.len(var_18_13)
				local var_18_16 = var_18_14 <= 0 and var_18_11 or var_18_11 * (var_18_15 / var_18_14)

				if var_18_16 > 0 and var_18_11 < var_18_16 then
					arg_15_1.talkMaxDuration = var_18_16

					if var_18_16 + var_18_10 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_16 + var_18_10
					end
				end

				arg_15_1.text_.text = var_18_13
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_17 = math.max(var_18_11, arg_15_1.talkMaxDuration)

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_17 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_10) / var_18_17

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_10 + var_18_17 and arg_15_1.time_ < var_18_10 + var_18_17 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play318041005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 318041005
		arg_19_1.duration_ = 6.033

		local var_19_0 = {
			zh = 6.033,
			ja = 4.733
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
				arg_19_0:Play318041006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1050ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1050ui_story == nil then
				arg_19_1.var_.characterEffect1050ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1050ui_story then
					arg_19_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1050ui_story then
				arg_19_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_22_4 = 0
			local var_22_5 = 0.325

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_6 = arg_19_1:FormatText(StoryNameCfg[74].name)

				arg_19_1.leftNameTxt_.text = var_22_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_7 = arg_19_1:GetWordFromCfg(318041005)
				local var_22_8 = arg_19_1:FormatText(var_22_7.content)

				arg_19_1.text_.text = var_22_8

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_9 = 13
				local var_22_10 = utf8.len(var_22_8)
				local var_22_11 = var_22_9 <= 0 and var_22_5 or var_22_5 * (var_22_10 / var_22_9)

				if var_22_11 > 0 and var_22_5 < var_22_11 then
					arg_19_1.talkMaxDuration = var_22_11

					if var_22_11 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_11 + var_22_4
					end
				end

				arg_19_1.text_.text = var_22_8
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041005", "story_v_out_318041.awb") ~= 0 then
					local var_22_12 = manager.audio:GetVoiceLength("story_v_out_318041", "318041005", "story_v_out_318041.awb") / 1000

					if var_22_12 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_12 + var_22_4
					end

					if var_22_7.prefab_name ~= "" and arg_19_1.actors_[var_22_7.prefab_name] ~= nil then
						local var_22_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_7.prefab_name].transform, "story_v_out_318041", "318041005", "story_v_out_318041.awb")

						arg_19_1:RecordAudio("318041005", var_22_13)
						arg_19_1:RecordAudio("318041005", var_22_13)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_318041", "318041005", "story_v_out_318041.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_318041", "318041005", "story_v_out_318041.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_5, arg_19_1.talkMaxDuration)

			if var_22_4 <= arg_19_1.time_ and arg_19_1.time_ < var_22_4 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_4) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_4 + var_22_14 and arg_19_1.time_ < var_22_4 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play318041006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 318041006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play318041007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1050ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1050ui_story == nil then
				arg_23_1.var_.characterEffect1050ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1050ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1050ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1050ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1050ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.433333333333333

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				local var_26_8 = "play"
				local var_26_9 = "effect"

				arg_23_1:AudioAction(var_26_8, var_26_9, "se_story_16", "se_story_16_door04", "")
			end

			local var_26_10 = 0
			local var_26_11 = 0.45

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_12 = arg_23_1:GetWordFromCfg(318041006)
				local var_26_13 = arg_23_1:FormatText(var_26_12.content)

				arg_23_1.text_.text = var_26_13

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_14 = 18
				local var_26_15 = utf8.len(var_26_13)
				local var_26_16 = var_26_14 <= 0 and var_26_11 or var_26_11 * (var_26_15 / var_26_14)

				if var_26_16 > 0 and var_26_11 < var_26_16 then
					arg_23_1.talkMaxDuration = var_26_16

					if var_26_16 + var_26_10 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_16 + var_26_10
					end
				end

				arg_23_1.text_.text = var_26_13
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_17 = math.max(var_26_11, arg_23_1.talkMaxDuration)

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_17 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_10) / var_26_17

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_10 + var_26_17 and arg_23_1.time_ < var_26_10 + var_26_17 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play318041007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 318041007
		arg_27_1.duration_ = 3.933

		local var_27_0 = {
			zh = 3.933,
			ja = 3.1
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
				arg_27_0:Play318041008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1050ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1050ui_story == nil then
				arg_27_1.var_.characterEffect1050ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1050ui_story then
					arg_27_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1050ui_story then
				arg_27_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_30_4 = 0
			local var_30_5 = 0.225

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_6 = arg_27_1:FormatText(StoryNameCfg[74].name)

				arg_27_1.leftNameTxt_.text = var_30_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_7 = arg_27_1:GetWordFromCfg(318041007)
				local var_30_8 = arg_27_1:FormatText(var_30_7.content)

				arg_27_1.text_.text = var_30_8

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_9 = 9
				local var_30_10 = utf8.len(var_30_8)
				local var_30_11 = var_30_9 <= 0 and var_30_5 or var_30_5 * (var_30_10 / var_30_9)

				if var_30_11 > 0 and var_30_5 < var_30_11 then
					arg_27_1.talkMaxDuration = var_30_11

					if var_30_11 + var_30_4 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_11 + var_30_4
					end
				end

				arg_27_1.text_.text = var_30_8
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041007", "story_v_out_318041.awb") ~= 0 then
					local var_30_12 = manager.audio:GetVoiceLength("story_v_out_318041", "318041007", "story_v_out_318041.awb") / 1000

					if var_30_12 + var_30_4 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_4
					end

					if var_30_7.prefab_name ~= "" and arg_27_1.actors_[var_30_7.prefab_name] ~= nil then
						local var_30_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_7.prefab_name].transform, "story_v_out_318041", "318041007", "story_v_out_318041.awb")

						arg_27_1:RecordAudio("318041007", var_30_13)
						arg_27_1:RecordAudio("318041007", var_30_13)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_318041", "318041007", "story_v_out_318041.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_318041", "318041007", "story_v_out_318041.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_14 = math.max(var_30_5, arg_27_1.talkMaxDuration)

			if var_30_4 <= arg_27_1.time_ and arg_27_1.time_ < var_30_4 + var_30_14 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_4) / var_30_14

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_4 + var_30_14 and arg_27_1.time_ < var_30_4 + var_30_14 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play318041008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 318041008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play318041009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1050ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1050ui_story == nil then
				arg_31_1.var_.characterEffect1050ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1050ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1050ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1050ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1050ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.433333333333333

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				local var_34_8 = "play"
				local var_34_9 = "effect"

				arg_31_1:AudioAction(var_34_8, var_34_9, "se_story_16", "se_story_16_door04", "")
			end

			local var_34_10 = 0
			local var_34_11 = 0.25

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_12 = arg_31_1:GetWordFromCfg(318041008)
				local var_34_13 = arg_31_1:FormatText(var_34_12.content)

				arg_31_1.text_.text = var_34_13

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_14 = 10
				local var_34_15 = utf8.len(var_34_13)
				local var_34_16 = var_34_14 <= 0 and var_34_11 or var_34_11 * (var_34_15 / var_34_14)

				if var_34_16 > 0 and var_34_11 < var_34_16 then
					arg_31_1.talkMaxDuration = var_34_16

					if var_34_16 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_16 + var_34_10
					end
				end

				arg_31_1.text_.text = var_34_13
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_17 = math.max(var_34_11, arg_31_1.talkMaxDuration)

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_17 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_10) / var_34_17

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_10 + var_34_17 and arg_31_1.time_ < var_34_10 + var_34_17 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play318041009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 318041009
		arg_35_1.duration_ = 1.999999999999

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play318041010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1050ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1050ui_story == nil then
				arg_35_1.var_.characterEffect1050ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1050ui_story then
					arg_35_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1050ui_story then
				arg_35_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_38_4 = 0

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_38_5 = 0
			local var_38_6 = 0.075

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_7 = arg_35_1:FormatText(StoryNameCfg[74].name)

				arg_35_1.leftNameTxt_.text = var_38_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_8 = arg_35_1:GetWordFromCfg(318041009)
				local var_38_9 = arg_35_1:FormatText(var_38_8.content)

				arg_35_1.text_.text = var_38_9

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_10 = 3
				local var_38_11 = utf8.len(var_38_9)
				local var_38_12 = var_38_10 <= 0 and var_38_6 or var_38_6 * (var_38_11 / var_38_10)

				if var_38_12 > 0 and var_38_6 < var_38_12 then
					arg_35_1.talkMaxDuration = var_38_12

					if var_38_12 + var_38_5 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_12 + var_38_5
					end
				end

				arg_35_1.text_.text = var_38_9
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041009", "story_v_out_318041.awb") ~= 0 then
					local var_38_13 = manager.audio:GetVoiceLength("story_v_out_318041", "318041009", "story_v_out_318041.awb") / 1000

					if var_38_13 + var_38_5 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_5
					end

					if var_38_8.prefab_name ~= "" and arg_35_1.actors_[var_38_8.prefab_name] ~= nil then
						local var_38_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_8.prefab_name].transform, "story_v_out_318041", "318041009", "story_v_out_318041.awb")

						arg_35_1:RecordAudio("318041009", var_38_14)
						arg_35_1:RecordAudio("318041009", var_38_14)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_318041", "318041009", "story_v_out_318041.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_318041", "318041009", "story_v_out_318041.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_15 = math.max(var_38_6, arg_35_1.talkMaxDuration)

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_15 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_5) / var_38_15

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_5 + var_38_15 and arg_35_1.time_ < var_38_5 + var_38_15 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play318041010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 318041010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play318041011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1050ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1050ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1050ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, 100, 0)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1050ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1050ui_story == nil then
				arg_39_1.var_.characterEffect1050ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1050ui_story then
					local var_42_13 = Mathf.Lerp(0, 0.5, var_42_12)

					arg_39_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1050ui_story.fillRatio = var_42_13
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1050ui_story then
				local var_42_14 = 0.5

				arg_39_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1050ui_story.fillRatio = var_42_14
			end

			local var_42_15 = 0
			local var_42_16 = 0.625

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_17 = arg_39_1:GetWordFromCfg(318041010)
				local var_42_18 = arg_39_1:FormatText(var_42_17.content)

				arg_39_1.text_.text = var_42_18

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_19 = 25
				local var_42_20 = utf8.len(var_42_18)
				local var_42_21 = var_42_19 <= 0 and var_42_16 or var_42_16 * (var_42_20 / var_42_19)

				if var_42_21 > 0 and var_42_16 < var_42_21 then
					arg_39_1.talkMaxDuration = var_42_21

					if var_42_21 + var_42_15 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_21 + var_42_15
					end
				end

				arg_39_1.text_.text = var_42_18
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_22 = math.max(var_42_16, arg_39_1.talkMaxDuration)

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_22 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_15) / var_42_22

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_15 + var_42_22 and arg_39_1.time_ < var_42_15 + var_42_22 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play318041011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 318041011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play318041012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1.075

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_2 = arg_43_1:GetWordFromCfg(318041011)
				local var_46_3 = arg_43_1:FormatText(var_46_2.content)

				arg_43_1.text_.text = var_46_3

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_4 = 43
				local var_46_5 = utf8.len(var_46_3)
				local var_46_6 = var_46_4 <= 0 and var_46_1 or var_46_1 * (var_46_5 / var_46_4)

				if var_46_6 > 0 and var_46_1 < var_46_6 then
					arg_43_1.talkMaxDuration = var_46_6

					if var_46_6 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_6 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_3
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_7 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_7 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_7

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_7 and arg_43_1.time_ < var_46_0 + var_46_7 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play318041012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 318041012
		arg_47_1.duration_ = 3.433

		local var_47_0 = {
			zh = 3.433,
			ja = 1.999999999999
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
				arg_47_0:Play318041013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1050ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1050ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0, -1, -6.1)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1050ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1050ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1050ui_story == nil then
				arg_47_1.var_.characterEffect1050ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1050ui_story then
					arg_47_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1050ui_story then
				arg_47_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action4_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_15 = 0
			local var_50_16 = 0.225

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_17 = arg_47_1:FormatText(StoryNameCfg[74].name)

				arg_47_1.leftNameTxt_.text = var_50_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_18 = arg_47_1:GetWordFromCfg(318041012)
				local var_50_19 = arg_47_1:FormatText(var_50_18.content)

				arg_47_1.text_.text = var_50_19

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_20 = 9
				local var_50_21 = utf8.len(var_50_19)
				local var_50_22 = var_50_20 <= 0 and var_50_16 or var_50_16 * (var_50_21 / var_50_20)

				if var_50_22 > 0 and var_50_16 < var_50_22 then
					arg_47_1.talkMaxDuration = var_50_22

					if var_50_22 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_22 + var_50_15
					end
				end

				arg_47_1.text_.text = var_50_19
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041012", "story_v_out_318041.awb") ~= 0 then
					local var_50_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041012", "story_v_out_318041.awb") / 1000

					if var_50_23 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_23 + var_50_15
					end

					if var_50_18.prefab_name ~= "" and arg_47_1.actors_[var_50_18.prefab_name] ~= nil then
						local var_50_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_18.prefab_name].transform, "story_v_out_318041", "318041012", "story_v_out_318041.awb")

						arg_47_1:RecordAudio("318041012", var_50_24)
						arg_47_1:RecordAudio("318041012", var_50_24)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_318041", "318041012", "story_v_out_318041.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_318041", "318041012", "story_v_out_318041.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_25 = math.max(var_50_16, arg_47_1.talkMaxDuration)

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_25 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_15) / var_50_25

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_15 + var_50_25 and arg_47_1.time_ < var_50_15 + var_50_25 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play318041013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 318041013
		arg_51_1.duration_ = 8.6

		local var_51_0 = {
			zh = 6.1,
			ja = 8.6
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
				arg_51_0:Play318041014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.675

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[74].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(318041013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041013", "story_v_out_318041.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041013", "story_v_out_318041.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_318041", "318041013", "story_v_out_318041.awb")

						arg_51_1:RecordAudio("318041013", var_54_9)
						arg_51_1:RecordAudio("318041013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_318041", "318041013", "story_v_out_318041.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_318041", "318041013", "story_v_out_318041.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_10 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_10 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_10

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_10 and arg_51_1.time_ < var_54_0 + var_54_10 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play318041014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 318041014
		arg_55_1.duration_ = 2.5

		local var_55_0 = {
			zh = 2,
			ja = 2.5
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
				arg_55_0:Play318041015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.433333333333333

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				local var_58_2 = "play"
				local var_58_3 = "music"

				arg_55_1:AudioAction(var_58_2, var_58_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_58_4 = 0
			local var_58_5 = 0.25

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_6 = arg_55_1:FormatText(StoryNameCfg[74].name)

				arg_55_1.leftNameTxt_.text = var_58_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_7 = arg_55_1:GetWordFromCfg(318041014)
				local var_58_8 = arg_55_1:FormatText(var_58_7.content)

				arg_55_1.text_.text = var_58_8

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_9 = 10
				local var_58_10 = utf8.len(var_58_8)
				local var_58_11 = var_58_9 <= 0 and var_58_5 or var_58_5 * (var_58_10 / var_58_9)

				if var_58_11 > 0 and var_58_5 < var_58_11 then
					arg_55_1.talkMaxDuration = var_58_11

					if var_58_11 + var_58_4 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_11 + var_58_4
					end
				end

				arg_55_1.text_.text = var_58_8
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041014", "story_v_out_318041.awb") ~= 0 then
					local var_58_12 = manager.audio:GetVoiceLength("story_v_out_318041", "318041014", "story_v_out_318041.awb") / 1000

					if var_58_12 + var_58_4 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_12 + var_58_4
					end

					if var_58_7.prefab_name ~= "" and arg_55_1.actors_[var_58_7.prefab_name] ~= nil then
						local var_58_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_7.prefab_name].transform, "story_v_out_318041", "318041014", "story_v_out_318041.awb")

						arg_55_1:RecordAudio("318041014", var_58_13)
						arg_55_1:RecordAudio("318041014", var_58_13)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_318041", "318041014", "story_v_out_318041.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_318041", "318041014", "story_v_out_318041.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_14 = math.max(var_58_5, arg_55_1.talkMaxDuration)

			if var_58_4 <= arg_55_1.time_ and arg_55_1.time_ < var_58_4 + var_58_14 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_4) / var_58_14

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_4 + var_58_14 and arg_55_1.time_ < var_58_4 + var_58_14 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play318041015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 318041015
		arg_59_1.duration_ = 6.5

		local var_59_0 = {
			zh = 6.366,
			ja = 6.5
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
				arg_59_0:Play318041016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "ST16"

			if arg_59_1.bgs_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(arg_59_1.paintGo_)

				var_62_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_62_0)
				var_62_1.name = var_62_0
				var_62_1.transform.parent = arg_59_1.stage_.transform
				var_62_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.bgs_[var_62_0] = var_62_1
			end

			local var_62_2 = 2

			if var_62_2 < arg_59_1.time_ and arg_59_1.time_ <= var_62_2 + arg_62_0 then
				local var_62_3 = manager.ui.mainCamera.transform.localPosition
				local var_62_4 = Vector3.New(0, 0, 10) + Vector3.New(var_62_3.x, var_62_3.y, 0)
				local var_62_5 = arg_59_1.bgs_.ST16

				var_62_5.transform.localPosition = var_62_4
				var_62_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_62_6 = var_62_5:GetComponent("SpriteRenderer")

				if var_62_6 and var_62_6.sprite then
					local var_62_7 = (var_62_5.transform.localPosition - var_62_3).z
					local var_62_8 = manager.ui.mainCameraCom_
					local var_62_9 = 2 * var_62_7 * Mathf.Tan(var_62_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_62_10 = var_62_9 * var_62_8.aspect
					local var_62_11 = var_62_6.sprite.bounds.size.x
					local var_62_12 = var_62_6.sprite.bounds.size.y
					local var_62_13 = var_62_10 / var_62_11
					local var_62_14 = var_62_9 / var_62_12
					local var_62_15 = var_62_14 < var_62_13 and var_62_13 or var_62_14

					var_62_5.transform.localScale = Vector3.New(var_62_15, var_62_15, 0)
				end

				for iter_62_0, iter_62_1 in pairs(arg_59_1.bgs_) do
					if iter_62_0 ~= "ST16" then
						iter_62_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_17 = 2

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_17 then
				local var_62_18 = (arg_59_1.time_ - var_62_16) / var_62_17
				local var_62_19 = Color.New(0, 0, 0)

				var_62_19.a = Mathf.Lerp(0, 1, var_62_18)
				arg_59_1.mask_.color = var_62_19
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 then
				local var_62_20 = Color.New(0, 0, 0)

				var_62_20.a = 1
				arg_59_1.mask_.color = var_62_20
			end

			local var_62_21 = 2

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_22 = 2

			if var_62_21 <= arg_59_1.time_ and arg_59_1.time_ < var_62_21 + var_62_22 then
				local var_62_23 = (arg_59_1.time_ - var_62_21) / var_62_22
				local var_62_24 = Color.New(0, 0, 0)

				var_62_24.a = Mathf.Lerp(1, 0, var_62_23)
				arg_59_1.mask_.color = var_62_24
			end

			if arg_59_1.time_ >= var_62_21 + var_62_22 and arg_59_1.time_ < var_62_21 + var_62_22 + arg_62_0 then
				local var_62_25 = Color.New(0, 0, 0)
				local var_62_26 = 0

				arg_59_1.mask_.enabled = false
				var_62_25.a = var_62_26
				arg_59_1.mask_.color = var_62_25
			end

			local var_62_27 = arg_59_1.actors_["1050ui_story"].transform
			local var_62_28 = 2

			if var_62_28 < arg_59_1.time_ and arg_59_1.time_ <= var_62_28 + arg_62_0 then
				arg_59_1.var_.moveOldPos1050ui_story = var_62_27.localPosition
			end

			local var_62_29 = 0.001

			if var_62_28 <= arg_59_1.time_ and arg_59_1.time_ < var_62_28 + var_62_29 then
				local var_62_30 = (arg_59_1.time_ - var_62_28) / var_62_29
				local var_62_31 = Vector3.New(0, 100, 0)

				var_62_27.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1050ui_story, var_62_31, var_62_30)

				local var_62_32 = manager.ui.mainCamera.transform.position - var_62_27.position

				var_62_27.forward = Vector3.New(var_62_32.x, var_62_32.y, var_62_32.z)

				local var_62_33 = var_62_27.localEulerAngles

				var_62_33.z = 0
				var_62_33.x = 0
				var_62_27.localEulerAngles = var_62_33
			end

			if arg_59_1.time_ >= var_62_28 + var_62_29 and arg_59_1.time_ < var_62_28 + var_62_29 + arg_62_0 then
				var_62_27.localPosition = Vector3.New(0, 100, 0)

				local var_62_34 = manager.ui.mainCamera.transform.position - var_62_27.position

				var_62_27.forward = Vector3.New(var_62_34.x, var_62_34.y, var_62_34.z)

				local var_62_35 = var_62_27.localEulerAngles

				var_62_35.z = 0
				var_62_35.x = 0
				var_62_27.localEulerAngles = var_62_35
			end

			local var_62_36 = arg_59_1.actors_["1050ui_story"]
			local var_62_37 = 2

			if var_62_37 < arg_59_1.time_ and arg_59_1.time_ <= var_62_37 + arg_62_0 and arg_59_1.var_.characterEffect1050ui_story == nil then
				arg_59_1.var_.characterEffect1050ui_story = var_62_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_38 = 0.200000002980232

			if var_62_37 <= arg_59_1.time_ and arg_59_1.time_ < var_62_37 + var_62_38 then
				local var_62_39 = (arg_59_1.time_ - var_62_37) / var_62_38

				if arg_59_1.var_.characterEffect1050ui_story then
					local var_62_40 = Mathf.Lerp(0, 0.5, var_62_39)

					arg_59_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1050ui_story.fillRatio = var_62_40
				end
			end

			if arg_59_1.time_ >= var_62_37 + var_62_38 and arg_59_1.time_ < var_62_37 + var_62_38 + arg_62_0 and arg_59_1.var_.characterEffect1050ui_story then
				local var_62_41 = 0.5

				arg_59_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1050ui_story.fillRatio = var_62_41
			end

			local var_62_42 = 2

			if var_62_42 < arg_59_1.time_ and arg_59_1.time_ <= var_62_42 + arg_62_0 then
				arg_59_1.screenFilterGo_:SetActive(true)

				arg_59_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_62_43 = 2

			if var_62_42 <= arg_59_1.time_ and arg_59_1.time_ < var_62_42 + var_62_43 then
				local var_62_44 = (arg_59_1.time_ - var_62_42) / var_62_43

				arg_59_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_62_44)
			end

			if arg_59_1.time_ >= var_62_42 + var_62_43 and arg_59_1.time_ < var_62_42 + var_62_43 + arg_62_0 then
				arg_59_1.screenFilterEffect_.weight = 1
			end

			local var_62_45 = 0
			local var_62_46 = 0.433333333333333

			if var_62_45 < arg_59_1.time_ and arg_59_1.time_ <= var_62_45 + arg_62_0 then
				local var_62_47 = "play"
				local var_62_48 = "music"

				arg_59_1:AudioAction(var_62_47, var_62_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_62_49 = 2.3
			local var_62_50 = 1

			if var_62_49 < arg_59_1.time_ and arg_59_1.time_ <= var_62_49 + arg_62_0 then
				local var_62_51 = "play"
				local var_62_52 = "music"

				arg_59_1:AudioAction(var_62_51, var_62_52, "bgm_activity_2_10_story_buzenbo", "bgm_activity_2_10_story_buzenbo", "bgm_activity_2_10_story_buzenbo.awb")
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_53 = 4
			local var_62_54 = 0.275

			if var_62_53 < arg_59_1.time_ and arg_59_1.time_ <= var_62_53 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_55 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_55:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_56 = arg_59_1:FormatText(StoryNameCfg[637].name)

				arg_59_1.leftNameTxt_.text = var_62_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_57 = arg_59_1:GetWordFromCfg(318041015)
				local var_62_58 = arg_59_1:FormatText(var_62_57.content)

				arg_59_1.text_.text = var_62_58

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_59 = 11
				local var_62_60 = utf8.len(var_62_58)
				local var_62_61 = var_62_59 <= 0 and var_62_54 or var_62_54 * (var_62_60 / var_62_59)

				if var_62_61 > 0 and var_62_54 < var_62_61 then
					arg_59_1.talkMaxDuration = var_62_61
					var_62_53 = var_62_53 + 0.3

					if var_62_61 + var_62_53 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_61 + var_62_53
					end
				end

				arg_59_1.text_.text = var_62_58
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041015", "story_v_out_318041.awb") ~= 0 then
					local var_62_62 = manager.audio:GetVoiceLength("story_v_out_318041", "318041015", "story_v_out_318041.awb") / 1000

					if var_62_62 + var_62_53 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_62 + var_62_53
					end

					if var_62_57.prefab_name ~= "" and arg_59_1.actors_[var_62_57.prefab_name] ~= nil then
						local var_62_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_57.prefab_name].transform, "story_v_out_318041", "318041015", "story_v_out_318041.awb")

						arg_59_1:RecordAudio("318041015", var_62_63)
						arg_59_1:RecordAudio("318041015", var_62_63)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_318041", "318041015", "story_v_out_318041.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_318041", "318041015", "story_v_out_318041.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_64 = var_62_53 + 0.3
			local var_62_65 = math.max(var_62_54, arg_59_1.talkMaxDuration)

			if var_62_64 <= arg_59_1.time_ and arg_59_1.time_ < var_62_64 + var_62_65 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_64) / var_62_65

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_64 + var_62_65 and arg_59_1.time_ < var_62_64 + var_62_65 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play318041016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 318041016
		arg_65_1.duration_ = 1.999999999999

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play318041017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1050ui_story"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos1050ui_story = var_68_0.localPosition

				local var_68_2 = "1050ui_story"

				arg_65_1:ShowWeapon(arg_65_1.var_[var_68_2 .. "Animator"].transform, true)
			end

			local var_68_3 = 0.001

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_3 then
				local var_68_4 = (arg_65_1.time_ - var_68_1) / var_68_3
				local var_68_5 = Vector3.New(0, -1, -6.1)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1050ui_story, var_68_5, var_68_4)

				local var_68_6 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_6.x, var_68_6.y, var_68_6.z)

				local var_68_7 = var_68_0.localEulerAngles

				var_68_7.z = 0
				var_68_7.x = 0
				var_68_0.localEulerAngles = var_68_7
			end

			if arg_65_1.time_ >= var_68_1 + var_68_3 and arg_65_1.time_ < var_68_1 + var_68_3 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_68_8 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_8.x, var_68_8.y, var_68_8.z)

				local var_68_9 = var_68_0.localEulerAngles

				var_68_9.z = 0
				var_68_9.x = 0
				var_68_0.localEulerAngles = var_68_9
			end

			local var_68_10 = arg_65_1.actors_["1050ui_story"]
			local var_68_11 = 0

			if var_68_11 < arg_65_1.time_ and arg_65_1.time_ <= var_68_11 + arg_68_0 and arg_65_1.var_.characterEffect1050ui_story == nil then
				arg_65_1.var_.characterEffect1050ui_story = var_68_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_12 = 0.200000002980232

			if var_68_11 <= arg_65_1.time_ and arg_65_1.time_ < var_68_11 + var_68_12 then
				local var_68_13 = (arg_65_1.time_ - var_68_11) / var_68_12

				if arg_65_1.var_.characterEffect1050ui_story then
					arg_65_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_11 + var_68_12 and arg_65_1.time_ < var_68_11 + var_68_12 + arg_68_0 and arg_65_1.var_.characterEffect1050ui_story then
				arg_65_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_68_14 = 0

			if var_68_14 < arg_65_1.time_ and arg_65_1.time_ <= var_68_14 + arg_68_0 then
				arg_65_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action6_1")
			end

			local var_68_15 = 0

			if var_68_15 < arg_65_1.time_ and arg_65_1.time_ <= var_68_15 + arg_68_0 then
				arg_65_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_68_16 = 0
			local var_68_17 = 0.125

			if var_68_16 < arg_65_1.time_ and arg_65_1.time_ <= var_68_16 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_18 = arg_65_1:FormatText(StoryNameCfg[74].name)

				arg_65_1.leftNameTxt_.text = var_68_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_19 = arg_65_1:GetWordFromCfg(318041016)
				local var_68_20 = arg_65_1:FormatText(var_68_19.content)

				arg_65_1.text_.text = var_68_20

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_21 = 5
				local var_68_22 = utf8.len(var_68_20)
				local var_68_23 = var_68_21 <= 0 and var_68_17 or var_68_17 * (var_68_22 / var_68_21)

				if var_68_23 > 0 and var_68_17 < var_68_23 then
					arg_65_1.talkMaxDuration = var_68_23

					if var_68_23 + var_68_16 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_23 + var_68_16
					end
				end

				arg_65_1.text_.text = var_68_20
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041016", "story_v_out_318041.awb") ~= 0 then
					local var_68_24 = manager.audio:GetVoiceLength("story_v_out_318041", "318041016", "story_v_out_318041.awb") / 1000

					if var_68_24 + var_68_16 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_24 + var_68_16
					end

					if var_68_19.prefab_name ~= "" and arg_65_1.actors_[var_68_19.prefab_name] ~= nil then
						local var_68_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_19.prefab_name].transform, "story_v_out_318041", "318041016", "story_v_out_318041.awb")

						arg_65_1:RecordAudio("318041016", var_68_25)
						arg_65_1:RecordAudio("318041016", var_68_25)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_318041", "318041016", "story_v_out_318041.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_318041", "318041016", "story_v_out_318041.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_26 = math.max(var_68_17, arg_65_1.talkMaxDuration)

			if var_68_16 <= arg_65_1.time_ and arg_65_1.time_ < var_68_16 + var_68_26 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_16) / var_68_26

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_16 + var_68_26 and arg_65_1.time_ < var_68_16 + var_68_26 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play318041017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 318041017
		arg_69_1.duration_ = 3.366

		local var_69_0 = {
			zh = 2.033,
			ja = 3.366
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
				arg_69_0:Play318041018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1050ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect1050ui_story == nil then
				arg_69_1.var_.characterEffect1050ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.200000002980232

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1050ui_story then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1050ui_story.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1050ui_story then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1050ui_story.fillRatio = var_72_5
			end

			local var_72_6 = 0
			local var_72_7 = 0.2

			if var_72_6 < arg_69_1.time_ and arg_69_1.time_ <= var_72_6 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_8 = arg_69_1:FormatText(StoryNameCfg[637].name)

				arg_69_1.leftNameTxt_.text = var_72_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_9 = arg_69_1:GetWordFromCfg(318041017)
				local var_72_10 = arg_69_1:FormatText(var_72_9.content)

				arg_69_1.text_.text = var_72_10

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_11 = 8
				local var_72_12 = utf8.len(var_72_10)
				local var_72_13 = var_72_11 <= 0 and var_72_7 or var_72_7 * (var_72_12 / var_72_11)

				if var_72_13 > 0 and var_72_7 < var_72_13 then
					arg_69_1.talkMaxDuration = var_72_13

					if var_72_13 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_13 + var_72_6
					end
				end

				arg_69_1.text_.text = var_72_10
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041017", "story_v_out_318041.awb") ~= 0 then
					local var_72_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041017", "story_v_out_318041.awb") / 1000

					if var_72_14 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_14 + var_72_6
					end

					if var_72_9.prefab_name ~= "" and arg_69_1.actors_[var_72_9.prefab_name] ~= nil then
						local var_72_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_9.prefab_name].transform, "story_v_out_318041", "318041017", "story_v_out_318041.awb")

						arg_69_1:RecordAudio("318041017", var_72_15)
						arg_69_1:RecordAudio("318041017", var_72_15)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_318041", "318041017", "story_v_out_318041.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_318041", "318041017", "story_v_out_318041.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_16 = math.max(var_72_7, arg_69_1.talkMaxDuration)

			if var_72_6 <= arg_69_1.time_ and arg_69_1.time_ < var_72_6 + var_72_16 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_6) / var_72_16

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_6 + var_72_16 and arg_69_1.time_ < var_72_6 + var_72_16 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play318041018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 318041018
		arg_73_1.duration_ = 1.5

		local var_73_0 = {
			zh = 1.1,
			ja = 1.5
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
				arg_73_0:Play318041019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1050ui_story"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos1050ui_story = var_76_0.localPosition
			end

			local var_76_2 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2
				local var_76_4 = Vector3.New(0, 100, 0)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1050ui_story, var_76_4, var_76_3)

				local var_76_5 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_5.x, var_76_5.y, var_76_5.z)

				local var_76_6 = var_76_0.localEulerAngles

				var_76_6.z = 0
				var_76_6.x = 0
				var_76_0.localEulerAngles = var_76_6
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0, 100, 0)

				local var_76_7 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_7.x, var_76_7.y, var_76_7.z)

				local var_76_8 = var_76_0.localEulerAngles

				var_76_8.z = 0
				var_76_8.x = 0
				var_76_0.localEulerAngles = var_76_8
			end

			local var_76_9 = arg_73_1.actors_["1050ui_story"]
			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 and arg_73_1.var_.characterEffect1050ui_story == nil then
				arg_73_1.var_.characterEffect1050ui_story = var_76_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_11 = 0.200000002980232

			if var_76_10 <= arg_73_1.time_ and arg_73_1.time_ < var_76_10 + var_76_11 then
				local var_76_12 = (arg_73_1.time_ - var_76_10) / var_76_11

				if arg_73_1.var_.characterEffect1050ui_story then
					arg_73_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_10 + var_76_11 and arg_73_1.time_ < var_76_10 + var_76_11 + arg_76_0 and arg_73_1.var_.characterEffect1050ui_story then
				arg_73_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_76_13 = 0
			local var_76_14 = 0.433333333333333

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				local var_76_15 = "play"
				local var_76_16 = "effect"

				arg_73_1:AudioAction(var_76_15, var_76_16, "se_story_side_1199", "se_story_1199_whooshfinsh", "")
			end

			local var_76_17 = manager.ui.mainCamera.transform
			local var_76_18 = 0

			if var_76_18 < arg_73_1.time_ and arg_73_1.time_ <= var_76_18 + arg_76_0 then
				arg_73_1.var_.shakeOldPos = var_76_17.localPosition
			end

			local var_76_19 = 0.5

			if var_76_18 <= arg_73_1.time_ and arg_73_1.time_ < var_76_18 + var_76_19 then
				local var_76_20 = (arg_73_1.time_ - var_76_18) / 0.066
				local var_76_21, var_76_22 = math.modf(var_76_20)

				var_76_17.localPosition = Vector3.New(var_76_22 * 0.13, var_76_22 * 0.13, var_76_22 * 0.13) + arg_73_1.var_.shakeOldPos
			end

			if arg_73_1.time_ >= var_76_18 + var_76_19 and arg_73_1.time_ < var_76_18 + var_76_19 + arg_76_0 then
				var_76_17.localPosition = arg_73_1.var_.shakeOldPos
			end

			local var_76_23 = 0

			if var_76_23 < arg_73_1.time_ and arg_73_1.time_ <= var_76_23 + arg_76_0 then
				arg_73_1.allBtn_.enabled = false
			end

			local var_76_24 = 0.5

			if arg_73_1.time_ >= var_76_23 + var_76_24 and arg_73_1.time_ < var_76_23 + var_76_24 + arg_76_0 then
				arg_73_1.allBtn_.enabled = true
			end

			local var_76_25 = 0

			if var_76_25 < arg_73_1.time_ and arg_73_1.time_ <= var_76_25 + arg_76_0 then
				arg_73_1.mask_.enabled = true
				arg_73_1.mask_.raycastTarget = false

				arg_73_1:SetGaussion(false)
			end

			local var_76_26 = 0.5

			if var_76_25 <= arg_73_1.time_ and arg_73_1.time_ < var_76_25 + var_76_26 then
				local var_76_27 = (arg_73_1.time_ - var_76_25) / var_76_26
				local var_76_28 = Color.New(1, 1, 1)

				var_76_28.a = Mathf.Lerp(1, 0, var_76_27)
				arg_73_1.mask_.color = var_76_28
			end

			if arg_73_1.time_ >= var_76_25 + var_76_26 and arg_73_1.time_ < var_76_25 + var_76_26 + arg_76_0 then
				local var_76_29 = Color.New(1, 1, 1)
				local var_76_30 = 0

				arg_73_1.mask_.enabled = false
				var_76_29.a = var_76_30
				arg_73_1.mask_.color = var_76_29
			end

			if arg_73_1.frameCnt_ <= 1 then
				arg_73_1.dialog_:SetActive(false)
			end

			local var_76_31 = 0.5
			local var_76_32 = 0.05

			if var_76_31 < arg_73_1.time_ and arg_73_1.time_ <= var_76_31 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				arg_73_1.dialog_:SetActive(true)

				local var_76_33 = LeanTween.value(arg_73_1.dialog_, 0, 1, 0.3)

				var_76_33:setOnUpdate(LuaHelper.FloatAction(function(arg_77_0)
					arg_73_1.dialogCg_.alpha = arg_77_0
				end))
				var_76_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_73_1.dialog_)
					var_76_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_73_1.duration_ = arg_73_1.duration_ + 0.3

				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_34 = arg_73_1:FormatText(StoryNameCfg[74].name)

				arg_73_1.leftNameTxt_.text = var_76_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, true)
				arg_73_1.iconController_:SetSelectedState("hero")

				arg_73_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_35 = arg_73_1:GetWordFromCfg(318041018)
				local var_76_36 = arg_73_1:FormatText(var_76_35.content)

				arg_73_1.text_.text = var_76_36

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_37 = 2
				local var_76_38 = utf8.len(var_76_36)
				local var_76_39 = var_76_37 <= 0 and var_76_32 or var_76_32 * (var_76_38 / var_76_37)

				if var_76_39 > 0 and var_76_32 < var_76_39 then
					arg_73_1.talkMaxDuration = var_76_39
					var_76_31 = var_76_31 + 0.3

					if var_76_39 + var_76_31 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_39 + var_76_31
					end
				end

				arg_73_1.text_.text = var_76_36
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041018", "story_v_out_318041.awb") ~= 0 then
					local var_76_40 = manager.audio:GetVoiceLength("story_v_out_318041", "318041018", "story_v_out_318041.awb") / 1000

					if var_76_40 + var_76_31 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_40 + var_76_31
					end

					if var_76_35.prefab_name ~= "" and arg_73_1.actors_[var_76_35.prefab_name] ~= nil then
						local var_76_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_35.prefab_name].transform, "story_v_out_318041", "318041018", "story_v_out_318041.awb")

						arg_73_1:RecordAudio("318041018", var_76_41)
						arg_73_1:RecordAudio("318041018", var_76_41)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_318041", "318041018", "story_v_out_318041.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_318041", "318041018", "story_v_out_318041.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_42 = var_76_31 + 0.3
			local var_76_43 = math.max(var_76_32, arg_73_1.talkMaxDuration)

			if var_76_42 <= arg_73_1.time_ and arg_73_1.time_ < var_76_42 + var_76_43 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_42) / var_76_43

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_42 + var_76_43 and arg_73_1.time_ < var_76_42 + var_76_43 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play318041019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 318041019
		arg_79_1.duration_ = 3.233

		local var_79_0 = {
			zh = 2.166,
			ja = 3.233
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
				arg_79_0:Play318041020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1050ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1050ui_story == nil then
				arg_79_1.var_.characterEffect1050ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1050ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1050ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1050ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1050ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0
			local var_82_7 = 0.225

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[637].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, true)
				arg_79_1.iconController_:SetSelectedState("hero")

				arg_79_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(318041019)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 9
				local var_82_12 = utf8.len(var_82_10)
				local var_82_13 = var_82_11 <= 0 and var_82_7 or var_82_7 * (var_82_12 / var_82_11)

				if var_82_13 > 0 and var_82_7 < var_82_13 then
					arg_79_1.talkMaxDuration = var_82_13

					if var_82_13 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_13 + var_82_6
					end
				end

				arg_79_1.text_.text = var_82_10
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041019", "story_v_out_318041.awb") ~= 0 then
					local var_82_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041019", "story_v_out_318041.awb") / 1000

					if var_82_14 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_14 + var_82_6
					end

					if var_82_9.prefab_name ~= "" and arg_79_1.actors_[var_82_9.prefab_name] ~= nil then
						local var_82_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_9.prefab_name].transform, "story_v_out_318041", "318041019", "story_v_out_318041.awb")

						arg_79_1:RecordAudio("318041019", var_82_15)
						arg_79_1:RecordAudio("318041019", var_82_15)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_318041", "318041019", "story_v_out_318041.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_318041", "318041019", "story_v_out_318041.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_16 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_16 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_16

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_16 and arg_79_1.time_ < var_82_6 + var_82_16 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play318041020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 318041020
		arg_83_1.duration_ = 1.433

		local var_83_0 = {
			zh = 1.033,
			ja = 1.433
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
				arg_83_0:Play318041021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.433333333333333

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				local var_86_2 = "play"
				local var_86_3 = "effect"

				arg_83_1:AudioAction(var_86_2, var_86_3, "se_story_side_1199", "se_story_1199_whooshfinsh", "")
			end

			local var_86_4 = manager.ui.mainCamera.transform
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 then
				arg_83_1.var_.shakeOldPos = var_86_4.localPosition
			end

			local var_86_6 = 0.5

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / 0.066
				local var_86_8, var_86_9 = math.modf(var_86_7)

				var_86_4.localPosition = Vector3.New(var_86_9 * 0.13, var_86_9 * 0.13, var_86_9 * 0.13) + arg_83_1.var_.shakeOldPos
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 then
				var_86_4.localPosition = arg_83_1.var_.shakeOldPos
			end

			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.allBtn_.enabled = false
			end

			local var_86_11 = 0.5

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 then
				arg_83_1.allBtn_.enabled = true
			end

			local var_86_12 = 0

			if var_86_12 < arg_83_1.time_ and arg_83_1.time_ <= var_86_12 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = false

				arg_83_1:SetGaussion(false)
			end

			local var_86_13 = 0.5

			if var_86_12 <= arg_83_1.time_ and arg_83_1.time_ < var_86_12 + var_86_13 then
				local var_86_14 = (arg_83_1.time_ - var_86_12) / var_86_13
				local var_86_15 = Color.New(1, 1, 1)

				var_86_15.a = Mathf.Lerp(1, 0, var_86_14)
				arg_83_1.mask_.color = var_86_15
			end

			if arg_83_1.time_ >= var_86_12 + var_86_13 and arg_83_1.time_ < var_86_12 + var_86_13 + arg_86_0 then
				local var_86_16 = Color.New(1, 1, 1)
				local var_86_17 = 0

				arg_83_1.mask_.enabled = false
				var_86_16.a = var_86_17
				arg_83_1.mask_.color = var_86_16
			end

			if arg_83_1.frameCnt_ <= 1 then
				arg_83_1.dialog_:SetActive(false)
			end

			local var_86_18 = 0.5
			local var_86_19 = 0.05

			if var_86_18 < arg_83_1.time_ and arg_83_1.time_ <= var_86_18 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				arg_83_1.dialog_:SetActive(true)

				local var_86_20 = LeanTween.value(arg_83_1.dialog_, 0, 1, 0.3)

				var_86_20:setOnUpdate(LuaHelper.FloatAction(function(arg_87_0)
					arg_83_1.dialogCg_.alpha = arg_87_0
				end))
				var_86_20:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_83_1.dialog_)
					var_86_20:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_83_1.duration_ = arg_83_1.duration_ + 0.3

				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_21 = arg_83_1:FormatText(StoryNameCfg[74].name)

				arg_83_1.leftNameTxt_.text = var_86_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_22 = arg_83_1:GetWordFromCfg(318041020)
				local var_86_23 = arg_83_1:FormatText(var_86_22.content)

				arg_83_1.text_.text = var_86_23

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_24 = 2
				local var_86_25 = utf8.len(var_86_23)
				local var_86_26 = var_86_24 <= 0 and var_86_19 or var_86_19 * (var_86_25 / var_86_24)

				if var_86_26 > 0 and var_86_19 < var_86_26 then
					arg_83_1.talkMaxDuration = var_86_26
					var_86_18 = var_86_18 + 0.3

					if var_86_26 + var_86_18 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_26 + var_86_18
					end
				end

				arg_83_1.text_.text = var_86_23
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041020", "story_v_out_318041.awb") ~= 0 then
					local var_86_27 = manager.audio:GetVoiceLength("story_v_out_318041", "318041020", "story_v_out_318041.awb") / 1000

					if var_86_27 + var_86_18 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_27 + var_86_18
					end

					if var_86_22.prefab_name ~= "" and arg_83_1.actors_[var_86_22.prefab_name] ~= nil then
						local var_86_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_22.prefab_name].transform, "story_v_out_318041", "318041020", "story_v_out_318041.awb")

						arg_83_1:RecordAudio("318041020", var_86_28)
						arg_83_1:RecordAudio("318041020", var_86_28)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_318041", "318041020", "story_v_out_318041.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_318041", "318041020", "story_v_out_318041.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_29 = var_86_18 + 0.3
			local var_86_30 = math.max(var_86_19, arg_83_1.talkMaxDuration)

			if var_86_29 <= arg_83_1.time_ and arg_83_1.time_ < var_86_29 + var_86_30 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_29) / var_86_30

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_29 + var_86_30 and arg_83_1.time_ < var_86_29 + var_86_30 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play318041021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 318041021
		arg_89_1.duration_ = 3.933

		local var_89_0 = {
			zh = 2.166,
			ja = 3.933
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
				arg_89_0:Play318041022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1050ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1050ui_story == nil then
				arg_89_1.var_.characterEffect1050ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1050ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1050ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1050ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1050ui_story.fillRatio = var_92_5
			end

			local var_92_6 = 0
			local var_92_7 = 0.225

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_8 = arg_89_1:FormatText(StoryNameCfg[637].name)

				arg_89_1.leftNameTxt_.text = var_92_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, true)
				arg_89_1.iconController_:SetSelectedState("hero")

				arg_89_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_9 = arg_89_1:GetWordFromCfg(318041021)
				local var_92_10 = arg_89_1:FormatText(var_92_9.content)

				arg_89_1.text_.text = var_92_10

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_11 = 9
				local var_92_12 = utf8.len(var_92_10)
				local var_92_13 = var_92_11 <= 0 and var_92_7 or var_92_7 * (var_92_12 / var_92_11)

				if var_92_13 > 0 and var_92_7 < var_92_13 then
					arg_89_1.talkMaxDuration = var_92_13

					if var_92_13 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_13 + var_92_6
					end
				end

				arg_89_1.text_.text = var_92_10
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041021", "story_v_out_318041.awb") ~= 0 then
					local var_92_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041021", "story_v_out_318041.awb") / 1000

					if var_92_14 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_14 + var_92_6
					end

					if var_92_9.prefab_name ~= "" and arg_89_1.actors_[var_92_9.prefab_name] ~= nil then
						local var_92_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_9.prefab_name].transform, "story_v_out_318041", "318041021", "story_v_out_318041.awb")

						arg_89_1:RecordAudio("318041021", var_92_15)
						arg_89_1:RecordAudio("318041021", var_92_15)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_318041", "318041021", "story_v_out_318041.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_318041", "318041021", "story_v_out_318041.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_16 = math.max(var_92_7, arg_89_1.talkMaxDuration)

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_16 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_6) / var_92_16

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_6 + var_92_16 and arg_89_1.time_ < var_92_6 + var_92_16 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play318041022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 318041022
		arg_93_1.duration_ = 1.3

		local var_93_0 = {
			zh = 0.999999999999,
			ja = 1.3
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
				arg_93_0:Play318041023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1050ui_story"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1050ui_story = var_96_0.localPosition
			end

			local var_96_2 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2
				local var_96_4 = Vector3.New(0, -1, -6.1)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1050ui_story, var_96_4, var_96_3)

				local var_96_5 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_5.x, var_96_5.y, var_96_5.z)

				local var_96_6 = var_96_0.localEulerAngles

				var_96_6.z = 0
				var_96_6.x = 0
				var_96_0.localEulerAngles = var_96_6
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_96_7 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_7.x, var_96_7.y, var_96_7.z)

				local var_96_8 = var_96_0.localEulerAngles

				var_96_8.z = 0
				var_96_8.x = 0
				var_96_0.localEulerAngles = var_96_8
			end

			local var_96_9 = arg_93_1.actors_["1050ui_story"]
			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 and arg_93_1.var_.characterEffect1050ui_story == nil then
				arg_93_1.var_.characterEffect1050ui_story = var_96_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_11 = 0.200000002980232

			if var_96_10 <= arg_93_1.time_ and arg_93_1.time_ < var_96_10 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_10) / var_96_11

				if arg_93_1.var_.characterEffect1050ui_story then
					arg_93_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_10 + var_96_11 and arg_93_1.time_ < var_96_10 + var_96_11 + arg_96_0 and arg_93_1.var_.characterEffect1050ui_story then
				arg_93_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_96_13 = 0
			local var_96_14 = 0.433333333333333

			if var_96_13 < arg_93_1.time_ and arg_93_1.time_ <= var_96_13 + arg_96_0 then
				local var_96_15 = "play"
				local var_96_16 = "effect"

				arg_93_1:AudioAction(var_96_15, var_96_16, "se_story_side_1199", "se_story_1199_whooshfinsh", "")
			end

			local var_96_17 = 0
			local var_96_18 = 0.05

			if var_96_17 < arg_93_1.time_ and arg_93_1.time_ <= var_96_17 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_19 = arg_93_1:FormatText(StoryNameCfg[74].name)

				arg_93_1.leftNameTxt_.text = var_96_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_20 = arg_93_1:GetWordFromCfg(318041022)
				local var_96_21 = arg_93_1:FormatText(var_96_20.content)

				arg_93_1.text_.text = var_96_21

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_22 = 2
				local var_96_23 = utf8.len(var_96_21)
				local var_96_24 = var_96_22 <= 0 and var_96_18 or var_96_18 * (var_96_23 / var_96_22)

				if var_96_24 > 0 and var_96_18 < var_96_24 then
					arg_93_1.talkMaxDuration = var_96_24

					if var_96_24 + var_96_17 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_24 + var_96_17
					end
				end

				arg_93_1.text_.text = var_96_21
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041022", "story_v_out_318041.awb") ~= 0 then
					local var_96_25 = manager.audio:GetVoiceLength("story_v_out_318041", "318041022", "story_v_out_318041.awb") / 1000

					if var_96_25 + var_96_17 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_25 + var_96_17
					end

					if var_96_20.prefab_name ~= "" and arg_93_1.actors_[var_96_20.prefab_name] ~= nil then
						local var_96_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_20.prefab_name].transform, "story_v_out_318041", "318041022", "story_v_out_318041.awb")

						arg_93_1:RecordAudio("318041022", var_96_26)
						arg_93_1:RecordAudio("318041022", var_96_26)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_318041", "318041022", "story_v_out_318041.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_318041", "318041022", "story_v_out_318041.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_27 = math.max(var_96_18, arg_93_1.talkMaxDuration)

			if var_96_17 <= arg_93_1.time_ and arg_93_1.time_ < var_96_17 + var_96_27 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_17) / var_96_27

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_17 + var_96_27 and arg_93_1.time_ < var_96_17 + var_96_27 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play318041023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 318041023
		arg_97_1.duration_ = 6.466

		local var_97_0 = {
			zh = 3.6,
			ja = 6.466
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
				arg_97_0:Play318041024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1050ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1050ui_story == nil then
				arg_97_1.var_.characterEffect1050ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1050ui_story then
					local var_100_4 = Mathf.Lerp(0, 0.5, var_100_3)

					arg_97_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1050ui_story.fillRatio = var_100_4
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1050ui_story then
				local var_100_5 = 0.5

				arg_97_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1050ui_story.fillRatio = var_100_5
			end

			local var_100_6 = 0
			local var_100_7 = 0.4

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_8 = arg_97_1:FormatText(StoryNameCfg[637].name)

				arg_97_1.leftNameTxt_.text = var_100_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_9 = arg_97_1:GetWordFromCfg(318041023)
				local var_100_10 = arg_97_1:FormatText(var_100_9.content)

				arg_97_1.text_.text = var_100_10

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_11 = 17
				local var_100_12 = utf8.len(var_100_10)
				local var_100_13 = var_100_11 <= 0 and var_100_7 or var_100_7 * (var_100_12 / var_100_11)

				if var_100_13 > 0 and var_100_7 < var_100_13 then
					arg_97_1.talkMaxDuration = var_100_13

					if var_100_13 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_13 + var_100_6
					end
				end

				arg_97_1.text_.text = var_100_10
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041023", "story_v_out_318041.awb") ~= 0 then
					local var_100_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041023", "story_v_out_318041.awb") / 1000

					if var_100_14 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_14 + var_100_6
					end

					if var_100_9.prefab_name ~= "" and arg_97_1.actors_[var_100_9.prefab_name] ~= nil then
						local var_100_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_9.prefab_name].transform, "story_v_out_318041", "318041023", "story_v_out_318041.awb")

						arg_97_1:RecordAudio("318041023", var_100_15)
						arg_97_1:RecordAudio("318041023", var_100_15)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_318041", "318041023", "story_v_out_318041.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_318041", "318041023", "story_v_out_318041.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_16 = math.max(var_100_7, arg_97_1.talkMaxDuration)

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_16 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_6) / var_100_16

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_6 + var_100_16 and arg_97_1.time_ < var_100_6 + var_100_16 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play318041024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 318041024
		arg_101_1.duration_ = 3.733

		local var_101_0 = {
			zh = 3.733,
			ja = 1.833
		}
		local var_101_1 = manager.audio:GetLocalizationFlag()

		if var_101_0[var_101_1] ~= nil then
			arg_101_1.duration_ = var_101_0[var_101_1]
		end

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play318041025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1050ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1050ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0, 100, 0)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1050ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, 100, 0)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["1050ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect1050ui_story == nil then
				arg_101_1.var_.characterEffect1050ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect1050ui_story then
					arg_101_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect1050ui_story then
				arg_101_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_104_13 = 0
			local var_104_14 = 0.433333333333333

			if var_104_13 < arg_101_1.time_ and arg_101_1.time_ <= var_104_13 + arg_104_0 then
				local var_104_15 = "play"
				local var_104_16 = "effect"

				arg_101_1:AudioAction(var_104_15, var_104_16, "se_story_side_1199", "se_story_1199_whooshfinsh", "")
			end

			local var_104_17 = manager.ui.mainCamera.transform
			local var_104_18 = 0

			if var_104_18 < arg_101_1.time_ and arg_101_1.time_ <= var_104_18 + arg_104_0 then
				arg_101_1.var_.shakeOldPos = var_104_17.localPosition
			end

			local var_104_19 = 0.5

			if var_104_18 <= arg_101_1.time_ and arg_101_1.time_ < var_104_18 + var_104_19 then
				local var_104_20 = (arg_101_1.time_ - var_104_18) / 0.066
				local var_104_21, var_104_22 = math.modf(var_104_20)

				var_104_17.localPosition = Vector3.New(var_104_22 * 0.13, var_104_22 * 0.13, var_104_22 * 0.13) + arg_101_1.var_.shakeOldPos
			end

			if arg_101_1.time_ >= var_104_18 + var_104_19 and arg_101_1.time_ < var_104_18 + var_104_19 + arg_104_0 then
				var_104_17.localPosition = arg_101_1.var_.shakeOldPos
			end

			local var_104_23 = 0

			if var_104_23 < arg_101_1.time_ and arg_101_1.time_ <= var_104_23 + arg_104_0 then
				arg_101_1.allBtn_.enabled = false
			end

			local var_104_24 = 0.5

			if arg_101_1.time_ >= var_104_23 + var_104_24 and arg_101_1.time_ < var_104_23 + var_104_24 + arg_104_0 then
				arg_101_1.allBtn_.enabled = true
			end

			local var_104_25 = 0
			local var_104_26 = 0.1

			if var_104_25 < arg_101_1.time_ and arg_101_1.time_ <= var_104_25 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_27 = arg_101_1:FormatText(StoryNameCfg[74].name)

				arg_101_1.leftNameTxt_.text = var_104_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_28 = arg_101_1:GetWordFromCfg(318041024)
				local var_104_29 = arg_101_1:FormatText(var_104_28.content)

				arg_101_1.text_.text = var_104_29

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_30 = 4
				local var_104_31 = utf8.len(var_104_29)
				local var_104_32 = var_104_30 <= 0 and var_104_26 or var_104_26 * (var_104_31 / var_104_30)

				if var_104_32 > 0 and var_104_26 < var_104_32 then
					arg_101_1.talkMaxDuration = var_104_32

					if var_104_32 + var_104_25 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_32 + var_104_25
					end
				end

				arg_101_1.text_.text = var_104_29
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041024", "story_v_out_318041.awb") ~= 0 then
					local var_104_33 = manager.audio:GetVoiceLength("story_v_out_318041", "318041024", "story_v_out_318041.awb") / 1000

					if var_104_33 + var_104_25 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_33 + var_104_25
					end

					if var_104_28.prefab_name ~= "" and arg_101_1.actors_[var_104_28.prefab_name] ~= nil then
						local var_104_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_28.prefab_name].transform, "story_v_out_318041", "318041024", "story_v_out_318041.awb")

						arg_101_1:RecordAudio("318041024", var_104_34)
						arg_101_1:RecordAudio("318041024", var_104_34)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_318041", "318041024", "story_v_out_318041.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_318041", "318041024", "story_v_out_318041.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_35 = math.max(var_104_26, arg_101_1.talkMaxDuration)

			if var_104_25 <= arg_101_1.time_ and arg_101_1.time_ < var_104_25 + var_104_35 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_25) / var_104_35

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_25 + var_104_35 and arg_101_1.time_ < var_104_25 + var_104_35 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play318041025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 318041025
		arg_105_1.duration_ = 7.4

		local var_105_0 = {
			zh = 5.4,
			ja = 7.4
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
				arg_105_0:Play318041026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1050ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1050ui_story == nil then
				arg_105_1.var_.characterEffect1050ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1050ui_story then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1050ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1050ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1050ui_story.fillRatio = var_108_5
			end

			local var_108_6 = 0
			local var_108_7 = 0.425

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_8 = arg_105_1:FormatText(StoryNameCfg[637].name)

				arg_105_1.leftNameTxt_.text = var_108_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, true)
				arg_105_1.iconController_:SetSelectedState("hero")

				arg_105_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_9 = arg_105_1:GetWordFromCfg(318041025)
				local var_108_10 = arg_105_1:FormatText(var_108_9.content)

				arg_105_1.text_.text = var_108_10

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_11 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041025", "story_v_out_318041.awb") ~= 0 then
					local var_108_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041025", "story_v_out_318041.awb") / 1000

					if var_108_14 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_14 + var_108_6
					end

					if var_108_9.prefab_name ~= "" and arg_105_1.actors_[var_108_9.prefab_name] ~= nil then
						local var_108_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_9.prefab_name].transform, "story_v_out_318041", "318041025", "story_v_out_318041.awb")

						arg_105_1:RecordAudio("318041025", var_108_15)
						arg_105_1:RecordAudio("318041025", var_108_15)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_318041", "318041025", "story_v_out_318041.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_318041", "318041025", "story_v_out_318041.awb")
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
	Play318041026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 318041026
		arg_109_1.duration_ = 1.999999999999

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play318041027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1050ui_story"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1050ui_story = var_112_0.localPosition

				local var_112_2 = "1050ui_story"

				arg_109_1:ShowWeapon(arg_109_1.var_[var_112_2 .. "Animator"].transform, false)
			end

			local var_112_3 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_3 then
				local var_112_4 = (arg_109_1.time_ - var_112_1) / var_112_3
				local var_112_5 = Vector3.New(0, -1, -6.1)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1050ui_story, var_112_5, var_112_4)

				local var_112_6 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_6.x, var_112_6.y, var_112_6.z)

				local var_112_7 = var_112_0.localEulerAngles

				var_112_7.z = 0
				var_112_7.x = 0
				var_112_0.localEulerAngles = var_112_7
			end

			if arg_109_1.time_ >= var_112_1 + var_112_3 and arg_109_1.time_ < var_112_1 + var_112_3 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_112_8 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_8.x, var_112_8.y, var_112_8.z)

				local var_112_9 = var_112_0.localEulerAngles

				var_112_9.z = 0
				var_112_9.x = 0
				var_112_0.localEulerAngles = var_112_9
			end

			local var_112_10 = arg_109_1.actors_["1050ui_story"]
			local var_112_11 = 0

			if var_112_11 < arg_109_1.time_ and arg_109_1.time_ <= var_112_11 + arg_112_0 and arg_109_1.var_.characterEffect1050ui_story == nil then
				arg_109_1.var_.characterEffect1050ui_story = var_112_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_12 = 0.200000002980232

			if var_112_11 <= arg_109_1.time_ and arg_109_1.time_ < var_112_11 + var_112_12 then
				local var_112_13 = (arg_109_1.time_ - var_112_11) / var_112_12

				if arg_109_1.var_.characterEffect1050ui_story then
					arg_109_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_11 + var_112_12 and arg_109_1.time_ < var_112_11 + var_112_12 + arg_112_0 and arg_109_1.var_.characterEffect1050ui_story then
				arg_109_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 then
				arg_109_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_112_15 = 0

			if var_112_15 < arg_109_1.time_ and arg_109_1.time_ <= var_112_15 + arg_112_0 then
				arg_109_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_112_16 = 0
			local var_112_17 = 0.1

			if var_112_16 < arg_109_1.time_ and arg_109_1.time_ <= var_112_16 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_18 = arg_109_1:FormatText(StoryNameCfg[74].name)

				arg_109_1.leftNameTxt_.text = var_112_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_19 = arg_109_1:GetWordFromCfg(318041026)
				local var_112_20 = arg_109_1:FormatText(var_112_19.content)

				arg_109_1.text_.text = var_112_20

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_21 = 4
				local var_112_22 = utf8.len(var_112_20)
				local var_112_23 = var_112_21 <= 0 and var_112_17 or var_112_17 * (var_112_22 / var_112_21)

				if var_112_23 > 0 and var_112_17 < var_112_23 then
					arg_109_1.talkMaxDuration = var_112_23

					if var_112_23 + var_112_16 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_23 + var_112_16
					end
				end

				arg_109_1.text_.text = var_112_20
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041026", "story_v_out_318041.awb") ~= 0 then
					local var_112_24 = manager.audio:GetVoiceLength("story_v_out_318041", "318041026", "story_v_out_318041.awb") / 1000

					if var_112_24 + var_112_16 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_24 + var_112_16
					end

					if var_112_19.prefab_name ~= "" and arg_109_1.actors_[var_112_19.prefab_name] ~= nil then
						local var_112_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_19.prefab_name].transform, "story_v_out_318041", "318041026", "story_v_out_318041.awb")

						arg_109_1:RecordAudio("318041026", var_112_25)
						arg_109_1:RecordAudio("318041026", var_112_25)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_318041", "318041026", "story_v_out_318041.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_318041", "318041026", "story_v_out_318041.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_26 = math.max(var_112_17, arg_109_1.talkMaxDuration)

			if var_112_16 <= arg_109_1.time_ and arg_109_1.time_ < var_112_16 + var_112_26 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_16) / var_112_26

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_16 + var_112_26 and arg_109_1.time_ < var_112_16 + var_112_26 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play318041027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 318041027
		arg_113_1.duration_ = 12.9

		local var_113_0 = {
			zh = 5.5,
			ja = 12.9
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
				arg_113_0:Play318041028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1050ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1050ui_story == nil then
				arg_113_1.var_.characterEffect1050ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1050ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1050ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1050ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1050ui_story.fillRatio = var_116_5
			end

			local var_116_6 = 0
			local var_116_7 = 0.525

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_8 = arg_113_1:FormatText(StoryNameCfg[637].name)

				arg_113_1.leftNameTxt_.text = var_116_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, true)
				arg_113_1.iconController_:SetSelectedState("hero")

				arg_113_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_9 = arg_113_1:GetWordFromCfg(318041027)
				local var_116_10 = arg_113_1:FormatText(var_116_9.content)

				arg_113_1.text_.text = var_116_10

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_11 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041027", "story_v_out_318041.awb") ~= 0 then
					local var_116_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041027", "story_v_out_318041.awb") / 1000

					if var_116_14 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_14 + var_116_6
					end

					if var_116_9.prefab_name ~= "" and arg_113_1.actors_[var_116_9.prefab_name] ~= nil then
						local var_116_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_9.prefab_name].transform, "story_v_out_318041", "318041027", "story_v_out_318041.awb")

						arg_113_1:RecordAudio("318041027", var_116_15)
						arg_113_1:RecordAudio("318041027", var_116_15)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_318041", "318041027", "story_v_out_318041.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_318041", "318041027", "story_v_out_318041.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_16 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_16 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_16

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_16 and arg_113_1.time_ < var_116_6 + var_116_16 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play318041028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 318041028
		arg_117_1.duration_ = 4.6

		local var_117_0 = {
			zh = 4.6,
			ja = 3.5
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
				arg_117_0:Play318041029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1050ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1050ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0, -1, -6.1)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1050ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["1050ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and arg_117_1.var_.characterEffect1050ui_story == nil then
				arg_117_1.var_.characterEffect1050ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect1050ui_story then
					arg_117_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and arg_117_1.var_.characterEffect1050ui_story then
				arg_117_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_120_13 = 0

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_2")
			end

			local var_120_15 = 0
			local var_120_16 = 0.325

			if var_120_15 < arg_117_1.time_ and arg_117_1.time_ <= var_120_15 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_17 = arg_117_1:FormatText(StoryNameCfg[74].name)

				arg_117_1.leftNameTxt_.text = var_120_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_18 = arg_117_1:GetWordFromCfg(318041028)
				local var_120_19 = arg_117_1:FormatText(var_120_18.content)

				arg_117_1.text_.text = var_120_19

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_20 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041028", "story_v_out_318041.awb") ~= 0 then
					local var_120_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041028", "story_v_out_318041.awb") / 1000

					if var_120_23 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_23 + var_120_15
					end

					if var_120_18.prefab_name ~= "" and arg_117_1.actors_[var_120_18.prefab_name] ~= nil then
						local var_120_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_18.prefab_name].transform, "story_v_out_318041", "318041028", "story_v_out_318041.awb")

						arg_117_1:RecordAudio("318041028", var_120_24)
						arg_117_1:RecordAudio("318041028", var_120_24)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_318041", "318041028", "story_v_out_318041.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_318041", "318041028", "story_v_out_318041.awb")
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
	Play318041029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 318041029
		arg_121_1.duration_ = 2.466

		local var_121_0 = {
			zh = 1.3,
			ja = 2.466
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
				arg_121_0:Play318041030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1050ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect1050ui_story == nil then
				arg_121_1.var_.characterEffect1050ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.200000002980232

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1050ui_story then
					local var_124_4 = Mathf.Lerp(0, 0.5, var_124_3)

					arg_121_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1050ui_story.fillRatio = var_124_4
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1050ui_story then
				local var_124_5 = 0.5

				arg_121_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1050ui_story.fillRatio = var_124_5
			end

			local var_124_6 = 0
			local var_124_7 = 0.125

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_8 = arg_121_1:FormatText(StoryNameCfg[637].name)

				arg_121_1.leftNameTxt_.text = var_124_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_9 = arg_121_1:GetWordFromCfg(318041029)
				local var_124_10 = arg_121_1:FormatText(var_124_9.content)

				arg_121_1.text_.text = var_124_10

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_11 = 5
				local var_124_12 = utf8.len(var_124_10)
				local var_124_13 = var_124_11 <= 0 and var_124_7 or var_124_7 * (var_124_12 / var_124_11)

				if var_124_13 > 0 and var_124_7 < var_124_13 then
					arg_121_1.talkMaxDuration = var_124_13

					if var_124_13 + var_124_6 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_13 + var_124_6
					end
				end

				arg_121_1.text_.text = var_124_10
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041029", "story_v_out_318041.awb") ~= 0 then
					local var_124_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041029", "story_v_out_318041.awb") / 1000

					if var_124_14 + var_124_6 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_14 + var_124_6
					end

					if var_124_9.prefab_name ~= "" and arg_121_1.actors_[var_124_9.prefab_name] ~= nil then
						local var_124_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_9.prefab_name].transform, "story_v_out_318041", "318041029", "story_v_out_318041.awb")

						arg_121_1:RecordAudio("318041029", var_124_15)
						arg_121_1:RecordAudio("318041029", var_124_15)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_318041", "318041029", "story_v_out_318041.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_318041", "318041029", "story_v_out_318041.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_16 = math.max(var_124_7, arg_121_1.talkMaxDuration)

			if var_124_6 <= arg_121_1.time_ and arg_121_1.time_ < var_124_6 + var_124_16 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_6) / var_124_16

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_6 + var_124_16 and arg_121_1.time_ < var_124_6 + var_124_16 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play318041030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 318041030
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play318041031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1050ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1050ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(0, 100, 0)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1050ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(0, 100, 0)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = arg_125_1.actors_["1050ui_story"]
			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 and arg_125_1.var_.characterEffect1050ui_story == nil then
				arg_125_1.var_.characterEffect1050ui_story = var_128_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_11 = 0.200000002980232

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_11 then
				local var_128_12 = (arg_125_1.time_ - var_128_10) / var_128_11

				if arg_125_1.var_.characterEffect1050ui_story then
					local var_128_13 = Mathf.Lerp(0, 0.5, var_128_12)

					arg_125_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1050ui_story.fillRatio = var_128_13
				end
			end

			if arg_125_1.time_ >= var_128_10 + var_128_11 and arg_125_1.time_ < var_128_10 + var_128_11 + arg_128_0 and arg_125_1.var_.characterEffect1050ui_story then
				local var_128_14 = 0.5

				arg_125_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1050ui_story.fillRatio = var_128_14
			end

			local var_128_15 = 0
			local var_128_16 = 1.375

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_17 = arg_125_1:GetWordFromCfg(318041030)
				local var_128_18 = arg_125_1:FormatText(var_128_17.content)

				arg_125_1.text_.text = var_128_18

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_19 = 55
				local var_128_20 = utf8.len(var_128_18)
				local var_128_21 = var_128_19 <= 0 and var_128_16 or var_128_16 * (var_128_20 / var_128_19)

				if var_128_21 > 0 and var_128_16 < var_128_21 then
					arg_125_1.talkMaxDuration = var_128_21

					if var_128_21 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_21 + var_128_15
					end
				end

				arg_125_1.text_.text = var_128_18
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_22 = math.max(var_128_16, arg_125_1.talkMaxDuration)

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_22 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_15) / var_128_22

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_15 + var_128_22 and arg_125_1.time_ < var_128_15 + var_128_22 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play318041031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 318041031
		arg_129_1.duration_ = 3.2

		local var_129_0 = {
			zh = 1.999999999999,
			ja = 3.2
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
				arg_129_0:Play318041032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1050ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1050ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, -1, -6.1)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1050ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1050ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1050ui_story == nil then
				arg_129_1.var_.characterEffect1050ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1050ui_story then
					arg_129_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect1050ui_story then
				arg_129_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_132_15 = 0
			local var_132_16 = 0.225

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_17 = arg_129_1:FormatText(StoryNameCfg[74].name)

				arg_129_1.leftNameTxt_.text = var_132_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_18 = arg_129_1:GetWordFromCfg(318041031)
				local var_132_19 = arg_129_1:FormatText(var_132_18.content)

				arg_129_1.text_.text = var_132_19

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_20 = 9
				local var_132_21 = utf8.len(var_132_19)
				local var_132_22 = var_132_20 <= 0 and var_132_16 or var_132_16 * (var_132_21 / var_132_20)

				if var_132_22 > 0 and var_132_16 < var_132_22 then
					arg_129_1.talkMaxDuration = var_132_22

					if var_132_22 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_22 + var_132_15
					end
				end

				arg_129_1.text_.text = var_132_19
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041031", "story_v_out_318041.awb") ~= 0 then
					local var_132_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041031", "story_v_out_318041.awb") / 1000

					if var_132_23 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_23 + var_132_15
					end

					if var_132_18.prefab_name ~= "" and arg_129_1.actors_[var_132_18.prefab_name] ~= nil then
						local var_132_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_18.prefab_name].transform, "story_v_out_318041", "318041031", "story_v_out_318041.awb")

						arg_129_1:RecordAudio("318041031", var_132_24)
						arg_129_1:RecordAudio("318041031", var_132_24)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_318041", "318041031", "story_v_out_318041.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_318041", "318041031", "story_v_out_318041.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_25 = math.max(var_132_16, arg_129_1.talkMaxDuration)

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_25 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_15) / var_132_25

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_15 + var_132_25 and arg_129_1.time_ < var_132_15 + var_132_25 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play318041032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 318041032
		arg_133_1.duration_ = 5.066

		local var_133_0 = {
			zh = 2.666,
			ja = 5.066
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
				arg_133_0:Play318041033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1050ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1050ui_story == nil then
				arg_133_1.var_.characterEffect1050ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1050ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1050ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1050ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1050ui_story.fillRatio = var_136_5
			end

			local var_136_6 = 0
			local var_136_7 = 0.275

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_8 = arg_133_1:FormatText(StoryNameCfg[637].name)

				arg_133_1.leftNameTxt_.text = var_136_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, true)
				arg_133_1.iconController_:SetSelectedState("hero")

				arg_133_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_9 = arg_133_1:GetWordFromCfg(318041032)
				local var_136_10 = arg_133_1:FormatText(var_136_9.content)

				arg_133_1.text_.text = var_136_10

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_11 = 11
				local var_136_12 = utf8.len(var_136_10)
				local var_136_13 = var_136_11 <= 0 and var_136_7 or var_136_7 * (var_136_12 / var_136_11)

				if var_136_13 > 0 and var_136_7 < var_136_13 then
					arg_133_1.talkMaxDuration = var_136_13

					if var_136_13 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_13 + var_136_6
					end
				end

				arg_133_1.text_.text = var_136_10
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041032", "story_v_out_318041.awb") ~= 0 then
					local var_136_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041032", "story_v_out_318041.awb") / 1000

					if var_136_14 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_14 + var_136_6
					end

					if var_136_9.prefab_name ~= "" and arg_133_1.actors_[var_136_9.prefab_name] ~= nil then
						local var_136_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_9.prefab_name].transform, "story_v_out_318041", "318041032", "story_v_out_318041.awb")

						arg_133_1:RecordAudio("318041032", var_136_15)
						arg_133_1:RecordAudio("318041032", var_136_15)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_318041", "318041032", "story_v_out_318041.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_318041", "318041032", "story_v_out_318041.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_16 = math.max(var_136_7, arg_133_1.talkMaxDuration)

			if var_136_6 <= arg_133_1.time_ and arg_133_1.time_ < var_136_6 + var_136_16 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_6) / var_136_16

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_6 + var_136_16 and arg_133_1.time_ < var_136_6 + var_136_16 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play318041033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 318041033
		arg_137_1.duration_ = 10.233

		local var_137_0 = {
			zh = 10.233,
			ja = 7.966
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
				arg_137_0:Play318041034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 1.05

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[637].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(318041033)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041033", "story_v_out_318041.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041033", "story_v_out_318041.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_318041", "318041033", "story_v_out_318041.awb")

						arg_137_1:RecordAudio("318041033", var_140_9)
						arg_137_1:RecordAudio("318041033", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_318041", "318041033", "story_v_out_318041.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_318041", "318041033", "story_v_out_318041.awb")
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
	Play318041034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 318041034
		arg_141_1.duration_ = 6.666

		local var_141_0 = {
			zh = 6.666,
			ja = 4.433
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
				arg_141_0:Play318041035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.7

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[637].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, true)
				arg_141_1.iconController_:SetSelectedState("hero")

				arg_141_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(318041034)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 28
				local var_144_6 = utf8.len(var_144_4)
				local var_144_7 = var_144_5 <= 0 and var_144_1 or var_144_1 * (var_144_6 / var_144_5)

				if var_144_7 > 0 and var_144_1 < var_144_7 then
					arg_141_1.talkMaxDuration = var_144_7

					if var_144_7 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_7 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_4
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041034", "story_v_out_318041.awb") ~= 0 then
					local var_144_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041034", "story_v_out_318041.awb") / 1000

					if var_144_8 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_0
					end

					if var_144_3.prefab_name ~= "" and arg_141_1.actors_[var_144_3.prefab_name] ~= nil then
						local var_144_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_3.prefab_name].transform, "story_v_out_318041", "318041034", "story_v_out_318041.awb")

						arg_141_1:RecordAudio("318041034", var_144_9)
						arg_141_1:RecordAudio("318041034", var_144_9)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_318041", "318041034", "story_v_out_318041.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_318041", "318041034", "story_v_out_318041.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_10 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_10 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_10

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_10 and arg_141_1.time_ < var_144_0 + var_144_10 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play318041035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 318041035
		arg_145_1.duration_ = 4.933

		local var_145_0 = {
			zh = 2.766,
			ja = 4.933
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
				arg_145_0:Play318041036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1050ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1050ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(0, -1, -6.1)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1050ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = arg_145_1.actors_["1050ui_story"]
			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 and arg_145_1.var_.characterEffect1050ui_story == nil then
				arg_145_1.var_.characterEffect1050ui_story = var_148_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_11 = 0.200000002980232

			if var_148_10 <= arg_145_1.time_ and arg_145_1.time_ < var_148_10 + var_148_11 then
				local var_148_12 = (arg_145_1.time_ - var_148_10) / var_148_11

				if arg_145_1.var_.characterEffect1050ui_story then
					arg_145_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_10 + var_148_11 and arg_145_1.time_ < var_148_10 + var_148_11 + arg_148_0 and arg_145_1.var_.characterEffect1050ui_story then
				arg_145_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_148_13 = 0

			if var_148_13 < arg_145_1.time_ and arg_145_1.time_ <= var_148_13 + arg_148_0 then
				arg_145_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_148_14 = 0

			if var_148_14 < arg_145_1.time_ and arg_145_1.time_ <= var_148_14 + arg_148_0 then
				arg_145_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_148_15 = 0
			local var_148_16 = 0.35

			if var_148_15 < arg_145_1.time_ and arg_145_1.time_ <= var_148_15 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_17 = arg_145_1:FormatText(StoryNameCfg[74].name)

				arg_145_1.leftNameTxt_.text = var_148_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_18 = arg_145_1:GetWordFromCfg(318041035)
				local var_148_19 = arg_145_1:FormatText(var_148_18.content)

				arg_145_1.text_.text = var_148_19

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_20 = 14
				local var_148_21 = utf8.len(var_148_19)
				local var_148_22 = var_148_20 <= 0 and var_148_16 or var_148_16 * (var_148_21 / var_148_20)

				if var_148_22 > 0 and var_148_16 < var_148_22 then
					arg_145_1.talkMaxDuration = var_148_22

					if var_148_22 + var_148_15 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_22 + var_148_15
					end
				end

				arg_145_1.text_.text = var_148_19
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041035", "story_v_out_318041.awb") ~= 0 then
					local var_148_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041035", "story_v_out_318041.awb") / 1000

					if var_148_23 + var_148_15 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_23 + var_148_15
					end

					if var_148_18.prefab_name ~= "" and arg_145_1.actors_[var_148_18.prefab_name] ~= nil then
						local var_148_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_18.prefab_name].transform, "story_v_out_318041", "318041035", "story_v_out_318041.awb")

						arg_145_1:RecordAudio("318041035", var_148_24)
						arg_145_1:RecordAudio("318041035", var_148_24)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_318041", "318041035", "story_v_out_318041.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_318041", "318041035", "story_v_out_318041.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_25 = math.max(var_148_16, arg_145_1.talkMaxDuration)

			if var_148_15 <= arg_145_1.time_ and arg_145_1.time_ < var_148_15 + var_148_25 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_15) / var_148_25

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_15 + var_148_25 and arg_145_1.time_ < var_148_15 + var_148_25 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play318041036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 318041036
		arg_149_1.duration_ = 3.633

		local var_149_0 = {
			zh = 3.633,
			ja = 3.1
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
				arg_149_0:Play318041037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1050ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1050ui_story == nil then
				arg_149_1.var_.characterEffect1050ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1050ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1050ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1050ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1050ui_story.fillRatio = var_152_5
			end

			local var_152_6 = 0
			local var_152_7 = 0.25

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_8 = arg_149_1:FormatText(StoryNameCfg[637].name)

				arg_149_1.leftNameTxt_.text = var_152_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_9 = arg_149_1:GetWordFromCfg(318041036)
				local var_152_10 = arg_149_1:FormatText(var_152_9.content)

				arg_149_1.text_.text = var_152_10

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_11 = 10
				local var_152_12 = utf8.len(var_152_10)
				local var_152_13 = var_152_11 <= 0 and var_152_7 or var_152_7 * (var_152_12 / var_152_11)

				if var_152_13 > 0 and var_152_7 < var_152_13 then
					arg_149_1.talkMaxDuration = var_152_13

					if var_152_13 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_13 + var_152_6
					end
				end

				arg_149_1.text_.text = var_152_10
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041036", "story_v_out_318041.awb") ~= 0 then
					local var_152_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041036", "story_v_out_318041.awb") / 1000

					if var_152_14 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_14 + var_152_6
					end

					if var_152_9.prefab_name ~= "" and arg_149_1.actors_[var_152_9.prefab_name] ~= nil then
						local var_152_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_9.prefab_name].transform, "story_v_out_318041", "318041036", "story_v_out_318041.awb")

						arg_149_1:RecordAudio("318041036", var_152_15)
						arg_149_1:RecordAudio("318041036", var_152_15)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_318041", "318041036", "story_v_out_318041.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_318041", "318041036", "story_v_out_318041.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_16 = math.max(var_152_7, arg_149_1.talkMaxDuration)

			if var_152_6 <= arg_149_1.time_ and arg_149_1.time_ < var_152_6 + var_152_16 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_6) / var_152_16

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_6 + var_152_16 and arg_149_1.time_ < var_152_6 + var_152_16 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play318041037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 318041037
		arg_153_1.duration_ = 9.3

		local var_153_0 = {
			zh = 7.933,
			ja = 9.3
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
				arg_153_0:Play318041038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1050ui_story"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1050ui_story = var_156_0.localPosition
			end

			local var_156_2 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2
				local var_156_4 = Vector3.New(0, -1, -6.1)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1050ui_story, var_156_4, var_156_3)

				local var_156_5 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_5.x, var_156_5.y, var_156_5.z)

				local var_156_6 = var_156_0.localEulerAngles

				var_156_6.z = 0
				var_156_6.x = 0
				var_156_0.localEulerAngles = var_156_6
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_156_7 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_7.x, var_156_7.y, var_156_7.z)

				local var_156_8 = var_156_0.localEulerAngles

				var_156_8.z = 0
				var_156_8.x = 0
				var_156_0.localEulerAngles = var_156_8
			end

			local var_156_9 = arg_153_1.actors_["1050ui_story"]
			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 and arg_153_1.var_.characterEffect1050ui_story == nil then
				arg_153_1.var_.characterEffect1050ui_story = var_156_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_11 = 0.200000002980232

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_11 then
				local var_156_12 = (arg_153_1.time_ - var_156_10) / var_156_11

				if arg_153_1.var_.characterEffect1050ui_story then
					arg_153_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_10 + var_156_11 and arg_153_1.time_ < var_156_10 + var_156_11 + arg_156_0 and arg_153_1.var_.characterEffect1050ui_story then
				arg_153_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_156_13 = 0
			local var_156_14 = 0.925

			if var_156_13 < arg_153_1.time_ and arg_153_1.time_ <= var_156_13 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_15 = arg_153_1:FormatText(StoryNameCfg[74].name)

				arg_153_1.leftNameTxt_.text = var_156_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_16 = arg_153_1:GetWordFromCfg(318041037)
				local var_156_17 = arg_153_1:FormatText(var_156_16.content)

				arg_153_1.text_.text = var_156_17

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_18 = 37
				local var_156_19 = utf8.len(var_156_17)
				local var_156_20 = var_156_18 <= 0 and var_156_14 or var_156_14 * (var_156_19 / var_156_18)

				if var_156_20 > 0 and var_156_14 < var_156_20 then
					arg_153_1.talkMaxDuration = var_156_20

					if var_156_20 + var_156_13 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_20 + var_156_13
					end
				end

				arg_153_1.text_.text = var_156_17
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041037", "story_v_out_318041.awb") ~= 0 then
					local var_156_21 = manager.audio:GetVoiceLength("story_v_out_318041", "318041037", "story_v_out_318041.awb") / 1000

					if var_156_21 + var_156_13 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_21 + var_156_13
					end

					if var_156_16.prefab_name ~= "" and arg_153_1.actors_[var_156_16.prefab_name] ~= nil then
						local var_156_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_16.prefab_name].transform, "story_v_out_318041", "318041037", "story_v_out_318041.awb")

						arg_153_1:RecordAudio("318041037", var_156_22)
						arg_153_1:RecordAudio("318041037", var_156_22)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_318041", "318041037", "story_v_out_318041.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_318041", "318041037", "story_v_out_318041.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_23 = math.max(var_156_14, arg_153_1.talkMaxDuration)

			if var_156_13 <= arg_153_1.time_ and arg_153_1.time_ < var_156_13 + var_156_23 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_13) / var_156_23

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_13 + var_156_23 and arg_153_1.time_ < var_156_13 + var_156_23 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play318041038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 318041038
		arg_157_1.duration_ = 3.033

		local var_157_0 = {
			zh = 3,
			ja = 3.033
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
				arg_157_0:Play318041039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1050ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1050ui_story == nil then
				arg_157_1.var_.characterEffect1050ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1050ui_story then
					local var_160_4 = Mathf.Lerp(0, 0.5, var_160_3)

					arg_157_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1050ui_story.fillRatio = var_160_4
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1050ui_story then
				local var_160_5 = 0.5

				arg_157_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1050ui_story.fillRatio = var_160_5
			end

			local var_160_6 = 0
			local var_160_7 = 0.3

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_8 = arg_157_1:FormatText(StoryNameCfg[637].name)

				arg_157_1.leftNameTxt_.text = var_160_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, true)
				arg_157_1.iconController_:SetSelectedState("hero")

				arg_157_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_9 = arg_157_1:GetWordFromCfg(318041038)
				local var_160_10 = arg_157_1:FormatText(var_160_9.content)

				arg_157_1.text_.text = var_160_10

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_11 = 12
				local var_160_12 = utf8.len(var_160_10)
				local var_160_13 = var_160_11 <= 0 and var_160_7 or var_160_7 * (var_160_12 / var_160_11)

				if var_160_13 > 0 and var_160_7 < var_160_13 then
					arg_157_1.talkMaxDuration = var_160_13

					if var_160_13 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_13 + var_160_6
					end
				end

				arg_157_1.text_.text = var_160_10
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041038", "story_v_out_318041.awb") ~= 0 then
					local var_160_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041038", "story_v_out_318041.awb") / 1000

					if var_160_14 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_14 + var_160_6
					end

					if var_160_9.prefab_name ~= "" and arg_157_1.actors_[var_160_9.prefab_name] ~= nil then
						local var_160_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_9.prefab_name].transform, "story_v_out_318041", "318041038", "story_v_out_318041.awb")

						arg_157_1:RecordAudio("318041038", var_160_15)
						arg_157_1:RecordAudio("318041038", var_160_15)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_318041", "318041038", "story_v_out_318041.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_318041", "318041038", "story_v_out_318041.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_16 = math.max(var_160_7, arg_157_1.talkMaxDuration)

			if var_160_6 <= arg_157_1.time_ and arg_157_1.time_ < var_160_6 + var_160_16 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_6) / var_160_16

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_6 + var_160_16 and arg_157_1.time_ < var_160_6 + var_160_16 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play318041039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 318041039
		arg_161_1.duration_ = 10.033

		local var_161_0 = {
			zh = 10.033,
			ja = 5.033
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
				arg_161_0:Play318041040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 1

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[637].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, true)
				arg_161_1.iconController_:SetSelectedState("hero")

				arg_161_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(318041039)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041039", "story_v_out_318041.awb") ~= 0 then
					local var_164_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041039", "story_v_out_318041.awb") / 1000

					if var_164_8 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_8 + var_164_0
					end

					if var_164_3.prefab_name ~= "" and arg_161_1.actors_[var_164_3.prefab_name] ~= nil then
						local var_164_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_3.prefab_name].transform, "story_v_out_318041", "318041039", "story_v_out_318041.awb")

						arg_161_1:RecordAudio("318041039", var_164_9)
						arg_161_1:RecordAudio("318041039", var_164_9)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_318041", "318041039", "story_v_out_318041.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_318041", "318041039", "story_v_out_318041.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_10 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_10 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_10

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_10 and arg_161_1.time_ < var_164_0 + var_164_10 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play318041040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 318041040
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play318041041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1050ui_story"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1050ui_story = var_168_0.localPosition
			end

			local var_168_2 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2
				local var_168_4 = Vector3.New(0, 100, 0)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1050ui_story, var_168_4, var_168_3)

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

			local var_168_9 = arg_165_1.actors_["1050ui_story"]
			local var_168_10 = 0

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 and arg_165_1.var_.characterEffect1050ui_story == nil then
				arg_165_1.var_.characterEffect1050ui_story = var_168_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_11 = 0.200000002980232

			if var_168_10 <= arg_165_1.time_ and arg_165_1.time_ < var_168_10 + var_168_11 then
				local var_168_12 = (arg_165_1.time_ - var_168_10) / var_168_11

				if arg_165_1.var_.characterEffect1050ui_story then
					local var_168_13 = Mathf.Lerp(0, 0.5, var_168_12)

					arg_165_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1050ui_story.fillRatio = var_168_13
				end
			end

			if arg_165_1.time_ >= var_168_10 + var_168_11 and arg_165_1.time_ < var_168_10 + var_168_11 + arg_168_0 and arg_165_1.var_.characterEffect1050ui_story then
				local var_168_14 = 0.5

				arg_165_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1050ui_story.fillRatio = var_168_14
			end

			local var_168_15 = 0
			local var_168_16 = 0.575

			if var_168_15 < arg_165_1.time_ and arg_165_1.time_ <= var_168_15 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_17 = arg_165_1:GetWordFromCfg(318041040)
				local var_168_18 = arg_165_1:FormatText(var_168_17.content)

				arg_165_1.text_.text = var_168_18

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_19 = 23
				local var_168_20 = utf8.len(var_168_18)
				local var_168_21 = var_168_19 <= 0 and var_168_16 or var_168_16 * (var_168_20 / var_168_19)

				if var_168_21 > 0 and var_168_16 < var_168_21 then
					arg_165_1.talkMaxDuration = var_168_21

					if var_168_21 + var_168_15 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_21 + var_168_15
					end
				end

				arg_165_1.text_.text = var_168_18
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_22 = math.max(var_168_16, arg_165_1.talkMaxDuration)

			if var_168_15 <= arg_165_1.time_ and arg_165_1.time_ < var_168_15 + var_168_22 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_15) / var_168_22

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_15 + var_168_22 and arg_165_1.time_ < var_168_15 + var_168_22 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play318041041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 318041041
		arg_169_1.duration_ = 9.2

		local var_169_0 = {
			zh = 6.4,
			ja = 9.2
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
				arg_169_0:Play318041042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1050ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1050ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, -1, -6.1)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1050ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["1050ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and arg_169_1.var_.characterEffect1050ui_story == nil then
				arg_169_1.var_.characterEffect1050ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect1050ui_story then
					arg_169_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect1050ui_story then
				arg_169_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_172_13 = 0

			if var_172_13 < arg_169_1.time_ and arg_169_1.time_ <= var_172_13 + arg_172_0 then
				arg_169_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_2")
			end

			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_172_15 = 0
			local var_172_16 = 0.775

			if var_172_15 < arg_169_1.time_ and arg_169_1.time_ <= var_172_15 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_17 = arg_169_1:FormatText(StoryNameCfg[74].name)

				arg_169_1.leftNameTxt_.text = var_172_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_18 = arg_169_1:GetWordFromCfg(318041041)
				local var_172_19 = arg_169_1:FormatText(var_172_18.content)

				arg_169_1.text_.text = var_172_19

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_20 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041041", "story_v_out_318041.awb") ~= 0 then
					local var_172_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041041", "story_v_out_318041.awb") / 1000

					if var_172_23 + var_172_15 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_23 + var_172_15
					end

					if var_172_18.prefab_name ~= "" and arg_169_1.actors_[var_172_18.prefab_name] ~= nil then
						local var_172_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_18.prefab_name].transform, "story_v_out_318041", "318041041", "story_v_out_318041.awb")

						arg_169_1:RecordAudio("318041041", var_172_24)
						arg_169_1:RecordAudio("318041041", var_172_24)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_318041", "318041041", "story_v_out_318041.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_318041", "318041041", "story_v_out_318041.awb")
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
	Play318041042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 318041042
		arg_173_1.duration_ = 8.166

		local var_173_0 = {
			zh = 3,
			ja = 8.166
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
				arg_173_0:Play318041043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1050ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1050ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(0, -1, -6.1)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1050ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = arg_173_1.actors_["1050ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1050ui_story == nil then
				arg_173_1.var_.characterEffect1050ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.200000002980232

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1050ui_story then
					arg_173_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1050ui_story then
				arg_173_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_176_13 = 0

			if var_176_13 < arg_173_1.time_ and arg_173_1.time_ <= var_176_13 + arg_176_0 then
				arg_173_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_176_15 = 0
			local var_176_16 = 0.375

			if var_176_15 < arg_173_1.time_ and arg_173_1.time_ <= var_176_15 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_17 = arg_173_1:FormatText(StoryNameCfg[74].name)

				arg_173_1.leftNameTxt_.text = var_176_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_18 = arg_173_1:GetWordFromCfg(318041042)
				local var_176_19 = arg_173_1:FormatText(var_176_18.content)

				arg_173_1.text_.text = var_176_19

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_20 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041042", "story_v_out_318041.awb") ~= 0 then
					local var_176_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041042", "story_v_out_318041.awb") / 1000

					if var_176_23 + var_176_15 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_23 + var_176_15
					end

					if var_176_18.prefab_name ~= "" and arg_173_1.actors_[var_176_18.prefab_name] ~= nil then
						local var_176_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_18.prefab_name].transform, "story_v_out_318041", "318041042", "story_v_out_318041.awb")

						arg_173_1:RecordAudio("318041042", var_176_24)
						arg_173_1:RecordAudio("318041042", var_176_24)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_318041", "318041042", "story_v_out_318041.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_318041", "318041042", "story_v_out_318041.awb")
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
	Play318041043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 318041043
		arg_177_1.duration_ = 1.5

		local var_177_0 = {
			zh = 1.5,
			ja = 1.1
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
				arg_177_0:Play318041044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1050ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1050ui_story == nil then
				arg_177_1.var_.characterEffect1050ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.200000002980232

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1050ui_story then
					local var_180_4 = Mathf.Lerp(0, 0.5, var_180_3)

					arg_177_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1050ui_story.fillRatio = var_180_4
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1050ui_story then
				local var_180_5 = 0.5

				arg_177_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1050ui_story.fillRatio = var_180_5
			end

			local var_180_6 = 0
			local var_180_7 = 0.125

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_8 = arg_177_1:FormatText(StoryNameCfg[637].name)

				arg_177_1.leftNameTxt_.text = var_180_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, true)
				arg_177_1.iconController_:SetSelectedState("hero")

				arg_177_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_9 = arg_177_1:GetWordFromCfg(318041043)
				local var_180_10 = arg_177_1:FormatText(var_180_9.content)

				arg_177_1.text_.text = var_180_10

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_11 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041043", "story_v_out_318041.awb") ~= 0 then
					local var_180_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041043", "story_v_out_318041.awb") / 1000

					if var_180_14 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_14 + var_180_6
					end

					if var_180_9.prefab_name ~= "" and arg_177_1.actors_[var_180_9.prefab_name] ~= nil then
						local var_180_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_9.prefab_name].transform, "story_v_out_318041", "318041043", "story_v_out_318041.awb")

						arg_177_1:RecordAudio("318041043", var_180_15)
						arg_177_1:RecordAudio("318041043", var_180_15)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_318041", "318041043", "story_v_out_318041.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_318041", "318041043", "story_v_out_318041.awb")
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
	Play318041044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 318041044
		arg_181_1.duration_ = 8.3

		local var_181_0 = {
			zh = 4.3,
			ja = 8.3
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
				arg_181_0:Play318041045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.4

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_2 = arg_181_1:FormatText(StoryNameCfg[637].name)

				arg_181_1.leftNameTxt_.text = var_184_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, true)
				arg_181_1.iconController_:SetSelectedState("hero")

				arg_181_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_tb_citizenma")

				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_3 = arg_181_1:GetWordFromCfg(318041044)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 16
				local var_184_6 = utf8.len(var_184_4)
				local var_184_7 = var_184_5 <= 0 and var_184_1 or var_184_1 * (var_184_6 / var_184_5)

				if var_184_7 > 0 and var_184_1 < var_184_7 then
					arg_181_1.talkMaxDuration = var_184_7

					if var_184_7 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_7 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_4
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041044", "story_v_out_318041.awb") ~= 0 then
					local var_184_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041044", "story_v_out_318041.awb") / 1000

					if var_184_8 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_8 + var_184_0
					end

					if var_184_3.prefab_name ~= "" and arg_181_1.actors_[var_184_3.prefab_name] ~= nil then
						local var_184_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_3.prefab_name].transform, "story_v_out_318041", "318041044", "story_v_out_318041.awb")

						arg_181_1:RecordAudio("318041044", var_184_9)
						arg_181_1:RecordAudio("318041044", var_184_9)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_318041", "318041044", "story_v_out_318041.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_318041", "318041044", "story_v_out_318041.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_10 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_10 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_10

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_10 and arg_181_1.time_ < var_184_0 + var_184_10 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play318041045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 318041045
		arg_185_1.duration_ = 10.466

		local var_185_0 = {
			zh = 10.466,
			ja = 8
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
				arg_185_0:Play318041046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 2

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				local var_188_1 = manager.ui.mainCamera.transform.localPosition
				local var_188_2 = Vector3.New(0, 0, 10) + Vector3.New(var_188_1.x, var_188_1.y, 0)
				local var_188_3 = arg_185_1.bgs_.ST69

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
					if iter_188_0 ~= "ST69" then
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

			local var_188_25 = arg_185_1.actors_["1050ui_story"].transform
			local var_188_26 = 4

			if var_188_26 < arg_185_1.time_ and arg_185_1.time_ <= var_188_26 + arg_188_0 then
				arg_185_1.var_.moveOldPos1050ui_story = var_188_25.localPosition
			end

			local var_188_27 = 0.001

			if var_188_26 <= arg_185_1.time_ and arg_185_1.time_ < var_188_26 + var_188_27 then
				local var_188_28 = (arg_185_1.time_ - var_188_26) / var_188_27
				local var_188_29 = Vector3.New(0, -1, -6.1)

				var_188_25.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1050ui_story, var_188_29, var_188_28)

				local var_188_30 = manager.ui.mainCamera.transform.position - var_188_25.position

				var_188_25.forward = Vector3.New(var_188_30.x, var_188_30.y, var_188_30.z)

				local var_188_31 = var_188_25.localEulerAngles

				var_188_31.z = 0
				var_188_31.x = 0
				var_188_25.localEulerAngles = var_188_31
			end

			if arg_185_1.time_ >= var_188_26 + var_188_27 and arg_185_1.time_ < var_188_26 + var_188_27 + arg_188_0 then
				var_188_25.localPosition = Vector3.New(0, -1, -6.1)

				local var_188_32 = manager.ui.mainCamera.transform.position - var_188_25.position

				var_188_25.forward = Vector3.New(var_188_32.x, var_188_32.y, var_188_32.z)

				local var_188_33 = var_188_25.localEulerAngles

				var_188_33.z = 0
				var_188_33.x = 0
				var_188_25.localEulerAngles = var_188_33
			end

			local var_188_34 = arg_185_1.actors_["1050ui_story"]
			local var_188_35 = 4

			if var_188_35 < arg_185_1.time_ and arg_185_1.time_ <= var_188_35 + arg_188_0 and arg_185_1.var_.characterEffect1050ui_story == nil then
				arg_185_1.var_.characterEffect1050ui_story = var_188_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_36 = 0.200000002980232

			if var_188_35 <= arg_185_1.time_ and arg_185_1.time_ < var_188_35 + var_188_36 then
				local var_188_37 = (arg_185_1.time_ - var_188_35) / var_188_36

				if arg_185_1.var_.characterEffect1050ui_story then
					arg_185_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_35 + var_188_36 and arg_185_1.time_ < var_188_35 + var_188_36 + arg_188_0 and arg_185_1.var_.characterEffect1050ui_story then
				arg_185_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_188_38 = 4

			if var_188_38 < arg_185_1.time_ and arg_185_1.time_ <= var_188_38 + arg_188_0 then
				arg_185_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action2_1")
			end

			local var_188_39 = 4

			if var_188_39 < arg_185_1.time_ and arg_185_1.time_ <= var_188_39 + arg_188_0 then
				arg_185_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_188_40 = 1.98333333333333

			if var_188_40 < arg_185_1.time_ and arg_185_1.time_ <= var_188_40 + arg_188_0 then
				arg_185_1.screenFilterGo_:SetActive(false)
			end

			local var_188_41 = 0.0166666666666666

			if var_188_40 <= arg_185_1.time_ and arg_185_1.time_ < var_188_40 + var_188_41 then
				local var_188_42 = (arg_185_1.time_ - var_188_40) / var_188_41

				arg_185_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_188_42)
			end

			if arg_185_1.time_ >= var_188_40 + var_188_41 and arg_185_1.time_ < var_188_40 + var_188_41 + arg_188_0 then
				arg_185_1.screenFilterEffect_.weight = 0
			end

			local var_188_43 = arg_185_1.actors_["1050ui_story"]
			local var_188_44 = 2

			if var_188_44 < arg_185_1.time_ and arg_185_1.time_ <= var_188_44 + arg_188_0 and arg_185_1.var_.characterEffect1050ui_story == nil then
				arg_185_1.var_.characterEffect1050ui_story = var_188_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_45 = 0.200000002980232

			if var_188_44 <= arg_185_1.time_ and arg_185_1.time_ < var_188_44 + var_188_45 then
				local var_188_46 = (arg_185_1.time_ - var_188_44) / var_188_45

				if arg_185_1.var_.characterEffect1050ui_story then
					local var_188_47 = Mathf.Lerp(0, 0.5, var_188_46)

					arg_185_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1050ui_story.fillRatio = var_188_47
				end
			end

			if arg_185_1.time_ >= var_188_44 + var_188_45 and arg_185_1.time_ < var_188_44 + var_188_45 + arg_188_0 and arg_185_1.var_.characterEffect1050ui_story then
				local var_188_48 = 0.5

				arg_185_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1050ui_story.fillRatio = var_188_48
			end

			local var_188_49 = arg_185_1.actors_["1050ui_story"].transform
			local var_188_50 = 2

			if var_188_50 < arg_185_1.time_ and arg_185_1.time_ <= var_188_50 + arg_188_0 then
				arg_185_1.var_.moveOldPos1050ui_story = var_188_49.localPosition
			end

			local var_188_51 = 0.001

			if var_188_50 <= arg_185_1.time_ and arg_185_1.time_ < var_188_50 + var_188_51 then
				local var_188_52 = (arg_185_1.time_ - var_188_50) / var_188_51
				local var_188_53 = Vector3.New(0, 100, 0)

				var_188_49.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1050ui_story, var_188_53, var_188_52)

				local var_188_54 = manager.ui.mainCamera.transform.position - var_188_49.position

				var_188_49.forward = Vector3.New(var_188_54.x, var_188_54.y, var_188_54.z)

				local var_188_55 = var_188_49.localEulerAngles

				var_188_55.z = 0
				var_188_55.x = 0
				var_188_49.localEulerAngles = var_188_55
			end

			if arg_185_1.time_ >= var_188_50 + var_188_51 and arg_185_1.time_ < var_188_50 + var_188_51 + arg_188_0 then
				var_188_49.localPosition = Vector3.New(0, 100, 0)

				local var_188_56 = manager.ui.mainCamera.transform.position - var_188_49.position

				var_188_49.forward = Vector3.New(var_188_56.x, var_188_56.y, var_188_56.z)

				local var_188_57 = var_188_49.localEulerAngles

				var_188_57.z = 0
				var_188_57.x = 0
				var_188_49.localEulerAngles = var_188_57
			end

			local var_188_58 = 0
			local var_188_59 = 0.433333333333333

			if var_188_58 < arg_185_1.time_ and arg_185_1.time_ <= var_188_58 + arg_188_0 then
				local var_188_60 = "play"
				local var_188_61 = "music"

				arg_185_1:AudioAction(var_188_60, var_188_61, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_188_62 = 1.26666666666667
			local var_188_63 = 1

			if var_188_62 < arg_185_1.time_ and arg_185_1.time_ <= var_188_62 + arg_188_0 then
				local var_188_64 = "play"
				local var_188_65 = "music"

				arg_185_1:AudioAction(var_188_64, var_188_65, "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten.awb")
			end

			if arg_185_1.frameCnt_ <= 1 then
				arg_185_1.dialog_:SetActive(false)
			end

			local var_188_66 = 4
			local var_188_67 = 0.45

			if var_188_66 < arg_185_1.time_ and arg_185_1.time_ <= var_188_66 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0

				arg_185_1.dialog_:SetActive(true)

				local var_188_68 = LeanTween.value(arg_185_1.dialog_, 0, 1, 0.3)

				var_188_68:setOnUpdate(LuaHelper.FloatAction(function(arg_189_0)
					arg_185_1.dialogCg_.alpha = arg_189_0
				end))
				var_188_68:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_185_1.dialog_)
					var_188_68:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_185_1.duration_ = arg_185_1.duration_ + 0.3

				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_69 = arg_185_1:FormatText(StoryNameCfg[74].name)

				arg_185_1.leftNameTxt_.text = var_188_69

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_70 = arg_185_1:GetWordFromCfg(318041045)
				local var_188_71 = arg_185_1:FormatText(var_188_70.content)

				arg_185_1.text_.text = var_188_71

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_72 = 18
				local var_188_73 = utf8.len(var_188_71)
				local var_188_74 = var_188_72 <= 0 and var_188_67 or var_188_67 * (var_188_73 / var_188_72)

				if var_188_74 > 0 and var_188_67 < var_188_74 then
					arg_185_1.talkMaxDuration = var_188_74
					var_188_66 = var_188_66 + 0.3

					if var_188_74 + var_188_66 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_74 + var_188_66
					end
				end

				arg_185_1.text_.text = var_188_71
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041045", "story_v_out_318041.awb") ~= 0 then
					local var_188_75 = manager.audio:GetVoiceLength("story_v_out_318041", "318041045", "story_v_out_318041.awb") / 1000

					if var_188_75 + var_188_66 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_75 + var_188_66
					end

					if var_188_70.prefab_name ~= "" and arg_185_1.actors_[var_188_70.prefab_name] ~= nil then
						local var_188_76 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_70.prefab_name].transform, "story_v_out_318041", "318041045", "story_v_out_318041.awb")

						arg_185_1:RecordAudio("318041045", var_188_76)
						arg_185_1:RecordAudio("318041045", var_188_76)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_318041", "318041045", "story_v_out_318041.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_318041", "318041045", "story_v_out_318041.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_77 = var_188_66 + 0.3
			local var_188_78 = math.max(var_188_67, arg_185_1.talkMaxDuration)

			if var_188_77 <= arg_185_1.time_ and arg_185_1.time_ < var_188_77 + var_188_78 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_77) / var_188_78

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_77 + var_188_78 and arg_185_1.time_ < var_188_77 + var_188_78 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play318041046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 318041046
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play318041047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1050ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1050ui_story == nil then
				arg_191_1.var_.characterEffect1050ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1050ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1050ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1050ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1050ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.433333333333333

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				local var_194_8 = "play"
				local var_194_9 = "effect"

				arg_191_1:AudioAction(var_194_8, var_194_9, "se_story_1210", "se_story_1210_cooking", "")
			end

			local var_194_10 = 0
			local var_194_11 = 1.675

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_12 = arg_191_1:GetWordFromCfg(318041046)
				local var_194_13 = arg_191_1:FormatText(var_194_12.content)

				arg_191_1.text_.text = var_194_13

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_14 = 67
				local var_194_15 = utf8.len(var_194_13)
				local var_194_16 = var_194_14 <= 0 and var_194_11 or var_194_11 * (var_194_15 / var_194_14)

				if var_194_16 > 0 and var_194_11 < var_194_16 then
					arg_191_1.talkMaxDuration = var_194_16

					if var_194_16 + var_194_10 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_16 + var_194_10
					end
				end

				arg_191_1.text_.text = var_194_13
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_17 = math.max(var_194_11, arg_191_1.talkMaxDuration)

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_17 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_10) / var_194_17

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_10 + var_194_17 and arg_191_1.time_ < var_194_10 + var_194_17 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play318041047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 318041047
		arg_195_1.duration_ = 3.6

		local var_195_0 = {
			zh = 1.999999999999,
			ja = 3.6
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
				arg_195_0:Play318041048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1050ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1050ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(0, -1, -6.1)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1050ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = arg_195_1.actors_["1050ui_story"]
			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 and arg_195_1.var_.characterEffect1050ui_story == nil then
				arg_195_1.var_.characterEffect1050ui_story = var_198_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_11 = 0.200000002980232

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_10) / var_198_11

				if arg_195_1.var_.characterEffect1050ui_story then
					arg_195_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 and arg_195_1.var_.characterEffect1050ui_story then
				arg_195_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_198_13 = 0

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action2_2")
			end

			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 then
				arg_195_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_198_15 = 0
			local var_198_16 = 0.2

			if var_198_15 < arg_195_1.time_ and arg_195_1.time_ <= var_198_15 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_17 = arg_195_1:FormatText(StoryNameCfg[74].name)

				arg_195_1.leftNameTxt_.text = var_198_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_18 = arg_195_1:GetWordFromCfg(318041047)
				local var_198_19 = arg_195_1:FormatText(var_198_18.content)

				arg_195_1.text_.text = var_198_19

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_20 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041047", "story_v_out_318041.awb") ~= 0 then
					local var_198_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041047", "story_v_out_318041.awb") / 1000

					if var_198_23 + var_198_15 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_23 + var_198_15
					end

					if var_198_18.prefab_name ~= "" and arg_195_1.actors_[var_198_18.prefab_name] ~= nil then
						local var_198_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_18.prefab_name].transform, "story_v_out_318041", "318041047", "story_v_out_318041.awb")

						arg_195_1:RecordAudio("318041047", var_198_24)
						arg_195_1:RecordAudio("318041047", var_198_24)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_318041", "318041047", "story_v_out_318041.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_318041", "318041047", "story_v_out_318041.awb")
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
	Play318041048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 318041048
		arg_199_1.duration_ = 4.933

		local var_199_0 = {
			zh = 4.933,
			ja = 3.066
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
				arg_199_0:Play318041049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1050ui_story"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1050ui_story = var_202_0.localPosition
			end

			local var_202_2 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2
				local var_202_4 = Vector3.New(0, -1, -6.1)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1050ui_story, var_202_4, var_202_3)

				local var_202_5 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_5.x, var_202_5.y, var_202_5.z)

				local var_202_6 = var_202_0.localEulerAngles

				var_202_6.z = 0
				var_202_6.x = 0
				var_202_0.localEulerAngles = var_202_6
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_202_7 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_7.x, var_202_7.y, var_202_7.z)

				local var_202_8 = var_202_0.localEulerAngles

				var_202_8.z = 0
				var_202_8.x = 0
				var_202_0.localEulerAngles = var_202_8
			end

			local var_202_9 = 0
			local var_202_10 = 0.475

			if var_202_9 < arg_199_1.time_ and arg_199_1.time_ <= var_202_9 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_11 = arg_199_1:FormatText(StoryNameCfg[74].name)

				arg_199_1.leftNameTxt_.text = var_202_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_12 = arg_199_1:GetWordFromCfg(318041048)
				local var_202_13 = arg_199_1:FormatText(var_202_12.content)

				arg_199_1.text_.text = var_202_13

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_14 = 19
				local var_202_15 = utf8.len(var_202_13)
				local var_202_16 = var_202_14 <= 0 and var_202_10 or var_202_10 * (var_202_15 / var_202_14)

				if var_202_16 > 0 and var_202_10 < var_202_16 then
					arg_199_1.talkMaxDuration = var_202_16

					if var_202_16 + var_202_9 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_16 + var_202_9
					end
				end

				arg_199_1.text_.text = var_202_13
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041048", "story_v_out_318041.awb") ~= 0 then
					local var_202_17 = manager.audio:GetVoiceLength("story_v_out_318041", "318041048", "story_v_out_318041.awb") / 1000

					if var_202_17 + var_202_9 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_17 + var_202_9
					end

					if var_202_12.prefab_name ~= "" and arg_199_1.actors_[var_202_12.prefab_name] ~= nil then
						local var_202_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_12.prefab_name].transform, "story_v_out_318041", "318041048", "story_v_out_318041.awb")

						arg_199_1:RecordAudio("318041048", var_202_18)
						arg_199_1:RecordAudio("318041048", var_202_18)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_318041", "318041048", "story_v_out_318041.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_318041", "318041048", "story_v_out_318041.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_19 = math.max(var_202_10, arg_199_1.talkMaxDuration)

			if var_202_9 <= arg_199_1.time_ and arg_199_1.time_ < var_202_9 + var_202_19 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_9) / var_202_19

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_9 + var_202_19 and arg_199_1.time_ < var_202_9 + var_202_19 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play318041049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 318041049
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play318041050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1050ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1050ui_story == nil then
				arg_203_1.var_.characterEffect1050ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.200000002980232

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1050ui_story then
					local var_206_4 = Mathf.Lerp(0, 0.5, var_206_3)

					arg_203_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1050ui_story.fillRatio = var_206_4
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1050ui_story then
				local var_206_5 = 0.5

				arg_203_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1050ui_story.fillRatio = var_206_5
			end

			local var_206_6 = 0
			local var_206_7 = 1

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_8 = arg_203_1:GetWordFromCfg(318041049)
				local var_206_9 = arg_203_1:FormatText(var_206_8.content)

				arg_203_1.text_.text = var_206_9

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_10 = 40
				local var_206_11 = utf8.len(var_206_9)
				local var_206_12 = var_206_10 <= 0 and var_206_7 or var_206_7 * (var_206_11 / var_206_10)

				if var_206_12 > 0 and var_206_7 < var_206_12 then
					arg_203_1.talkMaxDuration = var_206_12

					if var_206_12 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_12 + var_206_6
					end
				end

				arg_203_1.text_.text = var_206_9
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_13 = math.max(var_206_7, arg_203_1.talkMaxDuration)

			if var_206_6 <= arg_203_1.time_ and arg_203_1.time_ < var_206_6 + var_206_13 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_6) / var_206_13

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_6 + var_206_13 and arg_203_1.time_ < var_206_6 + var_206_13 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play318041050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 318041050
		arg_207_1.duration_ = 6.9

		local var_207_0 = {
			zh = 6.9,
			ja = 5.333
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
				arg_207_0:Play318041051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1050ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1050ui_story == nil then
				arg_207_1.var_.characterEffect1050ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.200000002980232

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1050ui_story then
					arg_207_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1050ui_story then
				arg_207_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_210_4 = 0

			if var_210_4 < arg_207_1.time_ and arg_207_1.time_ <= var_210_4 + arg_210_0 then
				arg_207_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action4_1")
			end

			local var_210_5 = 0

			if var_210_5 < arg_207_1.time_ and arg_207_1.time_ <= var_210_5 + arg_210_0 then
				arg_207_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_210_6 = 0
			local var_210_7 = 0.675

			if var_210_6 < arg_207_1.time_ and arg_207_1.time_ <= var_210_6 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_8 = arg_207_1:FormatText(StoryNameCfg[74].name)

				arg_207_1.leftNameTxt_.text = var_210_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_9 = arg_207_1:GetWordFromCfg(318041050)
				local var_210_10 = arg_207_1:FormatText(var_210_9.content)

				arg_207_1.text_.text = var_210_10

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_11 = 27
				local var_210_12 = utf8.len(var_210_10)
				local var_210_13 = var_210_11 <= 0 and var_210_7 or var_210_7 * (var_210_12 / var_210_11)

				if var_210_13 > 0 and var_210_7 < var_210_13 then
					arg_207_1.talkMaxDuration = var_210_13

					if var_210_13 + var_210_6 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_13 + var_210_6
					end
				end

				arg_207_1.text_.text = var_210_10
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041050", "story_v_out_318041.awb") ~= 0 then
					local var_210_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041050", "story_v_out_318041.awb") / 1000

					if var_210_14 + var_210_6 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_14 + var_210_6
					end

					if var_210_9.prefab_name ~= "" and arg_207_1.actors_[var_210_9.prefab_name] ~= nil then
						local var_210_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_9.prefab_name].transform, "story_v_out_318041", "318041050", "story_v_out_318041.awb")

						arg_207_1:RecordAudio("318041050", var_210_15)
						arg_207_1:RecordAudio("318041050", var_210_15)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_318041", "318041050", "story_v_out_318041.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_318041", "318041050", "story_v_out_318041.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_16 = math.max(var_210_7, arg_207_1.talkMaxDuration)

			if var_210_6 <= arg_207_1.time_ and arg_207_1.time_ < var_210_6 + var_210_16 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_6) / var_210_16

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_6 + var_210_16 and arg_207_1.time_ < var_210_6 + var_210_16 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play318041051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 318041051
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play318041052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1050ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect1050ui_story == nil then
				arg_211_1.var_.characterEffect1050ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect1050ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1050ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1050ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1050ui_story.fillRatio = var_214_5
			end

			local var_214_6 = arg_211_1.actors_["1050ui_story"].transform
			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 then
				arg_211_1.var_.moveOldPos1050ui_story = var_214_6.localPosition
			end

			local var_214_8 = 0.001

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_8 then
				local var_214_9 = (arg_211_1.time_ - var_214_7) / var_214_8
				local var_214_10 = Vector3.New(0, 100, 0)

				var_214_6.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1050ui_story, var_214_10, var_214_9)

				local var_214_11 = manager.ui.mainCamera.transform.position - var_214_6.position

				var_214_6.forward = Vector3.New(var_214_11.x, var_214_11.y, var_214_11.z)

				local var_214_12 = var_214_6.localEulerAngles

				var_214_12.z = 0
				var_214_12.x = 0
				var_214_6.localEulerAngles = var_214_12
			end

			if arg_211_1.time_ >= var_214_7 + var_214_8 and arg_211_1.time_ < var_214_7 + var_214_8 + arg_214_0 then
				var_214_6.localPosition = Vector3.New(0, 100, 0)

				local var_214_13 = manager.ui.mainCamera.transform.position - var_214_6.position

				var_214_6.forward = Vector3.New(var_214_13.x, var_214_13.y, var_214_13.z)

				local var_214_14 = var_214_6.localEulerAngles

				var_214_14.z = 0
				var_214_14.x = 0
				var_214_6.localEulerAngles = var_214_14
			end

			local var_214_15 = 0
			local var_214_16 = 1.35

			if var_214_15 < arg_211_1.time_ and arg_211_1.time_ <= var_214_15 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_17 = arg_211_1:GetWordFromCfg(318041051)
				local var_214_18 = arg_211_1:FormatText(var_214_17.content)

				arg_211_1.text_.text = var_214_18

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_19 = 54
				local var_214_20 = utf8.len(var_214_18)
				local var_214_21 = var_214_19 <= 0 and var_214_16 or var_214_16 * (var_214_20 / var_214_19)

				if var_214_21 > 0 and var_214_16 < var_214_21 then
					arg_211_1.talkMaxDuration = var_214_21

					if var_214_21 + var_214_15 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_21 + var_214_15
					end
				end

				arg_211_1.text_.text = var_214_18
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_22 = math.max(var_214_16, arg_211_1.talkMaxDuration)

			if var_214_15 <= arg_211_1.time_ and arg_211_1.time_ < var_214_15 + var_214_22 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_15) / var_214_22

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_15 + var_214_22 and arg_211_1.time_ < var_214_15 + var_214_22 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play318041052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 318041052
		arg_215_1.duration_ = 5.033

		local var_215_0 = {
			zh = 4.166,
			ja = 5.033
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
				arg_215_0:Play318041053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.375

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[36].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, true)
				arg_215_1.iconController_:SetSelectedState("hero")

				arg_215_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10066")

				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(318041052)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041052", "story_v_out_318041.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041052", "story_v_out_318041.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_318041", "318041052", "story_v_out_318041.awb")

						arg_215_1:RecordAudio("318041052", var_218_9)
						arg_215_1:RecordAudio("318041052", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_318041", "318041052", "story_v_out_318041.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_318041", "318041052", "story_v_out_318041.awb")
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
	Play318041053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 318041053
		arg_219_1.duration_ = 3.233

		local var_219_0 = {
			zh = 2.266,
			ja = 3.233
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
				arg_219_0:Play318041054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1050ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1050ui_story == nil then
				arg_219_1.var_.characterEffect1050ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.200000002980232

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1050ui_story then
					arg_219_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1050ui_story then
				arg_219_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_222_4 = arg_219_1.actors_["1050ui_story"].transform
			local var_222_5 = 0

			if var_222_5 < arg_219_1.time_ and arg_219_1.time_ <= var_222_5 + arg_222_0 then
				arg_219_1.var_.moveOldPos1050ui_story = var_222_4.localPosition
			end

			local var_222_6 = 0.001

			if var_222_5 <= arg_219_1.time_ and arg_219_1.time_ < var_222_5 + var_222_6 then
				local var_222_7 = (arg_219_1.time_ - var_222_5) / var_222_6
				local var_222_8 = Vector3.New(0, -1, -6.1)

				var_222_4.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1050ui_story, var_222_8, var_222_7)

				local var_222_9 = manager.ui.mainCamera.transform.position - var_222_4.position

				var_222_4.forward = Vector3.New(var_222_9.x, var_222_9.y, var_222_9.z)

				local var_222_10 = var_222_4.localEulerAngles

				var_222_10.z = 0
				var_222_10.x = 0
				var_222_4.localEulerAngles = var_222_10
			end

			if arg_219_1.time_ >= var_222_5 + var_222_6 and arg_219_1.time_ < var_222_5 + var_222_6 + arg_222_0 then
				var_222_4.localPosition = Vector3.New(0, -1, -6.1)

				local var_222_11 = manager.ui.mainCamera.transform.position - var_222_4.position

				var_222_4.forward = Vector3.New(var_222_11.x, var_222_11.y, var_222_11.z)

				local var_222_12 = var_222_4.localEulerAngles

				var_222_12.z = 0
				var_222_12.x = 0
				var_222_4.localEulerAngles = var_222_12
			end

			local var_222_13 = 0

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_222_15 = 0
			local var_222_16 = 0.25

			if var_222_15 < arg_219_1.time_ and arg_219_1.time_ <= var_222_15 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_17 = arg_219_1:FormatText(StoryNameCfg[74].name)

				arg_219_1.leftNameTxt_.text = var_222_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_18 = arg_219_1:GetWordFromCfg(318041053)
				local var_222_19 = arg_219_1:FormatText(var_222_18.content)

				arg_219_1.text_.text = var_222_19

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_20 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041053", "story_v_out_318041.awb") ~= 0 then
					local var_222_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041053", "story_v_out_318041.awb") / 1000

					if var_222_23 + var_222_15 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_23 + var_222_15
					end

					if var_222_18.prefab_name ~= "" and arg_219_1.actors_[var_222_18.prefab_name] ~= nil then
						local var_222_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_18.prefab_name].transform, "story_v_out_318041", "318041053", "story_v_out_318041.awb")

						arg_219_1:RecordAudio("318041053", var_222_24)
						arg_219_1:RecordAudio("318041053", var_222_24)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_318041", "318041053", "story_v_out_318041.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_318041", "318041053", "story_v_out_318041.awb")
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
	Play318041054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 318041054
		arg_223_1.duration_ = 6.4

		local var_223_0 = {
			zh = 3.866,
			ja = 6.4
		}
		local var_223_1 = manager.audio:GetLocalizationFlag()

		if var_223_0[var_223_1] ~= nil then
			arg_223_1.duration_ = var_223_0[var_223_1]
		end

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play318041055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = "10066ui_story"

			if arg_223_1.actors_[var_226_0] == nil then
				local var_226_1 = Object.Instantiate(Asset.Load("Char/" .. var_226_0), arg_223_1.stage_.transform)

				var_226_1.name = var_226_0
				var_226_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_223_1.actors_[var_226_0] = var_226_1

				local var_226_2 = var_226_1:GetComponentInChildren(typeof(CharacterEffect))

				var_226_2.enabled = true

				local var_226_3 = GameObjectTools.GetOrAddComponent(var_226_1, typeof(DynamicBoneHelper))

				if var_226_3 then
					var_226_3:EnableDynamicBone(false)
				end

				arg_223_1:ShowWeapon(var_226_2.transform, false)

				arg_223_1.var_[var_226_0 .. "Animator"] = var_226_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_223_1.var_[var_226_0 .. "Animator"].applyRootMotion = true
				arg_223_1.var_[var_226_0 .. "LipSync"] = var_226_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_226_4 = arg_223_1.actors_["10066ui_story"].transform
			local var_226_5 = 0

			if var_226_5 < arg_223_1.time_ and arg_223_1.time_ <= var_226_5 + arg_226_0 then
				arg_223_1.var_.moveOldPos10066ui_story = var_226_4.localPosition
			end

			local var_226_6 = 0.001

			if var_226_5 <= arg_223_1.time_ and arg_223_1.time_ < var_226_5 + var_226_6 then
				local var_226_7 = (arg_223_1.time_ - var_226_5) / var_226_6
				local var_226_8 = Vector3.New(0.7, -0.99, -5.83)

				var_226_4.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10066ui_story, var_226_8, var_226_7)

				local var_226_9 = manager.ui.mainCamera.transform.position - var_226_4.position

				var_226_4.forward = Vector3.New(var_226_9.x, var_226_9.y, var_226_9.z)

				local var_226_10 = var_226_4.localEulerAngles

				var_226_10.z = 0
				var_226_10.x = 0
				var_226_4.localEulerAngles = var_226_10
			end

			if arg_223_1.time_ >= var_226_5 + var_226_6 and arg_223_1.time_ < var_226_5 + var_226_6 + arg_226_0 then
				var_226_4.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_226_11 = manager.ui.mainCamera.transform.position - var_226_4.position

				var_226_4.forward = Vector3.New(var_226_11.x, var_226_11.y, var_226_11.z)

				local var_226_12 = var_226_4.localEulerAngles

				var_226_12.z = 0
				var_226_12.x = 0
				var_226_4.localEulerAngles = var_226_12
			end

			local var_226_13 = arg_223_1.actors_["10066ui_story"]
			local var_226_14 = 0

			if var_226_14 < arg_223_1.time_ and arg_223_1.time_ <= var_226_14 + arg_226_0 and arg_223_1.var_.characterEffect10066ui_story == nil then
				arg_223_1.var_.characterEffect10066ui_story = var_226_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_15 = 0.200000002980232

			if var_226_14 <= arg_223_1.time_ and arg_223_1.time_ < var_226_14 + var_226_15 then
				local var_226_16 = (arg_223_1.time_ - var_226_14) / var_226_15

				if arg_223_1.var_.characterEffect10066ui_story then
					arg_223_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_14 + var_226_15 and arg_223_1.time_ < var_226_14 + var_226_15 + arg_226_0 and arg_223_1.var_.characterEffect10066ui_story then
				arg_223_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_226_17 = 0

			if var_226_17 < arg_223_1.time_ and arg_223_1.time_ <= var_226_17 + arg_226_0 then
				arg_223_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_1")
			end

			local var_226_18 = 0

			if var_226_18 < arg_223_1.time_ and arg_223_1.time_ <= var_226_18 + arg_226_0 then
				arg_223_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_226_19 = arg_223_1.actors_["1050ui_story"].transform
			local var_226_20 = 0

			if var_226_20 < arg_223_1.time_ and arg_223_1.time_ <= var_226_20 + arg_226_0 then
				arg_223_1.var_.moveOldPos1050ui_story = var_226_19.localPosition
			end

			local var_226_21 = 0.001

			if var_226_20 <= arg_223_1.time_ and arg_223_1.time_ < var_226_20 + var_226_21 then
				local var_226_22 = (arg_223_1.time_ - var_226_20) / var_226_21
				local var_226_23 = Vector3.New(-0.7, -1, -6.1)

				var_226_19.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1050ui_story, var_226_23, var_226_22)

				local var_226_24 = manager.ui.mainCamera.transform.position - var_226_19.position

				var_226_19.forward = Vector3.New(var_226_24.x, var_226_24.y, var_226_24.z)

				local var_226_25 = var_226_19.localEulerAngles

				var_226_25.z = 0
				var_226_25.x = 0
				var_226_19.localEulerAngles = var_226_25
			end

			if arg_223_1.time_ >= var_226_20 + var_226_21 and arg_223_1.time_ < var_226_20 + var_226_21 + arg_226_0 then
				var_226_19.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_226_26 = manager.ui.mainCamera.transform.position - var_226_19.position

				var_226_19.forward = Vector3.New(var_226_26.x, var_226_26.y, var_226_26.z)

				local var_226_27 = var_226_19.localEulerAngles

				var_226_27.z = 0
				var_226_27.x = 0
				var_226_19.localEulerAngles = var_226_27
			end

			local var_226_28 = arg_223_1.actors_["1050ui_story"]
			local var_226_29 = 0

			if var_226_29 < arg_223_1.time_ and arg_223_1.time_ <= var_226_29 + arg_226_0 and arg_223_1.var_.characterEffect1050ui_story == nil then
				arg_223_1.var_.characterEffect1050ui_story = var_226_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_30 = 0.200000002980232

			if var_226_29 <= arg_223_1.time_ and arg_223_1.time_ < var_226_29 + var_226_30 then
				local var_226_31 = (arg_223_1.time_ - var_226_29) / var_226_30

				if arg_223_1.var_.characterEffect1050ui_story then
					local var_226_32 = Mathf.Lerp(0, 0.5, var_226_31)

					arg_223_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1050ui_story.fillRatio = var_226_32
				end
			end

			if arg_223_1.time_ >= var_226_29 + var_226_30 and arg_223_1.time_ < var_226_29 + var_226_30 + arg_226_0 and arg_223_1.var_.characterEffect1050ui_story then
				local var_226_33 = 0.5

				arg_223_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1050ui_story.fillRatio = var_226_33
			end

			local var_226_34 = 0
			local var_226_35 = 0.375

			if var_226_34 < arg_223_1.time_ and arg_223_1.time_ <= var_226_34 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_36 = arg_223_1:FormatText(StoryNameCfg[640].name)

				arg_223_1.leftNameTxt_.text = var_226_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_37 = arg_223_1:GetWordFromCfg(318041054)
				local var_226_38 = arg_223_1:FormatText(var_226_37.content)

				arg_223_1.text_.text = var_226_38

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_39 = 15
				local var_226_40 = utf8.len(var_226_38)
				local var_226_41 = var_226_39 <= 0 and var_226_35 or var_226_35 * (var_226_40 / var_226_39)

				if var_226_41 > 0 and var_226_35 < var_226_41 then
					arg_223_1.talkMaxDuration = var_226_41

					if var_226_41 + var_226_34 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_41 + var_226_34
					end
				end

				arg_223_1.text_.text = var_226_38
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041054", "story_v_out_318041.awb") ~= 0 then
					local var_226_42 = manager.audio:GetVoiceLength("story_v_out_318041", "318041054", "story_v_out_318041.awb") / 1000

					if var_226_42 + var_226_34 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_42 + var_226_34
					end

					if var_226_37.prefab_name ~= "" and arg_223_1.actors_[var_226_37.prefab_name] ~= nil then
						local var_226_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_37.prefab_name].transform, "story_v_out_318041", "318041054", "story_v_out_318041.awb")

						arg_223_1:RecordAudio("318041054", var_226_43)
						arg_223_1:RecordAudio("318041054", var_226_43)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_318041", "318041054", "story_v_out_318041.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_318041", "318041054", "story_v_out_318041.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_44 = math.max(var_226_35, arg_223_1.talkMaxDuration)

			if var_226_34 <= arg_223_1.time_ and arg_223_1.time_ < var_226_34 + var_226_44 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_34) / var_226_44

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_34 + var_226_44 and arg_223_1.time_ < var_226_34 + var_226_44 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play318041055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 318041055
		arg_227_1.duration_ = 7.266

		local var_227_0 = {
			zh = 5.2,
			ja = 7.266
		}
		local var_227_1 = manager.audio:GetLocalizationFlag()

		if var_227_0[var_227_1] ~= nil then
			arg_227_1.duration_ = var_227_0[var_227_1]
		end

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play318041056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["10066ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect10066ui_story == nil then
				arg_227_1.var_.characterEffect10066ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.200000002980232

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect10066ui_story then
					arg_227_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect10066ui_story then
				arg_227_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_230_4 = 0

			if var_230_4 < arg_227_1.time_ and arg_227_1.time_ <= var_230_4 + arg_230_0 then
				arg_227_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action436")
			end

			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 then
				arg_227_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_230_6 = 0
			local var_230_7 = 0.575

			if var_230_6 < arg_227_1.time_ and arg_227_1.time_ <= var_230_6 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_8 = arg_227_1:FormatText(StoryNameCfg[640].name)

				arg_227_1.leftNameTxt_.text = var_230_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_9 = arg_227_1:GetWordFromCfg(318041055)
				local var_230_10 = arg_227_1:FormatText(var_230_9.content)

				arg_227_1.text_.text = var_230_10

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_11 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041055", "story_v_out_318041.awb") ~= 0 then
					local var_230_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041055", "story_v_out_318041.awb") / 1000

					if var_230_14 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_14 + var_230_6
					end

					if var_230_9.prefab_name ~= "" and arg_227_1.actors_[var_230_9.prefab_name] ~= nil then
						local var_230_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_9.prefab_name].transform, "story_v_out_318041", "318041055", "story_v_out_318041.awb")

						arg_227_1:RecordAudio("318041055", var_230_15)
						arg_227_1:RecordAudio("318041055", var_230_15)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_318041", "318041055", "story_v_out_318041.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_318041", "318041055", "story_v_out_318041.awb")
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
	Play318041056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 318041056
		arg_231_1.duration_ = 6.133

		local var_231_0 = {
			zh = 6.133,
			ja = 5.2
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
				arg_231_0:Play318041057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1050ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1050ui_story == nil then
				arg_231_1.var_.characterEffect1050ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1050ui_story then
					arg_231_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1050ui_story then
				arg_231_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_234_4 = 0

			if var_234_4 < arg_231_1.time_ and arg_231_1.time_ <= var_234_4 + arg_234_0 then
				arg_231_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_2")
			end

			local var_234_5 = 0

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 then
				arg_231_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_234_6 = arg_231_1.actors_["10066ui_story"]
			local var_234_7 = 0

			if var_234_7 < arg_231_1.time_ and arg_231_1.time_ <= var_234_7 + arg_234_0 and arg_231_1.var_.characterEffect10066ui_story == nil then
				arg_231_1.var_.characterEffect10066ui_story = var_234_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_8 = 0.200000002980232

			if var_234_7 <= arg_231_1.time_ and arg_231_1.time_ < var_234_7 + var_234_8 then
				local var_234_9 = (arg_231_1.time_ - var_234_7) / var_234_8

				if arg_231_1.var_.characterEffect10066ui_story then
					local var_234_10 = Mathf.Lerp(0, 0.5, var_234_9)

					arg_231_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_231_1.var_.characterEffect10066ui_story.fillRatio = var_234_10
				end
			end

			if arg_231_1.time_ >= var_234_7 + var_234_8 and arg_231_1.time_ < var_234_7 + var_234_8 + arg_234_0 and arg_231_1.var_.characterEffect10066ui_story then
				local var_234_11 = 0.5

				arg_231_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_231_1.var_.characterEffect10066ui_story.fillRatio = var_234_11
			end

			local var_234_12 = 0
			local var_234_13 = 0.675

			if var_234_12 < arg_231_1.time_ and arg_231_1.time_ <= var_234_12 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_14 = arg_231_1:FormatText(StoryNameCfg[74].name)

				arg_231_1.leftNameTxt_.text = var_234_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_15 = arg_231_1:GetWordFromCfg(318041056)
				local var_234_16 = arg_231_1:FormatText(var_234_15.content)

				arg_231_1.text_.text = var_234_16

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_17 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041056", "story_v_out_318041.awb") ~= 0 then
					local var_234_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041056", "story_v_out_318041.awb") / 1000

					if var_234_20 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_12
					end

					if var_234_15.prefab_name ~= "" and arg_231_1.actors_[var_234_15.prefab_name] ~= nil then
						local var_234_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_15.prefab_name].transform, "story_v_out_318041", "318041056", "story_v_out_318041.awb")

						arg_231_1:RecordAudio("318041056", var_234_21)
						arg_231_1:RecordAudio("318041056", var_234_21)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_318041", "318041056", "story_v_out_318041.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_318041", "318041056", "story_v_out_318041.awb")
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
	Play318041057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 318041057
		arg_235_1.duration_ = 14.9

		local var_235_0 = {
			zh = 8.033,
			ja = 14.9
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
				arg_235_0:Play318041058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["10066ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect10066ui_story == nil then
				arg_235_1.var_.characterEffect10066ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.200000002980232

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect10066ui_story then
					arg_235_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect10066ui_story then
				arg_235_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_238_4 = 0

			if var_238_4 < arg_235_1.time_ and arg_235_1.time_ <= var_238_4 + arg_238_0 then
				arg_235_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_238_5 = arg_235_1.actors_["1050ui_story"]
			local var_238_6 = 0

			if var_238_6 < arg_235_1.time_ and arg_235_1.time_ <= var_238_6 + arg_238_0 and arg_235_1.var_.characterEffect1050ui_story == nil then
				arg_235_1.var_.characterEffect1050ui_story = var_238_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_7 = 0.200000002980232

			if var_238_6 <= arg_235_1.time_ and arg_235_1.time_ < var_238_6 + var_238_7 then
				local var_238_8 = (arg_235_1.time_ - var_238_6) / var_238_7

				if arg_235_1.var_.characterEffect1050ui_story then
					local var_238_9 = Mathf.Lerp(0, 0.5, var_238_8)

					arg_235_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1050ui_story.fillRatio = var_238_9
				end
			end

			if arg_235_1.time_ >= var_238_6 + var_238_7 and arg_235_1.time_ < var_238_6 + var_238_7 + arg_238_0 and arg_235_1.var_.characterEffect1050ui_story then
				local var_238_10 = 0.5

				arg_235_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1050ui_story.fillRatio = var_238_10
			end

			local var_238_11 = 0
			local var_238_12 = 0.7

			if var_238_11 < arg_235_1.time_ and arg_235_1.time_ <= var_238_11 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_13 = arg_235_1:FormatText(StoryNameCfg[640].name)

				arg_235_1.leftNameTxt_.text = var_238_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_14 = arg_235_1:GetWordFromCfg(318041057)
				local var_238_15 = arg_235_1:FormatText(var_238_14.content)

				arg_235_1.text_.text = var_238_15

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_16 = 28
				local var_238_17 = utf8.len(var_238_15)
				local var_238_18 = var_238_16 <= 0 and var_238_12 or var_238_12 * (var_238_17 / var_238_16)

				if var_238_18 > 0 and var_238_12 < var_238_18 then
					arg_235_1.talkMaxDuration = var_238_18

					if var_238_18 + var_238_11 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_18 + var_238_11
					end
				end

				arg_235_1.text_.text = var_238_15
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041057", "story_v_out_318041.awb") ~= 0 then
					local var_238_19 = manager.audio:GetVoiceLength("story_v_out_318041", "318041057", "story_v_out_318041.awb") / 1000

					if var_238_19 + var_238_11 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_19 + var_238_11
					end

					if var_238_14.prefab_name ~= "" and arg_235_1.actors_[var_238_14.prefab_name] ~= nil then
						local var_238_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_14.prefab_name].transform, "story_v_out_318041", "318041057", "story_v_out_318041.awb")

						arg_235_1:RecordAudio("318041057", var_238_20)
						arg_235_1:RecordAudio("318041057", var_238_20)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_318041", "318041057", "story_v_out_318041.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_318041", "318041057", "story_v_out_318041.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_21 = math.max(var_238_12, arg_235_1.talkMaxDuration)

			if var_238_11 <= arg_235_1.time_ and arg_235_1.time_ < var_238_11 + var_238_21 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_11) / var_238_21

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_11 + var_238_21 and arg_235_1.time_ < var_238_11 + var_238_21 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play318041058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 318041058
		arg_239_1.duration_ = 5.3

		local var_239_0 = {
			zh = 5.3,
			ja = 3.333
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
				arg_239_0:Play318041059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1050ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1050ui_story == nil then
				arg_239_1.var_.characterEffect1050ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.200000002980232

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1050ui_story then
					arg_239_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1050ui_story then
				arg_239_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_242_4 = arg_239_1.actors_["10066ui_story"]
			local var_242_5 = 0

			if var_242_5 < arg_239_1.time_ and arg_239_1.time_ <= var_242_5 + arg_242_0 and arg_239_1.var_.characterEffect10066ui_story == nil then
				arg_239_1.var_.characterEffect10066ui_story = var_242_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_6 = 0.200000002980232

			if var_242_5 <= arg_239_1.time_ and arg_239_1.time_ < var_242_5 + var_242_6 then
				local var_242_7 = (arg_239_1.time_ - var_242_5) / var_242_6

				if arg_239_1.var_.characterEffect10066ui_story then
					local var_242_8 = Mathf.Lerp(0, 0.5, var_242_7)

					arg_239_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_239_1.var_.characterEffect10066ui_story.fillRatio = var_242_8
				end
			end

			if arg_239_1.time_ >= var_242_5 + var_242_6 and arg_239_1.time_ < var_242_5 + var_242_6 + arg_242_0 and arg_239_1.var_.characterEffect10066ui_story then
				local var_242_9 = 0.5

				arg_239_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_239_1.var_.characterEffect10066ui_story.fillRatio = var_242_9
			end

			local var_242_10 = 0
			local var_242_11 = 0.55

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_12 = arg_239_1:FormatText(StoryNameCfg[74].name)

				arg_239_1.leftNameTxt_.text = var_242_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_13 = arg_239_1:GetWordFromCfg(318041058)
				local var_242_14 = arg_239_1:FormatText(var_242_13.content)

				arg_239_1.text_.text = var_242_14

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_15 = 22
				local var_242_16 = utf8.len(var_242_14)
				local var_242_17 = var_242_15 <= 0 and var_242_11 or var_242_11 * (var_242_16 / var_242_15)

				if var_242_17 > 0 and var_242_11 < var_242_17 then
					arg_239_1.talkMaxDuration = var_242_17

					if var_242_17 + var_242_10 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_17 + var_242_10
					end
				end

				arg_239_1.text_.text = var_242_14
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041058", "story_v_out_318041.awb") ~= 0 then
					local var_242_18 = manager.audio:GetVoiceLength("story_v_out_318041", "318041058", "story_v_out_318041.awb") / 1000

					if var_242_18 + var_242_10 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_18 + var_242_10
					end

					if var_242_13.prefab_name ~= "" and arg_239_1.actors_[var_242_13.prefab_name] ~= nil then
						local var_242_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_13.prefab_name].transform, "story_v_out_318041", "318041058", "story_v_out_318041.awb")

						arg_239_1:RecordAudio("318041058", var_242_19)
						arg_239_1:RecordAudio("318041058", var_242_19)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_318041", "318041058", "story_v_out_318041.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_318041", "318041058", "story_v_out_318041.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_20 = math.max(var_242_11, arg_239_1.talkMaxDuration)

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_20 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_10) / var_242_20

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_10 + var_242_20 and arg_239_1.time_ < var_242_10 + var_242_20 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play318041059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 318041059
		arg_243_1.duration_ = 8.8

		local var_243_0 = {
			zh = 8.8,
			ja = 8.5
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
				arg_243_0:Play318041060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["10066ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect10066ui_story == nil then
				arg_243_1.var_.characterEffect10066ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.200000002980232

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect10066ui_story then
					arg_243_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect10066ui_story then
				arg_243_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_246_4 = 0

			if var_246_4 < arg_243_1.time_ and arg_243_1.time_ <= var_246_4 + arg_246_0 then
				arg_243_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action6_2")
			end

			local var_246_5 = 0

			if var_246_5 < arg_243_1.time_ and arg_243_1.time_ <= var_246_5 + arg_246_0 then
				arg_243_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_246_6 = arg_243_1.actors_["1050ui_story"]
			local var_246_7 = 0

			if var_246_7 < arg_243_1.time_ and arg_243_1.time_ <= var_246_7 + arg_246_0 and arg_243_1.var_.characterEffect1050ui_story == nil then
				arg_243_1.var_.characterEffect1050ui_story = var_246_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_8 = 0.200000002980232

			if var_246_7 <= arg_243_1.time_ and arg_243_1.time_ < var_246_7 + var_246_8 then
				local var_246_9 = (arg_243_1.time_ - var_246_7) / var_246_8

				if arg_243_1.var_.characterEffect1050ui_story then
					local var_246_10 = Mathf.Lerp(0, 0.5, var_246_9)

					arg_243_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1050ui_story.fillRatio = var_246_10
				end
			end

			if arg_243_1.time_ >= var_246_7 + var_246_8 and arg_243_1.time_ < var_246_7 + var_246_8 + arg_246_0 and arg_243_1.var_.characterEffect1050ui_story then
				local var_246_11 = 0.5

				arg_243_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1050ui_story.fillRatio = var_246_11
			end

			local var_246_12 = 0
			local var_246_13 = 0.975

			if var_246_12 < arg_243_1.time_ and arg_243_1.time_ <= var_246_12 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_14 = arg_243_1:FormatText(StoryNameCfg[640].name)

				arg_243_1.leftNameTxt_.text = var_246_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_15 = arg_243_1:GetWordFromCfg(318041059)
				local var_246_16 = arg_243_1:FormatText(var_246_15.content)

				arg_243_1.text_.text = var_246_16

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_17 = 39
				local var_246_18 = utf8.len(var_246_16)
				local var_246_19 = var_246_17 <= 0 and var_246_13 or var_246_13 * (var_246_18 / var_246_17)

				if var_246_19 > 0 and var_246_13 < var_246_19 then
					arg_243_1.talkMaxDuration = var_246_19

					if var_246_19 + var_246_12 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_19 + var_246_12
					end
				end

				arg_243_1.text_.text = var_246_16
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041059", "story_v_out_318041.awb") ~= 0 then
					local var_246_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041059", "story_v_out_318041.awb") / 1000

					if var_246_20 + var_246_12 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_20 + var_246_12
					end

					if var_246_15.prefab_name ~= "" and arg_243_1.actors_[var_246_15.prefab_name] ~= nil then
						local var_246_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_15.prefab_name].transform, "story_v_out_318041", "318041059", "story_v_out_318041.awb")

						arg_243_1:RecordAudio("318041059", var_246_21)
						arg_243_1:RecordAudio("318041059", var_246_21)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_318041", "318041059", "story_v_out_318041.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_318041", "318041059", "story_v_out_318041.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_22 = math.max(var_246_13, arg_243_1.talkMaxDuration)

			if var_246_12 <= arg_243_1.time_ and arg_243_1.time_ < var_246_12 + var_246_22 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_12) / var_246_22

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_12 + var_246_22 and arg_243_1.time_ < var_246_12 + var_246_22 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play318041060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 318041060
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play318041061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10066ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect10066ui_story == nil then
				arg_247_1.var_.characterEffect10066ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.200000002980232

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect10066ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_247_1.var_.characterEffect10066ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect10066ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_247_1.var_.characterEffect10066ui_story.fillRatio = var_250_5
			end

			local var_250_6 = 0
			local var_250_7 = 1.025

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_8 = arg_247_1:GetWordFromCfg(318041060)
				local var_250_9 = arg_247_1:FormatText(var_250_8.content)

				arg_247_1.text_.text = var_250_9

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_10 = 41
				local var_250_11 = utf8.len(var_250_9)
				local var_250_12 = var_250_10 <= 0 and var_250_7 or var_250_7 * (var_250_11 / var_250_10)

				if var_250_12 > 0 and var_250_7 < var_250_12 then
					arg_247_1.talkMaxDuration = var_250_12

					if var_250_12 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_12 + var_250_6
					end
				end

				arg_247_1.text_.text = var_250_9
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_13 = math.max(var_250_7, arg_247_1.talkMaxDuration)

			if var_250_6 <= arg_247_1.time_ and arg_247_1.time_ < var_250_6 + var_250_13 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_6) / var_250_13

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_6 + var_250_13 and arg_247_1.time_ < var_250_6 + var_250_13 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play318041061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 318041061
		arg_251_1.duration_ = 5.8

		local var_251_0 = {
			zh = 5.8,
			ja = 4.533
		}
		local var_251_1 = manager.audio:GetLocalizationFlag()

		if var_251_0[var_251_1] ~= nil then
			arg_251_1.duration_ = var_251_0[var_251_1]
		end

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play318041062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10066ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect10066ui_story == nil then
				arg_251_1.var_.characterEffect10066ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.200000002980232

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect10066ui_story then
					arg_251_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect10066ui_story then
				arg_251_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_254_4 = 0

			if var_254_4 < arg_251_1.time_ and arg_251_1.time_ <= var_254_4 + arg_254_0 then
				arg_251_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_254_5 = 0
			local var_254_6 = 0.675

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_7 = arg_251_1:FormatText(StoryNameCfg[640].name)

				arg_251_1.leftNameTxt_.text = var_254_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_8 = arg_251_1:GetWordFromCfg(318041061)
				local var_254_9 = arg_251_1:FormatText(var_254_8.content)

				arg_251_1.text_.text = var_254_9

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_10 = 27
				local var_254_11 = utf8.len(var_254_9)
				local var_254_12 = var_254_10 <= 0 and var_254_6 or var_254_6 * (var_254_11 / var_254_10)

				if var_254_12 > 0 and var_254_6 < var_254_12 then
					arg_251_1.talkMaxDuration = var_254_12

					if var_254_12 + var_254_5 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_12 + var_254_5
					end
				end

				arg_251_1.text_.text = var_254_9
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041061", "story_v_out_318041.awb") ~= 0 then
					local var_254_13 = manager.audio:GetVoiceLength("story_v_out_318041", "318041061", "story_v_out_318041.awb") / 1000

					if var_254_13 + var_254_5 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_13 + var_254_5
					end

					if var_254_8.prefab_name ~= "" and arg_251_1.actors_[var_254_8.prefab_name] ~= nil then
						local var_254_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_8.prefab_name].transform, "story_v_out_318041", "318041061", "story_v_out_318041.awb")

						arg_251_1:RecordAudio("318041061", var_254_14)
						arg_251_1:RecordAudio("318041061", var_254_14)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_318041", "318041061", "story_v_out_318041.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_318041", "318041061", "story_v_out_318041.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_15 = math.max(var_254_6, arg_251_1.talkMaxDuration)

			if var_254_5 <= arg_251_1.time_ and arg_251_1.time_ < var_254_5 + var_254_15 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_5) / var_254_15

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_5 + var_254_15 and arg_251_1.time_ < var_254_5 + var_254_15 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play318041062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 318041062
		arg_255_1.duration_ = 6.8

		local var_255_0 = {
			zh = 6.8,
			ja = 5.4
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
				arg_255_0:Play318041063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1050ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1050ui_story == nil then
				arg_255_1.var_.characterEffect1050ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.200000002980232

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1050ui_story then
					arg_255_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1050ui_story then
				arg_255_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_258_4 = 0

			if var_258_4 < arg_255_1.time_ and arg_255_1.time_ <= var_258_4 + arg_258_0 then
				arg_255_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action5_1")
			end

			local var_258_5 = 0

			if var_258_5 < arg_255_1.time_ and arg_255_1.time_ <= var_258_5 + arg_258_0 then
				arg_255_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_258_6 = arg_255_1.actors_["10066ui_story"]
			local var_258_7 = 0

			if var_258_7 < arg_255_1.time_ and arg_255_1.time_ <= var_258_7 + arg_258_0 and arg_255_1.var_.characterEffect10066ui_story == nil then
				arg_255_1.var_.characterEffect10066ui_story = var_258_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_8 = 0.200000002980232

			if var_258_7 <= arg_255_1.time_ and arg_255_1.time_ < var_258_7 + var_258_8 then
				local var_258_9 = (arg_255_1.time_ - var_258_7) / var_258_8

				if arg_255_1.var_.characterEffect10066ui_story then
					local var_258_10 = Mathf.Lerp(0, 0.5, var_258_9)

					arg_255_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_255_1.var_.characterEffect10066ui_story.fillRatio = var_258_10
				end
			end

			if arg_255_1.time_ >= var_258_7 + var_258_8 and arg_255_1.time_ < var_258_7 + var_258_8 + arg_258_0 and arg_255_1.var_.characterEffect10066ui_story then
				local var_258_11 = 0.5

				arg_255_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_255_1.var_.characterEffect10066ui_story.fillRatio = var_258_11
			end

			local var_258_12 = 0
			local var_258_13 = 0.6

			if var_258_12 < arg_255_1.time_ and arg_255_1.time_ <= var_258_12 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_14 = arg_255_1:FormatText(StoryNameCfg[74].name)

				arg_255_1.leftNameTxt_.text = var_258_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_15 = arg_255_1:GetWordFromCfg(318041062)
				local var_258_16 = arg_255_1:FormatText(var_258_15.content)

				arg_255_1.text_.text = var_258_16

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_17 = 24
				local var_258_18 = utf8.len(var_258_16)
				local var_258_19 = var_258_17 <= 0 and var_258_13 or var_258_13 * (var_258_18 / var_258_17)

				if var_258_19 > 0 and var_258_13 < var_258_19 then
					arg_255_1.talkMaxDuration = var_258_19

					if var_258_19 + var_258_12 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_19 + var_258_12
					end
				end

				arg_255_1.text_.text = var_258_16
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041062", "story_v_out_318041.awb") ~= 0 then
					local var_258_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041062", "story_v_out_318041.awb") / 1000

					if var_258_20 + var_258_12 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_20 + var_258_12
					end

					if var_258_15.prefab_name ~= "" and arg_255_1.actors_[var_258_15.prefab_name] ~= nil then
						local var_258_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_15.prefab_name].transform, "story_v_out_318041", "318041062", "story_v_out_318041.awb")

						arg_255_1:RecordAudio("318041062", var_258_21)
						arg_255_1:RecordAudio("318041062", var_258_21)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_318041", "318041062", "story_v_out_318041.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_318041", "318041062", "story_v_out_318041.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_22 = math.max(var_258_13, arg_255_1.talkMaxDuration)

			if var_258_12 <= arg_255_1.time_ and arg_255_1.time_ < var_258_12 + var_258_22 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_12) / var_258_22

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_12 + var_258_22 and arg_255_1.time_ < var_258_12 + var_258_22 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play318041063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 318041063
		arg_259_1.duration_ = 4.833

		local var_259_0 = {
			zh = 4.833,
			ja = 3.8
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
				arg_259_0:Play318041064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10066ui_story"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos10066ui_story = var_262_0.localPosition
			end

			local var_262_2 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2
				local var_262_4 = Vector3.New(0.7, -0.99, -5.83)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10066ui_story, var_262_4, var_262_3)

				local var_262_5 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_5.x, var_262_5.y, var_262_5.z)

				local var_262_6 = var_262_0.localEulerAngles

				var_262_6.z = 0
				var_262_6.x = 0
				var_262_0.localEulerAngles = var_262_6
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_262_7 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_7.x, var_262_7.y, var_262_7.z)

				local var_262_8 = var_262_0.localEulerAngles

				var_262_8.z = 0
				var_262_8.x = 0
				var_262_0.localEulerAngles = var_262_8
			end

			local var_262_9 = arg_259_1.actors_["10066ui_story"]
			local var_262_10 = 0

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 and arg_259_1.var_.characterEffect10066ui_story == nil then
				arg_259_1.var_.characterEffect10066ui_story = var_262_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_11 = 0.200000002980232

			if var_262_10 <= arg_259_1.time_ and arg_259_1.time_ < var_262_10 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_10) / var_262_11

				if arg_259_1.var_.characterEffect10066ui_story then
					arg_259_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_10 + var_262_11 and arg_259_1.time_ < var_262_10 + var_262_11 + arg_262_0 and arg_259_1.var_.characterEffect10066ui_story then
				arg_259_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_262_13 = 0

			if var_262_13 < arg_259_1.time_ and arg_259_1.time_ <= var_262_13 + arg_262_0 then
				arg_259_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action1_1")
			end

			local var_262_14 = 0

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 then
				arg_259_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_262_15 = arg_259_1.actors_["1050ui_story"]
			local var_262_16 = 0

			if var_262_16 < arg_259_1.time_ and arg_259_1.time_ <= var_262_16 + arg_262_0 and arg_259_1.var_.characterEffect1050ui_story == nil then
				arg_259_1.var_.characterEffect1050ui_story = var_262_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_17 = 0.200000002980232

			if var_262_16 <= arg_259_1.time_ and arg_259_1.time_ < var_262_16 + var_262_17 then
				local var_262_18 = (arg_259_1.time_ - var_262_16) / var_262_17

				if arg_259_1.var_.characterEffect1050ui_story then
					local var_262_19 = Mathf.Lerp(0, 0.5, var_262_18)

					arg_259_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1050ui_story.fillRatio = var_262_19
				end
			end

			if arg_259_1.time_ >= var_262_16 + var_262_17 and arg_259_1.time_ < var_262_16 + var_262_17 + arg_262_0 and arg_259_1.var_.characterEffect1050ui_story then
				local var_262_20 = 0.5

				arg_259_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1050ui_story.fillRatio = var_262_20
			end

			local var_262_21 = 0
			local var_262_22 = 0.3

			if var_262_21 < arg_259_1.time_ and arg_259_1.time_ <= var_262_21 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_23 = arg_259_1:FormatText(StoryNameCfg[640].name)

				arg_259_1.leftNameTxt_.text = var_262_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_24 = arg_259_1:GetWordFromCfg(318041063)
				local var_262_25 = arg_259_1:FormatText(var_262_24.content)

				arg_259_1.text_.text = var_262_25

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_26 = 12
				local var_262_27 = utf8.len(var_262_25)
				local var_262_28 = var_262_26 <= 0 and var_262_22 or var_262_22 * (var_262_27 / var_262_26)

				if var_262_28 > 0 and var_262_22 < var_262_28 then
					arg_259_1.talkMaxDuration = var_262_28

					if var_262_28 + var_262_21 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_28 + var_262_21
					end
				end

				arg_259_1.text_.text = var_262_25
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041063", "story_v_out_318041.awb") ~= 0 then
					local var_262_29 = manager.audio:GetVoiceLength("story_v_out_318041", "318041063", "story_v_out_318041.awb") / 1000

					if var_262_29 + var_262_21 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_29 + var_262_21
					end

					if var_262_24.prefab_name ~= "" and arg_259_1.actors_[var_262_24.prefab_name] ~= nil then
						local var_262_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_24.prefab_name].transform, "story_v_out_318041", "318041063", "story_v_out_318041.awb")

						arg_259_1:RecordAudio("318041063", var_262_30)
						arg_259_1:RecordAudio("318041063", var_262_30)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_318041", "318041063", "story_v_out_318041.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_318041", "318041063", "story_v_out_318041.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_31 = math.max(var_262_22, arg_259_1.talkMaxDuration)

			if var_262_21 <= arg_259_1.time_ and arg_259_1.time_ < var_262_21 + var_262_31 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_21) / var_262_31

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_21 + var_262_31 and arg_259_1.time_ < var_262_21 + var_262_31 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play318041064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 318041064
		arg_263_1.duration_ = 7.133

		local var_263_0 = {
			zh = 3,
			ja = 7.133
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
				arg_263_0:Play318041065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1050ui_story"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.characterEffect1050ui_story == nil then
				arg_263_1.var_.characterEffect1050ui_story = var_266_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_2 = 0.200000002980232

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.characterEffect1050ui_story then
					arg_263_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.characterEffect1050ui_story then
				arg_263_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_266_4 = arg_263_1.actors_["10066ui_story"]
			local var_266_5 = 0

			if var_266_5 < arg_263_1.time_ and arg_263_1.time_ <= var_266_5 + arg_266_0 and arg_263_1.var_.characterEffect10066ui_story == nil then
				arg_263_1.var_.characterEffect10066ui_story = var_266_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_6 = 0.200000002980232

			if var_266_5 <= arg_263_1.time_ and arg_263_1.time_ < var_266_5 + var_266_6 then
				local var_266_7 = (arg_263_1.time_ - var_266_5) / var_266_6

				if arg_263_1.var_.characterEffect10066ui_story then
					local var_266_8 = Mathf.Lerp(0, 0.5, var_266_7)

					arg_263_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_263_1.var_.characterEffect10066ui_story.fillRatio = var_266_8
				end
			end

			if arg_263_1.time_ >= var_266_5 + var_266_6 and arg_263_1.time_ < var_266_5 + var_266_6 + arg_266_0 and arg_263_1.var_.characterEffect10066ui_story then
				local var_266_9 = 0.5

				arg_263_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_263_1.var_.characterEffect10066ui_story.fillRatio = var_266_9
			end

			local var_266_10 = 0
			local var_266_11 = 0.375

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_12 = arg_263_1:FormatText(StoryNameCfg[74].name)

				arg_263_1.leftNameTxt_.text = var_266_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_13 = arg_263_1:GetWordFromCfg(318041064)
				local var_266_14 = arg_263_1:FormatText(var_266_13.content)

				arg_263_1.text_.text = var_266_14

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_15 = 15
				local var_266_16 = utf8.len(var_266_14)
				local var_266_17 = var_266_15 <= 0 and var_266_11 or var_266_11 * (var_266_16 / var_266_15)

				if var_266_17 > 0 and var_266_11 < var_266_17 then
					arg_263_1.talkMaxDuration = var_266_17

					if var_266_17 + var_266_10 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_17 + var_266_10
					end
				end

				arg_263_1.text_.text = var_266_14
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041064", "story_v_out_318041.awb") ~= 0 then
					local var_266_18 = manager.audio:GetVoiceLength("story_v_out_318041", "318041064", "story_v_out_318041.awb") / 1000

					if var_266_18 + var_266_10 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_18 + var_266_10
					end

					if var_266_13.prefab_name ~= "" and arg_263_1.actors_[var_266_13.prefab_name] ~= nil then
						local var_266_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_13.prefab_name].transform, "story_v_out_318041", "318041064", "story_v_out_318041.awb")

						arg_263_1:RecordAudio("318041064", var_266_19)
						arg_263_1:RecordAudio("318041064", var_266_19)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_318041", "318041064", "story_v_out_318041.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_318041", "318041064", "story_v_out_318041.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_20 = math.max(var_266_11, arg_263_1.talkMaxDuration)

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_20 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_10) / var_266_20

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_10 + var_266_20 and arg_263_1.time_ < var_266_10 + var_266_20 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play318041065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 318041065
		arg_267_1.duration_ = 6.333

		local var_267_0 = {
			zh = 4.1,
			ja = 6.333
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
				arg_267_0:Play318041066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["10066ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect10066ui_story == nil then
				arg_267_1.var_.characterEffect10066ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.200000002980232

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect10066ui_story then
					arg_267_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect10066ui_story then
				arg_267_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_270_4 = 0

			if var_270_4 < arg_267_1.time_ and arg_267_1.time_ <= var_270_4 + arg_270_0 then
				arg_267_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action5_1")
			end

			local var_270_5 = 0

			if var_270_5 < arg_267_1.time_ and arg_267_1.time_ <= var_270_5 + arg_270_0 then
				arg_267_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_270_6 = arg_267_1.actors_["1050ui_story"]
			local var_270_7 = 0

			if var_270_7 < arg_267_1.time_ and arg_267_1.time_ <= var_270_7 + arg_270_0 and arg_267_1.var_.characterEffect1050ui_story == nil then
				arg_267_1.var_.characterEffect1050ui_story = var_270_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_8 = 0.200000002980232

			if var_270_7 <= arg_267_1.time_ and arg_267_1.time_ < var_270_7 + var_270_8 then
				local var_270_9 = (arg_267_1.time_ - var_270_7) / var_270_8

				if arg_267_1.var_.characterEffect1050ui_story then
					local var_270_10 = Mathf.Lerp(0, 0.5, var_270_9)

					arg_267_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1050ui_story.fillRatio = var_270_10
				end
			end

			if arg_267_1.time_ >= var_270_7 + var_270_8 and arg_267_1.time_ < var_270_7 + var_270_8 + arg_270_0 and arg_267_1.var_.characterEffect1050ui_story then
				local var_270_11 = 0.5

				arg_267_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1050ui_story.fillRatio = var_270_11
			end

			local var_270_12 = 0
			local var_270_13 = 0.275

			if var_270_12 < arg_267_1.time_ and arg_267_1.time_ <= var_270_12 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_14 = arg_267_1:FormatText(StoryNameCfg[640].name)

				arg_267_1.leftNameTxt_.text = var_270_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_15 = arg_267_1:GetWordFromCfg(318041065)
				local var_270_16 = arg_267_1:FormatText(var_270_15.content)

				arg_267_1.text_.text = var_270_16

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_17 = 11
				local var_270_18 = utf8.len(var_270_16)
				local var_270_19 = var_270_17 <= 0 and var_270_13 or var_270_13 * (var_270_18 / var_270_17)

				if var_270_19 > 0 and var_270_13 < var_270_19 then
					arg_267_1.talkMaxDuration = var_270_19

					if var_270_19 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_19 + var_270_12
					end
				end

				arg_267_1.text_.text = var_270_16
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041065", "story_v_out_318041.awb") ~= 0 then
					local var_270_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041065", "story_v_out_318041.awb") / 1000

					if var_270_20 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_20 + var_270_12
					end

					if var_270_15.prefab_name ~= "" and arg_267_1.actors_[var_270_15.prefab_name] ~= nil then
						local var_270_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_15.prefab_name].transform, "story_v_out_318041", "318041065", "story_v_out_318041.awb")

						arg_267_1:RecordAudio("318041065", var_270_21)
						arg_267_1:RecordAudio("318041065", var_270_21)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_318041", "318041065", "story_v_out_318041.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_318041", "318041065", "story_v_out_318041.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_22 = math.max(var_270_13, arg_267_1.talkMaxDuration)

			if var_270_12 <= arg_267_1.time_ and arg_267_1.time_ < var_270_12 + var_270_22 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_12) / var_270_22

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_12 + var_270_22 and arg_267_1.time_ < var_270_12 + var_270_22 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play318041066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 318041066
		arg_271_1.duration_ = 5.833

		local var_271_0 = {
			zh = 5.833,
			ja = 4.866
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
				arg_271_0:Play318041067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1050ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.characterEffect1050ui_story == nil then
				arg_271_1.var_.characterEffect1050ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.200000002980232

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect1050ui_story then
					arg_271_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect1050ui_story then
				arg_271_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_274_4 = 0

			if var_274_4 < arg_271_1.time_ and arg_271_1.time_ <= var_274_4 + arg_274_0 then
				arg_271_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050actionlink/1050action452")
			end

			local var_274_5 = 0

			if var_274_5 < arg_271_1.time_ and arg_271_1.time_ <= var_274_5 + arg_274_0 then
				arg_271_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_274_6 = arg_271_1.actors_["10066ui_story"]
			local var_274_7 = 0

			if var_274_7 < arg_271_1.time_ and arg_271_1.time_ <= var_274_7 + arg_274_0 and arg_271_1.var_.characterEffect10066ui_story == nil then
				arg_271_1.var_.characterEffect10066ui_story = var_274_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_8 = 0.200000002980232

			if var_274_7 <= arg_271_1.time_ and arg_271_1.time_ < var_274_7 + var_274_8 then
				local var_274_9 = (arg_271_1.time_ - var_274_7) / var_274_8

				if arg_271_1.var_.characterEffect10066ui_story then
					local var_274_10 = Mathf.Lerp(0, 0.5, var_274_9)

					arg_271_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_271_1.var_.characterEffect10066ui_story.fillRatio = var_274_10
				end
			end

			if arg_271_1.time_ >= var_274_7 + var_274_8 and arg_271_1.time_ < var_274_7 + var_274_8 + arg_274_0 and arg_271_1.var_.characterEffect10066ui_story then
				local var_274_11 = 0.5

				arg_271_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_271_1.var_.characterEffect10066ui_story.fillRatio = var_274_11
			end

			local var_274_12 = 0
			local var_274_13 = 0.45

			if var_274_12 < arg_271_1.time_ and arg_271_1.time_ <= var_274_12 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_14 = arg_271_1:FormatText(StoryNameCfg[74].name)

				arg_271_1.leftNameTxt_.text = var_274_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_15 = arg_271_1:GetWordFromCfg(318041066)
				local var_274_16 = arg_271_1:FormatText(var_274_15.content)

				arg_271_1.text_.text = var_274_16

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_17 = 18
				local var_274_18 = utf8.len(var_274_16)
				local var_274_19 = var_274_17 <= 0 and var_274_13 or var_274_13 * (var_274_18 / var_274_17)

				if var_274_19 > 0 and var_274_13 < var_274_19 then
					arg_271_1.talkMaxDuration = var_274_19

					if var_274_19 + var_274_12 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_19 + var_274_12
					end
				end

				arg_271_1.text_.text = var_274_16
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041066", "story_v_out_318041.awb") ~= 0 then
					local var_274_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041066", "story_v_out_318041.awb") / 1000

					if var_274_20 + var_274_12 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_20 + var_274_12
					end

					if var_274_15.prefab_name ~= "" and arg_271_1.actors_[var_274_15.prefab_name] ~= nil then
						local var_274_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_15.prefab_name].transform, "story_v_out_318041", "318041066", "story_v_out_318041.awb")

						arg_271_1:RecordAudio("318041066", var_274_21)
						arg_271_1:RecordAudio("318041066", var_274_21)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_318041", "318041066", "story_v_out_318041.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_318041", "318041066", "story_v_out_318041.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_22 = math.max(var_274_13, arg_271_1.talkMaxDuration)

			if var_274_12 <= arg_271_1.time_ and arg_271_1.time_ < var_274_12 + var_274_22 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_12) / var_274_22

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_12 + var_274_22 and arg_271_1.time_ < var_274_12 + var_274_22 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play318041067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 318041067
		arg_275_1.duration_ = 5.8

		local var_275_0 = {
			zh = 5.8,
			ja = 3.3
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
				arg_275_0:Play318041068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["10066ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect10066ui_story == nil then
				arg_275_1.var_.characterEffect10066ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.200000002980232

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect10066ui_story then
					arg_275_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect10066ui_story then
				arg_275_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_278_4 = 0

			if var_278_4 < arg_275_1.time_ and arg_275_1.time_ <= var_278_4 + arg_278_0 then
				arg_275_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action457")
			end

			local var_278_5 = 0

			if var_278_5 < arg_275_1.time_ and arg_275_1.time_ <= var_278_5 + arg_278_0 then
				arg_275_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_278_6 = arg_275_1.actors_["1050ui_story"]
			local var_278_7 = 0

			if var_278_7 < arg_275_1.time_ and arg_275_1.time_ <= var_278_7 + arg_278_0 and arg_275_1.var_.characterEffect1050ui_story == nil then
				arg_275_1.var_.characterEffect1050ui_story = var_278_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_8 = 0.200000002980232

			if var_278_7 <= arg_275_1.time_ and arg_275_1.time_ < var_278_7 + var_278_8 then
				local var_278_9 = (arg_275_1.time_ - var_278_7) / var_278_8

				if arg_275_1.var_.characterEffect1050ui_story then
					local var_278_10 = Mathf.Lerp(0, 0.5, var_278_9)

					arg_275_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_275_1.var_.characterEffect1050ui_story.fillRatio = var_278_10
				end
			end

			if arg_275_1.time_ >= var_278_7 + var_278_8 and arg_275_1.time_ < var_278_7 + var_278_8 + arg_278_0 and arg_275_1.var_.characterEffect1050ui_story then
				local var_278_11 = 0.5

				arg_275_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_275_1.var_.characterEffect1050ui_story.fillRatio = var_278_11
			end

			local var_278_12 = 0
			local var_278_13 = 0.5

			if var_278_12 < arg_275_1.time_ and arg_275_1.time_ <= var_278_12 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_14 = arg_275_1:FormatText(StoryNameCfg[640].name)

				arg_275_1.leftNameTxt_.text = var_278_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_15 = arg_275_1:GetWordFromCfg(318041067)
				local var_278_16 = arg_275_1:FormatText(var_278_15.content)

				arg_275_1.text_.text = var_278_16

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_17 = 20
				local var_278_18 = utf8.len(var_278_16)
				local var_278_19 = var_278_17 <= 0 and var_278_13 or var_278_13 * (var_278_18 / var_278_17)

				if var_278_19 > 0 and var_278_13 < var_278_19 then
					arg_275_1.talkMaxDuration = var_278_19

					if var_278_19 + var_278_12 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_19 + var_278_12
					end
				end

				arg_275_1.text_.text = var_278_16
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041067", "story_v_out_318041.awb") ~= 0 then
					local var_278_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041067", "story_v_out_318041.awb") / 1000

					if var_278_20 + var_278_12 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_20 + var_278_12
					end

					if var_278_15.prefab_name ~= "" and arg_275_1.actors_[var_278_15.prefab_name] ~= nil then
						local var_278_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_15.prefab_name].transform, "story_v_out_318041", "318041067", "story_v_out_318041.awb")

						arg_275_1:RecordAudio("318041067", var_278_21)
						arg_275_1:RecordAudio("318041067", var_278_21)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_318041", "318041067", "story_v_out_318041.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_318041", "318041067", "story_v_out_318041.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_22 = math.max(var_278_13, arg_275_1.talkMaxDuration)

			if var_278_12 <= arg_275_1.time_ and arg_275_1.time_ < var_278_12 + var_278_22 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_12) / var_278_22

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_12 + var_278_22 and arg_275_1.time_ < var_278_12 + var_278_22 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play318041068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 318041068
		arg_279_1.duration_ = 2.2

		local var_279_0 = {
			zh = 2.166,
			ja = 2.2
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
				arg_279_0:Play318041069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1050ui_story"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect1050ui_story == nil then
				arg_279_1.var_.characterEffect1050ui_story = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.200000002980232

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect1050ui_story then
					arg_279_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1050ui_story then
				arg_279_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_282_4 = arg_279_1.actors_["10066ui_story"]
			local var_282_5 = 0

			if var_282_5 < arg_279_1.time_ and arg_279_1.time_ <= var_282_5 + arg_282_0 and arg_279_1.var_.characterEffect10066ui_story == nil then
				arg_279_1.var_.characterEffect10066ui_story = var_282_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_6 = 0.200000002980232

			if var_282_5 <= arg_279_1.time_ and arg_279_1.time_ < var_282_5 + var_282_6 then
				local var_282_7 = (arg_279_1.time_ - var_282_5) / var_282_6

				if arg_279_1.var_.characterEffect10066ui_story then
					local var_282_8 = Mathf.Lerp(0, 0.5, var_282_7)

					arg_279_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_279_1.var_.characterEffect10066ui_story.fillRatio = var_282_8
				end
			end

			if arg_279_1.time_ >= var_282_5 + var_282_6 and arg_279_1.time_ < var_282_5 + var_282_6 + arg_282_0 and arg_279_1.var_.characterEffect10066ui_story then
				local var_282_9 = 0.5

				arg_279_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_279_1.var_.characterEffect10066ui_story.fillRatio = var_282_9
			end

			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 then
				arg_279_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action5_1")
			end

			local var_282_11 = 0

			if var_282_11 < arg_279_1.time_ and arg_279_1.time_ <= var_282_11 + arg_282_0 then
				arg_279_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_282_12 = 0
			local var_282_13 = 0.2

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[74].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(318041068)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 8
				local var_282_18 = utf8.len(var_282_16)
				local var_282_19 = var_282_17 <= 0 and var_282_13 or var_282_13 * (var_282_18 / var_282_17)

				if var_282_19 > 0 and var_282_13 < var_282_19 then
					arg_279_1.talkMaxDuration = var_282_19

					if var_282_19 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_12
					end
				end

				arg_279_1.text_.text = var_282_16
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041068", "story_v_out_318041.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041068", "story_v_out_318041.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_out_318041", "318041068", "story_v_out_318041.awb")

						arg_279_1:RecordAudio("318041068", var_282_21)
						arg_279_1:RecordAudio("318041068", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_318041", "318041068", "story_v_out_318041.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_318041", "318041068", "story_v_out_318041.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_22 = math.max(var_282_13, arg_279_1.talkMaxDuration)

			if var_282_12 <= arg_279_1.time_ and arg_279_1.time_ < var_282_12 + var_282_22 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_12) / var_282_22

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_12 + var_282_22 and arg_279_1.time_ < var_282_12 + var_282_22 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play318041069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 318041069
		arg_283_1.duration_ = 9.666

		local var_283_0 = {
			zh = 3.3,
			ja = 9.666
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
				arg_283_0:Play318041070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["10066ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect10066ui_story == nil then
				arg_283_1.var_.characterEffect10066ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.200000002980232

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect10066ui_story then
					arg_283_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect10066ui_story then
				arg_283_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_286_4 = 0

			if var_286_4 < arg_283_1.time_ and arg_283_1.time_ <= var_286_4 + arg_286_0 then
				arg_283_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action474")
			end

			local var_286_5 = 0

			if var_286_5 < arg_283_1.time_ and arg_283_1.time_ <= var_286_5 + arg_286_0 then
				arg_283_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_286_6 = arg_283_1.actors_["1050ui_story"]
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 and arg_283_1.var_.characterEffect1050ui_story == nil then
				arg_283_1.var_.characterEffect1050ui_story = var_286_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_8 = 0.200000002980232

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_8 then
				local var_286_9 = (arg_283_1.time_ - var_286_7) / var_286_8

				if arg_283_1.var_.characterEffect1050ui_story then
					local var_286_10 = Mathf.Lerp(0, 0.5, var_286_9)

					arg_283_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1050ui_story.fillRatio = var_286_10
				end
			end

			if arg_283_1.time_ >= var_286_7 + var_286_8 and arg_283_1.time_ < var_286_7 + var_286_8 + arg_286_0 and arg_283_1.var_.characterEffect1050ui_story then
				local var_286_11 = 0.5

				arg_283_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1050ui_story.fillRatio = var_286_11
			end

			local var_286_12 = 0
			local var_286_13 = 0.3

			if var_286_12 < arg_283_1.time_ and arg_283_1.time_ <= var_286_12 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_14 = arg_283_1:FormatText(StoryNameCfg[640].name)

				arg_283_1.leftNameTxt_.text = var_286_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_15 = arg_283_1:GetWordFromCfg(318041069)
				local var_286_16 = arg_283_1:FormatText(var_286_15.content)

				arg_283_1.text_.text = var_286_16

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_17 = 12
				local var_286_18 = utf8.len(var_286_16)
				local var_286_19 = var_286_17 <= 0 and var_286_13 or var_286_13 * (var_286_18 / var_286_17)

				if var_286_19 > 0 and var_286_13 < var_286_19 then
					arg_283_1.talkMaxDuration = var_286_19

					if var_286_19 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_19 + var_286_12
					end
				end

				arg_283_1.text_.text = var_286_16
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041069", "story_v_out_318041.awb") ~= 0 then
					local var_286_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041069", "story_v_out_318041.awb") / 1000

					if var_286_20 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_20 + var_286_12
					end

					if var_286_15.prefab_name ~= "" and arg_283_1.actors_[var_286_15.prefab_name] ~= nil then
						local var_286_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_15.prefab_name].transform, "story_v_out_318041", "318041069", "story_v_out_318041.awb")

						arg_283_1:RecordAudio("318041069", var_286_21)
						arg_283_1:RecordAudio("318041069", var_286_21)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_318041", "318041069", "story_v_out_318041.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_318041", "318041069", "story_v_out_318041.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_22 = math.max(var_286_13, arg_283_1.talkMaxDuration)

			if var_286_12 <= arg_283_1.time_ and arg_283_1.time_ < var_286_12 + var_286_22 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_12) / var_286_22

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_12 + var_286_22 and arg_283_1.time_ < var_286_12 + var_286_22 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play318041070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 318041070
		arg_287_1.duration_ = 1.999999999999

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play318041071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1050ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1050ui_story == nil then
				arg_287_1.var_.characterEffect1050ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.200000002980232

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1050ui_story then
					arg_287_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1050ui_story then
				arg_287_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_290_4 = 0

			if var_290_4 < arg_287_1.time_ and arg_287_1.time_ <= var_290_4 + arg_290_0 then
				arg_287_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action2_2")
			end

			local var_290_5 = 0

			if var_290_5 < arg_287_1.time_ and arg_287_1.time_ <= var_290_5 + arg_290_0 then
				arg_287_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_290_6 = arg_287_1.actors_["10066ui_story"]
			local var_290_7 = 0

			if var_290_7 < arg_287_1.time_ and arg_287_1.time_ <= var_290_7 + arg_290_0 and arg_287_1.var_.characterEffect10066ui_story == nil then
				arg_287_1.var_.characterEffect10066ui_story = var_290_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_8 = 0.200000002980232

			if var_290_7 <= arg_287_1.time_ and arg_287_1.time_ < var_290_7 + var_290_8 then
				local var_290_9 = (arg_287_1.time_ - var_290_7) / var_290_8

				if arg_287_1.var_.characterEffect10066ui_story then
					local var_290_10 = Mathf.Lerp(0, 0.5, var_290_9)

					arg_287_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_287_1.var_.characterEffect10066ui_story.fillRatio = var_290_10
				end
			end

			if arg_287_1.time_ >= var_290_7 + var_290_8 and arg_287_1.time_ < var_290_7 + var_290_8 + arg_290_0 and arg_287_1.var_.characterEffect10066ui_story then
				local var_290_11 = 0.5

				arg_287_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_287_1.var_.characterEffect10066ui_story.fillRatio = var_290_11
			end

			local var_290_12 = 0
			local var_290_13 = 0.1

			if var_290_12 < arg_287_1.time_ and arg_287_1.time_ <= var_290_12 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_14 = arg_287_1:FormatText(StoryNameCfg[74].name)

				arg_287_1.leftNameTxt_.text = var_290_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_15 = arg_287_1:GetWordFromCfg(318041070)
				local var_290_16 = arg_287_1:FormatText(var_290_15.content)

				arg_287_1.text_.text = var_290_16

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_17 = 4
				local var_290_18 = utf8.len(var_290_16)
				local var_290_19 = var_290_17 <= 0 and var_290_13 or var_290_13 * (var_290_18 / var_290_17)

				if var_290_19 > 0 and var_290_13 < var_290_19 then
					arg_287_1.talkMaxDuration = var_290_19

					if var_290_19 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_19 + var_290_12
					end
				end

				arg_287_1.text_.text = var_290_16
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041070", "story_v_out_318041.awb") ~= 0 then
					local var_290_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041070", "story_v_out_318041.awb") / 1000

					if var_290_20 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_20 + var_290_12
					end

					if var_290_15.prefab_name ~= "" and arg_287_1.actors_[var_290_15.prefab_name] ~= nil then
						local var_290_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_15.prefab_name].transform, "story_v_out_318041", "318041070", "story_v_out_318041.awb")

						arg_287_1:RecordAudio("318041070", var_290_21)
						arg_287_1:RecordAudio("318041070", var_290_21)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_318041", "318041070", "story_v_out_318041.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_318041", "318041070", "story_v_out_318041.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_22 = math.max(var_290_13, arg_287_1.talkMaxDuration)

			if var_290_12 <= arg_287_1.time_ and arg_287_1.time_ < var_290_12 + var_290_22 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_12) / var_290_22

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_12 + var_290_22 and arg_287_1.time_ < var_290_12 + var_290_22 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play318041071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 318041071
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play318041072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["10066ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos10066ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0, 100, 0)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos10066ui_story, var_294_4, var_294_3)

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

			local var_294_9 = arg_291_1.actors_["10066ui_story"]
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 and arg_291_1.var_.characterEffect10066ui_story == nil then
				arg_291_1.var_.characterEffect10066ui_story = var_294_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_11 = 0.200000002980232

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11

				if arg_291_1.var_.characterEffect10066ui_story then
					local var_294_13 = Mathf.Lerp(0, 0.5, var_294_12)

					arg_291_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_291_1.var_.characterEffect10066ui_story.fillRatio = var_294_13
				end
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 and arg_291_1.var_.characterEffect10066ui_story then
				local var_294_14 = 0.5

				arg_291_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_291_1.var_.characterEffect10066ui_story.fillRatio = var_294_14
			end

			local var_294_15 = arg_291_1.actors_["1050ui_story"].transform
			local var_294_16 = 0

			if var_294_16 < arg_291_1.time_ and arg_291_1.time_ <= var_294_16 + arg_294_0 then
				arg_291_1.var_.moveOldPos1050ui_story = var_294_15.localPosition
			end

			local var_294_17 = 0.001

			if var_294_16 <= arg_291_1.time_ and arg_291_1.time_ < var_294_16 + var_294_17 then
				local var_294_18 = (arg_291_1.time_ - var_294_16) / var_294_17
				local var_294_19 = Vector3.New(0, -1, -6.1)

				var_294_15.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1050ui_story, var_294_19, var_294_18)

				local var_294_20 = manager.ui.mainCamera.transform.position - var_294_15.position

				var_294_15.forward = Vector3.New(var_294_20.x, var_294_20.y, var_294_20.z)

				local var_294_21 = var_294_15.localEulerAngles

				var_294_21.z = 0
				var_294_21.x = 0
				var_294_15.localEulerAngles = var_294_21
			end

			if arg_291_1.time_ >= var_294_16 + var_294_17 and arg_291_1.time_ < var_294_16 + var_294_17 + arg_294_0 then
				var_294_15.localPosition = Vector3.New(0, -1, -6.1)

				local var_294_22 = manager.ui.mainCamera.transform.position - var_294_15.position

				var_294_15.forward = Vector3.New(var_294_22.x, var_294_22.y, var_294_22.z)

				local var_294_23 = var_294_15.localEulerAngles

				var_294_23.z = 0
				var_294_23.x = 0
				var_294_15.localEulerAngles = var_294_23
			end

			local var_294_24 = arg_291_1.actors_["1050ui_story"]
			local var_294_25 = 0

			if var_294_25 < arg_291_1.time_ and arg_291_1.time_ <= var_294_25 + arg_294_0 and arg_291_1.var_.characterEffect1050ui_story == nil then
				arg_291_1.var_.characterEffect1050ui_story = var_294_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_26 = 0.200000002980232

			if var_294_25 <= arg_291_1.time_ and arg_291_1.time_ < var_294_25 + var_294_26 then
				local var_294_27 = (arg_291_1.time_ - var_294_25) / var_294_26

				if arg_291_1.var_.characterEffect1050ui_story then
					local var_294_28 = Mathf.Lerp(0, 0.5, var_294_27)

					arg_291_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1050ui_story.fillRatio = var_294_28
				end
			end

			if arg_291_1.time_ >= var_294_25 + var_294_26 and arg_291_1.time_ < var_294_25 + var_294_26 + arg_294_0 and arg_291_1.var_.characterEffect1050ui_story then
				local var_294_29 = 0.5

				arg_291_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1050ui_story.fillRatio = var_294_29
			end

			local var_294_30 = 0
			local var_294_31 = 0.725

			if var_294_30 < arg_291_1.time_ and arg_291_1.time_ <= var_294_30 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_32 = arg_291_1:GetWordFromCfg(318041071)
				local var_294_33 = arg_291_1:FormatText(var_294_32.content)

				arg_291_1.text_.text = var_294_33

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_34 = 29
				local var_294_35 = utf8.len(var_294_33)
				local var_294_36 = var_294_34 <= 0 and var_294_31 or var_294_31 * (var_294_35 / var_294_34)

				if var_294_36 > 0 and var_294_31 < var_294_36 then
					arg_291_1.talkMaxDuration = var_294_36

					if var_294_36 + var_294_30 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_36 + var_294_30
					end
				end

				arg_291_1.text_.text = var_294_33
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_37 = math.max(var_294_31, arg_291_1.talkMaxDuration)

			if var_294_30 <= arg_291_1.time_ and arg_291_1.time_ < var_294_30 + var_294_37 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_30) / var_294_37

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_30 + var_294_37 and arg_291_1.time_ < var_294_30 + var_294_37 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play318041072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 318041072
		arg_295_1.duration_ = 3.633

		local var_295_0 = {
			zh = 3.1,
			ja = 3.633
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
				arg_295_0:Play318041073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1050ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1050ui_story == nil then
				arg_295_1.var_.characterEffect1050ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.200000002980232

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1050ui_story then
					arg_295_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1050ui_story then
				arg_295_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_298_4 = 0

			if var_298_4 < arg_295_1.time_ and arg_295_1.time_ <= var_298_4 + arg_298_0 then
				arg_295_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_298_5 = 0

			if var_298_5 < arg_295_1.time_ and arg_295_1.time_ <= var_298_5 + arg_298_0 then
				arg_295_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_298_6 = 0
			local var_298_7 = 0.35

			if var_298_6 < arg_295_1.time_ and arg_295_1.time_ <= var_298_6 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_8 = arg_295_1:FormatText(StoryNameCfg[74].name)

				arg_295_1.leftNameTxt_.text = var_298_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_9 = arg_295_1:GetWordFromCfg(318041072)
				local var_298_10 = arg_295_1:FormatText(var_298_9.content)

				arg_295_1.text_.text = var_298_10

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041072", "story_v_out_318041.awb") ~= 0 then
					local var_298_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041072", "story_v_out_318041.awb") / 1000

					if var_298_14 + var_298_6 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_14 + var_298_6
					end

					if var_298_9.prefab_name ~= "" and arg_295_1.actors_[var_298_9.prefab_name] ~= nil then
						local var_298_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_9.prefab_name].transform, "story_v_out_318041", "318041072", "story_v_out_318041.awb")

						arg_295_1:RecordAudio("318041072", var_298_15)
						arg_295_1:RecordAudio("318041072", var_298_15)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_318041", "318041072", "story_v_out_318041.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_318041", "318041072", "story_v_out_318041.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_16 = math.max(var_298_7, arg_295_1.talkMaxDuration)

			if var_298_6 <= arg_295_1.time_ and arg_295_1.time_ < var_298_6 + var_298_16 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_6) / var_298_16

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_6 + var_298_16 and arg_295_1.time_ < var_298_6 + var_298_16 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play318041073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 318041073
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play318041074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1050ui_story"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.characterEffect1050ui_story == nil then
				arg_299_1.var_.characterEffect1050ui_story = var_302_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_2 = 0.200000002980232

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.characterEffect1050ui_story then
					local var_302_4 = Mathf.Lerp(0, 0.5, var_302_3)

					arg_299_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_299_1.var_.characterEffect1050ui_story.fillRatio = var_302_4
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect1050ui_story then
				local var_302_5 = 0.5

				arg_299_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_299_1.var_.characterEffect1050ui_story.fillRatio = var_302_5
			end

			local var_302_6 = arg_299_1.actors_["1050ui_story"].transform
			local var_302_7 = 0

			if var_302_7 < arg_299_1.time_ and arg_299_1.time_ <= var_302_7 + arg_302_0 then
				arg_299_1.var_.moveOldPos1050ui_story = var_302_6.localPosition
			end

			local var_302_8 = 0.001

			if var_302_7 <= arg_299_1.time_ and arg_299_1.time_ < var_302_7 + var_302_8 then
				local var_302_9 = (arg_299_1.time_ - var_302_7) / var_302_8
				local var_302_10 = Vector3.New(0, 100, 0)

				var_302_6.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1050ui_story, var_302_10, var_302_9)

				local var_302_11 = manager.ui.mainCamera.transform.position - var_302_6.position

				var_302_6.forward = Vector3.New(var_302_11.x, var_302_11.y, var_302_11.z)

				local var_302_12 = var_302_6.localEulerAngles

				var_302_12.z = 0
				var_302_12.x = 0
				var_302_6.localEulerAngles = var_302_12
			end

			if arg_299_1.time_ >= var_302_7 + var_302_8 and arg_299_1.time_ < var_302_7 + var_302_8 + arg_302_0 then
				var_302_6.localPosition = Vector3.New(0, 100, 0)

				local var_302_13 = manager.ui.mainCamera.transform.position - var_302_6.position

				var_302_6.forward = Vector3.New(var_302_13.x, var_302_13.y, var_302_13.z)

				local var_302_14 = var_302_6.localEulerAngles

				var_302_14.z = 0
				var_302_14.x = 0
				var_302_6.localEulerAngles = var_302_14
			end

			local var_302_15 = 0
			local var_302_16 = 1.05

			if var_302_15 < arg_299_1.time_ and arg_299_1.time_ <= var_302_15 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_17 = arg_299_1:GetWordFromCfg(318041073)
				local var_302_18 = arg_299_1:FormatText(var_302_17.content)

				arg_299_1.text_.text = var_302_18

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_19 = 42
				local var_302_20 = utf8.len(var_302_18)
				local var_302_21 = var_302_19 <= 0 and var_302_16 or var_302_16 * (var_302_20 / var_302_19)

				if var_302_21 > 0 and var_302_16 < var_302_21 then
					arg_299_1.talkMaxDuration = var_302_21

					if var_302_21 + var_302_15 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_21 + var_302_15
					end
				end

				arg_299_1.text_.text = var_302_18
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_22 = math.max(var_302_16, arg_299_1.talkMaxDuration)

			if var_302_15 <= arg_299_1.time_ and arg_299_1.time_ < var_302_15 + var_302_22 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_15) / var_302_22

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_15 + var_302_22 and arg_299_1.time_ < var_302_15 + var_302_22 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play318041074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 318041074
		arg_303_1.duration_ = 5.8

		local var_303_0 = {
			zh = 5.8,
			ja = 5.6
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
				arg_303_0:Play318041075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 2

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				local var_306_1 = manager.ui.mainCamera.transform.localPosition
				local var_306_2 = Vector3.New(0, 0, 10) + Vector3.New(var_306_1.x, var_306_1.y, 0)
				local var_306_3 = arg_303_1.bgs_.ST69

				var_306_3.transform.localPosition = var_306_2
				var_306_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_306_4 = var_306_3:GetComponent("SpriteRenderer")

				if var_306_4 and var_306_4.sprite then
					local var_306_5 = (var_306_3.transform.localPosition - var_306_1).z
					local var_306_6 = manager.ui.mainCameraCom_
					local var_306_7 = 2 * var_306_5 * Mathf.Tan(var_306_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_306_8 = var_306_7 * var_306_6.aspect
					local var_306_9 = var_306_4.sprite.bounds.size.x
					local var_306_10 = var_306_4.sprite.bounds.size.y
					local var_306_11 = var_306_8 / var_306_9
					local var_306_12 = var_306_7 / var_306_10
					local var_306_13 = var_306_12 < var_306_11 and var_306_11 or var_306_12

					var_306_3.transform.localScale = Vector3.New(var_306_13, var_306_13, 0)
				end

				for iter_306_0, iter_306_1 in pairs(arg_303_1.bgs_) do
					if iter_306_0 ~= "ST69" then
						iter_306_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_306_14 = 0

			if var_306_14 < arg_303_1.time_ and arg_303_1.time_ <= var_306_14 + arg_306_0 then
				arg_303_1.mask_.enabled = true
				arg_303_1.mask_.raycastTarget = true

				arg_303_1:SetGaussion(false)
			end

			local var_306_15 = 2

			if var_306_14 <= arg_303_1.time_ and arg_303_1.time_ < var_306_14 + var_306_15 then
				local var_306_16 = (arg_303_1.time_ - var_306_14) / var_306_15
				local var_306_17 = Color.New(0, 0, 0)

				var_306_17.a = Mathf.Lerp(0, 1, var_306_16)
				arg_303_1.mask_.color = var_306_17
			end

			if arg_303_1.time_ >= var_306_14 + var_306_15 and arg_303_1.time_ < var_306_14 + var_306_15 + arg_306_0 then
				local var_306_18 = Color.New(0, 0, 0)

				var_306_18.a = 1
				arg_303_1.mask_.color = var_306_18
			end

			local var_306_19 = 2

			if var_306_19 < arg_303_1.time_ and arg_303_1.time_ <= var_306_19 + arg_306_0 then
				arg_303_1.mask_.enabled = true
				arg_303_1.mask_.raycastTarget = true

				arg_303_1:SetGaussion(false)
			end

			local var_306_20 = 2

			if var_306_19 <= arg_303_1.time_ and arg_303_1.time_ < var_306_19 + var_306_20 then
				local var_306_21 = (arg_303_1.time_ - var_306_19) / var_306_20
				local var_306_22 = Color.New(0, 0, 0)

				var_306_22.a = Mathf.Lerp(1, 0, var_306_21)
				arg_303_1.mask_.color = var_306_22
			end

			if arg_303_1.time_ >= var_306_19 + var_306_20 and arg_303_1.time_ < var_306_19 + var_306_20 + arg_306_0 then
				local var_306_23 = Color.New(0, 0, 0)
				local var_306_24 = 0

				arg_303_1.mask_.enabled = false
				var_306_23.a = var_306_24
				arg_303_1.mask_.color = var_306_23
			end

			local var_306_25 = arg_303_1.actors_["1050ui_story"].transform
			local var_306_26 = 2

			if var_306_26 < arg_303_1.time_ and arg_303_1.time_ <= var_306_26 + arg_306_0 then
				arg_303_1.var_.moveOldPos1050ui_story = var_306_25.localPosition
			end

			local var_306_27 = 0.001

			if var_306_26 <= arg_303_1.time_ and arg_303_1.time_ < var_306_26 + var_306_27 then
				local var_306_28 = (arg_303_1.time_ - var_306_26) / var_306_27
				local var_306_29 = Vector3.New(0, -1, -6.1)

				var_306_25.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1050ui_story, var_306_29, var_306_28)

				local var_306_30 = manager.ui.mainCamera.transform.position - var_306_25.position

				var_306_25.forward = Vector3.New(var_306_30.x, var_306_30.y, var_306_30.z)

				local var_306_31 = var_306_25.localEulerAngles

				var_306_31.z = 0
				var_306_31.x = 0
				var_306_25.localEulerAngles = var_306_31
			end

			if arg_303_1.time_ >= var_306_26 + var_306_27 and arg_303_1.time_ < var_306_26 + var_306_27 + arg_306_0 then
				var_306_25.localPosition = Vector3.New(0, -1, -6.1)

				local var_306_32 = manager.ui.mainCamera.transform.position - var_306_25.position

				var_306_25.forward = Vector3.New(var_306_32.x, var_306_32.y, var_306_32.z)

				local var_306_33 = var_306_25.localEulerAngles

				var_306_33.z = 0
				var_306_33.x = 0
				var_306_25.localEulerAngles = var_306_33
			end

			local var_306_34 = arg_303_1.actors_["1050ui_story"]
			local var_306_35 = 2

			if var_306_35 < arg_303_1.time_ and arg_303_1.time_ <= var_306_35 + arg_306_0 and arg_303_1.var_.characterEffect1050ui_story == nil then
				arg_303_1.var_.characterEffect1050ui_story = var_306_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_36 = 0.200000002980232

			if var_306_35 <= arg_303_1.time_ and arg_303_1.time_ < var_306_35 + var_306_36 then
				local var_306_37 = (arg_303_1.time_ - var_306_35) / var_306_36

				if arg_303_1.var_.characterEffect1050ui_story then
					arg_303_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_35 + var_306_36 and arg_303_1.time_ < var_306_35 + var_306_36 + arg_306_0 and arg_303_1.var_.characterEffect1050ui_story then
				arg_303_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_306_38 = 2

			if var_306_38 < arg_303_1.time_ and arg_303_1.time_ <= var_306_38 + arg_306_0 then
				arg_303_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_306_39 = 2

			if var_306_39 < arg_303_1.time_ and arg_303_1.time_ <= var_306_39 + arg_306_0 then
				arg_303_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_303_1.frameCnt_ <= 1 then
				arg_303_1.dialog_:SetActive(false)
			end

			local var_306_40 = 4
			local var_306_41 = 0.15

			if var_306_40 < arg_303_1.time_ and arg_303_1.time_ <= var_306_40 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0

				arg_303_1.dialog_:SetActive(true)

				local var_306_42 = LeanTween.value(arg_303_1.dialog_, 0, 1, 0.3)

				var_306_42:setOnUpdate(LuaHelper.FloatAction(function(arg_307_0)
					arg_303_1.dialogCg_.alpha = arg_307_0
				end))
				var_306_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_303_1.dialog_)
					var_306_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_303_1.duration_ = arg_303_1.duration_ + 0.3

				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_43 = arg_303_1:FormatText(StoryNameCfg[74].name)

				arg_303_1.leftNameTxt_.text = var_306_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_44 = arg_303_1:GetWordFromCfg(318041074)
				local var_306_45 = arg_303_1:FormatText(var_306_44.content)

				arg_303_1.text_.text = var_306_45

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_46 = 6
				local var_306_47 = utf8.len(var_306_45)
				local var_306_48 = var_306_46 <= 0 and var_306_41 or var_306_41 * (var_306_47 / var_306_46)

				if var_306_48 > 0 and var_306_41 < var_306_48 then
					arg_303_1.talkMaxDuration = var_306_48
					var_306_40 = var_306_40 + 0.3

					if var_306_48 + var_306_40 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_48 + var_306_40
					end
				end

				arg_303_1.text_.text = var_306_45
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041074", "story_v_out_318041.awb") ~= 0 then
					local var_306_49 = manager.audio:GetVoiceLength("story_v_out_318041", "318041074", "story_v_out_318041.awb") / 1000

					if var_306_49 + var_306_40 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_49 + var_306_40
					end

					if var_306_44.prefab_name ~= "" and arg_303_1.actors_[var_306_44.prefab_name] ~= nil then
						local var_306_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_44.prefab_name].transform, "story_v_out_318041", "318041074", "story_v_out_318041.awb")

						arg_303_1:RecordAudio("318041074", var_306_50)
						arg_303_1:RecordAudio("318041074", var_306_50)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_318041", "318041074", "story_v_out_318041.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_318041", "318041074", "story_v_out_318041.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_51 = var_306_40 + 0.3
			local var_306_52 = math.max(var_306_41, arg_303_1.talkMaxDuration)

			if var_306_51 <= arg_303_1.time_ and arg_303_1.time_ < var_306_51 + var_306_52 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_51) / var_306_52

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_51 + var_306_52 and arg_303_1.time_ < var_306_51 + var_306_52 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play318041075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 318041075
		arg_309_1.duration_ = 2.166

		local var_309_0 = {
			zh = 2,
			ja = 2.166
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
				arg_309_0:Play318041076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["10066ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos10066ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0.7, -0.99, -5.83)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10066ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["10066ui_story"]
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 and arg_309_1.var_.characterEffect10066ui_story == nil then
				arg_309_1.var_.characterEffect10066ui_story = var_312_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_11 = 0.200000002980232

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11

				if arg_309_1.var_.characterEffect10066ui_story then
					arg_309_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 and arg_309_1.var_.characterEffect10066ui_story then
				arg_309_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_312_13 = 0

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_1")
			end

			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 then
				arg_309_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_312_15 = arg_309_1.actors_["1050ui_story"].transform
			local var_312_16 = 0

			if var_312_16 < arg_309_1.time_ and arg_309_1.time_ <= var_312_16 + arg_312_0 then
				arg_309_1.var_.moveOldPos1050ui_story = var_312_15.localPosition
			end

			local var_312_17 = 0.001

			if var_312_16 <= arg_309_1.time_ and arg_309_1.time_ < var_312_16 + var_312_17 then
				local var_312_18 = (arg_309_1.time_ - var_312_16) / var_312_17
				local var_312_19 = Vector3.New(-0.7, -1, -6.1)

				var_312_15.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1050ui_story, var_312_19, var_312_18)

				local var_312_20 = manager.ui.mainCamera.transform.position - var_312_15.position

				var_312_15.forward = Vector3.New(var_312_20.x, var_312_20.y, var_312_20.z)

				local var_312_21 = var_312_15.localEulerAngles

				var_312_21.z = 0
				var_312_21.x = 0
				var_312_15.localEulerAngles = var_312_21
			end

			if arg_309_1.time_ >= var_312_16 + var_312_17 and arg_309_1.time_ < var_312_16 + var_312_17 + arg_312_0 then
				var_312_15.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_312_22 = manager.ui.mainCamera.transform.position - var_312_15.position

				var_312_15.forward = Vector3.New(var_312_22.x, var_312_22.y, var_312_22.z)

				local var_312_23 = var_312_15.localEulerAngles

				var_312_23.z = 0
				var_312_23.x = 0
				var_312_15.localEulerAngles = var_312_23
			end

			local var_312_24 = arg_309_1.actors_["1050ui_story"]
			local var_312_25 = 0

			if var_312_25 < arg_309_1.time_ and arg_309_1.time_ <= var_312_25 + arg_312_0 and arg_309_1.var_.characterEffect1050ui_story == nil then
				arg_309_1.var_.characterEffect1050ui_story = var_312_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_26 = 0.200000002980232

			if var_312_25 <= arg_309_1.time_ and arg_309_1.time_ < var_312_25 + var_312_26 then
				local var_312_27 = (arg_309_1.time_ - var_312_25) / var_312_26

				if arg_309_1.var_.characterEffect1050ui_story then
					local var_312_28 = Mathf.Lerp(0, 0.5, var_312_27)

					arg_309_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_309_1.var_.characterEffect1050ui_story.fillRatio = var_312_28
				end
			end

			if arg_309_1.time_ >= var_312_25 + var_312_26 and arg_309_1.time_ < var_312_25 + var_312_26 + arg_312_0 and arg_309_1.var_.characterEffect1050ui_story then
				local var_312_29 = 0.5

				arg_309_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_309_1.var_.characterEffect1050ui_story.fillRatio = var_312_29
			end

			local var_312_30 = 0
			local var_312_31 = 0.1

			if var_312_30 < arg_309_1.time_ and arg_309_1.time_ <= var_312_30 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_32 = arg_309_1:FormatText(StoryNameCfg[640].name)

				arg_309_1.leftNameTxt_.text = var_312_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_33 = arg_309_1:GetWordFromCfg(318041075)
				local var_312_34 = arg_309_1:FormatText(var_312_33.content)

				arg_309_1.text_.text = var_312_34

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_35 = 4
				local var_312_36 = utf8.len(var_312_34)
				local var_312_37 = var_312_35 <= 0 and var_312_31 or var_312_31 * (var_312_36 / var_312_35)

				if var_312_37 > 0 and var_312_31 < var_312_37 then
					arg_309_1.talkMaxDuration = var_312_37

					if var_312_37 + var_312_30 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_37 + var_312_30
					end
				end

				arg_309_1.text_.text = var_312_34
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041075", "story_v_out_318041.awb") ~= 0 then
					local var_312_38 = manager.audio:GetVoiceLength("story_v_out_318041", "318041075", "story_v_out_318041.awb") / 1000

					if var_312_38 + var_312_30 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_38 + var_312_30
					end

					if var_312_33.prefab_name ~= "" and arg_309_1.actors_[var_312_33.prefab_name] ~= nil then
						local var_312_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_33.prefab_name].transform, "story_v_out_318041", "318041075", "story_v_out_318041.awb")

						arg_309_1:RecordAudio("318041075", var_312_39)
						arg_309_1:RecordAudio("318041075", var_312_39)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_318041", "318041075", "story_v_out_318041.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_318041", "318041075", "story_v_out_318041.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_40 = math.max(var_312_31, arg_309_1.talkMaxDuration)

			if var_312_30 <= arg_309_1.time_ and arg_309_1.time_ < var_312_30 + var_312_40 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_30) / var_312_40

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_30 + var_312_40 and arg_309_1.time_ < var_312_30 + var_312_40 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play318041076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 318041076
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play318041077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["10066ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect10066ui_story == nil then
				arg_313_1.var_.characterEffect10066ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.200000002980232

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect10066ui_story then
					local var_316_4 = Mathf.Lerp(0, 0.5, var_316_3)

					arg_313_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_313_1.var_.characterEffect10066ui_story.fillRatio = var_316_4
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect10066ui_story then
				local var_316_5 = 0.5

				arg_313_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_313_1.var_.characterEffect10066ui_story.fillRatio = var_316_5
			end

			local var_316_6 = 0
			local var_316_7 = 1.075

			if var_316_6 < arg_313_1.time_ and arg_313_1.time_ <= var_316_6 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, false)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_8 = arg_313_1:GetWordFromCfg(318041076)
				local var_316_9 = arg_313_1:FormatText(var_316_8.content)

				arg_313_1.text_.text = var_316_9

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_10 = 43
				local var_316_11 = utf8.len(var_316_9)
				local var_316_12 = var_316_10 <= 0 and var_316_7 or var_316_7 * (var_316_11 / var_316_10)

				if var_316_12 > 0 and var_316_7 < var_316_12 then
					arg_313_1.talkMaxDuration = var_316_12

					if var_316_12 + var_316_6 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_12 + var_316_6
					end
				end

				arg_313_1.text_.text = var_316_9
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_13 = math.max(var_316_7, arg_313_1.talkMaxDuration)

			if var_316_6 <= arg_313_1.time_ and arg_313_1.time_ < var_316_6 + var_316_13 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_6) / var_316_13

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_6 + var_316_13 and arg_313_1.time_ < var_316_6 + var_316_13 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play318041077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 318041077
		arg_317_1.duration_ = 7.666

		local var_317_0 = {
			zh = 3.833,
			ja = 7.666
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
				arg_317_0:Play318041078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1050ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect1050ui_story == nil then
				arg_317_1.var_.characterEffect1050ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.200000002980232

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect1050ui_story then
					arg_317_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect1050ui_story then
				arg_317_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_320_4 = 0

			if var_320_4 < arg_317_1.time_ and arg_317_1.time_ <= var_320_4 + arg_320_0 then
				arg_317_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_320_5 = 0

			if var_320_5 < arg_317_1.time_ and arg_317_1.time_ <= var_320_5 + arg_320_0 then
				arg_317_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_320_6 = 0
			local var_320_7 = 0.325

			if var_320_6 < arg_317_1.time_ and arg_317_1.time_ <= var_320_6 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_8 = arg_317_1:FormatText(StoryNameCfg[74].name)

				arg_317_1.leftNameTxt_.text = var_320_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_9 = arg_317_1:GetWordFromCfg(318041077)
				local var_320_10 = arg_317_1:FormatText(var_320_9.content)

				arg_317_1.text_.text = var_320_10

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_11 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041077", "story_v_out_318041.awb") ~= 0 then
					local var_320_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041077", "story_v_out_318041.awb") / 1000

					if var_320_14 + var_320_6 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_14 + var_320_6
					end

					if var_320_9.prefab_name ~= "" and arg_317_1.actors_[var_320_9.prefab_name] ~= nil then
						local var_320_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_9.prefab_name].transform, "story_v_out_318041", "318041077", "story_v_out_318041.awb")

						arg_317_1:RecordAudio("318041077", var_320_15)
						arg_317_1:RecordAudio("318041077", var_320_15)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_318041", "318041077", "story_v_out_318041.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_318041", "318041077", "story_v_out_318041.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_16 = math.max(var_320_7, arg_317_1.talkMaxDuration)

			if var_320_6 <= arg_317_1.time_ and arg_317_1.time_ < var_320_6 + var_320_16 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_6) / var_320_16

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_6 + var_320_16 and arg_317_1.time_ < var_320_6 + var_320_16 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play318041078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 318041078
		arg_321_1.duration_ = 3.8

		local var_321_0 = {
			zh = 2.333,
			ja = 3.8
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
				arg_321_0:Play318041079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["10066ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect10066ui_story == nil then
				arg_321_1.var_.characterEffect10066ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.200000002980232

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect10066ui_story then
					arg_321_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect10066ui_story then
				arg_321_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_324_4 = 0

			if var_324_4 < arg_321_1.time_ and arg_321_1.time_ <= var_324_4 + arg_324_0 then
				arg_321_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action437")
			end

			local var_324_5 = 0

			if var_324_5 < arg_321_1.time_ and arg_321_1.time_ <= var_324_5 + arg_324_0 then
				arg_321_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_324_6 = arg_321_1.actors_["1050ui_story"]
			local var_324_7 = 0

			if var_324_7 < arg_321_1.time_ and arg_321_1.time_ <= var_324_7 + arg_324_0 and arg_321_1.var_.characterEffect1050ui_story == nil then
				arg_321_1.var_.characterEffect1050ui_story = var_324_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_8 = 0.200000002980232

			if var_324_7 <= arg_321_1.time_ and arg_321_1.time_ < var_324_7 + var_324_8 then
				local var_324_9 = (arg_321_1.time_ - var_324_7) / var_324_8

				if arg_321_1.var_.characterEffect1050ui_story then
					local var_324_10 = Mathf.Lerp(0, 0.5, var_324_9)

					arg_321_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1050ui_story.fillRatio = var_324_10
				end
			end

			if arg_321_1.time_ >= var_324_7 + var_324_8 and arg_321_1.time_ < var_324_7 + var_324_8 + arg_324_0 and arg_321_1.var_.characterEffect1050ui_story then
				local var_324_11 = 0.5

				arg_321_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1050ui_story.fillRatio = var_324_11
			end

			local var_324_12 = 0
			local var_324_13 = 0.2

			if var_324_12 < arg_321_1.time_ and arg_321_1.time_ <= var_324_12 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_14 = arg_321_1:FormatText(StoryNameCfg[640].name)

				arg_321_1.leftNameTxt_.text = var_324_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_15 = arg_321_1:GetWordFromCfg(318041078)
				local var_324_16 = arg_321_1:FormatText(var_324_15.content)

				arg_321_1.text_.text = var_324_16

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_17 = 8
				local var_324_18 = utf8.len(var_324_16)
				local var_324_19 = var_324_17 <= 0 and var_324_13 or var_324_13 * (var_324_18 / var_324_17)

				if var_324_19 > 0 and var_324_13 < var_324_19 then
					arg_321_1.talkMaxDuration = var_324_19

					if var_324_19 + var_324_12 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_19 + var_324_12
					end
				end

				arg_321_1.text_.text = var_324_16
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041078", "story_v_out_318041.awb") ~= 0 then
					local var_324_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041078", "story_v_out_318041.awb") / 1000

					if var_324_20 + var_324_12 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_20 + var_324_12
					end

					if var_324_15.prefab_name ~= "" and arg_321_1.actors_[var_324_15.prefab_name] ~= nil then
						local var_324_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_15.prefab_name].transform, "story_v_out_318041", "318041078", "story_v_out_318041.awb")

						arg_321_1:RecordAudio("318041078", var_324_21)
						arg_321_1:RecordAudio("318041078", var_324_21)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_318041", "318041078", "story_v_out_318041.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_318041", "318041078", "story_v_out_318041.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_22 = math.max(var_324_13, arg_321_1.talkMaxDuration)

			if var_324_12 <= arg_321_1.time_ and arg_321_1.time_ < var_324_12 + var_324_22 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_12) / var_324_22

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_12 + var_324_22 and arg_321_1.time_ < var_324_12 + var_324_22 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play318041079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 318041079
		arg_325_1.duration_ = 5.8

		local var_325_0 = {
			zh = 4.6,
			ja = 5.8
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
				arg_325_0:Play318041080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_328_1 = 0
			local var_328_2 = 0.475

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_3 = arg_325_1:FormatText(StoryNameCfg[640].name)

				arg_325_1.leftNameTxt_.text = var_328_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_4 = arg_325_1:GetWordFromCfg(318041079)
				local var_328_5 = arg_325_1:FormatText(var_328_4.content)

				arg_325_1.text_.text = var_328_5

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_6 = 19
				local var_328_7 = utf8.len(var_328_5)
				local var_328_8 = var_328_6 <= 0 and var_328_2 or var_328_2 * (var_328_7 / var_328_6)

				if var_328_8 > 0 and var_328_2 < var_328_8 then
					arg_325_1.talkMaxDuration = var_328_8

					if var_328_8 + var_328_1 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_1
					end
				end

				arg_325_1.text_.text = var_328_5
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041079", "story_v_out_318041.awb") ~= 0 then
					local var_328_9 = manager.audio:GetVoiceLength("story_v_out_318041", "318041079", "story_v_out_318041.awb") / 1000

					if var_328_9 + var_328_1 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_9 + var_328_1
					end

					if var_328_4.prefab_name ~= "" and arg_325_1.actors_[var_328_4.prefab_name] ~= nil then
						local var_328_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_4.prefab_name].transform, "story_v_out_318041", "318041079", "story_v_out_318041.awb")

						arg_325_1:RecordAudio("318041079", var_328_10)
						arg_325_1:RecordAudio("318041079", var_328_10)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_318041", "318041079", "story_v_out_318041.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_318041", "318041079", "story_v_out_318041.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_11 = math.max(var_328_2, arg_325_1.talkMaxDuration)

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_11 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_1) / var_328_11

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_1 + var_328_11 and arg_325_1.time_ < var_328_1 + var_328_11 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play318041080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 318041080
		arg_329_1.duration_ = 4.6

		local var_329_0 = {
			zh = 4.6,
			ja = 2.5
		}
		local var_329_1 = manager.audio:GetLocalizationFlag()

		if var_329_0[var_329_1] ~= nil then
			arg_329_1.duration_ = var_329_0[var_329_1]
		end

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play318041081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1050ui_story"]
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 and arg_329_1.var_.characterEffect1050ui_story == nil then
				arg_329_1.var_.characterEffect1050ui_story = var_332_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_2 = 0.200000002980232

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2

				if arg_329_1.var_.characterEffect1050ui_story then
					arg_329_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 and arg_329_1.var_.characterEffect1050ui_story then
				arg_329_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_332_4 = 0

			if var_332_4 < arg_329_1.time_ and arg_329_1.time_ <= var_332_4 + arg_332_0 then
				arg_329_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action4_1")
			end

			local var_332_5 = 0

			if var_332_5 < arg_329_1.time_ and arg_329_1.time_ <= var_332_5 + arg_332_0 then
				arg_329_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_332_6 = arg_329_1.actors_["10066ui_story"]
			local var_332_7 = 0

			if var_332_7 < arg_329_1.time_ and arg_329_1.time_ <= var_332_7 + arg_332_0 and arg_329_1.var_.characterEffect10066ui_story == nil then
				arg_329_1.var_.characterEffect10066ui_story = var_332_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_8 = 0.200000002980232

			if var_332_7 <= arg_329_1.time_ and arg_329_1.time_ < var_332_7 + var_332_8 then
				local var_332_9 = (arg_329_1.time_ - var_332_7) / var_332_8

				if arg_329_1.var_.characterEffect10066ui_story then
					local var_332_10 = Mathf.Lerp(0, 0.5, var_332_9)

					arg_329_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_329_1.var_.characterEffect10066ui_story.fillRatio = var_332_10
				end
			end

			if arg_329_1.time_ >= var_332_7 + var_332_8 and arg_329_1.time_ < var_332_7 + var_332_8 + arg_332_0 and arg_329_1.var_.characterEffect10066ui_story then
				local var_332_11 = 0.5

				arg_329_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_329_1.var_.characterEffect10066ui_story.fillRatio = var_332_11
			end

			local var_332_12 = 0
			local var_332_13 = 0.4

			if var_332_12 < arg_329_1.time_ and arg_329_1.time_ <= var_332_12 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_14 = arg_329_1:FormatText(StoryNameCfg[74].name)

				arg_329_1.leftNameTxt_.text = var_332_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_15 = arg_329_1:GetWordFromCfg(318041080)
				local var_332_16 = arg_329_1:FormatText(var_332_15.content)

				arg_329_1.text_.text = var_332_16

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_17 = 16
				local var_332_18 = utf8.len(var_332_16)
				local var_332_19 = var_332_17 <= 0 and var_332_13 or var_332_13 * (var_332_18 / var_332_17)

				if var_332_19 > 0 and var_332_13 < var_332_19 then
					arg_329_1.talkMaxDuration = var_332_19

					if var_332_19 + var_332_12 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_19 + var_332_12
					end
				end

				arg_329_1.text_.text = var_332_16
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041080", "story_v_out_318041.awb") ~= 0 then
					local var_332_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041080", "story_v_out_318041.awb") / 1000

					if var_332_20 + var_332_12 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_20 + var_332_12
					end

					if var_332_15.prefab_name ~= "" and arg_329_1.actors_[var_332_15.prefab_name] ~= nil then
						local var_332_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_15.prefab_name].transform, "story_v_out_318041", "318041080", "story_v_out_318041.awb")

						arg_329_1:RecordAudio("318041080", var_332_21)
						arg_329_1:RecordAudio("318041080", var_332_21)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_318041", "318041080", "story_v_out_318041.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_318041", "318041080", "story_v_out_318041.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_22 = math.max(var_332_13, arg_329_1.talkMaxDuration)

			if var_332_12 <= arg_329_1.time_ and arg_329_1.time_ < var_332_12 + var_332_22 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_12) / var_332_22

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_12 + var_332_22 and arg_329_1.time_ < var_332_12 + var_332_22 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play318041081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 318041081
		arg_333_1.duration_ = 9.4

		local var_333_0 = {
			zh = 9.4,
			ja = 8.733
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
				arg_333_0:Play318041082(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["10066ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.characterEffect10066ui_story == nil then
				arg_333_1.var_.characterEffect10066ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.200000002980232

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect10066ui_story then
					arg_333_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.characterEffect10066ui_story then
				arg_333_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_336_4 = 0

			if var_336_4 < arg_333_1.time_ and arg_333_1.time_ <= var_336_4 + arg_336_0 then
				arg_333_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action476")
			end

			local var_336_5 = 0

			if var_336_5 < arg_333_1.time_ and arg_333_1.time_ <= var_336_5 + arg_336_0 then
				arg_333_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_336_6 = arg_333_1.actors_["1050ui_story"]
			local var_336_7 = 0

			if var_336_7 < arg_333_1.time_ and arg_333_1.time_ <= var_336_7 + arg_336_0 and arg_333_1.var_.characterEffect1050ui_story == nil then
				arg_333_1.var_.characterEffect1050ui_story = var_336_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_8 = 0.200000002980232

			if var_336_7 <= arg_333_1.time_ and arg_333_1.time_ < var_336_7 + var_336_8 then
				local var_336_9 = (arg_333_1.time_ - var_336_7) / var_336_8

				if arg_333_1.var_.characterEffect1050ui_story then
					local var_336_10 = Mathf.Lerp(0, 0.5, var_336_9)

					arg_333_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1050ui_story.fillRatio = var_336_10
				end
			end

			if arg_333_1.time_ >= var_336_7 + var_336_8 and arg_333_1.time_ < var_336_7 + var_336_8 + arg_336_0 and arg_333_1.var_.characterEffect1050ui_story then
				local var_336_11 = 0.5

				arg_333_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1050ui_story.fillRatio = var_336_11
			end

			local var_336_12 = 0
			local var_336_13 = 1.2

			if var_336_12 < arg_333_1.time_ and arg_333_1.time_ <= var_336_12 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_14 = arg_333_1:FormatText(StoryNameCfg[640].name)

				arg_333_1.leftNameTxt_.text = var_336_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_15 = arg_333_1:GetWordFromCfg(318041081)
				local var_336_16 = arg_333_1:FormatText(var_336_15.content)

				arg_333_1.text_.text = var_336_16

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_17 = 48
				local var_336_18 = utf8.len(var_336_16)
				local var_336_19 = var_336_17 <= 0 and var_336_13 or var_336_13 * (var_336_18 / var_336_17)

				if var_336_19 > 0 and var_336_13 < var_336_19 then
					arg_333_1.talkMaxDuration = var_336_19

					if var_336_19 + var_336_12 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_19 + var_336_12
					end
				end

				arg_333_1.text_.text = var_336_16
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041081", "story_v_out_318041.awb") ~= 0 then
					local var_336_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041081", "story_v_out_318041.awb") / 1000

					if var_336_20 + var_336_12 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_20 + var_336_12
					end

					if var_336_15.prefab_name ~= "" and arg_333_1.actors_[var_336_15.prefab_name] ~= nil then
						local var_336_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_15.prefab_name].transform, "story_v_out_318041", "318041081", "story_v_out_318041.awb")

						arg_333_1:RecordAudio("318041081", var_336_21)
						arg_333_1:RecordAudio("318041081", var_336_21)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_318041", "318041081", "story_v_out_318041.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_318041", "318041081", "story_v_out_318041.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_22 = math.max(var_336_13, arg_333_1.talkMaxDuration)

			if var_336_12 <= arg_333_1.time_ and arg_333_1.time_ < var_336_12 + var_336_22 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_12) / var_336_22

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_12 + var_336_22 and arg_333_1.time_ < var_336_12 + var_336_22 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play318041082 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 318041082
		arg_337_1.duration_ = 10.166

		local var_337_0 = {
			zh = 5.6,
			ja = 10.166
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play318041083(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["10066ui_story"]
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 and arg_337_1.var_.characterEffect10066ui_story == nil then
				arg_337_1.var_.characterEffect10066ui_story = var_340_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_2 = 0.200000002980232

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2

				if arg_337_1.var_.characterEffect10066ui_story then
					arg_337_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 and arg_337_1.var_.characterEffect10066ui_story then
				arg_337_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_340_4 = 0

			if var_340_4 < arg_337_1.time_ and arg_337_1.time_ <= var_340_4 + arg_340_0 then
				arg_337_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_340_5 = 0
			local var_340_6 = 0.6

			if var_340_5 < arg_337_1.time_ and arg_337_1.time_ <= var_340_5 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_7 = arg_337_1:FormatText(StoryNameCfg[640].name)

				arg_337_1.leftNameTxt_.text = var_340_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_8 = arg_337_1:GetWordFromCfg(318041082)
				local var_340_9 = arg_337_1:FormatText(var_340_8.content)

				arg_337_1.text_.text = var_340_9

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_10 = 24
				local var_340_11 = utf8.len(var_340_9)
				local var_340_12 = var_340_10 <= 0 and var_340_6 or var_340_6 * (var_340_11 / var_340_10)

				if var_340_12 > 0 and var_340_6 < var_340_12 then
					arg_337_1.talkMaxDuration = var_340_12

					if var_340_12 + var_340_5 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_12 + var_340_5
					end
				end

				arg_337_1.text_.text = var_340_9
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041082", "story_v_out_318041.awb") ~= 0 then
					local var_340_13 = manager.audio:GetVoiceLength("story_v_out_318041", "318041082", "story_v_out_318041.awb") / 1000

					if var_340_13 + var_340_5 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_13 + var_340_5
					end

					if var_340_8.prefab_name ~= "" and arg_337_1.actors_[var_340_8.prefab_name] ~= nil then
						local var_340_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_8.prefab_name].transform, "story_v_out_318041", "318041082", "story_v_out_318041.awb")

						arg_337_1:RecordAudio("318041082", var_340_14)
						arg_337_1:RecordAudio("318041082", var_340_14)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_318041", "318041082", "story_v_out_318041.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_318041", "318041082", "story_v_out_318041.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_15 = math.max(var_340_6, arg_337_1.talkMaxDuration)

			if var_340_5 <= arg_337_1.time_ and arg_337_1.time_ < var_340_5 + var_340_15 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_5) / var_340_15

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_5 + var_340_15 and arg_337_1.time_ < var_340_5 + var_340_15 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play318041083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 318041083
		arg_341_1.duration_ = 9.033

		local var_341_0 = {
			zh = 6.566,
			ja = 9.033
		}
		local var_341_1 = manager.audio:GetLocalizationFlag()

		if var_341_0[var_341_1] ~= nil then
			arg_341_1.duration_ = var_341_0[var_341_1]
		end

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play318041084(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1050ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1050ui_story == nil then
				arg_341_1.var_.characterEffect1050ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.200000002980232

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1050ui_story then
					arg_341_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1050ui_story then
				arg_341_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_344_4 = 0

			if var_344_4 < arg_341_1.time_ and arg_341_1.time_ <= var_344_4 + arg_344_0 then
				arg_341_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action4_2")
			end

			local var_344_5 = 0

			if var_344_5 < arg_341_1.time_ and arg_341_1.time_ <= var_344_5 + arg_344_0 then
				arg_341_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_344_6 = arg_341_1.actors_["10066ui_story"]
			local var_344_7 = 0

			if var_344_7 < arg_341_1.time_ and arg_341_1.time_ <= var_344_7 + arg_344_0 and arg_341_1.var_.characterEffect10066ui_story == nil then
				arg_341_1.var_.characterEffect10066ui_story = var_344_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_8 = 0.200000002980232

			if var_344_7 <= arg_341_1.time_ and arg_341_1.time_ < var_344_7 + var_344_8 then
				local var_344_9 = (arg_341_1.time_ - var_344_7) / var_344_8

				if arg_341_1.var_.characterEffect10066ui_story then
					local var_344_10 = Mathf.Lerp(0, 0.5, var_344_9)

					arg_341_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_341_1.var_.characterEffect10066ui_story.fillRatio = var_344_10
				end
			end

			if arg_341_1.time_ >= var_344_7 + var_344_8 and arg_341_1.time_ < var_344_7 + var_344_8 + arg_344_0 and arg_341_1.var_.characterEffect10066ui_story then
				local var_344_11 = 0.5

				arg_341_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_341_1.var_.characterEffect10066ui_story.fillRatio = var_344_11
			end

			local var_344_12 = 0
			local var_344_13 = 0.725

			if var_344_12 < arg_341_1.time_ and arg_341_1.time_ <= var_344_12 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_14 = arg_341_1:FormatText(StoryNameCfg[74].name)

				arg_341_1.leftNameTxt_.text = var_344_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_15 = arg_341_1:GetWordFromCfg(318041083)
				local var_344_16 = arg_341_1:FormatText(var_344_15.content)

				arg_341_1.text_.text = var_344_16

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_17 = 29
				local var_344_18 = utf8.len(var_344_16)
				local var_344_19 = var_344_17 <= 0 and var_344_13 or var_344_13 * (var_344_18 / var_344_17)

				if var_344_19 > 0 and var_344_13 < var_344_19 then
					arg_341_1.talkMaxDuration = var_344_19

					if var_344_19 + var_344_12 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_19 + var_344_12
					end
				end

				arg_341_1.text_.text = var_344_16
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041083", "story_v_out_318041.awb") ~= 0 then
					local var_344_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041083", "story_v_out_318041.awb") / 1000

					if var_344_20 + var_344_12 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_20 + var_344_12
					end

					if var_344_15.prefab_name ~= "" and arg_341_1.actors_[var_344_15.prefab_name] ~= nil then
						local var_344_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_15.prefab_name].transform, "story_v_out_318041", "318041083", "story_v_out_318041.awb")

						arg_341_1:RecordAudio("318041083", var_344_21)
						arg_341_1:RecordAudio("318041083", var_344_21)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_318041", "318041083", "story_v_out_318041.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_318041", "318041083", "story_v_out_318041.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_22 = math.max(var_344_13, arg_341_1.talkMaxDuration)

			if var_344_12 <= arg_341_1.time_ and arg_341_1.time_ < var_344_12 + var_344_22 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_12) / var_344_22

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_12 + var_344_22 and arg_341_1.time_ < var_344_12 + var_344_22 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play318041084 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 318041084
		arg_345_1.duration_ = 8.433

		local var_345_0 = {
			zh = 7.466,
			ja = 8.433
		}
		local var_345_1 = manager.audio:GetLocalizationFlag()

		if var_345_0[var_345_1] ~= nil then
			arg_345_1.duration_ = var_345_0[var_345_1]
		end

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play318041085(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["10066ui_story"]
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 and arg_345_1.var_.characterEffect10066ui_story == nil then
				arg_345_1.var_.characterEffect10066ui_story = var_348_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_2 = 0.200000002980232

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2

				if arg_345_1.var_.characterEffect10066ui_story then
					arg_345_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 and arg_345_1.var_.characterEffect10066ui_story then
				arg_345_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_348_4 = 0

			if var_348_4 < arg_345_1.time_ and arg_345_1.time_ <= var_348_4 + arg_348_0 then
				arg_345_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action6_2")
			end

			local var_348_5 = 0

			if var_348_5 < arg_345_1.time_ and arg_345_1.time_ <= var_348_5 + arg_348_0 then
				arg_345_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_348_6 = arg_345_1.actors_["1050ui_story"]
			local var_348_7 = 0

			if var_348_7 < arg_345_1.time_ and arg_345_1.time_ <= var_348_7 + arg_348_0 and arg_345_1.var_.characterEffect1050ui_story == nil then
				arg_345_1.var_.characterEffect1050ui_story = var_348_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_8 = 0.200000002980232

			if var_348_7 <= arg_345_1.time_ and arg_345_1.time_ < var_348_7 + var_348_8 then
				local var_348_9 = (arg_345_1.time_ - var_348_7) / var_348_8

				if arg_345_1.var_.characterEffect1050ui_story then
					local var_348_10 = Mathf.Lerp(0, 0.5, var_348_9)

					arg_345_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_345_1.var_.characterEffect1050ui_story.fillRatio = var_348_10
				end
			end

			if arg_345_1.time_ >= var_348_7 + var_348_8 and arg_345_1.time_ < var_348_7 + var_348_8 + arg_348_0 and arg_345_1.var_.characterEffect1050ui_story then
				local var_348_11 = 0.5

				arg_345_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_345_1.var_.characterEffect1050ui_story.fillRatio = var_348_11
			end

			local var_348_12 = 0
			local var_348_13 = 0.725

			if var_348_12 < arg_345_1.time_ and arg_345_1.time_ <= var_348_12 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_14 = arg_345_1:FormatText(StoryNameCfg[640].name)

				arg_345_1.leftNameTxt_.text = var_348_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_15 = arg_345_1:GetWordFromCfg(318041084)
				local var_348_16 = arg_345_1:FormatText(var_348_15.content)

				arg_345_1.text_.text = var_348_16

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_17 = 29
				local var_348_18 = utf8.len(var_348_16)
				local var_348_19 = var_348_17 <= 0 and var_348_13 or var_348_13 * (var_348_18 / var_348_17)

				if var_348_19 > 0 and var_348_13 < var_348_19 then
					arg_345_1.talkMaxDuration = var_348_19

					if var_348_19 + var_348_12 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_19 + var_348_12
					end
				end

				arg_345_1.text_.text = var_348_16
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041084", "story_v_out_318041.awb") ~= 0 then
					local var_348_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041084", "story_v_out_318041.awb") / 1000

					if var_348_20 + var_348_12 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_20 + var_348_12
					end

					if var_348_15.prefab_name ~= "" and arg_345_1.actors_[var_348_15.prefab_name] ~= nil then
						local var_348_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_15.prefab_name].transform, "story_v_out_318041", "318041084", "story_v_out_318041.awb")

						arg_345_1:RecordAudio("318041084", var_348_21)
						arg_345_1:RecordAudio("318041084", var_348_21)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_318041", "318041084", "story_v_out_318041.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_318041", "318041084", "story_v_out_318041.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_22 = math.max(var_348_13, arg_345_1.talkMaxDuration)

			if var_348_12 <= arg_345_1.time_ and arg_345_1.time_ < var_348_12 + var_348_22 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_12) / var_348_22

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_12 + var_348_22 and arg_345_1.time_ < var_348_12 + var_348_22 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play318041085 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 318041085
		arg_349_1.duration_ = 6.266

		local var_349_0 = {
			zh = 6.266,
			ja = 4.733
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play318041086(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1050ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect1050ui_story == nil then
				arg_349_1.var_.characterEffect1050ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.200000002980232

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1050ui_story then
					arg_349_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1050ui_story then
				arg_349_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_352_4 = 0

			if var_352_4 < arg_349_1.time_ and arg_349_1.time_ <= var_352_4 + arg_352_0 then
				arg_349_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_352_5 = 0

			if var_352_5 < arg_349_1.time_ and arg_349_1.time_ <= var_352_5 + arg_352_0 then
				arg_349_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_352_6 = arg_349_1.actors_["10066ui_story"]
			local var_352_7 = 0

			if var_352_7 < arg_349_1.time_ and arg_349_1.time_ <= var_352_7 + arg_352_0 and arg_349_1.var_.characterEffect10066ui_story == nil then
				arg_349_1.var_.characterEffect10066ui_story = var_352_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_8 = 0.200000002980232

			if var_352_7 <= arg_349_1.time_ and arg_349_1.time_ < var_352_7 + var_352_8 then
				local var_352_9 = (arg_349_1.time_ - var_352_7) / var_352_8

				if arg_349_1.var_.characterEffect10066ui_story then
					local var_352_10 = Mathf.Lerp(0, 0.5, var_352_9)

					arg_349_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_349_1.var_.characterEffect10066ui_story.fillRatio = var_352_10
				end
			end

			if arg_349_1.time_ >= var_352_7 + var_352_8 and arg_349_1.time_ < var_352_7 + var_352_8 + arg_352_0 and arg_349_1.var_.characterEffect10066ui_story then
				local var_352_11 = 0.5

				arg_349_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_349_1.var_.characterEffect10066ui_story.fillRatio = var_352_11
			end

			local var_352_12 = 0
			local var_352_13 = 0.625

			if var_352_12 < arg_349_1.time_ and arg_349_1.time_ <= var_352_12 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_14 = arg_349_1:FormatText(StoryNameCfg[74].name)

				arg_349_1.leftNameTxt_.text = var_352_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_15 = arg_349_1:GetWordFromCfg(318041085)
				local var_352_16 = arg_349_1:FormatText(var_352_15.content)

				arg_349_1.text_.text = var_352_16

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_17 = 25
				local var_352_18 = utf8.len(var_352_16)
				local var_352_19 = var_352_17 <= 0 and var_352_13 or var_352_13 * (var_352_18 / var_352_17)

				if var_352_19 > 0 and var_352_13 < var_352_19 then
					arg_349_1.talkMaxDuration = var_352_19

					if var_352_19 + var_352_12 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_19 + var_352_12
					end
				end

				arg_349_1.text_.text = var_352_16
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041085", "story_v_out_318041.awb") ~= 0 then
					local var_352_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041085", "story_v_out_318041.awb") / 1000

					if var_352_20 + var_352_12 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_20 + var_352_12
					end

					if var_352_15.prefab_name ~= "" and arg_349_1.actors_[var_352_15.prefab_name] ~= nil then
						local var_352_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_15.prefab_name].transform, "story_v_out_318041", "318041085", "story_v_out_318041.awb")

						arg_349_1:RecordAudio("318041085", var_352_21)
						arg_349_1:RecordAudio("318041085", var_352_21)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_318041", "318041085", "story_v_out_318041.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_318041", "318041085", "story_v_out_318041.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_22 = math.max(var_352_13, arg_349_1.talkMaxDuration)

			if var_352_12 <= arg_349_1.time_ and arg_349_1.time_ < var_352_12 + var_352_22 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_12) / var_352_22

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_12 + var_352_22 and arg_349_1.time_ < var_352_12 + var_352_22 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play318041086 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 318041086
		arg_353_1.duration_ = 8.133

		local var_353_0 = {
			zh = 4.533,
			ja = 8.133
		}
		local var_353_1 = manager.audio:GetLocalizationFlag()

		if var_353_0[var_353_1] ~= nil then
			arg_353_1.duration_ = var_353_0[var_353_1]
		end

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play318041087(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["10066ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.characterEffect10066ui_story == nil then
				arg_353_1.var_.characterEffect10066ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.200000002980232

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect10066ui_story then
					arg_353_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.characterEffect10066ui_story then
				arg_353_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_356_4 = 0

			if var_356_4 < arg_353_1.time_ and arg_353_1.time_ <= var_356_4 + arg_356_0 then
				arg_353_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action1_1")
			end

			local var_356_5 = 0

			if var_356_5 < arg_353_1.time_ and arg_353_1.time_ <= var_356_5 + arg_356_0 then
				arg_353_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_356_6 = arg_353_1.actors_["1050ui_story"]
			local var_356_7 = 0

			if var_356_7 < arg_353_1.time_ and arg_353_1.time_ <= var_356_7 + arg_356_0 and arg_353_1.var_.characterEffect1050ui_story == nil then
				arg_353_1.var_.characterEffect1050ui_story = var_356_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_8 = 0.200000002980232

			if var_356_7 <= arg_353_1.time_ and arg_353_1.time_ < var_356_7 + var_356_8 then
				local var_356_9 = (arg_353_1.time_ - var_356_7) / var_356_8

				if arg_353_1.var_.characterEffect1050ui_story then
					local var_356_10 = Mathf.Lerp(0, 0.5, var_356_9)

					arg_353_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_353_1.var_.characterEffect1050ui_story.fillRatio = var_356_10
				end
			end

			if arg_353_1.time_ >= var_356_7 + var_356_8 and arg_353_1.time_ < var_356_7 + var_356_8 + arg_356_0 and arg_353_1.var_.characterEffect1050ui_story then
				local var_356_11 = 0.5

				arg_353_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_353_1.var_.characterEffect1050ui_story.fillRatio = var_356_11
			end

			local var_356_12 = 0
			local var_356_13 = 0.5

			if var_356_12 < arg_353_1.time_ and arg_353_1.time_ <= var_356_12 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_14 = arg_353_1:FormatText(StoryNameCfg[640].name)

				arg_353_1.leftNameTxt_.text = var_356_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_15 = arg_353_1:GetWordFromCfg(318041086)
				local var_356_16 = arg_353_1:FormatText(var_356_15.content)

				arg_353_1.text_.text = var_356_16

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_17 = 20
				local var_356_18 = utf8.len(var_356_16)
				local var_356_19 = var_356_17 <= 0 and var_356_13 or var_356_13 * (var_356_18 / var_356_17)

				if var_356_19 > 0 and var_356_13 < var_356_19 then
					arg_353_1.talkMaxDuration = var_356_19

					if var_356_19 + var_356_12 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_19 + var_356_12
					end
				end

				arg_353_1.text_.text = var_356_16
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041086", "story_v_out_318041.awb") ~= 0 then
					local var_356_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041086", "story_v_out_318041.awb") / 1000

					if var_356_20 + var_356_12 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_20 + var_356_12
					end

					if var_356_15.prefab_name ~= "" and arg_353_1.actors_[var_356_15.prefab_name] ~= nil then
						local var_356_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_15.prefab_name].transform, "story_v_out_318041", "318041086", "story_v_out_318041.awb")

						arg_353_1:RecordAudio("318041086", var_356_21)
						arg_353_1:RecordAudio("318041086", var_356_21)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_318041", "318041086", "story_v_out_318041.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_318041", "318041086", "story_v_out_318041.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_22 = math.max(var_356_13, arg_353_1.talkMaxDuration)

			if var_356_12 <= arg_353_1.time_ and arg_353_1.time_ < var_356_12 + var_356_22 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_12) / var_356_22

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_12 + var_356_22 and arg_353_1.time_ < var_356_12 + var_356_22 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play318041087 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 318041087
		arg_357_1.duration_ = 14.6

		local var_357_0 = {
			zh = 6.566,
			ja = 14.6
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
				arg_357_0:Play318041088(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["10066ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect10066ui_story == nil then
				arg_357_1.var_.characterEffect10066ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.200000002980232

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect10066ui_story then
					arg_357_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect10066ui_story then
				arg_357_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_360_4 = 0

			if var_360_4 < arg_357_1.time_ and arg_357_1.time_ <= var_360_4 + arg_360_0 then
				arg_357_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_1")
			end

			local var_360_5 = 0

			if var_360_5 < arg_357_1.time_ and arg_357_1.time_ <= var_360_5 + arg_360_0 then
				arg_357_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_360_6 = 0
			local var_360_7 = 0.825

			if var_360_6 < arg_357_1.time_ and arg_357_1.time_ <= var_360_6 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_8 = arg_357_1:FormatText(StoryNameCfg[640].name)

				arg_357_1.leftNameTxt_.text = var_360_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_9 = arg_357_1:GetWordFromCfg(318041087)
				local var_360_10 = arg_357_1:FormatText(var_360_9.content)

				arg_357_1.text_.text = var_360_10

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_11 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041087", "story_v_out_318041.awb") ~= 0 then
					local var_360_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041087", "story_v_out_318041.awb") / 1000

					if var_360_14 + var_360_6 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_14 + var_360_6
					end

					if var_360_9.prefab_name ~= "" and arg_357_1.actors_[var_360_9.prefab_name] ~= nil then
						local var_360_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_9.prefab_name].transform, "story_v_out_318041", "318041087", "story_v_out_318041.awb")

						arg_357_1:RecordAudio("318041087", var_360_15)
						arg_357_1:RecordAudio("318041087", var_360_15)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_318041", "318041087", "story_v_out_318041.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_318041", "318041087", "story_v_out_318041.awb")
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
	Play318041088 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 318041088
		arg_361_1.duration_ = 8.833

		local var_361_0 = {
			zh = 5.233,
			ja = 8.833
		}
		local var_361_1 = manager.audio:GetLocalizationFlag()

		if var_361_0[var_361_1] ~= nil then
			arg_361_1.duration_ = var_361_0[var_361_1]
		end

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play318041089(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1050ui_story"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.characterEffect1050ui_story == nil then
				arg_361_1.var_.characterEffect1050ui_story = var_364_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_2 = 0.200000002980232

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.characterEffect1050ui_story then
					arg_361_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect1050ui_story then
				arg_361_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_364_4 = 0

			if var_364_4 < arg_361_1.time_ and arg_361_1.time_ <= var_364_4 + arg_364_0 then
				arg_361_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_364_5 = 0

			if var_364_5 < arg_361_1.time_ and arg_361_1.time_ <= var_364_5 + arg_364_0 then
				arg_361_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_364_6 = arg_361_1.actors_["10066ui_story"]
			local var_364_7 = 0

			if var_364_7 < arg_361_1.time_ and arg_361_1.time_ <= var_364_7 + arg_364_0 and arg_361_1.var_.characterEffect10066ui_story == nil then
				arg_361_1.var_.characterEffect10066ui_story = var_364_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_8 = 0.200000002980232

			if var_364_7 <= arg_361_1.time_ and arg_361_1.time_ < var_364_7 + var_364_8 then
				local var_364_9 = (arg_361_1.time_ - var_364_7) / var_364_8

				if arg_361_1.var_.characterEffect10066ui_story then
					local var_364_10 = Mathf.Lerp(0, 0.5, var_364_9)

					arg_361_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_361_1.var_.characterEffect10066ui_story.fillRatio = var_364_10
				end
			end

			if arg_361_1.time_ >= var_364_7 + var_364_8 and arg_361_1.time_ < var_364_7 + var_364_8 + arg_364_0 and arg_361_1.var_.characterEffect10066ui_story then
				local var_364_11 = 0.5

				arg_361_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_361_1.var_.characterEffect10066ui_story.fillRatio = var_364_11
			end

			local var_364_12 = 0
			local var_364_13 = 0.625

			if var_364_12 < arg_361_1.time_ and arg_361_1.time_ <= var_364_12 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_14 = arg_361_1:FormatText(StoryNameCfg[74].name)

				arg_361_1.leftNameTxt_.text = var_364_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_15 = arg_361_1:GetWordFromCfg(318041088)
				local var_364_16 = arg_361_1:FormatText(var_364_15.content)

				arg_361_1.text_.text = var_364_16

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_17 = 25
				local var_364_18 = utf8.len(var_364_16)
				local var_364_19 = var_364_17 <= 0 and var_364_13 or var_364_13 * (var_364_18 / var_364_17)

				if var_364_19 > 0 and var_364_13 < var_364_19 then
					arg_361_1.talkMaxDuration = var_364_19

					if var_364_19 + var_364_12 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_19 + var_364_12
					end
				end

				arg_361_1.text_.text = var_364_16
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041088", "story_v_out_318041.awb") ~= 0 then
					local var_364_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041088", "story_v_out_318041.awb") / 1000

					if var_364_20 + var_364_12 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_20 + var_364_12
					end

					if var_364_15.prefab_name ~= "" and arg_361_1.actors_[var_364_15.prefab_name] ~= nil then
						local var_364_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_15.prefab_name].transform, "story_v_out_318041", "318041088", "story_v_out_318041.awb")

						arg_361_1:RecordAudio("318041088", var_364_21)
						arg_361_1:RecordAudio("318041088", var_364_21)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_318041", "318041088", "story_v_out_318041.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_318041", "318041088", "story_v_out_318041.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_22 = math.max(var_364_13, arg_361_1.talkMaxDuration)

			if var_364_12 <= arg_361_1.time_ and arg_361_1.time_ < var_364_12 + var_364_22 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_12) / var_364_22

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_12 + var_364_22 and arg_361_1.time_ < var_364_12 + var_364_22 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play318041089 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 318041089
		arg_365_1.duration_ = 7.266

		local var_365_0 = {
			zh = 3.566,
			ja = 7.266
		}
		local var_365_1 = manager.audio:GetLocalizationFlag()

		if var_365_0[var_365_1] ~= nil then
			arg_365_1.duration_ = var_365_0[var_365_1]
		end

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play318041090(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["10066ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect10066ui_story == nil then
				arg_365_1.var_.characterEffect10066ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.200000002980232

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect10066ui_story then
					arg_365_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect10066ui_story then
				arg_365_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_368_4 = 0

			if var_368_4 < arg_365_1.time_ and arg_365_1.time_ <= var_368_4 + arg_368_0 then
				arg_365_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action436")
			end

			local var_368_5 = 0

			if var_368_5 < arg_365_1.time_ and arg_365_1.time_ <= var_368_5 + arg_368_0 then
				arg_365_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_368_6 = arg_365_1.actors_["1050ui_story"]
			local var_368_7 = 0

			if var_368_7 < arg_365_1.time_ and arg_365_1.time_ <= var_368_7 + arg_368_0 and arg_365_1.var_.characterEffect1050ui_story == nil then
				arg_365_1.var_.characterEffect1050ui_story = var_368_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_8 = 0.200000002980232

			if var_368_7 <= arg_365_1.time_ and arg_365_1.time_ < var_368_7 + var_368_8 then
				local var_368_9 = (arg_365_1.time_ - var_368_7) / var_368_8

				if arg_365_1.var_.characterEffect1050ui_story then
					local var_368_10 = Mathf.Lerp(0, 0.5, var_368_9)

					arg_365_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_365_1.var_.characterEffect1050ui_story.fillRatio = var_368_10
				end
			end

			if arg_365_1.time_ >= var_368_7 + var_368_8 and arg_365_1.time_ < var_368_7 + var_368_8 + arg_368_0 and arg_365_1.var_.characterEffect1050ui_story then
				local var_368_11 = 0.5

				arg_365_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_365_1.var_.characterEffect1050ui_story.fillRatio = var_368_11
			end

			local var_368_12 = 0
			local var_368_13 = 0.35

			if var_368_12 < arg_365_1.time_ and arg_365_1.time_ <= var_368_12 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_14 = arg_365_1:FormatText(StoryNameCfg[640].name)

				arg_365_1.leftNameTxt_.text = var_368_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_15 = arg_365_1:GetWordFromCfg(318041089)
				local var_368_16 = arg_365_1:FormatText(var_368_15.content)

				arg_365_1.text_.text = var_368_16

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_17 = 14
				local var_368_18 = utf8.len(var_368_16)
				local var_368_19 = var_368_17 <= 0 and var_368_13 or var_368_13 * (var_368_18 / var_368_17)

				if var_368_19 > 0 and var_368_13 < var_368_19 then
					arg_365_1.talkMaxDuration = var_368_19

					if var_368_19 + var_368_12 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_19 + var_368_12
					end
				end

				arg_365_1.text_.text = var_368_16
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041089", "story_v_out_318041.awb") ~= 0 then
					local var_368_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041089", "story_v_out_318041.awb") / 1000

					if var_368_20 + var_368_12 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_20 + var_368_12
					end

					if var_368_15.prefab_name ~= "" and arg_365_1.actors_[var_368_15.prefab_name] ~= nil then
						local var_368_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_15.prefab_name].transform, "story_v_out_318041", "318041089", "story_v_out_318041.awb")

						arg_365_1:RecordAudio("318041089", var_368_21)
						arg_365_1:RecordAudio("318041089", var_368_21)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_318041", "318041089", "story_v_out_318041.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_318041", "318041089", "story_v_out_318041.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_22 = math.max(var_368_13, arg_365_1.talkMaxDuration)

			if var_368_12 <= arg_365_1.time_ and arg_365_1.time_ < var_368_12 + var_368_22 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_12) / var_368_22

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_12 + var_368_22 and arg_365_1.time_ < var_368_12 + var_368_22 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play318041090 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 318041090
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play318041091(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["10066ui_story"]
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 and arg_369_1.var_.characterEffect10066ui_story == nil then
				arg_369_1.var_.characterEffect10066ui_story = var_372_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_2 = 0.200000002980232

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2

				if arg_369_1.var_.characterEffect10066ui_story then
					local var_372_4 = Mathf.Lerp(0, 0.5, var_372_3)

					arg_369_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_369_1.var_.characterEffect10066ui_story.fillRatio = var_372_4
				end
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 and arg_369_1.var_.characterEffect10066ui_story then
				local var_372_5 = 0.5

				arg_369_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_369_1.var_.characterEffect10066ui_story.fillRatio = var_372_5
			end

			local var_372_6 = arg_369_1.actors_["1050ui_story"]
			local var_372_7 = 0

			if var_372_7 < arg_369_1.time_ and arg_369_1.time_ <= var_372_7 + arg_372_0 and arg_369_1.var_.characterEffect1050ui_story == nil then
				arg_369_1.var_.characterEffect1050ui_story = var_372_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_8 = 0.200000002980232

			if var_372_7 <= arg_369_1.time_ and arg_369_1.time_ < var_372_7 + var_372_8 then
				local var_372_9 = (arg_369_1.time_ - var_372_7) / var_372_8

				if arg_369_1.var_.characterEffect1050ui_story then
					local var_372_10 = Mathf.Lerp(0, 0.5, var_372_9)

					arg_369_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_369_1.var_.characterEffect1050ui_story.fillRatio = var_372_10
				end
			end

			if arg_369_1.time_ >= var_372_7 + var_372_8 and arg_369_1.time_ < var_372_7 + var_372_8 + arg_372_0 and arg_369_1.var_.characterEffect1050ui_story then
				local var_372_11 = 0.5

				arg_369_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_369_1.var_.characterEffect1050ui_story.fillRatio = var_372_11
			end

			local var_372_12 = 0
			local var_372_13 = 0.8

			if var_372_12 < arg_369_1.time_ and arg_369_1.time_ <= var_372_12 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, false)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_14 = arg_369_1:GetWordFromCfg(318041090)
				local var_372_15 = arg_369_1:FormatText(var_372_14.content)

				arg_369_1.text_.text = var_372_15

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_16 = 32
				local var_372_17 = utf8.len(var_372_15)
				local var_372_18 = var_372_16 <= 0 and var_372_13 or var_372_13 * (var_372_17 / var_372_16)

				if var_372_18 > 0 and var_372_13 < var_372_18 then
					arg_369_1.talkMaxDuration = var_372_18

					if var_372_18 + var_372_12 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_18 + var_372_12
					end
				end

				arg_369_1.text_.text = var_372_15
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_19 = math.max(var_372_13, arg_369_1.talkMaxDuration)

			if var_372_12 <= arg_369_1.time_ and arg_369_1.time_ < var_372_12 + var_372_19 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_12) / var_372_19

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_12 + var_372_19 and arg_369_1.time_ < var_372_12 + var_372_19 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play318041091 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 318041091
		arg_373_1.duration_ = 6.533

		local var_373_0 = {
			zh = 4.733,
			ja = 6.533
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
				arg_373_0:Play318041092(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["10066ui_story"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.characterEffect10066ui_story == nil then
				arg_373_1.var_.characterEffect10066ui_story = var_376_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_2 = 0.200000002980232

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.characterEffect10066ui_story then
					arg_373_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.characterEffect10066ui_story then
				arg_373_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_376_4 = 0

			if var_376_4 < arg_373_1.time_ and arg_373_1.time_ <= var_376_4 + arg_376_0 then
				arg_373_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action463")
			end

			local var_376_5 = 0

			if var_376_5 < arg_373_1.time_ and arg_373_1.time_ <= var_376_5 + arg_376_0 then
				arg_373_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_376_6 = 0
			local var_376_7 = 0.5

			if var_376_6 < arg_373_1.time_ and arg_373_1.time_ <= var_376_6 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_8 = arg_373_1:FormatText(StoryNameCfg[640].name)

				arg_373_1.leftNameTxt_.text = var_376_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_9 = arg_373_1:GetWordFromCfg(318041091)
				local var_376_10 = arg_373_1:FormatText(var_376_9.content)

				arg_373_1.text_.text = var_376_10

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_11 = 20
				local var_376_12 = utf8.len(var_376_10)
				local var_376_13 = var_376_11 <= 0 and var_376_7 or var_376_7 * (var_376_12 / var_376_11)

				if var_376_13 > 0 and var_376_7 < var_376_13 then
					arg_373_1.talkMaxDuration = var_376_13

					if var_376_13 + var_376_6 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_13 + var_376_6
					end
				end

				arg_373_1.text_.text = var_376_10
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041091", "story_v_out_318041.awb") ~= 0 then
					local var_376_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041091", "story_v_out_318041.awb") / 1000

					if var_376_14 + var_376_6 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_14 + var_376_6
					end

					if var_376_9.prefab_name ~= "" and arg_373_1.actors_[var_376_9.prefab_name] ~= nil then
						local var_376_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_9.prefab_name].transform, "story_v_out_318041", "318041091", "story_v_out_318041.awb")

						arg_373_1:RecordAudio("318041091", var_376_15)
						arg_373_1:RecordAudio("318041091", var_376_15)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_318041", "318041091", "story_v_out_318041.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_318041", "318041091", "story_v_out_318041.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_16 = math.max(var_376_7, arg_373_1.talkMaxDuration)

			if var_376_6 <= arg_373_1.time_ and arg_373_1.time_ < var_376_6 + var_376_16 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_6) / var_376_16

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_6 + var_376_16 and arg_373_1.time_ < var_376_6 + var_376_16 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play318041092 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 318041092
		arg_377_1.duration_ = 2.1

		local var_377_0 = {
			zh = 2.033,
			ja = 2.1
		}
		local var_377_1 = manager.audio:GetLocalizationFlag()

		if var_377_0[var_377_1] ~= nil then
			arg_377_1.duration_ = var_377_0[var_377_1]
		end

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play318041093(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1050ui_story"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.characterEffect1050ui_story == nil then
				arg_377_1.var_.characterEffect1050ui_story = var_380_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_2 = 0.200000002980232

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.characterEffect1050ui_story then
					arg_377_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect1050ui_story then
				arg_377_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_380_4 = arg_377_1.actors_["10066ui_story"]
			local var_380_5 = 0

			if var_380_5 < arg_377_1.time_ and arg_377_1.time_ <= var_380_5 + arg_380_0 and arg_377_1.var_.characterEffect10066ui_story == nil then
				arg_377_1.var_.characterEffect10066ui_story = var_380_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_6 = 0.200000002980232

			if var_380_5 <= arg_377_1.time_ and arg_377_1.time_ < var_380_5 + var_380_6 then
				local var_380_7 = (arg_377_1.time_ - var_380_5) / var_380_6

				if arg_377_1.var_.characterEffect10066ui_story then
					local var_380_8 = Mathf.Lerp(0, 0.5, var_380_7)

					arg_377_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_377_1.var_.characterEffect10066ui_story.fillRatio = var_380_8
				end
			end

			if arg_377_1.time_ >= var_380_5 + var_380_6 and arg_377_1.time_ < var_380_5 + var_380_6 + arg_380_0 and arg_377_1.var_.characterEffect10066ui_story then
				local var_380_9 = 0.5

				arg_377_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_377_1.var_.characterEffect10066ui_story.fillRatio = var_380_9
			end

			local var_380_10 = 0
			local var_380_11 = 0.15

			if var_380_10 < arg_377_1.time_ and arg_377_1.time_ <= var_380_10 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_12 = arg_377_1:FormatText(StoryNameCfg[74].name)

				arg_377_1.leftNameTxt_.text = var_380_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_13 = arg_377_1:GetWordFromCfg(318041092)
				local var_380_14 = arg_377_1:FormatText(var_380_13.content)

				arg_377_1.text_.text = var_380_14

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_15 = 6
				local var_380_16 = utf8.len(var_380_14)
				local var_380_17 = var_380_15 <= 0 and var_380_11 or var_380_11 * (var_380_16 / var_380_15)

				if var_380_17 > 0 and var_380_11 < var_380_17 then
					arg_377_1.talkMaxDuration = var_380_17

					if var_380_17 + var_380_10 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_17 + var_380_10
					end
				end

				arg_377_1.text_.text = var_380_14
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041092", "story_v_out_318041.awb") ~= 0 then
					local var_380_18 = manager.audio:GetVoiceLength("story_v_out_318041", "318041092", "story_v_out_318041.awb") / 1000

					if var_380_18 + var_380_10 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_18 + var_380_10
					end

					if var_380_13.prefab_name ~= "" and arg_377_1.actors_[var_380_13.prefab_name] ~= nil then
						local var_380_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_13.prefab_name].transform, "story_v_out_318041", "318041092", "story_v_out_318041.awb")

						arg_377_1:RecordAudio("318041092", var_380_19)
						arg_377_1:RecordAudio("318041092", var_380_19)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_318041", "318041092", "story_v_out_318041.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_318041", "318041092", "story_v_out_318041.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_20 = math.max(var_380_11, arg_377_1.talkMaxDuration)

			if var_380_10 <= arg_377_1.time_ and arg_377_1.time_ < var_380_10 + var_380_20 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_10) / var_380_20

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_10 + var_380_20 and arg_377_1.time_ < var_380_10 + var_380_20 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play318041093 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 318041093
		arg_381_1.duration_ = 7.033

		local var_381_0 = {
			zh = 5.2,
			ja = 7.033
		}
		local var_381_1 = manager.audio:GetLocalizationFlag()

		if var_381_0[var_381_1] ~= nil then
			arg_381_1.duration_ = var_381_0[var_381_1]
		end

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play318041094(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["10066ui_story"]
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 and arg_381_1.var_.characterEffect10066ui_story == nil then
				arg_381_1.var_.characterEffect10066ui_story = var_384_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_2 = 0.200000002980232

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2

				if arg_381_1.var_.characterEffect10066ui_story then
					arg_381_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 and arg_381_1.var_.characterEffect10066ui_story then
				arg_381_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_384_4 = 0

			if var_384_4 < arg_381_1.time_ and arg_381_1.time_ <= var_384_4 + arg_384_0 then
				arg_381_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_384_5 = arg_381_1.actors_["1050ui_story"]
			local var_384_6 = 0

			if var_384_6 < arg_381_1.time_ and arg_381_1.time_ <= var_384_6 + arg_384_0 and arg_381_1.var_.characterEffect1050ui_story == nil then
				arg_381_1.var_.characterEffect1050ui_story = var_384_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_7 = 0.200000002980232

			if var_384_6 <= arg_381_1.time_ and arg_381_1.time_ < var_384_6 + var_384_7 then
				local var_384_8 = (arg_381_1.time_ - var_384_6) / var_384_7

				if arg_381_1.var_.characterEffect1050ui_story then
					local var_384_9 = Mathf.Lerp(0, 0.5, var_384_8)

					arg_381_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_381_1.var_.characterEffect1050ui_story.fillRatio = var_384_9
				end
			end

			if arg_381_1.time_ >= var_384_6 + var_384_7 and arg_381_1.time_ < var_384_6 + var_384_7 + arg_384_0 and arg_381_1.var_.characterEffect1050ui_story then
				local var_384_10 = 0.5

				arg_381_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_381_1.var_.characterEffect1050ui_story.fillRatio = var_384_10
			end

			local var_384_11 = 0
			local var_384_12 = 0.4

			if var_384_11 < arg_381_1.time_ and arg_381_1.time_ <= var_384_11 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_13 = arg_381_1:FormatText(StoryNameCfg[640].name)

				arg_381_1.leftNameTxt_.text = var_384_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_14 = arg_381_1:GetWordFromCfg(318041093)
				local var_384_15 = arg_381_1:FormatText(var_384_14.content)

				arg_381_1.text_.text = var_384_15

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_16 = 16
				local var_384_17 = utf8.len(var_384_15)
				local var_384_18 = var_384_16 <= 0 and var_384_12 or var_384_12 * (var_384_17 / var_384_16)

				if var_384_18 > 0 and var_384_12 < var_384_18 then
					arg_381_1.talkMaxDuration = var_384_18

					if var_384_18 + var_384_11 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_18 + var_384_11
					end
				end

				arg_381_1.text_.text = var_384_15
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041093", "story_v_out_318041.awb") ~= 0 then
					local var_384_19 = manager.audio:GetVoiceLength("story_v_out_318041", "318041093", "story_v_out_318041.awb") / 1000

					if var_384_19 + var_384_11 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_19 + var_384_11
					end

					if var_384_14.prefab_name ~= "" and arg_381_1.actors_[var_384_14.prefab_name] ~= nil then
						local var_384_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_14.prefab_name].transform, "story_v_out_318041", "318041093", "story_v_out_318041.awb")

						arg_381_1:RecordAudio("318041093", var_384_20)
						arg_381_1:RecordAudio("318041093", var_384_20)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_318041", "318041093", "story_v_out_318041.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_318041", "318041093", "story_v_out_318041.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_21 = math.max(var_384_12, arg_381_1.talkMaxDuration)

			if var_384_11 <= arg_381_1.time_ and arg_381_1.time_ < var_384_11 + var_384_21 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_11) / var_384_21

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_11 + var_384_21 and arg_381_1.time_ < var_384_11 + var_384_21 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play318041094 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 318041094
		arg_385_1.duration_ = 5.533

		local var_385_0 = {
			zh = 5.533,
			ja = 3.066
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
				arg_385_0:Play318041095(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1050ui_story"]
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 and arg_385_1.var_.characterEffect1050ui_story == nil then
				arg_385_1.var_.characterEffect1050ui_story = var_388_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_2 = 0.200000002980232

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2

				if arg_385_1.var_.characterEffect1050ui_story then
					arg_385_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 and arg_385_1.var_.characterEffect1050ui_story then
				arg_385_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_388_4 = 0

			if var_388_4 < arg_385_1.time_ and arg_385_1.time_ <= var_388_4 + arg_388_0 then
				arg_385_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_388_5 = 0

			if var_388_5 < arg_385_1.time_ and arg_385_1.time_ <= var_388_5 + arg_388_0 then
				arg_385_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_388_6 = arg_385_1.actors_["10066ui_story"]
			local var_388_7 = 0

			if var_388_7 < arg_385_1.time_ and arg_385_1.time_ <= var_388_7 + arg_388_0 and arg_385_1.var_.characterEffect10066ui_story == nil then
				arg_385_1.var_.characterEffect10066ui_story = var_388_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_8 = 0.200000002980232

			if var_388_7 <= arg_385_1.time_ and arg_385_1.time_ < var_388_7 + var_388_8 then
				local var_388_9 = (arg_385_1.time_ - var_388_7) / var_388_8

				if arg_385_1.var_.characterEffect10066ui_story then
					local var_388_10 = Mathf.Lerp(0, 0.5, var_388_9)

					arg_385_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_385_1.var_.characterEffect10066ui_story.fillRatio = var_388_10
				end
			end

			if arg_385_1.time_ >= var_388_7 + var_388_8 and arg_385_1.time_ < var_388_7 + var_388_8 + arg_388_0 and arg_385_1.var_.characterEffect10066ui_story then
				local var_388_11 = 0.5

				arg_385_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_385_1.var_.characterEffect10066ui_story.fillRatio = var_388_11
			end

			local var_388_12 = 0
			local var_388_13 = 0.525

			if var_388_12 < arg_385_1.time_ and arg_385_1.time_ <= var_388_12 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_14 = arg_385_1:FormatText(StoryNameCfg[74].name)

				arg_385_1.leftNameTxt_.text = var_388_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_15 = arg_385_1:GetWordFromCfg(318041094)
				local var_388_16 = arg_385_1:FormatText(var_388_15.content)

				arg_385_1.text_.text = var_388_16

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_17 = 21
				local var_388_18 = utf8.len(var_388_16)
				local var_388_19 = var_388_17 <= 0 and var_388_13 or var_388_13 * (var_388_18 / var_388_17)

				if var_388_19 > 0 and var_388_13 < var_388_19 then
					arg_385_1.talkMaxDuration = var_388_19

					if var_388_19 + var_388_12 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_19 + var_388_12
					end
				end

				arg_385_1.text_.text = var_388_16
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041094", "story_v_out_318041.awb") ~= 0 then
					local var_388_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041094", "story_v_out_318041.awb") / 1000

					if var_388_20 + var_388_12 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_20 + var_388_12
					end

					if var_388_15.prefab_name ~= "" and arg_385_1.actors_[var_388_15.prefab_name] ~= nil then
						local var_388_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_15.prefab_name].transform, "story_v_out_318041", "318041094", "story_v_out_318041.awb")

						arg_385_1:RecordAudio("318041094", var_388_21)
						arg_385_1:RecordAudio("318041094", var_388_21)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_318041", "318041094", "story_v_out_318041.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_318041", "318041094", "story_v_out_318041.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_22 = math.max(var_388_13, arg_385_1.talkMaxDuration)

			if var_388_12 <= arg_385_1.time_ and arg_385_1.time_ < var_388_12 + var_388_22 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_12) / var_388_22

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_12 + var_388_22 and arg_385_1.time_ < var_388_12 + var_388_22 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play318041095 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 318041095
		arg_389_1.duration_ = 10.6

		local var_389_0 = {
			zh = 10.6,
			ja = 5.9
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
				arg_389_0:Play318041096(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1050ui_story"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.characterEffect1050ui_story == nil then
				arg_389_1.var_.characterEffect1050ui_story = var_392_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_2 = 0.200000002980232

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.characterEffect1050ui_story then
					arg_389_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect1050ui_story then
				arg_389_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_392_4 = 0
			local var_392_5 = 1.05

			if var_392_4 < arg_389_1.time_ and arg_389_1.time_ <= var_392_4 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_6 = arg_389_1:FormatText(StoryNameCfg[74].name)

				arg_389_1.leftNameTxt_.text = var_392_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_7 = arg_389_1:GetWordFromCfg(318041095)
				local var_392_8 = arg_389_1:FormatText(var_392_7.content)

				arg_389_1.text_.text = var_392_8

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_9 = 42
				local var_392_10 = utf8.len(var_392_8)
				local var_392_11 = var_392_9 <= 0 and var_392_5 or var_392_5 * (var_392_10 / var_392_9)

				if var_392_11 > 0 and var_392_5 < var_392_11 then
					arg_389_1.talkMaxDuration = var_392_11

					if var_392_11 + var_392_4 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_11 + var_392_4
					end
				end

				arg_389_1.text_.text = var_392_8
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041095", "story_v_out_318041.awb") ~= 0 then
					local var_392_12 = manager.audio:GetVoiceLength("story_v_out_318041", "318041095", "story_v_out_318041.awb") / 1000

					if var_392_12 + var_392_4 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_12 + var_392_4
					end

					if var_392_7.prefab_name ~= "" and arg_389_1.actors_[var_392_7.prefab_name] ~= nil then
						local var_392_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_7.prefab_name].transform, "story_v_out_318041", "318041095", "story_v_out_318041.awb")

						arg_389_1:RecordAudio("318041095", var_392_13)
						arg_389_1:RecordAudio("318041095", var_392_13)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_318041", "318041095", "story_v_out_318041.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_318041", "318041095", "story_v_out_318041.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_14 = math.max(var_392_5, arg_389_1.talkMaxDuration)

			if var_392_4 <= arg_389_1.time_ and arg_389_1.time_ < var_392_4 + var_392_14 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_4) / var_392_14

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_4 + var_392_14 and arg_389_1.time_ < var_392_4 + var_392_14 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play318041096 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 318041096
		arg_393_1.duration_ = 7.1

		local var_393_0 = {
			zh = 7.1,
			ja = 5.4
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
				arg_393_0:Play318041097(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1050ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect1050ui_story == nil then
				arg_393_1.var_.characterEffect1050ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.200000002980232

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect1050ui_story then
					arg_393_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect1050ui_story then
				arg_393_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_396_4 = 0
			local var_396_5 = 0.775

			if var_396_4 < arg_393_1.time_ and arg_393_1.time_ <= var_396_4 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_6 = arg_393_1:FormatText(StoryNameCfg[74].name)

				arg_393_1.leftNameTxt_.text = var_396_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_7 = arg_393_1:GetWordFromCfg(318041096)
				local var_396_8 = arg_393_1:FormatText(var_396_7.content)

				arg_393_1.text_.text = var_396_8

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_9 = 31
				local var_396_10 = utf8.len(var_396_8)
				local var_396_11 = var_396_9 <= 0 and var_396_5 or var_396_5 * (var_396_10 / var_396_9)

				if var_396_11 > 0 and var_396_5 < var_396_11 then
					arg_393_1.talkMaxDuration = var_396_11

					if var_396_11 + var_396_4 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_11 + var_396_4
					end
				end

				arg_393_1.text_.text = var_396_8
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041096", "story_v_out_318041.awb") ~= 0 then
					local var_396_12 = manager.audio:GetVoiceLength("story_v_out_318041", "318041096", "story_v_out_318041.awb") / 1000

					if var_396_12 + var_396_4 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_12 + var_396_4
					end

					if var_396_7.prefab_name ~= "" and arg_393_1.actors_[var_396_7.prefab_name] ~= nil then
						local var_396_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_7.prefab_name].transform, "story_v_out_318041", "318041096", "story_v_out_318041.awb")

						arg_393_1:RecordAudio("318041096", var_396_13)
						arg_393_1:RecordAudio("318041096", var_396_13)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_318041", "318041096", "story_v_out_318041.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_318041", "318041096", "story_v_out_318041.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_14 = math.max(var_396_5, arg_393_1.talkMaxDuration)

			if var_396_4 <= arg_393_1.time_ and arg_393_1.time_ < var_396_4 + var_396_14 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_4) / var_396_14

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_4 + var_396_14 and arg_393_1.time_ < var_396_4 + var_396_14 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play318041097 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 318041097
		arg_397_1.duration_ = 9.8

		local var_397_0 = {
			zh = 6.833,
			ja = 9.8
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
				arg_397_0:Play318041098(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["10066ui_story"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.characterEffect10066ui_story == nil then
				arg_397_1.var_.characterEffect10066ui_story = var_400_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_2 = 0.200000002980232

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.characterEffect10066ui_story then
					arg_397_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.characterEffect10066ui_story then
				arg_397_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_400_4 = 0

			if var_400_4 < arg_397_1.time_ and arg_397_1.time_ <= var_400_4 + arg_400_0 then
				arg_397_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action435")
			end

			local var_400_5 = 0

			if var_400_5 < arg_397_1.time_ and arg_397_1.time_ <= var_400_5 + arg_400_0 then
				arg_397_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_400_6 = arg_397_1.actors_["1050ui_story"]
			local var_400_7 = 0

			if var_400_7 < arg_397_1.time_ and arg_397_1.time_ <= var_400_7 + arg_400_0 and arg_397_1.var_.characterEffect1050ui_story == nil then
				arg_397_1.var_.characterEffect1050ui_story = var_400_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_8 = 0.200000002980232

			if var_400_7 <= arg_397_1.time_ and arg_397_1.time_ < var_400_7 + var_400_8 then
				local var_400_9 = (arg_397_1.time_ - var_400_7) / var_400_8

				if arg_397_1.var_.characterEffect1050ui_story then
					local var_400_10 = Mathf.Lerp(0, 0.5, var_400_9)

					arg_397_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_397_1.var_.characterEffect1050ui_story.fillRatio = var_400_10
				end
			end

			if arg_397_1.time_ >= var_400_7 + var_400_8 and arg_397_1.time_ < var_400_7 + var_400_8 + arg_400_0 and arg_397_1.var_.characterEffect1050ui_story then
				local var_400_11 = 0.5

				arg_397_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_397_1.var_.characterEffect1050ui_story.fillRatio = var_400_11
			end

			local var_400_12 = 0
			local var_400_13 = 0.325

			if var_400_12 < arg_397_1.time_ and arg_397_1.time_ <= var_400_12 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_14 = arg_397_1:FormatText(StoryNameCfg[640].name)

				arg_397_1.leftNameTxt_.text = var_400_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_15 = arg_397_1:GetWordFromCfg(318041097)
				local var_400_16 = arg_397_1:FormatText(var_400_15.content)

				arg_397_1.text_.text = var_400_16

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_17 = 13
				local var_400_18 = utf8.len(var_400_16)
				local var_400_19 = var_400_17 <= 0 and var_400_13 or var_400_13 * (var_400_18 / var_400_17)

				if var_400_19 > 0 and var_400_13 < var_400_19 then
					arg_397_1.talkMaxDuration = var_400_19

					if var_400_19 + var_400_12 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_19 + var_400_12
					end
				end

				arg_397_1.text_.text = var_400_16
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041097", "story_v_out_318041.awb") ~= 0 then
					local var_400_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041097", "story_v_out_318041.awb") / 1000

					if var_400_20 + var_400_12 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_20 + var_400_12
					end

					if var_400_15.prefab_name ~= "" and arg_397_1.actors_[var_400_15.prefab_name] ~= nil then
						local var_400_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_15.prefab_name].transform, "story_v_out_318041", "318041097", "story_v_out_318041.awb")

						arg_397_1:RecordAudio("318041097", var_400_21)
						arg_397_1:RecordAudio("318041097", var_400_21)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_318041", "318041097", "story_v_out_318041.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_318041", "318041097", "story_v_out_318041.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_22 = math.max(var_400_13, arg_397_1.talkMaxDuration)

			if var_400_12 <= arg_397_1.time_ and arg_397_1.time_ < var_400_12 + var_400_22 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_12) / var_400_22

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_12 + var_400_22 and arg_397_1.time_ < var_400_12 + var_400_22 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play318041098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 318041098
		arg_401_1.duration_ = 9.133

		local var_401_0 = {
			zh = 4.466,
			ja = 9.133
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
				arg_401_0:Play318041099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["10066ui_story"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and arg_401_1.var_.characterEffect10066ui_story == nil then
				arg_401_1.var_.characterEffect10066ui_story = var_404_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_2 = 0.200000002980232

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.characterEffect10066ui_story then
					arg_401_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and arg_401_1.var_.characterEffect10066ui_story then
				arg_401_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_404_4 = 0

			if var_404_4 < arg_401_1.time_ and arg_401_1.time_ <= var_404_4 + arg_404_0 then
				arg_401_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action5_2")
			end

			local var_404_5 = 0

			if var_404_5 < arg_401_1.time_ and arg_401_1.time_ <= var_404_5 + arg_404_0 then
				arg_401_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_404_6 = 0
			local var_404_7 = 0.5

			if var_404_6 < arg_401_1.time_ and arg_401_1.time_ <= var_404_6 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_8 = arg_401_1:FormatText(StoryNameCfg[640].name)

				arg_401_1.leftNameTxt_.text = var_404_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_9 = arg_401_1:GetWordFromCfg(318041098)
				local var_404_10 = arg_401_1:FormatText(var_404_9.content)

				arg_401_1.text_.text = var_404_10

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_11 = 20
				local var_404_12 = utf8.len(var_404_10)
				local var_404_13 = var_404_11 <= 0 and var_404_7 or var_404_7 * (var_404_12 / var_404_11)

				if var_404_13 > 0 and var_404_7 < var_404_13 then
					arg_401_1.talkMaxDuration = var_404_13

					if var_404_13 + var_404_6 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_13 + var_404_6
					end
				end

				arg_401_1.text_.text = var_404_10
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041098", "story_v_out_318041.awb") ~= 0 then
					local var_404_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041098", "story_v_out_318041.awb") / 1000

					if var_404_14 + var_404_6 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_14 + var_404_6
					end

					if var_404_9.prefab_name ~= "" and arg_401_1.actors_[var_404_9.prefab_name] ~= nil then
						local var_404_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_9.prefab_name].transform, "story_v_out_318041", "318041098", "story_v_out_318041.awb")

						arg_401_1:RecordAudio("318041098", var_404_15)
						arg_401_1:RecordAudio("318041098", var_404_15)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_318041", "318041098", "story_v_out_318041.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_318041", "318041098", "story_v_out_318041.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_16 = math.max(var_404_7, arg_401_1.talkMaxDuration)

			if var_404_6 <= arg_401_1.time_ and arg_401_1.time_ < var_404_6 + var_404_16 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_6) / var_404_16

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_6 + var_404_16 and arg_401_1.time_ < var_404_6 + var_404_16 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play318041099 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 318041099
		arg_405_1.duration_ = 7.466

		local var_405_0 = {
			zh = 7.466,
			ja = 6.2
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
				arg_405_0:Play318041100(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 0.85

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_2 = arg_405_1:FormatText(StoryNameCfg[640].name)

				arg_405_1.leftNameTxt_.text = var_408_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_3 = arg_405_1:GetWordFromCfg(318041099)
				local var_408_4 = arg_405_1:FormatText(var_408_3.content)

				arg_405_1.text_.text = var_408_4

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_5 = 34
				local var_408_6 = utf8.len(var_408_4)
				local var_408_7 = var_408_5 <= 0 and var_408_1 or var_408_1 * (var_408_6 / var_408_5)

				if var_408_7 > 0 and var_408_1 < var_408_7 then
					arg_405_1.talkMaxDuration = var_408_7

					if var_408_7 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_7 + var_408_0
					end
				end

				arg_405_1.text_.text = var_408_4
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041099", "story_v_out_318041.awb") ~= 0 then
					local var_408_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041099", "story_v_out_318041.awb") / 1000

					if var_408_8 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_8 + var_408_0
					end

					if var_408_3.prefab_name ~= "" and arg_405_1.actors_[var_408_3.prefab_name] ~= nil then
						local var_408_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_3.prefab_name].transform, "story_v_out_318041", "318041099", "story_v_out_318041.awb")

						arg_405_1:RecordAudio("318041099", var_408_9)
						arg_405_1:RecordAudio("318041099", var_408_9)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_318041", "318041099", "story_v_out_318041.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_318041", "318041099", "story_v_out_318041.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_10 = math.max(var_408_1, arg_405_1.talkMaxDuration)

			if var_408_0 <= arg_405_1.time_ and arg_405_1.time_ < var_408_0 + var_408_10 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_0) / var_408_10

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_0 + var_408_10 and arg_405_1.time_ < var_408_0 + var_408_10 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play318041100 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 318041100
		arg_409_1.duration_ = 8.6

		local var_409_0 = {
			zh = 8.6,
			ja = 6
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
				arg_409_0:Play318041101(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = 0
			local var_412_1 = 1.025

			if var_412_0 < arg_409_1.time_ and arg_409_1.time_ <= var_412_0 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_2 = arg_409_1:FormatText(StoryNameCfg[640].name)

				arg_409_1.leftNameTxt_.text = var_412_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_3 = arg_409_1:GetWordFromCfg(318041100)
				local var_412_4 = arg_409_1:FormatText(var_412_3.content)

				arg_409_1.text_.text = var_412_4

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_5 = 41
				local var_412_6 = utf8.len(var_412_4)
				local var_412_7 = var_412_5 <= 0 and var_412_1 or var_412_1 * (var_412_6 / var_412_5)

				if var_412_7 > 0 and var_412_1 < var_412_7 then
					arg_409_1.talkMaxDuration = var_412_7

					if var_412_7 + var_412_0 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_7 + var_412_0
					end
				end

				arg_409_1.text_.text = var_412_4
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041100", "story_v_out_318041.awb") ~= 0 then
					local var_412_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041100", "story_v_out_318041.awb") / 1000

					if var_412_8 + var_412_0 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_8 + var_412_0
					end

					if var_412_3.prefab_name ~= "" and arg_409_1.actors_[var_412_3.prefab_name] ~= nil then
						local var_412_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_3.prefab_name].transform, "story_v_out_318041", "318041100", "story_v_out_318041.awb")

						arg_409_1:RecordAudio("318041100", var_412_9)
						arg_409_1:RecordAudio("318041100", var_412_9)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_318041", "318041100", "story_v_out_318041.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_318041", "318041100", "story_v_out_318041.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_10 = math.max(var_412_1, arg_409_1.talkMaxDuration)

			if var_412_0 <= arg_409_1.time_ and arg_409_1.time_ < var_412_0 + var_412_10 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_0) / var_412_10

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_0 + var_412_10 and arg_409_1.time_ < var_412_0 + var_412_10 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play318041101 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 318041101
		arg_413_1.duration_ = 3.833

		local var_413_0 = {
			zh = 3.833,
			ja = 3.8
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
				arg_413_0:Play318041102(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1050ui_story"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.characterEffect1050ui_story == nil then
				arg_413_1.var_.characterEffect1050ui_story = var_416_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_2 = 0.200000002980232

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.characterEffect1050ui_story then
					arg_413_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.characterEffect1050ui_story then
				arg_413_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_416_4 = arg_413_1.actors_["10066ui_story"]
			local var_416_5 = 0

			if var_416_5 < arg_413_1.time_ and arg_413_1.time_ <= var_416_5 + arg_416_0 and arg_413_1.var_.characterEffect10066ui_story == nil then
				arg_413_1.var_.characterEffect10066ui_story = var_416_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_6 = 0.200000002980232

			if var_416_5 <= arg_413_1.time_ and arg_413_1.time_ < var_416_5 + var_416_6 then
				local var_416_7 = (arg_413_1.time_ - var_416_5) / var_416_6

				if arg_413_1.var_.characterEffect10066ui_story then
					local var_416_8 = Mathf.Lerp(0, 0.5, var_416_7)

					arg_413_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_413_1.var_.characterEffect10066ui_story.fillRatio = var_416_8
				end
			end

			if arg_413_1.time_ >= var_416_5 + var_416_6 and arg_413_1.time_ < var_416_5 + var_416_6 + arg_416_0 and arg_413_1.var_.characterEffect10066ui_story then
				local var_416_9 = 0.5

				arg_413_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_413_1.var_.characterEffect10066ui_story.fillRatio = var_416_9
			end

			local var_416_10 = 0
			local var_416_11 = 0.275

			if var_416_10 < arg_413_1.time_ and arg_413_1.time_ <= var_416_10 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_12 = arg_413_1:FormatText(StoryNameCfg[74].name)

				arg_413_1.leftNameTxt_.text = var_416_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_13 = arg_413_1:GetWordFromCfg(318041101)
				local var_416_14 = arg_413_1:FormatText(var_416_13.content)

				arg_413_1.text_.text = var_416_14

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_15 = 11
				local var_416_16 = utf8.len(var_416_14)
				local var_416_17 = var_416_15 <= 0 and var_416_11 or var_416_11 * (var_416_16 / var_416_15)

				if var_416_17 > 0 and var_416_11 < var_416_17 then
					arg_413_1.talkMaxDuration = var_416_17

					if var_416_17 + var_416_10 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_17 + var_416_10
					end
				end

				arg_413_1.text_.text = var_416_14
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041101", "story_v_out_318041.awb") ~= 0 then
					local var_416_18 = manager.audio:GetVoiceLength("story_v_out_318041", "318041101", "story_v_out_318041.awb") / 1000

					if var_416_18 + var_416_10 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_18 + var_416_10
					end

					if var_416_13.prefab_name ~= "" and arg_413_1.actors_[var_416_13.prefab_name] ~= nil then
						local var_416_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_13.prefab_name].transform, "story_v_out_318041", "318041101", "story_v_out_318041.awb")

						arg_413_1:RecordAudio("318041101", var_416_19)
						arg_413_1:RecordAudio("318041101", var_416_19)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_318041", "318041101", "story_v_out_318041.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_318041", "318041101", "story_v_out_318041.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_20 = math.max(var_416_11, arg_413_1.talkMaxDuration)

			if var_416_10 <= arg_413_1.time_ and arg_413_1.time_ < var_416_10 + var_416_20 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_10) / var_416_20

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_10 + var_416_20 and arg_413_1.time_ < var_416_10 + var_416_20 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play318041102 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 318041102
		arg_417_1.duration_ = 9

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play318041103(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = 2

			if var_420_0 < arg_417_1.time_ and arg_417_1.time_ <= var_420_0 + arg_420_0 then
				local var_420_1 = manager.ui.mainCamera.transform.localPosition
				local var_420_2 = Vector3.New(0, 0, 10) + Vector3.New(var_420_1.x, var_420_1.y, 0)
				local var_420_3 = arg_417_1.bgs_.ST69

				var_420_3.transform.localPosition = var_420_2
				var_420_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_420_4 = var_420_3:GetComponent("SpriteRenderer")

				if var_420_4 and var_420_4.sprite then
					local var_420_5 = (var_420_3.transform.localPosition - var_420_1).z
					local var_420_6 = manager.ui.mainCameraCom_
					local var_420_7 = 2 * var_420_5 * Mathf.Tan(var_420_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_420_8 = var_420_7 * var_420_6.aspect
					local var_420_9 = var_420_4.sprite.bounds.size.x
					local var_420_10 = var_420_4.sprite.bounds.size.y
					local var_420_11 = var_420_8 / var_420_9
					local var_420_12 = var_420_7 / var_420_10
					local var_420_13 = var_420_12 < var_420_11 and var_420_11 or var_420_12

					var_420_3.transform.localScale = Vector3.New(var_420_13, var_420_13, 0)
				end

				for iter_420_0, iter_420_1 in pairs(arg_417_1.bgs_) do
					if iter_420_0 ~= "ST69" then
						iter_420_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_420_14 = 0

			if var_420_14 < arg_417_1.time_ and arg_417_1.time_ <= var_420_14 + arg_420_0 then
				arg_417_1.mask_.enabled = true
				arg_417_1.mask_.raycastTarget = true

				arg_417_1:SetGaussion(false)
			end

			local var_420_15 = 2

			if var_420_14 <= arg_417_1.time_ and arg_417_1.time_ < var_420_14 + var_420_15 then
				local var_420_16 = (arg_417_1.time_ - var_420_14) / var_420_15
				local var_420_17 = Color.New(0, 0, 0)

				var_420_17.a = Mathf.Lerp(0, 1, var_420_16)
				arg_417_1.mask_.color = var_420_17
			end

			if arg_417_1.time_ >= var_420_14 + var_420_15 and arg_417_1.time_ < var_420_14 + var_420_15 + arg_420_0 then
				local var_420_18 = Color.New(0, 0, 0)

				var_420_18.a = 1
				arg_417_1.mask_.color = var_420_18
			end

			local var_420_19 = 2

			if var_420_19 < arg_417_1.time_ and arg_417_1.time_ <= var_420_19 + arg_420_0 then
				arg_417_1.mask_.enabled = true
				arg_417_1.mask_.raycastTarget = true

				arg_417_1:SetGaussion(false)
			end

			local var_420_20 = 2

			if var_420_19 <= arg_417_1.time_ and arg_417_1.time_ < var_420_19 + var_420_20 then
				local var_420_21 = (arg_417_1.time_ - var_420_19) / var_420_20
				local var_420_22 = Color.New(0, 0, 0)

				var_420_22.a = Mathf.Lerp(1, 0, var_420_21)
				arg_417_1.mask_.color = var_420_22
			end

			if arg_417_1.time_ >= var_420_19 + var_420_20 and arg_417_1.time_ < var_420_19 + var_420_20 + arg_420_0 then
				local var_420_23 = Color.New(0, 0, 0)
				local var_420_24 = 0

				arg_417_1.mask_.enabled = false
				var_420_23.a = var_420_24
				arg_417_1.mask_.color = var_420_23
			end

			local var_420_25 = arg_417_1.actors_["1050ui_story"].transform
			local var_420_26 = 2

			if var_420_26 < arg_417_1.time_ and arg_417_1.time_ <= var_420_26 + arg_420_0 then
				arg_417_1.var_.moveOldPos1050ui_story = var_420_25.localPosition
			end

			local var_420_27 = 0.001

			if var_420_26 <= arg_417_1.time_ and arg_417_1.time_ < var_420_26 + var_420_27 then
				local var_420_28 = (arg_417_1.time_ - var_420_26) / var_420_27
				local var_420_29 = Vector3.New(0, 100, 0)

				var_420_25.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1050ui_story, var_420_29, var_420_28)

				local var_420_30 = manager.ui.mainCamera.transform.position - var_420_25.position

				var_420_25.forward = Vector3.New(var_420_30.x, var_420_30.y, var_420_30.z)

				local var_420_31 = var_420_25.localEulerAngles

				var_420_31.z = 0
				var_420_31.x = 0
				var_420_25.localEulerAngles = var_420_31
			end

			if arg_417_1.time_ >= var_420_26 + var_420_27 and arg_417_1.time_ < var_420_26 + var_420_27 + arg_420_0 then
				var_420_25.localPosition = Vector3.New(0, 100, 0)

				local var_420_32 = manager.ui.mainCamera.transform.position - var_420_25.position

				var_420_25.forward = Vector3.New(var_420_32.x, var_420_32.y, var_420_32.z)

				local var_420_33 = var_420_25.localEulerAngles

				var_420_33.z = 0
				var_420_33.x = 0
				var_420_25.localEulerAngles = var_420_33
			end

			local var_420_34 = arg_417_1.actors_["1050ui_story"]
			local var_420_35 = 2

			if var_420_35 < arg_417_1.time_ and arg_417_1.time_ <= var_420_35 + arg_420_0 and arg_417_1.var_.characterEffect1050ui_story == nil then
				arg_417_1.var_.characterEffect1050ui_story = var_420_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_36 = 0.200000002980232

			if var_420_35 <= arg_417_1.time_ and arg_417_1.time_ < var_420_35 + var_420_36 then
				local var_420_37 = (arg_417_1.time_ - var_420_35) / var_420_36

				if arg_417_1.var_.characterEffect1050ui_story then
					local var_420_38 = Mathf.Lerp(0, 0.5, var_420_37)

					arg_417_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1050ui_story.fillRatio = var_420_38
				end
			end

			if arg_417_1.time_ >= var_420_35 + var_420_36 and arg_417_1.time_ < var_420_35 + var_420_36 + arg_420_0 and arg_417_1.var_.characterEffect1050ui_story then
				local var_420_39 = 0.5

				arg_417_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1050ui_story.fillRatio = var_420_39
			end

			local var_420_40 = arg_417_1.actors_["10066ui_story"].transform
			local var_420_41 = 2

			if var_420_41 < arg_417_1.time_ and arg_417_1.time_ <= var_420_41 + arg_420_0 then
				arg_417_1.var_.moveOldPos10066ui_story = var_420_40.localPosition
			end

			local var_420_42 = 0.001

			if var_420_41 <= arg_417_1.time_ and arg_417_1.time_ < var_420_41 + var_420_42 then
				local var_420_43 = (arg_417_1.time_ - var_420_41) / var_420_42
				local var_420_44 = Vector3.New(0, 100, 0)

				var_420_40.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos10066ui_story, var_420_44, var_420_43)

				local var_420_45 = manager.ui.mainCamera.transform.position - var_420_40.position

				var_420_40.forward = Vector3.New(var_420_45.x, var_420_45.y, var_420_45.z)

				local var_420_46 = var_420_40.localEulerAngles

				var_420_46.z = 0
				var_420_46.x = 0
				var_420_40.localEulerAngles = var_420_46
			end

			if arg_417_1.time_ >= var_420_41 + var_420_42 and arg_417_1.time_ < var_420_41 + var_420_42 + arg_420_0 then
				var_420_40.localPosition = Vector3.New(0, 100, 0)

				local var_420_47 = manager.ui.mainCamera.transform.position - var_420_40.position

				var_420_40.forward = Vector3.New(var_420_47.x, var_420_47.y, var_420_47.z)

				local var_420_48 = var_420_40.localEulerAngles

				var_420_48.z = 0
				var_420_48.x = 0
				var_420_40.localEulerAngles = var_420_48
			end

			if arg_417_1.frameCnt_ <= 1 then
				arg_417_1.dialog_:SetActive(false)
			end

			local var_420_49 = 4
			local var_420_50 = 0.525

			if var_420_49 < arg_417_1.time_ and arg_417_1.time_ <= var_420_49 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0

				arg_417_1.dialog_:SetActive(true)

				local var_420_51 = LeanTween.value(arg_417_1.dialog_, 0, 1, 0.3)

				var_420_51:setOnUpdate(LuaHelper.FloatAction(function(arg_421_0)
					arg_417_1.dialogCg_.alpha = arg_421_0
				end))
				var_420_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_417_1.dialog_)
					var_420_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_417_1.duration_ = arg_417_1.duration_ + 0.3

				SetActive(arg_417_1.leftNameGo_, false)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_52 = arg_417_1:GetWordFromCfg(318041102)
				local var_420_53 = arg_417_1:FormatText(var_420_52.content)

				arg_417_1.text_.text = var_420_53

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_54 = 21
				local var_420_55 = utf8.len(var_420_53)
				local var_420_56 = var_420_54 <= 0 and var_420_50 or var_420_50 * (var_420_55 / var_420_54)

				if var_420_56 > 0 and var_420_50 < var_420_56 then
					arg_417_1.talkMaxDuration = var_420_56
					var_420_49 = var_420_49 + 0.3

					if var_420_56 + var_420_49 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_56 + var_420_49
					end
				end

				arg_417_1.text_.text = var_420_53
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)
				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_57 = var_420_49 + 0.3
			local var_420_58 = math.max(var_420_50, arg_417_1.talkMaxDuration)

			if var_420_57 <= arg_417_1.time_ and arg_417_1.time_ < var_420_57 + var_420_58 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_57) / var_420_58

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_57 + var_420_58 and arg_417_1.time_ < var_420_57 + var_420_58 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play318041103 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 318041103
		arg_423_1.duration_ = 5

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play318041104(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0
			local var_426_1 = 0.875

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

				local var_426_2 = arg_423_1:GetWordFromCfg(318041103)
				local var_426_3 = arg_423_1:FormatText(var_426_2.content)

				arg_423_1.text_.text = var_426_3

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_4 = 35
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
	Play318041104 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 318041104
		arg_427_1.duration_ = 9.2

		local var_427_0 = {
			zh = 7.4,
			ja = 9.2
		}
		local var_427_1 = manager.audio:GetLocalizationFlag()

		if var_427_0[var_427_1] ~= nil then
			arg_427_1.duration_ = var_427_0[var_427_1]
		end

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play318041105(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["1050ui_story"].transform
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 then
				arg_427_1.var_.moveOldPos1050ui_story = var_430_0.localPosition
			end

			local var_430_2 = 0.001

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2
				local var_430_4 = Vector3.New(0, -1, -6.1)

				var_430_0.localPosition = Vector3.Lerp(arg_427_1.var_.moveOldPos1050ui_story, var_430_4, var_430_3)

				local var_430_5 = manager.ui.mainCamera.transform.position - var_430_0.position

				var_430_0.forward = Vector3.New(var_430_5.x, var_430_5.y, var_430_5.z)

				local var_430_6 = var_430_0.localEulerAngles

				var_430_6.z = 0
				var_430_6.x = 0
				var_430_0.localEulerAngles = var_430_6
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 then
				var_430_0.localPosition = Vector3.New(0, -1, -6.1)

				local var_430_7 = manager.ui.mainCamera.transform.position - var_430_0.position

				var_430_0.forward = Vector3.New(var_430_7.x, var_430_7.y, var_430_7.z)

				local var_430_8 = var_430_0.localEulerAngles

				var_430_8.z = 0
				var_430_8.x = 0
				var_430_0.localEulerAngles = var_430_8
			end

			local var_430_9 = arg_427_1.actors_["1050ui_story"]
			local var_430_10 = 0

			if var_430_10 < arg_427_1.time_ and arg_427_1.time_ <= var_430_10 + arg_430_0 and arg_427_1.var_.characterEffect1050ui_story == nil then
				arg_427_1.var_.characterEffect1050ui_story = var_430_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_11 = 0.200000002980232

			if var_430_10 <= arg_427_1.time_ and arg_427_1.time_ < var_430_10 + var_430_11 then
				local var_430_12 = (arg_427_1.time_ - var_430_10) / var_430_11

				if arg_427_1.var_.characterEffect1050ui_story then
					arg_427_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_427_1.time_ >= var_430_10 + var_430_11 and arg_427_1.time_ < var_430_10 + var_430_11 + arg_430_0 and arg_427_1.var_.characterEffect1050ui_story then
				arg_427_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_430_13 = 0

			if var_430_13 < arg_427_1.time_ and arg_427_1.time_ <= var_430_13 + arg_430_0 then
				arg_427_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action4_1")
			end

			local var_430_14 = 0

			if var_430_14 < arg_427_1.time_ and arg_427_1.time_ <= var_430_14 + arg_430_0 then
				arg_427_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_430_15 = 0
			local var_430_16 = 0.45

			if var_430_15 < arg_427_1.time_ and arg_427_1.time_ <= var_430_15 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_17 = arg_427_1:FormatText(StoryNameCfg[74].name)

				arg_427_1.leftNameTxt_.text = var_430_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_18 = arg_427_1:GetWordFromCfg(318041104)
				local var_430_19 = arg_427_1:FormatText(var_430_18.content)

				arg_427_1.text_.text = var_430_19

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_20 = 18
				local var_430_21 = utf8.len(var_430_19)
				local var_430_22 = var_430_20 <= 0 and var_430_16 or var_430_16 * (var_430_21 / var_430_20)

				if var_430_22 > 0 and var_430_16 < var_430_22 then
					arg_427_1.talkMaxDuration = var_430_22

					if var_430_22 + var_430_15 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_22 + var_430_15
					end
				end

				arg_427_1.text_.text = var_430_19
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041104", "story_v_out_318041.awb") ~= 0 then
					local var_430_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041104", "story_v_out_318041.awb") / 1000

					if var_430_23 + var_430_15 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_23 + var_430_15
					end

					if var_430_18.prefab_name ~= "" and arg_427_1.actors_[var_430_18.prefab_name] ~= nil then
						local var_430_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_18.prefab_name].transform, "story_v_out_318041", "318041104", "story_v_out_318041.awb")

						arg_427_1:RecordAudio("318041104", var_430_24)
						arg_427_1:RecordAudio("318041104", var_430_24)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_318041", "318041104", "story_v_out_318041.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_318041", "318041104", "story_v_out_318041.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_25 = math.max(var_430_16, arg_427_1.talkMaxDuration)

			if var_430_15 <= arg_427_1.time_ and arg_427_1.time_ < var_430_15 + var_430_25 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_15) / var_430_25

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_15 + var_430_25 and arg_427_1.time_ < var_430_15 + var_430_25 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play318041105 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 318041105
		arg_431_1.duration_ = 5

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play318041106(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1050ui_story"].transform
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 then
				arg_431_1.var_.moveOldPos1050ui_story = var_434_0.localPosition
			end

			local var_434_2 = 0.001

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2
				local var_434_4 = Vector3.New(0, 100, 0)

				var_434_0.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos1050ui_story, var_434_4, var_434_3)

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

			local var_434_9 = arg_431_1.actors_["1050ui_story"]
			local var_434_10 = 0

			if var_434_10 < arg_431_1.time_ and arg_431_1.time_ <= var_434_10 + arg_434_0 and arg_431_1.var_.characterEffect1050ui_story == nil then
				arg_431_1.var_.characterEffect1050ui_story = var_434_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_11 = 0.200000002980232

			if var_434_10 <= arg_431_1.time_ and arg_431_1.time_ < var_434_10 + var_434_11 then
				local var_434_12 = (arg_431_1.time_ - var_434_10) / var_434_11

				if arg_431_1.var_.characterEffect1050ui_story then
					local var_434_13 = Mathf.Lerp(0, 0.5, var_434_12)

					arg_431_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_431_1.var_.characterEffect1050ui_story.fillRatio = var_434_13
				end
			end

			if arg_431_1.time_ >= var_434_10 + var_434_11 and arg_431_1.time_ < var_434_10 + var_434_11 + arg_434_0 and arg_431_1.var_.characterEffect1050ui_story then
				local var_434_14 = 0.5

				arg_431_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_431_1.var_.characterEffect1050ui_story.fillRatio = var_434_14
			end

			local var_434_15 = 0
			local var_434_16 = 1.025

			if var_434_15 < arg_431_1.time_ and arg_431_1.time_ <= var_434_15 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, false)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_17 = arg_431_1:GetWordFromCfg(318041105)
				local var_434_18 = arg_431_1:FormatText(var_434_17.content)

				arg_431_1.text_.text = var_434_18

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_19 = 41
				local var_434_20 = utf8.len(var_434_18)
				local var_434_21 = var_434_19 <= 0 and var_434_16 or var_434_16 * (var_434_20 / var_434_19)

				if var_434_21 > 0 and var_434_16 < var_434_21 then
					arg_431_1.talkMaxDuration = var_434_21

					if var_434_21 + var_434_15 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_21 + var_434_15
					end
				end

				arg_431_1.text_.text = var_434_18
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_22 = math.max(var_434_16, arg_431_1.talkMaxDuration)

			if var_434_15 <= arg_431_1.time_ and arg_431_1.time_ < var_434_15 + var_434_22 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_15) / var_434_22

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_15 + var_434_22 and arg_431_1.time_ < var_434_15 + var_434_22 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play318041106 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 318041106
		arg_435_1.duration_ = 3.399999999999

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play318041107(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = "STblack"

			if arg_435_1.bgs_[var_438_0] == nil then
				local var_438_1 = Object.Instantiate(arg_435_1.paintGo_)

				var_438_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_438_0)
				var_438_1.name = var_438_0
				var_438_1.transform.parent = arg_435_1.stage_.transform
				var_438_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_435_1.bgs_[var_438_0] = var_438_1
			end

			local var_438_2 = 0

			if var_438_2 < arg_435_1.time_ and arg_435_1.time_ <= var_438_2 + arg_438_0 then
				local var_438_3 = manager.ui.mainCamera.transform.localPosition
				local var_438_4 = Vector3.New(0, 0, 10) + Vector3.New(var_438_3.x, var_438_3.y, 0)
				local var_438_5 = arg_435_1.bgs_.STblack

				var_438_5.transform.localPosition = var_438_4
				var_438_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_438_6 = var_438_5:GetComponent("SpriteRenderer")

				if var_438_6 and var_438_6.sprite then
					local var_438_7 = (var_438_5.transform.localPosition - var_438_3).z
					local var_438_8 = manager.ui.mainCameraCom_
					local var_438_9 = 2 * var_438_7 * Mathf.Tan(var_438_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_438_10 = var_438_9 * var_438_8.aspect
					local var_438_11 = var_438_6.sprite.bounds.size.x
					local var_438_12 = var_438_6.sprite.bounds.size.y
					local var_438_13 = var_438_10 / var_438_11
					local var_438_14 = var_438_9 / var_438_12
					local var_438_15 = var_438_14 < var_438_13 and var_438_13 or var_438_14

					var_438_5.transform.localScale = Vector3.New(var_438_15, var_438_15, 0)
				end

				for iter_438_0, iter_438_1 in pairs(arg_435_1.bgs_) do
					if iter_438_0 ~= "STblack" then
						iter_438_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_438_16 = 0

			if var_438_16 < arg_435_1.time_ and arg_435_1.time_ <= var_438_16 + arg_438_0 then
				arg_435_1.mask_.enabled = true
				arg_435_1.mask_.raycastTarget = true

				arg_435_1:SetGaussion(false)
			end

			local var_438_17 = 1

			if var_438_16 <= arg_435_1.time_ and arg_435_1.time_ < var_438_16 + var_438_17 then
				local var_438_18 = (arg_435_1.time_ - var_438_16) / var_438_17
				local var_438_19 = Color.New(1, 1, 1)

				var_438_19.a = Mathf.Lerp(1, 0, var_438_18)
				arg_435_1.mask_.color = var_438_19
			end

			if arg_435_1.time_ >= var_438_16 + var_438_17 and arg_435_1.time_ < var_438_16 + var_438_17 + arg_438_0 then
				local var_438_20 = Color.New(1, 1, 1)
				local var_438_21 = 0

				arg_435_1.mask_.enabled = false
				var_438_20.a = var_438_21
				arg_435_1.mask_.color = var_438_20
			end

			if arg_435_1.frameCnt_ <= 1 then
				arg_435_1.dialog_:SetActive(false)
			end

			local var_438_22 = 1.20000000298023
			local var_438_23 = 0.075

			if var_438_22 < arg_435_1.time_ and arg_435_1.time_ <= var_438_22 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0

				arg_435_1.dialog_:SetActive(true)

				local var_438_24 = LeanTween.value(arg_435_1.dialog_, 0, 1, 0.3)

				var_438_24:setOnUpdate(LuaHelper.FloatAction(function(arg_439_0)
					arg_435_1.dialogCg_.alpha = arg_439_0
				end))
				var_438_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_435_1.dialog_)
					var_438_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_435_1.duration_ = arg_435_1.duration_ + 0.3

				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_25 = arg_435_1:FormatText(StoryNameCfg[74].name)

				arg_435_1.leftNameTxt_.text = var_438_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, true)
				arg_435_1.iconController_:SetSelectedState("hero")

				arg_435_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_26 = arg_435_1:GetWordFromCfg(318041106)
				local var_438_27 = arg_435_1:FormatText(var_438_26.content)

				arg_435_1.text_.text = var_438_27

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_28 = 3
				local var_438_29 = utf8.len(var_438_27)
				local var_438_30 = var_438_28 <= 0 and var_438_23 or var_438_23 * (var_438_29 / var_438_28)

				if var_438_30 > 0 and var_438_23 < var_438_30 then
					arg_435_1.talkMaxDuration = var_438_30
					var_438_22 = var_438_22 + 0.3

					if var_438_30 + var_438_22 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_30 + var_438_22
					end
				end

				arg_435_1.text_.text = var_438_27
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041106", "story_v_out_318041.awb") ~= 0 then
					local var_438_31 = manager.audio:GetVoiceLength("story_v_out_318041", "318041106", "story_v_out_318041.awb") / 1000

					if var_438_31 + var_438_22 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_31 + var_438_22
					end

					if var_438_26.prefab_name ~= "" and arg_435_1.actors_[var_438_26.prefab_name] ~= nil then
						local var_438_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_26.prefab_name].transform, "story_v_out_318041", "318041106", "story_v_out_318041.awb")

						arg_435_1:RecordAudio("318041106", var_438_32)
						arg_435_1:RecordAudio("318041106", var_438_32)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_318041", "318041106", "story_v_out_318041.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_318041", "318041106", "story_v_out_318041.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_33 = var_438_22 + 0.3
			local var_438_34 = math.max(var_438_23, arg_435_1.talkMaxDuration)

			if var_438_33 <= arg_435_1.time_ and arg_435_1.time_ < var_438_33 + var_438_34 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_33) / var_438_34

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_33 + var_438_34 and arg_435_1.time_ < var_438_33 + var_438_34 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play318041107 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 318041107
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play318041108(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["1050ui_story"]
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 and arg_441_1.var_.characterEffect1050ui_story == nil then
				arg_441_1.var_.characterEffect1050ui_story = var_444_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_2 = 0.200000002980232

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2

				if arg_441_1.var_.characterEffect1050ui_story then
					local var_444_4 = Mathf.Lerp(0, 0.5, var_444_3)

					arg_441_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_441_1.var_.characterEffect1050ui_story.fillRatio = var_444_4
				end
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 and arg_441_1.var_.characterEffect1050ui_story then
				local var_444_5 = 0.5

				arg_441_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_441_1.var_.characterEffect1050ui_story.fillRatio = var_444_5
			end

			local var_444_6 = 0
			local var_444_7 = 1

			if var_444_6 < arg_441_1.time_ and arg_441_1.time_ <= var_444_6 + arg_444_0 then
				local var_444_8 = "play"
				local var_444_9 = "effect"

				arg_441_1:AudioAction(var_444_8, var_444_9, "se_story_122_03", "se_story_122_03_swordlight", "")
			end

			local var_444_10 = 0
			local var_444_11 = 1.075

			if var_444_10 < arg_441_1.time_ and arg_441_1.time_ <= var_444_10 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, false)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_12 = arg_441_1:GetWordFromCfg(318041107)
				local var_444_13 = arg_441_1:FormatText(var_444_12.content)

				arg_441_1.text_.text = var_444_13

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_14 = 43
				local var_444_15 = utf8.len(var_444_13)
				local var_444_16 = var_444_14 <= 0 and var_444_11 or var_444_11 * (var_444_15 / var_444_14)

				if var_444_16 > 0 and var_444_11 < var_444_16 then
					arg_441_1.talkMaxDuration = var_444_16

					if var_444_16 + var_444_10 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_16 + var_444_10
					end
				end

				arg_441_1.text_.text = var_444_13
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)
				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_17 = math.max(var_444_11, arg_441_1.talkMaxDuration)

			if var_444_10 <= arg_441_1.time_ and arg_441_1.time_ < var_444_10 + var_444_17 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_10) / var_444_17

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_10 + var_444_17 and arg_441_1.time_ < var_444_10 + var_444_17 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play318041108 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 318041108
		arg_445_1.duration_ = 2.966

		local var_445_0 = {
			zh = 2.166,
			ja = 2.966
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
				arg_445_0:Play318041109(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = 0
			local var_448_1 = 0.433333333333333

			if var_448_0 < arg_445_1.time_ and arg_445_1.time_ <= var_448_0 + arg_448_0 then
				local var_448_2 = "play"
				local var_448_3 = "music"

				arg_445_1:AudioAction(var_448_2, var_448_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_448_4 = 0
			local var_448_5 = 0.125

			if var_448_4 < arg_445_1.time_ and arg_445_1.time_ <= var_448_4 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0

				arg_445_1.dialog_:SetActive(true)

				local var_448_6 = LeanTween.value(arg_445_1.dialog_, 0, 1, 0.3)

				var_448_6:setOnUpdate(LuaHelper.FloatAction(function(arg_449_0)
					arg_445_1.dialogCg_.alpha = arg_449_0
				end))
				var_448_6:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_445_1.dialog_)
					var_448_6:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_445_1.duration_ = arg_445_1.duration_ + 0.3

				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_7 = arg_445_1:FormatText(StoryNameCfg[640].name)

				arg_445_1.leftNameTxt_.text = var_448_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, true)
				arg_445_1.iconController_:SetSelectedState("hero")

				arg_445_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10066")

				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_8 = arg_445_1:GetWordFromCfg(318041108)
				local var_448_9 = arg_445_1:FormatText(var_448_8.content)

				arg_445_1.text_.text = var_448_9

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_10 = 5
				local var_448_11 = utf8.len(var_448_9)
				local var_448_12 = var_448_10 <= 0 and var_448_5 or var_448_5 * (var_448_11 / var_448_10)

				if var_448_12 > 0 and var_448_5 < var_448_12 then
					arg_445_1.talkMaxDuration = var_448_12
					var_448_4 = var_448_4 + 0.3

					if var_448_12 + var_448_4 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_12 + var_448_4
					end
				end

				arg_445_1.text_.text = var_448_9
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041108", "story_v_out_318041.awb") ~= 0 then
					local var_448_13 = manager.audio:GetVoiceLength("story_v_out_318041", "318041108", "story_v_out_318041.awb") / 1000

					if var_448_13 + var_448_4 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_13 + var_448_4
					end

					if var_448_8.prefab_name ~= "" and arg_445_1.actors_[var_448_8.prefab_name] ~= nil then
						local var_448_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_8.prefab_name].transform, "story_v_out_318041", "318041108", "story_v_out_318041.awb")

						arg_445_1:RecordAudio("318041108", var_448_14)
						arg_445_1:RecordAudio("318041108", var_448_14)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_318041", "318041108", "story_v_out_318041.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_318041", "318041108", "story_v_out_318041.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_15 = var_448_4 + 0.3
			local var_448_16 = math.max(var_448_5, arg_445_1.talkMaxDuration)

			if var_448_15 <= arg_445_1.time_ and arg_445_1.time_ < var_448_15 + var_448_16 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_15) / var_448_16

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_15 + var_448_16 and arg_445_1.time_ < var_448_15 + var_448_16 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play318041109 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 318041109
		arg_451_1.duration_ = 7

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play318041110(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = "LX0102"

			if arg_451_1.bgs_[var_454_0] == nil then
				local var_454_1 = Object.Instantiate(arg_451_1.paintGo_)

				var_454_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_454_0)
				var_454_1.name = var_454_0
				var_454_1.transform.parent = arg_451_1.stage_.transform
				var_454_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_451_1.bgs_[var_454_0] = var_454_1
			end

			local var_454_2 = 0

			if var_454_2 < arg_451_1.time_ and arg_451_1.time_ <= var_454_2 + arg_454_0 then
				local var_454_3 = manager.ui.mainCamera.transform.localPosition
				local var_454_4 = Vector3.New(0, 0, 10) + Vector3.New(var_454_3.x, var_454_3.y, 0)
				local var_454_5 = arg_451_1.bgs_.LX0102

				var_454_5.transform.localPosition = var_454_4
				var_454_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_454_6 = var_454_5:GetComponent("SpriteRenderer")

				if var_454_6 and var_454_6.sprite then
					local var_454_7 = (var_454_5.transform.localPosition - var_454_3).z
					local var_454_8 = manager.ui.mainCameraCom_
					local var_454_9 = 2 * var_454_7 * Mathf.Tan(var_454_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_454_10 = var_454_9 * var_454_8.aspect
					local var_454_11 = var_454_6.sprite.bounds.size.x
					local var_454_12 = var_454_6.sprite.bounds.size.y
					local var_454_13 = var_454_10 / var_454_11
					local var_454_14 = var_454_9 / var_454_12
					local var_454_15 = var_454_14 < var_454_13 and var_454_13 or var_454_14

					var_454_5.transform.localScale = Vector3.New(var_454_15, var_454_15, 0)
				end

				for iter_454_0, iter_454_1 in pairs(arg_451_1.bgs_) do
					if iter_454_0 ~= "LX0102" then
						iter_454_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_454_16 = 0

			if var_454_16 < arg_451_1.time_ and arg_451_1.time_ <= var_454_16 + arg_454_0 then
				arg_451_1.mask_.enabled = true
				arg_451_1.mask_.raycastTarget = true

				arg_451_1:SetGaussion(false)
			end

			local var_454_17 = 2

			if var_454_16 <= arg_451_1.time_ and arg_451_1.time_ < var_454_16 + var_454_17 then
				local var_454_18 = (arg_451_1.time_ - var_454_16) / var_454_17
				local var_454_19 = Color.New(1, 1, 1)

				var_454_19.a = Mathf.Lerp(1, 0, var_454_18)
				arg_451_1.mask_.color = var_454_19
			end

			if arg_451_1.time_ >= var_454_16 + var_454_17 and arg_451_1.time_ < var_454_16 + var_454_17 + arg_454_0 then
				local var_454_20 = Color.New(1, 1, 1)
				local var_454_21 = 0

				arg_451_1.mask_.enabled = false
				var_454_20.a = var_454_21
				arg_451_1.mask_.color = var_454_20
			end

			local var_454_22 = 0
			local var_454_23 = 0.433333333333333

			if var_454_22 < arg_451_1.time_ and arg_451_1.time_ <= var_454_22 + arg_454_0 then
				local var_454_24 = "play"
				local var_454_25 = "effect"

				arg_451_1:AudioAction(var_454_24, var_454_25, "se_story_120_00", "se_story_120_00_lingguang03", "")
			end

			local var_454_26 = arg_451_1.actors_["1050ui_story"].transform
			local var_454_27 = 2

			if var_454_27 < arg_451_1.time_ and arg_451_1.time_ <= var_454_27 + arg_454_0 then
				arg_451_1.var_.moveOldPos1050ui_story = var_454_26.localPosition
			end

			local var_454_28 = 0.001

			if var_454_27 <= arg_451_1.time_ and arg_451_1.time_ < var_454_27 + var_454_28 then
				local var_454_29 = (arg_451_1.time_ - var_454_27) / var_454_28
				local var_454_30 = Vector3.New(0, 100, 0)

				var_454_26.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos1050ui_story, var_454_30, var_454_29)

				local var_454_31 = manager.ui.mainCamera.transform.position - var_454_26.position

				var_454_26.forward = Vector3.New(var_454_31.x, var_454_31.y, var_454_31.z)

				local var_454_32 = var_454_26.localEulerAngles

				var_454_32.z = 0
				var_454_32.x = 0
				var_454_26.localEulerAngles = var_454_32
			end

			if arg_451_1.time_ >= var_454_27 + var_454_28 and arg_451_1.time_ < var_454_27 + var_454_28 + arg_454_0 then
				var_454_26.localPosition = Vector3.New(0, 100, 0)

				local var_454_33 = manager.ui.mainCamera.transform.position - var_454_26.position

				var_454_26.forward = Vector3.New(var_454_33.x, var_454_33.y, var_454_33.z)

				local var_454_34 = var_454_26.localEulerAngles

				var_454_34.z = 0
				var_454_34.x = 0
				var_454_26.localEulerAngles = var_454_34
			end

			local var_454_35 = arg_451_1.bgs_.LX0102.transform
			local var_454_36 = 0

			if var_454_36 < arg_451_1.time_ and arg_451_1.time_ <= var_454_36 + arg_454_0 then
				arg_451_1.var_.moveOldPosLX0102 = var_454_35.localPosition
			end

			local var_454_37 = 0.001

			if var_454_36 <= arg_451_1.time_ and arg_451_1.time_ < var_454_36 + var_454_37 then
				local var_454_38 = (arg_451_1.time_ - var_454_36) / var_454_37
				local var_454_39 = Vector3.New(0, 1, 6)

				var_454_35.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPosLX0102, var_454_39, var_454_38)
			end

			if arg_451_1.time_ >= var_454_36 + var_454_37 and arg_451_1.time_ < var_454_36 + var_454_37 + arg_454_0 then
				var_454_35.localPosition = Vector3.New(0, 1, 6)
			end

			local var_454_40 = arg_451_1.bgs_.LX0102.transform
			local var_454_41 = 0.0166666666666667

			if var_454_41 < arg_451_1.time_ and arg_451_1.time_ <= var_454_41 + arg_454_0 then
				arg_451_1.var_.moveOldPosLX0102 = var_454_40.localPosition
			end

			local var_454_42 = 6.5

			if var_454_41 <= arg_451_1.time_ and arg_451_1.time_ < var_454_41 + var_454_42 then
				local var_454_43 = (arg_451_1.time_ - var_454_41) / var_454_42
				local var_454_44 = Vector3.New(0, 1, 9.5)

				var_454_40.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPosLX0102, var_454_44, var_454_43)
			end

			if arg_451_1.time_ >= var_454_41 + var_454_42 and arg_451_1.time_ < var_454_41 + var_454_42 + arg_454_0 then
				var_454_40.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_454_45 = 2.03400000184774

			if var_454_45 < arg_451_1.time_ and arg_451_1.time_ <= var_454_45 + arg_454_0 then
				arg_451_1.allBtn_.enabled = false
			end

			local var_454_46 = 4.48266666481892

			if arg_451_1.time_ >= var_454_45 + var_454_46 and arg_451_1.time_ < var_454_45 + var_454_46 + arg_454_0 then
				arg_451_1.allBtn_.enabled = true
			end

			local var_454_47 = 0
			local var_454_48 = 0.433333333333333

			if var_454_47 < arg_451_1.time_ and arg_451_1.time_ <= var_454_47 + arg_454_0 then
				local var_454_49 = "play"
				local var_454_50 = "effect"

				arg_451_1:AudioAction(var_454_49, var_454_50, "se_story_1210", "se_story_1210_loop_wind", "")
			end

			if arg_451_1.frameCnt_ <= 1 then
				arg_451_1.dialog_:SetActive(false)
			end

			local var_454_51 = 2
			local var_454_52 = 0.25

			if var_454_51 < arg_451_1.time_ and arg_451_1.time_ <= var_454_51 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0

				arg_451_1.dialog_:SetActive(true)

				local var_454_53 = LeanTween.value(arg_451_1.dialog_, 0, 1, 0.3)

				var_454_53:setOnUpdate(LuaHelper.FloatAction(function(arg_455_0)
					arg_451_1.dialogCg_.alpha = arg_455_0
				end))
				var_454_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_451_1.dialog_)
					var_454_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_451_1.duration_ = arg_451_1.duration_ + 0.3

				SetActive(arg_451_1.leftNameGo_, false)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_54 = arg_451_1:GetWordFromCfg(318041109)
				local var_454_55 = arg_451_1:FormatText(var_454_54.content)

				arg_451_1.text_.text = var_454_55

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_56 = 10
				local var_454_57 = utf8.len(var_454_55)
				local var_454_58 = var_454_56 <= 0 and var_454_52 or var_454_52 * (var_454_57 / var_454_56)

				if var_454_58 > 0 and var_454_52 < var_454_58 then
					arg_451_1.talkMaxDuration = var_454_58
					var_454_51 = var_454_51 + 0.3

					if var_454_58 + var_454_51 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_58 + var_454_51
					end
				end

				arg_451_1.text_.text = var_454_55
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_59 = var_454_51 + 0.3
			local var_454_60 = math.max(var_454_52, arg_451_1.talkMaxDuration)

			if var_454_59 <= arg_451_1.time_ and arg_451_1.time_ < var_454_59 + var_454_60 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_59) / var_454_60

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_59 + var_454_60 and arg_451_1.time_ < var_454_59 + var_454_60 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play318041110 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 318041110
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play318041111(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = 0
			local var_460_1 = 1.025

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

				local var_460_2 = arg_457_1:GetWordFromCfg(318041110)
				local var_460_3 = arg_457_1:FormatText(var_460_2.content)

				arg_457_1.text_.text = var_460_3

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_4 = 41
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
	Play318041111 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 318041111
		arg_461_1.duration_ = 3.133

		local var_461_0 = {
			zh = 1.266,
			ja = 3.133
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
				arg_461_0:Play318041112(arg_461_1)
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

				local var_464_2 = arg_461_1:FormatText(StoryNameCfg[36].name)

				arg_461_1.leftNameTxt_.text = var_464_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_3 = arg_461_1:GetWordFromCfg(318041111)
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041111", "story_v_out_318041.awb") ~= 0 then
					local var_464_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041111", "story_v_out_318041.awb") / 1000

					if var_464_8 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_8 + var_464_0
					end

					if var_464_3.prefab_name ~= "" and arg_461_1.actors_[var_464_3.prefab_name] ~= nil then
						local var_464_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_3.prefab_name].transform, "story_v_out_318041", "318041111", "story_v_out_318041.awb")

						arg_461_1:RecordAudio("318041111", var_464_9)
						arg_461_1:RecordAudio("318041111", var_464_9)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_318041", "318041111", "story_v_out_318041.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_318041", "318041111", "story_v_out_318041.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_10 = math.max(var_464_1, arg_461_1.talkMaxDuration)

			if var_464_0 <= arg_461_1.time_ and arg_461_1.time_ < var_464_0 + var_464_10 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_0) / var_464_10

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_0 + var_464_10 and arg_461_1.time_ < var_464_0 + var_464_10 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play318041112 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 318041112
		arg_465_1.duration_ = 9.933

		local var_465_0 = {
			zh = 5.333,
			ja = 9.933
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
				arg_465_0:Play318041113(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = 0
			local var_468_1 = 0.6

			if var_468_0 < arg_465_1.time_ and arg_465_1.time_ <= var_468_0 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_2 = arg_465_1:FormatText(StoryNameCfg[650].name)

				arg_465_1.leftNameTxt_.text = var_468_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_3 = arg_465_1:GetWordFromCfg(318041112)
				local var_468_4 = arg_465_1:FormatText(var_468_3.content)

				arg_465_1.text_.text = var_468_4

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_5 = 24
				local var_468_6 = utf8.len(var_468_4)
				local var_468_7 = var_468_5 <= 0 and var_468_1 or var_468_1 * (var_468_6 / var_468_5)

				if var_468_7 > 0 and var_468_1 < var_468_7 then
					arg_465_1.talkMaxDuration = var_468_7

					if var_468_7 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_7 + var_468_0
					end
				end

				arg_465_1.text_.text = var_468_4
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041112", "story_v_out_318041.awb") ~= 0 then
					local var_468_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041112", "story_v_out_318041.awb") / 1000

					if var_468_8 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_8 + var_468_0
					end

					if var_468_3.prefab_name ~= "" and arg_465_1.actors_[var_468_3.prefab_name] ~= nil then
						local var_468_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_3.prefab_name].transform, "story_v_out_318041", "318041112", "story_v_out_318041.awb")

						arg_465_1:RecordAudio("318041112", var_468_9)
						arg_465_1:RecordAudio("318041112", var_468_9)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_318041", "318041112", "story_v_out_318041.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_318041", "318041112", "story_v_out_318041.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_10 = math.max(var_468_1, arg_465_1.talkMaxDuration)

			if var_468_0 <= arg_465_1.time_ and arg_465_1.time_ < var_468_0 + var_468_10 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_0) / var_468_10

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_0 + var_468_10 and arg_465_1.time_ < var_468_0 + var_468_10 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play318041113 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 318041113
		arg_469_1.duration_ = 8.2

		local var_469_0 = {
			zh = 5,
			ja = 8.2
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
				arg_469_0:Play318041114(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = 0
			local var_472_1 = 0.65

			if var_472_0 < arg_469_1.time_ and arg_469_1.time_ <= var_472_0 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_2 = arg_469_1:FormatText(StoryNameCfg[36].name)

				arg_469_1.leftNameTxt_.text = var_472_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_3 = arg_469_1:GetWordFromCfg(318041113)
				local var_472_4 = arg_469_1:FormatText(var_472_3.content)

				arg_469_1.text_.text = var_472_4

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041113", "story_v_out_318041.awb") ~= 0 then
					local var_472_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041113", "story_v_out_318041.awb") / 1000

					if var_472_8 + var_472_0 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_8 + var_472_0
					end

					if var_472_3.prefab_name ~= "" and arg_469_1.actors_[var_472_3.prefab_name] ~= nil then
						local var_472_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_3.prefab_name].transform, "story_v_out_318041", "318041113", "story_v_out_318041.awb")

						arg_469_1:RecordAudio("318041113", var_472_9)
						arg_469_1:RecordAudio("318041113", var_472_9)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_out_318041", "318041113", "story_v_out_318041.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_out_318041", "318041113", "story_v_out_318041.awb")
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
	Play318041114 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 318041114
		arg_473_1.duration_ = 7.9

		local var_473_0 = {
			zh = 7.9,
			ja = 6.333
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
				arg_473_0:Play318041115(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = 0
			local var_476_1 = 0.75

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_2 = arg_473_1:FormatText(StoryNameCfg[650].name)

				arg_473_1.leftNameTxt_.text = var_476_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_3 = arg_473_1:GetWordFromCfg(318041114)
				local var_476_4 = arg_473_1:FormatText(var_476_3.content)

				arg_473_1.text_.text = var_476_4

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_5 = 30
				local var_476_6 = utf8.len(var_476_4)
				local var_476_7 = var_476_5 <= 0 and var_476_1 or var_476_1 * (var_476_6 / var_476_5)

				if var_476_7 > 0 and var_476_1 < var_476_7 then
					arg_473_1.talkMaxDuration = var_476_7

					if var_476_7 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_7 + var_476_0
					end
				end

				arg_473_1.text_.text = var_476_4
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041114", "story_v_out_318041.awb") ~= 0 then
					local var_476_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041114", "story_v_out_318041.awb") / 1000

					if var_476_8 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_8 + var_476_0
					end

					if var_476_3.prefab_name ~= "" and arg_473_1.actors_[var_476_3.prefab_name] ~= nil then
						local var_476_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_3.prefab_name].transform, "story_v_out_318041", "318041114", "story_v_out_318041.awb")

						arg_473_1:RecordAudio("318041114", var_476_9)
						arg_473_1:RecordAudio("318041114", var_476_9)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_318041", "318041114", "story_v_out_318041.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_318041", "318041114", "story_v_out_318041.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_10 = math.max(var_476_1, arg_473_1.talkMaxDuration)

			if var_476_0 <= arg_473_1.time_ and arg_473_1.time_ < var_476_0 + var_476_10 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_0) / var_476_10

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_0 + var_476_10 and arg_473_1.time_ < var_476_0 + var_476_10 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play318041115 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 318041115
		arg_477_1.duration_ = 3.933

		local var_477_0 = {
			zh = 2.933,
			ja = 3.933
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
				arg_477_0:Play318041116(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0
			local var_480_1 = 0.25

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_2 = arg_477_1:FormatText(StoryNameCfg[650].name)

				arg_477_1.leftNameTxt_.text = var_480_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_3 = arg_477_1:GetWordFromCfg(318041115)
				local var_480_4 = arg_477_1:FormatText(var_480_3.content)

				arg_477_1.text_.text = var_480_4

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_5 = 10
				local var_480_6 = utf8.len(var_480_4)
				local var_480_7 = var_480_5 <= 0 and var_480_1 or var_480_1 * (var_480_6 / var_480_5)

				if var_480_7 > 0 and var_480_1 < var_480_7 then
					arg_477_1.talkMaxDuration = var_480_7

					if var_480_7 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_7 + var_480_0
					end
				end

				arg_477_1.text_.text = var_480_4
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041115", "story_v_out_318041.awb") ~= 0 then
					local var_480_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041115", "story_v_out_318041.awb") / 1000

					if var_480_8 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_8 + var_480_0
					end

					if var_480_3.prefab_name ~= "" and arg_477_1.actors_[var_480_3.prefab_name] ~= nil then
						local var_480_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_3.prefab_name].transform, "story_v_out_318041", "318041115", "story_v_out_318041.awb")

						arg_477_1:RecordAudio("318041115", var_480_9)
						arg_477_1:RecordAudio("318041115", var_480_9)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_318041", "318041115", "story_v_out_318041.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_318041", "318041115", "story_v_out_318041.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_10 = math.max(var_480_1, arg_477_1.talkMaxDuration)

			if var_480_0 <= arg_477_1.time_ and arg_477_1.time_ < var_480_0 + var_480_10 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_0) / var_480_10

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_0 + var_480_10 and arg_477_1.time_ < var_480_0 + var_480_10 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play318041116 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 318041116
		arg_481_1.duration_ = 5

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play318041117(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.bgs_.LX0102.transform
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 then
				arg_481_1.var_.moveOldPosLX0102 = var_484_0.localPosition
			end

			local var_484_2 = 0.001

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2
				local var_484_4 = Vector3.New(0, 1, 9)

				var_484_0.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPosLX0102, var_484_4, var_484_3)
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 then
				var_484_0.localPosition = Vector3.New(0, 1, 9)
			end

			local var_484_5 = arg_481_1.bgs_.LX0102.transform
			local var_484_6 = 0.0166666666666667

			if var_484_6 < arg_481_1.time_ and arg_481_1.time_ <= var_484_6 + arg_484_0 then
				arg_481_1.var_.moveOldPosLX0102 = var_484_5.localPosition
			end

			local var_484_7 = 3.5

			if var_484_6 <= arg_481_1.time_ and arg_481_1.time_ < var_484_6 + var_484_7 then
				local var_484_8 = (arg_481_1.time_ - var_484_6) / var_484_7
				local var_484_9 = Vector3.New(0, 1, 10)

				var_484_5.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPosLX0102, var_484_9, var_484_8)
			end

			if arg_481_1.time_ >= var_484_6 + var_484_7 and arg_481_1.time_ < var_484_6 + var_484_7 + arg_484_0 then
				var_484_5.localPosition = Vector3.New(0, 1, 10)
			end

			local var_484_10 = 0.433333333333333

			if var_484_10 < arg_481_1.time_ and arg_481_1.time_ <= var_484_10 + arg_484_0 then
				arg_481_1.allBtn_.enabled = false
			end

			local var_484_11 = 3.08333333333333

			if arg_481_1.time_ >= var_484_10 + var_484_11 and arg_481_1.time_ < var_484_10 + var_484_11 + arg_484_0 then
				arg_481_1.allBtn_.enabled = true
			end

			local var_484_12 = 0
			local var_484_13 = 1.025

			if var_484_12 < arg_481_1.time_ and arg_481_1.time_ <= var_484_12 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, false)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_14 = arg_481_1:GetWordFromCfg(318041116)
				local var_484_15 = arg_481_1:FormatText(var_484_14.content)

				arg_481_1.text_.text = var_484_15

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_16 = 41
				local var_484_17 = utf8.len(var_484_15)
				local var_484_18 = var_484_16 <= 0 and var_484_13 or var_484_13 * (var_484_17 / var_484_16)

				if var_484_18 > 0 and var_484_13 < var_484_18 then
					arg_481_1.talkMaxDuration = var_484_18

					if var_484_18 + var_484_12 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_18 + var_484_12
					end
				end

				arg_481_1.text_.text = var_484_15
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)
				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_19 = math.max(var_484_13, arg_481_1.talkMaxDuration)

			if var_484_12 <= arg_481_1.time_ and arg_481_1.time_ < var_484_12 + var_484_19 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_12) / var_484_19

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_12 + var_484_19 and arg_481_1.time_ < var_484_12 + var_484_19 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play318041117 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 318041117
		arg_485_1.duration_ = 5

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play318041118(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0
			local var_488_1 = 1.2

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, false)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_2 = arg_485_1:GetWordFromCfg(318041117)
				local var_488_3 = arg_485_1:FormatText(var_488_2.content)

				arg_485_1.text_.text = var_488_3

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_4 = 48
				local var_488_5 = utf8.len(var_488_3)
				local var_488_6 = var_488_4 <= 0 and var_488_1 or var_488_1 * (var_488_5 / var_488_4)

				if var_488_6 > 0 and var_488_1 < var_488_6 then
					arg_485_1.talkMaxDuration = var_488_6

					if var_488_6 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_6 + var_488_0
					end
				end

				arg_485_1.text_.text = var_488_3
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)
				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_7 = math.max(var_488_1, arg_485_1.talkMaxDuration)

			if var_488_0 <= arg_485_1.time_ and arg_485_1.time_ < var_488_0 + var_488_7 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_0) / var_488_7

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_0 + var_488_7 and arg_485_1.time_ < var_488_0 + var_488_7 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play318041118 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 318041118
		arg_489_1.duration_ = 5

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play318041119(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = 0
			local var_492_1 = 1.25

			if var_492_0 < arg_489_1.time_ and arg_489_1.time_ <= var_492_0 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, false)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_2 = arg_489_1:GetWordFromCfg(318041118)
				local var_492_3 = arg_489_1:FormatText(var_492_2.content)

				arg_489_1.text_.text = var_492_3

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_4 = 50
				local var_492_5 = utf8.len(var_492_3)
				local var_492_6 = var_492_4 <= 0 and var_492_1 or var_492_1 * (var_492_5 / var_492_4)

				if var_492_6 > 0 and var_492_1 < var_492_6 then
					arg_489_1.talkMaxDuration = var_492_6

					if var_492_6 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_6 + var_492_0
					end
				end

				arg_489_1.text_.text = var_492_3
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)
				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_7 = math.max(var_492_1, arg_489_1.talkMaxDuration)

			if var_492_0 <= arg_489_1.time_ and arg_489_1.time_ < var_492_0 + var_492_7 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_0) / var_492_7

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_0 + var_492_7 and arg_489_1.time_ < var_492_0 + var_492_7 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play318041119 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 318041119
		arg_493_1.duration_ = 8.866

		local var_493_0 = {
			zh = 4.333,
			ja = 8.866
		}
		local var_493_1 = manager.audio:GetLocalizationFlag()

		if var_493_0[var_493_1] ~= nil then
			arg_493_1.duration_ = var_493_0[var_493_1]
		end

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play318041120(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = 0
			local var_496_1 = 0.45

			if var_496_0 < arg_493_1.time_ and arg_493_1.time_ <= var_496_0 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_2 = arg_493_1:FormatText(StoryNameCfg[650].name)

				arg_493_1.leftNameTxt_.text = var_496_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_3 = arg_493_1:GetWordFromCfg(318041119)
				local var_496_4 = arg_493_1:FormatText(var_496_3.content)

				arg_493_1.text_.text = var_496_4

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_5 = 18
				local var_496_6 = utf8.len(var_496_4)
				local var_496_7 = var_496_5 <= 0 and var_496_1 or var_496_1 * (var_496_6 / var_496_5)

				if var_496_7 > 0 and var_496_1 < var_496_7 then
					arg_493_1.talkMaxDuration = var_496_7

					if var_496_7 + var_496_0 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_7 + var_496_0
					end
				end

				arg_493_1.text_.text = var_496_4
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041119", "story_v_out_318041.awb") ~= 0 then
					local var_496_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041119", "story_v_out_318041.awb") / 1000

					if var_496_8 + var_496_0 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_8 + var_496_0
					end

					if var_496_3.prefab_name ~= "" and arg_493_1.actors_[var_496_3.prefab_name] ~= nil then
						local var_496_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_493_1.actors_[var_496_3.prefab_name].transform, "story_v_out_318041", "318041119", "story_v_out_318041.awb")

						arg_493_1:RecordAudio("318041119", var_496_9)
						arg_493_1:RecordAudio("318041119", var_496_9)
					else
						arg_493_1:AudioAction("play", "voice", "story_v_out_318041", "318041119", "story_v_out_318041.awb")
					end

					arg_493_1:RecordHistoryTalkVoice("story_v_out_318041", "318041119", "story_v_out_318041.awb")
				end

				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_10 = math.max(var_496_1, arg_493_1.talkMaxDuration)

			if var_496_0 <= arg_493_1.time_ and arg_493_1.time_ < var_496_0 + var_496_10 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_0) / var_496_10

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_0 + var_496_10 and arg_493_1.time_ < var_496_0 + var_496_10 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play318041120 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 318041120
		arg_497_1.duration_ = 5

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play318041121(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = 0
			local var_500_1 = 1.225

			if var_500_0 < arg_497_1.time_ and arg_497_1.time_ <= var_500_0 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, false)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_2 = arg_497_1:GetWordFromCfg(318041120)
				local var_500_3 = arg_497_1:FormatText(var_500_2.content)

				arg_497_1.text_.text = var_500_3

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_4 = 49
				local var_500_5 = utf8.len(var_500_3)
				local var_500_6 = var_500_4 <= 0 and var_500_1 or var_500_1 * (var_500_5 / var_500_4)

				if var_500_6 > 0 and var_500_1 < var_500_6 then
					arg_497_1.talkMaxDuration = var_500_6

					if var_500_6 + var_500_0 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_6 + var_500_0
					end
				end

				arg_497_1.text_.text = var_500_3
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)
				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_7 = math.max(var_500_1, arg_497_1.talkMaxDuration)

			if var_500_0 <= arg_497_1.time_ and arg_497_1.time_ < var_500_0 + var_500_7 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_0) / var_500_7

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_0 + var_500_7 and arg_497_1.time_ < var_500_0 + var_500_7 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play318041121 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 318041121
		arg_501_1.duration_ = 3.7

		local var_501_0 = {
			zh = 1.633,
			ja = 3.7
		}
		local var_501_1 = manager.audio:GetLocalizationFlag()

		if var_501_0[var_501_1] ~= nil then
			arg_501_1.duration_ = var_501_0[var_501_1]
		end

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play318041122(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = 0
			local var_504_1 = 0.175

			if var_504_0 < arg_501_1.time_ and arg_501_1.time_ <= var_504_0 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_2 = arg_501_1:FormatText(StoryNameCfg[650].name)

				arg_501_1.leftNameTxt_.text = var_504_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_3 = arg_501_1:GetWordFromCfg(318041121)
				local var_504_4 = arg_501_1:FormatText(var_504_3.content)

				arg_501_1.text_.text = var_504_4

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_5 = 7
				local var_504_6 = utf8.len(var_504_4)
				local var_504_7 = var_504_5 <= 0 and var_504_1 or var_504_1 * (var_504_6 / var_504_5)

				if var_504_7 > 0 and var_504_1 < var_504_7 then
					arg_501_1.talkMaxDuration = var_504_7

					if var_504_7 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_7 + var_504_0
					end
				end

				arg_501_1.text_.text = var_504_4
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041121", "story_v_out_318041.awb") ~= 0 then
					local var_504_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041121", "story_v_out_318041.awb") / 1000

					if var_504_8 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_8 + var_504_0
					end

					if var_504_3.prefab_name ~= "" and arg_501_1.actors_[var_504_3.prefab_name] ~= nil then
						local var_504_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_3.prefab_name].transform, "story_v_out_318041", "318041121", "story_v_out_318041.awb")

						arg_501_1:RecordAudio("318041121", var_504_9)
						arg_501_1:RecordAudio("318041121", var_504_9)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_318041", "318041121", "story_v_out_318041.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_318041", "318041121", "story_v_out_318041.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_10 = math.max(var_504_1, arg_501_1.talkMaxDuration)

			if var_504_0 <= arg_501_1.time_ and arg_501_1.time_ < var_504_0 + var_504_10 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_0) / var_504_10

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_0 + var_504_10 and arg_501_1.time_ < var_504_0 + var_504_10 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play318041122 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 318041122
		arg_505_1.duration_ = 5

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play318041123(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = 0
			local var_508_1 = 0.975

			if var_508_0 < arg_505_1.time_ and arg_505_1.time_ <= var_508_0 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, false)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_2 = arg_505_1:GetWordFromCfg(318041122)
				local var_508_3 = arg_505_1:FormatText(var_508_2.content)

				arg_505_1.text_.text = var_508_3

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_4 = 39
				local var_508_5 = utf8.len(var_508_3)
				local var_508_6 = var_508_4 <= 0 and var_508_1 or var_508_1 * (var_508_5 / var_508_4)

				if var_508_6 > 0 and var_508_1 < var_508_6 then
					arg_505_1.talkMaxDuration = var_508_6

					if var_508_6 + var_508_0 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_6 + var_508_0
					end
				end

				arg_505_1.text_.text = var_508_3
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)
				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_7 = math.max(var_508_1, arg_505_1.talkMaxDuration)

			if var_508_0 <= arg_505_1.time_ and arg_505_1.time_ < var_508_0 + var_508_7 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_0) / var_508_7

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_0 + var_508_7 and arg_505_1.time_ < var_508_0 + var_508_7 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play318041123 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 318041123
		arg_509_1.duration_ = 5

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play318041124(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = 0
			local var_512_1 = 0.675

			if var_512_0 < arg_509_1.time_ and arg_509_1.time_ <= var_512_0 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, false)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_2 = arg_509_1:GetWordFromCfg(318041123)
				local var_512_3 = arg_509_1:FormatText(var_512_2.content)

				arg_509_1.text_.text = var_512_3

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_4 = 27
				local var_512_5 = utf8.len(var_512_3)
				local var_512_6 = var_512_4 <= 0 and var_512_1 or var_512_1 * (var_512_5 / var_512_4)

				if var_512_6 > 0 and var_512_1 < var_512_6 then
					arg_509_1.talkMaxDuration = var_512_6

					if var_512_6 + var_512_0 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_6 + var_512_0
					end
				end

				arg_509_1.text_.text = var_512_3
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)
				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_7 = math.max(var_512_1, arg_509_1.talkMaxDuration)

			if var_512_0 <= arg_509_1.time_ and arg_509_1.time_ < var_512_0 + var_512_7 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_0) / var_512_7

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_0 + var_512_7 and arg_509_1.time_ < var_512_0 + var_512_7 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play318041124 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 318041124
		arg_513_1.duration_ = 5

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play318041125(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = 0
			local var_516_1 = 0.475

			if var_516_0 < arg_513_1.time_ and arg_513_1.time_ <= var_516_0 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, false)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_2 = arg_513_1:GetWordFromCfg(318041124)
				local var_516_3 = arg_513_1:FormatText(var_516_2.content)

				arg_513_1.text_.text = var_516_3

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_4 = 19
				local var_516_5 = utf8.len(var_516_3)
				local var_516_6 = var_516_4 <= 0 and var_516_1 or var_516_1 * (var_516_5 / var_516_4)

				if var_516_6 > 0 and var_516_1 < var_516_6 then
					arg_513_1.talkMaxDuration = var_516_6

					if var_516_6 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_6 + var_516_0
					end
				end

				arg_513_1.text_.text = var_516_3
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)
				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_7 = math.max(var_516_1, arg_513_1.talkMaxDuration)

			if var_516_0 <= arg_513_1.time_ and arg_513_1.time_ < var_516_0 + var_516_7 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_0) / var_516_7

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_0 + var_516_7 and arg_513_1.time_ < var_516_0 + var_516_7 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play318041125 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 318041125
		arg_517_1.duration_ = 3.366666666666

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play318041126(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = "LX0102_blur"

			if arg_517_1.bgs_[var_520_0] == nil then
				local var_520_1 = Object.Instantiate(arg_517_1.paintGo_)

				var_520_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_520_0)
				var_520_1.name = var_520_0
				var_520_1.transform.parent = arg_517_1.stage_.transform
				var_520_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_517_1.bgs_[var_520_0] = var_520_1
			end

			local var_520_2 = 1

			if var_520_2 < arg_517_1.time_ and arg_517_1.time_ <= var_520_2 + arg_520_0 then
				local var_520_3 = manager.ui.mainCamera.transform.localPosition
				local var_520_4 = Vector3.New(0, 0, 10) + Vector3.New(var_520_3.x, var_520_3.y, 0)
				local var_520_5 = arg_517_1.bgs_.LX0102_blur

				var_520_5.transform.localPosition = var_520_4
				var_520_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_520_6 = var_520_5:GetComponent("SpriteRenderer")

				if var_520_6 and var_520_6.sprite then
					local var_520_7 = (var_520_5.transform.localPosition - var_520_3).z
					local var_520_8 = manager.ui.mainCameraCom_
					local var_520_9 = 2 * var_520_7 * Mathf.Tan(var_520_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_520_10 = var_520_9 * var_520_8.aspect
					local var_520_11 = var_520_6.sprite.bounds.size.x
					local var_520_12 = var_520_6.sprite.bounds.size.y
					local var_520_13 = var_520_10 / var_520_11
					local var_520_14 = var_520_9 / var_520_12
					local var_520_15 = var_520_14 < var_520_13 and var_520_13 or var_520_14

					var_520_5.transform.localScale = Vector3.New(var_520_15, var_520_15, 0)
				end

				for iter_520_0, iter_520_1 in pairs(arg_517_1.bgs_) do
					if iter_520_0 ~= "LX0102_blur" then
						iter_520_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_520_16 = "LX0102_blur"

			if arg_517_1.bgs_[var_520_16] == nil then
				local var_520_17 = Object.Instantiate(arg_517_1.blurPaintGo_)
				local var_520_18 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_520_16)

				var_520_17:GetComponent("SpriteRenderer").sprite = var_520_18
				var_520_17.name = var_520_16
				var_520_17.transform.parent = arg_517_1.stage_.transform
				var_520_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_517_1.bgs_[var_520_16] = var_520_17
			end

			local var_520_19 = 1
			local var_520_20 = arg_517_1.bgs_[var_520_16]

			if var_520_19 < arg_517_1.time_ and arg_517_1.time_ <= var_520_19 + arg_520_0 then
				local var_520_21 = manager.ui.mainCamera.transform.localPosition
				local var_520_22 = Vector3.New(0, 0, 10) + Vector3.New(var_520_21.x, var_520_21.y, 0)

				var_520_20.transform.localPosition = var_520_22
				var_520_20.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_520_23 = var_520_20:GetComponent("SpriteRenderer")

				if var_520_23 and var_520_23.sprite then
					local var_520_24 = (var_520_20.transform.localPosition - var_520_21).z
					local var_520_25 = manager.ui.mainCameraCom_
					local var_520_26 = 2 * var_520_24 * Mathf.Tan(var_520_25.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_520_27 = var_520_26 * var_520_25.aspect
					local var_520_28 = var_520_23.sprite.bounds.size.x
					local var_520_29 = var_520_23.sprite.bounds.size.y
					local var_520_30 = var_520_27 / var_520_28
					local var_520_31 = var_520_26 / var_520_29
					local var_520_32 = var_520_31 < var_520_30 and var_520_30 or var_520_31

					var_520_20.transform.localScale = Vector3.New(var_520_32, var_520_32, 0)
				end
			end

			local var_520_33 = 2

			if var_520_19 <= arg_517_1.time_ and arg_517_1.time_ < var_520_19 + var_520_33 then
				local var_520_34 = (arg_517_1.time_ - var_520_19) / var_520_33
				local var_520_35 = Color.New(1, 1, 1)

				var_520_35.a = Mathf.Lerp(0, 1, var_520_34)

				var_520_20:GetComponent("SpriteRenderer").material:SetColor("_Color", var_520_35)
			end

			local var_520_36 = arg_517_1.bgs_.LX0102.transform
			local var_520_37 = 1

			if var_520_37 < arg_517_1.time_ and arg_517_1.time_ <= var_520_37 + arg_520_0 then
				arg_517_1.var_.moveOldPosLX0102 = var_520_36.localPosition
			end

			local var_520_38 = 2

			if var_520_37 <= arg_517_1.time_ and arg_517_1.time_ < var_520_37 + var_520_38 then
				local var_520_39 = (arg_517_1.time_ - var_520_37) / var_520_38
				local var_520_40 = Vector3.New(0, 1, 9.5)

				var_520_36.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPosLX0102, var_520_40, var_520_39)
			end

			if arg_517_1.time_ >= var_520_37 + var_520_38 and arg_517_1.time_ < var_520_37 + var_520_38 + arg_520_0 then
				var_520_36.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_520_41 = 0

			if var_520_41 < arg_517_1.time_ and arg_517_1.time_ <= var_520_41 + arg_520_0 then
				arg_517_1.mask_.enabled = true
				arg_517_1.mask_.raycastTarget = true

				arg_517_1:SetGaussion(false)
			end

			local var_520_42 = 1

			if var_520_41 <= arg_517_1.time_ and arg_517_1.time_ < var_520_41 + var_520_42 then
				local var_520_43 = (arg_517_1.time_ - var_520_41) / var_520_42
				local var_520_44 = Color.New(0, 0, 0)

				var_520_44.a = Mathf.Lerp(0, 1, var_520_43)
				arg_517_1.mask_.color = var_520_44
			end

			if arg_517_1.time_ >= var_520_41 + var_520_42 and arg_517_1.time_ < var_520_41 + var_520_42 + arg_520_0 then
				local var_520_45 = Color.New(0, 0, 0)

				var_520_45.a = 1
				arg_517_1.mask_.color = var_520_45
			end

			local var_520_46 = 1

			if var_520_46 < arg_517_1.time_ and arg_517_1.time_ <= var_520_46 + arg_520_0 then
				arg_517_1.mask_.enabled = true
				arg_517_1.mask_.raycastTarget = true

				arg_517_1:SetGaussion(false)
			end

			local var_520_47 = 1

			if var_520_46 <= arg_517_1.time_ and arg_517_1.time_ < var_520_46 + var_520_47 then
				local var_520_48 = (arg_517_1.time_ - var_520_46) / var_520_47
				local var_520_49 = Color.New(0, 0, 0)

				var_520_49.a = Mathf.Lerp(1, 0, var_520_48)
				arg_517_1.mask_.color = var_520_49
			end

			if arg_517_1.time_ >= var_520_46 + var_520_47 and arg_517_1.time_ < var_520_46 + var_520_47 + arg_520_0 then
				local var_520_50 = Color.New(0, 0, 0)
				local var_520_51 = 0

				arg_517_1.mask_.enabled = false
				var_520_50.a = var_520_51
				arg_517_1.mask_.color = var_520_50
			end

			if arg_517_1.frameCnt_ <= 1 then
				arg_517_1.dialog_:SetActive(false)
			end

			local var_520_52 = 1
			local var_520_53 = 0.125

			if var_520_52 < arg_517_1.time_ and arg_517_1.time_ <= var_520_52 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0

				arg_517_1.dialog_:SetActive(true)

				local var_520_54 = LeanTween.value(arg_517_1.dialog_, 0, 1, 0.3)

				var_520_54:setOnUpdate(LuaHelper.FloatAction(function(arg_521_0)
					arg_517_1.dialogCg_.alpha = arg_521_0
				end))
				var_520_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_517_1.dialog_)
					var_520_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_517_1.duration_ = arg_517_1.duration_ + 0.3

				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_55 = arg_517_1:FormatText(StoryNameCfg[74].name)

				arg_517_1.leftNameTxt_.text = var_520_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, true)
				arg_517_1.iconController_:SetSelectedState("hero")

				arg_517_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_56 = arg_517_1:GetWordFromCfg(318041125)
				local var_520_57 = arg_517_1:FormatText(var_520_56.content)

				arg_517_1.text_.text = var_520_57

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_58 = 5
				local var_520_59 = utf8.len(var_520_57)
				local var_520_60 = var_520_58 <= 0 and var_520_53 or var_520_53 * (var_520_59 / var_520_58)

				if var_520_60 > 0 and var_520_53 < var_520_60 then
					arg_517_1.talkMaxDuration = var_520_60
					var_520_52 = var_520_52 + 0.3

					if var_520_60 + var_520_52 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_60 + var_520_52
					end
				end

				arg_517_1.text_.text = var_520_57
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041125", "story_v_out_318041.awb") ~= 0 then
					local var_520_61 = manager.audio:GetVoiceLength("story_v_out_318041", "318041125", "story_v_out_318041.awb") / 1000

					if var_520_61 + var_520_52 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_61 + var_520_52
					end

					if var_520_56.prefab_name ~= "" and arg_517_1.actors_[var_520_56.prefab_name] ~= nil then
						local var_520_62 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_56.prefab_name].transform, "story_v_out_318041", "318041125", "story_v_out_318041.awb")

						arg_517_1:RecordAudio("318041125", var_520_62)
						arg_517_1:RecordAudio("318041125", var_520_62)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_out_318041", "318041125", "story_v_out_318041.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_out_318041", "318041125", "story_v_out_318041.awb")
				end

				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_63 = var_520_52 + 0.3
			local var_520_64 = math.max(var_520_53, arg_517_1.talkMaxDuration)

			if var_520_63 <= arg_517_1.time_ and arg_517_1.time_ < var_520_63 + var_520_64 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_63) / var_520_64

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_63 + var_520_64 and arg_517_1.time_ < var_520_63 + var_520_64 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play318041126 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 318041126
		arg_523_1.duration_ = 4.9

		local var_523_0 = {
			zh = 3.833,
			ja = 4.9
		}
		local var_523_1 = manager.audio:GetLocalizationFlag()

		if var_523_0[var_523_1] ~= nil then
			arg_523_1.duration_ = var_523_0[var_523_1]
		end

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play318041127(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = 0
			local var_526_1 = 0.225

			if var_526_0 < arg_523_1.time_ and arg_523_1.time_ <= var_526_0 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_2 = arg_523_1:FormatText(StoryNameCfg[74].name)

				arg_523_1.leftNameTxt_.text = var_526_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, true)
				arg_523_1.iconController_:SetSelectedState("hero")

				arg_523_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_3 = arg_523_1:GetWordFromCfg(318041126)
				local var_526_4 = arg_523_1:FormatText(var_526_3.content)

				arg_523_1.text_.text = var_526_4

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_5 = 9
				local var_526_6 = utf8.len(var_526_4)
				local var_526_7 = var_526_5 <= 0 and var_526_1 or var_526_1 * (var_526_6 / var_526_5)

				if var_526_7 > 0 and var_526_1 < var_526_7 then
					arg_523_1.talkMaxDuration = var_526_7

					if var_526_7 + var_526_0 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_7 + var_526_0
					end
				end

				arg_523_1.text_.text = var_526_4
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041126", "story_v_out_318041.awb") ~= 0 then
					local var_526_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041126", "story_v_out_318041.awb") / 1000

					if var_526_8 + var_526_0 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_8 + var_526_0
					end

					if var_526_3.prefab_name ~= "" and arg_523_1.actors_[var_526_3.prefab_name] ~= nil then
						local var_526_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_523_1.actors_[var_526_3.prefab_name].transform, "story_v_out_318041", "318041126", "story_v_out_318041.awb")

						arg_523_1:RecordAudio("318041126", var_526_9)
						arg_523_1:RecordAudio("318041126", var_526_9)
					else
						arg_523_1:AudioAction("play", "voice", "story_v_out_318041", "318041126", "story_v_out_318041.awb")
					end

					arg_523_1:RecordHistoryTalkVoice("story_v_out_318041", "318041126", "story_v_out_318041.awb")
				end

				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_10 = math.max(var_526_1, arg_523_1.talkMaxDuration)

			if var_526_0 <= arg_523_1.time_ and arg_523_1.time_ < var_526_0 + var_526_10 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_0) / var_526_10

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_0 + var_526_10 and arg_523_1.time_ < var_526_0 + var_526_10 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play318041127 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 318041127
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play318041128(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 1.15

			if var_530_0 < arg_527_1.time_ and arg_527_1.time_ <= var_530_0 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0

				arg_527_1.dialog_:SetActive(true)

				local var_530_2 = LeanTween.value(arg_527_1.dialog_, 0, 1, 0.3)

				var_530_2:setOnUpdate(LuaHelper.FloatAction(function(arg_531_0)
					arg_527_1.dialogCg_.alpha = arg_531_0
				end))
				var_530_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_527_1.dialog_)
					var_530_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_527_1.duration_ = arg_527_1.duration_ + 0.3

				SetActive(arg_527_1.leftNameGo_, false)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_3 = arg_527_1:GetWordFromCfg(318041127)
				local var_530_4 = arg_527_1:FormatText(var_530_3.content)

				arg_527_1.text_.text = var_530_4

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_5 = 46
				local var_530_6 = utf8.len(var_530_4)
				local var_530_7 = var_530_5 <= 0 and var_530_1 or var_530_1 * (var_530_6 / var_530_5)

				if var_530_7 > 0 and var_530_1 < var_530_7 then
					arg_527_1.talkMaxDuration = var_530_7
					var_530_0 = var_530_0 + 0.3

					if var_530_7 + var_530_0 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_7 + var_530_0
					end
				end

				arg_527_1.text_.text = var_530_4
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)
				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_8 = var_530_0 + 0.3
			local var_530_9 = math.max(var_530_1, arg_527_1.talkMaxDuration)

			if var_530_8 <= arg_527_1.time_ and arg_527_1.time_ < var_530_8 + var_530_9 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_8) / var_530_9

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_8 + var_530_9 and arg_527_1.time_ < var_530_8 + var_530_9 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play318041128 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 318041128
		arg_533_1.duration_ = 5

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play318041129(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = 0
			local var_536_1 = 1.675

			if var_536_0 < arg_533_1.time_ and arg_533_1.time_ <= var_536_0 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, false)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_2 = arg_533_1:GetWordFromCfg(318041128)
				local var_536_3 = arg_533_1:FormatText(var_536_2.content)

				arg_533_1.text_.text = var_536_3

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_4 = 67
				local var_536_5 = utf8.len(var_536_3)
				local var_536_6 = var_536_4 <= 0 and var_536_1 or var_536_1 * (var_536_5 / var_536_4)

				if var_536_6 > 0 and var_536_1 < var_536_6 then
					arg_533_1.talkMaxDuration = var_536_6

					if var_536_6 + var_536_0 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_6 + var_536_0
					end
				end

				arg_533_1.text_.text = var_536_3
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)
				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_7 = math.max(var_536_1, arg_533_1.talkMaxDuration)

			if var_536_0 <= arg_533_1.time_ and arg_533_1.time_ < var_536_0 + var_536_7 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_0) / var_536_7

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_0 + var_536_7 and arg_533_1.time_ < var_536_0 + var_536_7 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play318041129 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 318041129
		arg_537_1.duration_ = 5

		SetActive(arg_537_1.tipsGo_, false)

		function arg_537_1.onSingleLineFinish_()
			arg_537_1.onSingleLineUpdate_ = nil
			arg_537_1.onSingleLineFinish_ = nil
			arg_537_1.state_ = "waiting"
		end

		function arg_537_1.playNext_(arg_539_0)
			if arg_539_0 == 1 then
				arg_537_0:Play318041130(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = 0
			local var_540_1 = 0.25

			if var_540_0 < arg_537_1.time_ and arg_537_1.time_ <= var_540_0 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, false)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_2 = arg_537_1:GetWordFromCfg(318041129)
				local var_540_3 = arg_537_1:FormatText(var_540_2.content)

				arg_537_1.text_.text = var_540_3

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_4 = 10
				local var_540_5 = utf8.len(var_540_3)
				local var_540_6 = var_540_4 <= 0 and var_540_1 or var_540_1 * (var_540_5 / var_540_4)

				if var_540_6 > 0 and var_540_1 < var_540_6 then
					arg_537_1.talkMaxDuration = var_540_6

					if var_540_6 + var_540_0 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_6 + var_540_0
					end
				end

				arg_537_1.text_.text = var_540_3
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)
				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_7 = math.max(var_540_1, arg_537_1.talkMaxDuration)

			if var_540_0 <= arg_537_1.time_ and arg_537_1.time_ < var_540_0 + var_540_7 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_0) / var_540_7

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_0 + var_540_7 and arg_537_1.time_ < var_540_0 + var_540_7 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play318041130 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 318041130
		arg_541_1.duration_ = 3.066

		local var_541_0 = {
			zh = 2.1,
			ja = 3.066
		}
		local var_541_1 = manager.audio:GetLocalizationFlag()

		if var_541_0[var_541_1] ~= nil then
			arg_541_1.duration_ = var_541_0[var_541_1]
		end

		SetActive(arg_541_1.tipsGo_, false)

		function arg_541_1.onSingleLineFinish_()
			arg_541_1.onSingleLineUpdate_ = nil
			arg_541_1.onSingleLineFinish_ = nil
			arg_541_1.state_ = "waiting"
		end

		function arg_541_1.playNext_(arg_543_0)
			if arg_543_0 == 1 then
				arg_541_0:Play318041131(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = 0
			local var_544_1 = 0.175

			if var_544_0 < arg_541_1.time_ and arg_541_1.time_ <= var_544_0 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_2 = arg_541_1:FormatText(StoryNameCfg[650].name)

				arg_541_1.leftNameTxt_.text = var_544_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_3 = arg_541_1:GetWordFromCfg(318041130)
				local var_544_4 = arg_541_1:FormatText(var_544_3.content)

				arg_541_1.text_.text = var_544_4

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_5 = 7
				local var_544_6 = utf8.len(var_544_4)
				local var_544_7 = var_544_5 <= 0 and var_544_1 or var_544_1 * (var_544_6 / var_544_5)

				if var_544_7 > 0 and var_544_1 < var_544_7 then
					arg_541_1.talkMaxDuration = var_544_7

					if var_544_7 + var_544_0 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_7 + var_544_0
					end
				end

				arg_541_1.text_.text = var_544_4
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041130", "story_v_out_318041.awb") ~= 0 then
					local var_544_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041130", "story_v_out_318041.awb") / 1000

					if var_544_8 + var_544_0 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_8 + var_544_0
					end

					if var_544_3.prefab_name ~= "" and arg_541_1.actors_[var_544_3.prefab_name] ~= nil then
						local var_544_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_541_1.actors_[var_544_3.prefab_name].transform, "story_v_out_318041", "318041130", "story_v_out_318041.awb")

						arg_541_1:RecordAudio("318041130", var_544_9)
						arg_541_1:RecordAudio("318041130", var_544_9)
					else
						arg_541_1:AudioAction("play", "voice", "story_v_out_318041", "318041130", "story_v_out_318041.awb")
					end

					arg_541_1:RecordHistoryTalkVoice("story_v_out_318041", "318041130", "story_v_out_318041.awb")
				end

				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_10 = math.max(var_544_1, arg_541_1.talkMaxDuration)

			if var_544_0 <= arg_541_1.time_ and arg_541_1.time_ < var_544_0 + var_544_10 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_0) / var_544_10

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_0 + var_544_10 and arg_541_1.time_ < var_544_0 + var_544_10 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play318041131 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 318041131
		arg_545_1.duration_ = 5

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play318041132(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = 0
			local var_548_1 = 1.475

			if var_548_0 < arg_545_1.time_ and arg_545_1.time_ <= var_548_0 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, false)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_2 = arg_545_1:GetWordFromCfg(318041131)
				local var_548_3 = arg_545_1:FormatText(var_548_2.content)

				arg_545_1.text_.text = var_548_3

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_4 = 59
				local var_548_5 = utf8.len(var_548_3)
				local var_548_6 = var_548_4 <= 0 and var_548_1 or var_548_1 * (var_548_5 / var_548_4)

				if var_548_6 > 0 and var_548_1 < var_548_6 then
					arg_545_1.talkMaxDuration = var_548_6

					if var_548_6 + var_548_0 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_6 + var_548_0
					end
				end

				arg_545_1.text_.text = var_548_3
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)
				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_7 = math.max(var_548_1, arg_545_1.talkMaxDuration)

			if var_548_0 <= arg_545_1.time_ and arg_545_1.time_ < var_548_0 + var_548_7 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_0) / var_548_7

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_0 + var_548_7 and arg_545_1.time_ < var_548_0 + var_548_7 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play318041132 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 318041132
		arg_549_1.duration_ = 5

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play318041133(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = 0
			local var_552_1 = 1.45

			if var_552_0 < arg_549_1.time_ and arg_549_1.time_ <= var_552_0 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, false)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_2 = arg_549_1:GetWordFromCfg(318041132)
				local var_552_3 = arg_549_1:FormatText(var_552_2.content)

				arg_549_1.text_.text = var_552_3

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_4 = 58
				local var_552_5 = utf8.len(var_552_3)
				local var_552_6 = var_552_4 <= 0 and var_552_1 or var_552_1 * (var_552_5 / var_552_4)

				if var_552_6 > 0 and var_552_1 < var_552_6 then
					arg_549_1.talkMaxDuration = var_552_6

					if var_552_6 + var_552_0 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_6 + var_552_0
					end
				end

				arg_549_1.text_.text = var_552_3
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)
				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_7 = math.max(var_552_1, arg_549_1.talkMaxDuration)

			if var_552_0 <= arg_549_1.time_ and arg_549_1.time_ < var_552_0 + var_552_7 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_0) / var_552_7

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_0 + var_552_7 and arg_549_1.time_ < var_552_0 + var_552_7 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play318041133 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 318041133
		arg_553_1.duration_ = 3.1

		local var_553_0 = {
			zh = 2.466,
			ja = 3.1
		}
		local var_553_1 = manager.audio:GetLocalizationFlag()

		if var_553_0[var_553_1] ~= nil then
			arg_553_1.duration_ = var_553_0[var_553_1]
		end

		SetActive(arg_553_1.tipsGo_, false)

		function arg_553_1.onSingleLineFinish_()
			arg_553_1.onSingleLineUpdate_ = nil
			arg_553_1.onSingleLineFinish_ = nil
			arg_553_1.state_ = "waiting"
		end

		function arg_553_1.playNext_(arg_555_0)
			if arg_555_0 == 1 then
				arg_553_0:Play318041134(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = 0
			local var_556_1 = 0.15

			if var_556_0 < arg_553_1.time_ and arg_553_1.time_ <= var_556_0 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0
				arg_553_1.dialogCg_.alpha = 1

				arg_553_1.dialog_:SetActive(true)
				SetActive(arg_553_1.leftNameGo_, true)

				local var_556_2 = arg_553_1:FormatText(StoryNameCfg[74].name)

				arg_553_1.leftNameTxt_.text = var_556_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_553_1.leftNameTxt_.transform)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1.leftNameTxt_.text)
				SetActive(arg_553_1.iconTrs_.gameObject, true)
				arg_553_1.iconController_:SetSelectedState("hero")

				arg_553_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_3 = arg_553_1:GetWordFromCfg(318041133)
				local var_556_4 = arg_553_1:FormatText(var_556_3.content)

				arg_553_1.text_.text = var_556_4

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_5 = 6
				local var_556_6 = utf8.len(var_556_4)
				local var_556_7 = var_556_5 <= 0 and var_556_1 or var_556_1 * (var_556_6 / var_556_5)

				if var_556_7 > 0 and var_556_1 < var_556_7 then
					arg_553_1.talkMaxDuration = var_556_7

					if var_556_7 + var_556_0 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_7 + var_556_0
					end
				end

				arg_553_1.text_.text = var_556_4
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041133", "story_v_out_318041.awb") ~= 0 then
					local var_556_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041133", "story_v_out_318041.awb") / 1000

					if var_556_8 + var_556_0 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_8 + var_556_0
					end

					if var_556_3.prefab_name ~= "" and arg_553_1.actors_[var_556_3.prefab_name] ~= nil then
						local var_556_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_553_1.actors_[var_556_3.prefab_name].transform, "story_v_out_318041", "318041133", "story_v_out_318041.awb")

						arg_553_1:RecordAudio("318041133", var_556_9)
						arg_553_1:RecordAudio("318041133", var_556_9)
					else
						arg_553_1:AudioAction("play", "voice", "story_v_out_318041", "318041133", "story_v_out_318041.awb")
					end

					arg_553_1:RecordHistoryTalkVoice("story_v_out_318041", "318041133", "story_v_out_318041.awb")
				end

				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_10 = math.max(var_556_1, arg_553_1.talkMaxDuration)

			if var_556_0 <= arg_553_1.time_ and arg_553_1.time_ < var_556_0 + var_556_10 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_0) / var_556_10

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_0 + var_556_10 and arg_553_1.time_ < var_556_0 + var_556_10 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play318041134 = function(arg_557_0, arg_557_1)
		arg_557_1.time_ = 0
		arg_557_1.frameCnt_ = 0
		arg_557_1.state_ = "playing"
		arg_557_1.curTalkId_ = 318041134
		arg_557_1.duration_ = 6

		SetActive(arg_557_1.tipsGo_, false)

		function arg_557_1.onSingleLineFinish_()
			arg_557_1.onSingleLineUpdate_ = nil
			arg_557_1.onSingleLineFinish_ = nil
			arg_557_1.state_ = "waiting"
		end

		function arg_557_1.playNext_(arg_559_0)
			if arg_559_0 == 1 then
				arg_557_0:Play318041135(arg_557_1)
			end
		end

		function arg_557_1.onSingleLineUpdate_(arg_560_0)
			local var_560_0 = 1

			if var_560_0 < arg_557_1.time_ and arg_557_1.time_ <= var_560_0 + arg_560_0 then
				local var_560_1 = manager.ui.mainCamera.transform.localPosition
				local var_560_2 = Vector3.New(0, 0, 10) + Vector3.New(var_560_1.x, var_560_1.y, 0)
				local var_560_3 = arg_557_1.bgs_.STblack

				var_560_3.transform.localPosition = var_560_2
				var_560_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_560_4 = var_560_3:GetComponent("SpriteRenderer")

				if var_560_4 and var_560_4.sprite then
					local var_560_5 = (var_560_3.transform.localPosition - var_560_1).z
					local var_560_6 = manager.ui.mainCameraCom_
					local var_560_7 = 2 * var_560_5 * Mathf.Tan(var_560_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_560_8 = var_560_7 * var_560_6.aspect
					local var_560_9 = var_560_4.sprite.bounds.size.x
					local var_560_10 = var_560_4.sprite.bounds.size.y
					local var_560_11 = var_560_8 / var_560_9
					local var_560_12 = var_560_7 / var_560_10
					local var_560_13 = var_560_12 < var_560_11 and var_560_11 or var_560_12

					var_560_3.transform.localScale = Vector3.New(var_560_13, var_560_13, 0)
				end

				for iter_560_0, iter_560_1 in pairs(arg_557_1.bgs_) do
					if iter_560_0 ~= "STblack" then
						iter_560_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_560_14 = 0

			if var_560_14 < arg_557_1.time_ and arg_557_1.time_ <= var_560_14 + arg_560_0 then
				arg_557_1.mask_.enabled = true
				arg_557_1.mask_.raycastTarget = true

				arg_557_1:SetGaussion(false)
			end

			local var_560_15 = 1

			if var_560_14 <= arg_557_1.time_ and arg_557_1.time_ < var_560_14 + var_560_15 then
				local var_560_16 = (arg_557_1.time_ - var_560_14) / var_560_15
				local var_560_17 = Color.New(0, 0, 0)

				var_560_17.a = Mathf.Lerp(0, 1, var_560_16)
				arg_557_1.mask_.color = var_560_17
			end

			if arg_557_1.time_ >= var_560_14 + var_560_15 and arg_557_1.time_ < var_560_14 + var_560_15 + arg_560_0 then
				local var_560_18 = Color.New(0, 0, 0)

				var_560_18.a = 1
				arg_557_1.mask_.color = var_560_18
			end

			local var_560_19 = 1

			if var_560_19 < arg_557_1.time_ and arg_557_1.time_ <= var_560_19 + arg_560_0 then
				arg_557_1.mask_.enabled = true
				arg_557_1.mask_.raycastTarget = true

				arg_557_1:SetGaussion(false)
			end

			local var_560_20 = 1

			if var_560_19 <= arg_557_1.time_ and arg_557_1.time_ < var_560_19 + var_560_20 then
				local var_560_21 = (arg_557_1.time_ - var_560_19) / var_560_20
				local var_560_22 = Color.New(0, 0, 0)

				var_560_22.a = Mathf.Lerp(1, 0, var_560_21)
				arg_557_1.mask_.color = var_560_22
			end

			if arg_557_1.time_ >= var_560_19 + var_560_20 and arg_557_1.time_ < var_560_19 + var_560_20 + arg_560_0 then
				local var_560_23 = Color.New(0, 0, 0)
				local var_560_24 = 0

				arg_557_1.mask_.enabled = false
				var_560_23.a = var_560_24
				arg_557_1.mask_.color = var_560_23
			end

			if arg_557_1.frameCnt_ <= 1 then
				arg_557_1.dialog_:SetActive(false)
			end

			local var_560_25 = 1
			local var_560_26 = 1.25

			if var_560_25 < arg_557_1.time_ and arg_557_1.time_ <= var_560_25 + arg_560_0 then
				arg_557_1.talkMaxDuration = 0

				arg_557_1.dialog_:SetActive(true)

				local var_560_27 = LeanTween.value(arg_557_1.dialog_, 0, 1, 0.3)

				var_560_27:setOnUpdate(LuaHelper.FloatAction(function(arg_561_0)
					arg_557_1.dialogCg_.alpha = arg_561_0
				end))
				var_560_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_557_1.dialog_)
					var_560_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_557_1.duration_ = arg_557_1.duration_ + 0.3

				SetActive(arg_557_1.leftNameGo_, false)

				arg_557_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_557_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_557_1:RecordName(arg_557_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_557_1.iconTrs_.gameObject, false)
				arg_557_1.callingController_:SetSelectedState("normal")

				local var_560_28 = arg_557_1:GetWordFromCfg(318041134)
				local var_560_29 = arg_557_1:FormatText(var_560_28.content)

				arg_557_1.text_.text = var_560_29

				LuaForUtil.ClearLinePrefixSymbol(arg_557_1.text_)

				local var_560_30 = 50
				local var_560_31 = utf8.len(var_560_29)
				local var_560_32 = var_560_30 <= 0 and var_560_26 or var_560_26 * (var_560_31 / var_560_30)

				if var_560_32 > 0 and var_560_26 < var_560_32 then
					arg_557_1.talkMaxDuration = var_560_32
					var_560_25 = var_560_25 + 0.3

					if var_560_32 + var_560_25 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_32 + var_560_25
					end
				end

				arg_557_1.text_.text = var_560_29
				arg_557_1.typewritter.percent = 0

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(false)
				arg_557_1:RecordContent(arg_557_1.text_.text)
			end

			local var_560_33 = var_560_25 + 0.3
			local var_560_34 = math.max(var_560_26, arg_557_1.talkMaxDuration)

			if var_560_33 <= arg_557_1.time_ and arg_557_1.time_ < var_560_33 + var_560_34 then
				arg_557_1.typewritter.percent = (arg_557_1.time_ - var_560_33) / var_560_34

				arg_557_1.typewritter:SetDirty()
			end

			if arg_557_1.time_ >= var_560_33 + var_560_34 and arg_557_1.time_ < var_560_33 + var_560_34 + arg_560_0 then
				arg_557_1.typewritter.percent = 1

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(true)
			end
		end
	end,
	Play318041135 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 318041135
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play318041136(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0
			local var_566_1 = 0.875

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, false)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_2 = arg_563_1:GetWordFromCfg(318041135)
				local var_566_3 = arg_563_1:FormatText(var_566_2.content)

				arg_563_1.text_.text = var_566_3

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_4 = 35
				local var_566_5 = utf8.len(var_566_3)
				local var_566_6 = var_566_4 <= 0 and var_566_1 or var_566_1 * (var_566_5 / var_566_4)

				if var_566_6 > 0 and var_566_1 < var_566_6 then
					arg_563_1.talkMaxDuration = var_566_6

					if var_566_6 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_6 + var_566_0
					end
				end

				arg_563_1.text_.text = var_566_3
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_7 = math.max(var_566_1, arg_563_1.talkMaxDuration)

			if var_566_0 <= arg_563_1.time_ and arg_563_1.time_ < var_566_0 + var_566_7 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_0) / var_566_7

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_0 + var_566_7 and arg_563_1.time_ < var_566_0 + var_566_7 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play318041136 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 318041136
		arg_567_1.duration_ = 9

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play318041137(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 2

			if var_570_0 < arg_567_1.time_ and arg_567_1.time_ <= var_570_0 + arg_570_0 then
				local var_570_1 = manager.ui.mainCamera.transform.localPosition
				local var_570_2 = Vector3.New(0, 0, 10) + Vector3.New(var_570_1.x, var_570_1.y, 0)
				local var_570_3 = arg_567_1.bgs_.STblack

				var_570_3.transform.localPosition = var_570_2
				var_570_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_570_4 = var_570_3:GetComponent("SpriteRenderer")

				if var_570_4 and var_570_4.sprite then
					local var_570_5 = (var_570_3.transform.localPosition - var_570_1).z
					local var_570_6 = manager.ui.mainCameraCom_
					local var_570_7 = 2 * var_570_5 * Mathf.Tan(var_570_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_570_8 = var_570_7 * var_570_6.aspect
					local var_570_9 = var_570_4.sprite.bounds.size.x
					local var_570_10 = var_570_4.sprite.bounds.size.y
					local var_570_11 = var_570_8 / var_570_9
					local var_570_12 = var_570_7 / var_570_10
					local var_570_13 = var_570_12 < var_570_11 and var_570_11 or var_570_12

					var_570_3.transform.localScale = Vector3.New(var_570_13, var_570_13, 0)
				end

				for iter_570_0, iter_570_1 in pairs(arg_567_1.bgs_) do
					if iter_570_0 ~= "STblack" then
						iter_570_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_570_14 = 2

			if var_570_14 < arg_567_1.time_ and arg_567_1.time_ <= var_570_14 + arg_570_0 then
				arg_567_1.mask_.enabled = true
				arg_567_1.mask_.raycastTarget = true

				arg_567_1:SetGaussion(false)
			end

			local var_570_15 = 2

			if var_570_14 <= arg_567_1.time_ and arg_567_1.time_ < var_570_14 + var_570_15 then
				local var_570_16 = (arg_567_1.time_ - var_570_14) / var_570_15
				local var_570_17 = Color.New(0, 0, 0)

				var_570_17.a = Mathf.Lerp(1, 0, var_570_16)
				arg_567_1.mask_.color = var_570_17
			end

			if arg_567_1.time_ >= var_570_14 + var_570_15 and arg_567_1.time_ < var_570_14 + var_570_15 + arg_570_0 then
				local var_570_18 = Color.New(0, 0, 0)
				local var_570_19 = 0

				arg_567_1.mask_.enabled = false
				var_570_18.a = var_570_19
				arg_567_1.mask_.color = var_570_18
			end

			local var_570_20 = 0

			if var_570_20 < arg_567_1.time_ and arg_567_1.time_ <= var_570_20 + arg_570_0 then
				arg_567_1.mask_.enabled = true
				arg_567_1.mask_.raycastTarget = true

				arg_567_1:SetGaussion(false)
			end

			local var_570_21 = 2

			if var_570_20 <= arg_567_1.time_ and arg_567_1.time_ < var_570_20 + var_570_21 then
				local var_570_22 = (arg_567_1.time_ - var_570_20) / var_570_21
				local var_570_23 = Color.New(0, 0, 0)

				var_570_23.a = Mathf.Lerp(0, 1, var_570_22)
				arg_567_1.mask_.color = var_570_23
			end

			if arg_567_1.time_ >= var_570_20 + var_570_21 and arg_567_1.time_ < var_570_20 + var_570_21 + arg_570_0 then
				local var_570_24 = Color.New(0, 0, 0)

				var_570_24.a = 1
				arg_567_1.mask_.color = var_570_24
			end

			if arg_567_1.frameCnt_ <= 1 then
				arg_567_1.dialog_:SetActive(false)
			end

			local var_570_25 = 4
			local var_570_26 = 1.4

			if var_570_25 < arg_567_1.time_ and arg_567_1.time_ <= var_570_25 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0

				arg_567_1.dialog_:SetActive(true)

				local var_570_27 = LeanTween.value(arg_567_1.dialog_, 0, 1, 0.3)

				var_570_27:setOnUpdate(LuaHelper.FloatAction(function(arg_571_0)
					arg_567_1.dialogCg_.alpha = arg_571_0
				end))
				var_570_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_567_1.dialog_)
					var_570_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_567_1.duration_ = arg_567_1.duration_ + 0.3

				SetActive(arg_567_1.leftNameGo_, false)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_28 = arg_567_1:GetWordFromCfg(318041136)
				local var_570_29 = arg_567_1:FormatText(var_570_28.content)

				arg_567_1.text_.text = var_570_29

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_30 = 56
				local var_570_31 = utf8.len(var_570_29)
				local var_570_32 = var_570_30 <= 0 and var_570_26 or var_570_26 * (var_570_31 / var_570_30)

				if var_570_32 > 0 and var_570_26 < var_570_32 then
					arg_567_1.talkMaxDuration = var_570_32
					var_570_25 = var_570_25 + 0.3

					if var_570_32 + var_570_25 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_32 + var_570_25
					end
				end

				arg_567_1.text_.text = var_570_29
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)
				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_33 = var_570_25 + 0.3
			local var_570_34 = math.max(var_570_26, arg_567_1.talkMaxDuration)

			if var_570_33 <= arg_567_1.time_ and arg_567_1.time_ < var_570_33 + var_570_34 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_33) / var_570_34

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_33 + var_570_34 and arg_567_1.time_ < var_570_33 + var_570_34 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play318041137 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 318041137
		arg_573_1.duration_ = 5.766

		local var_573_0 = {
			zh = 2.633,
			ja = 5.766
		}
		local var_573_1 = manager.audio:GetLocalizationFlag()

		if var_573_0[var_573_1] ~= nil then
			arg_573_1.duration_ = var_573_0[var_573_1]
		end

		SetActive(arg_573_1.tipsGo_, false)

		function arg_573_1.onSingleLineFinish_()
			arg_573_1.onSingleLineUpdate_ = nil
			arg_573_1.onSingleLineFinish_ = nil
			arg_573_1.state_ = "waiting"
		end

		function arg_573_1.playNext_(arg_575_0)
			if arg_575_0 == 1 then
				arg_573_0:Play318041138(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = 0
			local var_576_1 = 0.433333333333333

			if var_576_0 < arg_573_1.time_ and arg_573_1.time_ <= var_576_0 + arg_576_0 then
				local var_576_2 = "stop"
				local var_576_3 = "effect"

				arg_573_1:AudioAction(var_576_2, var_576_3, "se_story_1210", "se_story_1210_loop_wind", "")
			end

			local var_576_4 = 0
			local var_576_5 = 0.175

			if var_576_4 < arg_573_1.time_ and arg_573_1.time_ <= var_576_4 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0
				arg_573_1.dialogCg_.alpha = 1

				arg_573_1.dialog_:SetActive(true)
				SetActive(arg_573_1.leftNameGo_, true)

				local var_576_6 = arg_573_1:FormatText(StoryNameCfg[640].name)

				arg_573_1.leftNameTxt_.text = var_576_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_573_1.leftNameTxt_.transform)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1.leftNameTxt_.text)
				SetActive(arg_573_1.iconTrs_.gameObject, true)
				arg_573_1.iconController_:SetSelectedState("hero")

				arg_573_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10066")

				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_7 = arg_573_1:GetWordFromCfg(318041137)
				local var_576_8 = arg_573_1:FormatText(var_576_7.content)

				arg_573_1.text_.text = var_576_8

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_9 = 7
				local var_576_10 = utf8.len(var_576_8)
				local var_576_11 = var_576_9 <= 0 and var_576_5 or var_576_5 * (var_576_10 / var_576_9)

				if var_576_11 > 0 and var_576_5 < var_576_11 then
					arg_573_1.talkMaxDuration = var_576_11

					if var_576_11 + var_576_4 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_11 + var_576_4
					end
				end

				arg_573_1.text_.text = var_576_8
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041137", "story_v_out_318041.awb") ~= 0 then
					local var_576_12 = manager.audio:GetVoiceLength("story_v_out_318041", "318041137", "story_v_out_318041.awb") / 1000

					if var_576_12 + var_576_4 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_12 + var_576_4
					end

					if var_576_7.prefab_name ~= "" and arg_573_1.actors_[var_576_7.prefab_name] ~= nil then
						local var_576_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_573_1.actors_[var_576_7.prefab_name].transform, "story_v_out_318041", "318041137", "story_v_out_318041.awb")

						arg_573_1:RecordAudio("318041137", var_576_13)
						arg_573_1:RecordAudio("318041137", var_576_13)
					else
						arg_573_1:AudioAction("play", "voice", "story_v_out_318041", "318041137", "story_v_out_318041.awb")
					end

					arg_573_1:RecordHistoryTalkVoice("story_v_out_318041", "318041137", "story_v_out_318041.awb")
				end

				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_14 = math.max(var_576_5, arg_573_1.talkMaxDuration)

			if var_576_4 <= arg_573_1.time_ and arg_573_1.time_ < var_576_4 + var_576_14 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_4) / var_576_14

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_4 + var_576_14 and arg_573_1.time_ < var_576_4 + var_576_14 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play318041138 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 318041138
		arg_577_1.duration_ = 5.666

		local var_577_0 = {
			zh = 5.666,
			ja = 5.166
		}
		local var_577_1 = manager.audio:GetLocalizationFlag()

		if var_577_0[var_577_1] ~= nil then
			arg_577_1.duration_ = var_577_0[var_577_1]
		end

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play318041139(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = 0

			if var_580_0 < arg_577_1.time_ and arg_577_1.time_ <= var_580_0 + arg_580_0 then
				local var_580_1 = manager.ui.mainCamera.transform.localPosition
				local var_580_2 = Vector3.New(0, 0, 10) + Vector3.New(var_580_1.x, var_580_1.y, 0)
				local var_580_3 = arg_577_1.bgs_.ST69

				var_580_3.transform.localPosition = var_580_2
				var_580_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_580_4 = var_580_3:GetComponent("SpriteRenderer")

				if var_580_4 and var_580_4.sprite then
					local var_580_5 = (var_580_3.transform.localPosition - var_580_1).z
					local var_580_6 = manager.ui.mainCameraCom_
					local var_580_7 = 2 * var_580_5 * Mathf.Tan(var_580_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_580_8 = var_580_7 * var_580_6.aspect
					local var_580_9 = var_580_4.sprite.bounds.size.x
					local var_580_10 = var_580_4.sprite.bounds.size.y
					local var_580_11 = var_580_8 / var_580_9
					local var_580_12 = var_580_7 / var_580_10
					local var_580_13 = var_580_12 < var_580_11 and var_580_11 or var_580_12

					var_580_3.transform.localScale = Vector3.New(var_580_13, var_580_13, 0)
				end

				for iter_580_0, iter_580_1 in pairs(arg_577_1.bgs_) do
					if iter_580_0 ~= "ST69" then
						iter_580_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_580_14 = 0

			if var_580_14 < arg_577_1.time_ and arg_577_1.time_ <= var_580_14 + arg_580_0 then
				arg_577_1.mask_.enabled = true
				arg_577_1.mask_.raycastTarget = true

				arg_577_1:SetGaussion(false)
			end

			local var_580_15 = 2

			if var_580_14 <= arg_577_1.time_ and arg_577_1.time_ < var_580_14 + var_580_15 then
				local var_580_16 = (arg_577_1.time_ - var_580_14) / var_580_15
				local var_580_17 = Color.New(0, 0, 0)

				var_580_17.a = Mathf.Lerp(1, 0, var_580_16)
				arg_577_1.mask_.color = var_580_17
			end

			if arg_577_1.time_ >= var_580_14 + var_580_15 and arg_577_1.time_ < var_580_14 + var_580_15 + arg_580_0 then
				local var_580_18 = Color.New(0, 0, 0)
				local var_580_19 = 0

				arg_577_1.mask_.enabled = false
				var_580_18.a = var_580_19
				arg_577_1.mask_.color = var_580_18
			end

			local var_580_20 = arg_577_1.actors_["1050ui_story"].transform
			local var_580_21 = 1.9

			if var_580_21 < arg_577_1.time_ and arg_577_1.time_ <= var_580_21 + arg_580_0 then
				arg_577_1.var_.moveOldPos1050ui_story = var_580_20.localPosition
			end

			local var_580_22 = 0.001

			if var_580_21 <= arg_577_1.time_ and arg_577_1.time_ < var_580_21 + var_580_22 then
				local var_580_23 = (arg_577_1.time_ - var_580_21) / var_580_22
				local var_580_24 = Vector3.New(0, -1, -6.1)

				var_580_20.localPosition = Vector3.Lerp(arg_577_1.var_.moveOldPos1050ui_story, var_580_24, var_580_23)

				local var_580_25 = manager.ui.mainCamera.transform.position - var_580_20.position

				var_580_20.forward = Vector3.New(var_580_25.x, var_580_25.y, var_580_25.z)

				local var_580_26 = var_580_20.localEulerAngles

				var_580_26.z = 0
				var_580_26.x = 0
				var_580_20.localEulerAngles = var_580_26
			end

			if arg_577_1.time_ >= var_580_21 + var_580_22 and arg_577_1.time_ < var_580_21 + var_580_22 + arg_580_0 then
				var_580_20.localPosition = Vector3.New(0, -1, -6.1)

				local var_580_27 = manager.ui.mainCamera.transform.position - var_580_20.position

				var_580_20.forward = Vector3.New(var_580_27.x, var_580_27.y, var_580_27.z)

				local var_580_28 = var_580_20.localEulerAngles

				var_580_28.z = 0
				var_580_28.x = 0
				var_580_20.localEulerAngles = var_580_28
			end

			local var_580_29 = arg_577_1.actors_["1050ui_story"]
			local var_580_30 = 1.9

			if var_580_30 < arg_577_1.time_ and arg_577_1.time_ <= var_580_30 + arg_580_0 and arg_577_1.var_.characterEffect1050ui_story == nil then
				arg_577_1.var_.characterEffect1050ui_story = var_580_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_580_31 = 0.200000002980232

			if var_580_30 <= arg_577_1.time_ and arg_577_1.time_ < var_580_30 + var_580_31 then
				local var_580_32 = (arg_577_1.time_ - var_580_30) / var_580_31

				if arg_577_1.var_.characterEffect1050ui_story then
					arg_577_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_577_1.time_ >= var_580_30 + var_580_31 and arg_577_1.time_ < var_580_30 + var_580_31 + arg_580_0 and arg_577_1.var_.characterEffect1050ui_story then
				arg_577_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_580_33 = 1.9

			if var_580_33 < arg_577_1.time_ and arg_577_1.time_ <= var_580_33 + arg_580_0 then
				arg_577_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_580_34 = 1.9

			if var_580_34 < arg_577_1.time_ and arg_577_1.time_ <= var_580_34 + arg_580_0 then
				arg_577_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_580_35 = 0
			local var_580_36 = 0.433333333333333

			if var_580_35 < arg_577_1.time_ and arg_577_1.time_ <= var_580_35 + arg_580_0 then
				local var_580_37 = "play"
				local var_580_38 = "music"

				arg_577_1:AudioAction(var_580_37, var_580_38, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_580_39 = 0.766666666666667
			local var_580_40 = 1

			if var_580_39 < arg_577_1.time_ and arg_577_1.time_ <= var_580_39 + arg_580_0 then
				local var_580_41 = "play"
				local var_580_42 = "music"

				arg_577_1:AudioAction(var_580_41, var_580_42, "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten.awb")
			end

			if arg_577_1.frameCnt_ <= 1 then
				arg_577_1.dialog_:SetActive(false)
			end

			local var_580_43 = 1.9
			local var_580_44 = 0.15

			if var_580_43 < arg_577_1.time_ and arg_577_1.time_ <= var_580_43 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0

				arg_577_1.dialog_:SetActive(true)

				local var_580_45 = LeanTween.value(arg_577_1.dialog_, 0, 1, 0.3)

				var_580_45:setOnUpdate(LuaHelper.FloatAction(function(arg_581_0)
					arg_577_1.dialogCg_.alpha = arg_581_0
				end))
				var_580_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_577_1.dialog_)
					var_580_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_577_1.duration_ = arg_577_1.duration_ + 0.3

				SetActive(arg_577_1.leftNameGo_, true)

				local var_580_46 = arg_577_1:FormatText(StoryNameCfg[74].name)

				arg_577_1.leftNameTxt_.text = var_580_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_577_1.leftNameTxt_.transform)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1.leftNameTxt_.text)
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_47 = arg_577_1:GetWordFromCfg(318041138)
				local var_580_48 = arg_577_1:FormatText(var_580_47.content)

				arg_577_1.text_.text = var_580_48

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_49 = 6
				local var_580_50 = utf8.len(var_580_48)
				local var_580_51 = var_580_49 <= 0 and var_580_44 or var_580_44 * (var_580_50 / var_580_49)

				if var_580_51 > 0 and var_580_44 < var_580_51 then
					arg_577_1.talkMaxDuration = var_580_51
					var_580_43 = var_580_43 + 0.3

					if var_580_51 + var_580_43 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_51 + var_580_43
					end
				end

				arg_577_1.text_.text = var_580_48
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041138", "story_v_out_318041.awb") ~= 0 then
					local var_580_52 = manager.audio:GetVoiceLength("story_v_out_318041", "318041138", "story_v_out_318041.awb") / 1000

					if var_580_52 + var_580_43 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_52 + var_580_43
					end

					if var_580_47.prefab_name ~= "" and arg_577_1.actors_[var_580_47.prefab_name] ~= nil then
						local var_580_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_577_1.actors_[var_580_47.prefab_name].transform, "story_v_out_318041", "318041138", "story_v_out_318041.awb")

						arg_577_1:RecordAudio("318041138", var_580_53)
						arg_577_1:RecordAudio("318041138", var_580_53)
					else
						arg_577_1:AudioAction("play", "voice", "story_v_out_318041", "318041138", "story_v_out_318041.awb")
					end

					arg_577_1:RecordHistoryTalkVoice("story_v_out_318041", "318041138", "story_v_out_318041.awb")
				end

				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_54 = var_580_43 + 0.3
			local var_580_55 = math.max(var_580_44, arg_577_1.talkMaxDuration)

			if var_580_54 <= arg_577_1.time_ and arg_577_1.time_ < var_580_54 + var_580_55 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_54) / var_580_55

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_54 + var_580_55 and arg_577_1.time_ < var_580_54 + var_580_55 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play318041139 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 318041139
		arg_583_1.duration_ = 5

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play318041140(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1050ui_story"]
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 and arg_583_1.var_.characterEffect1050ui_story == nil then
				arg_583_1.var_.characterEffect1050ui_story = var_586_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_2 = 0.200000002980232

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2

				if arg_583_1.var_.characterEffect1050ui_story then
					local var_586_4 = Mathf.Lerp(0, 0.5, var_586_3)

					arg_583_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_583_1.var_.characterEffect1050ui_story.fillRatio = var_586_4
				end
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 and arg_583_1.var_.characterEffect1050ui_story then
				local var_586_5 = 0.5

				arg_583_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_583_1.var_.characterEffect1050ui_story.fillRatio = var_586_5
			end

			local var_586_6 = 0
			local var_586_7 = 0.95

			if var_586_6 < arg_583_1.time_ and arg_583_1.time_ <= var_586_6 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, false)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_8 = arg_583_1:GetWordFromCfg(318041139)
				local var_586_9 = arg_583_1:FormatText(var_586_8.content)

				arg_583_1.text_.text = var_586_9

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_10 = 38
				local var_586_11 = utf8.len(var_586_9)
				local var_586_12 = var_586_10 <= 0 and var_586_7 or var_586_7 * (var_586_11 / var_586_10)

				if var_586_12 > 0 and var_586_7 < var_586_12 then
					arg_583_1.talkMaxDuration = var_586_12

					if var_586_12 + var_586_6 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_12 + var_586_6
					end
				end

				arg_583_1.text_.text = var_586_9
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)
				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_13 = math.max(var_586_7, arg_583_1.talkMaxDuration)

			if var_586_6 <= arg_583_1.time_ and arg_583_1.time_ < var_586_6 + var_586_13 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_6) / var_586_13

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_6 + var_586_13 and arg_583_1.time_ < var_586_6 + var_586_13 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play318041140 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 318041140
		arg_587_1.duration_ = 2.4

		local var_587_0 = {
			zh = 2.166,
			ja = 2.4
		}
		local var_587_1 = manager.audio:GetLocalizationFlag()

		if var_587_0[var_587_1] ~= nil then
			arg_587_1.duration_ = var_587_0[var_587_1]
		end

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play318041141(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = arg_587_1.actors_["10066ui_story"].transform
			local var_590_1 = 0

			if var_590_1 < arg_587_1.time_ and arg_587_1.time_ <= var_590_1 + arg_590_0 then
				arg_587_1.var_.moveOldPos10066ui_story = var_590_0.localPosition
			end

			local var_590_2 = 0.001

			if var_590_1 <= arg_587_1.time_ and arg_587_1.time_ < var_590_1 + var_590_2 then
				local var_590_3 = (arg_587_1.time_ - var_590_1) / var_590_2
				local var_590_4 = Vector3.New(0.7, -0.99, -5.83)

				var_590_0.localPosition = Vector3.Lerp(arg_587_1.var_.moveOldPos10066ui_story, var_590_4, var_590_3)

				local var_590_5 = manager.ui.mainCamera.transform.position - var_590_0.position

				var_590_0.forward = Vector3.New(var_590_5.x, var_590_5.y, var_590_5.z)

				local var_590_6 = var_590_0.localEulerAngles

				var_590_6.z = 0
				var_590_6.x = 0
				var_590_0.localEulerAngles = var_590_6
			end

			if arg_587_1.time_ >= var_590_1 + var_590_2 and arg_587_1.time_ < var_590_1 + var_590_2 + arg_590_0 then
				var_590_0.localPosition = Vector3.New(0.7, -0.99, -5.83)

				local var_590_7 = manager.ui.mainCamera.transform.position - var_590_0.position

				var_590_0.forward = Vector3.New(var_590_7.x, var_590_7.y, var_590_7.z)

				local var_590_8 = var_590_0.localEulerAngles

				var_590_8.z = 0
				var_590_8.x = 0
				var_590_0.localEulerAngles = var_590_8
			end

			local var_590_9 = arg_587_1.actors_["10066ui_story"]
			local var_590_10 = 0

			if var_590_10 < arg_587_1.time_ and arg_587_1.time_ <= var_590_10 + arg_590_0 and arg_587_1.var_.characterEffect10066ui_story == nil then
				arg_587_1.var_.characterEffect10066ui_story = var_590_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_590_11 = 0.200000002980232

			if var_590_10 <= arg_587_1.time_ and arg_587_1.time_ < var_590_10 + var_590_11 then
				local var_590_12 = (arg_587_1.time_ - var_590_10) / var_590_11

				if arg_587_1.var_.characterEffect10066ui_story then
					arg_587_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_587_1.time_ >= var_590_10 + var_590_11 and arg_587_1.time_ < var_590_10 + var_590_11 + arg_590_0 and arg_587_1.var_.characterEffect10066ui_story then
				arg_587_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_590_13 = 0

			if var_590_13 < arg_587_1.time_ and arg_587_1.time_ <= var_590_13 + arg_590_0 then
				arg_587_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_1")
			end

			local var_590_14 = 0

			if var_590_14 < arg_587_1.time_ and arg_587_1.time_ <= var_590_14 + arg_590_0 then
				arg_587_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_590_15 = arg_587_1.actors_["1050ui_story"].transform
			local var_590_16 = 0

			if var_590_16 < arg_587_1.time_ and arg_587_1.time_ <= var_590_16 + arg_590_0 then
				arg_587_1.var_.moveOldPos1050ui_story = var_590_15.localPosition
			end

			local var_590_17 = 0.001

			if var_590_16 <= arg_587_1.time_ and arg_587_1.time_ < var_590_16 + var_590_17 then
				local var_590_18 = (arg_587_1.time_ - var_590_16) / var_590_17
				local var_590_19 = Vector3.New(-0.7, -1, -6.1)

				var_590_15.localPosition = Vector3.Lerp(arg_587_1.var_.moveOldPos1050ui_story, var_590_19, var_590_18)

				local var_590_20 = manager.ui.mainCamera.transform.position - var_590_15.position

				var_590_15.forward = Vector3.New(var_590_20.x, var_590_20.y, var_590_20.z)

				local var_590_21 = var_590_15.localEulerAngles

				var_590_21.z = 0
				var_590_21.x = 0
				var_590_15.localEulerAngles = var_590_21
			end

			if arg_587_1.time_ >= var_590_16 + var_590_17 and arg_587_1.time_ < var_590_16 + var_590_17 + arg_590_0 then
				var_590_15.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_590_22 = manager.ui.mainCamera.transform.position - var_590_15.position

				var_590_15.forward = Vector3.New(var_590_22.x, var_590_22.y, var_590_22.z)

				local var_590_23 = var_590_15.localEulerAngles

				var_590_23.z = 0
				var_590_23.x = 0
				var_590_15.localEulerAngles = var_590_23
			end

			local var_590_24 = 0
			local var_590_25 = 0.1

			if var_590_24 < arg_587_1.time_ and arg_587_1.time_ <= var_590_24 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_26 = arg_587_1:FormatText(StoryNameCfg[640].name)

				arg_587_1.leftNameTxt_.text = var_590_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_27 = arg_587_1:GetWordFromCfg(318041140)
				local var_590_28 = arg_587_1:FormatText(var_590_27.content)

				arg_587_1.text_.text = var_590_28

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_29 = 4
				local var_590_30 = utf8.len(var_590_28)
				local var_590_31 = var_590_29 <= 0 and var_590_25 or var_590_25 * (var_590_30 / var_590_29)

				if var_590_31 > 0 and var_590_25 < var_590_31 then
					arg_587_1.talkMaxDuration = var_590_31

					if var_590_31 + var_590_24 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_31 + var_590_24
					end
				end

				arg_587_1.text_.text = var_590_28
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041140", "story_v_out_318041.awb") ~= 0 then
					local var_590_32 = manager.audio:GetVoiceLength("story_v_out_318041", "318041140", "story_v_out_318041.awb") / 1000

					if var_590_32 + var_590_24 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_32 + var_590_24
					end

					if var_590_27.prefab_name ~= "" and arg_587_1.actors_[var_590_27.prefab_name] ~= nil then
						local var_590_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_587_1.actors_[var_590_27.prefab_name].transform, "story_v_out_318041", "318041140", "story_v_out_318041.awb")

						arg_587_1:RecordAudio("318041140", var_590_33)
						arg_587_1:RecordAudio("318041140", var_590_33)
					else
						arg_587_1:AudioAction("play", "voice", "story_v_out_318041", "318041140", "story_v_out_318041.awb")
					end

					arg_587_1:RecordHistoryTalkVoice("story_v_out_318041", "318041140", "story_v_out_318041.awb")
				end

				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_34 = math.max(var_590_25, arg_587_1.talkMaxDuration)

			if var_590_24 <= arg_587_1.time_ and arg_587_1.time_ < var_590_24 + var_590_34 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_24) / var_590_34

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_24 + var_590_34 and arg_587_1.time_ < var_590_24 + var_590_34 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play318041141 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 318041141
		arg_591_1.duration_ = 5

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play318041142(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = arg_591_1.actors_["10066ui_story"]
			local var_594_1 = 0

			if var_594_1 < arg_591_1.time_ and arg_591_1.time_ <= var_594_1 + arg_594_0 and arg_591_1.var_.characterEffect10066ui_story == nil then
				arg_591_1.var_.characterEffect10066ui_story = var_594_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_2 = 0.200000002980232

			if var_594_1 <= arg_591_1.time_ and arg_591_1.time_ < var_594_1 + var_594_2 then
				local var_594_3 = (arg_591_1.time_ - var_594_1) / var_594_2

				if arg_591_1.var_.characterEffect10066ui_story then
					local var_594_4 = Mathf.Lerp(0, 0.5, var_594_3)

					arg_591_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_591_1.var_.characterEffect10066ui_story.fillRatio = var_594_4
				end
			end

			if arg_591_1.time_ >= var_594_1 + var_594_2 and arg_591_1.time_ < var_594_1 + var_594_2 + arg_594_0 and arg_591_1.var_.characterEffect10066ui_story then
				local var_594_5 = 0.5

				arg_591_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_591_1.var_.characterEffect10066ui_story.fillRatio = var_594_5
			end

			local var_594_6 = 0
			local var_594_7 = 0.35

			if var_594_6 < arg_591_1.time_ and arg_591_1.time_ <= var_594_6 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, false)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_8 = arg_591_1:GetWordFromCfg(318041141)
				local var_594_9 = arg_591_1:FormatText(var_594_8.content)

				arg_591_1.text_.text = var_594_9

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_10 = 14
				local var_594_11 = utf8.len(var_594_9)
				local var_594_12 = var_594_10 <= 0 and var_594_7 or var_594_7 * (var_594_11 / var_594_10)

				if var_594_12 > 0 and var_594_7 < var_594_12 then
					arg_591_1.talkMaxDuration = var_594_12

					if var_594_12 + var_594_6 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_12 + var_594_6
					end
				end

				arg_591_1.text_.text = var_594_9
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)
				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_13 = math.max(var_594_7, arg_591_1.talkMaxDuration)

			if var_594_6 <= arg_591_1.time_ and arg_591_1.time_ < var_594_6 + var_594_13 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_6) / var_594_13

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_6 + var_594_13 and arg_591_1.time_ < var_594_6 + var_594_13 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play318041142 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 318041142
		arg_595_1.duration_ = 4.566

		local var_595_0 = {
			zh = 3.166,
			ja = 4.566
		}
		local var_595_1 = manager.audio:GetLocalizationFlag()

		if var_595_0[var_595_1] ~= nil then
			arg_595_1.duration_ = var_595_0[var_595_1]
		end

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play318041143(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["10066ui_story"]
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 and arg_595_1.var_.characterEffect10066ui_story == nil then
				arg_595_1.var_.characterEffect10066ui_story = var_598_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_2 = 0.200000002980232

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2

				if arg_595_1.var_.characterEffect10066ui_story then
					arg_595_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 and arg_595_1.var_.characterEffect10066ui_story then
				arg_595_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_598_4 = 0

			if var_598_4 < arg_595_1.time_ and arg_595_1.time_ <= var_598_4 + arg_598_0 then
				arg_595_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action3_2")
			end

			local var_598_5 = 0

			if var_598_5 < arg_595_1.time_ and arg_595_1.time_ <= var_598_5 + arg_598_0 then
				arg_595_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_598_6 = 0
			local var_598_7 = 0.25

			if var_598_6 < arg_595_1.time_ and arg_595_1.time_ <= var_598_6 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, true)

				local var_598_8 = arg_595_1:FormatText(StoryNameCfg[640].name)

				arg_595_1.leftNameTxt_.text = var_598_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_595_1.leftNameTxt_.transform)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1.leftNameTxt_.text)
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_9 = arg_595_1:GetWordFromCfg(318041142)
				local var_598_10 = arg_595_1:FormatText(var_598_9.content)

				arg_595_1.text_.text = var_598_10

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_11 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041142", "story_v_out_318041.awb") ~= 0 then
					local var_598_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041142", "story_v_out_318041.awb") / 1000

					if var_598_14 + var_598_6 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_14 + var_598_6
					end

					if var_598_9.prefab_name ~= "" and arg_595_1.actors_[var_598_9.prefab_name] ~= nil then
						local var_598_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_595_1.actors_[var_598_9.prefab_name].transform, "story_v_out_318041", "318041142", "story_v_out_318041.awb")

						arg_595_1:RecordAudio("318041142", var_598_15)
						arg_595_1:RecordAudio("318041142", var_598_15)
					else
						arg_595_1:AudioAction("play", "voice", "story_v_out_318041", "318041142", "story_v_out_318041.awb")
					end

					arg_595_1:RecordHistoryTalkVoice("story_v_out_318041", "318041142", "story_v_out_318041.awb")
				end

				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_16 = math.max(var_598_7, arg_595_1.talkMaxDuration)

			if var_598_6 <= arg_595_1.time_ and arg_595_1.time_ < var_598_6 + var_598_16 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_6) / var_598_16

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_6 + var_598_16 and arg_595_1.time_ < var_598_6 + var_598_16 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play318041143 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 318041143
		arg_599_1.duration_ = 9.8

		local var_599_0 = {
			zh = 6.1,
			ja = 9.8
		}
		local var_599_1 = manager.audio:GetLocalizationFlag()

		if var_599_0[var_599_1] ~= nil then
			arg_599_1.duration_ = var_599_0[var_599_1]
		end

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play318041144(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = 0
			local var_602_1 = 0.825

			if var_602_0 < arg_599_1.time_ and arg_599_1.time_ <= var_602_0 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_2 = arg_599_1:FormatText(StoryNameCfg[640].name)

				arg_599_1.leftNameTxt_.text = var_602_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_3 = arg_599_1:GetWordFromCfg(318041143)
				local var_602_4 = arg_599_1:FormatText(var_602_3.content)

				arg_599_1.text_.text = var_602_4

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_5 = 33
				local var_602_6 = utf8.len(var_602_4)
				local var_602_7 = var_602_5 <= 0 and var_602_1 or var_602_1 * (var_602_6 / var_602_5)

				if var_602_7 > 0 and var_602_1 < var_602_7 then
					arg_599_1.talkMaxDuration = var_602_7

					if var_602_7 + var_602_0 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_7 + var_602_0
					end
				end

				arg_599_1.text_.text = var_602_4
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041143", "story_v_out_318041.awb") ~= 0 then
					local var_602_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041143", "story_v_out_318041.awb") / 1000

					if var_602_8 + var_602_0 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_8 + var_602_0
					end

					if var_602_3.prefab_name ~= "" and arg_599_1.actors_[var_602_3.prefab_name] ~= nil then
						local var_602_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_3.prefab_name].transform, "story_v_out_318041", "318041143", "story_v_out_318041.awb")

						arg_599_1:RecordAudio("318041143", var_602_9)
						arg_599_1:RecordAudio("318041143", var_602_9)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_out_318041", "318041143", "story_v_out_318041.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_out_318041", "318041143", "story_v_out_318041.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_10 = math.max(var_602_1, arg_599_1.talkMaxDuration)

			if var_602_0 <= arg_599_1.time_ and arg_599_1.time_ < var_602_0 + var_602_10 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_0) / var_602_10

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_0 + var_602_10 and arg_599_1.time_ < var_602_0 + var_602_10 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play318041144 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 318041144
		arg_603_1.duration_ = 8.366

		local var_603_0 = {
			zh = 4.466,
			ja = 8.366
		}
		local var_603_1 = manager.audio:GetLocalizationFlag()

		if var_603_0[var_603_1] ~= nil then
			arg_603_1.duration_ = var_603_0[var_603_1]
		end

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play318041145(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 0.575

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_2 = arg_603_1:FormatText(StoryNameCfg[640].name)

				arg_603_1.leftNameTxt_.text = var_606_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_3 = arg_603_1:GetWordFromCfg(318041144)
				local var_606_4 = arg_603_1:FormatText(var_606_3.content)

				arg_603_1.text_.text = var_606_4

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041144", "story_v_out_318041.awb") ~= 0 then
					local var_606_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041144", "story_v_out_318041.awb") / 1000

					if var_606_8 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_8 + var_606_0
					end

					if var_606_3.prefab_name ~= "" and arg_603_1.actors_[var_606_3.prefab_name] ~= nil then
						local var_606_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_603_1.actors_[var_606_3.prefab_name].transform, "story_v_out_318041", "318041144", "story_v_out_318041.awb")

						arg_603_1:RecordAudio("318041144", var_606_9)
						arg_603_1:RecordAudio("318041144", var_606_9)
					else
						arg_603_1:AudioAction("play", "voice", "story_v_out_318041", "318041144", "story_v_out_318041.awb")
					end

					arg_603_1:RecordHistoryTalkVoice("story_v_out_318041", "318041144", "story_v_out_318041.awb")
				end

				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_10 = math.max(var_606_1, arg_603_1.talkMaxDuration)

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_10 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_0) / var_606_10

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_0 + var_606_10 and arg_603_1.time_ < var_606_0 + var_606_10 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play318041145 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 318041145
		arg_607_1.duration_ = 7.766

		local var_607_0 = {
			zh = 3.733,
			ja = 7.766
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
				arg_607_0:Play318041146(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = 0
			local var_610_1 = 0.425

			if var_610_0 < arg_607_1.time_ and arg_607_1.time_ <= var_610_0 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_2 = arg_607_1:FormatText(StoryNameCfg[640].name)

				arg_607_1.leftNameTxt_.text = var_610_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_3 = arg_607_1:GetWordFromCfg(318041145)
				local var_610_4 = arg_607_1:FormatText(var_610_3.content)

				arg_607_1.text_.text = var_610_4

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041145", "story_v_out_318041.awb") ~= 0 then
					local var_610_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041145", "story_v_out_318041.awb") / 1000

					if var_610_8 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_8 + var_610_0
					end

					if var_610_3.prefab_name ~= "" and arg_607_1.actors_[var_610_3.prefab_name] ~= nil then
						local var_610_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_3.prefab_name].transform, "story_v_out_318041", "318041145", "story_v_out_318041.awb")

						arg_607_1:RecordAudio("318041145", var_610_9)
						arg_607_1:RecordAudio("318041145", var_610_9)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_out_318041", "318041145", "story_v_out_318041.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_out_318041", "318041145", "story_v_out_318041.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_10 = math.max(var_610_1, arg_607_1.talkMaxDuration)

			if var_610_0 <= arg_607_1.time_ and arg_607_1.time_ < var_610_0 + var_610_10 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_0) / var_610_10

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_0 + var_610_10 and arg_607_1.time_ < var_610_0 + var_610_10 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play318041146 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 318041146
		arg_611_1.duration_ = 4.533

		local var_611_0 = {
			zh = 4.533,
			ja = 2.6
		}
		local var_611_1 = manager.audio:GetLocalizationFlag()

		if var_611_0[var_611_1] ~= nil then
			arg_611_1.duration_ = var_611_0[var_611_1]
		end

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play318041147(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["1050ui_story"]
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 and arg_611_1.var_.characterEffect1050ui_story == nil then
				arg_611_1.var_.characterEffect1050ui_story = var_614_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_614_2 = 0.200000002980232

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_2 then
				local var_614_3 = (arg_611_1.time_ - var_614_1) / var_614_2

				if arg_611_1.var_.characterEffect1050ui_story then
					arg_611_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_611_1.time_ >= var_614_1 + var_614_2 and arg_611_1.time_ < var_614_1 + var_614_2 + arg_614_0 and arg_611_1.var_.characterEffect1050ui_story then
				arg_611_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_614_4 = 0

			if var_614_4 < arg_611_1.time_ and arg_611_1.time_ <= var_614_4 + arg_614_0 then
				arg_611_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_614_5 = 0

			if var_614_5 < arg_611_1.time_ and arg_611_1.time_ <= var_614_5 + arg_614_0 then
				arg_611_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_614_6 = arg_611_1.actors_["10066ui_story"]
			local var_614_7 = 0

			if var_614_7 < arg_611_1.time_ and arg_611_1.time_ <= var_614_7 + arg_614_0 and arg_611_1.var_.characterEffect10066ui_story == nil then
				arg_611_1.var_.characterEffect10066ui_story = var_614_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_614_8 = 0.200000002980232

			if var_614_7 <= arg_611_1.time_ and arg_611_1.time_ < var_614_7 + var_614_8 then
				local var_614_9 = (arg_611_1.time_ - var_614_7) / var_614_8

				if arg_611_1.var_.characterEffect10066ui_story then
					local var_614_10 = Mathf.Lerp(0, 0.5, var_614_9)

					arg_611_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_611_1.var_.characterEffect10066ui_story.fillRatio = var_614_10
				end
			end

			if arg_611_1.time_ >= var_614_7 + var_614_8 and arg_611_1.time_ < var_614_7 + var_614_8 + arg_614_0 and arg_611_1.var_.characterEffect10066ui_story then
				local var_614_11 = 0.5

				arg_611_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_611_1.var_.characterEffect10066ui_story.fillRatio = var_614_11
			end

			local var_614_12 = 0
			local var_614_13 = 0.375

			if var_614_12 < arg_611_1.time_ and arg_611_1.time_ <= var_614_12 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_14 = arg_611_1:FormatText(StoryNameCfg[74].name)

				arg_611_1.leftNameTxt_.text = var_614_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_15 = arg_611_1:GetWordFromCfg(318041146)
				local var_614_16 = arg_611_1:FormatText(var_614_15.content)

				arg_611_1.text_.text = var_614_16

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_17 = 15
				local var_614_18 = utf8.len(var_614_16)
				local var_614_19 = var_614_17 <= 0 and var_614_13 or var_614_13 * (var_614_18 / var_614_17)

				if var_614_19 > 0 and var_614_13 < var_614_19 then
					arg_611_1.talkMaxDuration = var_614_19

					if var_614_19 + var_614_12 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_19 + var_614_12
					end
				end

				arg_611_1.text_.text = var_614_16
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041146", "story_v_out_318041.awb") ~= 0 then
					local var_614_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041146", "story_v_out_318041.awb") / 1000

					if var_614_20 + var_614_12 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_20 + var_614_12
					end

					if var_614_15.prefab_name ~= "" and arg_611_1.actors_[var_614_15.prefab_name] ~= nil then
						local var_614_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_611_1.actors_[var_614_15.prefab_name].transform, "story_v_out_318041", "318041146", "story_v_out_318041.awb")

						arg_611_1:RecordAudio("318041146", var_614_21)
						arg_611_1:RecordAudio("318041146", var_614_21)
					else
						arg_611_1:AudioAction("play", "voice", "story_v_out_318041", "318041146", "story_v_out_318041.awb")
					end

					arg_611_1:RecordHistoryTalkVoice("story_v_out_318041", "318041146", "story_v_out_318041.awb")
				end

				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_22 = math.max(var_614_13, arg_611_1.talkMaxDuration)

			if var_614_12 <= arg_611_1.time_ and arg_611_1.time_ < var_614_12 + var_614_22 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_12) / var_614_22

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_12 + var_614_22 and arg_611_1.time_ < var_614_12 + var_614_22 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play318041147 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 318041147
		arg_615_1.duration_ = 5

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play318041148(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = arg_615_1.actors_["1050ui_story"]
			local var_618_1 = 0

			if var_618_1 < arg_615_1.time_ and arg_615_1.time_ <= var_618_1 + arg_618_0 and arg_615_1.var_.characterEffect1050ui_story == nil then
				arg_615_1.var_.characterEffect1050ui_story = var_618_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_618_2 = 0.200000002980232

			if var_618_1 <= arg_615_1.time_ and arg_615_1.time_ < var_618_1 + var_618_2 then
				local var_618_3 = (arg_615_1.time_ - var_618_1) / var_618_2

				if arg_615_1.var_.characterEffect1050ui_story then
					local var_618_4 = Mathf.Lerp(0, 0.5, var_618_3)

					arg_615_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_615_1.var_.characterEffect1050ui_story.fillRatio = var_618_4
				end
			end

			if arg_615_1.time_ >= var_618_1 + var_618_2 and arg_615_1.time_ < var_618_1 + var_618_2 + arg_618_0 and arg_615_1.var_.characterEffect1050ui_story then
				local var_618_5 = 0.5

				arg_615_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_615_1.var_.characterEffect1050ui_story.fillRatio = var_618_5
			end

			local var_618_6 = 0
			local var_618_7 = 0.8

			if var_618_6 < arg_615_1.time_ and arg_615_1.time_ <= var_618_6 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, false)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_8 = arg_615_1:GetWordFromCfg(318041147)
				local var_618_9 = arg_615_1:FormatText(var_618_8.content)

				arg_615_1.text_.text = var_618_9

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_10 = 32
				local var_618_11 = utf8.len(var_618_9)
				local var_618_12 = var_618_10 <= 0 and var_618_7 or var_618_7 * (var_618_11 / var_618_10)

				if var_618_12 > 0 and var_618_7 < var_618_12 then
					arg_615_1.talkMaxDuration = var_618_12

					if var_618_12 + var_618_6 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_12 + var_618_6
					end
				end

				arg_615_1.text_.text = var_618_9
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)
				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_13 = math.max(var_618_7, arg_615_1.talkMaxDuration)

			if var_618_6 <= arg_615_1.time_ and arg_615_1.time_ < var_618_6 + var_618_13 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_6) / var_618_13

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_6 + var_618_13 and arg_615_1.time_ < var_618_6 + var_618_13 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play318041148 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 318041148
		arg_619_1.duration_ = 9.633

		local var_619_0 = {
			zh = 3.5,
			ja = 9.633
		}
		local var_619_1 = manager.audio:GetLocalizationFlag()

		if var_619_0[var_619_1] ~= nil then
			arg_619_1.duration_ = var_619_0[var_619_1]
		end

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play318041149(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = arg_619_1.actors_["1050ui_story"]
			local var_622_1 = 0

			if var_622_1 < arg_619_1.time_ and arg_619_1.time_ <= var_622_1 + arg_622_0 and arg_619_1.var_.characterEffect1050ui_story == nil then
				arg_619_1.var_.characterEffect1050ui_story = var_622_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_622_2 = 0.200000002980232

			if var_622_1 <= arg_619_1.time_ and arg_619_1.time_ < var_622_1 + var_622_2 then
				local var_622_3 = (arg_619_1.time_ - var_622_1) / var_622_2

				if arg_619_1.var_.characterEffect1050ui_story then
					arg_619_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_619_1.time_ >= var_622_1 + var_622_2 and arg_619_1.time_ < var_622_1 + var_622_2 + arg_622_0 and arg_619_1.var_.characterEffect1050ui_story then
				arg_619_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_622_4 = 0

			if var_622_4 < arg_619_1.time_ and arg_619_1.time_ <= var_622_4 + arg_622_0 then
				arg_619_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action4_1")
			end

			local var_622_5 = 0

			if var_622_5 < arg_619_1.time_ and arg_619_1.time_ <= var_622_5 + arg_622_0 then
				arg_619_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_622_6 = 0
			local var_622_7 = 0.35

			if var_622_6 < arg_619_1.time_ and arg_619_1.time_ <= var_622_6 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_8 = arg_619_1:FormatText(StoryNameCfg[74].name)

				arg_619_1.leftNameTxt_.text = var_622_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_9 = arg_619_1:GetWordFromCfg(318041148)
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

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041148", "story_v_out_318041.awb") ~= 0 then
					local var_622_14 = manager.audio:GetVoiceLength("story_v_out_318041", "318041148", "story_v_out_318041.awb") / 1000

					if var_622_14 + var_622_6 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_14 + var_622_6
					end

					if var_622_9.prefab_name ~= "" and arg_619_1.actors_[var_622_9.prefab_name] ~= nil then
						local var_622_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_619_1.actors_[var_622_9.prefab_name].transform, "story_v_out_318041", "318041148", "story_v_out_318041.awb")

						arg_619_1:RecordAudio("318041148", var_622_15)
						arg_619_1:RecordAudio("318041148", var_622_15)
					else
						arg_619_1:AudioAction("play", "voice", "story_v_out_318041", "318041148", "story_v_out_318041.awb")
					end

					arg_619_1:RecordHistoryTalkVoice("story_v_out_318041", "318041148", "story_v_out_318041.awb")
				end

				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_16 = math.max(var_622_7, arg_619_1.talkMaxDuration)

			if var_622_6 <= arg_619_1.time_ and arg_619_1.time_ < var_622_6 + var_622_16 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_6) / var_622_16

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_6 + var_622_16 and arg_619_1.time_ < var_622_6 + var_622_16 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play318041149 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 318041149
		arg_623_1.duration_ = 2.6

		local var_623_0 = {
			zh = 2.066,
			ja = 2.6
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
				arg_623_0:Play318041150(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = arg_623_1.actors_["10066ui_story"]
			local var_626_1 = 0

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 and arg_623_1.var_.characterEffect10066ui_story == nil then
				arg_623_1.var_.characterEffect10066ui_story = var_626_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_2 = 0.200000002980232

			if var_626_1 <= arg_623_1.time_ and arg_623_1.time_ < var_626_1 + var_626_2 then
				local var_626_3 = (arg_623_1.time_ - var_626_1) / var_626_2

				if arg_623_1.var_.characterEffect10066ui_story then
					arg_623_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_1 + var_626_2 and arg_623_1.time_ < var_626_1 + var_626_2 + arg_626_0 and arg_623_1.var_.characterEffect10066ui_story then
				arg_623_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_626_4 = 0

			if var_626_4 < arg_623_1.time_ and arg_623_1.time_ <= var_626_4 + arg_626_0 then
				arg_623_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_626_5 = arg_623_1.actors_["1050ui_story"]
			local var_626_6 = 0

			if var_626_6 < arg_623_1.time_ and arg_623_1.time_ <= var_626_6 + arg_626_0 and arg_623_1.var_.characterEffect1050ui_story == nil then
				arg_623_1.var_.characterEffect1050ui_story = var_626_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_7 = 0.200000002980232

			if var_626_6 <= arg_623_1.time_ and arg_623_1.time_ < var_626_6 + var_626_7 then
				local var_626_8 = (arg_623_1.time_ - var_626_6) / var_626_7

				if arg_623_1.var_.characterEffect1050ui_story then
					local var_626_9 = Mathf.Lerp(0, 0.5, var_626_8)

					arg_623_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_623_1.var_.characterEffect1050ui_story.fillRatio = var_626_9
				end
			end

			if arg_623_1.time_ >= var_626_6 + var_626_7 and arg_623_1.time_ < var_626_6 + var_626_7 + arg_626_0 and arg_623_1.var_.characterEffect1050ui_story then
				local var_626_10 = 0.5

				arg_623_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_623_1.var_.characterEffect1050ui_story.fillRatio = var_626_10
			end

			local var_626_11 = 0
			local var_626_12 = 0.2

			if var_626_11 < arg_623_1.time_ and arg_623_1.time_ <= var_626_11 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_13 = arg_623_1:FormatText(StoryNameCfg[640].name)

				arg_623_1.leftNameTxt_.text = var_626_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_14 = arg_623_1:GetWordFromCfg(318041149)
				local var_626_15 = arg_623_1:FormatText(var_626_14.content)

				arg_623_1.text_.text = var_626_15

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_16 = 8
				local var_626_17 = utf8.len(var_626_15)
				local var_626_18 = var_626_16 <= 0 and var_626_12 or var_626_12 * (var_626_17 / var_626_16)

				if var_626_18 > 0 and var_626_12 < var_626_18 then
					arg_623_1.talkMaxDuration = var_626_18

					if var_626_18 + var_626_11 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_18 + var_626_11
					end
				end

				arg_623_1.text_.text = var_626_15
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041149", "story_v_out_318041.awb") ~= 0 then
					local var_626_19 = manager.audio:GetVoiceLength("story_v_out_318041", "318041149", "story_v_out_318041.awb") / 1000

					if var_626_19 + var_626_11 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_19 + var_626_11
					end

					if var_626_14.prefab_name ~= "" and arg_623_1.actors_[var_626_14.prefab_name] ~= nil then
						local var_626_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_14.prefab_name].transform, "story_v_out_318041", "318041149", "story_v_out_318041.awb")

						arg_623_1:RecordAudio("318041149", var_626_20)
						arg_623_1:RecordAudio("318041149", var_626_20)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_318041", "318041149", "story_v_out_318041.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_318041", "318041149", "story_v_out_318041.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_21 = math.max(var_626_12, arg_623_1.talkMaxDuration)

			if var_626_11 <= arg_623_1.time_ and arg_623_1.time_ < var_626_11 + var_626_21 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_11) / var_626_21

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_11 + var_626_21 and arg_623_1.time_ < var_626_11 + var_626_21 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play318041150 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 318041150
		arg_627_1.duration_ = 1.6

		local var_627_0 = {
			zh = 1.6,
			ja = 1.333
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
				arg_627_0:Play318041151(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["1050ui_story"]
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 and arg_627_1.var_.characterEffect1050ui_story == nil then
				arg_627_1.var_.characterEffect1050ui_story = var_630_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_2 = 0.200000002980232

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2

				if arg_627_1.var_.characterEffect1050ui_story then
					arg_627_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 and arg_627_1.var_.characterEffect1050ui_story then
				arg_627_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_630_4 = arg_627_1.actors_["10066ui_story"]
			local var_630_5 = 0

			if var_630_5 < arg_627_1.time_ and arg_627_1.time_ <= var_630_5 + arg_630_0 and arg_627_1.var_.characterEffect10066ui_story == nil then
				arg_627_1.var_.characterEffect10066ui_story = var_630_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_6 = 0.200000002980232

			if var_630_5 <= arg_627_1.time_ and arg_627_1.time_ < var_630_5 + var_630_6 then
				local var_630_7 = (arg_627_1.time_ - var_630_5) / var_630_6

				if arg_627_1.var_.characterEffect10066ui_story then
					local var_630_8 = Mathf.Lerp(0, 0.5, var_630_7)

					arg_627_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_627_1.var_.characterEffect10066ui_story.fillRatio = var_630_8
				end
			end

			if arg_627_1.time_ >= var_630_5 + var_630_6 and arg_627_1.time_ < var_630_5 + var_630_6 + arg_630_0 and arg_627_1.var_.characterEffect10066ui_story then
				local var_630_9 = 0.5

				arg_627_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_627_1.var_.characterEffect10066ui_story.fillRatio = var_630_9
			end

			local var_630_10 = 0
			local var_630_11 = 0.225

			if var_630_10 < arg_627_1.time_ and arg_627_1.time_ <= var_630_10 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_12 = arg_627_1:FormatText(StoryNameCfg[74].name)

				arg_627_1.leftNameTxt_.text = var_630_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_13 = arg_627_1:GetWordFromCfg(318041150)
				local var_630_14 = arg_627_1:FormatText(var_630_13.content)

				arg_627_1.text_.text = var_630_14

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_15 = 9
				local var_630_16 = utf8.len(var_630_14)
				local var_630_17 = var_630_15 <= 0 and var_630_11 or var_630_11 * (var_630_16 / var_630_15)

				if var_630_17 > 0 and var_630_11 < var_630_17 then
					arg_627_1.talkMaxDuration = var_630_17

					if var_630_17 + var_630_10 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_17 + var_630_10
					end
				end

				arg_627_1.text_.text = var_630_14
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041150", "story_v_out_318041.awb") ~= 0 then
					local var_630_18 = manager.audio:GetVoiceLength("story_v_out_318041", "318041150", "story_v_out_318041.awb") / 1000

					if var_630_18 + var_630_10 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_18 + var_630_10
					end

					if var_630_13.prefab_name ~= "" and arg_627_1.actors_[var_630_13.prefab_name] ~= nil then
						local var_630_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_13.prefab_name].transform, "story_v_out_318041", "318041150", "story_v_out_318041.awb")

						arg_627_1:RecordAudio("318041150", var_630_19)
						arg_627_1:RecordAudio("318041150", var_630_19)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_out_318041", "318041150", "story_v_out_318041.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_out_318041", "318041150", "story_v_out_318041.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_20 = math.max(var_630_11, arg_627_1.talkMaxDuration)

			if var_630_10 <= arg_627_1.time_ and arg_627_1.time_ < var_630_10 + var_630_20 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_10) / var_630_20

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_10 + var_630_20 and arg_627_1.time_ < var_630_10 + var_630_20 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play318041151 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 318041151
		arg_631_1.duration_ = 14.4

		local var_631_0 = {
			zh = 4.433,
			ja = 14.4
		}
		local var_631_1 = manager.audio:GetLocalizationFlag()

		if var_631_0[var_631_1] ~= nil then
			arg_631_1.duration_ = var_631_0[var_631_1]
		end

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play318041152(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["10066ui_story"]
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 and arg_631_1.var_.characterEffect10066ui_story == nil then
				arg_631_1.var_.characterEffect10066ui_story = var_634_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_2 = 0.200000002980232

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2

				if arg_631_1.var_.characterEffect10066ui_story then
					arg_631_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 and arg_631_1.var_.characterEffect10066ui_story then
				arg_631_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_634_4 = 0

			if var_634_4 < arg_631_1.time_ and arg_631_1.time_ <= var_634_4 + arg_634_0 then
				arg_631_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action6_1")
			end

			local var_634_5 = 0

			if var_634_5 < arg_631_1.time_ and arg_631_1.time_ <= var_634_5 + arg_634_0 then
				arg_631_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_634_6 = arg_631_1.actors_["1050ui_story"]
			local var_634_7 = 0

			if var_634_7 < arg_631_1.time_ and arg_631_1.time_ <= var_634_7 + arg_634_0 and arg_631_1.var_.characterEffect1050ui_story == nil then
				arg_631_1.var_.characterEffect1050ui_story = var_634_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_8 = 0.200000002980232

			if var_634_7 <= arg_631_1.time_ and arg_631_1.time_ < var_634_7 + var_634_8 then
				local var_634_9 = (arg_631_1.time_ - var_634_7) / var_634_8

				if arg_631_1.var_.characterEffect1050ui_story then
					local var_634_10 = Mathf.Lerp(0, 0.5, var_634_9)

					arg_631_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_631_1.var_.characterEffect1050ui_story.fillRatio = var_634_10
				end
			end

			if arg_631_1.time_ >= var_634_7 + var_634_8 and arg_631_1.time_ < var_634_7 + var_634_8 + arg_634_0 and arg_631_1.var_.characterEffect1050ui_story then
				local var_634_11 = 0.5

				arg_631_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_631_1.var_.characterEffect1050ui_story.fillRatio = var_634_11
			end

			local var_634_12 = 0
			local var_634_13 = 0.5

			if var_634_12 < arg_631_1.time_ and arg_631_1.time_ <= var_634_12 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_14 = arg_631_1:FormatText(StoryNameCfg[640].name)

				arg_631_1.leftNameTxt_.text = var_634_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_15 = arg_631_1:GetWordFromCfg(318041151)
				local var_634_16 = arg_631_1:FormatText(var_634_15.content)

				arg_631_1.text_.text = var_634_16

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_17 = 20
				local var_634_18 = utf8.len(var_634_16)
				local var_634_19 = var_634_17 <= 0 and var_634_13 or var_634_13 * (var_634_18 / var_634_17)

				if var_634_19 > 0 and var_634_13 < var_634_19 then
					arg_631_1.talkMaxDuration = var_634_19

					if var_634_19 + var_634_12 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_19 + var_634_12
					end
				end

				arg_631_1.text_.text = var_634_16
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041151", "story_v_out_318041.awb") ~= 0 then
					local var_634_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041151", "story_v_out_318041.awb") / 1000

					if var_634_20 + var_634_12 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_20 + var_634_12
					end

					if var_634_15.prefab_name ~= "" and arg_631_1.actors_[var_634_15.prefab_name] ~= nil then
						local var_634_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_15.prefab_name].transform, "story_v_out_318041", "318041151", "story_v_out_318041.awb")

						arg_631_1:RecordAudio("318041151", var_634_21)
						arg_631_1:RecordAudio("318041151", var_634_21)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_out_318041", "318041151", "story_v_out_318041.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_out_318041", "318041151", "story_v_out_318041.awb")
				end

				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_22 = math.max(var_634_13, arg_631_1.talkMaxDuration)

			if var_634_12 <= arg_631_1.time_ and arg_631_1.time_ < var_634_12 + var_634_22 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_12) / var_634_22

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_12 + var_634_22 and arg_631_1.time_ < var_634_12 + var_634_22 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play318041152 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 318041152
		arg_635_1.duration_ = 5.9

		local var_635_0 = {
			zh = 1.633,
			ja = 5.9
		}
		local var_635_1 = manager.audio:GetLocalizationFlag()

		if var_635_0[var_635_1] ~= nil then
			arg_635_1.duration_ = var_635_0[var_635_1]
		end

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play318041153(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1050ui_story"]
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 and arg_635_1.var_.characterEffect1050ui_story == nil then
				arg_635_1.var_.characterEffect1050ui_story = var_638_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_2 = 0.200000002980232

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2

				if arg_635_1.var_.characterEffect1050ui_story then
					arg_635_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 and arg_635_1.var_.characterEffect1050ui_story then
				arg_635_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_638_4 = arg_635_1.actors_["10066ui_story"]
			local var_638_5 = 0

			if var_638_5 < arg_635_1.time_ and arg_635_1.time_ <= var_638_5 + arg_638_0 and arg_635_1.var_.characterEffect10066ui_story == nil then
				arg_635_1.var_.characterEffect10066ui_story = var_638_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_6 = 0.200000002980232

			if var_638_5 <= arg_635_1.time_ and arg_635_1.time_ < var_638_5 + var_638_6 then
				local var_638_7 = (arg_635_1.time_ - var_638_5) / var_638_6

				if arg_635_1.var_.characterEffect10066ui_story then
					local var_638_8 = Mathf.Lerp(0, 0.5, var_638_7)

					arg_635_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_635_1.var_.characterEffect10066ui_story.fillRatio = var_638_8
				end
			end

			if arg_635_1.time_ >= var_638_5 + var_638_6 and arg_635_1.time_ < var_638_5 + var_638_6 + arg_638_0 and arg_635_1.var_.characterEffect10066ui_story then
				local var_638_9 = 0.5

				arg_635_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_635_1.var_.characterEffect10066ui_story.fillRatio = var_638_9
			end

			local var_638_10 = 0
			local var_638_11 = 0.175

			if var_638_10 < arg_635_1.time_ and arg_635_1.time_ <= var_638_10 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_12 = arg_635_1:FormatText(StoryNameCfg[74].name)

				arg_635_1.leftNameTxt_.text = var_638_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_13 = arg_635_1:GetWordFromCfg(318041152)
				local var_638_14 = arg_635_1:FormatText(var_638_13.content)

				arg_635_1.text_.text = var_638_14

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_15 = 7
				local var_638_16 = utf8.len(var_638_14)
				local var_638_17 = var_638_15 <= 0 and var_638_11 or var_638_11 * (var_638_16 / var_638_15)

				if var_638_17 > 0 and var_638_11 < var_638_17 then
					arg_635_1.talkMaxDuration = var_638_17

					if var_638_17 + var_638_10 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_17 + var_638_10
					end
				end

				arg_635_1.text_.text = var_638_14
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041152", "story_v_out_318041.awb") ~= 0 then
					local var_638_18 = manager.audio:GetVoiceLength("story_v_out_318041", "318041152", "story_v_out_318041.awb") / 1000

					if var_638_18 + var_638_10 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_18 + var_638_10
					end

					if var_638_13.prefab_name ~= "" and arg_635_1.actors_[var_638_13.prefab_name] ~= nil then
						local var_638_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_635_1.actors_[var_638_13.prefab_name].transform, "story_v_out_318041", "318041152", "story_v_out_318041.awb")

						arg_635_1:RecordAudio("318041152", var_638_19)
						arg_635_1:RecordAudio("318041152", var_638_19)
					else
						arg_635_1:AudioAction("play", "voice", "story_v_out_318041", "318041152", "story_v_out_318041.awb")
					end

					arg_635_1:RecordHistoryTalkVoice("story_v_out_318041", "318041152", "story_v_out_318041.awb")
				end

				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_20 = math.max(var_638_11, arg_635_1.talkMaxDuration)

			if var_638_10 <= arg_635_1.time_ and arg_635_1.time_ < var_638_10 + var_638_20 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_10) / var_638_20

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_10 + var_638_20 and arg_635_1.time_ < var_638_10 + var_638_20 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play318041153 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 318041153
		arg_639_1.duration_ = 10.033

		local var_639_0 = {
			zh = 4.233,
			ja = 10.033
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
				arg_639_0:Play318041154(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = arg_639_1.actors_["10066ui_story"]
			local var_642_1 = 0

			if var_642_1 < arg_639_1.time_ and arg_639_1.time_ <= var_642_1 + arg_642_0 and arg_639_1.var_.characterEffect10066ui_story == nil then
				arg_639_1.var_.characterEffect10066ui_story = var_642_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_2 = 0.200000002980232

			if var_642_1 <= arg_639_1.time_ and arg_639_1.time_ < var_642_1 + var_642_2 then
				local var_642_3 = (arg_639_1.time_ - var_642_1) / var_642_2

				if arg_639_1.var_.characterEffect10066ui_story then
					arg_639_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_639_1.time_ >= var_642_1 + var_642_2 and arg_639_1.time_ < var_642_1 + var_642_2 + arg_642_0 and arg_639_1.var_.characterEffect10066ui_story then
				arg_639_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_642_4 = 0

			if var_642_4 < arg_639_1.time_ and arg_639_1.time_ <= var_642_4 + arg_642_0 then
				arg_639_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action6_2")
			end

			local var_642_5 = 0

			if var_642_5 < arg_639_1.time_ and arg_639_1.time_ <= var_642_5 + arg_642_0 then
				arg_639_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_642_6 = arg_639_1.actors_["1050ui_story"]
			local var_642_7 = 0

			if var_642_7 < arg_639_1.time_ and arg_639_1.time_ <= var_642_7 + arg_642_0 and arg_639_1.var_.characterEffect1050ui_story == nil then
				arg_639_1.var_.characterEffect1050ui_story = var_642_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_8 = 0.200000002980232

			if var_642_7 <= arg_639_1.time_ and arg_639_1.time_ < var_642_7 + var_642_8 then
				local var_642_9 = (arg_639_1.time_ - var_642_7) / var_642_8

				if arg_639_1.var_.characterEffect1050ui_story then
					local var_642_10 = Mathf.Lerp(0, 0.5, var_642_9)

					arg_639_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_639_1.var_.characterEffect1050ui_story.fillRatio = var_642_10
				end
			end

			if arg_639_1.time_ >= var_642_7 + var_642_8 and arg_639_1.time_ < var_642_7 + var_642_8 + arg_642_0 and arg_639_1.var_.characterEffect1050ui_story then
				local var_642_11 = 0.5

				arg_639_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_639_1.var_.characterEffect1050ui_story.fillRatio = var_642_11
			end

			local var_642_12 = 0
			local var_642_13 = 0.475

			if var_642_12 < arg_639_1.time_ and arg_639_1.time_ <= var_642_12 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_14 = arg_639_1:FormatText(StoryNameCfg[640].name)

				arg_639_1.leftNameTxt_.text = var_642_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_15 = arg_639_1:GetWordFromCfg(318041153)
				local var_642_16 = arg_639_1:FormatText(var_642_15.content)

				arg_639_1.text_.text = var_642_16

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_17 = 19
				local var_642_18 = utf8.len(var_642_16)
				local var_642_19 = var_642_17 <= 0 and var_642_13 or var_642_13 * (var_642_18 / var_642_17)

				if var_642_19 > 0 and var_642_13 < var_642_19 then
					arg_639_1.talkMaxDuration = var_642_19

					if var_642_19 + var_642_12 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_19 + var_642_12
					end
				end

				arg_639_1.text_.text = var_642_16
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041153", "story_v_out_318041.awb") ~= 0 then
					local var_642_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041153", "story_v_out_318041.awb") / 1000

					if var_642_20 + var_642_12 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_20 + var_642_12
					end

					if var_642_15.prefab_name ~= "" and arg_639_1.actors_[var_642_15.prefab_name] ~= nil then
						local var_642_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_639_1.actors_[var_642_15.prefab_name].transform, "story_v_out_318041", "318041153", "story_v_out_318041.awb")

						arg_639_1:RecordAudio("318041153", var_642_21)
						arg_639_1:RecordAudio("318041153", var_642_21)
					else
						arg_639_1:AudioAction("play", "voice", "story_v_out_318041", "318041153", "story_v_out_318041.awb")
					end

					arg_639_1:RecordHistoryTalkVoice("story_v_out_318041", "318041153", "story_v_out_318041.awb")
				end

				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_22 = math.max(var_642_13, arg_639_1.talkMaxDuration)

			if var_642_12 <= arg_639_1.time_ and arg_639_1.time_ < var_642_12 + var_642_22 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_12) / var_642_22

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_12 + var_642_22 and arg_639_1.time_ < var_642_12 + var_642_22 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play318041154 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 318041154
		arg_643_1.duration_ = 9.3

		local var_643_0 = {
			zh = 8.6,
			ja = 9.3
		}
		local var_643_1 = manager.audio:GetLocalizationFlag()

		if var_643_0[var_643_1] ~= nil then
			arg_643_1.duration_ = var_643_0[var_643_1]
		end

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play318041155(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["1050ui_story"]
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 and arg_643_1.var_.characterEffect1050ui_story == nil then
				arg_643_1.var_.characterEffect1050ui_story = var_646_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_2 = 0.200000002980232

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2

				if arg_643_1.var_.characterEffect1050ui_story then
					arg_643_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 and arg_643_1.var_.characterEffect1050ui_story then
				arg_643_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_646_4 = 0

			if var_646_4 < arg_643_1.time_ and arg_643_1.time_ <= var_646_4 + arg_646_0 then
				arg_643_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action4_2")
			end

			local var_646_5 = 0

			if var_646_5 < arg_643_1.time_ and arg_643_1.time_ <= var_646_5 + arg_646_0 then
				arg_643_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_646_6 = arg_643_1.actors_["10066ui_story"]
			local var_646_7 = 0

			if var_646_7 < arg_643_1.time_ and arg_643_1.time_ <= var_646_7 + arg_646_0 and arg_643_1.var_.characterEffect10066ui_story == nil then
				arg_643_1.var_.characterEffect10066ui_story = var_646_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_8 = 0.200000002980232

			if var_646_7 <= arg_643_1.time_ and arg_643_1.time_ < var_646_7 + var_646_8 then
				local var_646_9 = (arg_643_1.time_ - var_646_7) / var_646_8

				if arg_643_1.var_.characterEffect10066ui_story then
					local var_646_10 = Mathf.Lerp(0, 0.5, var_646_9)

					arg_643_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_643_1.var_.characterEffect10066ui_story.fillRatio = var_646_10
				end
			end

			if arg_643_1.time_ >= var_646_7 + var_646_8 and arg_643_1.time_ < var_646_7 + var_646_8 + arg_646_0 and arg_643_1.var_.characterEffect10066ui_story then
				local var_646_11 = 0.5

				arg_643_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_643_1.var_.characterEffect10066ui_story.fillRatio = var_646_11
			end

			local var_646_12 = 0
			local var_646_13 = 0.875

			if var_646_12 < arg_643_1.time_ and arg_643_1.time_ <= var_646_12 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_14 = arg_643_1:FormatText(StoryNameCfg[74].name)

				arg_643_1.leftNameTxt_.text = var_646_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_15 = arg_643_1:GetWordFromCfg(318041154)
				local var_646_16 = arg_643_1:FormatText(var_646_15.content)

				arg_643_1.text_.text = var_646_16

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_17 = 35
				local var_646_18 = utf8.len(var_646_16)
				local var_646_19 = var_646_17 <= 0 and var_646_13 or var_646_13 * (var_646_18 / var_646_17)

				if var_646_19 > 0 and var_646_13 < var_646_19 then
					arg_643_1.talkMaxDuration = var_646_19

					if var_646_19 + var_646_12 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_19 + var_646_12
					end
				end

				arg_643_1.text_.text = var_646_16
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041154", "story_v_out_318041.awb") ~= 0 then
					local var_646_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041154", "story_v_out_318041.awb") / 1000

					if var_646_20 + var_646_12 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_20 + var_646_12
					end

					if var_646_15.prefab_name ~= "" and arg_643_1.actors_[var_646_15.prefab_name] ~= nil then
						local var_646_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_15.prefab_name].transform, "story_v_out_318041", "318041154", "story_v_out_318041.awb")

						arg_643_1:RecordAudio("318041154", var_646_21)
						arg_643_1:RecordAudio("318041154", var_646_21)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_out_318041", "318041154", "story_v_out_318041.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_out_318041", "318041154", "story_v_out_318041.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_22 = math.max(var_646_13, arg_643_1.talkMaxDuration)

			if var_646_12 <= arg_643_1.time_ and arg_643_1.time_ < var_646_12 + var_646_22 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_12) / var_646_22

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_12 + var_646_22 and arg_643_1.time_ < var_646_12 + var_646_22 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play318041155 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 318041155
		arg_647_1.duration_ = 5.6

		local var_647_0 = {
			zh = 5.3,
			ja = 5.6
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
				arg_647_0:Play318041156(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = arg_647_1.actors_["10066ui_story"]
			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 and arg_647_1.var_.characterEffect10066ui_story == nil then
				arg_647_1.var_.characterEffect10066ui_story = var_650_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_2 = 0.200000002980232

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_2 then
				local var_650_3 = (arg_647_1.time_ - var_650_1) / var_650_2

				if arg_647_1.var_.characterEffect10066ui_story then
					arg_647_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_647_1.time_ >= var_650_1 + var_650_2 and arg_647_1.time_ < var_650_1 + var_650_2 + arg_650_0 and arg_647_1.var_.characterEffect10066ui_story then
				arg_647_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_650_4 = 0

			if var_650_4 < arg_647_1.time_ and arg_647_1.time_ <= var_650_4 + arg_650_0 then
				arg_647_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action5_1")
			end

			local var_650_5 = 0

			if var_650_5 < arg_647_1.time_ and arg_647_1.time_ <= var_650_5 + arg_650_0 then
				arg_647_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_650_6 = arg_647_1.actors_["1050ui_story"]
			local var_650_7 = 0

			if var_650_7 < arg_647_1.time_ and arg_647_1.time_ <= var_650_7 + arg_650_0 and arg_647_1.var_.characterEffect1050ui_story == nil then
				arg_647_1.var_.characterEffect1050ui_story = var_650_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_8 = 0.200000002980232

			if var_650_7 <= arg_647_1.time_ and arg_647_1.time_ < var_650_7 + var_650_8 then
				local var_650_9 = (arg_647_1.time_ - var_650_7) / var_650_8

				if arg_647_1.var_.characterEffect1050ui_story then
					local var_650_10 = Mathf.Lerp(0, 0.5, var_650_9)

					arg_647_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_647_1.var_.characterEffect1050ui_story.fillRatio = var_650_10
				end
			end

			if arg_647_1.time_ >= var_650_7 + var_650_8 and arg_647_1.time_ < var_650_7 + var_650_8 + arg_650_0 and arg_647_1.var_.characterEffect1050ui_story then
				local var_650_11 = 0.5

				arg_647_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_647_1.var_.characterEffect1050ui_story.fillRatio = var_650_11
			end

			local var_650_12 = 0
			local var_650_13 = 0.425

			if var_650_12 < arg_647_1.time_ and arg_647_1.time_ <= var_650_12 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_14 = arg_647_1:FormatText(StoryNameCfg[640].name)

				arg_647_1.leftNameTxt_.text = var_650_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_15 = arg_647_1:GetWordFromCfg(318041155)
				local var_650_16 = arg_647_1:FormatText(var_650_15.content)

				arg_647_1.text_.text = var_650_16

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_17 = 17
				local var_650_18 = utf8.len(var_650_16)
				local var_650_19 = var_650_17 <= 0 and var_650_13 or var_650_13 * (var_650_18 / var_650_17)

				if var_650_19 > 0 and var_650_13 < var_650_19 then
					arg_647_1.talkMaxDuration = var_650_19

					if var_650_19 + var_650_12 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_19 + var_650_12
					end
				end

				arg_647_1.text_.text = var_650_16
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041155", "story_v_out_318041.awb") ~= 0 then
					local var_650_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041155", "story_v_out_318041.awb") / 1000

					if var_650_20 + var_650_12 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_20 + var_650_12
					end

					if var_650_15.prefab_name ~= "" and arg_647_1.actors_[var_650_15.prefab_name] ~= nil then
						local var_650_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_15.prefab_name].transform, "story_v_out_318041", "318041155", "story_v_out_318041.awb")

						arg_647_1:RecordAudio("318041155", var_650_21)
						arg_647_1:RecordAudio("318041155", var_650_21)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_out_318041", "318041155", "story_v_out_318041.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_out_318041", "318041155", "story_v_out_318041.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_22 = math.max(var_650_13, arg_647_1.talkMaxDuration)

			if var_650_12 <= arg_647_1.time_ and arg_647_1.time_ < var_650_12 + var_650_22 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_12) / var_650_22

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_12 + var_650_22 and arg_647_1.time_ < var_650_12 + var_650_22 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play318041156 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 318041156
		arg_651_1.duration_ = 1.8

		local var_651_0 = {
			zh = 1.8,
			ja = 0.999999999999
		}
		local var_651_1 = manager.audio:GetLocalizationFlag()

		if var_651_0[var_651_1] ~= nil then
			arg_651_1.duration_ = var_651_0[var_651_1]
		end

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play318041157(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = arg_651_1.actors_["1050ui_story"]
			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 and arg_651_1.var_.characterEffect1050ui_story == nil then
				arg_651_1.var_.characterEffect1050ui_story = var_654_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_654_2 = 0.200000002980232

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_2 then
				local var_654_3 = (arg_651_1.time_ - var_654_1) / var_654_2

				if arg_651_1.var_.characterEffect1050ui_story then
					arg_651_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_651_1.time_ >= var_654_1 + var_654_2 and arg_651_1.time_ < var_654_1 + var_654_2 + arg_654_0 and arg_651_1.var_.characterEffect1050ui_story then
				arg_651_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_654_4 = arg_651_1.actors_["10066ui_story"]
			local var_654_5 = 0

			if var_654_5 < arg_651_1.time_ and arg_651_1.time_ <= var_654_5 + arg_654_0 and arg_651_1.var_.characterEffect10066ui_story == nil then
				arg_651_1.var_.characterEffect10066ui_story = var_654_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_654_6 = 0.200000002980232

			if var_654_5 <= arg_651_1.time_ and arg_651_1.time_ < var_654_5 + var_654_6 then
				local var_654_7 = (arg_651_1.time_ - var_654_5) / var_654_6

				if arg_651_1.var_.characterEffect10066ui_story then
					local var_654_8 = Mathf.Lerp(0, 0.5, var_654_7)

					arg_651_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_651_1.var_.characterEffect10066ui_story.fillRatio = var_654_8
				end
			end

			if arg_651_1.time_ >= var_654_5 + var_654_6 and arg_651_1.time_ < var_654_5 + var_654_6 + arg_654_0 and arg_651_1.var_.characterEffect10066ui_story then
				local var_654_9 = 0.5

				arg_651_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_651_1.var_.characterEffect10066ui_story.fillRatio = var_654_9
			end

			local var_654_10 = 0
			local var_654_11 = 0.2

			if var_654_10 < arg_651_1.time_ and arg_651_1.time_ <= var_654_10 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, true)

				local var_654_12 = arg_651_1:FormatText(StoryNameCfg[74].name)

				arg_651_1.leftNameTxt_.text = var_654_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_651_1.leftNameTxt_.transform)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1.leftNameTxt_.text)
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_13 = arg_651_1:GetWordFromCfg(318041156)
				local var_654_14 = arg_651_1:FormatText(var_654_13.content)

				arg_651_1.text_.text = var_654_14

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_15 = 8
				local var_654_16 = utf8.len(var_654_14)
				local var_654_17 = var_654_15 <= 0 and var_654_11 or var_654_11 * (var_654_16 / var_654_15)

				if var_654_17 > 0 and var_654_11 < var_654_17 then
					arg_651_1.talkMaxDuration = var_654_17

					if var_654_17 + var_654_10 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_17 + var_654_10
					end
				end

				arg_651_1.text_.text = var_654_14
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041156", "story_v_out_318041.awb") ~= 0 then
					local var_654_18 = manager.audio:GetVoiceLength("story_v_out_318041", "318041156", "story_v_out_318041.awb") / 1000

					if var_654_18 + var_654_10 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_18 + var_654_10
					end

					if var_654_13.prefab_name ~= "" and arg_651_1.actors_[var_654_13.prefab_name] ~= nil then
						local var_654_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_651_1.actors_[var_654_13.prefab_name].transform, "story_v_out_318041", "318041156", "story_v_out_318041.awb")

						arg_651_1:RecordAudio("318041156", var_654_19)
						arg_651_1:RecordAudio("318041156", var_654_19)
					else
						arg_651_1:AudioAction("play", "voice", "story_v_out_318041", "318041156", "story_v_out_318041.awb")
					end

					arg_651_1:RecordHistoryTalkVoice("story_v_out_318041", "318041156", "story_v_out_318041.awb")
				end

				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_20 = math.max(var_654_11, arg_651_1.talkMaxDuration)

			if var_654_10 <= arg_651_1.time_ and arg_651_1.time_ < var_654_10 + var_654_20 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_10) / var_654_20

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_10 + var_654_20 and arg_651_1.time_ < var_654_10 + var_654_20 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play318041157 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 318041157
		arg_655_1.duration_ = 5

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play318041158(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = arg_655_1.actors_["1050ui_story"]
			local var_658_1 = 0

			if var_658_1 < arg_655_1.time_ and arg_655_1.time_ <= var_658_1 + arg_658_0 and arg_655_1.var_.characterEffect1050ui_story == nil then
				arg_655_1.var_.characterEffect1050ui_story = var_658_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_658_2 = 0.200000002980232

			if var_658_1 <= arg_655_1.time_ and arg_655_1.time_ < var_658_1 + var_658_2 then
				local var_658_3 = (arg_655_1.time_ - var_658_1) / var_658_2

				if arg_655_1.var_.characterEffect1050ui_story then
					local var_658_4 = Mathf.Lerp(0, 0.5, var_658_3)

					arg_655_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_655_1.var_.characterEffect1050ui_story.fillRatio = var_658_4
				end
			end

			if arg_655_1.time_ >= var_658_1 + var_658_2 and arg_655_1.time_ < var_658_1 + var_658_2 + arg_658_0 and arg_655_1.var_.characterEffect1050ui_story then
				local var_658_5 = 0.5

				arg_655_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_655_1.var_.characterEffect1050ui_story.fillRatio = var_658_5
			end

			local var_658_6 = 0

			if var_658_6 < arg_655_1.time_ and arg_655_1.time_ <= var_658_6 + arg_658_0 then
				arg_655_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action5_2")
			end

			local var_658_7 = 0
			local var_658_8 = 1.025

			if var_658_7 < arg_655_1.time_ and arg_655_1.time_ <= var_658_7 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, false)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_9 = arg_655_1:GetWordFromCfg(318041157)
				local var_658_10 = arg_655_1:FormatText(var_658_9.content)

				arg_655_1.text_.text = var_658_10

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_11 = 41
				local var_658_12 = utf8.len(var_658_10)
				local var_658_13 = var_658_11 <= 0 and var_658_8 or var_658_8 * (var_658_12 / var_658_11)

				if var_658_13 > 0 and var_658_8 < var_658_13 then
					arg_655_1.talkMaxDuration = var_658_13

					if var_658_13 + var_658_7 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_13 + var_658_7
					end
				end

				arg_655_1.text_.text = var_658_10
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)
				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_14 = math.max(var_658_8, arg_655_1.talkMaxDuration)

			if var_658_7 <= arg_655_1.time_ and arg_655_1.time_ < var_658_7 + var_658_14 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_7) / var_658_14

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_7 + var_658_14 and arg_655_1.time_ < var_658_7 + var_658_14 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play318041158 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 318041158
		arg_659_1.duration_ = 6.9

		local var_659_0 = {
			zh = 2.9,
			ja = 6.9
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
				arg_659_0:Play318041159(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["10066ui_story"]
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 and arg_659_1.var_.characterEffect10066ui_story == nil then
				arg_659_1.var_.characterEffect10066ui_story = var_662_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_2 = 0.200000002980232

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2

				if arg_659_1.var_.characterEffect10066ui_story then
					arg_659_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 and arg_659_1.var_.characterEffect10066ui_story then
				arg_659_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_662_4 = 0

			if var_662_4 < arg_659_1.time_ and arg_659_1.time_ <= var_662_4 + arg_662_0 then
				arg_659_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_662_5 = 0
			local var_662_6 = 0.225

			if var_662_5 < arg_659_1.time_ and arg_659_1.time_ <= var_662_5 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_7 = arg_659_1:FormatText(StoryNameCfg[640].name)

				arg_659_1.leftNameTxt_.text = var_662_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_8 = arg_659_1:GetWordFromCfg(318041158)
				local var_662_9 = arg_659_1:FormatText(var_662_8.content)

				arg_659_1.text_.text = var_662_9

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_10 = 9
				local var_662_11 = utf8.len(var_662_9)
				local var_662_12 = var_662_10 <= 0 and var_662_6 or var_662_6 * (var_662_11 / var_662_10)

				if var_662_12 > 0 and var_662_6 < var_662_12 then
					arg_659_1.talkMaxDuration = var_662_12

					if var_662_12 + var_662_5 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_12 + var_662_5
					end
				end

				arg_659_1.text_.text = var_662_9
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041158", "story_v_out_318041.awb") ~= 0 then
					local var_662_13 = manager.audio:GetVoiceLength("story_v_out_318041", "318041158", "story_v_out_318041.awb") / 1000

					if var_662_13 + var_662_5 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_13 + var_662_5
					end

					if var_662_8.prefab_name ~= "" and arg_659_1.actors_[var_662_8.prefab_name] ~= nil then
						local var_662_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_8.prefab_name].transform, "story_v_out_318041", "318041158", "story_v_out_318041.awb")

						arg_659_1:RecordAudio("318041158", var_662_14)
						arg_659_1:RecordAudio("318041158", var_662_14)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_out_318041", "318041158", "story_v_out_318041.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_out_318041", "318041158", "story_v_out_318041.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_15 = math.max(var_662_6, arg_659_1.talkMaxDuration)

			if var_662_5 <= arg_659_1.time_ and arg_659_1.time_ < var_662_5 + var_662_15 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_5) / var_662_15

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_5 + var_662_15 and arg_659_1.time_ < var_662_5 + var_662_15 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play318041159 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 318041159
		arg_663_1.duration_ = 2.766

		local var_663_0 = {
			zh = 2.766,
			ja = 2.066
		}
		local var_663_1 = manager.audio:GetLocalizationFlag()

		if var_663_0[var_663_1] ~= nil then
			arg_663_1.duration_ = var_663_0[var_663_1]
		end

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play318041160(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = arg_663_1.actors_["1050ui_story"]
			local var_666_1 = 0

			if var_666_1 < arg_663_1.time_ and arg_663_1.time_ <= var_666_1 + arg_666_0 and arg_663_1.var_.characterEffect1050ui_story == nil then
				arg_663_1.var_.characterEffect1050ui_story = var_666_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_2 = 0.200000002980232

			if var_666_1 <= arg_663_1.time_ and arg_663_1.time_ < var_666_1 + var_666_2 then
				local var_666_3 = (arg_663_1.time_ - var_666_1) / var_666_2

				if arg_663_1.var_.characterEffect1050ui_story then
					arg_663_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_663_1.time_ >= var_666_1 + var_666_2 and arg_663_1.time_ < var_666_1 + var_666_2 + arg_666_0 and arg_663_1.var_.characterEffect1050ui_story then
				arg_663_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_666_4 = 0

			if var_666_4 < arg_663_1.time_ and arg_663_1.time_ <= var_666_4 + arg_666_0 then
				arg_663_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_666_5 = 0

			if var_666_5 < arg_663_1.time_ and arg_663_1.time_ <= var_666_5 + arg_666_0 then
				arg_663_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_666_6 = arg_663_1.actors_["10066ui_story"]
			local var_666_7 = 0

			if var_666_7 < arg_663_1.time_ and arg_663_1.time_ <= var_666_7 + arg_666_0 and arg_663_1.var_.characterEffect10066ui_story == nil then
				arg_663_1.var_.characterEffect10066ui_story = var_666_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_8 = 0.200000002980232

			if var_666_7 <= arg_663_1.time_ and arg_663_1.time_ < var_666_7 + var_666_8 then
				local var_666_9 = (arg_663_1.time_ - var_666_7) / var_666_8

				if arg_663_1.var_.characterEffect10066ui_story then
					local var_666_10 = Mathf.Lerp(0, 0.5, var_666_9)

					arg_663_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_663_1.var_.characterEffect10066ui_story.fillRatio = var_666_10
				end
			end

			if arg_663_1.time_ >= var_666_7 + var_666_8 and arg_663_1.time_ < var_666_7 + var_666_8 + arg_666_0 and arg_663_1.var_.characterEffect10066ui_story then
				local var_666_11 = 0.5

				arg_663_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_663_1.var_.characterEffect10066ui_story.fillRatio = var_666_11
			end

			local var_666_12 = 0
			local var_666_13 = 0.2

			if var_666_12 < arg_663_1.time_ and arg_663_1.time_ <= var_666_12 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_14 = arg_663_1:FormatText(StoryNameCfg[74].name)

				arg_663_1.leftNameTxt_.text = var_666_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_15 = arg_663_1:GetWordFromCfg(318041159)
				local var_666_16 = arg_663_1:FormatText(var_666_15.content)

				arg_663_1.text_.text = var_666_16

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_17 = 8
				local var_666_18 = utf8.len(var_666_16)
				local var_666_19 = var_666_17 <= 0 and var_666_13 or var_666_13 * (var_666_18 / var_666_17)

				if var_666_19 > 0 and var_666_13 < var_666_19 then
					arg_663_1.talkMaxDuration = var_666_19

					if var_666_19 + var_666_12 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_19 + var_666_12
					end
				end

				arg_663_1.text_.text = var_666_16
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041159", "story_v_out_318041.awb") ~= 0 then
					local var_666_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041159", "story_v_out_318041.awb") / 1000

					if var_666_20 + var_666_12 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_20 + var_666_12
					end

					if var_666_15.prefab_name ~= "" and arg_663_1.actors_[var_666_15.prefab_name] ~= nil then
						local var_666_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_663_1.actors_[var_666_15.prefab_name].transform, "story_v_out_318041", "318041159", "story_v_out_318041.awb")

						arg_663_1:RecordAudio("318041159", var_666_21)
						arg_663_1:RecordAudio("318041159", var_666_21)
					else
						arg_663_1:AudioAction("play", "voice", "story_v_out_318041", "318041159", "story_v_out_318041.awb")
					end

					arg_663_1:RecordHistoryTalkVoice("story_v_out_318041", "318041159", "story_v_out_318041.awb")
				end

				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_22 = math.max(var_666_13, arg_663_1.talkMaxDuration)

			if var_666_12 <= arg_663_1.time_ and arg_663_1.time_ < var_666_12 + var_666_22 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_12) / var_666_22

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_12 + var_666_22 and arg_663_1.time_ < var_666_12 + var_666_22 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play318041160 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 318041160
		arg_667_1.duration_ = 7.6

		local var_667_0 = {
			zh = 7.6,
			ja = 6.433
		}
		local var_667_1 = manager.audio:GetLocalizationFlag()

		if var_667_0[var_667_1] ~= nil then
			arg_667_1.duration_ = var_667_0[var_667_1]
		end

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play318041161(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = arg_667_1.actors_["10066ui_story"]
			local var_670_1 = 0

			if var_670_1 < arg_667_1.time_ and arg_667_1.time_ <= var_670_1 + arg_670_0 and arg_667_1.var_.characterEffect10066ui_story == nil then
				arg_667_1.var_.characterEffect10066ui_story = var_670_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_670_2 = 0.200000002980232

			if var_670_1 <= arg_667_1.time_ and arg_667_1.time_ < var_670_1 + var_670_2 then
				local var_670_3 = (arg_667_1.time_ - var_670_1) / var_670_2

				if arg_667_1.var_.characterEffect10066ui_story then
					arg_667_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_667_1.time_ >= var_670_1 + var_670_2 and arg_667_1.time_ < var_670_1 + var_670_2 + arg_670_0 and arg_667_1.var_.characterEffect10066ui_story then
				arg_667_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_670_4 = 0

			if var_670_4 < arg_667_1.time_ and arg_667_1.time_ <= var_670_4 + arg_670_0 then
				arg_667_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action4_1")
			end

			local var_670_5 = 0

			if var_670_5 < arg_667_1.time_ and arg_667_1.time_ <= var_670_5 + arg_670_0 then
				arg_667_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_670_6 = arg_667_1.actors_["1050ui_story"]
			local var_670_7 = 0

			if var_670_7 < arg_667_1.time_ and arg_667_1.time_ <= var_670_7 + arg_670_0 and arg_667_1.var_.characterEffect1050ui_story == nil then
				arg_667_1.var_.characterEffect1050ui_story = var_670_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_670_8 = 0.200000002980232

			if var_670_7 <= arg_667_1.time_ and arg_667_1.time_ < var_670_7 + var_670_8 then
				local var_670_9 = (arg_667_1.time_ - var_670_7) / var_670_8

				if arg_667_1.var_.characterEffect1050ui_story then
					local var_670_10 = Mathf.Lerp(0, 0.5, var_670_9)

					arg_667_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_667_1.var_.characterEffect1050ui_story.fillRatio = var_670_10
				end
			end

			if arg_667_1.time_ >= var_670_7 + var_670_8 and arg_667_1.time_ < var_670_7 + var_670_8 + arg_670_0 and arg_667_1.var_.characterEffect1050ui_story then
				local var_670_11 = 0.5

				arg_667_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_667_1.var_.characterEffect1050ui_story.fillRatio = var_670_11
			end

			local var_670_12 = 0
			local var_670_13 = 0.65

			if var_670_12 < arg_667_1.time_ and arg_667_1.time_ <= var_670_12 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_14 = arg_667_1:FormatText(StoryNameCfg[640].name)

				arg_667_1.leftNameTxt_.text = var_670_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_15 = arg_667_1:GetWordFromCfg(318041160)
				local var_670_16 = arg_667_1:FormatText(var_670_15.content)

				arg_667_1.text_.text = var_670_16

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_17 = 26
				local var_670_18 = utf8.len(var_670_16)
				local var_670_19 = var_670_17 <= 0 and var_670_13 or var_670_13 * (var_670_18 / var_670_17)

				if var_670_19 > 0 and var_670_13 < var_670_19 then
					arg_667_1.talkMaxDuration = var_670_19

					if var_670_19 + var_670_12 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_19 + var_670_12
					end
				end

				arg_667_1.text_.text = var_670_16
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041160", "story_v_out_318041.awb") ~= 0 then
					local var_670_20 = manager.audio:GetVoiceLength("story_v_out_318041", "318041160", "story_v_out_318041.awb") / 1000

					if var_670_20 + var_670_12 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_20 + var_670_12
					end

					if var_670_15.prefab_name ~= "" and arg_667_1.actors_[var_670_15.prefab_name] ~= nil then
						local var_670_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_667_1.actors_[var_670_15.prefab_name].transform, "story_v_out_318041", "318041160", "story_v_out_318041.awb")

						arg_667_1:RecordAudio("318041160", var_670_21)
						arg_667_1:RecordAudio("318041160", var_670_21)
					else
						arg_667_1:AudioAction("play", "voice", "story_v_out_318041", "318041160", "story_v_out_318041.awb")
					end

					arg_667_1:RecordHistoryTalkVoice("story_v_out_318041", "318041160", "story_v_out_318041.awb")
				end

				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_22 = math.max(var_670_13, arg_667_1.talkMaxDuration)

			if var_670_12 <= arg_667_1.time_ and arg_667_1.time_ < var_670_12 + var_670_22 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_12) / var_670_22

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_12 + var_670_22 and arg_667_1.time_ < var_670_12 + var_670_22 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play318041161 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 318041161
		arg_671_1.duration_ = 4.8

		local var_671_0 = {
			zh = 3.1,
			ja = 4.8
		}
		local var_671_1 = manager.audio:GetLocalizationFlag()

		if var_671_0[var_671_1] ~= nil then
			arg_671_1.duration_ = var_671_0[var_671_1]
		end

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play318041162(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = arg_671_1.actors_["1050ui_story"]
			local var_674_1 = 0

			if var_674_1 < arg_671_1.time_ and arg_671_1.time_ <= var_674_1 + arg_674_0 and arg_671_1.var_.characterEffect1050ui_story == nil then
				arg_671_1.var_.characterEffect1050ui_story = var_674_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_674_2 = 0.200000002980232

			if var_674_1 <= arg_671_1.time_ and arg_671_1.time_ < var_674_1 + var_674_2 then
				local var_674_3 = (arg_671_1.time_ - var_674_1) / var_674_2

				if arg_671_1.var_.characterEffect1050ui_story then
					arg_671_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_671_1.time_ >= var_674_1 + var_674_2 and arg_671_1.time_ < var_674_1 + var_674_2 + arg_674_0 and arg_671_1.var_.characterEffect1050ui_story then
				arg_671_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_674_4 = arg_671_1.actors_["10066ui_story"]
			local var_674_5 = 0

			if var_674_5 < arg_671_1.time_ and arg_671_1.time_ <= var_674_5 + arg_674_0 and arg_671_1.var_.characterEffect10066ui_story == nil then
				arg_671_1.var_.characterEffect10066ui_story = var_674_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_674_6 = 0.200000002980232

			if var_674_5 <= arg_671_1.time_ and arg_671_1.time_ < var_674_5 + var_674_6 then
				local var_674_7 = (arg_671_1.time_ - var_674_5) / var_674_6

				if arg_671_1.var_.characterEffect10066ui_story then
					local var_674_8 = Mathf.Lerp(0, 0.5, var_674_7)

					arg_671_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_671_1.var_.characterEffect10066ui_story.fillRatio = var_674_8
				end
			end

			if arg_671_1.time_ >= var_674_5 + var_674_6 and arg_671_1.time_ < var_674_5 + var_674_6 + arg_674_0 and arg_671_1.var_.characterEffect10066ui_story then
				local var_674_9 = 0.5

				arg_671_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_671_1.var_.characterEffect10066ui_story.fillRatio = var_674_9
			end

			local var_674_10 = 0
			local var_674_11 = 0.5

			if var_674_10 < arg_671_1.time_ and arg_671_1.time_ <= var_674_10 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_12 = arg_671_1:FormatText(StoryNameCfg[74].name)

				arg_671_1.leftNameTxt_.text = var_674_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_13 = arg_671_1:GetWordFromCfg(318041161)
				local var_674_14 = arg_671_1:FormatText(var_674_13.content)

				arg_671_1.text_.text = var_674_14

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_15 = 20
				local var_674_16 = utf8.len(var_674_14)
				local var_674_17 = var_674_15 <= 0 and var_674_11 or var_674_11 * (var_674_16 / var_674_15)

				if var_674_17 > 0 and var_674_11 < var_674_17 then
					arg_671_1.talkMaxDuration = var_674_17

					if var_674_17 + var_674_10 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_17 + var_674_10
					end
				end

				arg_671_1.text_.text = var_674_14
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041161", "story_v_out_318041.awb") ~= 0 then
					local var_674_18 = manager.audio:GetVoiceLength("story_v_out_318041", "318041161", "story_v_out_318041.awb") / 1000

					if var_674_18 + var_674_10 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_18 + var_674_10
					end

					if var_674_13.prefab_name ~= "" and arg_671_1.actors_[var_674_13.prefab_name] ~= nil then
						local var_674_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_671_1.actors_[var_674_13.prefab_name].transform, "story_v_out_318041", "318041161", "story_v_out_318041.awb")

						arg_671_1:RecordAudio("318041161", var_674_19)
						arg_671_1:RecordAudio("318041161", var_674_19)
					else
						arg_671_1:AudioAction("play", "voice", "story_v_out_318041", "318041161", "story_v_out_318041.awb")
					end

					arg_671_1:RecordHistoryTalkVoice("story_v_out_318041", "318041161", "story_v_out_318041.awb")
				end

				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_20 = math.max(var_674_11, arg_671_1.talkMaxDuration)

			if var_674_10 <= arg_671_1.time_ and arg_671_1.time_ < var_674_10 + var_674_20 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_10) / var_674_20

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_10 + var_674_20 and arg_671_1.time_ < var_674_10 + var_674_20 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play318041162 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 318041162
		arg_675_1.duration_ = 6.8

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play318041163(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = "K13f"

			if arg_675_1.bgs_[var_678_0] == nil then
				local var_678_1 = Object.Instantiate(arg_675_1.paintGo_)

				var_678_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_678_0)
				var_678_1.name = var_678_0
				var_678_1.transform.parent = arg_675_1.stage_.transform
				var_678_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_675_1.bgs_[var_678_0] = var_678_1
			end

			local var_678_2 = 0.983333333333333

			if var_678_2 < arg_675_1.time_ and arg_675_1.time_ <= var_678_2 + arg_678_0 then
				local var_678_3 = manager.ui.mainCamera.transform.localPosition
				local var_678_4 = Vector3.New(0, 0, 10) + Vector3.New(var_678_3.x, var_678_3.y, 0)
				local var_678_5 = arg_675_1.bgs_.K13f

				var_678_5.transform.localPosition = var_678_4
				var_678_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_678_6 = var_678_5:GetComponent("SpriteRenderer")

				if var_678_6 and var_678_6.sprite then
					local var_678_7 = (var_678_5.transform.localPosition - var_678_3).z
					local var_678_8 = manager.ui.mainCameraCom_
					local var_678_9 = 2 * var_678_7 * Mathf.Tan(var_678_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_678_10 = var_678_9 * var_678_8.aspect
					local var_678_11 = var_678_6.sprite.bounds.size.x
					local var_678_12 = var_678_6.sprite.bounds.size.y
					local var_678_13 = var_678_10 / var_678_11
					local var_678_14 = var_678_9 / var_678_12
					local var_678_15 = var_678_14 < var_678_13 and var_678_13 or var_678_14

					var_678_5.transform.localScale = Vector3.New(var_678_15, var_678_15, 0)
				end

				for iter_678_0, iter_678_1 in pairs(arg_675_1.bgs_) do
					if iter_678_0 ~= "K13f" then
						iter_678_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_678_16 = arg_675_1.actors_["1050ui_story"]
			local var_678_17 = 0.983333333333333

			if var_678_17 < arg_675_1.time_ and arg_675_1.time_ <= var_678_17 + arg_678_0 and arg_675_1.var_.characterEffect1050ui_story == nil then
				arg_675_1.var_.characterEffect1050ui_story = var_678_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_18 = 0.0166666666666667

			if var_678_17 <= arg_675_1.time_ and arg_675_1.time_ < var_678_17 + var_678_18 then
				local var_678_19 = (arg_675_1.time_ - var_678_17) / var_678_18

				if arg_675_1.var_.characterEffect1050ui_story then
					local var_678_20 = Mathf.Lerp(0, 0.5, var_678_19)

					arg_675_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_675_1.var_.characterEffect1050ui_story.fillRatio = var_678_20
				end
			end

			if arg_675_1.time_ >= var_678_17 + var_678_18 and arg_675_1.time_ < var_678_17 + var_678_18 + arg_678_0 and arg_675_1.var_.characterEffect1050ui_story then
				local var_678_21 = 0.5

				arg_675_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_675_1.var_.characterEffect1050ui_story.fillRatio = var_678_21
			end

			local var_678_22 = arg_675_1.actors_["10066ui_story"]
			local var_678_23 = 0.983333333333333

			if var_678_23 < arg_675_1.time_ and arg_675_1.time_ <= var_678_23 + arg_678_0 and arg_675_1.var_.characterEffect10066ui_story == nil then
				arg_675_1.var_.characterEffect10066ui_story = var_678_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_24 = 0.0166666666666667

			if var_678_23 <= arg_675_1.time_ and arg_675_1.time_ < var_678_23 + var_678_24 then
				local var_678_25 = (arg_675_1.time_ - var_678_23) / var_678_24

				if arg_675_1.var_.characterEffect10066ui_story then
					local var_678_26 = Mathf.Lerp(0, 0.5, var_678_25)

					arg_675_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_675_1.var_.characterEffect10066ui_story.fillRatio = var_678_26
				end
			end

			if arg_675_1.time_ >= var_678_23 + var_678_24 and arg_675_1.time_ < var_678_23 + var_678_24 + arg_678_0 and arg_675_1.var_.characterEffect10066ui_story then
				local var_678_27 = 0.5

				arg_675_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_675_1.var_.characterEffect10066ui_story.fillRatio = var_678_27
			end

			local var_678_28 = 0

			if var_678_28 < arg_675_1.time_ and arg_675_1.time_ <= var_678_28 + arg_678_0 then
				arg_675_1.mask_.enabled = true
				arg_675_1.mask_.raycastTarget = true

				arg_675_1:SetGaussion(false)
			end

			local var_678_29 = 1

			if var_678_28 <= arg_675_1.time_ and arg_675_1.time_ < var_678_28 + var_678_29 then
				local var_678_30 = (arg_675_1.time_ - var_678_28) / var_678_29
				local var_678_31 = Color.New(0, 0, 0)

				var_678_31.a = Mathf.Lerp(0, 1, var_678_30)
				arg_675_1.mask_.color = var_678_31
			end

			if arg_675_1.time_ >= var_678_28 + var_678_29 and arg_675_1.time_ < var_678_28 + var_678_29 + arg_678_0 then
				local var_678_32 = Color.New(0, 0, 0)

				var_678_32.a = 1
				arg_675_1.mask_.color = var_678_32
			end

			local var_678_33 = 1

			if var_678_33 < arg_675_1.time_ and arg_675_1.time_ <= var_678_33 + arg_678_0 then
				arg_675_1.mask_.enabled = true
				arg_675_1.mask_.raycastTarget = true

				arg_675_1:SetGaussion(false)
			end

			local var_678_34 = 1

			if var_678_33 <= arg_675_1.time_ and arg_675_1.time_ < var_678_33 + var_678_34 then
				local var_678_35 = (arg_675_1.time_ - var_678_33) / var_678_34
				local var_678_36 = Color.New(0, 0, 0)

				var_678_36.a = Mathf.Lerp(1, 0, var_678_35)
				arg_675_1.mask_.color = var_678_36
			end

			if arg_675_1.time_ >= var_678_33 + var_678_34 and arg_675_1.time_ < var_678_33 + var_678_34 + arg_678_0 then
				local var_678_37 = Color.New(0, 0, 0)
				local var_678_38 = 0

				arg_675_1.mask_.enabled = false
				var_678_37.a = var_678_38
				arg_675_1.mask_.color = var_678_37
			end

			local var_678_39 = arg_675_1.actors_["10066ui_story"].transform
			local var_678_40 = 0.966

			if var_678_40 < arg_675_1.time_ and arg_675_1.time_ <= var_678_40 + arg_678_0 then
				arg_675_1.var_.moveOldPos10066ui_story = var_678_39.localPosition
			end

			local var_678_41 = 0.001

			if var_678_40 <= arg_675_1.time_ and arg_675_1.time_ < var_678_40 + var_678_41 then
				local var_678_42 = (arg_675_1.time_ - var_678_40) / var_678_41
				local var_678_43 = Vector3.New(0, 100, 0)

				var_678_39.localPosition = Vector3.Lerp(arg_675_1.var_.moveOldPos10066ui_story, var_678_43, var_678_42)

				local var_678_44 = manager.ui.mainCamera.transform.position - var_678_39.position

				var_678_39.forward = Vector3.New(var_678_44.x, var_678_44.y, var_678_44.z)

				local var_678_45 = var_678_39.localEulerAngles

				var_678_45.z = 0
				var_678_45.x = 0
				var_678_39.localEulerAngles = var_678_45
			end

			if arg_675_1.time_ >= var_678_40 + var_678_41 and arg_675_1.time_ < var_678_40 + var_678_41 + arg_678_0 then
				var_678_39.localPosition = Vector3.New(0, 100, 0)

				local var_678_46 = manager.ui.mainCamera.transform.position - var_678_39.position

				var_678_39.forward = Vector3.New(var_678_46.x, var_678_46.y, var_678_46.z)

				local var_678_47 = var_678_39.localEulerAngles

				var_678_47.z = 0
				var_678_47.x = 0
				var_678_39.localEulerAngles = var_678_47
			end

			local var_678_48 = arg_675_1.actors_["1050ui_story"].transform
			local var_678_49 = 0.966

			if var_678_49 < arg_675_1.time_ and arg_675_1.time_ <= var_678_49 + arg_678_0 then
				arg_675_1.var_.moveOldPos1050ui_story = var_678_48.localPosition
			end

			local var_678_50 = 0.001

			if var_678_49 <= arg_675_1.time_ and arg_675_1.time_ < var_678_49 + var_678_50 then
				local var_678_51 = (arg_675_1.time_ - var_678_49) / var_678_50
				local var_678_52 = Vector3.New(0, 100, 0)

				var_678_48.localPosition = Vector3.Lerp(arg_675_1.var_.moveOldPos1050ui_story, var_678_52, var_678_51)

				local var_678_53 = manager.ui.mainCamera.transform.position - var_678_48.position

				var_678_48.forward = Vector3.New(var_678_53.x, var_678_53.y, var_678_53.z)

				local var_678_54 = var_678_48.localEulerAngles

				var_678_54.z = 0
				var_678_54.x = 0
				var_678_48.localEulerAngles = var_678_54
			end

			if arg_675_1.time_ >= var_678_49 + var_678_50 and arg_675_1.time_ < var_678_49 + var_678_50 + arg_678_0 then
				var_678_48.localPosition = Vector3.New(0, 100, 0)

				local var_678_55 = manager.ui.mainCamera.transform.position - var_678_48.position

				var_678_48.forward = Vector3.New(var_678_55.x, var_678_55.y, var_678_55.z)

				local var_678_56 = var_678_48.localEulerAngles

				var_678_56.z = 0
				var_678_56.x = 0
				var_678_48.localEulerAngles = var_678_56
			end

			if arg_675_1.frameCnt_ <= 1 then
				arg_675_1.dialog_:SetActive(false)
			end

			local var_678_57 = 1.8
			local var_678_58 = 0.775

			if var_678_57 < arg_675_1.time_ and arg_675_1.time_ <= var_678_57 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0

				arg_675_1.dialog_:SetActive(true)

				local var_678_59 = LeanTween.value(arg_675_1.dialog_, 0, 1, 0.3)

				var_678_59:setOnUpdate(LuaHelper.FloatAction(function(arg_679_0)
					arg_675_1.dialogCg_.alpha = arg_679_0
				end))
				var_678_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_675_1.dialog_)
					var_678_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_675_1.duration_ = arg_675_1.duration_ + 0.3

				SetActive(arg_675_1.leftNameGo_, false)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_60 = arg_675_1:GetWordFromCfg(318041162)
				local var_678_61 = arg_675_1:FormatText(var_678_60.content)

				arg_675_1.text_.text = var_678_61

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_62 = 31
				local var_678_63 = utf8.len(var_678_61)
				local var_678_64 = var_678_62 <= 0 and var_678_58 or var_678_58 * (var_678_63 / var_678_62)

				if var_678_64 > 0 and var_678_58 < var_678_64 then
					arg_675_1.talkMaxDuration = var_678_64
					var_678_57 = var_678_57 + 0.3

					if var_678_64 + var_678_57 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_64 + var_678_57
					end
				end

				arg_675_1.text_.text = var_678_61
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)
				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_65 = var_678_57 + 0.3
			local var_678_66 = math.max(var_678_58, arg_675_1.talkMaxDuration)

			if var_678_65 <= arg_675_1.time_ and arg_675_1.time_ < var_678_65 + var_678_66 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_65) / var_678_66

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_65 + var_678_66 and arg_675_1.time_ < var_678_65 + var_678_66 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play318041163 = function(arg_681_0, arg_681_1)
		arg_681_1.time_ = 0
		arg_681_1.frameCnt_ = 0
		arg_681_1.state_ = "playing"
		arg_681_1.curTalkId_ = 318041163
		arg_681_1.duration_ = 5

		SetActive(arg_681_1.tipsGo_, false)

		function arg_681_1.onSingleLineFinish_()
			arg_681_1.onSingleLineUpdate_ = nil
			arg_681_1.onSingleLineFinish_ = nil
			arg_681_1.state_ = "waiting"
		end

		function arg_681_1.playNext_(arg_683_0)
			if arg_683_0 == 1 then
				arg_681_0:Play318041164(arg_681_1)
			end
		end

		function arg_681_1.onSingleLineUpdate_(arg_684_0)
			local var_684_0 = 0
			local var_684_1 = 1.4

			if var_684_0 < arg_681_1.time_ and arg_681_1.time_ <= var_684_0 + arg_684_0 then
				arg_681_1.talkMaxDuration = 0
				arg_681_1.dialogCg_.alpha = 1

				arg_681_1.dialog_:SetActive(true)
				SetActive(arg_681_1.leftNameGo_, false)

				arg_681_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_681_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_681_1:RecordName(arg_681_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_681_1.iconTrs_.gameObject, false)
				arg_681_1.callingController_:SetSelectedState("normal")

				local var_684_2 = arg_681_1:GetWordFromCfg(318041163)
				local var_684_3 = arg_681_1:FormatText(var_684_2.content)

				arg_681_1.text_.text = var_684_3

				LuaForUtil.ClearLinePrefixSymbol(arg_681_1.text_)

				local var_684_4 = 56
				local var_684_5 = utf8.len(var_684_3)
				local var_684_6 = var_684_4 <= 0 and var_684_1 or var_684_1 * (var_684_5 / var_684_4)

				if var_684_6 > 0 and var_684_1 < var_684_6 then
					arg_681_1.talkMaxDuration = var_684_6

					if var_684_6 + var_684_0 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_6 + var_684_0
					end
				end

				arg_681_1.text_.text = var_684_3
				arg_681_1.typewritter.percent = 0

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(false)
				arg_681_1:RecordContent(arg_681_1.text_.text)
			end

			local var_684_7 = math.max(var_684_1, arg_681_1.talkMaxDuration)

			if var_684_0 <= arg_681_1.time_ and arg_681_1.time_ < var_684_0 + var_684_7 then
				arg_681_1.typewritter.percent = (arg_681_1.time_ - var_684_0) / var_684_7

				arg_681_1.typewritter:SetDirty()
			end

			if arg_681_1.time_ >= var_684_0 + var_684_7 and arg_681_1.time_ < var_684_0 + var_684_7 + arg_684_0 then
				arg_681_1.typewritter.percent = 1

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(true)
			end
		end
	end,
	Play318041164 = function(arg_685_0, arg_685_1)
		arg_685_1.time_ = 0
		arg_685_1.frameCnt_ = 0
		arg_685_1.state_ = "playing"
		arg_685_1.curTalkId_ = 318041164
		arg_685_1.duration_ = 7.933

		local var_685_0 = {
			zh = 4.633,
			ja = 7.933
		}
		local var_685_1 = manager.audio:GetLocalizationFlag()

		if var_685_0[var_685_1] ~= nil then
			arg_685_1.duration_ = var_685_0[var_685_1]
		end

		SetActive(arg_685_1.tipsGo_, false)

		function arg_685_1.onSingleLineFinish_()
			arg_685_1.onSingleLineUpdate_ = nil
			arg_685_1.onSingleLineFinish_ = nil
			arg_685_1.state_ = "waiting"
		end

		function arg_685_1.playNext_(arg_687_0)
			if arg_687_0 == 1 then
				arg_685_0:Play318041165(arg_685_1)
			end
		end

		function arg_685_1.onSingleLineUpdate_(arg_688_0)
			local var_688_0 = arg_685_1.actors_["10066ui_story"]
			local var_688_1 = 0

			if var_688_1 < arg_685_1.time_ and arg_685_1.time_ <= var_688_1 + arg_688_0 and arg_685_1.var_.characterEffect10066ui_story == nil then
				arg_685_1.var_.characterEffect10066ui_story = var_688_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_688_2 = 0.200000002980232

			if var_688_1 <= arg_685_1.time_ and arg_685_1.time_ < var_688_1 + var_688_2 then
				local var_688_3 = (arg_685_1.time_ - var_688_1) / var_688_2

				if arg_685_1.var_.characterEffect10066ui_story then
					arg_685_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_685_1.time_ >= var_688_1 + var_688_2 and arg_685_1.time_ < var_688_1 + var_688_2 + arg_688_0 and arg_685_1.var_.characterEffect10066ui_story then
				arg_685_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_688_4 = 0

			if var_688_4 < arg_685_1.time_ and arg_685_1.time_ <= var_688_4 + arg_688_0 then
				arg_685_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action4_1")
			end

			local var_688_5 = 0

			if var_688_5 < arg_685_1.time_ and arg_685_1.time_ <= var_688_5 + arg_688_0 then
				arg_685_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_688_6 = arg_685_1.actors_["10066ui_story"].transform
			local var_688_7 = 0

			if var_688_7 < arg_685_1.time_ and arg_685_1.time_ <= var_688_7 + arg_688_0 then
				arg_685_1.var_.moveOldPos10066ui_story = var_688_6.localPosition
			end

			local var_688_8 = 0.001

			if var_688_7 <= arg_685_1.time_ and arg_685_1.time_ < var_688_7 + var_688_8 then
				local var_688_9 = (arg_685_1.time_ - var_688_7) / var_688_8
				local var_688_10 = Vector3.New(-0.7, -0.99, -5.83)

				var_688_6.localPosition = Vector3.Lerp(arg_685_1.var_.moveOldPos10066ui_story, var_688_10, var_688_9)

				local var_688_11 = manager.ui.mainCamera.transform.position - var_688_6.position

				var_688_6.forward = Vector3.New(var_688_11.x, var_688_11.y, var_688_11.z)

				local var_688_12 = var_688_6.localEulerAngles

				var_688_12.z = 0
				var_688_12.x = 0
				var_688_6.localEulerAngles = var_688_12
			end

			if arg_685_1.time_ >= var_688_7 + var_688_8 and arg_685_1.time_ < var_688_7 + var_688_8 + arg_688_0 then
				var_688_6.localPosition = Vector3.New(-0.7, -0.99, -5.83)

				local var_688_13 = manager.ui.mainCamera.transform.position - var_688_6.position

				var_688_6.forward = Vector3.New(var_688_13.x, var_688_13.y, var_688_13.z)

				local var_688_14 = var_688_6.localEulerAngles

				var_688_14.z = 0
				var_688_14.x = 0
				var_688_6.localEulerAngles = var_688_14
			end

			local var_688_15 = 0
			local var_688_16 = 0.275

			if var_688_15 < arg_685_1.time_ and arg_685_1.time_ <= var_688_15 + arg_688_0 then
				arg_685_1.talkMaxDuration = 0
				arg_685_1.dialogCg_.alpha = 1

				arg_685_1.dialog_:SetActive(true)
				SetActive(arg_685_1.leftNameGo_, true)

				local var_688_17 = arg_685_1:FormatText(StoryNameCfg[640].name)

				arg_685_1.leftNameTxt_.text = var_688_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_685_1.leftNameTxt_.transform)

				arg_685_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_685_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_685_1:RecordName(arg_685_1.leftNameTxt_.text)
				SetActive(arg_685_1.iconTrs_.gameObject, false)
				arg_685_1.callingController_:SetSelectedState("normal")

				local var_688_18 = arg_685_1:GetWordFromCfg(318041164)
				local var_688_19 = arg_685_1:FormatText(var_688_18.content)

				arg_685_1.text_.text = var_688_19

				LuaForUtil.ClearLinePrefixSymbol(arg_685_1.text_)

				local var_688_20 = 11
				local var_688_21 = utf8.len(var_688_19)
				local var_688_22 = var_688_20 <= 0 and var_688_16 or var_688_16 * (var_688_21 / var_688_20)

				if var_688_22 > 0 and var_688_16 < var_688_22 then
					arg_685_1.talkMaxDuration = var_688_22

					if var_688_22 + var_688_15 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_22 + var_688_15
					end
				end

				arg_685_1.text_.text = var_688_19
				arg_685_1.typewritter.percent = 0

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041164", "story_v_out_318041.awb") ~= 0 then
					local var_688_23 = manager.audio:GetVoiceLength("story_v_out_318041", "318041164", "story_v_out_318041.awb") / 1000

					if var_688_23 + var_688_15 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_23 + var_688_15
					end

					if var_688_18.prefab_name ~= "" and arg_685_1.actors_[var_688_18.prefab_name] ~= nil then
						local var_688_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_685_1.actors_[var_688_18.prefab_name].transform, "story_v_out_318041", "318041164", "story_v_out_318041.awb")

						arg_685_1:RecordAudio("318041164", var_688_24)
						arg_685_1:RecordAudio("318041164", var_688_24)
					else
						arg_685_1:AudioAction("play", "voice", "story_v_out_318041", "318041164", "story_v_out_318041.awb")
					end

					arg_685_1:RecordHistoryTalkVoice("story_v_out_318041", "318041164", "story_v_out_318041.awb")
				end

				arg_685_1:RecordContent(arg_685_1.text_.text)
			end

			local var_688_25 = math.max(var_688_16, arg_685_1.talkMaxDuration)

			if var_688_15 <= arg_685_1.time_ and arg_685_1.time_ < var_688_15 + var_688_25 then
				arg_685_1.typewritter.percent = (arg_685_1.time_ - var_688_15) / var_688_25

				arg_685_1.typewritter:SetDirty()
			end

			if arg_685_1.time_ >= var_688_15 + var_688_25 and arg_685_1.time_ < var_688_15 + var_688_25 + arg_688_0 then
				arg_685_1.typewritter.percent = 1

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(true)
			end
		end
	end,
	Play318041165 = function(arg_689_0, arg_689_1)
		arg_689_1.time_ = 0
		arg_689_1.frameCnt_ = 0
		arg_689_1.state_ = "playing"
		arg_689_1.curTalkId_ = 318041165
		arg_689_1.duration_ = 2.633

		local var_689_0 = {
			zh = 2.233,
			ja = 2.633
		}
		local var_689_1 = manager.audio:GetLocalizationFlag()

		if var_689_0[var_689_1] ~= nil then
			arg_689_1.duration_ = var_689_0[var_689_1]
		end

		SetActive(arg_689_1.tipsGo_, false)

		function arg_689_1.onSingleLineFinish_()
			arg_689_1.onSingleLineUpdate_ = nil
			arg_689_1.onSingleLineFinish_ = nil
			arg_689_1.state_ = "waiting"
		end

		function arg_689_1.playNext_(arg_691_0)
			if arg_691_0 == 1 then
				arg_689_0:Play318041166(arg_689_1)
			end
		end

		function arg_689_1.onSingleLineUpdate_(arg_692_0)
			local var_692_0 = arg_689_1.actors_["1050ui_story"]
			local var_692_1 = 0

			if var_692_1 < arg_689_1.time_ and arg_689_1.time_ <= var_692_1 + arg_692_0 and arg_689_1.var_.characterEffect1050ui_story == nil then
				arg_689_1.var_.characterEffect1050ui_story = var_692_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_692_2 = 0.200000002980232

			if var_692_1 <= arg_689_1.time_ and arg_689_1.time_ < var_692_1 + var_692_2 then
				local var_692_3 = (arg_689_1.time_ - var_692_1) / var_692_2

				if arg_689_1.var_.characterEffect1050ui_story then
					arg_689_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_689_1.time_ >= var_692_1 + var_692_2 and arg_689_1.time_ < var_692_1 + var_692_2 + arg_692_0 and arg_689_1.var_.characterEffect1050ui_story then
				arg_689_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_692_4 = arg_689_1.actors_["10066ui_story"]
			local var_692_5 = 0

			if var_692_5 < arg_689_1.time_ and arg_689_1.time_ <= var_692_5 + arg_692_0 and arg_689_1.var_.characterEffect10066ui_story == nil then
				arg_689_1.var_.characterEffect10066ui_story = var_692_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_692_6 = 0.200000002980232

			if var_692_5 <= arg_689_1.time_ and arg_689_1.time_ < var_692_5 + var_692_6 then
				local var_692_7 = (arg_689_1.time_ - var_692_5) / var_692_6

				if arg_689_1.var_.characterEffect10066ui_story then
					local var_692_8 = Mathf.Lerp(0, 0.5, var_692_7)

					arg_689_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_689_1.var_.characterEffect10066ui_story.fillRatio = var_692_8
				end
			end

			if arg_689_1.time_ >= var_692_5 + var_692_6 and arg_689_1.time_ < var_692_5 + var_692_6 + arg_692_0 and arg_689_1.var_.characterEffect10066ui_story then
				local var_692_9 = 0.5

				arg_689_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_689_1.var_.characterEffect10066ui_story.fillRatio = var_692_9
			end

			local var_692_10 = arg_689_1.actors_["1050ui_story"].transform
			local var_692_11 = 0

			if var_692_11 < arg_689_1.time_ and arg_689_1.time_ <= var_692_11 + arg_692_0 then
				arg_689_1.var_.moveOldPos1050ui_story = var_692_10.localPosition
			end

			local var_692_12 = 0.001

			if var_692_11 <= arg_689_1.time_ and arg_689_1.time_ < var_692_11 + var_692_12 then
				local var_692_13 = (arg_689_1.time_ - var_692_11) / var_692_12
				local var_692_14 = Vector3.New(0.7, -1, -6.1)

				var_692_10.localPosition = Vector3.Lerp(arg_689_1.var_.moveOldPos1050ui_story, var_692_14, var_692_13)

				local var_692_15 = manager.ui.mainCamera.transform.position - var_692_10.position

				var_692_10.forward = Vector3.New(var_692_15.x, var_692_15.y, var_692_15.z)

				local var_692_16 = var_692_10.localEulerAngles

				var_692_16.z = 0
				var_692_16.x = 0
				var_692_10.localEulerAngles = var_692_16
			end

			if arg_689_1.time_ >= var_692_11 + var_692_12 and arg_689_1.time_ < var_692_11 + var_692_12 + arg_692_0 then
				var_692_10.localPosition = Vector3.New(0.7, -1, -6.1)

				local var_692_17 = manager.ui.mainCamera.transform.position - var_692_10.position

				var_692_10.forward = Vector3.New(var_692_17.x, var_692_17.y, var_692_17.z)

				local var_692_18 = var_692_10.localEulerAngles

				var_692_18.z = 0
				var_692_18.x = 0
				var_692_10.localEulerAngles = var_692_18
			end

			local var_692_19 = 0

			if var_692_19 < arg_689_1.time_ and arg_689_1.time_ <= var_692_19 + arg_692_0 then
				arg_689_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action1_1")
			end

			local var_692_20 = 0
			local var_692_21 = 0.25

			if var_692_20 < arg_689_1.time_ and arg_689_1.time_ <= var_692_20 + arg_692_0 then
				arg_689_1.talkMaxDuration = 0
				arg_689_1.dialogCg_.alpha = 1

				arg_689_1.dialog_:SetActive(true)
				SetActive(arg_689_1.leftNameGo_, true)

				local var_692_22 = arg_689_1:FormatText(StoryNameCfg[74].name)

				arg_689_1.leftNameTxt_.text = var_692_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_689_1.leftNameTxt_.transform)

				arg_689_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_689_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_689_1:RecordName(arg_689_1.leftNameTxt_.text)
				SetActive(arg_689_1.iconTrs_.gameObject, false)
				arg_689_1.callingController_:SetSelectedState("normal")

				local var_692_23 = arg_689_1:GetWordFromCfg(318041165)
				local var_692_24 = arg_689_1:FormatText(var_692_23.content)

				arg_689_1.text_.text = var_692_24

				LuaForUtil.ClearLinePrefixSymbol(arg_689_1.text_)

				local var_692_25 = 10
				local var_692_26 = utf8.len(var_692_24)
				local var_692_27 = var_692_25 <= 0 and var_692_21 or var_692_21 * (var_692_26 / var_692_25)

				if var_692_27 > 0 and var_692_21 < var_692_27 then
					arg_689_1.talkMaxDuration = var_692_27

					if var_692_27 + var_692_20 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_27 + var_692_20
					end
				end

				arg_689_1.text_.text = var_692_24
				arg_689_1.typewritter.percent = 0

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041165", "story_v_out_318041.awb") ~= 0 then
					local var_692_28 = manager.audio:GetVoiceLength("story_v_out_318041", "318041165", "story_v_out_318041.awb") / 1000

					if var_692_28 + var_692_20 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_28 + var_692_20
					end

					if var_692_23.prefab_name ~= "" and arg_689_1.actors_[var_692_23.prefab_name] ~= nil then
						local var_692_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_689_1.actors_[var_692_23.prefab_name].transform, "story_v_out_318041", "318041165", "story_v_out_318041.awb")

						arg_689_1:RecordAudio("318041165", var_692_29)
						arg_689_1:RecordAudio("318041165", var_692_29)
					else
						arg_689_1:AudioAction("play", "voice", "story_v_out_318041", "318041165", "story_v_out_318041.awb")
					end

					arg_689_1:RecordHistoryTalkVoice("story_v_out_318041", "318041165", "story_v_out_318041.awb")
				end

				arg_689_1:RecordContent(arg_689_1.text_.text)
			end

			local var_692_30 = math.max(var_692_21, arg_689_1.talkMaxDuration)

			if var_692_20 <= arg_689_1.time_ and arg_689_1.time_ < var_692_20 + var_692_30 then
				arg_689_1.typewritter.percent = (arg_689_1.time_ - var_692_20) / var_692_30

				arg_689_1.typewritter:SetDirty()
			end

			if arg_689_1.time_ >= var_692_20 + var_692_30 and arg_689_1.time_ < var_692_20 + var_692_30 + arg_692_0 then
				arg_689_1.typewritter.percent = 1

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(true)
			end
		end
	end,
	Play318041166 = function(arg_693_0, arg_693_1)
		arg_693_1.time_ = 0
		arg_693_1.frameCnt_ = 0
		arg_693_1.state_ = "playing"
		arg_693_1.curTalkId_ = 318041166
		arg_693_1.duration_ = 5

		SetActive(arg_693_1.tipsGo_, false)

		function arg_693_1.onSingleLineFinish_()
			arg_693_1.onSingleLineUpdate_ = nil
			arg_693_1.onSingleLineFinish_ = nil
			arg_693_1.state_ = "waiting"
		end

		function arg_693_1.playNext_(arg_695_0)
			if arg_695_0 == 1 then
				arg_693_0:Play318041167(arg_693_1)
			end
		end

		function arg_693_1.onSingleLineUpdate_(arg_696_0)
			local var_696_0 = arg_693_1.actors_["1050ui_story"]
			local var_696_1 = 0

			if var_696_1 < arg_693_1.time_ and arg_693_1.time_ <= var_696_1 + arg_696_0 and arg_693_1.var_.characterEffect1050ui_story == nil then
				arg_693_1.var_.characterEffect1050ui_story = var_696_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_696_2 = 0.200000002980232

			if var_696_1 <= arg_693_1.time_ and arg_693_1.time_ < var_696_1 + var_696_2 then
				local var_696_3 = (arg_693_1.time_ - var_696_1) / var_696_2

				if arg_693_1.var_.characterEffect1050ui_story then
					local var_696_4 = Mathf.Lerp(0, 0.5, var_696_3)

					arg_693_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_693_1.var_.characterEffect1050ui_story.fillRatio = var_696_4
				end
			end

			if arg_693_1.time_ >= var_696_1 + var_696_2 and arg_693_1.time_ < var_696_1 + var_696_2 + arg_696_0 and arg_693_1.var_.characterEffect1050ui_story then
				local var_696_5 = 0.5

				arg_693_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_693_1.var_.characterEffect1050ui_story.fillRatio = var_696_5
			end

			local var_696_6 = arg_693_1.actors_["1050ui_story"].transform
			local var_696_7 = 0

			if var_696_7 < arg_693_1.time_ and arg_693_1.time_ <= var_696_7 + arg_696_0 then
				arg_693_1.var_.moveOldPos1050ui_story = var_696_6.localPosition
			end

			local var_696_8 = 0.001

			if var_696_7 <= arg_693_1.time_ and arg_693_1.time_ < var_696_7 + var_696_8 then
				local var_696_9 = (arg_693_1.time_ - var_696_7) / var_696_8
				local var_696_10 = Vector3.New(0, 100, 0)

				var_696_6.localPosition = Vector3.Lerp(arg_693_1.var_.moveOldPos1050ui_story, var_696_10, var_696_9)

				local var_696_11 = manager.ui.mainCamera.transform.position - var_696_6.position

				var_696_6.forward = Vector3.New(var_696_11.x, var_696_11.y, var_696_11.z)

				local var_696_12 = var_696_6.localEulerAngles

				var_696_12.z = 0
				var_696_12.x = 0
				var_696_6.localEulerAngles = var_696_12
			end

			if arg_693_1.time_ >= var_696_7 + var_696_8 and arg_693_1.time_ < var_696_7 + var_696_8 + arg_696_0 then
				var_696_6.localPosition = Vector3.New(0, 100, 0)

				local var_696_13 = manager.ui.mainCamera.transform.position - var_696_6.position

				var_696_6.forward = Vector3.New(var_696_13.x, var_696_13.y, var_696_13.z)

				local var_696_14 = var_696_6.localEulerAngles

				var_696_14.z = 0
				var_696_14.x = 0
				var_696_6.localEulerAngles = var_696_14
			end

			local var_696_15 = arg_693_1.actors_["10066ui_story"].transform
			local var_696_16 = 0

			if var_696_16 < arg_693_1.time_ and arg_693_1.time_ <= var_696_16 + arg_696_0 then
				arg_693_1.var_.moveOldPos10066ui_story = var_696_15.localPosition
			end

			local var_696_17 = 0.001

			if var_696_16 <= arg_693_1.time_ and arg_693_1.time_ < var_696_16 + var_696_17 then
				local var_696_18 = (arg_693_1.time_ - var_696_16) / var_696_17
				local var_696_19 = Vector3.New(0, 100, 0)

				var_696_15.localPosition = Vector3.Lerp(arg_693_1.var_.moveOldPos10066ui_story, var_696_19, var_696_18)

				local var_696_20 = manager.ui.mainCamera.transform.position - var_696_15.position

				var_696_15.forward = Vector3.New(var_696_20.x, var_696_20.y, var_696_20.z)

				local var_696_21 = var_696_15.localEulerAngles

				var_696_21.z = 0
				var_696_21.x = 0
				var_696_15.localEulerAngles = var_696_21
			end

			if arg_693_1.time_ >= var_696_16 + var_696_17 and arg_693_1.time_ < var_696_16 + var_696_17 + arg_696_0 then
				var_696_15.localPosition = Vector3.New(0, 100, 0)

				local var_696_22 = manager.ui.mainCamera.transform.position - var_696_15.position

				var_696_15.forward = Vector3.New(var_696_22.x, var_696_22.y, var_696_22.z)

				local var_696_23 = var_696_15.localEulerAngles

				var_696_23.z = 0
				var_696_23.x = 0
				var_696_15.localEulerAngles = var_696_23
			end

			local var_696_24 = 0
			local var_696_25 = 0.775

			if var_696_24 < arg_693_1.time_ and arg_693_1.time_ <= var_696_24 + arg_696_0 then
				arg_693_1.talkMaxDuration = 0
				arg_693_1.dialogCg_.alpha = 1

				arg_693_1.dialog_:SetActive(true)
				SetActive(arg_693_1.leftNameGo_, false)

				arg_693_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_693_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_693_1:RecordName(arg_693_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_693_1.iconTrs_.gameObject, false)
				arg_693_1.callingController_:SetSelectedState("normal")

				local var_696_26 = arg_693_1:GetWordFromCfg(318041166)
				local var_696_27 = arg_693_1:FormatText(var_696_26.content)

				arg_693_1.text_.text = var_696_27

				LuaForUtil.ClearLinePrefixSymbol(arg_693_1.text_)

				local var_696_28 = 31
				local var_696_29 = utf8.len(var_696_27)
				local var_696_30 = var_696_28 <= 0 and var_696_25 or var_696_25 * (var_696_29 / var_696_28)

				if var_696_30 > 0 and var_696_25 < var_696_30 then
					arg_693_1.talkMaxDuration = var_696_30

					if var_696_30 + var_696_24 > arg_693_1.duration_ then
						arg_693_1.duration_ = var_696_30 + var_696_24
					end
				end

				arg_693_1.text_.text = var_696_27
				arg_693_1.typewritter.percent = 0

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(false)
				arg_693_1:RecordContent(arg_693_1.text_.text)
			end

			local var_696_31 = math.max(var_696_25, arg_693_1.talkMaxDuration)

			if var_696_24 <= arg_693_1.time_ and arg_693_1.time_ < var_696_24 + var_696_31 then
				arg_693_1.typewritter.percent = (arg_693_1.time_ - var_696_24) / var_696_31

				arg_693_1.typewritter:SetDirty()
			end

			if arg_693_1.time_ >= var_696_24 + var_696_31 and arg_693_1.time_ < var_696_24 + var_696_31 + arg_696_0 then
				arg_693_1.typewritter.percent = 1

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(true)
			end
		end
	end,
	Play318041167 = function(arg_697_0, arg_697_1)
		arg_697_1.time_ = 0
		arg_697_1.frameCnt_ = 0
		arg_697_1.state_ = "playing"
		arg_697_1.curTalkId_ = 318041167
		arg_697_1.duration_ = 10.566

		local var_697_0 = {
			zh = 8.333,
			ja = 10.566
		}
		local var_697_1 = manager.audio:GetLocalizationFlag()

		if var_697_0[var_697_1] ~= nil then
			arg_697_1.duration_ = var_697_0[var_697_1]
		end

		SetActive(arg_697_1.tipsGo_, false)

		function arg_697_1.onSingleLineFinish_()
			arg_697_1.onSingleLineUpdate_ = nil
			arg_697_1.onSingleLineFinish_ = nil
			arg_697_1.state_ = "waiting"
		end

		function arg_697_1.playNext_(arg_699_0)
			if arg_699_0 == 1 then
				arg_697_0:Play318041168(arg_697_1)
			end
		end

		function arg_697_1.onSingleLineUpdate_(arg_700_0)
			local var_700_0 = "LX0101"

			if arg_697_1.bgs_[var_700_0] == nil then
				local var_700_1 = Object.Instantiate(arg_697_1.paintGo_)

				var_700_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_700_0)
				var_700_1.name = var_700_0
				var_700_1.transform.parent = arg_697_1.stage_.transform
				var_700_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_697_1.bgs_[var_700_0] = var_700_1
			end

			local var_700_2 = 2

			if var_700_2 < arg_697_1.time_ and arg_697_1.time_ <= var_700_2 + arg_700_0 then
				local var_700_3 = manager.ui.mainCamera.transform.localPosition
				local var_700_4 = Vector3.New(0, 0, 10) + Vector3.New(var_700_3.x, var_700_3.y, 0)
				local var_700_5 = arg_697_1.bgs_.LX0101

				var_700_5.transform.localPosition = var_700_4
				var_700_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_700_6 = var_700_5:GetComponent("SpriteRenderer")

				if var_700_6 and var_700_6.sprite then
					local var_700_7 = (var_700_5.transform.localPosition - var_700_3).z
					local var_700_8 = manager.ui.mainCameraCom_
					local var_700_9 = 2 * var_700_7 * Mathf.Tan(var_700_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_700_10 = var_700_9 * var_700_8.aspect
					local var_700_11 = var_700_6.sprite.bounds.size.x
					local var_700_12 = var_700_6.sprite.bounds.size.y
					local var_700_13 = var_700_10 / var_700_11
					local var_700_14 = var_700_9 / var_700_12
					local var_700_15 = var_700_14 < var_700_13 and var_700_13 or var_700_14

					var_700_5.transform.localScale = Vector3.New(var_700_15, var_700_15, 0)
				end

				for iter_700_0, iter_700_1 in pairs(arg_697_1.bgs_) do
					if iter_700_0 ~= "LX0101" then
						iter_700_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_700_16 = 2

			if var_700_16 < arg_697_1.time_ and arg_697_1.time_ <= var_700_16 + arg_700_0 then
				arg_697_1.mask_.enabled = true
				arg_697_1.mask_.raycastTarget = true

				arg_697_1:SetGaussion(false)
			end

			local var_700_17 = 2

			if var_700_16 <= arg_697_1.time_ and arg_697_1.time_ < var_700_16 + var_700_17 then
				local var_700_18 = (arg_697_1.time_ - var_700_16) / var_700_17
				local var_700_19 = Color.New(0, 0, 0)

				var_700_19.a = Mathf.Lerp(1, 0, var_700_18)
				arg_697_1.mask_.color = var_700_19
			end

			if arg_697_1.time_ >= var_700_16 + var_700_17 and arg_697_1.time_ < var_700_16 + var_700_17 + arg_700_0 then
				local var_700_20 = Color.New(0, 0, 0)
				local var_700_21 = 0

				arg_697_1.mask_.enabled = false
				var_700_20.a = var_700_21
				arg_697_1.mask_.color = var_700_20
			end

			local var_700_22 = 0

			if var_700_22 < arg_697_1.time_ and arg_697_1.time_ <= var_700_22 + arg_700_0 then
				arg_697_1.mask_.enabled = true
				arg_697_1.mask_.raycastTarget = true

				arg_697_1:SetGaussion(false)
			end

			local var_700_23 = 2

			if var_700_22 <= arg_697_1.time_ and arg_697_1.time_ < var_700_22 + var_700_23 then
				local var_700_24 = (arg_697_1.time_ - var_700_22) / var_700_23
				local var_700_25 = Color.New(0, 0, 0)

				var_700_25.a = Mathf.Lerp(0, 1, var_700_24)
				arg_697_1.mask_.color = var_700_25
			end

			if arg_697_1.time_ >= var_700_22 + var_700_23 and arg_697_1.time_ < var_700_22 + var_700_23 + arg_700_0 then
				local var_700_26 = Color.New(0, 0, 0)

				var_700_26.a = 1
				arg_697_1.mask_.color = var_700_26
			end

			if arg_697_1.frameCnt_ <= 1 then
				arg_697_1.dialog_:SetActive(false)
			end

			local var_700_27 = 4
			local var_700_28 = 0.325

			if var_700_27 < arg_697_1.time_ and arg_697_1.time_ <= var_700_27 + arg_700_0 then
				arg_697_1.talkMaxDuration = 0

				arg_697_1.dialog_:SetActive(true)

				local var_700_29 = LeanTween.value(arg_697_1.dialog_, 0, 1, 0.3)

				var_700_29:setOnUpdate(LuaHelper.FloatAction(function(arg_701_0)
					arg_697_1.dialogCg_.alpha = arg_701_0
				end))
				var_700_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_697_1.dialog_)
					var_700_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_697_1.duration_ = arg_697_1.duration_ + 0.3

				SetActive(arg_697_1.leftNameGo_, true)

				local var_700_30 = arg_697_1:FormatText(StoryNameCfg[640].name)

				arg_697_1.leftNameTxt_.text = var_700_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_697_1.leftNameTxt_.transform)

				arg_697_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_697_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_697_1:RecordName(arg_697_1.leftNameTxt_.text)
				SetActive(arg_697_1.iconTrs_.gameObject, true)
				arg_697_1.iconController_:SetSelectedState("hero")

				arg_697_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10066")

				arg_697_1.callingController_:SetSelectedState("normal")

				local var_700_31 = arg_697_1:GetWordFromCfg(318041167)
				local var_700_32 = arg_697_1:FormatText(var_700_31.content)

				arg_697_1.text_.text = var_700_32

				LuaForUtil.ClearLinePrefixSymbol(arg_697_1.text_)

				local var_700_33 = 13
				local var_700_34 = utf8.len(var_700_32)
				local var_700_35 = var_700_33 <= 0 and var_700_28 or var_700_28 * (var_700_34 / var_700_33)

				if var_700_35 > 0 and var_700_28 < var_700_35 then
					arg_697_1.talkMaxDuration = var_700_35
					var_700_27 = var_700_27 + 0.3

					if var_700_35 + var_700_27 > arg_697_1.duration_ then
						arg_697_1.duration_ = var_700_35 + var_700_27
					end
				end

				arg_697_1.text_.text = var_700_32
				arg_697_1.typewritter.percent = 0

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041167", "story_v_out_318041.awb") ~= 0 then
					local var_700_36 = manager.audio:GetVoiceLength("story_v_out_318041", "318041167", "story_v_out_318041.awb") / 1000

					if var_700_36 + var_700_27 > arg_697_1.duration_ then
						arg_697_1.duration_ = var_700_36 + var_700_27
					end

					if var_700_31.prefab_name ~= "" and arg_697_1.actors_[var_700_31.prefab_name] ~= nil then
						local var_700_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_697_1.actors_[var_700_31.prefab_name].transform, "story_v_out_318041", "318041167", "story_v_out_318041.awb")

						arg_697_1:RecordAudio("318041167", var_700_37)
						arg_697_1:RecordAudio("318041167", var_700_37)
					else
						arg_697_1:AudioAction("play", "voice", "story_v_out_318041", "318041167", "story_v_out_318041.awb")
					end

					arg_697_1:RecordHistoryTalkVoice("story_v_out_318041", "318041167", "story_v_out_318041.awb")
				end

				arg_697_1:RecordContent(arg_697_1.text_.text)
			end

			local var_700_38 = var_700_27 + 0.3
			local var_700_39 = math.max(var_700_28, arg_697_1.talkMaxDuration)

			if var_700_38 <= arg_697_1.time_ and arg_697_1.time_ < var_700_38 + var_700_39 then
				arg_697_1.typewritter.percent = (arg_697_1.time_ - var_700_38) / var_700_39

				arg_697_1.typewritter:SetDirty()
			end

			if arg_697_1.time_ >= var_700_38 + var_700_39 and arg_697_1.time_ < var_700_38 + var_700_39 + arg_700_0 then
				arg_697_1.typewritter.percent = 1

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(true)
			end
		end
	end,
	Play318041168 = function(arg_703_0, arg_703_1)
		arg_703_1.time_ = 0
		arg_703_1.frameCnt_ = 0
		arg_703_1.state_ = "playing"
		arg_703_1.curTalkId_ = 318041168
		arg_703_1.duration_ = 5.1

		local var_703_0 = {
			zh = 3.3,
			ja = 5.1
		}
		local var_703_1 = manager.audio:GetLocalizationFlag()

		if var_703_0[var_703_1] ~= nil then
			arg_703_1.duration_ = var_703_0[var_703_1]
		end

		SetActive(arg_703_1.tipsGo_, false)

		function arg_703_1.onSingleLineFinish_()
			arg_703_1.onSingleLineUpdate_ = nil
			arg_703_1.onSingleLineFinish_ = nil
			arg_703_1.state_ = "waiting"
			arg_703_1.auto_ = false
		end

		function arg_703_1.playNext_(arg_705_0)
			arg_703_1.onStoryFinished_()
		end

		function arg_703_1.onSingleLineUpdate_(arg_706_0)
			local var_706_0 = 0
			local var_706_1 = 0.275

			if var_706_0 < arg_703_1.time_ and arg_703_1.time_ <= var_706_0 + arg_706_0 then
				arg_703_1.talkMaxDuration = 0
				arg_703_1.dialogCg_.alpha = 1

				arg_703_1.dialog_:SetActive(true)
				SetActive(arg_703_1.leftNameGo_, true)

				local var_706_2 = arg_703_1:FormatText(StoryNameCfg[74].name)

				arg_703_1.leftNameTxt_.text = var_706_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_703_1.leftNameTxt_.transform)

				arg_703_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_703_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_703_1:RecordName(arg_703_1.leftNameTxt_.text)
				SetActive(arg_703_1.iconTrs_.gameObject, true)
				arg_703_1.iconController_:SetSelectedState("hero")

				arg_703_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_703_1.callingController_:SetSelectedState("normal")

				local var_706_3 = arg_703_1:GetWordFromCfg(318041168)
				local var_706_4 = arg_703_1:FormatText(var_706_3.content)

				arg_703_1.text_.text = var_706_4

				LuaForUtil.ClearLinePrefixSymbol(arg_703_1.text_)

				local var_706_5 = 11
				local var_706_6 = utf8.len(var_706_4)
				local var_706_7 = var_706_5 <= 0 and var_706_1 or var_706_1 * (var_706_6 / var_706_5)

				if var_706_7 > 0 and var_706_1 < var_706_7 then
					arg_703_1.talkMaxDuration = var_706_7

					if var_706_7 + var_706_0 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_7 + var_706_0
					end
				end

				arg_703_1.text_.text = var_706_4
				arg_703_1.typewritter.percent = 0

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318041", "318041168", "story_v_out_318041.awb") ~= 0 then
					local var_706_8 = manager.audio:GetVoiceLength("story_v_out_318041", "318041168", "story_v_out_318041.awb") / 1000

					if var_706_8 + var_706_0 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_8 + var_706_0
					end

					if var_706_3.prefab_name ~= "" and arg_703_1.actors_[var_706_3.prefab_name] ~= nil then
						local var_706_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_703_1.actors_[var_706_3.prefab_name].transform, "story_v_out_318041", "318041168", "story_v_out_318041.awb")

						arg_703_1:RecordAudio("318041168", var_706_9)
						arg_703_1:RecordAudio("318041168", var_706_9)
					else
						arg_703_1:AudioAction("play", "voice", "story_v_out_318041", "318041168", "story_v_out_318041.awb")
					end

					arg_703_1:RecordHistoryTalkVoice("story_v_out_318041", "318041168", "story_v_out_318041.awb")
				end

				arg_703_1:RecordContent(arg_703_1.text_.text)
			end

			local var_706_10 = math.max(var_706_1, arg_703_1.talkMaxDuration)

			if var_706_0 <= arg_703_1.time_ and arg_703_1.time_ < var_706_0 + var_706_10 then
				arg_703_1.typewritter.percent = (arg_703_1.time_ - var_706_0) / var_706_10

				arg_703_1.typewritter:SetDirty()
			end

			if arg_703_1.time_ >= var_706_0 + var_706_10 and arg_703_1.time_ < var_706_0 + var_706_10 + arg_706_0 then
				arg_703_1.typewritter.percent = 1

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST69",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST16",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/LX0102",
		"Assets/UIResources/UI_AB/TextureConfig/Background/LX0102_blur",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K13f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/LX0101"
	},
	voices = {
		"story_v_out_318041.awb"
	}
}
